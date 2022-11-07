--
-- PostgreSQL database dump
--

-- Dumped from database version 12.1
-- Dumped by pg_dump version 12.1

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
-- Name: carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras (    id character(8) NOT NULL,    nombre text NOT NULL,    id_facultad character(8) NOT NULL,    numero_asig integer NOT NULL,    total_horas_proyecto integer NOT NULL);


ALTER TABLE public.carreras OWNER TO postgres;

--
-- Name: carreras_evidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras_evidencias (    id_periodo_academico character(10) NOT NULL,    id_evidencias text NOT NULL,    id_evaluacion bigint NOT NULL);


ALTER TABLE public.carreras_evidencias OWNER TO postgres;

--
-- Name: carreras_evidencias_id_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.carreras_evidencias_id_evaluacion_seq START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE  CACHE 1;


ALTER TABLE public.carreras_evidencias_id_evaluacion_seq OWNER TO postgres;

--
-- Name: carreras_evidencias_id_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.carreras_evidencias_id_evaluacion_seq OWNED BY public.carreras_evidencias.id_evaluacion;


--
-- Name: carreras_periodo_academico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.carreras_periodo_academico ( id_carreras character(8) NOT NULL,id_periodo_academico character(10) NOT NULL);

ALTER TABLE public.carreras_periodo_academico OWNER TO postgres;

--
-- Name: criterios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.criterios (id character(15) NOT NULL,    nombre character(120) NOT NULL);


ALTER TABLE public.criterios OWNER TO postgres;

--
-- Name: docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docentes (    id character(10) NOT NULL,    nombre text NOT NULL,    correo text NOT NULL,    clave character(500),    telefono character(10),    cambio_clave boolean NOT NULL,    apellido text NOT NULL);


ALTER TABLE public.docentes OWNER TO postgres;

--
-- Name: docentes_carreras; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.docentes_carreras (    id_carreras character(8) NOT NULL,    id_docentes character(10) NOT NULL);


ALTER TABLE public.docentes_carreras OWNER TO postgres;

--
-- Name: elemento_fundamental; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.elemento_fundamental (    id character(15) NOT NULL,    descripcion text NOT NULL,    id_estandar character(15) NOT NULL);


ALTER TABLE public.elemento_fundamental OWNER TO postgres;

--
-- Name: estandar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.estandar (    id character(15) NOT NULL,    descripcion text NOT NULL,    id_criterio character(15) NOT NULL);


ALTER TABLE public.estandar OWNER TO postgres;

--
-- Name: evaluacion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluacion (    id bigint NOT NULL,    nota text NOT NULL);


ALTER TABLE public.evaluacion OWNER TO postgres;

--
-- Name: evaluacion_docentes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evaluacion_docentes (    id_evaluacion bigint NOT NULL,    id_docente character(10) NOT NULL);


ALTER TABLE public.evaluacion_docentes OWNER TO postgres;

--
-- Name: evaluacion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evaluacion_id_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.evaluacion_id_seq OWNER TO postgres;

--
-- Name: evaluacion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evaluacion_id_seq OWNED BY public.evaluacion.id;


--
-- Name: evalucion_docentes_id_evaluacion_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.evalucion_docentes_id_evaluacion_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.evalucion_docentes_id_evaluacion_seq OWNER TO postgres;

--
-- Name: evalucion_docentes_id_evaluacion_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.evalucion_docentes_id_evaluacion_seq OWNED BY public.evaluacion_docentes.id_evaluacion;


--
-- Name: evidencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.evidencias (    id text NOT NULL,    nombre text NOT NULL);


ALTER TABLE public.evidencias OWNER TO postgres;

--
-- Name: facultad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.facultad (id character(8) NOT NULL,nombre text NOT NULL);


ALTER TABLE public.facultad OWNER TO postgres;

--
-- Name: historial_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.historial_usuarios (    id bigint NOT NULL,    fecha_inicial date NOT NULL,    fecha_final date NOT NULL,    id_usuarios integer NOT NULL,    responsabilidad text NOT NULL);


ALTER TABLE public.historial_usuarios OWNER TO postgres;

--
-- Name: historial_usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_usuarios_id_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.historial_usuarios_id_seq OWNER TO postgres;

--
-- Name: historial_usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_usuarios_id_seq OWNED BY public.historial_usuarios.id;


--
-- Name: historial_usuarios_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.historial_usuarios_id_usuarios_seq    AS integer    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.historial_usuarios_id_usuarios_seq OWNER TO postgres;

--
-- Name: historial_usuarios_id_usuarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.historial_usuarios_id_usuarios_seq OWNED BY public.historial_usuarios.id_usuarios;


--
-- Name: periodo_academico_usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periodo_academico_usuarios (    id_periodo_academico character(10) NOT NULL,    id_usuarios integer NOT NULL);


ALTER TABLE public.periodo_academico_usuarios OWNER TO postgres;

--
-- Name: periodo_academico_usuarios_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.periodo_academico_usuarios_id_usuarios_seq    AS integer    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.periodo_academico_usuarios_id_usuarios_seq OWNER TO postgres;

--
-- Name: periodo_academico_usuarios_id_usuarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.periodo_academico_usuarios_id_usuarios_seq OWNED BY public.periodo_academico_usuarios.id_usuarios;


--
-- Name: periodo_academicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.periodo_academicos (    id character(10) NOT NULL,    fecha_inicial date NOT NULL,    fecha_final date NOT NULL);


ALTER TABLE public.periodo_academicos OWNER TO postgres;

--
-- Name: prueba; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.prueba (    id character(3) NOT NULL,    nombre character(25),    apellido character(25),    direcion character(40));


ALTER TABLE public.prueba OWNER TO postgres;

--
-- Name: responsabilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.responsabilidad (    id bigint NOT NULL,    nombre text NOT NULL,    id_evidencias text NOT NULL);


ALTER TABLE public.responsabilidad OWNER TO postgres;

--
-- Name: responsabilidad_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.responsabilidad_id_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.responsabilidad_id_seq OWNER TO postgres;

--
-- Name: responsabilidad_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.responsabilidad_id_seq OWNED BY public.responsabilidad.id;


--
-- Name: titulos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titulos (    id bigint NOT NULL,    nombre text NOT NULL,    id_docente character(10) NOT NULL);


ALTER TABLE public.titulos OWNER TO postgres;

--
-- Name: titulos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.titulos_id_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.titulos_id_seq OWNER TO postgres;

--
-- Name: titulos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.titulos_id_seq OWNED BY public.titulos.id;


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (    id integer NOT NULL,    decripcion text NOT NULL,    permisos bigint);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- Name: usuarios_docente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_docente (    id_usuarios integer NOT NULL,    id_docentes character(10) NOT NULL,    id_carrera character(8) NOT NULL,    fecha_inicial date NOT NULL,    fecha_final date NOT NULL,    estado character(10) NOT NULL);


ALTER TABLE public.usuarios_docente OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_id_seq    AS integer     START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO postgres;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- Name: usuarios_responsabilidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios_responsabilidad (    id_usuarios integer NOT NULL,    id_responsabilidad bigint NOT NULL,    id_docentes character(10) NOT NULL);


ALTER TABLE public.usuarios_responsabilidad OWNER TO postgres;

--
-- Name: usuarios_responsabilidad_id_responsabilidad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_responsabilidad_id_responsabilidad_seq    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.usuarios_responsabilidad_id_responsabilidad_seq OWNER TO postgres;

--
-- Name: usuarios_responsabilidad_id_responsabilidad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_responsabilidad_id_responsabilidad_seq OWNED BY public.usuarios_responsabilidad.id_responsabilidad;


--
-- Name: usuarios_responsabilidad_id_usuarios_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.usuarios_responsabilidad_id_usuarios_seq    AS integer    START WITH 1    INCREMENT BY 1    NO MINVALUE    NO MAXVALUE    CACHE 1;


ALTER TABLE public.usuarios_responsabilidad_id_usuarios_seq OWNER TO postgres;

--
-- Name: usuarios_responsabilidad_id_usuarios_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.usuarios_responsabilidad_id_usuarios_seq OWNED BY public.usuarios_responsabilidad.id_usuarios;


--
-- Name: carreras_evidencias id_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ALTER COLUMN id_evaluacion SET DEFAULT nextval('public.carreras_evidencias_id_evaluacion_seq'::regclass);


--
-- Name: evaluacion id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion ALTER COLUMN id SET DEFAULT nextval('public.evaluacion_id_seq'::regclass);


--
-- Name: evaluacion_docentes id_evaluacion; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion_docentes ALTER COLUMN id_evaluacion SET DEFAULT nextval('public.evalucion_docentes_id_evaluacion_seq'::regclass);


--
-- Name: historial_usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_usuarios ALTER COLUMN id SET DEFAULT nextval('public.historial_usuarios_id_seq'::regclass);


--
-- Name: historial_usuarios id_usuarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_usuarios ALTER COLUMN id_usuarios SET DEFAULT nextval('public.historial_usuarios_id_usuarios_seq'::regclass);


--
-- Name: periodo_academico_usuarios id_usuarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_academico_usuarios ALTER COLUMN id_usuarios SET DEFAULT nextval('public.periodo_academico_usuarios_id_usuarios_seq'::regclass);


--
-- Name: responsabilidad id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabilidad ALTER COLUMN id SET DEFAULT nextval('public.responsabilidad_id_seq'::regclass);


--
-- Name: titulos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos ALTER COLUMN id SET DEFAULT nextval('public.titulos_id_seq'::regclass);


--
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- Name: usuarios_responsabilidad id_usuarios; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ALTER COLUMN id_usuarios SET DEFAULT nextval('public.usuarios_responsabilidad_id_usuarios_seq'::regclass);


--
-- Name: usuarios_responsabilidad id_responsabilidad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ALTER COLUMN id_responsabilidad SET DEFAULT nextval('public.usuarios_responsabilidad_id_responsabilidad_seq'::regclass);


COPY public.usuarios_responsabilidad (id_usuarios, id_responsabilidad, id_docentes) FROM stdin;
\.


--
-- Name: carreras_evidencias_id_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.carreras_evidencias_id_evaluacion_seq', 1, false);


--
-- Name: evaluacion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evaluacion_id_seq', 1, false);


--
-- Name: evalucion_docentes_id_evaluacion_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.evalucion_docentes_id_evaluacion_seq', 1, false);


--
-- Name: historial_usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_usuarios_id_seq', 1, false);


--
-- Name: historial_usuarios_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.historial_usuarios_id_usuarios_seq', 1, false);


--
-- Name: periodo_academico_usuarios_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.periodo_academico_usuarios_id_usuarios_seq', 1, false);


--
-- Name: responsabilidad_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.responsabilidad_id_seq', 1, false);


--
-- Name: titulos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.titulos_id_seq', 1, false);


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 4, true);


--
-- Name: usuarios_responsabilidad_id_responsabilidad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_responsabilidad_id_responsabilidad_seq', 1, false);


--
-- Name: usuarios_responsabilidad_id_usuarios_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.usuarios_responsabilidad_id_usuarios_seq', 1, false);


--
-- Name: carreras_evidencias carreras_evidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ADD CONSTRAINT carreras_evidencias_pkey PRIMARY KEY (id_periodo_academico, id_evidencias, id_evaluacion);


--
-- Name: carreras_periodo_academico carreras_periodo_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodo_academico ADD CONSTRAINT carreras_periodo_academico_pkey PRIMARY KEY (id_carreras, id_periodo_academico);


--
-- Name: carreras carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ADD CONSTRAINT carreras_pkey PRIMARY KEY (id);


--
-- Name: criterios criterios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.criterios ADD CONSTRAINT criterios_pkey PRIMARY KEY (id);


--
-- Name: docentes_carreras docentes_carreras_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes_carreras ADD CONSTRAINT docentes_carreras_pkey PRIMARY KEY (id_carreras, id_docentes);


--
-- Name: docentes docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes ADD CONSTRAINT docentes_pkey PRIMARY KEY (id);


--
-- Name: elemento_fundamental elemento_fundamental_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elemento_fundamental ADD CONSTRAINT elemento_fundamental_pkey PRIMARY KEY (id);


--
-- Name: estandar estandar_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estandar ADD CONSTRAINT estandar_pkey PRIMARY KEY (id);


--
-- Name: evaluacion evaluacion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion ADD CONSTRAINT evaluacion_pkey PRIMARY KEY (id);


--
-- Name: evaluacion_docentes evalucion_docentes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion_docentes ADD CONSTRAINT evalucion_docentes_pkey PRIMARY KEY (id_evaluacion, id_docente);


--
-- Name: evidencias evidencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evidencias ADD CONSTRAINT evidencias_pkey PRIMARY KEY (id);


--
-- Name: facultad facultad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.facultad ADD CONSTRAINT facultad_pkey PRIMARY KEY (id);


--
-- Name: historial_usuarios historial_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_usuarios ADD CONSTRAINT historial_usuarios_pkey PRIMARY KEY (id);


--
-- Name: periodo_academicos periodo_academico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_academicos ADD CONSTRAINT periodo_academico_pkey PRIMARY KEY (id);


--
-- Name: periodo_academico_usuarios periodo_academico_usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_academico_usuarios ADD CONSTRAINT periodo_academico_usuarios_pkey PRIMARY KEY (id_periodo_academico, id_usuarios);


--
-- Name: prueba prueba_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.prueba ADD CONSTRAINT prueba_pkey PRIMARY KEY (id);


--
-- Name: responsabilidad responsabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabilidad ADD CONSTRAINT responsabilidad_pkey PRIMARY KEY (id);


--
-- Name: titulos titulos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos ADD CONSTRAINT titulos_pkey PRIMARY KEY (id);


--
-- Name: carreras_evidencias uk_id_evaluacion; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ADD CONSTRAINT uk_id_evaluacion UNIQUE (id_evaluacion) INCLUDE (id_evaluacion);


--
-- Name: usuarios_docente usuarios_docente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_docente ADD CONSTRAINT usuarios_docente_pkey PRIMARY KEY (id_usuarios, id_docentes, id_carrera);


--
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: usuarios_responsabilidad usuarios_responsabilidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ADD CONSTRAINT usuarios_responsabilidad_pkey PRIMARY KEY (id_usuarios, id_responsabilidad);


--
-- Name: usuarios_docente fk_id_carrera; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_docente ADD CONSTRAINT fk_id_carrera FOREIGN KEY (id_carrera) REFERENCES public.carreras(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: carreras_periodo_academico fk_id_carreras; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodo_academico ADD CONSTRAINT fk_id_carreras FOREIGN KEY (id_carreras) REFERENCES public.carreras(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: docentes_carreras fk_id_carreras; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes_carreras ADD CONSTRAINT fk_id_carreras FOREIGN KEY (id_carreras) REFERENCES public.carreras(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: estandar fk_id_criterios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.estandar ADD CONSTRAINT fk_id_criterios FOREIGN KEY (id_criterio) REFERENCES public.criterios(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: docentes_carreras fk_id_docentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.docentes_carreras ADD CONSTRAINT fk_id_docentes FOREIGN KEY (id_docentes) REFERENCES public.docentes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuarios_responsabilidad fk_id_docentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ADD CONSTRAINT fk_id_docentes FOREIGN KEY (id_docentes) REFERENCES public.docentes(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: usuarios_docente fk_id_docentes; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_docente ADD CONSTRAINT fk_id_docentes FOREIGN KEY (id_docentes) REFERENCES public.docentes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: elemento_fundamental fk_id_estandar; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.elemento_fundamental ADD CONSTRAINT fk_id_estandar FOREIGN KEY (id_estandar) REFERENCES public.estandar(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: carreras_evidencias fk_id_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ADD CONSTRAINT fk_id_evaluacion FOREIGN KEY (id_evaluacion) REFERENCES public.evaluacion(id);


--
-- Name: responsabilidad fk_id_evidencias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.responsabilidad ADD CONSTRAINT fk_id_evidencias FOREIGN KEY (id_evidencias) REFERENCES public.evidencias(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: carreras_evidencias fk_id_evidencias; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ADD CONSTRAINT fk_id_evidencias FOREIGN KEY (id_evidencias) REFERENCES public.evidencias(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: carreras fk_id_facultad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras ADD CONSTRAINT fk_id_facultad FOREIGN KEY (id_facultad) REFERENCES public.facultad(id) ON UPDATE CASCADE ON DELETE RESTRICT NOT VALID;


--
-- Name: carreras_periodo_academico fk_id_periodo_academico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_periodo_academico ADD CONSTRAINT fk_id_periodo_academico FOREIGN KEY (id_periodo_academico) REFERENCES public.periodo_academicos(id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- Name: carreras_evidencias fk_id_periodo_academico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.carreras_evidencias ADD CONSTRAINT fk_id_periodo_academico FOREIGN KEY (id_periodo_academico) REFERENCES public.periodo_academicos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuarios_responsabilidad fk_id_responsabilidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ADD CONSTRAINT fk_id_responsabilidad FOREIGN KEY (id_responsabilidad) REFERENCES public.responsabilidad(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: titulos fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titulos ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_docente) REFERENCES public.docentes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuarios_responsabilidad fk_id_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_responsabilidad ADD CONSTRAINT fk_id_usuario FOREIGN KEY (id_usuarios) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: historial_usuarios fk_id_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.historial_usuarios ADD CONSTRAINT fk_id_usuarios FOREIGN KEY (id_usuarios) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periodo_academico_usuarios fk_id_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_academico_usuarios ADD CONSTRAINT fk_id_usuarios FOREIGN KEY (id_usuarios) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: usuarios_docente fk_id_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios_docente ADD CONSTRAINT fk_id_usuarios FOREIGN KEY (id_usuarios) REFERENCES public.usuarios(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: periodo_academico_usuarios fk_periodo_academico; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.periodo_academico_usuarios ADD CONSTRAINT fk_periodo_academico FOREIGN KEY (id_periodo_academico) REFERENCES public.periodo_academicos(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: evaluacion_docentes id_docente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion_docentes ADD CONSTRAINT id_docente FOREIGN KEY (id_docente) REFERENCES public.docentes(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: evaluacion_docentes id_evaluacion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.evaluacion_docentes ADD CONSTRAINT id_evaluacion FOREIGN KEY (id_evaluacion) REFERENCES public.evaluacion(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- PostgreSQL database dump complete
--

