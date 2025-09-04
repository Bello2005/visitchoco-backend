import { Router } from "express";
import {
  getEthnicDistribution,
  getEthnicDistributionByMunicipality,
  getLatestEthnicSummary,
  getTotalEthnicSummary,
  getEthnicDistributionByYear,
  getEthnicStats,
} from "../../controllers/ethnicDistributionController/ethnicDistributionController";

const router = Router();

// Rutas para la distribución étnica
router.get("/", getEthnicDistribution);
router.get("/latest", getLatestEthnicSummary);
router.get("/summary/total", getTotalEthnicSummary);
router.get("/summary/by-year", getEthnicDistributionByYear);
router.get("/stats", getEthnicStats);
router.get("/:codDane", getEthnicDistributionByMunicipality);

export default router;
