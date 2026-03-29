import { Router } from "express";
import { getAttractions, getAttractionsByMunicipality } from "../../controllers/attractionController/attractionController";

const router = Router();

router.get("/", getAttractions);
router.get("/municipality/:municipalityId", getAttractionsByMunicipality);

export default router;
