import { Router } from "express";
import { getRntByMunicipio, getRntSummary } from "../../controllers/rntController/rntController";

const router = Router();
router.get("/", getRntSummary);
router.get("/:municipio", getRntByMunicipio);
export default router;
