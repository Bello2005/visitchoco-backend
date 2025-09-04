import { Router } from "express";
import {
  getIndigenousReserves,
  getIndigenousReserveById,
  getIndigenousReservesByMunicipality,
} from "../../controllers/indigenousController/indigenousController";

const router = Router();

// Rutas para las reservas indígenas
router.get("/", getIndigenousReserves);
router.get("/municipality/:codDane", getIndigenousReservesByMunicipality);
router.get("/:id", getIndigenousReserveById);

export default router;
