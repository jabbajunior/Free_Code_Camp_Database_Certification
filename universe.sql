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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    diameter_in_km numeric(10,2),
    distance_from_earth_thousand_light_years integer,
    estimated_star_count_millions integer,
    has_known_exoplanets boolean,
    has_known_liveable_planet boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    diameter_in_km numeric(10,2),
    has_water boolean,
    has_breathable_atmosphere boolean,
    average_temperature_celsius integer,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: observation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.observation (
    observation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    description text,
    observation_year integer,
    duration_in_hours integer,
    distance_from_planet_km numeric(12,2),
    detected_water boolean,
    detected_atmosphere boolean
);


ALTER TABLE public.observation OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.observation_observation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.observation_observation_id_seq OWNER TO freecodecamp;

--
-- Name: observation_observation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.observation_observation_id_seq OWNED BY public.observation.observation_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km numeric(10,2) NOT NULL,
    description text,
    planetary_system boolean,
    liveable boolean,
    number_of_moons integer NOT NULL,
    average_temperature_celsius integer NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_km numeric(10,2) NOT NULL,
    description text,
    has_known_planets boolean,
    age_in_million_years integer,
    is_sun_like boolean,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_id_seq OWNER TO freecodecamp;

--
-- Name: star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_id_seq'::regclass);


--
-- Name: observation observation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation ALTER COLUMN observation_id SET DEFAULT nextval('public.observation_observation_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy containing our Solar System.', NULL, 0, NULL, true, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'A large spiral galaxy and a neighbor of the Milky Way.', NULL, 2500, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool Galaxy', 'A spiral galaxy also known as Messier 51.', NULL, 31000, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A galaxy also known as Messier 104, with a prominent dust lane.', NULL, 28000, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Large Magellanic Cloud', 'A nearby dwarf galaxy rich in star-forming regions. It contains the Tarantula Nebula and the massive star R136a1.', NULL, 160, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Small Magellanic Cloud', 'An irregular dwarf galaxy approximately 200,000 light-years from Earth. It contains the N81 star-forming nebula and the HD 5980 multiple-star system.', NULL, 200, NULL, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Aurelia I', 'A rocky moon with bright polar ice.', 3200.00, true, false, -45, 1);
INSERT INTO public.moon VALUES (2, 'Brontis I', 'A volcanic moon with a dark surface.', 2400.00, false, false, 85, 2);
INSERT INTO public.moon VALUES (3, 'Brontis II', 'A cratered moon with a thin layer of dust.', 1100.00, NULL, false, -20, 2);
INSERT INTO public.moon VALUES (4, 'Brontis III', 'A small icy moon in a distant orbit.', 750.00, true, false, -120, 2);
INSERT INTO public.moon VALUES (5, 'Cyrene I', 'A moon with a frozen surface and deep fissures.', 2800.00, true, false, -65, 3);
INSERT INTO public.moon VALUES (6, 'Cyrene II', 'A small rocky moon with irregular terrain.', 950.00, NULL, false, -50, 3);
INSERT INTO public.moon VALUES (7, 'Eryon I', 'An icy moon with a smooth northern hemisphere.', 2100.00, true, false, -140, 5);
INSERT INTO public.moon VALUES (8, 'Eryon II', 'A distant moon covered in ancient impact craters.', 1300.00, NULL, false, -155, 5);
INSERT INTO public.moon VALUES (9, 'Eryon III', 'A cold moon with a possible underground ocean.', 2600.00, NULL, false, -130, 5);
INSERT INTO public.moon VALUES (10, 'Eryon IV', 'A small moon with a highly reflective surface.', 600.00, NULL, false, -165, 5);
INSERT INTO public.moon VALUES (11, 'Ferona I', 'A dusty moon with long equatorial ridges.', 1800.00, false, false, 10, 6);
INSERT INTO public.moon VALUES (12, 'Ferona II', 'An irregular moon with a reddish surface.', 850.00, NULL, false, -15, 6);
INSERT INTO public.moon VALUES (13, 'Galena I', 'A gray moon with a large impact basin.', 2900.00, NULL, false, -75, 7);
INSERT INTO public.moon VALUES (14, 'Helion I', 'An ice-rich moon with signs of geological activity.', 3400.00, true, false, -40, 8);
INSERT INTO public.moon VALUES (15, 'Helion II', 'A small moon with a dark rocky crust.', 1200.00, false, false, -55, 8);
INSERT INTO public.moon VALUES (16, 'Ilyra I', 'A frozen moon with a network of surface cracks.', 2300.00, true, false, -170, 9);
INSERT INTO public.moon VALUES (17, 'Ilyra II', 'A small icy moon orbiting close to its planet.', 700.00, true, false, -160, 9);
INSERT INTO public.moon VALUES (18, 'Ilyra III', 'A distant moon with a heavily cratered crust.', 1500.00, NULL, false, -180, 9);
INSERT INTO public.moon VALUES (19, 'Jorvik I', 'A large moon with bright ice deposits.', 3100.00, true, false, -60, 10);
INSERT INTO public.moon VALUES (20, 'Kaelis I', 'A rocky moon with a possible supply of water ice.', 2700.00, NULL, false, -48, 11);


--
-- Data for Name: observation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.observation VALUES (1, 'Aurelia Ocean Survey', 1, 'Surveyed the surface for signs of liquid water.', 2124, 48, 125000.00, true, true);
INSERT INTO public.observation VALUES (2, 'Brontis Atmosphere Scan', 2, 'Measured the composition of the dense atmosphere.', 2125, 36, 180000.00, false, true);
INSERT INTO public.observation VALUES (3, 'Cyrene Coastal Survey', 3, 'Observed the shallow seas and surrounding terrain.', 2125, 72, 95000.00, true, true);
INSERT INTO public.observation VALUES (4, 'Damaris Surface Mapping', 4, 'Mapped large canyons across the planet.', 2126, 24, 140000.00, false, true);
INSERT INTO public.observation VALUES (5, 'Eryon Polar Ice Study', 5, 'Examined the composition of the polar ice sheets.', 2126, 60, 110000.00, true, NULL);
INSERT INTO public.observation VALUES (6, 'Galena Atmospheric Survey', 7, 'Investigated the planet’s thin atmosphere.', 2127, 30, 165000.00, NULL, true);
INSERT INTO public.observation VALUES (7, 'Helion Water Search', 8, 'Searched for water in the inland seas.', 2127, 54, 88000.00, true, true);
INSERT INTO public.observation VALUES (8, 'Ilyra Ice Analysis', 9, 'Analyzed the frozen material covering the surface.', 2128, 42, 105000.00, true, NULL);
INSERT INTO public.observation VALUES (9, 'Jorvik Ocean Study', 10, 'Studied the ocean and its scattered islands.', 2128, 96, 75000.00, true, true);
INSERT INTO public.observation VALUES (10, 'Kaelis Habitability Survey', 11, 'Examined the atmosphere and surface for signs of suitable conditions.', 2129, 120, 65000.00, true, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Aurelia', 12400.00, 'Rocky world with broad oceans', true, true, 1, 16, 6);
INSERT INTO public.planet VALUES (2, 'Brontis', 18600.00, 'Volcanic planet with a dense atmosphere', true, false, 3, 115, 6);
INSERT INTO public.planet VALUES (3, 'Cyrene', 10800.00, 'Temperate world with shallow seas', true, true, 2, 12, 6);
INSERT INTO public.planet VALUES (4, 'Damaris', 8900.00, 'Dry planet with extensive canyons', true, NULL, 0, 28, 7);
INSERT INTO public.planet VALUES (5, 'Eryon', 15200.00, 'Cold world with polar ice sheets', true, NULL, 4, -35, 7);
INSERT INTO public.planet VALUES (6, 'Ferona', 21500.00, 'Planet with frequent dust storms', true, false, 2, 52, 7);
INSERT INTO public.planet VALUES (7, 'Galena', 11700.00, 'Rocky world with a thin atmosphere', true, NULL, 1, -18, 10);
INSERT INTO public.planet VALUES (8, 'Helion', 13100.00, 'Warm planet with scattered inland seas', true, true, 2, 22, 10);
INSERT INTO public.planet VALUES (9, 'Ilyra', 9600.00, 'Frozen world with a bright icy surface', true, false, 3, -90, 10);
INSERT INTO public.planet VALUES (10, 'Jorvik', 14300.00, 'Ocean-covered planet with small islands', true, NULL, 1, 19, 11);
INSERT INTO public.planet VALUES (11, 'Kaelis', 12900.00, 'Temperate world with large continents', true, true, 2, 14, 11);
INSERT INTO public.planet VALUES (12, 'Lumera', 16800.00, 'Cloud-covered planet with a thick atmosphere', true, false, 5, 78, 11);
INSERT INTO public.planet VALUES (13, 'Meridia', 7800.00, 'Small rocky planet with deep craters', true, false, 0, -45, 12);
INSERT INTO public.planet VALUES (14, 'Novera', 11200.00, 'Cold planet with a possible subsurface ocean', true, NULL, 2, -55, 12);
INSERT INTO public.planet VALUES (15, 'Orilon', 19400.00, 'Large planet with a faint ring system', true, false, 6, -70, 12);
INSERT INTO public.planet VALUES (16, 'Pelara', 12100.00, 'Rocky planet with a moderate climate', true, true, 1, 17, 9);
INSERT INTO public.planet VALUES (17, 'Quorin', 25600.00, 'Gas-rich planet with turbulent clouds', true, false, 8, -110, 9);
INSERT INTO public.planet VALUES (18, 'Rhysea', 10300.00, 'Icy planet with an uneven surface', true, NULL, 2, -65, 1);
INSERT INTO public.planet VALUES (19, 'Solara', 13800.00, 'Rocky world with signs of surface water', true, NULL, 1, 10, 1);
INSERT INTO public.planet VALUES (20, 'Tethra', 17900.00, 'Distant planet with a dense cloud layer', true, NULL, 4, -25, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Hubble V1', 5000000.00, 'Cepheid variable star', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (2, 'R136a1', 40000000.00, 'Massive star in the R136 cluster.', NULL, NULL, false, 3);
INSERT INTO public.star VALUES (3, 'HD 5980 A', 30000000.00, 'Star in the HD 5980 multiple-star system.', NULL, NULL, false, 4);
INSERT INTO public.star VALUES (4, 'SN 2005cs progenitor', 90000000.00, 'Star observed before it exploded as a supernova.', NULL, NULL, false, 5);
INSERT INTO public.star VALUES (5, 'Sombrero Survey Star 1', 1500000.00, 'Fictional survey entry for database practice.', NULL, NULL, NULL, 6);
INSERT INTO public.star VALUES (6, '51 Pegasi', 1700000.00, 'Star with a known exoplanet.', true, NULL, true, 1);
INSERT INTO public.star VALUES (7, 'Procyon A', 2800000.00, 'Bright star in the Procyon system.', NULL, NULL, NULL, 1);
INSERT INTO public.star VALUES (8, 'Aldebaran', 60000000.00, 'Orange giant star in Taurus.', NULL, NULL, false, 1);
INSERT INTO public.star VALUES (9, 'Spica A', 10000000.00, 'Star in the Spica binary system.', NULL, NULL, false, 1);
INSERT INTO public.star VALUES (10, 'Epsilon Eridani', 1000000.00, 'Nearby star with a known exoplanet.', true, NULL, NULL, 1);
INSERT INTO public.star VALUES (11, '18 Scorpii', 1400000.00, 'Star considered similar to the Sun.', NULL, NULL, true, 1);
INSERT INTO public.star VALUES (12, '61 Cygni A', 900000.00, 'Star in the 61 Cygni binary system.', NULL, NULL, NULL, 1);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 6, true);


--
-- Name: moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_id_seq', 20, true);


--
-- Name: observation_observation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.observation_observation_id_seq', 10, true);


--
-- Name: planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_id_seq', 20, true);


--
-- Name: star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_id_seq', 12, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_description_key UNIQUE (description);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: observation observation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_name_key UNIQUE (name);


--
-- Name: observation observation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_pkey PRIMARY KEY (observation_id);


--
-- Name: planet planet_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_description_key UNIQUE (description);


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
-- Name: star star_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key UNIQUE (description);


--
-- Name: star star_description_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_description_key1 UNIQUE (description);


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
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: observation observation_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.observation
    ADD CONSTRAINT observation_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

