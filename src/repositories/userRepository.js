"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
var __importDefault = (this && this.__importDefault) || function (mod) {
    return (mod && mod.__esModule) ? mod : { "default": mod };
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.userRepository = void 0;
const db_1 = __importDefault(require("../config/db"));
exports.userRepository = {
    findByEmail: (email) => __awaiter(void 0, void 0, void 0, function* () {
        var _a;
        const result = yield db_1.default.query("SELECT * FROM users JOIN roles ON users.role_id = roles.id WHERE email = $1", [email]);
        return (_a = result.rows[0]) !== null && _a !== void 0 ? _a : null;
    }),
    findAll: () => __awaiter(void 0, void 0, void 0, function* () {
        const result = yield db_1.default.query("SELECT id, name, email, role, created_at FROM users ORDER BY id ASC");
        return result.rows;
    }),
    create: (name_1, email_1, passwordHash_1, ...args_1) => __awaiter(void 0, [name_1, email_1, passwordHash_1, ...args_1], void 0, function* (name, email, passwordHash, roleId = 2) {
        const result = yield db_1.default.query("INSERT INTO users (name, email, password_hash, role_id) VALUES ($1, $2, $3, $4) RETURNING id, name, email", [name, email, passwordHash, roleId]);
        return result.rows[0];
    }),
};
