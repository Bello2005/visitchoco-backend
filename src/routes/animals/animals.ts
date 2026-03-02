import { Router } from "express";
import { getAnimals, getAnimalsByMunicipality } from "../../controllers/animalController/animalController";

const router = Router();

router.get("/", getAnimals);
router.get("/municipality/:municipalityId", getAnimalsByMunicipality);

export default router;
