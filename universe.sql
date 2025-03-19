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
-- Name: blackhole; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.blackhole (
    blackhole_id integer NOT NULL,
    name character varying(255),
    nearby boolean,
    centre boolean DEFAULT false NOT NULL,
    supermassive boolean DEFAULT false NOT NULL
);


ALTER TABLE public.blackhole OWNER TO freecodecamp;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255),
    ours boolean NOT NULL,
    nearby boolean,
    score numeric(2,1),
    no_of_people integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255),
    ours boolean NOT NULL,
    nearby boolean,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255),
    ours boolean NOT NULL,
    nearby boolean,
    star_id integer,
    no_of_people integer,
    nickname text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255),
    nearby boolean,
    ours boolean NOT NULL,
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Data for Name: blackhole; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.blackhole VALUES (1, 'Black Hole Alpha', true, false, true);
INSERT INTO public.blackhole VALUES (2, 'Black Hole Beta', false, true, false);
INSERT INTO public.blackhole VALUES (3, 'Black Hole Gamma', true, false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', true, true, 8.5, 1000000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', true, true, 9.0, 2000000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', false, false, 7.8, 500000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', false, true, 8.2, 800000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', true, false, 7.5, 300000);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', false, true, 8.7, 150000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', true, true, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', false, true, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, true, 2);
INSERT INTO public.moon VALUES (4, 'Europa', true, false, 3);
INSERT INTO public.moon VALUES (5, 'Io', true, true, 3);
INSERT INTO public.moon VALUES (6, 'Callisto', false, false, 4);
INSERT INTO public.moon VALUES (7, 'Ganymede', true, true, 4);
INSERT INTO public.moon VALUES (8, 'Titan', false, true, 5);
INSERT INTO public.moon VALUES (9, 'Rhea', true, false, 5);
INSERT INTO public.moon VALUES (10, 'Mimas', false, true, 6);
INSERT INTO public.moon VALUES (11, 'Enceladus', true, true, 6);
INSERT INTO public.moon VALUES (12, 'Triton', false, false, 7);
INSERT INTO public.moon VALUES (13, 'Miranda', true, true, 7);
INSERT INTO public.moon VALUES (14, 'Ariel', false, true, 8);
INSERT INTO public.moon VALUES (15, 'Umbriel', true, false, 8);
INSERT INTO public.moon VALUES (16, 'Oberon', false, true, 9);
INSERT INTO public.moon VALUES (17, 'Titania', true, false, 9);
INSERT INTO public.moon VALUES (18, 'Iapetus', false, true, 10);
INSERT INTO public.moon VALUES (19, 'Phoebe', true, false, 10);
INSERT INTO public.moon VALUES (20, 'Charon', true, true, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, true, 1, 100, 'Home');
INSERT INTO public.planet VALUES (2, 'Mars', false, true, 2, 0, 'Red Planet');
INSERT INTO public.planet VALUES (3, 'Venus', false, true, 3, 0, 'Evening Star');
INSERT INTO public.planet VALUES (4, 'Jupiter', true, false, 4, 0, 'Giant Planet');
INSERT INTO public.planet VALUES (5, 'Saturn', false, false, 5, 0, 'Ringed Planet');
INSERT INTO public.planet VALUES (6, 'Uranus', false, true, 6, 0, 'Tilted Planet');
INSERT INTO public.planet VALUES (7, 'Neptune', true, false, 1, 0, 'Blue Planet');
INSERT INTO public.planet VALUES (8, 'Mercury', true, true, 2, 0, 'Swift Planet');
INSERT INTO public.planet VALUES (9, 'Pluto', false, false, 3, 0, 'Dwarf Planet');
INSERT INTO public.planet VALUES (10, 'Proxima b', false, true, 4, 0, 'Exoplanet');
INSERT INTO public.planet VALUES (11, 'Kepler-22b', false, false, 5, 0, 'Earth-like Exoplanet');
INSERT INTO public.planet VALUES (12, 'Alpha Centauri Bb', true, true, 6, 0, 'Nearby Exoplanet');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpha Centauri', true, true, 1);
INSERT INTO public.star VALUES (2, 'Betelgeuse', false, true, 2);
INSERT INTO public.star VALUES (3, 'Sirius', true, true, 1);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', true, false, 1);
INSERT INTO public.star VALUES (5, 'Rigel', false, true, 3);
INSERT INTO public.star VALUES (6, 'Aldebaran', true, false, 2);


--
-- Name: blackhole blackhole_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_name UNIQUE (name);


--
-- Name: blackhole blackhole_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.blackhole
    ADD CONSTRAINT blackhole_pkey PRIMARY KEY (blackhole_id);


--
-- Name: galaxy galaxy_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet name_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT name_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name UNIQUE (name);


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

