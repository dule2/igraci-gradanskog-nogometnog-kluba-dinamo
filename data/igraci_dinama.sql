--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: gradovi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.gradovi (
    id integer NOT NULL,
    naziv character varying(50) NOT NULL
);


ALTER TABLE public.gradovi OWNER TO postgres;

--
-- Name: gradovi_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.gradovi_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.gradovi_id_seq OWNER TO postgres;

--
-- Name: gradovi_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.gradovi_id_seq OWNED BY public.gradovi.id;


--
-- Name: igrac_klub; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.igrac_klub (
    prezime character varying(40) NOT NULL,
    ime_kluba character varying(50) NOT NULL
);


ALTER TABLE public.igrac_klub OWNER TO postgres;

--
-- Name: igraci; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.igraci (
    ime character varying(30),
    prezime character varying(30) NOT NULL,
    broj integer,
    pozicija character varying(30),
    datum_rodenja date,
    mjesto_rodenja character varying,
    visina integer,
    broj_nastupa integer,
    broj_golova integer
);


ALTER TABLE public.igraci OWNER TO postgres;

--
-- Name: klubovi; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.klubovi (
    ime character varying(40) NOT NULL,
    grad_id integer
);


ALTER TABLE public.klubovi OWNER TO postgres;

--
-- Name: gradovi id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradovi ALTER COLUMN id SET DEFAULT nextval('public.gradovi_id_seq'::regclass);


--
-- Data for Name: gradovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.gradovi (id, naziv) FROM stdin;
1	Bologna
2	Cardiff
3	Catania
4	Chiavari
5	Concarneau
6	Granada
7	La Spezia
8	Le Mans
9	Lisbon
10	Murska Sobota
11	Neretva
12	Osijek
13	Paris
14	Reggio Emilia
15	Rennes
16	Rijeka
17	Saint-Étienne
18	Split
19	Šibenik
20	Thessaloniki
21	Trapani
22	Turin
23	Varaždin
24	Varese
25	Velika Gorica
26	Verona
27	Warsaw
28	Zagreb
\.


--
-- Data for Name: igrac_klub; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.igrac_klub (prezime, ime_kluba) FROM stdin;
Petković	Zagreb
Petković	Neretva
Petković	HAŠK
Petković	Hrvatski dragovoljac
Petković	Catania
Petković	Varese
Petković	Reggiana
Petković	Virtus Entella
Petković	Trapani
Petković	Bologna
Petković	Verona
Teophile-Catherine	Rennes
Teophile-Catherine	Cardiff City
Teophile-Catherine	Saint-Étienne
Nevistić	Rijeka
Nevistić	Varaždin
Nevistić	NŠ Mura
Nevistić	Osijek
Bernauer	Rennes
Bernauer	Concarneau
Bernauer	Le Mans FC
Bernauer	Paris FC 
Torrente	Granada FC
Sučić	-
Mišić	Osijek
Mišić	Rijeka
Mišić	Spezia
Mišić	Sporting
Mišić	PAOK
Ademi	Šibenik
Ademi	Lokomotiva
Kulenović	Legia Warsaw
Kulenović	Rijeka
Kulenović	Juventus U19
Špikić	Hajduk
Špikić	Gorinca
Baturina	-
\.


--
-- Data for Name: igraci; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.igraci (ime, prezime, broj, pozicija, datum_rodenja, mjesto_rodenja, visina, broj_nastupa, broj_golova) FROM stdin;
Bruno	Petković	9	napadač	1994-09-16	Metković	193	265	83
Martin	Baturina	10	vezni	2003-02-16	Split	172	131	18
Ivan	Nevistić	33	vratar	1998-07-31	Đakovo	193	48	0
Kevin	Teophile-Catherine	28	branič	1989-10-28	Saint-Brieuc	183	191	4
Maxime	Bernauer	6	branič	1998-07-01	Hennebont	186	33	2
Raúl	Torrente	4	branič	2001-09-11	Murcia	193	8	2
Petar	Sučić	25	vezni	2003-10-25	Livno	183	56	3
Josip	Mišić	27	vezni	1994-06-28	Vinkovci	187	187	6
Arijan	Ademi	5	vezni	1991-05-29	Šibenik	184	413	47
Sandro	Kulenović	17	napadač	1999-12-04	Zagreb	191	67	20
Dario	Špikić	77	napadač	1999-03-22	Zagreb	183	132	18
\.


--
-- Data for Name: klubovi; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.klubovi (ime, grad_id) FROM stdin;
-	\N
Bologna	1
Cardiff City	2
Catania	3
Virtus Entella	4
Concarneau	5
Granada FC	6
Spezia	7
Le Mans FC	8
Sporting	9
NŠ Mura	10
Neretva	11
Osijek	12
Paris FC 	13
Reggiana	14
Rennes	15
Rijeka	16
Saint-Étienne	17
Hajduk	18
Šibenik	19
PAOK	20
Trapani	21
Juventus U19	22
Varaždin	23
Varese	24
Gorinca	25
Verona	26
Legia Warsaw	27
Lokomotiva	28
Hrvatski dragovoljac	28
HAŠK	28
Zagreb	28
\.


--
-- Name: gradovi_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.gradovi_id_seq', 28, true);


--
-- Name: gradovi gradovi_naziv_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradovi
    ADD CONSTRAINT gradovi_naziv_key UNIQUE (naziv);


--
-- Name: gradovi gradovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.gradovi
    ADD CONSTRAINT gradovi_pkey PRIMARY KEY (id);


--
-- Name: igrac_klub igrac_klub_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.igrac_klub
    ADD CONSTRAINT igrac_klub_pkey PRIMARY KEY (prezime, ime_kluba);


--
-- Name: igraci igraci_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.igraci
    ADD CONSTRAINT igraci_pkey PRIMARY KEY (prezime);


--
-- Name: klubovi klubovi_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klubovi
    ADD CONSTRAINT klubovi_pkey PRIMARY KEY (ime);


--
-- Name: igrac_klub igrac_klub_ime_kluba_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.igrac_klub
    ADD CONSTRAINT igrac_klub_ime_kluba_fkey FOREIGN KEY (ime_kluba) REFERENCES public.klubovi(ime);


--
-- Name: igrac_klub igrac_klub_prezime_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.igrac_klub
    ADD CONSTRAINT igrac_klub_prezime_fkey FOREIGN KEY (prezime) REFERENCES public.igraci(prezime);


--
-- Name: klubovi klubovi_grad_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.klubovi
    ADD CONSTRAINT klubovi_grad_id_fkey FOREIGN KEY (grad_id) REFERENCES public.gradovi(id);


--
-- PostgreSQL database dump complete
--

