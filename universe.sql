--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    abbreviation character varying(3) NOT NULL,
    visible_hemisphere character varying(20) NOT NULL,
    area_square_degrees integer NOT NULL,
    main_stars_count integer NOT NULL,
    is_zodiac boolean DEFAULT false
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_type character varying(50) NOT NULL,
    distance_million_ly numeric(10,2) NOT NULL,
    mass_billion_solar_masses integer NOT NULL,
    age_billion_years numeric(4,2),
    has_active_star_formation boolean DEFAULT true,
    description text
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    radius_km numeric(8,2) NOT NULL,
    mass_exponent integer NOT NULL,
    orbital_distance_1000km integer NOT NULL,
    orbital_period_days numeric(10,4),
    has_atmosphere boolean DEFAULT false
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    is_exoplanet boolean NOT NULL,
    planet_category character varying(50) NOT NULL,
    mass_earth_masses numeric(10,4),
    radius_earth_radii numeric(8,4),
    distance_from_star_au numeric(10,6),
    number_of_moons integer DEFAULT 0,
    in_habitable_zone boolean DEFAULT false,
    has_atmosphere boolean DEFAULT false
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    size_classification character varying(50) NOT NULL,
    surface_temperature_kelvin integer NOT NULL,
    mass_solar_masses numeric(6,2) NOT NULL,
    age_billion_years numeric(5,2),
    has_planets boolean DEFAULT false,
    is_binary_system boolean DEFAULT false
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star_constellation (
    star_constellation_id integer NOT NULL,
    star_id integer NOT NULL,
    constellation_id integer NOT NULL,
    name character varying(50),
    apparent_magnitude numeric(4,2),
    is_brightest_star boolean DEFAULT false
);


ALTER TABLE public.star_constellation OWNER TO freecodecamp;

--
-- Name: star_constellation_star_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_constellation_star_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_constellation_star_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: star_constellation_star_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_constellation_star_constellation_id_seq OWNED BY public.star_constellation.star_constellation_id;


--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star_constellation star_constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_constellation ALTER COLUMN star_constellation_id SET DEFAULT nextval('public.star_constellation_star_constellation_id_seq'::regclass);


--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Orion', 'Ori', 'Equatorial', 594, 7, false);
INSERT INTO public.constellation VALUES (2, 'Canis Major', 'CMa', 'Southern', 380, 8, false);
INSERT INTO public.constellation VALUES (3, 'Lyra', 'Lyr', 'Northern', 286, 5, false);
INSERT INTO public.constellation VALUES (4, 'Ursa Minor', 'UMi', 'Northern', 256, 7, false);
INSERT INTO public.constellation VALUES (5, 'Scorpius', 'Sco', 'Southern', 497, 18, true);
INSERT INTO public.constellation VALUES (6, 'Taurus', 'Tau', 'Northern', 797, 19, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral Barred', 0.00, 1500, 13.60, true, 'Nuestra galaxia, tipo espiral con aproximadamente 400 mil millones de estrellas. El Sistema Solar se encuentra a unos 27,000 años luz del centro galáctico.');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2.54, 1230, 10.00, true, 'La galaxia más cercana a la Vía Láctea y la más grande del Grupo Local. Se espera que colisione con la Vía Láctea en unos 4,500 millones de años.');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 2.73, 50, 12.00, true, 'También conocida como M33, es la tercera galaxia más grande del Grupo Local después de Andrómeda y la Vía Láctea.');
INSERT INTO public.galaxy VALUES (4, 'Centaurus A', 'Elliptical Peculiar', 13.70, 1000, 13.20, false, 'Es una de las galaxias elípticas más cercanas. Tiene un agujero negro supermasivo activo en su centro.');
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Irregular', 0.16, 10, 13.00, true, 'Galaxia irregular satélite de la Vía Láctea, la cual es visible desde el hemisferio sur.');
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', 0.20, 7, 13.00, true, 'Galaxia enana irregular que orbita la Vía Láctea junto con la Gran Nube de Magallanes.');
INSERT INTO public.galaxy VALUES (7, 'Messier 87', 'Elliptical Giant', 53.50, 2400, 13.24, false, 'Galaxia elíptica supergigante en el cúmulo de Virgo. En 2019, el Event Horizon Telescope capturó la primera imagen directa de su agujero negro supermasivo central (M87*).');
INSERT INTO public.galaxy VALUES (8, 'Sombrero Galaxy', 'Spiral/Lenticular', 29.35, 800, 13.25, false, 'También conocida como M104, es famosa por su prominente bulbo central y el anillo de polvo oscuro que la rodea, parece un sombrero mexicano visto de perfil.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3, 1737.40, 22, 384, 27.3217, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 11.27, 16, 9, 0.3189, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 6.20, 15, 23, 1.2624, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 1821.60, 22, 422, 1.7691, true);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 1560.80, 22, 671, 3.5512, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 2634.10, 23, 1070, 7.1546, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 2410.30, 23, 1883, 16.6890, true);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 83.50, 18, 181, 0.4982, false);
INSERT INTO public.moon VALUES (9, 'Titan', 6, 2574.70, 23, 1222, 15.9454, true);
INSERT INTO public.moon VALUES (10, 'Enceladus', 6, 252.10, 20, 238, 1.3702, true);
INSERT INTO public.moon VALUES (11, 'Mimas', 6, 198.20, 19, 186, 0.9424, false);
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 531.10, 21, 295, 1.8878, false);
INSERT INTO public.moon VALUES (13, 'Dione', 6, 561.40, 21, 377, 2.7369, false);
INSERT INTO public.moon VALUES (14, 'Rhea', 6, 763.80, 21, 527, 4.5175, true);
INSERT INTO public.moon VALUES (15, 'Iapetus', 6, 734.50, 21, 3561, 79.3215, false);
INSERT INTO public.moon VALUES (16, 'Titania', 7, 788.40, 21, 436, 8.7059, false);
INSERT INTO public.moon VALUES (17, 'Oberon', 7, 761.40, 21, 584, 13.4632, false);
INSERT INTO public.moon VALUES (18, 'Umbriel', 7, 584.70, 21, 266, 4.1442, false);
INSERT INTO public.moon VALUES (19, 'Ariel', 7, 578.90, 21, 191, 2.5204, false);
INSERT INTO public.moon VALUES (20, 'Miranda', 7, 235.80, 20, 130, 1.4135, false);
INSERT INTO public.moon VALUES (21, 'Triton', 8, 1353.40, 22, 355, 5.8768, true);
INSERT INTO public.moon VALUES (22, 'Proteus', 8, 210.00, 19, 118, 1.1223, false);
INSERT INTO public.moon VALUES (23, 'Nereid', 8, 170.00, 19, 5513, 360.1362, false);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, false, 'Rocky Terrestrial', 0.0553, 0.3829, 0.387000, 0, false, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, false, 'Rocky Terrestrial', 0.8150, 0.9499, 0.723000, 0, false, true);
INSERT INTO public.planet VALUES (3, 'Earth', 1, false, 'Rocky Terrestrial', 1.0000, 1.0000, 1.000000, 1, true, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, false, 'Rocky Terrestrial', 0.1074, 0.5320, 1.524000, 2, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, false, 'Gas Giant', 317.8000, 11.2090, 5.203000, 95, false, true);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, false, 'Gas Giant', 95.1600, 9.4490, 9.537000, 146, false, true);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, false, 'Ice Giant', 14.5400, 4.0070, 19.191000, 27, false, true);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, false, 'Ice Giant', 17.1500, 3.8830, 30.070000, 14, false, true);
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 4, true, 'Rocky Terrestrial', 1.2700, 1.0300, 0.048500, 0, true, false);
INSERT INTO public.planet VALUES (10, 'Proxima Centauri d', 4, true, 'Rocky Terrestrial', 0.2600, 0.8100, 0.028900, 0, false, false);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 1, true, 'Hot Jupiter', 150.0000, 1.9000, 0.052700, 0, false, true);
INSERT INTO public.planet VALUES (12, 'Kepler-452b', 1, true, 'Super-Earth', 5.0000, 1.6300, 1.046000, 0, true, false);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1e', 4, true, 'Rocky Terrestrial', 0.6920, 0.9200, 0.029300, 0, true, false);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 1, true, 'Hot Jupiter', 220.0000, 1.3800, 0.047400, 0, false, true);
INSERT INTO public.planet VALUES (15, 'Kepler-16b', 2, true, 'Gas Giant', 106.0000, 0.7538, 0.704800, 0, false, true);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'Yellow Dwarf', 5778, 1.00, 4.60, true, false);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'White Main Sequence', 9940, 2.06, 0.24, false, true);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1, 'Red Supergiant', 3590, 16.50, 0.01, false, false);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1, 'Red Dwarf', 3042, 0.12, 4.85, true, true);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue Supergiant', 11000, 21.00, 0.01, false, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'White Main Sequence', 9602, 2.14, 0.46, false, false);
INSERT INTO public.star VALUES (7, 'Antares', 1, 'Red Supergiant', 3660, 12.00, 0.01, false, true);
INSERT INTO public.star VALUES (8, 'Polaris', 1, 'Yellow Supergiant', 6015, 5.40, 0.07, false, true);
INSERT INTO public.star VALUES (9, 'Aldebaran', 1, 'Orange Giant', 3910, 1.16, 6.60, false, false);
INSERT INTO public.star VALUES (10, 'S Doradus', 5, 'Luminous Blue Variable', 9000, 24.00, 0.00, false, false);


--
-- Data for Name: star_constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star_constellation VALUES (1, 3, 1, 'Alpha Orionis', 0.50, true);
INSERT INTO public.star_constellation VALUES (2, 5, 1, 'Beta Orionis', 0.13, false);
INSERT INTO public.star_constellation VALUES (3, 2, 2, 'Alpha Canis Majoris', -1.46, true);
INSERT INTO public.star_constellation VALUES (4, 6, 3, 'Alpha Lyrae', 0.03, true);
INSERT INTO public.star_constellation VALUES (5, 8, 4, 'Alpha Ursae Minoris', 1.98, true);
INSERT INTO public.star_constellation VALUES (6, 7, 5, 'Alpha Scorpii', 1.09, true);
INSERT INTO public.star_constellation VALUES (7, 9, 6, 'Alpha Tauri', 0.85, true);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 8, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 23, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 15, true);


--
-- Name: star_constellation_star_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_constellation_star_constellation_id_seq', 7, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: constellation constellation_abbreviation_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_abbreviation_key UNIQUE (abbreviation);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star_constellation star_constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_constellation
    ADD CONSTRAINT star_constellation_pkey PRIMARY KEY (star_constellation_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star_constellation unique_star_constellation; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_constellation
    ADD CONSTRAINT unique_star_constellation UNIQUE (star_id, constellation_id);


--
-- Name: star_constellation fk_constellation_sc; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_constellation
    ADD CONSTRAINT fk_constellation_sc FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id) ON DELETE CASCADE;


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id) ON DELETE CASCADE;


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id) ON DELETE CASCADE;


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- Name: star_constellation fk_star_sc; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star_constellation
    ADD CONSTRAINT fk_star_sc FOREIGN KEY (star_id) REFERENCES public.star(star_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

