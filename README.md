# Celestial Bodies Database

Esta base de datos forma parte del primer proyecto requerido para la certificación del curso **[Relational Databases Certification](https://www.freecodecamp.org/learn/relational-databases-v9/)** de [FreeCodeCamp](https://www.freecodecamp.org/).

El objetivo es modelar un sistema relacional que represente cuerpos celestes reales, como galaxias, planetas del sistema solar, exoplanetas, lunas, estrellas y constelaciones, con base en datos reales.

## 📊 Contenido

La base de datos `universe` incluye tablas como:
- `galaxy`: galaxias (incluyendo la Vía Láctea).
- `star`: información sobre estrellas (incluyendo el Sol y estrellas anfitrionas de exoplanetas).
- `planet`: planetas del sistema solar y exoplanetas.
- `moon`: satélites naturales.
- `constellation`: agrupación de estrellas desde la perspectiva de la Tierra.
- `star_constellation`: tabla intermedia para manejar la relación muchos-a-muchos entre estrellas y constelaciones.
- Diseñadas para cumplir con las 24 historias de usuario del proyecto.

## 🌐 Fuentes de datos

Para hacer la base de datos lo más realista posible, se consultaron fuentes como:

- [NASA Solar System Exploration](https://science.nasa.gov/solar-system/)
- [NASA Exoplanet Archive](https://exoplanetarchive.ipac.caltech.edu/)
- [Open Exoplanet Catalogue (GitHub)](https://github.com/OpenExoplanetCatalogue/oec_tables/tree/master)
- [Planets in Binary Systems (exoplanet.eu)](https://exoplanet.eu/planets_binary/)

> ⚠️ **Nota sobre licencias**: Algunos datos provienen de fuentes con licencias abiertas (como el Open Exoplanet Catalogue).

## 📄 Licencia

Este proyecto está disponible bajo la licencia [MIT](LICENSE), salvo cuando se indique lo contrario por las fuentes de datos externas.
