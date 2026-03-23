import { Router } from "express";
import { getFiestasPatronales, getFiestasProximas, getFiestasByMunicipio } from "../../controllers/fiestasController/fiestasController";

const router = Router();

router.get("/", getFiestasPatronales);
router.get("/proximas", getFiestasProximas);
router.get("/municipio/:nombre", getFiestasByMunicipio);

export default router;
