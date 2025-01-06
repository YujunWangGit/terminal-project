--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying(30) NOT NULL,
    size integer NOT NULL,
    galaxy_type character varying(50),
    discovery_year integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    mass numeric(30,4),
    population integer
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
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    population bigint,
    life boolean
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    description text,
    alive boolean NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

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
-- Name: table_5; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.table_5 (
    table_5_id integer NOT NULL,
    name character varying(30) NOT NULL,
    placeholder boolean NOT NULL
);


ALTER TABLE public.table_5 OWNER TO freecodecamp;

--
-- Name: table_5_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.table_5_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.table_5_id_seq OWNER TO freecodecamp;

--
-- Name: table_5_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.table_5_id_seq OWNED BY public.table_5.table_5_id;


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
-- Name: table_5 table_5_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5 ALTER COLUMN table_5_id SET DEFAULT nextval('public.table_5_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1000, 'Spiral', 1610);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1200, 'Spiral', 1785);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 300, 'Spiral', 1750);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 900, 'Spiral', 1800);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 800, 'Spiral', 1900);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 850, 'Spiral', 1840);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 735000000000000000000.0000, 0);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 10659000000.0000, 0);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 14762000000.0000, 0);
INSERT INTO public.moon VALUES (4, 'Io', 3, 89319000000.0000, 0);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 4799800000.0000, 0);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 148190000000.0000, 0);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 107590000000.0000, 0);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 1345200000000.0000, 0);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 231460000000.0000, 0);
INSERT INTO public.moon VALUES (10, 'Enceladus', 4, 108030000.0000, 0);
INSERT INTO public.moon VALUES (11, 'Mimas', 4, 43494000.0000, 0);
INSERT INTO public.moon VALUES (12, 'Triton', 5, 214000000000.0000, 0);
INSERT INTO public.moon VALUES (13, 'Charon', 6, 152000000.0000, 0);
INSERT INTO public.moon VALUES (14, 'Miranda', 7, 65500000.0000, 0);
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1290000000.0000, 0);
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 434000000.0000, 0);
INSERT INTO public.moon VALUES (17, 'Titania', 7, 3530000000.0000, 0);
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 3020000000.0000, 0);
INSERT INTO public.moon VALUES (19, 'Iapetus', 4, 180000000000.0000, 0);
INSERT INTO public.moon VALUES (20, 'Phoebe', 4, 42500000.0000, 0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 0, false);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 0, false);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 8000000000, true);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 0, true);
INSERT INTO public.planet VALUES (5, 'Sirius b', 2, 0, false);
INSERT INTO public.planet VALUES (6, 'Sirius c', 2, 0, false);
INSERT INTO public.planet VALUES (7, 'Proxima b', 3, 0, true);
INSERT INTO public.planet VALUES (8, 'Alpha Centauri c', 3, 0, false);
INSERT INTO public.planet VALUES (9, 'Rigel b', 5, 0, false);
INSERT INTO public.planet VALUES (10, 'Rigel c', 5, 0, false);
INSERT INTO public.planet VALUES (11, 'Antares b', 6, 0, false);
INSERT INTO public.planet VALUES (12, 'Antares c', 6, 0, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'The star at the center of our Solar System', true);
INSERT INTO public.star VALUES (2, 'Sirius', 1, 'The brightest star in Earth’s night sky', true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri', 2, 'The closest star system to the Earth', true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'A red supergiant star in the constellation Orion', false);
INSERT INTO public.star VALUES (5, 'Rigel', 3, 'A blue supergiant star in the constellation Orion', true);
INSERT INTO public.star VALUES (6, 'Antares', 4, 'A red supergiant star in the heart of the Scorpius constellation', true);


--
-- Data for Name: table_5; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.table_5 VALUES (1, 'Row 1', true);
INSERT INTO public.table_5 VALUES (2, 'Row 2', false);
INSERT INTO public.table_5 VALUES (3, 'Row 3', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: table_5_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.table_5_id_seq', 3, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: table_5 table_5_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5
    ADD CONSTRAINT table_5_name_key UNIQUE (name);


--
-- Name: table_5 table_5_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.table_5
    ADD CONSTRAINT table_5_pkey PRIMARY KEY (table_5_id);


--
-- Name: galaxy unique_galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_name UNIQUE (name);


--
-- Name: moon unique_moon_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_id UNIQUE (moon_id);


--
-- Name: planet unique_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: star fk_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon fk_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

