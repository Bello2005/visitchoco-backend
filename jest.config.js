"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const config = {
    preset: "ts-jest",
    testEnvironment: "node",
    testMatch: ["**/*.test.ts"],
    moduleNameMapper: {
    // Map internal paths if needed
    },
};
exports.default = config;
