"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.transformToGeoJSON = void 0;
// Función para transformar la geometría PostGIS a GeoJSON
const transformToGeoJSON = (row) => {
    if (row.territory_geom) {
        try {
            // Si ya es un string JSON, parsearlo
            if (typeof row.territory_geom === "string") {
                row.territory_geom = JSON.parse(row.territory_geom);
            }
            // Asegurarnos de que tenga el formato correcto
            if (!row.territory_geom.type || !row.territory_geom.coordinates) {
                console.error("Formato de geometría inválido:", row.territory_geom);
                return null;
            }
            return Object.assign(Object.assign({}, row), { territory_geom: {
                    type: row.territory_geom.type,
                    coordinates: row.territory_geom.coordinates,
                } });
        }
        catch (error) {
            console.error("Error al transformar geometría:", error);
            return null;
        }
    }
    return row;
};
exports.transformToGeoJSON = transformToGeoJSON;
