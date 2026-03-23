import { Router } from "express";
import {
  getPatrimonioInmaterial,
  getPatrimonioByMunicipio,
  getPatrimonioMaterialByMunicipio,
  getRntByMunicipio,
} from "../../controllers/patrimonioController/patrimonioController";

const router = Router();

router.get("/inmaterial", getPatrimonioInmaterial);
router.get("/inmaterial/:municipio", getPatrimonioByMunicipio);
router.get("/material/:municipio", getPatrimonioMaterialByMunicipio);
router.get("/rnt/:municipio", getRntByMunicipio);

export default router;
