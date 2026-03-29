import { Router } from "express";
import { getFestivals, getFestivalsByMunicipality } from "../../controllers/festivalController/festivalController";

const router = Router();

router.get("/", getFestivals);
router.get("/municipality/:municipalityId", getFestivalsByMunicipality);

export default router;
