--
-- PostgreSQL database dump
--

-- Dumped from database version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)
-- Dumped by pg_dump version 10.19 (Ubuntu 10.19-0ubuntu0.18.04.1)

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

--
-- Name: authentication; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA authentication;


ALTER SCHEMA authentication OWNER TO postgres;

--
-- Name: core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA core;


ALTER SCHEMA core OWNER TO postgres;

--
-- Name: psychology; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA psychology;


ALTER SCHEMA psychology OWNER TO postgres;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: audits; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.audits (
    id bigint NOT NULL,
    user_type character varying(255),
    user_id bigint,
    event character varying(255) NOT NULL,
    auditable_type character varying(255) NOT NULL,
    auditable_id bigint NOT NULL,
    old_values text,
    new_values text,
    url text,
    ip_address inet,
    user_agent character varying(1023),
    tags character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE authentication.audits OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.audits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.audits_id_seq OWNER TO postgres;

--
-- Name: audits_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.audits_id_seq OWNED BY authentication.audits.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE authentication.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.failed_jobs_id_seq OWNED BY authentication.failed_jobs.id;


--
-- Name: menus; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.menus (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    parent_id bigint,
    role_id bigint,
    color text DEFAULT '#9c9c9c'::text NOT NULL,
    description text,
    icon character varying(255),
    label character varying(255) NOT NULL,
    router_link character varying(255),
    type character varying(255)
);


ALTER TABLE authentication.menus OWNER TO postgres;

--
-- Name: COLUMN menus.parent_id; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.menus.parent_id IS 'Un menu puede tener menus hijos';


--
-- Name: COLUMN menus.role_id; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.menus.role_id IS 'Un menu puede tener menus hijos';


--
-- Name: COLUMN menus.color; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.menus.color IS 'color en hexadecimal';


--
-- Name: COLUMN menus.icon; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.menus.icon IS 'Icono de la libreria que se usa en el frontend';


--
-- Name: COLUMN menus.type; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.menus.type IS 'Para categorizar los menus';


--
-- Name: menus_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.menus_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.menus_id_seq OWNER TO postgres;

--
-- Name: menus_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.menus_id_seq OWNED BY authentication.menus.id;


--
-- Name: migrations; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE authentication.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.migrations_id_seq OWNED BY authentication.migrations.id;


--
-- Name: model_has_permissions; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.model_has_permissions (
    permission_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE authentication.model_has_permissions OWNER TO postgres;

--
-- Name: model_has_roles; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.model_has_roles (
    role_id bigint NOT NULL,
    model_type character varying(255) NOT NULL,
    model_id bigint NOT NULL
);


ALTER TABLE authentication.model_has_roles OWNER TO postgres;

--
-- Name: password_resets; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.password_resets (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    token character varying(255) NOT NULL,
    used boolean DEFAULT false NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE authentication.password_resets OWNER TO postgres;

--
-- Name: password_resets_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.password_resets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.password_resets_id_seq OWNER TO postgres;

--
-- Name: password_resets_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.password_resets_id_seq OWNED BY authentication.password_resets.id;


--
-- Name: permissions; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.permissions (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE authentication.permissions OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.permissions_id_seq OWNER TO postgres;

--
-- Name: permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.permissions_id_seq OWNED BY authentication.permissions.id;


--
-- Name: personal_access_tokens; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.personal_access_tokens (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    tokenable_type character varying(255) NOT NULL,
    tokenable_id bigint NOT NULL,
    abilities text,
    last_used_at timestamp(0) without time zone,
    name character varying(255) NOT NULL,
    token character varying(64) NOT NULL
);


ALTER TABLE authentication.personal_access_tokens OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.personal_access_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.personal_access_tokens_id_seq OWNER TO postgres;

--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.personal_access_tokens_id_seq OWNED BY authentication.personal_access_tokens.id;


--
-- Name: role_has_permissions; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.role_has_permissions (
    permission_id bigint NOT NULL,
    role_id bigint NOT NULL
);


ALTER TABLE authentication.role_has_permissions OWNER TO postgres;

--
-- Name: roles; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.roles (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    guard_name character varying(255) NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE authentication.roles OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.roles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.roles_id_seq OWNER TO postgres;

--
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.roles_id_seq OWNED BY authentication.roles.id;


--
-- Name: systems; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.systems (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    acronym character varying(255) NOT NULL,
    code character varying(255) NOT NULL,
    description text,
    date date NOT NULL,
    icon character varying(255),
    name character varying(255) NOT NULL,
    redirect character varying(255) NOT NULL,
    state boolean DEFAULT true NOT NULL,
    version character varying(255) NOT NULL
);


ALTER TABLE authentication.systems OWNER TO postgres;

--
-- Name: COLUMN systems.code; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.code IS 'No debe ser modificado una vez creado';


--
-- Name: COLUMN systems.date; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.date IS 'Fecha del sistema';


--
-- Name: COLUMN systems.icon; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.icon IS 'De la libreria que se usa en el frontend';


--
-- Name: COLUMN systems.redirect; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.redirect IS 'pagina wen de redireccion del cliente';


--
-- Name: COLUMN systems.state; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.state IS 'true activo false inactivo';


--
-- Name: COLUMN systems.version; Type: COMMENT; Schema: authentication; Owner: postgres
--

COMMENT ON COLUMN authentication.systems.version IS 'XX.XX.XX';


--
-- Name: systems_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.systems_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.systems_id_seq OWNER TO postgres;

--
-- Name: systems_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.systems_id_seq OWNED BY authentication.systems.id;


--
-- Name: transactional_codes; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.transactional_codes (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    token character varying(255) NOT NULL,
    used boolean DEFAULT false NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE authentication.transactional_codes OWNER TO postgres;

--
-- Name: transactional_codes_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.transactional_codes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.transactional_codes_id_seq OWNER TO postgres;

--
-- Name: transactional_codes_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.transactional_codes_id_seq OWNED BY authentication.transactional_codes.id;


--
-- Name: users; Type: TABLE; Schema: authentication; Owner: postgres
--

CREATE TABLE authentication.users (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    remember_token character varying(100),
    blood_type_id bigint,
    civil_status_id bigint,
    ethnic_origin_id bigint,
    gender_id bigint,
    identification_type_id bigint,
    sex_id bigint,
    avatar character varying(255),
    birthdate date,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    lastname character varying(255) NOT NULL,
    max_attempts integer DEFAULT 3 NOT NULL,
    name character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    password_changed boolean DEFAULT false NOT NULL,
    phone character varying(255),
    suspended boolean DEFAULT false NOT NULL,
    username character varying(255) NOT NULL
);


ALTER TABLE authentication.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: authentication; Owner: postgres
--

CREATE SEQUENCE authentication.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE authentication.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: authentication; Owner: postgres
--

ALTER SEQUENCE authentication.users_id_seq OWNED BY authentication.users.id;


--
-- Name: address; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.address (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    location_id bigint NOT NULL,
    sector_id bigint NOT NULL,
    latitude double precision,
    longitude double precision,
    main_street character varying(255) NOT NULL,
    secondary_street character varying(255) NOT NULL,
    number character varying(255),
    post_code character varying(255),
    reference text
);


ALTER TABLE core.address OWNER TO postgres;

--
-- Name: COLUMN address.number; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.address.number IS 'número de casa';


--
-- Name: COLUMN address.post_code; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.address.post_code IS 'código postal';


--
-- Name: address_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.address_id_seq OWNER TO postgres;

--
-- Name: address_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.address_id_seq OWNED BY core.address.id;


--
-- Name: catalogues; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.catalogues (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    parent_id bigint,
    code character varying(255) NOT NULL,
    color text DEFAULT '#9c9c9c'::text NOT NULL,
    description text,
    icon character varying(255),
    name text NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE core.catalogues OWNER TO postgres;

--
-- Name: COLUMN catalogues.parent_id; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.catalogues.parent_id IS 'Un catalogo puede tener catalogos hijos';


--
-- Name: COLUMN catalogues.code; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.catalogues.code IS 'No debe ser modificado una vez que se lo crea';


--
-- Name: COLUMN catalogues.color; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.catalogues.color IS 'color en hexadecimal';


--
-- Name: COLUMN catalogues.icon; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.catalogues.icon IS 'Icono de la libreria que se usa en el frontend';


--
-- Name: COLUMN catalogues.type; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.catalogues.type IS 'Para categorizar los catalogos';


--
-- Name: catalogues_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.catalogues_id_seq OWNER TO postgres;

--
-- Name: catalogues_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.catalogues_id_seq OWNED BY core.catalogues.id;


--
-- Name: emails; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.emails (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    emailable_type character varying(255) NOT NULL,
    emailable_id bigint NOT NULL,
    domain character varying(255),
    email character varying(255) NOT NULL,
    icon character varying(255)
);


ALTER TABLE core.emails OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.emails_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.emails_id_seq OWNER TO postgres;

--
-- Name: emails_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.emails_id_seq OWNED BY core.emails.id;


--
-- Name: files; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.files (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    fileable_type character varying(255) NOT NULL,
    fileable_id bigint NOT NULL,
    description text,
    directory text,
    extension character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE core.files OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.files_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.files_id_seq OWNER TO postgres;

--
-- Name: files_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.files_id_seq OWNED BY core.files.id;


--
-- Name: images; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.images (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    imageable_type character varying(255) NOT NULL,
    imageable_id bigint NOT NULL,
    description text,
    directory text,
    extension character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE core.images OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.images_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.images_id_seq OWNER TO postgres;

--
-- Name: images_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.images_id_seq OWNED BY core.images.id;


--
-- Name: locations; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.locations (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    parent_id bigint,
    type_id bigint,
    alpha2_code character varying(255),
    alpha3_code character varying(255),
    calling_code character varying(255),
    capital character varying(255),
    code character varying(255) NOT NULL,
    flag character varying(255),
    name character varying(255) NOT NULL,
    region character varying(255),
    subregion character varying(255),
    timezones json,
    top_level_domain character varying(255)
);


ALTER TABLE core.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.locations_id_seq OWNED BY core.locations.id;


--
-- Name: phones; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.phones (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    phoneable_type character varying(255) NOT NULL,
    phoneable_id bigint NOT NULL,
    location_id bigint,
    operator_id bigint,
    type_id bigint,
    number character varying(255) NOT NULL
);


ALTER TABLE core.phones OWNER TO postgres;

--
-- Name: COLUMN phones.location_id; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.phones.location_id IS 'Para obtener el codido de pais';


--
-- Name: COLUMN phones.operator_id; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.phones.operator_id IS 'CNT, MOVISTAR, CLARO';


--
-- Name: COLUMN phones.type_id; Type: COMMENT; Schema: core; Owner: postgres
--

COMMENT ON COLUMN core.phones.type_id IS 'Celular, convencional, fax';


--
-- Name: phones_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.phones_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.phones_id_seq OWNER TO postgres;

--
-- Name: phones_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.phones_id_seq OWNED BY core.phones.id;


--
-- Name: socialmedia; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.socialmedia (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    icon character varying(255),
    logo character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE core.socialmedia OWNER TO postgres;

--
-- Name: socialmedia_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.socialmedia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.socialmedia_id_seq OWNER TO postgres;

--
-- Name: socialmedia_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.socialmedia_id_seq OWNED BY core.socialmedia.id;


--
-- Name: socialmediables; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.socialmediables (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    socialmediables_type character varying(255) NOT NULL,
    socialmediables_id bigint NOT NULL,
    socialmedia_id bigint NOT NULL,
    url character varying(255) NOT NULL,
    "user" character varying(255) NOT NULL
);


ALTER TABLE core.socialmediables OWNER TO postgres;

--
-- Name: socialmediables_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.socialmediables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.socialmediables_id_seq OWNER TO postgres;

--
-- Name: socialmediables_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.socialmediables_id_seq OWNED BY core.socialmediables.id;


--
-- Name: stateables; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.stateables (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    stateable_type character varying(255) NOT NULL,
    stateable_id bigint NOT NULL,
    state_id bigint NOT NULL
);


ALTER TABLE core.stateables OWNER TO postgres;

--
-- Name: stateables_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.stateables_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.stateables_id_seq OWNER TO postgres;

--
-- Name: stateables_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.stateables_id_seq OWNED BY core.stateables.id;


--
-- Name: states; Type: TABLE; Schema: core; Owner: postgres
--

CREATE TABLE core.states (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    code character varying(255) NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE core.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: core; Owner: postgres
--

CREATE SEQUENCE core.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE core.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: core; Owner: postgres
--

ALTER SEQUENCE core.states_id_seq OWNED BY core.states.id;


--
-- Name: agents; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.agents (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    test_id bigint NOT NULL,
    email character varying(255) NOT NULL,
    identification character varying(255) NOT NULL,
    lastname character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    phone character varying(255) NOT NULL
);


ALTER TABLE psychology.agents OWNER TO postgres;

--
-- Name: agents_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.agents_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.agents_id_seq OWNER TO postgres;

--
-- Name: agents_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.agents_id_seq OWNED BY psychology.agents.id;


--
-- Name: answers; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.answers (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    question_id bigint NOT NULL,
    class character varying(255),
    icon character varying(255),
    "order" integer,
    score integer NOT NULL,
    value text NOT NULL
);


ALTER TABLE psychology.answers OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.answers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.answers_id_seq OWNER TO postgres;

--
-- Name: answers_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.answers_id_seq OWNED BY psychology.answers.id;


--
-- Name: assignments; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.assignments (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    institution_id bigint NOT NULL,
    test_id bigint NOT NULL,
    user_id bigint NOT NULL,
    ended_at date,
    observations json,
    started_at date
);


ALTER TABLE psychology.assignments OWNER TO postgres;

--
-- Name: COLUMN assignments.user_id; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.assignments.user_id IS 'Para saber quien asignó';


--
-- Name: assignments_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.assignments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.assignments_id_seq OWNER TO postgres;

--
-- Name: assignments_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.assignments_id_seq OWNED BY psychology.assignments.id;


--
-- Name: catalogues; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.catalogues (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    parent_id bigint,
    code character varying(255) NOT NULL,
    description text,
    icon character varying(255),
    name text NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE psychology.catalogues OWNER TO postgres;

--
-- Name: COLUMN catalogues.parent_id; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.catalogues.parent_id IS 'Un catalogo puede tener catalogos hijos';


--
-- Name: COLUMN catalogues.code; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.catalogues.code IS 'No debe ser modificado una vez que se lo crea';


--
-- Name: COLUMN catalogues.icon; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.catalogues.icon IS 'Icono de la libreria que se usa en el frontend';


--
-- Name: COLUMN catalogues.type; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.catalogues.type IS 'Para categorizar los catalogos';


--
-- Name: catalogues_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.catalogues_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.catalogues_id_seq OWNER TO postgres;

--
-- Name: catalogues_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.catalogues_id_seq OWNED BY psychology.catalogues.id;


--
-- Name: institutions; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.institutions (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    address_id bigint,
    acronym character varying(255),
    code character varying(255) NOT NULL,
    denomination character varying(255),
    email character varying(255),
    logo character varying(255),
    name character varying(255) NOT NULL,
    phone character varying(255),
    short_name character varying(255) NOT NULL,
    slogan text,
    web character varying(255)
);


ALTER TABLE psychology.institutions OWNER TO postgres;

--
-- Name: COLUMN institutions.code; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.institutions.code IS 'Generado automaticamente por el acronym y el id ej: abc1';


--
-- Name: COLUMN institutions.email; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.institutions.email IS 'correo electronico principal';


--
-- Name: institutions_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.institutions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.institutions_id_seq OWNER TO postgres;

--
-- Name: institutions_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.institutions_id_seq OWNED BY psychology.institutions.id;


--
-- Name: priorities; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.priorities (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    description text,
    level integer NOT NULL,
    name character varying(255) NOT NULL,
    state boolean DEFAULT true NOT NULL
);


ALTER TABLE psychology.priorities OWNER TO postgres;

--
-- Name: priorities_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.priorities_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.priorities_id_seq OWNER TO postgres;

--
-- Name: priorities_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.priorities_id_seq OWNED BY psychology.priorities.id;


--
-- Name: questions; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.questions (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    "order" integer,
    type character varying(255) NOT NULL,
    value text NOT NULL,
    CONSTRAINT questions_type_check CHECK (((type)::text = ANY ((ARRAY['phq2'::character varying, 'phq9a'::character varying, 'psc17'::character varying, 'duel'::character varying])::text[])))
);


ALTER TABLE psychology.questions OWNER TO postgres;

--
-- Name: COLUMN questions.value; Type: COMMENT; Schema: psychology; Owner: postgres
--

COMMENT ON COLUMN psychology.questions.value IS 'El texto de la pregunta';


--
-- Name: questions_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.questions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.questions_id_seq OWNER TO postgres;

--
-- Name: questions_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.questions_id_seq OWNED BY psychology.questions.id;


--
-- Name: results; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.results (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    answer_id bigint NOT NULL,
    question_id bigint NOT NULL,
    test_id bigint NOT NULL
);


ALTER TABLE psychology.results OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.results_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.results_id_seq OWNER TO postgres;

--
-- Name: results_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.results_id_seq OWNED BY psychology.results.id;


--
-- Name: states; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.states (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    code character varying(255),
    description text,
    name character varying(255) NOT NULL,
    "order" integer NOT NULL,
    state boolean DEFAULT true NOT NULL,
    type character varying(255) NOT NULL
);


ALTER TABLE psychology.states OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.states_id_seq OWNER TO postgres;

--
-- Name: states_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.states_id_seq OWNED BY psychology.states.id;


--
-- Name: tests; Type: TABLE; Schema: psychology; Owner: postgres
--

CREATE TABLE psychology.tests (
    id bigint NOT NULL,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    deleted_at timestamp(0) without time zone,
    canton_id bigint NOT NULL,
    priority_id bigint,
    province_id bigint NOT NULL,
    state_id bigint NOT NULL,
    user_id bigint NOT NULL,
    age integer NOT NULL,
    code character varying(255),
    score integer DEFAULT 0 NOT NULL,
    terms_conditions boolean NOT NULL,
    type character varying(255) NOT NULL,
    CONSTRAINT tests_type_check CHECK (((type)::text = ANY ((ARRAY['phq9a'::character varying, 'psc17'::character varying])::text[])))
);


ALTER TABLE psychology.tests OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE; Schema: psychology; Owner: postgres
--

CREATE SEQUENCE psychology.tests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE psychology.tests_id_seq OWNER TO postgres;

--
-- Name: tests_id_seq; Type: SEQUENCE OWNED BY; Schema: psychology; Owner: postgres
--

ALTER SEQUENCE psychology.tests_id_seq OWNED BY psychology.tests.id;


--
-- Name: audits id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.audits ALTER COLUMN id SET DEFAULT nextval('authentication.audits_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.failed_jobs ALTER COLUMN id SET DEFAULT nextval('authentication.failed_jobs_id_seq'::regclass);


--
-- Name: menus id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.menus ALTER COLUMN id SET DEFAULT nextval('authentication.menus_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.migrations ALTER COLUMN id SET DEFAULT nextval('authentication.migrations_id_seq'::regclass);


--
-- Name: password_resets id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.password_resets ALTER COLUMN id SET DEFAULT nextval('authentication.password_resets_id_seq'::regclass);


--
-- Name: permissions id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.permissions ALTER COLUMN id SET DEFAULT nextval('authentication.permissions_id_seq'::regclass);


--
-- Name: personal_access_tokens id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.personal_access_tokens ALTER COLUMN id SET DEFAULT nextval('authentication.personal_access_tokens_id_seq'::regclass);


--
-- Name: roles id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.roles ALTER COLUMN id SET DEFAULT nextval('authentication.roles_id_seq'::regclass);


--
-- Name: systems id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.systems ALTER COLUMN id SET DEFAULT nextval('authentication.systems_id_seq'::regclass);


--
-- Name: transactional_codes id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.transactional_codes ALTER COLUMN id SET DEFAULT nextval('authentication.transactional_codes_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users ALTER COLUMN id SET DEFAULT nextval('authentication.users_id_seq'::regclass);


--
-- Name: address id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.address ALTER COLUMN id SET DEFAULT nextval('core.address_id_seq'::regclass);


--
-- Name: catalogues id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.catalogues ALTER COLUMN id SET DEFAULT nextval('core.catalogues_id_seq'::regclass);


--
-- Name: emails id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.emails ALTER COLUMN id SET DEFAULT nextval('core.emails_id_seq'::regclass);


--
-- Name: files id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.files ALTER COLUMN id SET DEFAULT nextval('core.files_id_seq'::regclass);


--
-- Name: images id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.images ALTER COLUMN id SET DEFAULT nextval('core.images_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.locations ALTER COLUMN id SET DEFAULT nextval('core.locations_id_seq'::regclass);


--
-- Name: phones id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.phones ALTER COLUMN id SET DEFAULT nextval('core.phones_id_seq'::regclass);


--
-- Name: socialmedia id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmedia ALTER COLUMN id SET DEFAULT nextval('core.socialmedia_id_seq'::regclass);


--
-- Name: socialmediables id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmediables ALTER COLUMN id SET DEFAULT nextval('core.socialmediables_id_seq'::regclass);


--
-- Name: stateables id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.stateables ALTER COLUMN id SET DEFAULT nextval('core.stateables_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.states ALTER COLUMN id SET DEFAULT nextval('core.states_id_seq'::regclass);


--
-- Name: agents id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.agents ALTER COLUMN id SET DEFAULT nextval('psychology.agents_id_seq'::regclass);


--
-- Name: answers id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.answers ALTER COLUMN id SET DEFAULT nextval('psychology.answers_id_seq'::regclass);


--
-- Name: assignments id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.assignments ALTER COLUMN id SET DEFAULT nextval('psychology.assignments_id_seq'::regclass);


--
-- Name: catalogues id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.catalogues ALTER COLUMN id SET DEFAULT nextval('psychology.catalogues_id_seq'::regclass);


--
-- Name: institutions id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.institutions ALTER COLUMN id SET DEFAULT nextval('psychology.institutions_id_seq'::regclass);


--
-- Name: priorities id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.priorities ALTER COLUMN id SET DEFAULT nextval('psychology.priorities_id_seq'::regclass);


--
-- Name: questions id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.questions ALTER COLUMN id SET DEFAULT nextval('psychology.questions_id_seq'::regclass);


--
-- Name: results id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.results ALTER COLUMN id SET DEFAULT nextval('psychology.results_id_seq'::regclass);


--
-- Name: states id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.states ALTER COLUMN id SET DEFAULT nextval('psychology.states_id_seq'::regclass);


--
-- Name: tests id; Type: DEFAULT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests ALTER COLUMN id SET DEFAULT nextval('psychology.tests_id_seq'::regclass);


--
-- Data for Name: audits; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.audits (id, user_type, user_id, event, auditable_type, auditable_id, old_values, new_values, url, ip_address, user_agent, tags, created_at, updated_at) FROM stdin;
1	\N	\N	created	App\\Models\\Authentication\\System	1	[]	{"code":"IGNUG","name":"Esquel - ChatBot","acronym":"Esquel","version":"2.2.3","redirect":"http:\\/\\/localhost:4200\\/#","date":"2022-02-15","state":true,"id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
2	\N	\N	created	App\\Models\\Core\\Catalogue	1	[]	{"code":"COUNTRY","name":"PAIS","type":"LOCATION","icon":"pi pi-check-circle","color":"#cab802","id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
3	\N	\N	created	App\\Models\\Core\\Catalogue	2	[]	{"code":"PROVINCE","name":"PROVINCIA","type":"LOCATION","icon":"pi pi-map-marker","color":"#cf34e9","id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
4	\N	\N	created	App\\Models\\Core\\Catalogue	3	[]	{"code":"CANTON","name":"CANTON","type":"LOCATION","icon":"pi pi-cloud-download","color":"#a24d5c","id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
5	\N	\N	created	App\\Models\\Core\\Catalogue	4	[]	{"code":"PARISH","name":"PARROQUIA","type":"LOCATION","icon":"pi pi-angle-right","color":"#17d5f8","id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
6	\N	\N	created	App\\Models\\Core\\Catalogue	5	[]	{"code":"CC","name":"CEDULA","type":"IDENTIFICATION_PROFESSIONAL_TYPE","icon":"pi pi-unlock","color":"#15a5f0","id":5}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
7	\N	\N	created	App\\Models\\Core\\Catalogue	6	[]	{"code":"PASSPORT","name":"PASAPORTE","type":"IDENTIFICATION_PROFESSIONAL_TYPE","icon":"pi pi-info","color":"#17bc37","id":6}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
8	\N	\N	created	App\\Models\\Core\\Catalogue	7	[]	{"code":"MALE","name":"HOMBRE","type":"SEX_TYPE","icon":"pi pi-step-forward-alt","color":"#8d8f47","id":7}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
9	\N	\N	created	App\\Models\\Core\\Catalogue	8	[]	{"code":"FEMALE","name":"MUJER","type":"SEX_TYPE","icon":"pi pi-mobile","color":"#c1d748","id":8}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
10	\N	\N	created	App\\Models\\Core\\Catalogue	9	[]	{"code":"MALE","name":"MASCULINO","type":"GENDER_TYPE","icon":"pi pi-book","color":"#57d29b","id":9}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
11	\N	\N	created	App\\Models\\Core\\Catalogue	10	[]	{"code":"FEMALE","name":"FEMENINO","type":"GENDER_TYPE","icon":"pi pi-search-minus","color":"#4f43b6","id":10}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
12	\N	\N	created	App\\Models\\Core\\Catalogue	11	[]	{"code":"OTHER","name":"OTRO","type":"GENDER_TYPE","icon":"pi pi-sort-alpha-up","color":"#a81286","id":11}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
13	\N	\N	created	App\\Models\\Core\\Catalogue	12	[]	{"code":"NOT_SAY","name":"PREFIERO NO DECIRLO","type":"GENDER_TYPE","icon":"pi pi-user-plus","color":"#3ccca4","id":12}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
14	\N	\N	created	App\\Models\\Core\\Catalogue	13	[]	{"code":"A-","name":"A-","type":"BLOOD_TYPE","icon":"pi pi-align-right","color":"#dc95ef","id":13}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
15	\N	\N	created	App\\Models\\Core\\Catalogue	14	[]	{"code":"A+","name":"A+","type":"BLOOD_TYPE","icon":"pi pi-key","color":"#c78660","id":14}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
16	\N	\N	created	App\\Models\\Core\\Catalogue	15	[]	{"code":"B-","name":"B-","type":"BLOOD_TYPE","icon":"pi pi-unlock","color":"#0429b7","id":15}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
17	\N	\N	created	App\\Models\\Core\\Catalogue	16	[]	{"code":"B+","name":"B+","type":"BLOOD_TYPE","icon":"pi pi-spinner","color":"#5a1710","id":16}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
18	\N	\N	created	App\\Models\\Core\\Catalogue	17	[]	{"code":"AB-","name":"AB-","type":"BLOOD_TYPE","icon":"pi pi-user","color":"#7d13d7","id":17}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
19	\N	\N	created	App\\Models\\Core\\Catalogue	18	[]	{"code":"AB+","name":"AB+","type":"BLOOD_TYPE","icon":"pi pi-thumbs-down","color":"#dd839d","id":18}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
20	\N	\N	created	App\\Models\\Core\\Catalogue	19	[]	{"code":"O-","name":"O-","type":"BLOOD_TYPE","icon":"pi pi-arrow-circle-down","color":"#0fd33e","id":19}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
21	\N	\N	created	App\\Models\\Core\\Catalogue	20	[]	{"code":"O+","name":"O+","type":"BLOOD_TYPE","icon":"pi pi-briefcase","color":"#02ca3a","id":20}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
22	\N	\N	created	App\\Models\\Core\\Catalogue	21	[]	{"code":"1","name":"INDIGENA","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-id-card","color":"#3460e3","id":21}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
23	\N	\N	created	App\\Models\\Core\\Catalogue	22	[]	{"code":"2","name":"AFROECUATORIANO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-users","color":"#4e36c5","id":22}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
24	\N	\N	created	App\\Models\\Core\\Catalogue	23	[]	{"code":"3","name":"NEGRO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-sort-alt","color":"#e657f4","id":23}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
25	\N	\N	created	App\\Models\\Core\\Catalogue	24	[]	{"code":"4","name":"MULATO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-angle-double-right","color":"#3f6a34","id":24}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
26	\N	\N	created	App\\Models\\Core\\Catalogue	25	[]	{"code":"5","name":"MONTUVIO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-sort-numeric-down","color":"#5398c6","id":25}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
27	\N	\N	created	App\\Models\\Core\\Catalogue	26	[]	{"code":"6","name":"MESTIZO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-comments","color":"#29b1dd","id":26}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
28	\N	\N	created	App\\Models\\Core\\Catalogue	27	[]	{"code":"7","name":"BLANCO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-calendar-times","color":"#4ecf79","id":27}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
29	\N	\N	created	App\\Models\\Core\\Catalogue	28	[]	{"code":"8","name":"OTRO","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-play","color":"#c2e0f8","id":28}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
30	\N	\N	created	App\\Models\\Core\\Catalogue	29	[]	{"code":"9","name":"NO REGISTRA","type":"ETHNIC_ORIGIN_TYPE","icon":"pi pi-angle-down","color":"#dd6d37","id":29}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
31	\N	\N	created	App\\Models\\Core\\Catalogue	30	[]	{"code":"MARRIED","name":"CASADO\\/A","type":"CIVIL_STATUS","icon":"pi pi-camera","color":"#eaa93d","id":30}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
32	\N	\N	created	App\\Models\\Core\\Catalogue	31	[]	{"code":"SINGLE","name":"SOLTERO\\/A","type":"CIVIL_STATUS","icon":"pi pi-sort","color":"#167894","id":31}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:20	2022-03-03 23:26:20
33	\N	\N	created	App\\Models\\Core\\Catalogue	32	[]	{"code":"DIVORCED","name":"DIVORCIADO\\/A","type":"CIVIL_STATUS","icon":"pi pi-backward","color":"#f952ee","id":32}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
34	\N	\N	created	App\\Models\\Core\\Catalogue	33	[]	{"code":"WIDOWER","name":"VIUDO\\/A","type":"CIVIL_STATUS","icon":"pi pi-chart-bar","color":"#a7a505","id":33}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
35	\N	\N	created	App\\Models\\Core\\Catalogue	34	[]	{"code":"UNION","name":"UNION DE HECHO","type":"CIVIL_STATUS","icon":"pi pi-sort-up","color":"#ed87d4","id":34}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
36	\N	\N	created	App\\Models\\Core\\Catalogue	35	[]	{"code":"05553594","name":"NORTE","type":"SECTOR","icon":"pi pi-upload","color":"#94897e","id":35}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
37	\N	\N	created	App\\Models\\Core\\Catalogue	36	[]	{"code":"73616962","name":"CENTRO","type":"SECTOR","icon":"pi pi-replay","color":"#968b38","id":36}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
38	\N	\N	created	App\\Models\\Core\\Catalogue	37	[]	{"code":"82194741","name":"SUR","type":"SECTOR","icon":"pi pi-arrow-circle-left","color":"#6c3489","id":37}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
39	\N	\N	created	App\\Models\\Core\\Catalogue	38	[]	{"code":"13237790","name":"CLARO","type":"PHONE_OPERATOR","icon":"pi pi-sign-out","color":"#c950d1","id":38}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
40	\N	\N	created	App\\Models\\Core\\Catalogue	39	[]	{"code":"26166148","name":"CNT","type":"PHONE_OPERATOR","icon":"pi pi-clone","color":"#2a989b","id":39}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
41	\N	\N	created	App\\Models\\Core\\Catalogue	40	[]	{"code":"97789659","name":"MOVISTAR","type":"PHONE_OPERATOR","icon":"pi pi-map-marker","color":"#3dc480","id":40}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
42	\N	\N	created	App\\Models\\Core\\Catalogue	41	[]	{"code":"73926962","name":"CELULAR","type":"PHONE_TYPE","icon":"pi pi-exclamation-triangle ","color":"#1dcf82","id":41}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
43	\N	\N	created	App\\Models\\Core\\Catalogue	42	[]	{"code":"96438459","name":"CONVENCIONAL","type":"PHONE_TYPE","icon":"pi pi-cloud-upload","color":"#5cd02d","id":42}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
44	\N	\N	created	App\\Models\\Core\\Catalogue	43	[]	{"code":"08007070","name":"FAX","type":"PHONE_TYPE","icon":"pi pi-shield","color":"#fd1c30","id":43}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
45	\N	\N	created	App\\Models\\Authentication\\User	1	[]	{"username":"1234567890","name":"DR. RILEY MCKENZIE II","lastname":"WALSH","email":"destiney77@example.com","phone":"518.747.4283","birthdate":"2003-07-14","email_verified_at":"2022-03-03 23:26:21","password":"$2y$10$yaPw7A6MOxvrYjPAR2fMh.54uUm3DrvDUHtbFSzcYuhzSSSL2aG.O","identification_type_id":5,"sex_id":7,"gender_id":12,"ethnic_origin_id":24,"blood_type_id":17,"civil_status_id":34,"id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
46	\N	\N	created	App\\Models\\Authentication\\User	2	[]	{"username":"1023379837","name":"CAROLE ROHAN II","lastname":"ROBERTS","email":"grayson.gaylord@example.net","phone":"+1 (754) 316-9529","birthdate":"2018-12-07","email_verified_at":"2022-03-03 23:26:21","password":"$2y$10$NHrBK\\/j26SlE\\/Qmhp5h8weVGRQZnoFxgm1vYzQFoFwXE3.5UGaJ\\/2","identification_type_id":6,"sex_id":8,"gender_id":10,"ethnic_origin_id":28,"blood_type_id":13,"civil_status_id":31,"id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:21	2022-03-03 23:26:21
47	\N	\N	created	App\\Models\\Authentication\\User	3	[]	{"username":"1041828856","name":"PROF. SISTER WHITE JR.","lastname":"MORISSETTE","email":"lulu.adams@example.net","phone":"989.643.1639","birthdate":"2009-09-10","email_verified_at":"2022-03-03 23:26:21","password":"$2y$10$5lxrtEGm4YNJmAMfFXCFDOfuEHhvo1ngfkfWUEqyb2Lzq3h9UfstG","identification_type_id":6,"sex_id":8,"gender_id":11,"ethnic_origin_id":27,"blood_type_id":20,"civil_status_id":32,"id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
48	\N	\N	created	App\\Models\\Authentication\\User	4	[]	{"username":"1004518599","name":"PROF. ENRICO BOYLE DDS","lastname":"GERLACH","email":"aryanna60@example.org","phone":"+1-279-956-6915","birthdate":"1991-12-12","email_verified_at":"2022-03-03 23:26:22","password":"$2y$10$GpUl3Ofm2TS8exyob9UOPuCQGRQIANByAroGIjxynUg07WQ0gzYZC","identification_type_id":5,"sex_id":7,"gender_id":11,"ethnic_origin_id":28,"blood_type_id":20,"civil_status_id":34,"id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
49	\N	\N	created	App\\Models\\Core\\State	1	[]	{"code":"da5a0050-2c4b-35db-8b46-09f0459afeef","name":"voluptatibus","id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
50	\N	\N	created	App\\Models\\Core\\State	2	[]	{"code":"158a859e-a4b7-3c4f-a151-f9bdde8878c2","name":"consequatur","id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
51	\N	\N	created	App\\Models\\Core\\State	3	[]	{"code":"5e3f6f15-bf23-3fed-a9a3-52a1542752fc","name":"non","id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
52	\N	\N	created	App\\Models\\Core\\State	4	[]	{"code":"89b78391-95f6-34f3-834e-5b6d9f2b6d06","name":"quasi","id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
53	\N	\N	created	App\\Models\\Core\\State	5	[]	{"code":"7685ff3d-2a9c-3ef9-990c-d58e261c0725","name":"magni","id":5}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
54	\N	\N	created	App\\Models\\Core\\State	6	[]	{"code":"4e01526f-326f-3f74-8a7b-20bd9f61110f","name":"harum","id":6}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
55	\N	\N	created	App\\Models\\Core\\State	7	[]	{"code":"94561cba-d337-3789-9775-3b3e40307db6","name":"ad","id":7}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
56	\N	\N	created	App\\Models\\Psychology\\State	1	[]	{"code":"NOT_ASSIGNED","name":"SIN ASIGNAR","order":1,"type":"App\\/Models\\/Psychology\\/Tests","id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
57	\N	\N	created	App\\Models\\Psychology\\State	2	[]	{"code":"ASSIGNED","name":"ASIGNADO","order":2,"type":"App\\/Models\\/Psychology\\/Tests","id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
58	\N	\N	created	App\\Models\\Psychology\\State	3	[]	{"code":"FINISHED","name":"CERRADO","order":3,"type":"App\\/Models\\/Psychology\\/Tests","id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
59	\N	\N	created	App\\Models\\Psychology\\Priority	1	[]	{"name":"Alta Intensidad","level":1,"id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
60	\N	\N	created	App\\Models\\Psychology\\Priority	2	[]	{"name":"Media Intensidad","level":2,"id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
61	\N	\N	created	App\\Models\\Psychology\\Priority	3	[]	{"name":"Baja Intensidad","level":3,"id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
62	\N	\N	created	App\\Models\\Psychology\\Priority	4	[]	{"name":"Sin Problemas","level":4,"id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
63	\N	\N	created	App\\Models\\Psychology\\Question	1	[]	{"type":"phq2","value":"En las \\u00faltimas dos semanas, \\u00bfte has sentido triste, deprimido o sin esperanzas?","order":1,"id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
64	\N	\N	created	App\\Models\\Psychology\\Question	2	[]	{"type":"phq2","value":"En las \\u00faltimas dos semanas, \\u00bfHas perdido el inter\\u00e9s o placer en hacer cosas que te hac\\u00edan sentir bien?","order":2,"id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
65	\N	\N	created	App\\Models\\Psychology\\Question	3	[]	{"type":"phq9a","value":"Si has perdido el inter\\u00e9s, las ganas o el placer en hacer las cosas, ay\\u00fadame a saber \\u00bfCu\\u00e1nto d\\u00edas te has sentido as\\u00ed en las \\u00faltimas dos semanas?","order":1,"id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
66	\N	\N	created	App\\Models\\Psychology\\Question	4	[]	{"type":"phq9a","value":"Si te has sentido desanimado, deprimido o triste\\/sin esperanza, ay\\u00fadame a saber \\u00bfCu\\u00e1nto d\\u00edas te has sentido as\\u00ed en las \\u00faltimas dos semanas?","order":2,"id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
67	\N	\N	created	App\\Models\\Psychology\\Question	5	[]	{"type":"phq9a","value":"\\u00bfHas tenido problemas para dormir o mantenerte dormido\\/a, o duermes demasiado?","order":3,"id":5}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
68	\N	\N	created	App\\Models\\Psychology\\Question	6	[]	{"type":"phq9a","value":"\\u00bfHas sentido poco apetito o has estado comiendo en exceso?","order":4,"id":6}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
69	\N	\N	created	App\\Models\\Psychology\\Question	7	[]	{"type":"phq9a","value":"\\u00bfTe has sentido cansado o con poca energ\\u00eda?","order":5,"id":7}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
70	\N	\N	created	App\\Models\\Psychology\\Question	8	[]	{"type":"phq9a","value":"\\u00bfTe sientes mal por t\\u00ed mismo\\/a, o has sentido que eres un\\/a fracasado\\/a, o que le has fallado a tu familia o a t\\u00ed mismo?","order":6,"id":8}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
71	\N	\N	created	App\\Models\\Psychology\\Question	9	[]	{"type":"phq9a","value":"\\u00bfTienes problemas para concentrarte en cosas tales como tareas escolares, leer, o ver televisi\\u00f3n?","order":7,"id":9}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
72	\N	\N	created	App\\Models\\Psychology\\Question	10	[]	{"type":"phq9a","value":"\\u00bfHas sentado muy tranquilo\\/a  que los dem\\u00e1s se han dado cuenta, o has estado muy intraquilo\\/a que las dem\\u00e1s personas han podido notarlo?","order":8,"id":10}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
73	\N	\N	created	App\\Models\\Psychology\\Question	11	[]	{"type":"phq9a","value":"\\u00bfHas tenido pensamientos de que ser\\u00eda mejor estar muerto\\/a o has querido hacerte da\\u00f1o de alguna forma?","order":9,"id":11}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
74	\N	\N	created	App\\Models\\Psychology\\Question	12	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfte has sentido inquieto o se te dificulta mantenerte sentado o calmado?","order":1,"id":12}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
75	\N	\N	created	App\\Models\\Psychology\\Question	13	[]	{"type":"psc17","value":"\\u00bfSue\\u00f1as despierto demasiado?","order":2,"id":13}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
76	\N	\N	created	App\\Models\\Psychology\\Question	14	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfte has sentido triste o infeliz?","order":3,"id":14}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
77	\N	\N	created	App\\Models\\Psychology\\Question	15	[]	{"type":"psc17","value":"\\u00bfTe niegas a compartir tus \\u00fatiles escolares o tus pertenencias?","order":4,"id":15}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
78	\N	\N	created	App\\Models\\Psychology\\Question	16	[]	{"type":"psc17","value":"\\u00bfSe te dificulta comprender los sentimientos de los dem\\u00e1s?","order":5,"id":16}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
79	\N	\N	created	App\\Models\\Psychology\\Question	17	[]	{"type":"psc17","value":"\\u00bfTe sientes sin esperanzas?","order":6,"id":17}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
80	\N	\N	created	App\\Models\\Psychology\\Question	18	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfhas tenido problemas para concentrarte?","order":7,"id":18}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
81	\N	\N	created	App\\Models\\Psychology\\Question	19	[]	{"type":"psc17","value":"\\u00bfTe peleas con otros j\\u00f3venes en tu colegio o tu barrio?","order":8,"id":19}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
82	\N	\N	created	App\\Models\\Psychology\\Question	20	[]	{"type":"psc17","value":"\\u00bfTe criticas a ti mismo?","order":9,"id":20}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
83	\N	\N	created	App\\Models\\Psychology\\Question	21	[]	{"type":"psc17","value":"\\u00bfCulpas a otros por tus problemas?","order":10,"id":21}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
84	\N	\N	created	App\\Models\\Psychology\\Question	22	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfparece que te diviertes menos?","order":11,"id":22}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
85	\N	\N	created	App\\Models\\Psychology\\Question	23	[]	{"type":"psc17","value":"Sientes que se te dificulta obedecer reglas","order":12,"id":23}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
86	\N	\N	created	App\\Models\\Psychology\\Question	24	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfte has sentido muy activo o con mucha energ\\u00eda?","order":13,"id":24}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
87	\N	\N	created	App\\Models\\Psychology\\Question	25	[]	{"type":"psc17","value":"\\u00bfMolestas o te burlas de otros?","order":14,"id":25}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
88	\N	\N	created	App\\Models\\Psychology\\Question	26	[]	{"type":"psc17","value":"En las \\u00faltimas dos semanas, \\u00bfte has sentido muy preocupado\\/a?","order":15,"id":26}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
89	\N	\N	created	App\\Models\\Psychology\\Question	27	[]	{"type":"psc17","value":"\\u00bfTomas cosas que no te pertenecen?","order":16,"id":27}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
90	\N	\N	created	App\\Models\\Psychology\\Question	28	[]	{"type":"psc17","value":"\\u00bfTe es d\\u00edficil mantener la atenci\\u00f3n o te distraes f\\u00e1cilmente?","order":17,"id":28}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
91	\N	\N	created	App\\Models\\Psychology\\Question	29	[]	{"type":"duel","value":"Durante la pandemia, \\u00bfalguna persona importante de tu entorno ha fallecido?","order":1,"id":29}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
92	\N	\N	created	App\\Models\\Psychology\\Answer	1	[]	{"class":"p-button-info","icon":null,"value":"SI","question_id":1,"score":1,"order":1,"id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
93	\N	\N	created	App\\Models\\Psychology\\Answer	2	[]	{"class":"p-button-help","icon":null,"value":"NO","question_id":1,"score":0,"order":2,"id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
94	\N	\N	created	App\\Models\\Psychology\\Answer	3	[]	{"class":"p-button-info","icon":null,"value":"SI","question_id":2,"score":1,"order":1,"id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
95	\N	\N	created	App\\Models\\Psychology\\Answer	4	[]	{"class":"p-button-help","icon":null,"value":"NO","question_id":2,"score":0,"order":2,"id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
96	\N	\N	created	App\\Models\\Psychology\\Answer	5	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":3,"order":1,"score":0,"id":5}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
97	\N	\N	created	App\\Models\\Psychology\\Answer	6	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":3,"order":2,"score":1,"id":6}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
98	\N	\N	created	App\\Models\\Psychology\\Answer	7	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":3,"order":3,"score":2,"id":7}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
99	\N	\N	created	App\\Models\\Psychology\\Answer	8	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":3,"order":4,"score":3,"id":8}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
100	\N	\N	created	App\\Models\\Psychology\\Answer	9	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":4,"order":1,"score":0,"id":9}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
101	\N	\N	created	App\\Models\\Psychology\\Answer	10	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":4,"order":2,"score":1,"id":10}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
102	\N	\N	created	App\\Models\\Psychology\\Answer	11	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":4,"order":3,"score":2,"id":11}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
103	\N	\N	created	App\\Models\\Psychology\\Answer	12	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":4,"order":4,"score":3,"id":12}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
104	\N	\N	created	App\\Models\\Psychology\\Answer	13	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":5,"order":1,"score":0,"id":13}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
105	\N	\N	created	App\\Models\\Psychology\\Answer	14	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":5,"order":2,"score":1,"id":14}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
106	\N	\N	created	App\\Models\\Psychology\\Answer	15	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":5,"order":3,"score":2,"id":15}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
107	\N	\N	created	App\\Models\\Psychology\\Answer	16	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":5,"order":4,"score":3,"id":16}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
108	\N	\N	created	App\\Models\\Psychology\\Answer	17	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":6,"order":1,"score":0,"id":17}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
109	\N	\N	created	App\\Models\\Psychology\\Answer	18	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":6,"order":2,"score":1,"id":18}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
110	\N	\N	created	App\\Models\\Psychology\\Answer	19	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":6,"order":3,"score":2,"id":19}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
111	\N	\N	created	App\\Models\\Psychology\\Answer	20	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":6,"order":4,"score":3,"id":20}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
112	\N	\N	created	App\\Models\\Psychology\\Answer	21	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":7,"order":1,"score":0,"id":21}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
113	\N	\N	created	App\\Models\\Psychology\\Answer	22	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":7,"order":2,"score":1,"id":22}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
114	\N	\N	created	App\\Models\\Psychology\\Answer	23	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":7,"order":3,"score":2,"id":23}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
115	\N	\N	created	App\\Models\\Psychology\\Answer	24	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":7,"order":4,"score":3,"id":24}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
116	\N	\N	created	App\\Models\\Psychology\\Answer	25	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":8,"order":1,"score":0,"id":25}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
117	\N	\N	created	App\\Models\\Psychology\\Answer	26	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":8,"order":2,"score":1,"id":26}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
118	\N	\N	created	App\\Models\\Psychology\\Answer	27	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":8,"order":3,"score":2,"id":27}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
119	\N	\N	created	App\\Models\\Psychology\\Answer	28	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":8,"order":4,"score":3,"id":28}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
120	\N	\N	created	App\\Models\\Psychology\\Answer	29	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":9,"order":1,"score":0,"id":29}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
121	\N	\N	created	App\\Models\\Psychology\\Answer	30	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":9,"order":2,"score":1,"id":30}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
122	\N	\N	created	App\\Models\\Psychology\\Answer	31	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":9,"order":3,"score":2,"id":31}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
123	\N	\N	created	App\\Models\\Psychology\\Answer	32	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":9,"order":4,"score":3,"id":32}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
124	\N	\N	created	App\\Models\\Psychology\\Answer	33	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":10,"order":1,"score":0,"id":33}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
125	\N	\N	created	App\\Models\\Psychology\\Answer	34	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":10,"order":2,"score":1,"id":34}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
126	\N	\N	created	App\\Models\\Psychology\\Answer	35	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":10,"order":3,"score":2,"id":35}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
127	\N	\N	created	App\\Models\\Psychology\\Answer	36	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":10,"order":4,"score":3,"id":36}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
128	\N	\N	created	App\\Models\\Psychology\\Answer	37	[]	{"class":"p-button-info","icon":null,"value":"Para nada","question_id":11,"order":1,"score":0,"id":37}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
129	\N	\N	created	App\\Models\\Psychology\\Answer	38	[]	{"class":"p-button-help","icon":null,"value":"Varios d\\u00edas (entre 1 a 6 d\\u00edas)","question_id":11,"order":2,"score":1,"id":38}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
157	\N	\N	created	App\\Models\\Psychology\\Answer	66	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":20,"order":2,"score":1,"id":66}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
130	\N	\N	created	App\\Models\\Psychology\\Answer	39	[]	{"class":"p-button-warning","icon":null,"value":"La mitad de los d\\u00edas o m\\u00e1s (entre 7 y 11 d\\u00edas)","question_id":11,"order":3,"score":2,"id":39}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
131	\N	\N	created	App\\Models\\Psychology\\Answer	40	[]	{"class":"p-button-secondary","icon":null,"value":"Casi todos los d\\u00edas (12 d\\u00edas o m\\u00e1s)","question_id":11,"order":4,"score":3,"id":40}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
132	\N	\N	created	App\\Models\\Psychology\\Answer	41	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":12,"order":1,"score":0,"id":41}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
133	\N	\N	created	App\\Models\\Psychology\\Answer	42	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":12,"order":2,"score":1,"id":42}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
134	\N	\N	created	App\\Models\\Psychology\\Answer	43	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":12,"order":3,"score":2,"id":43}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
135	\N	\N	created	App\\Models\\Psychology\\Answer	44	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":13,"order":1,"score":0,"id":44}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
136	\N	\N	created	App\\Models\\Psychology\\Answer	45	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":13,"order":2,"score":1,"id":45}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
137	\N	\N	created	App\\Models\\Psychology\\Answer	46	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":13,"order":3,"score":2,"id":46}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
138	\N	\N	created	App\\Models\\Psychology\\Answer	47	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":14,"order":1,"score":0,"id":47}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
139	\N	\N	created	App\\Models\\Psychology\\Answer	48	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":14,"order":2,"score":1,"id":48}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
140	\N	\N	created	App\\Models\\Psychology\\Answer	49	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":14,"order":3,"score":2,"id":49}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
141	\N	\N	created	App\\Models\\Psychology\\Answer	50	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":15,"order":1,"score":0,"id":50}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
142	\N	\N	created	App\\Models\\Psychology\\Answer	51	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":15,"order":2,"score":1,"id":51}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
143	\N	\N	created	App\\Models\\Psychology\\Answer	52	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":15,"order":3,"score":2,"id":52}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
144	\N	\N	created	App\\Models\\Psychology\\Answer	53	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":16,"order":1,"score":0,"id":53}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:22	2022-03-03 23:26:22
145	\N	\N	created	App\\Models\\Psychology\\Answer	54	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":16,"order":2,"score":1,"id":54}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
146	\N	\N	created	App\\Models\\Psychology\\Answer	55	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":16,"order":3,"score":2,"id":55}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
147	\N	\N	created	App\\Models\\Psychology\\Answer	56	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":17,"order":1,"score":0,"id":56}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
148	\N	\N	created	App\\Models\\Psychology\\Answer	57	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":17,"order":2,"score":1,"id":57}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
149	\N	\N	created	App\\Models\\Psychology\\Answer	58	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":17,"order":3,"score":2,"id":58}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
150	\N	\N	created	App\\Models\\Psychology\\Answer	59	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":18,"order":1,"score":0,"id":59}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
151	\N	\N	created	App\\Models\\Psychology\\Answer	60	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":18,"order":2,"score":1,"id":60}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
152	\N	\N	created	App\\Models\\Psychology\\Answer	61	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":18,"order":3,"score":2,"id":61}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
153	\N	\N	created	App\\Models\\Psychology\\Answer	62	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":19,"order":1,"score":0,"id":62}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
154	\N	\N	created	App\\Models\\Psychology\\Answer	63	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":19,"order":2,"score":1,"id":63}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
155	\N	\N	created	App\\Models\\Psychology\\Answer	64	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":19,"order":3,"score":2,"id":64}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
156	\N	\N	created	App\\Models\\Psychology\\Answer	65	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":20,"order":1,"score":0,"id":65}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
158	\N	\N	created	App\\Models\\Psychology\\Answer	67	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":20,"order":3,"score":2,"id":67}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
159	\N	\N	created	App\\Models\\Psychology\\Answer	68	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":21,"order":1,"score":0,"id":68}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
160	\N	\N	created	App\\Models\\Psychology\\Answer	69	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":21,"order":2,"score":1,"id":69}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
161	\N	\N	created	App\\Models\\Psychology\\Answer	70	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":21,"order":3,"score":2,"id":70}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
162	\N	\N	created	App\\Models\\Psychology\\Answer	71	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":22,"order":1,"score":0,"id":71}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
163	\N	\N	created	App\\Models\\Psychology\\Answer	72	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":22,"order":2,"score":1,"id":72}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
164	\N	\N	created	App\\Models\\Psychology\\Answer	73	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":22,"order":3,"score":2,"id":73}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
165	\N	\N	created	App\\Models\\Psychology\\Answer	74	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":23,"order":1,"score":0,"id":74}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
166	\N	\N	created	App\\Models\\Psychology\\Answer	75	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":23,"order":2,"score":1,"id":75}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
167	\N	\N	created	App\\Models\\Psychology\\Answer	76	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":23,"order":3,"score":2,"id":76}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
168	\N	\N	created	App\\Models\\Psychology\\Answer	77	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":24,"order":1,"score":0,"id":77}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
169	\N	\N	created	App\\Models\\Psychology\\Answer	78	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":24,"order":2,"score":1,"id":78}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
170	\N	\N	created	App\\Models\\Psychology\\Answer	79	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":24,"order":3,"score":2,"id":79}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
171	\N	\N	created	App\\Models\\Psychology\\Answer	80	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":25,"order":1,"score":0,"id":80}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
172	\N	\N	created	App\\Models\\Psychology\\Answer	81	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":25,"order":2,"score":1,"id":81}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
173	\N	\N	created	App\\Models\\Psychology\\Answer	82	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":25,"order":3,"score":2,"id":82}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
174	\N	\N	created	App\\Models\\Psychology\\Answer	83	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":26,"order":1,"score":0,"id":83}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
175	\N	\N	created	App\\Models\\Psychology\\Answer	84	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":26,"order":2,"score":1,"id":84}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
176	\N	\N	created	App\\Models\\Psychology\\Answer	85	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":26,"order":3,"score":2,"id":85}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
177	\N	\N	created	App\\Models\\Psychology\\Answer	86	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":27,"order":1,"score":0,"id":86}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
178	\N	\N	created	App\\Models\\Psychology\\Answer	87	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":27,"order":2,"score":1,"id":87}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
179	\N	\N	created	App\\Models\\Psychology\\Answer	88	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":27,"order":3,"score":2,"id":88}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
180	\N	\N	created	App\\Models\\Psychology\\Answer	89	[]	{"class":"p-button-info","icon":null,"value":"Nunca","question_id":28,"order":1,"score":0,"id":89}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
181	\N	\N	created	App\\Models\\Psychology\\Answer	90	[]	{"class":"p-button-help","icon":null,"value":"Algunas veces","question_id":28,"order":2,"score":1,"id":90}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
182	\N	\N	created	App\\Models\\Psychology\\Answer	91	[]	{"class":"p-button-warning","icon":null,"value":"Frecuentemente","question_id":28,"order":3,"score":2,"id":91}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
183	\N	\N	created	App\\Models\\Psychology\\Answer	92	[]	{"class":"p-button-info","icon":null,"value":"SI","question_id":29,"order":1,"score":1,"id":92}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
184	\N	\N	created	App\\Models\\Psychology\\Answer	93	[]	{"class":"p-button-help","icon":null,"value":"NO","question_id":29,"order":2,"score":0,"id":93}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
185	\N	\N	created	App\\Models\\Psychology\\Institution	1	[]	{"code":"ABC1","denomination":"48212908","email":"oceane71@steuber.info","phone":"+1 (217) 280-7638","web":"http:\\/\\/gutkowski.biz\\/vel-quos-velit-est-vitae-quo-architecto-quia","name":"ORGAEPSI","short_name":"ORGAEPSI","acronym":"ORGAEPSI","id":1}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
186	\N	\N	created	App\\Models\\Psychology\\Institution	2	[]	{"code":"ABC2","denomination":"91607652","email":"fabiola.leuschke@reilly.net","phone":"984.285.1413","web":"http:\\/\\/schamberger.com\\/","name":"PUCE","short_name":"PUCE","acronym":"PUCE","id":2}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
187	\N	\N	created	App\\Models\\Psychology\\Institution	3	[]	{"code":"ABC3","denomination":"75141646","email":"hulda.borer@hagenes.com","phone":"1-283-339-2252","web":"http:\\/\\/schulist.biz\\/aut-sint-sunt-mollitia-repellendus-nam-sunt","name":"SEK","short_name":"SEK","acronym":"SEK","id":3}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
188	\N	\N	created	App\\Models\\Psychology\\Institution	4	[]	{"code":"ABC4","denomination":"62495394","email":"huels.iva@nicolas.net","phone":"740-683-7564","web":"http:\\/\\/www.homenick.com\\/possimus-quasi-dolor-ex","name":"INDOAMERICA","short_name":"INDOAMERICA","acronym":"INDOAMERICA","id":4}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
189	\N	\N	created	App\\Models\\Psychology\\Institution	5	[]	{"code":"ABC5","denomination":"79387873","email":"monserrat.hoeger@oreilly.info","phone":"773-865-2096","web":"http:\\/\\/oconner.net\\/non-quis-sint-architecto-non","name":"ESPOCH","short_name":"ESPOCH","acronym":"ESPOCH","id":5}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
190	\N	\N	created	App\\Models\\Psychology\\Institution	6	[]	{"code":"ABC6","denomination":"12494507","email":"jaden21@reynolds.net","phone":"+1.458.673.2765","web":"http:\\/\\/stokes.com\\/aut-aliquid-porro-quis-enim-earum","name":"UNACH","short_name":"UNACH","acronym":"UNACH","id":6}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
191	\N	\N	created	App\\Models\\Psychology\\Institution	7	[]	{"code":"ABC7","denomination":"57685403","email":"athena35@bogan.info","phone":"1-484-928-6534","web":"http:\\/\\/www.jacobs.org\\/quae-nihil-atque-sunt-maxime-commodi","name":"MSP","short_name":"MSP","acronym":"MSP","id":7}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
192	\N	\N	created	App\\Models\\Psychology\\Institution	8	[]	{"code":"ABC8","denomination":"64542034","email":"nkuhic@leuschke.com","phone":"1-959-902-2548","web":"http:\\/\\/reichel.org\\/","name":"OTROS","short_name":"OTROS","acronym":"OTROS","id":8}	https://api.temi.esquel.org.ec/api/v1/init	10.128.0.14	PostmanRuntime/7.29.0	\N	2022-03-03 23:26:23	2022-03-03 23:26:23
193	App\\Models\\Authentication\\User	1	updated	App\\Models\\Authentication\\User	3	{"suspended":false}	{"suspended":true}	https://api.temi.esquel.org.ec/api/v1/users/3/suspend?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	\N	2022-03-03 23:26:56	2022-03-03 23:26:56
194	App\\Models\\Authentication\\User	1	updated	App\\Models\\Authentication\\User	3	{"suspended":true}	{"suspended":false}	https://api.temi.esquel.org.ec/api/v1/users/3/reactive?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	\N	2022-03-03 23:27:00	2022-03-03 23:27:00
195	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	1	[]	{"username":"ldfjdfjasld.oqijrqrewf@jldfsa.caom","token":7529,"id":1}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-03 23:29:49	2022-03-03 23:29:49
196	\N	\N	created	App\\Models\\Authentication\\User	5	[]	{"name":"CESAR MAURICIO","email":"cesar.tamayo0204@gmail.com","lastname":"TAMAYO LOPEZ","username":"172490443","phone":"0982417259","password":"$2y$10$xz6jCdbEHjkwXDeejFywK.GqfKE1\\/Eas.W69CJ.V0Q3S21Sl1Q5.i","id":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
197	\N	\N	created	App\\Models\\Psychology\\Test	1	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":5,"age":18,"terms_conditions":true,"type":"phq9a","id":1}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
198	\N	\N	created	App\\Models\\Psychology\\Result	1	[]	{"answer_id":1,"question_id":1,"test_id":1,"id":1}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
199	\N	\N	created	App\\Models\\Psychology\\Result	2	[]	{"answer_id":4,"question_id":2,"test_id":1,"id":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
200	\N	\N	created	App\\Models\\Psychology\\Result	3	[]	{"answer_id":7,"question_id":3,"test_id":1,"id":3}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
201	\N	\N	created	App\\Models\\Psychology\\Result	4	[]	{"answer_id":10,"question_id":4,"test_id":1,"id":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
202	\N	\N	created	App\\Models\\Psychology\\Result	5	[]	{"answer_id":15,"question_id":5,"test_id":1,"id":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
203	\N	\N	created	App\\Models\\Psychology\\Result	6	[]	{"answer_id":18,"question_id":6,"test_id":1,"id":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
204	\N	\N	created	App\\Models\\Psychology\\Result	7	[]	{"answer_id":23,"question_id":7,"test_id":1,"id":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
205	\N	\N	created	App\\Models\\Psychology\\Result	8	[]	{"answer_id":26,"question_id":8,"test_id":1,"id":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
206	\N	\N	created	App\\Models\\Psychology\\Result	9	[]	{"answer_id":31,"question_id":9,"test_id":1,"id":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
207	\N	\N	created	App\\Models\\Psychology\\Result	10	[]	{"answer_id":34,"question_id":10,"test_id":1,"id":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
208	\N	\N	created	App\\Models\\Psychology\\Result	11	[]	{"answer_id":39,"question_id":11,"test_id":1,"id":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
209	\N	\N	created	App\\Models\\Psychology\\Result	12	[]	{"answer_id":92,"question_id":29,"test_id":1,"id":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:05	2022-03-03 23:49:05
210	\N	\N	updated	App\\Models\\Psychology\\Test	1	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-1-172490443","score":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:49:07	2022-03-03 23:49:07
211	App\\Models\\Authentication\\User	2	updated	App\\Models\\Psychology\\Test	1	{"state_id":1}	{"state_id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/3/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	\N	2022-03-03 23:50:16	2022-03-03 23:50:16
212	App\\Models\\Authentication\\User	2	created	App\\Models\\Psychology\\Assignment	1	[]	{"institution_id":3,"test_id":1,"user_id":2,"started_at":"2022-03-04T04:50:16.197474Z","id":1}	https://api.temi.esquel.org.ec/api/v1/institutions/3/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	\N	2022-03-03 23:50:16	2022-03-03 23:50:16
213	App\\Models\\Authentication\\User	2	updated	App\\Models\\Psychology\\Test	1	{"state_id":2}	{"state_id":3}	https://api.temi.esquel.org.ec/api/v1/tests/1/close?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	\N	2022-03-03 23:50:30	2022-03-03 23:50:30
214	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	2	[]	{"username":"cesar.tamayo0204@gmail.com","token":9524,"id":2}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-03 23:55:53	2022-03-03 23:55:53
215	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	3	[]	{"username":"cesar.tamayo0204@gmail.com","token":7638,"id":3}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-03 23:57:50	2022-03-03 23:57:50
216	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	4	[]	{"username":"cesar.tamayo0204@gmail.com","token":4618,"id":4}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 00:01:04	2022-03-04 00:01:04
217	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	5	[]	{"username":"cesar.tamayo0204@gmail.com","token":9869,"id":5}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-04 00:01:24	2022-03-04 00:01:24
218	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	5	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-04 00:01:58	2022-03-04 00:01:58
219	\N	\N	created	App\\Models\\Authentication\\User	6	[]	{"name":"ASD ASDASD","email":"","lastname":"ASD ASD","username":"12123423","phone":"","password":"$2y$10$qz0B0Ly08cNb70GYMDoevOw2ed3I\\/q2xtOI3u5m97aO1Cnc.\\/jId.","id":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
220	\N	\N	created	App\\Models\\Psychology\\Test	2	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":6,"age":12,"terms_conditions":true,"type":"phq9a","id":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
221	\N	\N	created	App\\Models\\Psychology\\Result	13	[]	{"answer_id":1,"question_id":1,"test_id":2,"id":13}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
222	\N	\N	created	App\\Models\\Psychology\\Result	14	[]	{"answer_id":4,"question_id":2,"test_id":2,"id":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
723	\N	\N	created	App\\Models\\Psychology\\Result	371	[]	{"answer_id":21,"question_id":7,"test_id":27,"id":371}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
223	\N	\N	created	App\\Models\\Psychology\\Result	15	[]	{"answer_id":7,"question_id":3,"test_id":2,"id":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
224	\N	\N	created	App\\Models\\Psychology\\Result	16	[]	{"answer_id":11,"question_id":4,"test_id":2,"id":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
225	\N	\N	created	App\\Models\\Psychology\\Result	17	[]	{"answer_id":16,"question_id":5,"test_id":2,"id":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
226	\N	\N	created	App\\Models\\Psychology\\Result	18	[]	{"answer_id":18,"question_id":6,"test_id":2,"id":18}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
227	\N	\N	created	App\\Models\\Psychology\\Result	19	[]	{"answer_id":23,"question_id":7,"test_id":2,"id":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
228	\N	\N	created	App\\Models\\Psychology\\Result	20	[]	{"answer_id":28,"question_id":8,"test_id":2,"id":20}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
229	\N	\N	created	App\\Models\\Psychology\\Result	21	[]	{"answer_id":32,"question_id":9,"test_id":2,"id":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
230	\N	\N	created	App\\Models\\Psychology\\Result	22	[]	{"answer_id":35,"question_id":10,"test_id":2,"id":22}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
231	\N	\N	created	App\\Models\\Psychology\\Result	23	[]	{"answer_id":39,"question_id":11,"test_id":2,"id":23}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
232	\N	\N	created	App\\Models\\Psychology\\Result	24	[]	{"answer_id":93,"question_id":29,"test_id":2,"id":24}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:06	2022-03-04 00:03:06
233	\N	\N	updated	App\\Models\\Psychology\\Test	2	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-2-12123423","score":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:32	2022-03-04 00:03:32
234	\N	\N	created	App\\Models\\Psychology\\Agent	1	[]	{"test_id":2,"email":"cesar.tamayo0204@gmail.com","identification":1234567893,"lastname":"asd asd","name":"asd asd","phone":"123123123","id":1}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_1 like Mac OS X) AppleWebKit/603.1.30 (KHTML, like Gecko) Version/10.0 Mobile/14E304 Safari/602.1	\N	2022-03-04 00:03:32	2022-03-04 00:03:32
235	App\\Models\\Authentication\\User	2	updated	App\\Models\\Psychology\\Test	2	{"state_id":1}	{"state_id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/1/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-04 00:07:02	2022-03-04 00:07:02
236	App\\Models\\Authentication\\User	2	created	App\\Models\\Psychology\\Assignment	2	[]	{"institution_id":1,"test_id":2,"user_id":2,"started_at":"2022-03-04T05:07:02.903866Z","id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/1/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-04 00:07:02	2022-03-04 00:07:02
237	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	6	[]	{"username":"samia.cgarcia@gmail.com","token":9878,"id":6}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:08:10	2022-03-04 09:08:10
238	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	6	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:09:25	2022-03-04 09:09:25
239	\N	\N	created	App\\Models\\Authentication\\User	7	[]	{"name":"JAJAJAJA","email":"","lastname":"SAMIA","username":"1724581228","phone":"","password":"$2y$10$AsaVFV\\/a0Ui5K4RkcauVmOAw9fPKaGVjEszW\\/K2xcG.TbxozOBcau","id":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
240	\N	\N	created	App\\Models\\Psychology\\Test	3	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":7,"age":16,"terms_conditions":true,"type":"psc17","id":3}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
241	\N	\N	created	App\\Models\\Psychology\\Result	25	[]	{"answer_id":2,"question_id":1,"test_id":3,"id":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
242	\N	\N	created	App\\Models\\Psychology\\Result	26	[]	{"answer_id":4,"question_id":2,"test_id":3,"id":26}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
243	\N	\N	created	App\\Models\\Psychology\\Result	27	[]	{"answer_id":42,"question_id":12,"test_id":3,"id":27}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
244	\N	\N	created	App\\Models\\Psychology\\Result	28	[]	{"answer_id":45,"question_id":13,"test_id":3,"id":28}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
245	\N	\N	created	App\\Models\\Psychology\\Result	29	[]	{"answer_id":48,"question_id":14,"test_id":3,"id":29}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
246	\N	\N	created	App\\Models\\Psychology\\Result	30	[]	{"answer_id":50,"question_id":15,"test_id":3,"id":30}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
247	\N	\N	created	App\\Models\\Psychology\\Result	31	[]	{"answer_id":53,"question_id":16,"test_id":3,"id":31}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
248	\N	\N	created	App\\Models\\Psychology\\Result	32	[]	{"answer_id":56,"question_id":17,"test_id":3,"id":32}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
249	\N	\N	created	App\\Models\\Psychology\\Result	33	[]	{"answer_id":59,"question_id":18,"test_id":3,"id":33}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
250	\N	\N	created	App\\Models\\Psychology\\Result	34	[]	{"answer_id":62,"question_id":19,"test_id":3,"id":34}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
251	\N	\N	created	App\\Models\\Psychology\\Result	35	[]	{"answer_id":66,"question_id":20,"test_id":3,"id":35}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
252	\N	\N	created	App\\Models\\Psychology\\Result	36	[]	{"answer_id":68,"question_id":21,"test_id":3,"id":36}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
253	\N	\N	created	App\\Models\\Psychology\\Result	37	[]	{"answer_id":71,"question_id":22,"test_id":3,"id":37}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
254	\N	\N	created	App\\Models\\Psychology\\Result	38	[]	{"answer_id":74,"question_id":23,"test_id":3,"id":38}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
255	\N	\N	created	App\\Models\\Psychology\\Result	39	[]	{"answer_id":77,"question_id":24,"test_id":3,"id":39}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
256	\N	\N	created	App\\Models\\Psychology\\Result	40	[]	{"answer_id":80,"question_id":25,"test_id":3,"id":40}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
257	\N	\N	created	App\\Models\\Psychology\\Result	41	[]	{"answer_id":83,"question_id":26,"test_id":3,"id":41}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
258	\N	\N	created	App\\Models\\Psychology\\Result	42	[]	{"answer_id":86,"question_id":27,"test_id":3,"id":42}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
259	\N	\N	created	App\\Models\\Psychology\\Result	43	[]	{"answer_id":89,"question_id":28,"test_id":3,"id":43}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
260	\N	\N	created	App\\Models\\Psychology\\Result	44	[]	{"answer_id":92,"question_id":29,"test_id":3,"id":44}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:38	2022-03-04 09:12:38
261	\N	\N	updated	App\\Models\\Psychology\\Test	3	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-3-1724581228","score":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:39	2022-03-04 09:12:39
262	\N	\N	created	App\\Models\\Psychology\\Agent	2	[]	{"test_id":3,"email":"samia.cgarcia@gmail.com","identification":1724581218,"lastname":"Najdjaks","name":"Jsjajaja @1!,72&\\/","phone":"0192737281","id":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-04 09:12:39	2022-03-04 09:12:39
282	\N	\N	created	App\\Models\\Psychology\\Result	61	[]	{"answer_id":83,"question_id":26,"test_id":4,"id":61}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
263	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	8	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"1712728060","password":"$2y$10$ewiOLZXdhhkheX4sZtGRNOqeoR6wEysxuFfxUAT2GvWyREHVSA516","name":"PABLO","lastname":"ROBAYO","birthdate":null,"email":"pablorobayo@gmail.com","id":8}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 OPR/83.0.4254.54	\N	2022-03-04 20:30:01	2022-03-04 20:30:01
264	\N	\N	updated	App\\Models\\Authentication\\User	8	{"lastname":"ROBAYO","name":"PABLO","password":"$2y$10$ewiOLZXdhhkheX4sZtGRNOqeoR6wEysxuFfxUAT2GvWyREHVSA516","phone":null}	{"lastname":"ROBAYO CASTELLANOS","name":"PABLO JAVIER","password":"$2y$10$oN60QK\\/geU0imai0psUNXOvkDaQS66MrOfrAsMLb6LbYPypWO497G","phone":"0999705620"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
265	\N	\N	created	App\\Models\\Psychology\\Test	4	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":8,"age":18,"terms_conditions":true,"type":"psc17","id":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
266	\N	\N	created	App\\Models\\Psychology\\Result	45	[]	{"answer_id":2,"question_id":1,"test_id":4,"id":45}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
267	\N	\N	created	App\\Models\\Psychology\\Result	46	[]	{"answer_id":4,"question_id":2,"test_id":4,"id":46}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
268	\N	\N	created	App\\Models\\Psychology\\Result	47	[]	{"answer_id":42,"question_id":12,"test_id":4,"id":47}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
269	\N	\N	created	App\\Models\\Psychology\\Result	48	[]	{"answer_id":44,"question_id":13,"test_id":4,"id":48}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
270	\N	\N	created	App\\Models\\Psychology\\Result	49	[]	{"answer_id":47,"question_id":14,"test_id":4,"id":49}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
271	\N	\N	created	App\\Models\\Psychology\\Result	50	[]	{"answer_id":51,"question_id":15,"test_id":4,"id":50}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
272	\N	\N	created	App\\Models\\Psychology\\Result	51	[]	{"answer_id":54,"question_id":16,"test_id":4,"id":51}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
273	\N	\N	created	App\\Models\\Psychology\\Result	52	[]	{"answer_id":56,"question_id":17,"test_id":4,"id":52}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
274	\N	\N	created	App\\Models\\Psychology\\Result	53	[]	{"answer_id":59,"question_id":18,"test_id":4,"id":53}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
275	\N	\N	created	App\\Models\\Psychology\\Result	54	[]	{"answer_id":63,"question_id":19,"test_id":4,"id":54}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
276	\N	\N	created	App\\Models\\Psychology\\Result	55	[]	{"answer_id":65,"question_id":20,"test_id":4,"id":55}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
277	\N	\N	created	App\\Models\\Psychology\\Result	56	[]	{"answer_id":68,"question_id":21,"test_id":4,"id":56}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
278	\N	\N	created	App\\Models\\Psychology\\Result	57	[]	{"answer_id":73,"question_id":22,"test_id":4,"id":57}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
279	\N	\N	created	App\\Models\\Psychology\\Result	58	[]	{"answer_id":75,"question_id":23,"test_id":4,"id":58}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
280	\N	\N	created	App\\Models\\Psychology\\Result	59	[]	{"answer_id":79,"question_id":24,"test_id":4,"id":59}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
281	\N	\N	created	App\\Models\\Psychology\\Result	60	[]	{"answer_id":80,"question_id":25,"test_id":4,"id":60}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
283	\N	\N	created	App\\Models\\Psychology\\Result	62	[]	{"answer_id":86,"question_id":27,"test_id":4,"id":62}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
284	\N	\N	created	App\\Models\\Psychology\\Result	63	[]	{"answer_id":90,"question_id":28,"test_id":4,"id":63}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
285	\N	\N	created	App\\Models\\Psychology\\Result	64	[]	{"answer_id":93,"question_id":29,"test_id":4,"id":64}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
286	\N	\N	updated	App\\Models\\Psychology\\Test	4	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"17-4-1712728060","score":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; SM-N975F) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-04 20:51:48	2022-03-04 20:51:48
287	\N	\N	created	App\\Models\\Authentication\\User	9	[]	{"name":"CESAR MAURICIO","email":"cesar.tamayo0204@gmail.com","lastname":"TAMAYO LOPEZ","username":"1724909443","phone":"0982417259","password":"$2y$10$6wTeArGkWHP3OvzIwIiFAOeDZJR2QxV8H\\/fQzqC0hG1g.Gjp4Op4u","id":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
288	\N	\N	created	App\\Models\\Psychology\\Test	5	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":9,"age":18,"terms_conditions":true,"type":"phq9a","id":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
289	\N	\N	created	App\\Models\\Psychology\\Result	65	[]	{"answer_id":2,"question_id":1,"test_id":5,"id":65}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
290	\N	\N	created	App\\Models\\Psychology\\Result	66	[]	{"answer_id":3,"question_id":2,"test_id":5,"id":66}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
291	\N	\N	created	App\\Models\\Psychology\\Result	67	[]	{"answer_id":6,"question_id":3,"test_id":5,"id":67}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
292	\N	\N	created	App\\Models\\Psychology\\Result	68	[]	{"answer_id":10,"question_id":4,"test_id":5,"id":68}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
293	\N	\N	created	App\\Models\\Psychology\\Result	69	[]	{"answer_id":13,"question_id":5,"test_id":5,"id":69}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
294	\N	\N	created	App\\Models\\Psychology\\Result	70	[]	{"answer_id":17,"question_id":6,"test_id":5,"id":70}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
295	\N	\N	created	App\\Models\\Psychology\\Result	71	[]	{"answer_id":21,"question_id":7,"test_id":5,"id":71}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
296	\N	\N	created	App\\Models\\Psychology\\Result	72	[]	{"answer_id":25,"question_id":8,"test_id":5,"id":72}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
297	\N	\N	created	App\\Models\\Psychology\\Result	73	[]	{"answer_id":29,"question_id":9,"test_id":5,"id":73}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
298	\N	\N	created	App\\Models\\Psychology\\Result	74	[]	{"answer_id":33,"question_id":10,"test_id":5,"id":74}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
299	\N	\N	created	App\\Models\\Psychology\\Result	75	[]	{"answer_id":37,"question_id":11,"test_id":5,"id":75}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
300	\N	\N	created	App\\Models\\Psychology\\Result	76	[]	{"answer_id":92,"question_id":29,"test_id":5,"id":76}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
301	\N	\N	updated	App\\Models\\Psychology\\Test	5	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-5-1724909443","score":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Mobile Safari/537.36 EdgA/98.0.1108.62	\N	2022-03-04 22:21:26	2022-03-04 22:21:26
302	\N	\N	updated	App\\Models\\Authentication\\User	8	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 OPR/83.0.4254.54	\N	2022-03-06 21:05:33	2022-03-06 21:05:33
303	\N	\N	updated	App\\Models\\Authentication\\User	8	{"max_attempts":2}	{"max_attempts":1}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 OPR/83.0.4254.54	\N	2022-03-06 21:14:23	2022-03-06 21:14:23
304	\N	\N	updated	App\\Models\\Authentication\\User	8	{"max_attempts":1}	{"max_attempts":0}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36 OPR/83.0.4254.54	\N	2022-03-06 21:14:32	2022-03-06 21:14:32
305	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	7	[]	{"username":"danieljerezcamino@gmail.com","token":6091,"id":7}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-07 17:30:42	2022-03-07 17:30:42
306	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	7	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-07 17:31:21	2022-03-07 17:31:21
307	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	8	[]	{"username":"samia.cgarcia@gmail.com","token":3166,"id":8}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 17:54:59	2022-03-07 17:54:59
308	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	8	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 17:55:19	2022-03-07 17:55:19
309	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	1	[]	{"username":"1717175366","token":"Lpybz2WyoASk6dvWTp5wwzvj55DVOHAK3jltDx0FEJKIyGqoJrj3TBmmI399WcBQoiGz6w","id":1}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:55:51	2022-03-07 17:55:51
310	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	2	[]	{"username":"1717175366","token":"1r1rmo1kR6uDsCaCcXToj7EGvMw07DxdpfWWlijqgUbbiUm4yd4OCGnP9UuZa0ocCIrX92","id":2}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:58:22	2022-03-07 17:58:22
311	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	3	[]	{"username":"1717175366","token":"as8XXbsZf1CSAAxTOj8AqNMq5aEjFl98OdCPiZ4bqVPaOMFsQzMySVkagvpSxJzV5SHvpE","id":3}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:58:26	2022-03-07 17:58:26
312	\N	\N	created	App\\Models\\Authentication\\PasswordReset	4	[]	{"username":"1712728060","token":"wJMBiOxlg1QoBsmvcdp2lLv0d7eaK6iJlStelqmQ8O0OhjcwMhc2WBhQt78IZAT6sk1P4x","id":4}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:58:32	2022-03-07 17:58:32
313	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	5	[]	{"username":"1717175366","token":"7233dCjiTVz7mkwA7MVScIYlCLMIQzr4p1KrAghSo3PlIzlSM2vd8h4dwVJmuDkyhaT4us","id":5}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:58:56	2022-03-07 17:58:56
314	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	6	[]	{"username":"1717175366","token":"42U4VohgBODxG2CGj6MTmjtqzbSMjBLkfp4BiQDRISFZowFOAWSTkxhPh4FO2HIzAsm689","id":6}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 17:59:06	2022-03-07 17:59:06
315	App\\Models\\Authentication\\User	6	updated	App\\Models\\Authentication\\User	6	{"password":"$2y$10$1PDg4vU2wxebcmc4FTTYIeW8YzBL7hZYIXj.QCAyNonSK7S0QN0nm"}	{"password":"$2y$10$QiJ5MI9SqXJ00cagsEMTzekaI9lJyyG0dTTP6brJ719puCsj7raLK"}	https://api.temi.esquel.org.ec/api/v1/auth/reset-password?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 18:01:13	2022-03-07 18:01:13
316	App\\Models\\Authentication\\User	6	updated	App\\Models\\Authentication\\PasswordReset	6	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/auth/reset-password?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	\N	2022-03-07 18:01:13	2022-03-07 18:01:13
317	\N	\N	created	App\\Models\\Authentication\\User	10	[]	{"name":"JSKAIAJA","email":"samia.cgarcia@gmail.com","lastname":"SJAKDHAJAJ","username":"18737118","phone":"02939191","password":"$2y$10$9g.HU15avXYXc51Fr9xJROVq6ejkDIibzRfROvGxCos5zq6uHwHEK","id":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
318	\N	\N	created	App\\Models\\Psychology\\Test	6	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":10,"age":18,"terms_conditions":true,"type":"phq9a","id":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
319	\N	\N	created	App\\Models\\Psychology\\Result	77	[]	{"answer_id":2,"question_id":1,"test_id":6,"id":77}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
320	\N	\N	created	App\\Models\\Psychology\\Result	78	[]	{"answer_id":3,"question_id":2,"test_id":6,"id":78}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
321	\N	\N	created	App\\Models\\Psychology\\Result	79	[]	{"answer_id":7,"question_id":3,"test_id":6,"id":79}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
322	\N	\N	created	App\\Models\\Psychology\\Result	80	[]	{"answer_id":11,"question_id":4,"test_id":6,"id":80}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
323	\N	\N	created	App\\Models\\Psychology\\Result	81	[]	{"answer_id":15,"question_id":5,"test_id":6,"id":81}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
324	\N	\N	created	App\\Models\\Psychology\\Result	82	[]	{"answer_id":19,"question_id":6,"test_id":6,"id":82}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
325	\N	\N	created	App\\Models\\Psychology\\Result	83	[]	{"answer_id":23,"question_id":7,"test_id":6,"id":83}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
326	\N	\N	created	App\\Models\\Psychology\\Result	84	[]	{"answer_id":27,"question_id":8,"test_id":6,"id":84}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
327	\N	\N	created	App\\Models\\Psychology\\Result	85	[]	{"answer_id":31,"question_id":9,"test_id":6,"id":85}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
328	\N	\N	created	App\\Models\\Psychology\\Result	86	[]	{"answer_id":35,"question_id":10,"test_id":6,"id":86}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
329	\N	\N	created	App\\Models\\Psychology\\Result	87	[]	{"answer_id":39,"question_id":11,"test_id":6,"id":87}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
330	\N	\N	created	App\\Models\\Psychology\\Result	88	[]	{"answer_id":93,"question_id":29,"test_id":6,"id":88}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:55	2022-03-07 18:02:55
331	\N	\N	updated	App\\Models\\Psychology\\Test	6	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-6-18737118","score":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.1 Mobile/15E148 Safari/604.1	\N	2022-03-07 18:02:57	2022-03-07 18:02:57
332	\N	\N	created	App\\Models\\Authentication\\User	11	[]	{"name":"EMILIO AR\\u00e9VALO","email":"e.titomh@hotmail.com","lastname":"AR\\u00e9VALO ARICO","username":"1724229651","phone":"0983884579","password":"$2y$10$Y52pZ\\/0XY6PCOFnnidqBieJhRXPyEgSVcr8UWKF8S6iMZJnW02QVK","id":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
333	\N	\N	created	App\\Models\\Psychology\\Test	7	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":11,"age":18,"terms_conditions":true,"type":"psc17","id":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
334	\N	\N	created	App\\Models\\Psychology\\Result	89	[]	{"answer_id":2,"question_id":1,"test_id":7,"id":89}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
335	\N	\N	created	App\\Models\\Psychology\\Result	90	[]	{"answer_id":4,"question_id":2,"test_id":7,"id":90}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
336	\N	\N	created	App\\Models\\Psychology\\Result	91	[]	{"answer_id":41,"question_id":12,"test_id":7,"id":91}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
337	\N	\N	created	App\\Models\\Psychology\\Result	92	[]	{"answer_id":45,"question_id":13,"test_id":7,"id":92}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
338	\N	\N	created	App\\Models\\Psychology\\Result	93	[]	{"answer_id":47,"question_id":14,"test_id":7,"id":93}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
339	\N	\N	created	App\\Models\\Psychology\\Result	94	[]	{"answer_id":50,"question_id":15,"test_id":7,"id":94}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
340	\N	\N	created	App\\Models\\Psychology\\Result	95	[]	{"answer_id":53,"question_id":16,"test_id":7,"id":95}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
341	\N	\N	created	App\\Models\\Psychology\\Result	96	[]	{"answer_id":56,"question_id":17,"test_id":7,"id":96}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
342	\N	\N	created	App\\Models\\Psychology\\Result	97	[]	{"answer_id":59,"question_id":18,"test_id":7,"id":97}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
343	\N	\N	created	App\\Models\\Psychology\\Result	98	[]	{"answer_id":62,"question_id":19,"test_id":7,"id":98}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
344	\N	\N	created	App\\Models\\Psychology\\Result	99	[]	{"answer_id":65,"question_id":20,"test_id":7,"id":99}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
345	\N	\N	created	App\\Models\\Psychology\\Result	100	[]	{"answer_id":68,"question_id":21,"test_id":7,"id":100}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
346	\N	\N	created	App\\Models\\Psychology\\Result	101	[]	{"answer_id":71,"question_id":22,"test_id":7,"id":101}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
347	\N	\N	created	App\\Models\\Psychology\\Result	102	[]	{"answer_id":74,"question_id":23,"test_id":7,"id":102}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
348	\N	\N	created	App\\Models\\Psychology\\Result	103	[]	{"answer_id":77,"question_id":24,"test_id":7,"id":103}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
349	\N	\N	created	App\\Models\\Psychology\\Result	104	[]	{"answer_id":80,"question_id":25,"test_id":7,"id":104}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
350	\N	\N	created	App\\Models\\Psychology\\Result	105	[]	{"answer_id":83,"question_id":26,"test_id":7,"id":105}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
351	\N	\N	created	App\\Models\\Psychology\\Result	106	[]	{"answer_id":86,"question_id":27,"test_id":7,"id":106}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
352	\N	\N	created	App\\Models\\Psychology\\Result	107	[]	{"answer_id":89,"question_id":28,"test_id":7,"id":107}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
353	\N	\N	created	App\\Models\\Psychology\\Result	108	[]	{"answer_id":92,"question_id":29,"test_id":7,"id":108}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
354	\N	\N	updated	App\\Models\\Psychology\\Test	7	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-7-1724229651","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.30	\N	2022-03-07 23:15:53	2022-03-07 23:15:53
355	App\\Models\\Authentication\\User	2	updated	App\\Models\\Psychology\\Test	7	{"state_id":1}	{"state_id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/7/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	\N	2022-03-07 23:17:48	2022-03-07 23:17:48
356	App\\Models\\Authentication\\User	2	created	App\\Models\\Psychology\\Assignment	3	[]	{"institution_id":7,"test_id":7,"user_id":2,"started_at":"2022-03-08T04:17:48.402828Z","id":3}	https://api.temi.esquel.org.ec/api/v1/institutions/7/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	\N	2022-03-07 23:17:48	2022-03-07 23:17:48
357	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	12	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"1234567891","password":"$2y$10$pKsXDdNQGof9.6PBeiYEj.R28piZsnl\\/u7LdsrcBqOGwHlutmoEsa","name":"USUARIO UNO","lastname":"USUARIO UNO","birthdate":null,"email":"ctamayo@yavirac.edu.ec","id":12}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	\N	2022-03-08 11:42:56	2022-03-08 11:42:56
358	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	13	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"1234567892","password":"$2y$10$Msimc5q8V5ZyaKFQBtZJz.QhOJV6BG7.0\\/FXQKdZKBPhvk8kN\\/t0m","name":"USUARIO DOS","lastname":"USUARIOS DOS","birthdate":null,"email":"cesar.tamayo02@outlook.com","id":13}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	\N	2022-03-08 11:43:23	2022-03-08 11:43:23
378	\N	\N	created	App\\Models\\Psychology\\Result	118	[]	{"answer_id":33,"question_id":10,"test_id":8,"id":118}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
359	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	14	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"1234567893","password":"$2y$10$bQXk09PewedRvNZuBzM\\/1udbdNSm7\\/L13jg0Vy9QUtw9E5ySkBbGS","name":"USUARIO TRES","lastname":"USUARIO TRES","birthdate":null,"email":"cmtamayol@pucesd.edu.ec","id":14}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	\N	2022-03-08 11:44:04	2022-03-08 11:44:04
360	\N	\N	updated	App\\Models\\Authentication\\User	6	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:23:15	2022-03-10 09:23:15
361	\N	\N	updated	App\\Models\\Authentication\\User	6	{"max_attempts":2}	{"max_attempts":1}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:23:38	2022-03-10 09:23:38
362	\N	\N	updated	App\\Models\\Authentication\\User	6	{"max_attempts":1}	{"max_attempts":3}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:23:44	2022-03-10 09:23:44
363	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	9	[]	{"username":"sistemas@esquel.org.ec","token":3767,"id":9}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:55:00	2022-03-10 09:55:00
364	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	9	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:55:19	2022-03-10 09:55:19
365	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	10	[]	{"username":"sistemas@esquel.org.ec","token":8928,"id":10}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:59:33	2022-03-10 09:59:33
366	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	10	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 09:59:57	2022-03-10 09:59:57
367	\N	\N	created	App\\Models\\Authentication\\User	15	[]	{"name":"ADFASFAFA","email":"sistemas@esquel.org.ec","lastname":"DSFASDFDAS","username":"2342341234","phone":"2342432424","password":"$2y$10$nyfE\\/SQ5LjPtQ9eYhxK0i.YaPg4YvPkrOspWjaeDYM6gI845anB5O","id":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
368	\N	\N	created	App\\Models\\Psychology\\Test	8	[]	{"canton_id":307,"province_id":252,"state_id":1,"user_id":15,"age":18,"terms_conditions":true,"type":"phq9a","id":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
369	\N	\N	created	App\\Models\\Psychology\\Result	109	[]	{"answer_id":1,"question_id":1,"test_id":8,"id":109}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
370	\N	\N	created	App\\Models\\Psychology\\Result	110	[]	{"answer_id":3,"question_id":2,"test_id":8,"id":110}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
371	\N	\N	created	App\\Models\\Psychology\\Result	111	[]	{"answer_id":6,"question_id":3,"test_id":8,"id":111}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
372	\N	\N	created	App\\Models\\Psychology\\Result	112	[]	{"answer_id":10,"question_id":4,"test_id":8,"id":112}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
373	\N	\N	created	App\\Models\\Psychology\\Result	113	[]	{"answer_id":15,"question_id":5,"test_id":8,"id":113}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
374	\N	\N	created	App\\Models\\Psychology\\Result	114	[]	{"answer_id":17,"question_id":6,"test_id":8,"id":114}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
375	\N	\N	created	App\\Models\\Psychology\\Result	115	[]	{"answer_id":23,"question_id":7,"test_id":8,"id":115}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
376	\N	\N	created	App\\Models\\Psychology\\Result	116	[]	{"answer_id":27,"question_id":8,"test_id":8,"id":116}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
377	\N	\N	created	App\\Models\\Psychology\\Result	117	[]	{"answer_id":31,"question_id":9,"test_id":8,"id":117}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
724	\N	\N	created	App\\Models\\Psychology\\Result	372	[]	{"answer_id":26,"question_id":8,"test_id":27,"id":372}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
379	\N	\N	created	App\\Models\\Psychology\\Result	119	[]	{"answer_id":38,"question_id":11,"test_id":8,"id":119}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
380	\N	\N	created	App\\Models\\Psychology\\Result	120	[]	{"answer_id":92,"question_id":29,"test_id":8,"id":120}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:35	2022-03-10 10:14:35
381	\N	\N	updated	App\\Models\\Psychology\\Test	8	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-8-2342341234","score":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 10:14:37	2022-03-10 10:14:37
382	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	7	[]	{"username":"1717175366","token":"bvYAZfsDxTGh91TiRWqXBCuWDFaAhfm77BwupjHyBYGfJmcHvJTtQmnTjLfff2rUz6mu6U","id":7}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-10 18:38:33	2022-03-10 18:38:33
383	\N	\N	updated	App\\Models\\Authentication\\User	1	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 15:03:53	2022-03-11 15:03:53
384	\N	\N	updated	App\\Models\\Authentication\\User	1	{"max_attempts":2}	{"max_attempts":3}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.39	\N	2022-03-11 15:06:42	2022-03-11 15:06:42
385	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	16	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"2222222222","password":"$2y$10$iVUb45jRS0I84E6z1l90wu9LRxKVQyzAY6LL3nhQt4nLoi5FVsk\\/O","name":"TEST","lastname":"TESTER","birthdate":null,"email":"pjrobayo@hotmail.com","id":16}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 15:17:23	2022-03-11 15:17:23
386	\N	\N	updated	App\\Models\\Authentication\\User	16	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 15:20:32	2022-03-11 15:20:32
387	\N	\N	updated	App\\Models\\Authentication\\User	16	{"max_attempts":2}	{"max_attempts":3}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 15:24:25	2022-03-11 15:24:25
388	\N	\N	created	App\\Models\\Authentication\\User	17	[]	{"name":"HSJAJSJAJA","email":"samia.cgarcia@gmail.com","lastname":"NSJAKAJA","username":"8173727181","phone":"0882737281","password":"$2y$10$COKuwo5S5QbQdp53hTGtz.PQslSDt9QeY6zhJw06SJNsVsgvJCR7K","id":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
389	\N	\N	created	App\\Models\\Psychology\\Test	9	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":17,"age":18,"terms_conditions":true,"type":"psc17","id":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
390	\N	\N	created	App\\Models\\Psychology\\Result	121	[]	{"answer_id":2,"question_id":1,"test_id":9,"id":121}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
391	\N	\N	created	App\\Models\\Psychology\\Result	122	[]	{"answer_id":4,"question_id":2,"test_id":9,"id":122}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
392	\N	\N	created	App\\Models\\Psychology\\Result	123	[]	{"answer_id":42,"question_id":12,"test_id":9,"id":123}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
393	\N	\N	created	App\\Models\\Psychology\\Result	124	[]	{"answer_id":44,"question_id":13,"test_id":9,"id":124}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
394	\N	\N	created	App\\Models\\Psychology\\Result	125	[]	{"answer_id":48,"question_id":14,"test_id":9,"id":125}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
395	\N	\N	created	App\\Models\\Psychology\\Result	126	[]	{"answer_id":51,"question_id":15,"test_id":9,"id":126}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
396	\N	\N	created	App\\Models\\Psychology\\Result	127	[]	{"answer_id":53,"question_id":16,"test_id":9,"id":127}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
397	\N	\N	created	App\\Models\\Psychology\\Result	128	[]	{"answer_id":56,"question_id":17,"test_id":9,"id":128}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
398	\N	\N	created	App\\Models\\Psychology\\Result	129	[]	{"answer_id":59,"question_id":18,"test_id":9,"id":129}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
399	\N	\N	created	App\\Models\\Psychology\\Result	130	[]	{"answer_id":63,"question_id":19,"test_id":9,"id":130}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
400	\N	\N	created	App\\Models\\Psychology\\Result	131	[]	{"answer_id":65,"question_id":20,"test_id":9,"id":131}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
401	\N	\N	created	App\\Models\\Psychology\\Result	132	[]	{"answer_id":68,"question_id":21,"test_id":9,"id":132}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:12	2022-03-11 16:59:12
402	\N	\N	created	App\\Models\\Psychology\\Result	133	[]	{"answer_id":71,"question_id":22,"test_id":9,"id":133}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
403	\N	\N	created	App\\Models\\Psychology\\Result	134	[]	{"answer_id":74,"question_id":23,"test_id":9,"id":134}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
404	\N	\N	created	App\\Models\\Psychology\\Result	135	[]	{"answer_id":78,"question_id":24,"test_id":9,"id":135}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
405	\N	\N	created	App\\Models\\Psychology\\Result	136	[]	{"answer_id":81,"question_id":25,"test_id":9,"id":136}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
406	\N	\N	created	App\\Models\\Psychology\\Result	137	[]	{"answer_id":84,"question_id":26,"test_id":9,"id":137}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
407	\N	\N	created	App\\Models\\Psychology\\Result	138	[]	{"answer_id":87,"question_id":27,"test_id":9,"id":138}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
408	\N	\N	created	App\\Models\\Psychology\\Result	139	[]	{"answer_id":90,"question_id":28,"test_id":9,"id":139}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
409	\N	\N	created	App\\Models\\Psychology\\Result	140	[]	{"answer_id":93,"question_id":29,"test_id":9,"id":140}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
410	\N	\N	updated	App\\Models\\Psychology\\Test	9	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"02-9-8173727181","score":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 16:59:13	2022-03-11 16:59:13
411	\N	\N	created	App\\Models\\Authentication\\User	18	[]	{"name":"IQKDHWOSNSHQH","email":"samia.cgarcia@gmail.com","lastname":"NEJAJSJAJA","username":"18382818","phone":"2749199119","password":"$2y$10$tC0\\/FGld3FCJJqU5fWTfq.XR15tEnGf\\/lHHbnsvDYCHPWNxuUQkLu","id":18}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
412	\N	\N	created	App\\Models\\Psychology\\Test	10	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":18,"age":18,"terms_conditions":true,"type":"phq9a","id":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
413	\N	\N	created	App\\Models\\Psychology\\Result	141	[]	{"answer_id":1,"question_id":1,"test_id":10,"id":141}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
414	\N	\N	created	App\\Models\\Psychology\\Result	142	[]	{"answer_id":4,"question_id":2,"test_id":10,"id":142}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
415	\N	\N	created	App\\Models\\Psychology\\Result	143	[]	{"answer_id":7,"question_id":3,"test_id":10,"id":143}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
416	\N	\N	created	App\\Models\\Psychology\\Result	144	[]	{"answer_id":11,"question_id":4,"test_id":10,"id":144}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
417	\N	\N	created	App\\Models\\Psychology\\Result	145	[]	{"answer_id":15,"question_id":5,"test_id":10,"id":145}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
418	\N	\N	created	App\\Models\\Psychology\\Result	146	[]	{"answer_id":19,"question_id":6,"test_id":10,"id":146}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
419	\N	\N	created	App\\Models\\Psychology\\Result	147	[]	{"answer_id":23,"question_id":7,"test_id":10,"id":147}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
420	\N	\N	created	App\\Models\\Psychology\\Result	148	[]	{"answer_id":27,"question_id":8,"test_id":10,"id":148}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
421	\N	\N	created	App\\Models\\Psychology\\Result	149	[]	{"answer_id":30,"question_id":9,"test_id":10,"id":149}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
422	\N	\N	created	App\\Models\\Psychology\\Result	150	[]	{"answer_id":34,"question_id":10,"test_id":10,"id":150}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
423	\N	\N	created	App\\Models\\Psychology\\Result	151	[]	{"answer_id":39,"question_id":11,"test_id":10,"id":151}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
424	\N	\N	created	App\\Models\\Psychology\\Result	152	[]	{"answer_id":93,"question_id":29,"test_id":10,"id":152}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:13	2022-03-11 17:02:13
425	\N	\N	updated	App\\Models\\Psychology\\Test	10	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"02-10-18382818","score":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:02:14	2022-03-11 17:02:14
426	\N	\N	updated	App\\Models\\Authentication\\User	12	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 17:10:55	2022-03-11 17:10:55
427	\N	\N	updated	App\\Models\\Authentication\\User	12	{"max_attempts":2}	{"max_attempts":3}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 17:11:20	2022-03-11 17:11:20
428	\N	\N	created	App\\Models\\Authentication\\User	19	[]	{"name":"KWJDJAJAJA","email":"samia.cgarcia@gmail.com","lastname":"SMAISHAJ","username":"18371818","phone":"184718181","password":"$2y$10$6127vP3ee9rDGlaSBUzG6e22xWc8VF3dHPAkjvniFy6kX0Kqa11di","id":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
429	\N	\N	created	App\\Models\\Psychology\\Test	11	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":19,"age":18,"terms_conditions":true,"type":"phq9a","id":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
430	\N	\N	created	App\\Models\\Psychology\\Result	153	[]	{"answer_id":1,"question_id":1,"test_id":11,"id":153}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
431	\N	\N	created	App\\Models\\Psychology\\Result	154	[]	{"answer_id":4,"question_id":2,"test_id":11,"id":154}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
432	\N	\N	created	App\\Models\\Psychology\\Result	155	[]	{"answer_id":5,"question_id":3,"test_id":11,"id":155}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
433	\N	\N	created	App\\Models\\Psychology\\Result	156	[]	{"answer_id":9,"question_id":4,"test_id":11,"id":156}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
434	\N	\N	created	App\\Models\\Psychology\\Result	157	[]	{"answer_id":13,"question_id":5,"test_id":11,"id":157}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
435	\N	\N	created	App\\Models\\Psychology\\Result	158	[]	{"answer_id":17,"question_id":6,"test_id":11,"id":158}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
436	\N	\N	created	App\\Models\\Psychology\\Result	159	[]	{"answer_id":21,"question_id":7,"test_id":11,"id":159}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
437	\N	\N	created	App\\Models\\Psychology\\Result	160	[]	{"answer_id":25,"question_id":8,"test_id":11,"id":160}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
438	\N	\N	created	App\\Models\\Psychology\\Result	161	[]	{"answer_id":29,"question_id":9,"test_id":11,"id":161}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
439	\N	\N	created	App\\Models\\Psychology\\Result	162	[]	{"answer_id":33,"question_id":10,"test_id":11,"id":162}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
440	\N	\N	created	App\\Models\\Psychology\\Result	163	[]	{"answer_id":37,"question_id":11,"test_id":11,"id":163}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
441	\N	\N	created	App\\Models\\Psychology\\Result	164	[]	{"answer_id":92,"question_id":29,"test_id":11,"id":164}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
442	\N	\N	updated	App\\Models\\Psychology\\Test	11	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"02-11-18371818","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:11:36	2022-03-11 17:11:36
443	App\\Models\\Authentication\\User	1	deleted	App\\Models\\Authentication\\User	18	{"id":18,"remember_token":null,"blood_type_id":null,"civil_status_id":null,"ethnic_origin_id":null,"gender_id":null,"identification_type_id":null,"sex_id":null,"avatar":null,"birthdate":null,"email":"samia.cgarcia@gmail.com","email_verified_at":null,"lastname":"NEJAJSJAJA","max_attempts":3,"name":"IQKDHWOSNSHQH","password":"$2y$10$tC0\\/FGld3FCJJqU5fWTfq.XR15tEnGf\\/lHHbnsvDYCHPWNxuUQkLu","password_changed":false,"phone":"2749199119","suspended":false,"username":"18382818"}	[]	https://api.temi.esquel.org.ec/api/v1/users/18?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:28:17	2022-03-11 17:28:17
444	App\\Models\\Authentication\\User	1	deleted	App\\Models\\Authentication\\User	19	{"id":19,"remember_token":null,"blood_type_id":null,"civil_status_id":null,"ethnic_origin_id":null,"gender_id":null,"identification_type_id":null,"sex_id":null,"avatar":null,"birthdate":null,"email":"samia.cgarcia@gmail.com","email_verified_at":null,"lastname":"SMAISHAJ","max_attempts":3,"name":"KWJDJAJAJA","password":"$2y$10$6127vP3ee9rDGlaSBUzG6e22xWc8VF3dHPAkjvniFy6kX0Kqa11di","password_changed":false,"phone":"184718181","suspended":false,"username":"18371818"}	[]	https://api.temi.esquel.org.ec/api/v1/user/destroys?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:28:25	2022-03-11 17:28:25
445	App\\Models\\Authentication\\User	1	deleted	App\\Models\\Authentication\\User	10	{"id":10,"remember_token":null,"blood_type_id":null,"civil_status_id":null,"ethnic_origin_id":null,"gender_id":null,"identification_type_id":null,"sex_id":null,"avatar":null,"birthdate":null,"email":"samia.cgarcia@gmail.com","email_verified_at":null,"lastname":"SJAKDHAJAJ","max_attempts":3,"name":"JSKAIAJA","password":"$2y$10$9g.HU15avXYXc51Fr9xJROVq6ejkDIibzRfROvGxCos5zq6uHwHEK","password_changed":false,"phone":"02939191","suspended":false,"username":"18737118"}	[]	https://api.temi.esquel.org.ec/api/v1/user/destroys?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:28:25	2022-03-11 17:28:25
446	App\\Models\\Authentication\\User	1	deleted	App\\Models\\Authentication\\User	17	{"id":17,"remember_token":null,"blood_type_id":null,"civil_status_id":null,"ethnic_origin_id":null,"gender_id":null,"identification_type_id":null,"sex_id":null,"avatar":null,"birthdate":null,"email":"samia.cgarcia@gmail.com","email_verified_at":null,"lastname":"NSJAKAJA","max_attempts":3,"name":"HSJAJSJAJA","password":"$2y$10$COKuwo5S5QbQdp53hTGtz.PQslSDt9QeY6zhJw06SJNsVsgvJCR7K","password_changed":false,"phone":"0882737281","suspended":false,"username":"8173727181"}	[]	https://api.temi.esquel.org.ec/api/v1/user/destroys?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:28:25	2022-03-11 17:28:25
447	App\\Models\\Authentication\\User	1	deleted	App\\Models\\Authentication\\User	7	{"id":7,"remember_token":null,"blood_type_id":null,"civil_status_id":null,"ethnic_origin_id":null,"gender_id":null,"identification_type_id":null,"sex_id":null,"avatar":null,"birthdate":null,"email":"","email_verified_at":null,"lastname":"SAMIA","max_attempts":3,"name":"JAJAJAJA","password":"$2y$10$AsaVFV\\/a0Ui5K4RkcauVmOAw9fPKaGVjEszW\\/K2xcG.TbxozOBcau","password_changed":false,"phone":"","suspended":false,"username":"1724581228"}	[]	https://api.temi.esquel.org.ec/api/v1/users/7?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:28:35	2022-03-11 17:28:35
448	App\\Models\\Authentication\\User	1	created	App\\Models\\Authentication\\User	20	[]	{"identification_type_id":5,"sex_id":null,"gender_id":null,"blood_type_id":null,"ethnic_origin_id":null,"civil_status_id":null,"username":"1724581218","password":"$2y$10$6V6Tt96G75dIdqwnkocYtOxtUTvrsI36Yh1O6vmidGo\\/AmSJ5BWMC","name":"SAMIA","lastname":"GARCIA","birthdate":null,"email":"samia.cgarcia@gmail.com","id":20}	https://api.temi.esquel.org.ec/api/v1/users?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-11 17:29:42	2022-03-11 17:29:42
449	\N	\N	created	App\\Models\\Authentication\\User	21	[]	{"name":"SAMIA","email":"samia.cgarcia@gmail.com","lastname":"SMAKDKQKA","username":"1947181819","phone":"2847191919","password":"$2y$10$HIPkWmtGyVOS8Z7rQXnKfeSG7xSpMWjSn0W8yBY0jbOtJ.qK6fafu","id":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
450	\N	\N	created	App\\Models\\Psychology\\Test	12	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":21,"age":18,"terms_conditions":true,"type":"psc17","id":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
451	\N	\N	created	App\\Models\\Psychology\\Result	165	[]	{"answer_id":2,"question_id":1,"test_id":12,"id":165}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
452	\N	\N	created	App\\Models\\Psychology\\Result	166	[]	{"answer_id":4,"question_id":2,"test_id":12,"id":166}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
453	\N	\N	created	App\\Models\\Psychology\\Result	167	[]	{"answer_id":42,"question_id":12,"test_id":12,"id":167}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
454	\N	\N	created	App\\Models\\Psychology\\Result	168	[]	{"answer_id":45,"question_id":13,"test_id":12,"id":168}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
455	\N	\N	created	App\\Models\\Psychology\\Result	169	[]	{"answer_id":48,"question_id":14,"test_id":12,"id":169}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
456	\N	\N	created	App\\Models\\Psychology\\Result	170	[]	{"answer_id":51,"question_id":15,"test_id":12,"id":170}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
457	\N	\N	created	App\\Models\\Psychology\\Result	171	[]	{"answer_id":54,"question_id":16,"test_id":12,"id":171}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
458	\N	\N	created	App\\Models\\Psychology\\Result	172	[]	{"answer_id":57,"question_id":17,"test_id":12,"id":172}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
459	\N	\N	created	App\\Models\\Psychology\\Result	173	[]	{"answer_id":61,"question_id":18,"test_id":12,"id":173}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
460	\N	\N	created	App\\Models\\Psychology\\Result	174	[]	{"answer_id":62,"question_id":19,"test_id":12,"id":174}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
461	\N	\N	created	App\\Models\\Psychology\\Result	175	[]	{"answer_id":67,"question_id":20,"test_id":12,"id":175}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
462	\N	\N	created	App\\Models\\Psychology\\Result	176	[]	{"answer_id":69,"question_id":21,"test_id":12,"id":176}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
463	\N	\N	created	App\\Models\\Psychology\\Result	177	[]	{"answer_id":73,"question_id":22,"test_id":12,"id":177}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
464	\N	\N	created	App\\Models\\Psychology\\Result	178	[]	{"answer_id":75,"question_id":23,"test_id":12,"id":178}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
465	\N	\N	created	App\\Models\\Psychology\\Result	179	[]	{"answer_id":79,"question_id":24,"test_id":12,"id":179}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
466	\N	\N	created	App\\Models\\Psychology\\Result	180	[]	{"answer_id":81,"question_id":25,"test_id":12,"id":180}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
467	\N	\N	created	App\\Models\\Psychology\\Result	181	[]	{"answer_id":84,"question_id":26,"test_id":12,"id":181}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
468	\N	\N	created	App\\Models\\Psychology\\Result	182	[]	{"answer_id":87,"question_id":27,"test_id":12,"id":182}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
469	\N	\N	created	App\\Models\\Psychology\\Result	183	[]	{"answer_id":89,"question_id":28,"test_id":12,"id":183}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
470	\N	\N	created	App\\Models\\Psychology\\Result	184	[]	{"answer_id":93,"question_id":29,"test_id":12,"id":184}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
589	\N	\N	created	App\\Models\\Psychology\\Result	262	[]	{"answer_id":86,"question_id":27,"test_id":19,"id":262}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
471	\N	\N	updated	App\\Models\\Psychology\\Test	12	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"02-12-1947181819","score":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-11 17:33:17	2022-03-11 17:33:17
472	App\\Models\\Authentication\\User	6	created	App\\Models\\Authentication\\PasswordReset	8	[]	{"username":"1717175366","token":"GoP2PBVtrfTOaCu9x4jNCXDgC0Udxb7nU32BGwDmMl4BSaIob1r5HRIvXZUQbaDfrUwuqE","id":8}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	\N	2022-03-11 17:49:17	2022-03-11 17:49:17
473	\N	\N	updated	App\\Models\\Authentication\\User	20	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 17:53:08	2022-03-11 17:53:08
474	\N	\N	updated	App\\Models\\Authentication\\User	20	{"max_attempts":2}	{"max_attempts":1}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	\N	2022-03-11 17:53:12	2022-03-11 17:53:12
475	\N	\N	created	App\\Models\\Authentication\\User	22	[]	{"name":"HRAHRANQRJ","email":"samia.cgarcia@gmail.com","lastname":"DHFAJATS","username":"1836711881","phone":"841814141","password":"$2y$10$He1XECliwF59DtjNcjW2ieG\\/bnN\\/3nMXxE4s7tsckz0U9eEtwGTPW","id":22}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:54	2022-03-12 17:30:54
476	\N	\N	created	App\\Models\\Psychology\\Test	13	[]	{"canton_id":305,"province_id":252,"state_id":1,"user_id":22,"age":18,"terms_conditions":true,"type":"phq9a","id":13}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:54	2022-03-12 17:30:54
477	\N	\N	created	App\\Models\\Psychology\\Result	185	[]	{"answer_id":1,"question_id":1,"test_id":13,"id":185}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:54	2022-03-12 17:30:54
478	\N	\N	created	App\\Models\\Psychology\\Result	186	[]	{"answer_id":3,"question_id":2,"test_id":13,"id":186}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
479	\N	\N	created	App\\Models\\Psychology\\Result	187	[]	{"answer_id":8,"question_id":3,"test_id":13,"id":187}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
480	\N	\N	created	App\\Models\\Psychology\\Result	188	[]	{"answer_id":12,"question_id":4,"test_id":13,"id":188}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
481	\N	\N	created	App\\Models\\Psychology\\Result	189	[]	{"answer_id":16,"question_id":5,"test_id":13,"id":189}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
482	\N	\N	created	App\\Models\\Psychology\\Result	190	[]	{"answer_id":20,"question_id":6,"test_id":13,"id":190}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
483	\N	\N	created	App\\Models\\Psychology\\Result	191	[]	{"answer_id":24,"question_id":7,"test_id":13,"id":191}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
484	\N	\N	created	App\\Models\\Psychology\\Result	192	[]	{"answer_id":28,"question_id":8,"test_id":13,"id":192}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
485	\N	\N	created	App\\Models\\Psychology\\Result	193	[]	{"answer_id":32,"question_id":9,"test_id":13,"id":193}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
486	\N	\N	created	App\\Models\\Psychology\\Result	194	[]	{"answer_id":36,"question_id":10,"test_id":13,"id":194}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
487	\N	\N	created	App\\Models\\Psychology\\Result	195	[]	{"answer_id":40,"question_id":11,"test_id":13,"id":195}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
488	\N	\N	created	App\\Models\\Psychology\\Result	196	[]	{"answer_id":93,"question_id":29,"test_id":13,"id":196}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:30:55	2022-03-12 17:30:55
489	\N	\N	updated	App\\Models\\Psychology\\Test	13	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-13-1836711881","score":29}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:31:00	2022-03-12 17:31:00
590	\N	\N	created	App\\Models\\Psychology\\Result	263	[]	{"answer_id":91,"question_id":28,"test_id":19,"id":263}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
490	\N	\N	created	App\\Models\\Authentication\\User	23	[]	{"name":"LDNWOAKANA","email":"samia.cgarcia@gmail.com","lastname":"HDJAKASJNA","username":"1874819191","phone":"0183729191","password":"$2y$10$.Y1NOPQJAuNm3Q4TwUB1COaecpEkyKuKL18jTXTlje0hOa3XkpF2O","id":23}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
491	\N	\N	created	App\\Models\\Psychology\\Test	14	[]	{"canton_id":292,"province_id":250,"state_id":1,"user_id":23,"age":18,"terms_conditions":true,"type":"phq9a","id":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
492	\N	\N	created	App\\Models\\Psychology\\Result	197	[]	{"answer_id":1,"question_id":1,"test_id":14,"id":197}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
493	\N	\N	created	App\\Models\\Psychology\\Result	198	[]	{"answer_id":3,"question_id":2,"test_id":14,"id":198}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
494	\N	\N	created	App\\Models\\Psychology\\Result	199	[]	{"answer_id":7,"question_id":3,"test_id":14,"id":199}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
495	\N	\N	created	App\\Models\\Psychology\\Result	200	[]	{"answer_id":12,"question_id":4,"test_id":14,"id":200}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
496	\N	\N	created	App\\Models\\Psychology\\Result	201	[]	{"answer_id":16,"question_id":5,"test_id":14,"id":201}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
497	\N	\N	created	App\\Models\\Psychology\\Result	202	[]	{"answer_id":20,"question_id":6,"test_id":14,"id":202}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
498	\N	\N	created	App\\Models\\Psychology\\Result	203	[]	{"answer_id":24,"question_id":7,"test_id":14,"id":203}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
499	\N	\N	created	App\\Models\\Psychology\\Result	204	[]	{"answer_id":28,"question_id":8,"test_id":14,"id":204}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
500	\N	\N	created	App\\Models\\Psychology\\Result	205	[]	{"answer_id":32,"question_id":9,"test_id":14,"id":205}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
501	\N	\N	created	App\\Models\\Psychology\\Result	206	[]	{"answer_id":36,"question_id":10,"test_id":14,"id":206}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
502	\N	\N	created	App\\Models\\Psychology\\Result	207	[]	{"answer_id":37,"question_id":11,"test_id":14,"id":207}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
503	\N	\N	created	App\\Models\\Psychology\\Result	208	[]	{"answer_id":93,"question_id":29,"test_id":14,"id":208}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:15	2022-03-12 17:33:15
504	\N	\N	updated	App\\Models\\Psychology\\Test	14	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"02-14-1874819191","score":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-12 17:33:19	2022-03-12 17:33:19
505	\N	\N	created	App\\Models\\Authentication\\PasswordReset	9	[]	{"username":"1724581218","token":"JXKzj9QNkwrI1idzWBkQYO2GE5c1e9FdTkuEH8zBvgXANM3qAgjnDAsKz7ZwESYDoFKZTY","id":9}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:35:48	2022-03-12 17:35:48
506	\N	\N	updated	App\\Models\\Authentication\\User	20	{"max_attempts":1}	{"max_attempts":3}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:37:28	2022-03-12 17:37:28
507	App\\Models\\Authentication\\User	20	updated	App\\Models\\Psychology\\Test	14	{"state_id":1}	{"state_id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/1/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:38:07	2022-03-12 17:38:07
508	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Assignment	4	[]	{"institution_id":1,"test_id":14,"user_id":20,"started_at":"2022-03-12T22:38:07.926695Z","id":4}	https://api.temi.esquel.org.ec/api/v1/institutions/1/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:38:07	2022-03-12 17:38:07
509	App\\Models\\Authentication\\User	20	updated	App\\Models\\Psychology\\Test	13	{"state_id":1}	{"state_id":2}	https://api.temi.esquel.org.ec/api/v1/institutions/4/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:38:24	2022-03-12 17:38:24
510	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Assignment	5	[]	{"institution_id":4,"test_id":13,"user_id":20,"started_at":"2022-03-12T22:38:24.605215Z","id":5}	https://api.temi.esquel.org.ec/api/v1/institutions/4/tests?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:38:24	2022-03-12 17:38:24
511	App\\Models\\Authentication\\User	20	deleted	App\\Models\\Psychology\\Test	11	{"id":11,"canton_id":289,"priority_id":3,"province_id":250,"state_id":1,"user_id":19,"age":18,"code":"02-11-18371818","score":2,"terms_conditions":true,"type":"phq9a"}	[]	https://api.temi.esquel.org.ec/api/v1/tests/destroys?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:41:00	2022-03-12 17:41:00
512	App\\Models\\Authentication\\User	20	deleted	App\\Models\\Psychology\\Test	12	{"id":12,"canton_id":289,"priority_id":2,"province_id":250,"state_id":1,"user_id":21,"age":18,"code":"02-12-1947181819","score":19,"terms_conditions":true,"type":"psc17"}	[]	https://api.temi.esquel.org.ec/api/v1/tests/destroys?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-12 17:41:00	2022-03-12 17:41:00
513	App\\Models\\Authentication\\User	1	updated	App\\Models\\Authentication\\User	9	{"password":"$2y$10$6wTeArGkWHP3OvzIwIiFAOeDZJR2QxV8H\\/fQzqC0hG1g.Gjp4Op4u","phone":"0982417259"}	{"password":"$2y$10$3oIWsRihJ0ua4E2h5P6mheZhKZcvzl435qBV.K8y4trl6WOOB9pNW","phone":"0987654321"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
514	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Test	15	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":9,"age":18,"terms_conditions":true,"type":"phq9a","id":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
515	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	209	[]	{"answer_id":1,"question_id":1,"test_id":15,"id":209}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
516	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	210	[]	{"answer_id":4,"question_id":2,"test_id":15,"id":210}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
517	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	211	[]	{"answer_id":6,"question_id":3,"test_id":15,"id":211}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
518	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	212	[]	{"answer_id":11,"question_id":4,"test_id":15,"id":212}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
519	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	213	[]	{"answer_id":14,"question_id":5,"test_id":15,"id":213}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
520	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	214	[]	{"answer_id":19,"question_id":6,"test_id":15,"id":214}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
521	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	215	[]	{"answer_id":22,"question_id":7,"test_id":15,"id":215}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
522	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	216	[]	{"answer_id":26,"question_id":8,"test_id":15,"id":216}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
523	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	217	[]	{"answer_id":32,"question_id":9,"test_id":15,"id":217}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
524	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	218	[]	{"answer_id":35,"question_id":10,"test_id":15,"id":218}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
525	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	219	[]	{"answer_id":39,"question_id":11,"test_id":15,"id":219}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
526	App\\Models\\Authentication\\User	1	created	App\\Models\\Psychology\\Result	220	[]	{"answer_id":93,"question_id":29,"test_id":15,"id":220}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:21	2022-03-14 22:29:21
527	App\\Models\\Authentication\\User	1	updated	App\\Models\\Psychology\\Test	15	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-15-1724909443","score":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:29:24	2022-03-14 22:29:24
567	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	17	[]	{"username":"samia.cgarcia@gmail.com","token":4683,"id":17}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:12:35	2022-03-15 19:12:35
528	App\\Models\\Authentication\\User	12	created	App\\Models\\Authentication\\User	24	[]	{"name":"AD","email":"cesar.tamayo0204@gmail.com","lastname":"ASD","username":"1123123123","phone":"1231231231","password":"$2y$10$DIAOTcyhJrT7DT.OGRsTYeb48XTVthdsR4Md1.WD122VblTdEFHce","id":24}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
529	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Test	16	[]	{"canton_id":292,"province_id":250,"state_id":1,"user_id":24,"age":18,"terms_conditions":true,"type":"phq9a","id":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
530	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	221	[]	{"answer_id":2,"question_id":1,"test_id":16,"id":221}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
531	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	222	[]	{"answer_id":3,"question_id":2,"test_id":16,"id":222}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
532	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	223	[]	{"answer_id":7,"question_id":3,"test_id":16,"id":223}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
533	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	224	[]	{"answer_id":11,"question_id":4,"test_id":16,"id":224}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
534	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	225	[]	{"answer_id":14,"question_id":5,"test_id":16,"id":225}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
535	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	226	[]	{"answer_id":20,"question_id":6,"test_id":16,"id":226}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
536	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	227	[]	{"answer_id":24,"question_id":7,"test_id":16,"id":227}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
537	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	228	[]	{"answer_id":28,"question_id":8,"test_id":16,"id":228}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
538	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	229	[]	{"answer_id":32,"question_id":9,"test_id":16,"id":229}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
539	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	230	[]	{"answer_id":36,"question_id":10,"test_id":16,"id":230}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
540	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	231	[]	{"answer_id":40,"question_id":11,"test_id":16,"id":231}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
541	App\\Models\\Authentication\\User	12	created	App\\Models\\Psychology\\Result	232	[]	{"answer_id":92,"question_id":29,"test_id":16,"id":232}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:45	2022-03-14 22:36:45
542	App\\Models\\Authentication\\User	12	updated	App\\Models\\Psychology\\Test	16	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"02-16-1123123123","score":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-14 22:36:47	2022-03-14 22:36:47
543	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	11	[]	{"username":"kywishai@gmail.com","token":4343,"id":11}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 15:06:35	2022-03-15 15:06:35
544	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	12	[]	{"username":"yguerra@einstein.k12.ec","token":2177,"id":12}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 15:06:59	2022-03-15 15:06:59
545	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	11	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 15:07:17	2022-03-15 15:07:17
546	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	12	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 15:07:38	2022-03-15 15:07:38
568	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	17	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:13:31	2022-03-15 19:13:31
547	\N	\N	created	App\\Models\\Authentication\\User	25	[]	{"name":"YULIANA MONSERRATHE","email":"","lastname":"GUERRA GUACHAMIN","username":"1750249920","phone":"","password":"$2y$10$oHK.xHmSiQ8vFBSys.9XKOCNYa.\\/XxRY1tS2h.6jxfSUhnP8poL1q","id":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
548	\N	\N	created	App\\Models\\Psychology\\Test	17	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":25,"age":15,"terms_conditions":true,"type":"phq9a","id":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
549	\N	\N	created	App\\Models\\Psychology\\Result	233	[]	{"answer_id":1,"question_id":1,"test_id":17,"id":233}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
550	\N	\N	created	App\\Models\\Psychology\\Result	234	[]	{"answer_id":4,"question_id":2,"test_id":17,"id":234}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
551	\N	\N	created	App\\Models\\Psychology\\Result	235	[]	{"answer_id":5,"question_id":3,"test_id":17,"id":235}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
552	\N	\N	created	App\\Models\\Psychology\\Result	236	[]	{"answer_id":9,"question_id":4,"test_id":17,"id":236}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
553	\N	\N	created	App\\Models\\Psychology\\Result	237	[]	{"answer_id":14,"question_id":5,"test_id":17,"id":237}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
554	\N	\N	created	App\\Models\\Psychology\\Result	238	[]	{"answer_id":19,"question_id":6,"test_id":17,"id":238}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
555	\N	\N	created	App\\Models\\Psychology\\Result	239	[]	{"answer_id":22,"question_id":7,"test_id":17,"id":239}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
556	\N	\N	created	App\\Models\\Psychology\\Result	240	[]	{"answer_id":26,"question_id":8,"test_id":17,"id":240}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
557	\N	\N	created	App\\Models\\Psychology\\Result	241	[]	{"answer_id":30,"question_id":9,"test_id":17,"id":241}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
558	\N	\N	created	App\\Models\\Psychology\\Result	242	[]	{"answer_id":34,"question_id":10,"test_id":17,"id":242}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
559	\N	\N	created	App\\Models\\Psychology\\Result	243	[]	{"answer_id":37,"question_id":11,"test_id":17,"id":243}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
560	\N	\N	created	App\\Models\\Psychology\\Result	244	[]	{"answer_id":93,"question_id":29,"test_id":17,"id":244}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
561	\N	\N	updated	App\\Models\\Psychology\\Test	17	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-17-1750249920","score":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
562	\N	\N	created	App\\Models\\Psychology\\Agent	3	[]	{"test_id":17,"email":"yguerra@einstein.k12.ec","identification":"1713911963","lastname":"Guerra Guerra","name":"Gloria Maria","phone":"0999460418","id":3}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 16:50:59	2022-03-15 16:50:59
563	App\\Models\\Authentication\\User	12	created	App\\Models\\Authentication\\TransactionalCode	13	[]	{"username":"cesar.tamayo0204@gmail.com","token":1811,"id":13}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 18:54:29	2022-03-15 18:54:29
564	App\\Models\\Authentication\\User	12	created	App\\Models\\Authentication\\TransactionalCode	14	[]	{"username":"ceasr.tamayo0204@gmail.com","token":9864,"id":14}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 18:56:59	2022-03-15 18:56:59
565	App\\Models\\Authentication\\User	12	created	App\\Models\\Authentication\\TransactionalCode	15	[]	{"username":"cesar.tamayo0204@gmail.com","token":4599,"id":15}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 18:57:44	2022-03-15 18:57:44
566	App\\Models\\Authentication\\User	12	created	App\\Models\\Authentication\\TransactionalCode	16	[]	{"username":"cesar.tamayo0204@gmail.com","token":6650,"id":16}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-15 18:59:02	2022-03-15 18:59:02
569	\N	\N	created	App\\Models\\Authentication\\User	26	[]	{"name":"NSKAIDBS","email":"","lastname":"SJAKALSKAK","username":"9183819191","phone":"","password":"$2y$10$pWGJ3mroRy5mzv71Z45Mb.hSi3170rpwRq6Lz2rkLCdFmHko9qQay","id":26}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:15:47	2022-03-15 19:15:47
570	\N	\N	created	App\\Models\\Authentication\\User	27	[]	{"name":"SAMIA","email":"samia.cgarcia@gmail.com","lastname":"GARCIA","username":"1724619371","phone":"0284819191","password":"$2y$10$8ut9JxDlOz8qw.1GzypYEedeNfgnJPffZk8obGcKuLTz6IumnlOlS","id":27}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
571	\N	\N	created	App\\Models\\Psychology\\Test	19	[]	{"canton_id":292,"province_id":250,"state_id":1,"user_id":27,"age":18,"terms_conditions":true,"type":"psc17","id":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
572	\N	\N	created	App\\Models\\Psychology\\Result	245	[]	{"answer_id":2,"question_id":1,"test_id":19,"id":245}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
573	\N	\N	created	App\\Models\\Psychology\\Result	246	[]	{"answer_id":4,"question_id":2,"test_id":19,"id":246}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
574	\N	\N	created	App\\Models\\Psychology\\Result	247	[]	{"answer_id":43,"question_id":12,"test_id":19,"id":247}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
575	\N	\N	created	App\\Models\\Psychology\\Result	248	[]	{"answer_id":46,"question_id":13,"test_id":19,"id":248}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
576	\N	\N	created	App\\Models\\Psychology\\Result	249	[]	{"answer_id":49,"question_id":14,"test_id":19,"id":249}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
577	\N	\N	created	App\\Models\\Psychology\\Result	250	[]	{"answer_id":52,"question_id":15,"test_id":19,"id":250}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
578	\N	\N	created	App\\Models\\Psychology\\Result	251	[]	{"answer_id":54,"question_id":16,"test_id":19,"id":251}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
579	\N	\N	created	App\\Models\\Psychology\\Result	252	[]	{"answer_id":57,"question_id":17,"test_id":19,"id":252}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
580	\N	\N	created	App\\Models\\Psychology\\Result	253	[]	{"answer_id":59,"question_id":18,"test_id":19,"id":253}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
581	\N	\N	created	App\\Models\\Psychology\\Result	254	[]	{"answer_id":62,"question_id":19,"test_id":19,"id":254}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
582	\N	\N	created	App\\Models\\Psychology\\Result	255	[]	{"answer_id":66,"question_id":20,"test_id":19,"id":255}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
583	\N	\N	created	App\\Models\\Psychology\\Result	256	[]	{"answer_id":70,"question_id":21,"test_id":19,"id":256}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
584	\N	\N	created	App\\Models\\Psychology\\Result	257	[]	{"answer_id":72,"question_id":22,"test_id":19,"id":257}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
585	\N	\N	created	App\\Models\\Psychology\\Result	258	[]	{"answer_id":74,"question_id":23,"test_id":19,"id":258}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
586	\N	\N	created	App\\Models\\Psychology\\Result	259	[]	{"answer_id":79,"question_id":24,"test_id":19,"id":259}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
587	\N	\N	created	App\\Models\\Psychology\\Result	260	[]	{"answer_id":82,"question_id":25,"test_id":19,"id":260}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
588	\N	\N	created	App\\Models\\Psychology\\Result	261	[]	{"answer_id":84,"question_id":26,"test_id":19,"id":261}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
591	\N	\N	created	App\\Models\\Psychology\\Result	264	[]	{"answer_id":93,"question_id":29,"test_id":19,"id":264}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
592	\N	\N	updated	App\\Models\\Psychology\\Test	19	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"02-19-1724619371","score":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-15 19:27:16	2022-03-15 19:27:16
593	\N	\N	created	App\\Models\\Authentication\\User	28	[]	{"name":"JFKAJSIA","email":"samia.cgarcia@gmail.com","lastname":"SMISIDJAK","username":"1973819191","phone":"29382829","password":"$2y$10$q2bCtywVrA0PJYb2XVzRKOJM7bqZQdaeC29LbDbLYQRW5WKA.6FBe","id":28}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
594	\N	\N	created	App\\Models\\Psychology\\Test	20	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":28,"age":18,"terms_conditions":true,"type":"phq9a","id":20}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
595	\N	\N	created	App\\Models\\Psychology\\Result	265	[]	{"answer_id":1,"question_id":1,"test_id":20,"id":265}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
596	\N	\N	created	App\\Models\\Psychology\\Result	266	[]	{"answer_id":3,"question_id":2,"test_id":20,"id":266}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
597	\N	\N	created	App\\Models\\Psychology\\Result	267	[]	{"answer_id":6,"question_id":3,"test_id":20,"id":267}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
598	\N	\N	created	App\\Models\\Psychology\\Result	268	[]	{"answer_id":10,"question_id":4,"test_id":20,"id":268}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
599	\N	\N	created	App\\Models\\Psychology\\Result	269	[]	{"answer_id":14,"question_id":5,"test_id":20,"id":269}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
600	\N	\N	created	App\\Models\\Psychology\\Result	270	[]	{"answer_id":19,"question_id":6,"test_id":20,"id":270}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
601	\N	\N	created	App\\Models\\Psychology\\Result	271	[]	{"answer_id":22,"question_id":7,"test_id":20,"id":271}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
602	\N	\N	created	App\\Models\\Psychology\\Result	272	[]	{"answer_id":28,"question_id":8,"test_id":20,"id":272}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
603	\N	\N	created	App\\Models\\Psychology\\Result	273	[]	{"answer_id":29,"question_id":9,"test_id":20,"id":273}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
604	\N	\N	created	App\\Models\\Psychology\\Result	274	[]	{"answer_id":33,"question_id":10,"test_id":20,"id":274}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
605	\N	\N	created	App\\Models\\Psychology\\Result	275	[]	{"answer_id":39,"question_id":11,"test_id":20,"id":275}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
606	\N	\N	created	App\\Models\\Psychology\\Result	276	[]	{"answer_id":93,"question_id":29,"test_id":20,"id":276}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-17 21:06:56	2022-03-17 21:06:56
607	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	29	[]	{"name":"DASD","email":"cesar.tamayo0204@gmail.com","lastname":"LOPEZ","username":"1234567899","phone":"1231232131","password":"$2y$10$SBESOE\\/7X\\/nw6IrzOOrZ\\/uAyju5LWwefQ272OZS6Wkb8NFi29cree","id":29}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
608	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	21	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":29,"age":18,"terms_conditions":true,"type":"phq9a","id":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
609	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	277	[]	{"answer_id":1,"question_id":1,"test_id":21,"id":277}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
610	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	278	[]	{"answer_id":4,"question_id":2,"test_id":21,"id":278}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
611	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	279	[]	{"answer_id":7,"question_id":3,"test_id":21,"id":279}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
612	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	280	[]	{"answer_id":10,"question_id":4,"test_id":21,"id":280}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
613	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	281	[]	{"answer_id":15,"question_id":5,"test_id":21,"id":281}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
614	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	282	[]	{"answer_id":18,"question_id":6,"test_id":21,"id":282}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
615	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	283	[]	{"answer_id":23,"question_id":7,"test_id":21,"id":283}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
616	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	284	[]	{"answer_id":25,"question_id":8,"test_id":21,"id":284}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
617	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	285	[]	{"answer_id":32,"question_id":9,"test_id":21,"id":285}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
618	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	286	[]	{"answer_id":34,"question_id":10,"test_id":21,"id":286}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:06	2022-03-17 21:39:06
619	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	287	[]	{"answer_id":39,"question_id":11,"test_id":21,"id":287}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:07	2022-03-17 21:39:07
620	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	288	[]	{"answer_id":92,"question_id":29,"test_id":21,"id":288}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:39:07	2022-03-17 21:39:07
621	\N	\N	updated	App\\Models\\Authentication\\User	6	{"email":"sistemas@esquel.org.ec","lastname":"PIEDRA","name":"DARIO","password":"$2y$10$QiJ5MI9SqXJ00cagsEMTzekaI9lJyyG0dTTP6brJ719puCsj7raLK","phone":""}	{"email":"bdjejfklqjsy@ndkf.com","lastname":"KFIRORK","name":"FDAHRIC","password":"$2y$10$I4hTnjMki5tzrgK6hQT0Q.DPKOxfCY4WWgJ7Jo\\/lWtLbjkkPElh1u","phone":"9864784930"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
622	\N	\N	created	App\\Models\\Psychology\\Test	22	[]	{"canton_id":321,"province_id":254,"state_id":1,"user_id":6,"age":18,"terms_conditions":true,"type":"psc17","id":22}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
623	\N	\N	created	App\\Models\\Psychology\\Result	289	[]	{"answer_id":2,"question_id":1,"test_id":22,"id":289}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
624	\N	\N	created	App\\Models\\Psychology\\Result	290	[]	{"answer_id":4,"question_id":2,"test_id":22,"id":290}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
625	\N	\N	created	App\\Models\\Psychology\\Result	291	[]	{"answer_id":41,"question_id":12,"test_id":22,"id":291}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
626	\N	\N	created	App\\Models\\Psychology\\Result	292	[]	{"answer_id":44,"question_id":13,"test_id":22,"id":292}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
627	\N	\N	created	App\\Models\\Psychology\\Result	293	[]	{"answer_id":47,"question_id":14,"test_id":22,"id":293}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
628	\N	\N	created	App\\Models\\Psychology\\Result	294	[]	{"answer_id":50,"question_id":15,"test_id":22,"id":294}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
629	\N	\N	created	App\\Models\\Psychology\\Result	295	[]	{"answer_id":53,"question_id":16,"test_id":22,"id":295}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
630	\N	\N	created	App\\Models\\Psychology\\Result	296	[]	{"answer_id":56,"question_id":17,"test_id":22,"id":296}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
631	\N	\N	created	App\\Models\\Psychology\\Result	297	[]	{"answer_id":59,"question_id":18,"test_id":22,"id":297}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
632	\N	\N	created	App\\Models\\Psychology\\Result	298	[]	{"answer_id":62,"question_id":19,"test_id":22,"id":298}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
633	\N	\N	created	App\\Models\\Psychology\\Result	299	[]	{"answer_id":65,"question_id":20,"test_id":22,"id":299}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
634	\N	\N	created	App\\Models\\Psychology\\Result	300	[]	{"answer_id":68,"question_id":21,"test_id":22,"id":300}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
635	\N	\N	created	App\\Models\\Psychology\\Result	301	[]	{"answer_id":71,"question_id":22,"test_id":22,"id":301}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
636	\N	\N	created	App\\Models\\Psychology\\Result	302	[]	{"answer_id":74,"question_id":23,"test_id":22,"id":302}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
637	\N	\N	created	App\\Models\\Psychology\\Result	303	[]	{"answer_id":77,"question_id":24,"test_id":22,"id":303}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
638	\N	\N	created	App\\Models\\Psychology\\Result	304	[]	{"answer_id":80,"question_id":25,"test_id":22,"id":304}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
639	\N	\N	created	App\\Models\\Psychology\\Result	305	[]	{"answer_id":83,"question_id":26,"test_id":22,"id":305}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
640	\N	\N	created	App\\Models\\Psychology\\Result	306	[]	{"answer_id":86,"question_id":27,"test_id":22,"id":306}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
641	\N	\N	created	App\\Models\\Psychology\\Result	307	[]	{"answer_id":89,"question_id":28,"test_id":22,"id":307}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
642	\N	\N	created	App\\Models\\Psychology\\Result	308	[]	{"answer_id":93,"question_id":29,"test_id":22,"id":308}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
643	\N	\N	updated	App\\Models\\Psychology\\Test	22	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"06-22-1717175366","score":0}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9 Pro) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/96.0.4664.104 Mobile Safari/537.36 OPR/67.1.3508.63168	\N	2022-03-17 21:39:15	2022-03-17 21:39:15
644	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	30	[]	{"name":"ASDASD","email":"cesar.tamayo0204@gmail.com","lastname":"ASDASD","username":"123121313","phone":"1231231231","password":"$2y$10$RzJ5fyjwdPX4YQtYmsh8yOmJDf3Y6NB1oi0BfhI\\/XS9YdTVFmdLBC","id":30}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
645	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	23	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":30,"age":18,"terms_conditions":true,"type":"phq9a","id":23}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
646	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	309	[]	{"answer_id":1,"question_id":1,"test_id":23,"id":309}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
647	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	310	[]	{"answer_id":4,"question_id":2,"test_id":23,"id":310}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
648	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	311	[]	{"answer_id":6,"question_id":3,"test_id":23,"id":311}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
649	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	312	[]	{"answer_id":11,"question_id":4,"test_id":23,"id":312}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
650	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	313	[]	{"answer_id":16,"question_id":5,"test_id":23,"id":313}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
651	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	314	[]	{"answer_id":18,"question_id":6,"test_id":23,"id":314}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
652	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	315	[]	{"answer_id":22,"question_id":7,"test_id":23,"id":315}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
653	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	316	[]	{"answer_id":27,"question_id":8,"test_id":23,"id":316}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
654	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	317	[]	{"answer_id":32,"question_id":9,"test_id":23,"id":317}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
655	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	318	[]	{"answer_id":35,"question_id":10,"test_id":23,"id":318}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
656	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	319	[]	{"answer_id":40,"question_id":11,"test_id":23,"id":319}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
657	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	320	[]	{"answer_id":92,"question_id":29,"test_id":23,"id":320}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:49:38	2022-03-17 21:49:38
658	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	31	[]	{"name":"ASDASDASD","email":"cesar.tamayo0204@gmail.com","lastname":"ASDASD","username":"1231221312","phone":"1231231231","password":"$2y$10$G\\/F6xoaOvRnsRUMaLUYNB.opAkBXJuhz2sxxOQLzhDRmfDV9cZbIi","id":31}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
659	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	24	[]	{"canton_id":292,"province_id":250,"state_id":1,"user_id":31,"age":18,"terms_conditions":true,"type":"phq9a","id":24}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
660	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	321	[]	{"answer_id":1,"question_id":1,"test_id":24,"id":321}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
661	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	322	[]	{"answer_id":4,"question_id":2,"test_id":24,"id":322}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
662	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	323	[]	{"answer_id":6,"question_id":3,"test_id":24,"id":323}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
663	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	324	[]	{"answer_id":11,"question_id":4,"test_id":24,"id":324}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
664	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	325	[]	{"answer_id":14,"question_id":5,"test_id":24,"id":325}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
665	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	326	[]	{"answer_id":19,"question_id":6,"test_id":24,"id":326}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
666	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	327	[]	{"answer_id":24,"question_id":7,"test_id":24,"id":327}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
667	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	328	[]	{"answer_id":28,"question_id":8,"test_id":24,"id":328}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
668	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	329	[]	{"answer_id":32,"question_id":9,"test_id":24,"id":329}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
669	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	330	[]	{"answer_id":36,"question_id":10,"test_id":24,"id":330}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
670	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	331	[]	{"answer_id":40,"question_id":11,"test_id":24,"id":331}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
671	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	332	[]	{"answer_id":93,"question_id":29,"test_id":24,"id":332}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:52:35	2022-03-17 21:52:35
672	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	32	[]	{"name":"ADSASD","email":"cesar.tamayo0204@gmail.com","lastname":"ASDASDASD","username":"1231231312","phone":"123123121","password":"$2y$10$684usiBpH7fi51d0NxhC\\/u.xf2.L0nOR6YkmA\\/8BTtEVFLcDyDZA.","id":32}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
673	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	25	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":32,"age":18,"terms_conditions":true,"type":"phq9a","id":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
674	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	333	[]	{"answer_id":1,"question_id":1,"test_id":25,"id":333}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
675	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	334	[]	{"answer_id":3,"question_id":2,"test_id":25,"id":334}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
676	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	335	[]	{"answer_id":7,"question_id":3,"test_id":25,"id":335}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
677	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	336	[]	{"answer_id":11,"question_id":4,"test_id":25,"id":336}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
678	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	337	[]	{"answer_id":15,"question_id":5,"test_id":25,"id":337}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
679	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	338	[]	{"answer_id":19,"question_id":6,"test_id":25,"id":338}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
680	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	339	[]	{"answer_id":22,"question_id":7,"test_id":25,"id":339}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
681	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	340	[]	{"answer_id":26,"question_id":8,"test_id":25,"id":340}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
682	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	341	[]	{"answer_id":31,"question_id":9,"test_id":25,"id":341}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
683	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	342	[]	{"answer_id":34,"question_id":10,"test_id":25,"id":342}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
684	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	343	[]	{"answer_id":40,"question_id":11,"test_id":25,"id":343}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
685	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	344	[]	{"answer_id":92,"question_id":29,"test_id":25,"id":344}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:38	2022-03-17 21:55:38
686	App\\Models\\Authentication\\User	13	updated	App\\Models\\Psychology\\Test	25	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-25-1231231312","score":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36	\N	2022-03-17 21:55:39	2022-03-17 21:55:39
687	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	18	[]	{"username":"samia.cgarcia@gmail.com","token":5174,"id":18}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:45:05	2022-03-18 11:45:05
688	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	19	[]	{"username":"samia.cgarcia@gmail.com","token":6702,"id":19}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:45:12	2022-03-18 11:45:12
689	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	20	[]	{"username":"samia.cgarcia@gmail.com","token":1968,"id":20}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:45:18	2022-03-18 11:45:18
690	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	21	[]	{"username":"samia.cgarcia@gmail.com","token":2219,"id":21}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:45:22	2022-03-18 11:45:22
691	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	22	[]	{"username":"samia.cgarcia@gmail.com","token":3487,"id":22}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:45:23	2022-03-18 11:45:23
692	\N	\N	updated	App\\Models\\Authentication\\User	1	{"email":"destiney77@example.com","lastname":"WALSH","name":"DR. RILEY MCKENZIE II","password":"$2y$10$yaPw7A6MOxvrYjPAR2fMh.54uUm3DrvDUHtbFSzcYuhzSSSL2aG.O","phone":"518.747.4283"}	{"email":"floresk560@gmail.com","lastname":"FLORES ARTEAGA","name":"KEVIN STEVEN","password":"$2y$10$aaSrV87YJa4Dv4KyGSJf2ujxLdxguXGr.Vcu855gWFP4rw2XwWY3e","phone":"0987945056"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
693	\N	\N	created	App\\Models\\Psychology\\Test	26	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":1,"age":18,"terms_conditions":true,"type":"psc17","id":26}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
694	\N	\N	created	App\\Models\\Psychology\\Result	345	[]	{"answer_id":2,"question_id":1,"test_id":26,"id":345}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
695	\N	\N	created	App\\Models\\Psychology\\Result	346	[]	{"answer_id":4,"question_id":2,"test_id":26,"id":346}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
696	\N	\N	created	App\\Models\\Psychology\\Result	347	[]	{"answer_id":41,"question_id":12,"test_id":26,"id":347}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
697	\N	\N	created	App\\Models\\Psychology\\Result	348	[]	{"answer_id":44,"question_id":13,"test_id":26,"id":348}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
698	\N	\N	created	App\\Models\\Psychology\\Result	349	[]	{"answer_id":47,"question_id":14,"test_id":26,"id":349}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
699	\N	\N	created	App\\Models\\Psychology\\Result	350	[]	{"answer_id":50,"question_id":15,"test_id":26,"id":350}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
700	\N	\N	created	App\\Models\\Psychology\\Result	351	[]	{"answer_id":53,"question_id":16,"test_id":26,"id":351}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
701	\N	\N	created	App\\Models\\Psychology\\Result	352	[]	{"answer_id":56,"question_id":17,"test_id":26,"id":352}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
702	\N	\N	created	App\\Models\\Psychology\\Result	353	[]	{"answer_id":59,"question_id":18,"test_id":26,"id":353}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
703	\N	\N	created	App\\Models\\Psychology\\Result	354	[]	{"answer_id":62,"question_id":19,"test_id":26,"id":354}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
704	\N	\N	created	App\\Models\\Psychology\\Result	355	[]	{"answer_id":65,"question_id":20,"test_id":26,"id":355}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
705	\N	\N	created	App\\Models\\Psychology\\Result	356	[]	{"answer_id":68,"question_id":21,"test_id":26,"id":356}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
706	\N	\N	created	App\\Models\\Psychology\\Result	357	[]	{"answer_id":71,"question_id":22,"test_id":26,"id":357}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
707	\N	\N	created	App\\Models\\Psychology\\Result	358	[]	{"answer_id":74,"question_id":23,"test_id":26,"id":358}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
708	\N	\N	created	App\\Models\\Psychology\\Result	359	[]	{"answer_id":79,"question_id":24,"test_id":26,"id":359}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
709	\N	\N	created	App\\Models\\Psychology\\Result	360	[]	{"answer_id":80,"question_id":25,"test_id":26,"id":360}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
710	\N	\N	created	App\\Models\\Psychology\\Result	361	[]	{"answer_id":83,"question_id":26,"test_id":26,"id":361}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
711	\N	\N	created	App\\Models\\Psychology\\Result	362	[]	{"answer_id":86,"question_id":27,"test_id":26,"id":362}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
712	\N	\N	created	App\\Models\\Psychology\\Result	363	[]	{"answer_id":89,"question_id":28,"test_id":26,"id":363}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
713	\N	\N	created	App\\Models\\Psychology\\Result	364	[]	{"answer_id":93,"question_id":29,"test_id":26,"id":364}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:49:59	2022-03-18 11:49:59
714	\N	\N	updated	App\\Models\\Psychology\\Test	26	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"17-26-1234567890","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SM-A013M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:00	2022-03-18 11:50:00
715	\N	\N	created	App\\Models\\Authentication\\User	33	[]	{"name":"KARLA","email":"kjazmerizalde@gmail.com","lastname":"VALDIVIEZO","username":"0780448838","phone":"0984528838","password":"$2y$10$gRDftrQcrpK0QdPBoqqVset\\/9xJQE\\/voOGyGueJ3i3xHJGqxsdgF2","id":33}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
716	\N	\N	created	App\\Models\\Psychology\\Test	27	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":33,"age":18,"terms_conditions":true,"type":"phq9a","id":27}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
717	\N	\N	created	App\\Models\\Psychology\\Result	365	[]	{"answer_id":1,"question_id":1,"test_id":27,"id":365}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
718	\N	\N	created	App\\Models\\Psychology\\Result	366	[]	{"answer_id":4,"question_id":2,"test_id":27,"id":366}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
719	\N	\N	created	App\\Models\\Psychology\\Result	367	[]	{"answer_id":5,"question_id":3,"test_id":27,"id":367}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
720	\N	\N	created	App\\Models\\Psychology\\Result	368	[]	{"answer_id":9,"question_id":4,"test_id":27,"id":368}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
721	\N	\N	created	App\\Models\\Psychology\\Result	369	[]	{"answer_id":14,"question_id":5,"test_id":27,"id":369}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
722	\N	\N	created	App\\Models\\Psychology\\Result	370	[]	{"answer_id":18,"question_id":6,"test_id":27,"id":370}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:02	2022-03-18 11:50:02
725	\N	\N	created	App\\Models\\Psychology\\Result	373	[]	{"answer_id":30,"question_id":9,"test_id":27,"id":373}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
726	\N	\N	created	App\\Models\\Psychology\\Result	374	[]	{"answer_id":34,"question_id":10,"test_id":27,"id":374}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
727	\N	\N	created	App\\Models\\Psychology\\Result	375	[]	{"answer_id":37,"question_id":11,"test_id":27,"id":375}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
728	\N	\N	created	App\\Models\\Psychology\\Result	376	[]	{"answer_id":93,"question_id":29,"test_id":27,"id":376}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
729	\N	\N	updated	App\\Models\\Psychology\\Test	27	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-27-0780448838","score":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.1; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:50:03	2022-03-18 11:50:03
730	\N	\N	created	App\\Models\\Authentication\\User	34	[]	{"name":"MARIA GABRIELA","email":"gabrielamora_urquizo@hotmail.com","lastname":"MORA URQUIZO","username":"0931063663","phone":"0962564943","password":"$2y$10$.DvD9TkH0tZdex4dtjsQ5.74ymcW\\/wEGkzp7c8xU3KPVVAmKqZ3ay","id":34}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
731	\N	\N	created	App\\Models\\Psychology\\Test	28	[]	{"canton_id":460,"province_id":266,"state_id":1,"user_id":34,"age":18,"terms_conditions":true,"type":"psc17","id":28}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
732	\N	\N	created	App\\Models\\Psychology\\Result	377	[]	{"answer_id":2,"question_id":1,"test_id":28,"id":377}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
733	\N	\N	created	App\\Models\\Psychology\\Result	378	[]	{"answer_id":4,"question_id":2,"test_id":28,"id":378}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
734	\N	\N	created	App\\Models\\Psychology\\Result	379	[]	{"answer_id":42,"question_id":12,"test_id":28,"id":379}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
735	\N	\N	created	App\\Models\\Psychology\\Result	380	[]	{"answer_id":45,"question_id":13,"test_id":28,"id":380}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
736	\N	\N	created	App\\Models\\Psychology\\Result	381	[]	{"answer_id":47,"question_id":14,"test_id":28,"id":381}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
737	\N	\N	created	App\\Models\\Psychology\\Result	382	[]	{"answer_id":50,"question_id":15,"test_id":28,"id":382}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
738	\N	\N	created	App\\Models\\Psychology\\Result	383	[]	{"answer_id":53,"question_id":16,"test_id":28,"id":383}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
739	\N	\N	created	App\\Models\\Psychology\\Result	384	[]	{"answer_id":56,"question_id":17,"test_id":28,"id":384}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
740	\N	\N	created	App\\Models\\Psychology\\Result	385	[]	{"answer_id":60,"question_id":18,"test_id":28,"id":385}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
741	\N	\N	created	App\\Models\\Psychology\\Result	386	[]	{"answer_id":62,"question_id":19,"test_id":28,"id":386}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
742	\N	\N	created	App\\Models\\Psychology\\Result	387	[]	{"answer_id":66,"question_id":20,"test_id":28,"id":387}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
743	\N	\N	created	App\\Models\\Psychology\\Result	388	[]	{"answer_id":68,"question_id":21,"test_id":28,"id":388}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
744	\N	\N	created	App\\Models\\Psychology\\Result	389	[]	{"answer_id":71,"question_id":22,"test_id":28,"id":389}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
745	\N	\N	created	App\\Models\\Psychology\\Result	390	[]	{"answer_id":74,"question_id":23,"test_id":28,"id":390}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
746	\N	\N	created	App\\Models\\Psychology\\Result	391	[]	{"answer_id":78,"question_id":24,"test_id":28,"id":391}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
747	\N	\N	created	App\\Models\\Psychology\\Result	392	[]	{"answer_id":81,"question_id":25,"test_id":28,"id":392}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
748	\N	\N	created	App\\Models\\Psychology\\Result	393	[]	{"answer_id":84,"question_id":26,"test_id":28,"id":393}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
749	\N	\N	created	App\\Models\\Psychology\\Result	394	[]	{"answer_id":86,"question_id":27,"test_id":28,"id":394}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
750	\N	\N	created	App\\Models\\Psychology\\Result	395	[]	{"answer_id":90,"question_id":28,"test_id":28,"id":395}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
751	\N	\N	created	App\\Models\\Psychology\\Result	396	[]	{"answer_id":93,"question_id":29,"test_id":28,"id":396}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
752	\N	\N	updated	App\\Models\\Psychology\\Test	28	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"18-28-0931063663","score":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.1.0; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:35	2022-03-18 11:50:35
753	\N	\N	created	App\\Models\\Authentication\\User	35	[]	{"name":"CARLOS","email":"danibriones98@gmail.com","lastname":"BRIONES BUENO","username":"0984817903","phone":"0928148939","password":"$2y$10$eHbkNHrizA48Bi.C6RbVWOvgO11qDjGbpIQW2dJX2PD5p\\/qwYtAPi","id":35}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
754	\N	\N	created	App\\Models\\Psychology\\Test	29	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":35,"age":18,"terms_conditions":true,"type":"phq9a","id":29}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
755	\N	\N	created	App\\Models\\Psychology\\Result	397	[]	{"answer_id":1,"question_id":1,"test_id":29,"id":397}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
756	\N	\N	created	App\\Models\\Psychology\\Result	398	[]	{"answer_id":3,"question_id":2,"test_id":29,"id":398}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
757	\N	\N	created	App\\Models\\Psychology\\Result	399	[]	{"answer_id":8,"question_id":3,"test_id":29,"id":399}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
758	\N	\N	created	App\\Models\\Psychology\\Result	400	[]	{"answer_id":12,"question_id":4,"test_id":29,"id":400}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
759	\N	\N	created	App\\Models\\Psychology\\Result	401	[]	{"answer_id":15,"question_id":5,"test_id":29,"id":401}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
760	\N	\N	created	App\\Models\\Psychology\\Result	402	[]	{"answer_id":18,"question_id":6,"test_id":29,"id":402}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
761	\N	\N	created	App\\Models\\Psychology\\Result	403	[]	{"answer_id":24,"question_id":7,"test_id":29,"id":403}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
762	\N	\N	created	App\\Models\\Psychology\\Result	404	[]	{"answer_id":26,"question_id":8,"test_id":29,"id":404}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
763	\N	\N	created	App\\Models\\Psychology\\Result	405	[]	{"answer_id":32,"question_id":9,"test_id":29,"id":405}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
764	\N	\N	created	App\\Models\\Psychology\\Result	406	[]	{"answer_id":34,"question_id":10,"test_id":29,"id":406}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
765	\N	\N	created	App\\Models\\Psychology\\Result	407	[]	{"answer_id":37,"question_id":11,"test_id":29,"id":407}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
766	\N	\N	created	App\\Models\\Psychology\\Result	408	[]	{"answer_id":93,"question_id":29,"test_id":29,"id":408}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
767	\N	\N	updated	App\\Models\\Psychology\\Test	29	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"17-29-0984817903","score":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2007J22G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:50:51	2022-03-18 11:50:51
768	App\\Models\\Authentication\\User	20	updated	App\\Models\\Authentication\\User	20	{"lastname":"GARCIA","name":"SAMIA","password":"$2y$10$6V6Tt96G75dIdqwnkocYtOxtUTvrsI36Yh1O6vmidGo\\/AmSJ5BWMC","phone":null}	{"lastname":"GARCIA REINOSO","name":"SAMIA CORINA","password":"$2y$10$Oy4e4XyEBxedo6jo1SoP7eugH0xFKnP2ZZpb0zFQaVNnCzGnPGygm","phone":"0928091839"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
769	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Test	30	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":20,"age":18,"terms_conditions":true,"type":"phq9a","id":30}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
770	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	409	[]	{"answer_id":1,"question_id":1,"test_id":30,"id":409}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
771	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	410	[]	{"answer_id":4,"question_id":2,"test_id":30,"id":410}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
772	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	411	[]	{"answer_id":5,"question_id":3,"test_id":30,"id":411}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
773	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	412	[]	{"answer_id":10,"question_id":4,"test_id":30,"id":412}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
774	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	413	[]	{"answer_id":15,"question_id":5,"test_id":30,"id":413}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
775	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	414	[]	{"answer_id":19,"question_id":6,"test_id":30,"id":414}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
776	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	415	[]	{"answer_id":22,"question_id":7,"test_id":30,"id":415}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
777	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	416	[]	{"answer_id":25,"question_id":8,"test_id":30,"id":416}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
778	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	417	[]	{"answer_id":30,"question_id":9,"test_id":30,"id":417}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
779	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	418	[]	{"answer_id":33,"question_id":10,"test_id":30,"id":418}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
780	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	419	[]	{"answer_id":37,"question_id":11,"test_id":30,"id":419}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
781	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	420	[]	{"answer_id":93,"question_id":29,"test_id":30,"id":420}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
782	App\\Models\\Authentication\\User	20	updated	App\\Models\\Psychology\\Test	30	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"18-30-1724581218","score":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 11:51:00	2022-03-18 11:51:00
783	\N	\N	created	App\\Models\\Authentication\\User	36	[]	{"name":"LILIAN ESTEFANIA","email":"lily.llive1@gmail.com","lastname":"LLIVE BASTIDAS","username":"1725985368","phone":"0992579221","password":"$2y$10$xtFWOZn2dEscY2.HgkNLbuwpjD4HIPYiG4TUzOe\\/Ctwv2BO5UCW\\/.","id":36}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
784	\N	\N	created	App\\Models\\Psychology\\Test	31	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":36,"age":18,"terms_conditions":true,"type":"phq9a","id":31}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
785	\N	\N	created	App\\Models\\Psychology\\Result	421	[]	{"answer_id":1,"question_id":1,"test_id":31,"id":421}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
786	\N	\N	created	App\\Models\\Psychology\\Result	422	[]	{"answer_id":3,"question_id":2,"test_id":31,"id":422}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
787	\N	\N	created	App\\Models\\Psychology\\Result	423	[]	{"answer_id":6,"question_id":3,"test_id":31,"id":423}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
788	\N	\N	created	App\\Models\\Psychology\\Result	424	[]	{"answer_id":10,"question_id":4,"test_id":31,"id":424}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
789	\N	\N	created	App\\Models\\Psychology\\Result	425	[]	{"answer_id":13,"question_id":5,"test_id":31,"id":425}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
790	\N	\N	created	App\\Models\\Psychology\\Result	426	[]	{"answer_id":19,"question_id":6,"test_id":31,"id":426}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
791	\N	\N	created	App\\Models\\Psychology\\Result	427	[]	{"answer_id":23,"question_id":7,"test_id":31,"id":427}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
792	\N	\N	created	App\\Models\\Psychology\\Result	428	[]	{"answer_id":26,"question_id":8,"test_id":31,"id":428}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
793	\N	\N	created	App\\Models\\Psychology\\Result	429	[]	{"answer_id":30,"question_id":9,"test_id":31,"id":429}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
794	\N	\N	created	App\\Models\\Psychology\\Result	430	[]	{"answer_id":33,"question_id":10,"test_id":31,"id":430}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
795	\N	\N	created	App\\Models\\Psychology\\Result	431	[]	{"answer_id":37,"question_id":11,"test_id":31,"id":431}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
796	\N	\N	created	App\\Models\\Psychology\\Result	432	[]	{"answer_id":92,"question_id":29,"test_id":31,"id":432}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:35	2022-03-18 11:57:35
797	\N	\N	updated	App\\Models\\Psychology\\Test	31	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"17-31-1725985368","score":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 11:57:36	2022-03-18 11:57:36
798	\N	\N	created	App\\Models\\Authentication\\User	37	[]	{"name":"GABRIELA DANIELA","email":"oviedogabriela96@gmail.com","lastname":"OVIEDO OVIEDO","username":"1105542094","phone":"0979864926","password":"$2y$10$AulGDKWX\\/BBMYxhmfNca2uiNpxj0LNms5jirb8qDRbC.GnEQWTOg6","id":37}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
799	\N	\N	created	App\\Models\\Psychology\\Test	32	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":37,"age":18,"terms_conditions":true,"type":"phq9a","id":32}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
800	\N	\N	created	App\\Models\\Psychology\\Result	433	[]	{"answer_id":1,"question_id":1,"test_id":32,"id":433}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
801	\N	\N	created	App\\Models\\Psychology\\Result	434	[]	{"answer_id":4,"question_id":2,"test_id":32,"id":434}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
802	\N	\N	created	App\\Models\\Psychology\\Result	435	[]	{"answer_id":5,"question_id":3,"test_id":32,"id":435}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
803	\N	\N	created	App\\Models\\Psychology\\Result	436	[]	{"answer_id":10,"question_id":4,"test_id":32,"id":436}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
804	\N	\N	created	App\\Models\\Psychology\\Result	437	[]	{"answer_id":13,"question_id":5,"test_id":32,"id":437}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
805	\N	\N	created	App\\Models\\Psychology\\Result	438	[]	{"answer_id":18,"question_id":6,"test_id":32,"id":438}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
806	\N	\N	created	App\\Models\\Psychology\\Result	439	[]	{"answer_id":22,"question_id":7,"test_id":32,"id":439}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
807	\N	\N	created	App\\Models\\Psychology\\Result	440	[]	{"answer_id":25,"question_id":8,"test_id":32,"id":440}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
808	\N	\N	created	App\\Models\\Psychology\\Result	441	[]	{"answer_id":29,"question_id":9,"test_id":32,"id":441}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
809	\N	\N	created	App\\Models\\Psychology\\Result	442	[]	{"answer_id":33,"question_id":10,"test_id":32,"id":442}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
810	\N	\N	created	App\\Models\\Psychology\\Result	443	[]	{"answer_id":37,"question_id":11,"test_id":32,"id":443}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
811	\N	\N	created	App\\Models\\Psychology\\Result	444	[]	{"answer_id":92,"question_id":29,"test_id":32,"id":444}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
812	\N	\N	updated	App\\Models\\Psychology\\Test	32	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-32-1105542094","score":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; BLL-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 11:59:01	2022-03-18 11:59:01
813	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	23	[]	{"username":"fanny@hotmail.com","token":8889,"id":23}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 12:00:49	2022-03-18 12:00:49
814	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	24	[]	{"username":"fanny@hotmail.com","token":5588,"id":24}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 12:00:52	2022-03-18 12:00:52
815	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	25	[]	{"username":"fanny_luz@hotmail.com","token":5965,"id":25}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 12:00:59	2022-03-18 12:00:59
816	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	26	[]	{"username":"fanny_luz@hotmail.com","token":7008,"id":26}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 12:01:08	2022-03-18 12:01:08
817	\N	\N	created	App\\Models\\Authentication\\User	38	[]	{"name":"SAMIA","email":"samia.cgarcia@gmail.com","lastname":"GARCIA","username":"1727271818","phone":"1837181919","password":"$2y$10$mNkaHZQNGru2sh2TFroh\\/..HYpRAezDT6Ag144R4a36orUH2l8ZDO","id":38}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
818	\N	\N	created	App\\Models\\Psychology\\Test	33	[]	{"canton_id":321,"province_id":254,"state_id":1,"user_id":38,"age":18,"terms_conditions":true,"type":"psc17","id":33}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
819	\N	\N	created	App\\Models\\Psychology\\Result	445	[]	{"answer_id":2,"question_id":1,"test_id":33,"id":445}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
820	\N	\N	created	App\\Models\\Psychology\\Result	446	[]	{"answer_id":4,"question_id":2,"test_id":33,"id":446}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
821	\N	\N	created	App\\Models\\Psychology\\Result	447	[]	{"answer_id":42,"question_id":12,"test_id":33,"id":447}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
822	\N	\N	created	App\\Models\\Psychology\\Result	448	[]	{"answer_id":45,"question_id":13,"test_id":33,"id":448}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
823	\N	\N	created	App\\Models\\Psychology\\Result	449	[]	{"answer_id":48,"question_id":14,"test_id":33,"id":449}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
824	\N	\N	created	App\\Models\\Psychology\\Result	450	[]	{"answer_id":51,"question_id":15,"test_id":33,"id":450}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
825	\N	\N	created	App\\Models\\Psychology\\Result	451	[]	{"answer_id":54,"question_id":16,"test_id":33,"id":451}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
826	\N	\N	created	App\\Models\\Psychology\\Result	452	[]	{"answer_id":57,"question_id":17,"test_id":33,"id":452}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
827	\N	\N	created	App\\Models\\Psychology\\Result	453	[]	{"answer_id":59,"question_id":18,"test_id":33,"id":453}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
828	\N	\N	created	App\\Models\\Psychology\\Result	454	[]	{"answer_id":62,"question_id":19,"test_id":33,"id":454}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
829	\N	\N	created	App\\Models\\Psychology\\Result	455	[]	{"answer_id":65,"question_id":20,"test_id":33,"id":455}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
830	\N	\N	created	App\\Models\\Psychology\\Result	456	[]	{"answer_id":68,"question_id":21,"test_id":33,"id":456}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
831	\N	\N	created	App\\Models\\Psychology\\Result	457	[]	{"answer_id":71,"question_id":22,"test_id":33,"id":457}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
832	\N	\N	created	App\\Models\\Psychology\\Result	458	[]	{"answer_id":76,"question_id":23,"test_id":33,"id":458}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
833	\N	\N	created	App\\Models\\Psychology\\Result	459	[]	{"answer_id":79,"question_id":24,"test_id":33,"id":459}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
834	\N	\N	created	App\\Models\\Psychology\\Result	460	[]	{"answer_id":82,"question_id":25,"test_id":33,"id":460}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
835	\N	\N	created	App\\Models\\Psychology\\Result	461	[]	{"answer_id":85,"question_id":26,"test_id":33,"id":461}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
836	\N	\N	created	App\\Models\\Psychology\\Result	462	[]	{"answer_id":88,"question_id":27,"test_id":33,"id":462}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
837	\N	\N	created	App\\Models\\Psychology\\Result	463	[]	{"answer_id":91,"question_id":28,"test_id":33,"id":463}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
838	\N	\N	created	App\\Models\\Psychology\\Result	464	[]	{"answer_id":93,"question_id":29,"test_id":33,"id":464}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:21	2022-03-18 12:01:21
839	\N	\N	updated	App\\Models\\Psychology\\Test	33	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-33-1727271818","score":18}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 12:01:22	2022-03-18 12:01:22
840	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	27	[]	{"username":"cesar.tamayo02@outlook.com","token":1840,"id":27}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Mobile Safari/537.36 EdgA/99.0.1150.46	\N	2022-03-18 12:21:01	2022-03-18 12:21:01
841	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	28	[]	{"username":"cesar.tamayo0204@gmail.com","token":5176,"id":28}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 12:22:00	2022-03-18 12:22:00
842	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	29	[]	{"username":"cesar.tamayo0204@gmail.com","token":5360,"id":29}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 12:23:21	2022-03-18 12:23:21
843	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	30	[]	{"username":"cesar.tamayo0204@gmail.com","token":8977,"id":30}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 12:29:14	2022-03-18 12:29:14
844	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	31	[]	{"username":"cesar.tamay0204@gmail.com","token":6200,"id":31}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 12:45:39	2022-03-18 12:45:39
845	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	32	[]	{"username":"cesar.tamay0204@gmail.com","token":3907,"id":32}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 12:45:50	2022-03-18 12:45:50
884	\N	\N	created	App\\Models\\Psychology\\Result	491	[]	{"answer_id":6,"question_id":3,"test_id":36,"id":491}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
846	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	33	[]	{"username":"cesar.tamayo0204@gmail.com","token":9408,"id":33}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:14:28	2022-03-18 13:14:28
847	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\TransactionalCode	34	[]	{"username":"cesar.tamayo0204@gmail.com","token":9584,"id":34}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:14:41	2022-03-18 13:14:41
848	App\\Models\\Authentication\\User	13	updated	App\\Models\\Authentication\\TransactionalCode	34	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:15:04	2022-03-18 13:15:04
849	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	39	[]	{"name":"ASD ASD","email":"","lastname":"ASD ASD","username":"1231231231","phone":"","password":"$2y$10$SIoC.Y75i25LXNOnkxgREei5n.6qDM2Pwjs\\/grRKu\\/hlNMA\\/BoOBW","id":39}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
850	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	34	[]	{"canton_id":292,"province_id":250,"state_id":1,"user_id":39,"age":12,"terms_conditions":true,"type":"phq9a","id":34}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
851	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	465	[]	{"answer_id":1,"question_id":1,"test_id":34,"id":465}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
852	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	466	[]	{"answer_id":3,"question_id":2,"test_id":34,"id":466}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
853	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	467	[]	{"answer_id":7,"question_id":3,"test_id":34,"id":467}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
854	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	468	[]	{"answer_id":10,"question_id":4,"test_id":34,"id":468}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
855	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	469	[]	{"answer_id":14,"question_id":5,"test_id":34,"id":469}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
856	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	470	[]	{"answer_id":20,"question_id":6,"test_id":34,"id":470}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
857	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	471	[]	{"answer_id":22,"question_id":7,"test_id":34,"id":471}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
858	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	472	[]	{"answer_id":27,"question_id":8,"test_id":34,"id":472}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
859	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	473	[]	{"answer_id":32,"question_id":9,"test_id":34,"id":473}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
860	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	474	[]	{"answer_id":34,"question_id":10,"test_id":34,"id":474}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
861	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	475	[]	{"answer_id":39,"question_id":11,"test_id":34,"id":475}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
862	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	476	[]	{"answer_id":93,"question_id":29,"test_id":34,"id":476}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:09	2022-03-18 13:16:09
863	App\\Models\\Authentication\\User	13	updated	App\\Models\\Psychology\\Test	34	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"02-34-1231231231","score":18}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:11	2022-03-18 13:16:11
864	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Agent	4	[]	{"test_id":34,"email":"cesar.tamayo0204@gmail.com","identification":"1231231231","lastname":"Tamayo L\\u00f3pez","name":"C\\u00e9sar Mauricio","phone":"1231231231","id":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:16:11	2022-03-18 13:16:11
865	App\\Models\\Authentication\\User	13	created	App\\Models\\Authentication\\User	40	[]	{"name":"ASDASD","email":"cesar.tamayo0204@gmail.com","lastname":"ASDASD","username":"3123123123","phone":"123123123","password":"$2y$10$u2ij.ENVzqjUg47kfJOrwOvJkyyjSs\\/ZT3iY.XeeXdkOxvpEI2MU6","id":40}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
866	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Test	35	[]	{"canton_id":455,"province_id":265,"state_id":1,"user_id":40,"age":18,"terms_conditions":true,"type":"phq9a","id":35}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
867	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	477	[]	{"answer_id":1,"question_id":1,"test_id":35,"id":477}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
868	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	478	[]	{"answer_id":4,"question_id":2,"test_id":35,"id":478}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
869	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	479	[]	{"answer_id":6,"question_id":3,"test_id":35,"id":479}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
870	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	480	[]	{"answer_id":11,"question_id":4,"test_id":35,"id":480}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:12	2022-03-18 13:24:12
871	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	481	[]	{"answer_id":15,"question_id":5,"test_id":35,"id":481}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
872	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	482	[]	{"answer_id":20,"question_id":6,"test_id":35,"id":482}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
873	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	483	[]	{"answer_id":23,"question_id":7,"test_id":35,"id":483}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
874	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	484	[]	{"answer_id":26,"question_id":8,"test_id":35,"id":484}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
875	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	485	[]	{"answer_id":30,"question_id":9,"test_id":35,"id":485}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
876	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	486	[]	{"answer_id":36,"question_id":10,"test_id":35,"id":486}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
877	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	487	[]	{"answer_id":39,"question_id":11,"test_id":35,"id":487}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
878	App\\Models\\Authentication\\User	13	created	App\\Models\\Psychology\\Result	488	[]	{"answer_id":92,"question_id":29,"test_id":35,"id":488}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:13	2022-03-18 13:24:13
879	App\\Models\\Authentication\\User	13	updated	App\\Models\\Psychology\\Test	35	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-35-3123123123","score":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 13:24:14	2022-03-18 13:24:14
880	\N	\N	created	App\\Models\\Authentication\\User	41	[]	{"name":"SAMANTHA CRISTINA","email":"sammycris4@gmail.com","lastname":"QUISHPE SANTILL\\u00e1N","username":"1727725002","phone":"0961003657","password":"$2y$10$dS.KC5pn5ZovnRofjGwFzOFatTgXX\\/phtiipj81FGdNzuJSSBQKFW","id":41}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
881	\N	\N	created	App\\Models\\Psychology\\Test	36	[]	{"canton_id":452,"province_id":265,"state_id":1,"user_id":41,"age":18,"terms_conditions":true,"type":"phq9a","id":36}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
882	\N	\N	created	App\\Models\\Psychology\\Result	489	[]	{"answer_id":2,"question_id":1,"test_id":36,"id":489}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
883	\N	\N	created	App\\Models\\Psychology\\Result	490	[]	{"answer_id":3,"question_id":2,"test_id":36,"id":490}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
885	\N	\N	created	App\\Models\\Psychology\\Result	492	[]	{"answer_id":9,"question_id":4,"test_id":36,"id":492}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
886	\N	\N	created	App\\Models\\Psychology\\Result	493	[]	{"answer_id":13,"question_id":5,"test_id":36,"id":493}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
887	\N	\N	created	App\\Models\\Psychology\\Result	494	[]	{"answer_id":17,"question_id":6,"test_id":36,"id":494}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
888	\N	\N	created	App\\Models\\Psychology\\Result	495	[]	{"answer_id":22,"question_id":7,"test_id":36,"id":495}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
889	\N	\N	created	App\\Models\\Psychology\\Result	496	[]	{"answer_id":27,"question_id":8,"test_id":36,"id":496}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
890	\N	\N	created	App\\Models\\Psychology\\Result	497	[]	{"answer_id":31,"question_id":9,"test_id":36,"id":497}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
891	\N	\N	created	App\\Models\\Psychology\\Result	498	[]	{"answer_id":34,"question_id":10,"test_id":36,"id":498}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
892	\N	\N	created	App\\Models\\Psychology\\Result	499	[]	{"answer_id":37,"question_id":11,"test_id":36,"id":499}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
893	\N	\N	created	App\\Models\\Psychology\\Result	500	[]	{"answer_id":92,"question_id":29,"test_id":36,"id":500}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
894	\N	\N	updated	App\\Models\\Psychology\\Test	36	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"17-36-1727725002","score":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:30:56	2022-03-18 14:30:56
895	App\\Models\\Authentication\\User	20	updated	App\\Models\\Authentication\\User	20	{"lastname":"GARCIA REINOSO","name":"SAMIA CORINA","password":"$2y$10$Oy4e4XyEBxedo6jo1SoP7eugH0xFKnP2ZZpb0zFQaVNnCzGnPGygm","phone":"0928091839"}	{"lastname":"GARC\\u00cdA","name":"SAMIA","password":"$2y$10$YB2rrZ6LtGvvpUdmX2.PW.p5fIbpWrCvCek13scrnqkW82QiEtOoC","phone":"1092849389"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
896	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Test	37	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":20,"age":18,"terms_conditions":true,"type":"phq9a","id":37}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
897	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	501	[]	{"answer_id":1,"question_id":1,"test_id":37,"id":501}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
898	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	502	[]	{"answer_id":4,"question_id":2,"test_id":37,"id":502}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
899	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	503	[]	{"answer_id":5,"question_id":3,"test_id":37,"id":503}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
900	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	504	[]	{"answer_id":10,"question_id":4,"test_id":37,"id":504}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
901	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	505	[]	{"answer_id":14,"question_id":5,"test_id":37,"id":505}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
902	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	506	[]	{"answer_id":18,"question_id":6,"test_id":37,"id":506}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
903	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	507	[]	{"answer_id":23,"question_id":7,"test_id":37,"id":507}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
904	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	508	[]	{"answer_id":28,"question_id":8,"test_id":37,"id":508}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
927	\N	\N	created	App\\Models\\Psychology\\Result	525	[]	{"answer_id":2,"question_id":1,"test_id":39,"id":525}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
905	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	509	[]	{"answer_id":30,"question_id":9,"test_id":37,"id":509}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
906	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	510	[]	{"answer_id":33,"question_id":10,"test_id":37,"id":510}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
907	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	511	[]	{"answer_id":38,"question_id":11,"test_id":37,"id":511}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
908	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	512	[]	{"answer_id":93,"question_id":29,"test_id":37,"id":512}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:03	2022-03-18 14:31:03
909	App\\Models\\Authentication\\User	20	updated	App\\Models\\Psychology\\Test	37	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-37-1724581218","score":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 14:31:04	2022-03-18 14:31:04
910	\N	\N	created	App\\Models\\Authentication\\User	42	[]	{"name":"LUCERO MARIBEL","email":"villagomezlucero0@gmail.com","lastname":"VILLAGOMEZ ALMEIDA","username":"1753032828","phone":"0984311824","password":"$2y$10$Y1oe2Eqpfa3rzZc6AnYdhO1BDR\\/J3nfmX5yGO.QYDKC5OvXajTT4S","id":42}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
911	\N	\N	created	App\\Models\\Psychology\\Test	38	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":42,"age":18,"terms_conditions":true,"type":"phq9a","id":38}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
912	\N	\N	created	App\\Models\\Psychology\\Result	513	[]	{"answer_id":1,"question_id":1,"test_id":38,"id":513}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
913	\N	\N	created	App\\Models\\Psychology\\Result	514	[]	{"answer_id":3,"question_id":2,"test_id":38,"id":514}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
914	\N	\N	created	App\\Models\\Psychology\\Result	515	[]	{"answer_id":6,"question_id":3,"test_id":38,"id":515}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
915	\N	\N	created	App\\Models\\Psychology\\Result	516	[]	{"answer_id":11,"question_id":4,"test_id":38,"id":516}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
916	\N	\N	created	App\\Models\\Psychology\\Result	517	[]	{"answer_id":16,"question_id":5,"test_id":38,"id":517}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
917	\N	\N	created	App\\Models\\Psychology\\Result	518	[]	{"answer_id":17,"question_id":6,"test_id":38,"id":518}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
918	\N	\N	created	App\\Models\\Psychology\\Result	519	[]	{"answer_id":22,"question_id":7,"test_id":38,"id":519}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
919	\N	\N	created	App\\Models\\Psychology\\Result	520	[]	{"answer_id":25,"question_id":8,"test_id":38,"id":520}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
920	\N	\N	created	App\\Models\\Psychology\\Result	521	[]	{"answer_id":29,"question_id":9,"test_id":38,"id":521}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
921	\N	\N	created	App\\Models\\Psychology\\Result	522	[]	{"answer_id":35,"question_id":10,"test_id":38,"id":522}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
922	\N	\N	created	App\\Models\\Psychology\\Result	523	[]	{"answer_id":37,"question_id":11,"test_id":38,"id":523}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
923	\N	\N	created	App\\Models\\Psychology\\Result	524	[]	{"answer_id":92,"question_id":29,"test_id":38,"id":524}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
924	\N	\N	updated	App\\Models\\Psychology\\Test	38	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"17-38-1753032828","score":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:98.0) Gecko/20100101 Firefox/98.0	\N	2022-03-18 14:31:22	2022-03-18 14:31:22
925	\N	\N	created	App\\Models\\Authentication\\User	43	[]	{"name":"NATHALIE RAQUEL","email":"nathyraquel12@yahoo.es","lastname":"PRADO ALMINATTI","username":"1722505466","phone":"0992567270","password":"$2y$10$RwJi21orAzER8L8pPOifjOy54SDu8S2LSBvxdrzZgykR9\\/.PKB6iK","id":43}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
926	\N	\N	created	App\\Models\\Psychology\\Test	39	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":43,"age":18,"terms_conditions":true,"type":"phq9a","id":39}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
928	\N	\N	created	App\\Models\\Psychology\\Result	526	[]	{"answer_id":3,"question_id":2,"test_id":39,"id":526}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
929	\N	\N	created	App\\Models\\Psychology\\Result	527	[]	{"answer_id":6,"question_id":3,"test_id":39,"id":527}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
930	\N	\N	created	App\\Models\\Psychology\\Result	528	[]	{"answer_id":10,"question_id":4,"test_id":39,"id":528}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
931	\N	\N	created	App\\Models\\Psychology\\Result	529	[]	{"answer_id":13,"question_id":5,"test_id":39,"id":529}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
932	\N	\N	created	App\\Models\\Psychology\\Result	530	[]	{"answer_id":17,"question_id":6,"test_id":39,"id":530}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
933	\N	\N	created	App\\Models\\Psychology\\Result	531	[]	{"answer_id":22,"question_id":7,"test_id":39,"id":531}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
934	\N	\N	created	App\\Models\\Psychology\\Result	532	[]	{"answer_id":25,"question_id":8,"test_id":39,"id":532}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
935	\N	\N	created	App\\Models\\Psychology\\Result	533	[]	{"answer_id":29,"question_id":9,"test_id":39,"id":533}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
936	\N	\N	created	App\\Models\\Psychology\\Result	534	[]	{"answer_id":33,"question_id":10,"test_id":39,"id":534}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
937	\N	\N	created	App\\Models\\Psychology\\Result	535	[]	{"answer_id":37,"question_id":11,"test_id":39,"id":535}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
938	\N	\N	created	App\\Models\\Psychology\\Result	536	[]	{"answer_id":93,"question_id":29,"test_id":39,"id":536}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:05	2022-03-18 16:40:05
939	\N	\N	updated	App\\Models\\Psychology\\Test	39	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"17-39-1722505466","score":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 16:40:06	2022-03-18 16:40:06
940	\N	\N	created	App\\Models\\Authentication\\User	44	[]	{"name":"JULIENE","email":"diaspessoa@live.com","lastname":"D\\u00edAS PESS\\u00f4A","username":"614354","phone":"979097681","password":"$2y$10$OyWttAxJIY59a23.aB3ZdeTWKH0yyZHbK81FgdsNc0g0JYsQiQyc2","id":44}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
941	\N	\N	created	App\\Models\\Psychology\\Test	40	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":44,"age":18,"terms_conditions":true,"type":"phq9a","id":40}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
942	\N	\N	created	App\\Models\\Psychology\\Result	537	[]	{"answer_id":1,"question_id":1,"test_id":40,"id":537}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
943	\N	\N	created	App\\Models\\Psychology\\Result	538	[]	{"answer_id":3,"question_id":2,"test_id":40,"id":538}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
944	\N	\N	created	App\\Models\\Psychology\\Result	539	[]	{"answer_id":7,"question_id":3,"test_id":40,"id":539}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
945	\N	\N	created	App\\Models\\Psychology\\Result	540	[]	{"answer_id":11,"question_id":4,"test_id":40,"id":540}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
946	\N	\N	created	App\\Models\\Psychology\\Result	541	[]	{"answer_id":16,"question_id":5,"test_id":40,"id":541}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
947	\N	\N	created	App\\Models\\Psychology\\Result	542	[]	{"answer_id":18,"question_id":6,"test_id":40,"id":542}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
948	\N	\N	created	App\\Models\\Psychology\\Result	543	[]	{"answer_id":21,"question_id":7,"test_id":40,"id":543}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
949	\N	\N	created	App\\Models\\Psychology\\Result	544	[]	{"answer_id":25,"question_id":8,"test_id":40,"id":544}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
950	\N	\N	created	App\\Models\\Psychology\\Result	545	[]	{"answer_id":30,"question_id":9,"test_id":40,"id":545}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
951	\N	\N	created	App\\Models\\Psychology\\Result	546	[]	{"answer_id":33,"question_id":10,"test_id":40,"id":546}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
952	\N	\N	created	App\\Models\\Psychology\\Result	547	[]	{"answer_id":38,"question_id":11,"test_id":40,"id":547}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:32	2022-03-18 16:42:32
953	\N	\N	created	App\\Models\\Psychology\\Result	548	[]	{"answer_id":92,"question_id":29,"test_id":40,"id":548}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:33	2022-03-18 16:42:33
954	\N	\N	updated	App\\Models\\Psychology\\Test	40	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-40-614354","score":13}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 16:42:34	2022-03-18 16:42:34
955	\N	\N	created	App\\Models\\Authentication\\User	45	[]	{"name":"ERICKA ESTEFANIA","email":"erickaestefania902@gmail.com","lastname":"SOLIS GUERRERO","username":"1804672184","phone":"0978878816","password":"$2y$10$tOcpE\\/n8vhWf1WjPqLJtWOMBxAVpxGr7iHR6r3d7ImZ5TS1eibBra","id":45}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
956	\N	\N	created	App\\Models\\Psychology\\Test	41	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":45,"age":18,"terms_conditions":true,"type":"psc17","id":41}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
957	\N	\N	created	App\\Models\\Psychology\\Result	549	[]	{"answer_id":2,"question_id":1,"test_id":41,"id":549}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
958	\N	\N	created	App\\Models\\Psychology\\Result	550	[]	{"answer_id":4,"question_id":2,"test_id":41,"id":550}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
959	\N	\N	created	App\\Models\\Psychology\\Result	551	[]	{"answer_id":42,"question_id":12,"test_id":41,"id":551}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
960	\N	\N	created	App\\Models\\Psychology\\Result	552	[]	{"answer_id":45,"question_id":13,"test_id":41,"id":552}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
961	\N	\N	created	App\\Models\\Psychology\\Result	553	[]	{"answer_id":48,"question_id":14,"test_id":41,"id":553}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
962	\N	\N	created	App\\Models\\Psychology\\Result	554	[]	{"answer_id":50,"question_id":15,"test_id":41,"id":554}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
963	\N	\N	created	App\\Models\\Psychology\\Result	555	[]	{"answer_id":54,"question_id":16,"test_id":41,"id":555}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
964	\N	\N	created	App\\Models\\Psychology\\Result	556	[]	{"answer_id":56,"question_id":17,"test_id":41,"id":556}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
965	\N	\N	created	App\\Models\\Psychology\\Result	557	[]	{"answer_id":60,"question_id":18,"test_id":41,"id":557}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
966	\N	\N	created	App\\Models\\Psychology\\Result	558	[]	{"answer_id":62,"question_id":19,"test_id":41,"id":558}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
967	\N	\N	created	App\\Models\\Psychology\\Result	559	[]	{"answer_id":66,"question_id":20,"test_id":41,"id":559}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
968	\N	\N	created	App\\Models\\Psychology\\Result	560	[]	{"answer_id":69,"question_id":21,"test_id":41,"id":560}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
969	\N	\N	created	App\\Models\\Psychology\\Result	561	[]	{"answer_id":72,"question_id":22,"test_id":41,"id":561}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
970	\N	\N	created	App\\Models\\Psychology\\Result	562	[]	{"answer_id":75,"question_id":23,"test_id":41,"id":562}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
971	\N	\N	created	App\\Models\\Psychology\\Result	563	[]	{"answer_id":79,"question_id":24,"test_id":41,"id":563}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
972	\N	\N	created	App\\Models\\Psychology\\Result	564	[]	{"answer_id":80,"question_id":25,"test_id":41,"id":564}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
973	\N	\N	created	App\\Models\\Psychology\\Result	565	[]	{"answer_id":84,"question_id":26,"test_id":41,"id":565}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
974	\N	\N	created	App\\Models\\Psychology\\Result	566	[]	{"answer_id":86,"question_id":27,"test_id":41,"id":566}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
975	\N	\N	created	App\\Models\\Psychology\\Result	567	[]	{"answer_id":89,"question_id":28,"test_id":41,"id":567}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
976	\N	\N	created	App\\Models\\Psychology\\Result	568	[]	{"answer_id":93,"question_id":29,"test_id":41,"id":568}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
977	\N	\N	updated	App\\Models\\Psychology\\Test	41	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"18-41-1804672184","score":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; SNE-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:42:39	2022-03-18 16:42:39
978	\N	\N	created	App\\Models\\Authentication\\User	46	[]	{"name":"JEAN KARLA","email":"karly.pozo29@hotmail.com","lastname":"POZO PADILLA","username":"0401819362","phone":"0986887854","password":"$2y$10$WMwl7eXpCATfeKYKgWlMeudmES7yGEz9dDmVnolIH.fFUBC6L65JG","id":46}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
979	\N	\N	created	App\\Models\\Psychology\\Test	42	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":46,"age":18,"terms_conditions":true,"type":"phq9a","id":42}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
980	\N	\N	created	App\\Models\\Psychology\\Result	569	[]	{"answer_id":1,"question_id":1,"test_id":42,"id":569}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
981	\N	\N	created	App\\Models\\Psychology\\Result	570	[]	{"answer_id":3,"question_id":2,"test_id":42,"id":570}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
982	\N	\N	created	App\\Models\\Psychology\\Result	571	[]	{"answer_id":6,"question_id":3,"test_id":42,"id":571}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
983	\N	\N	created	App\\Models\\Psychology\\Result	572	[]	{"answer_id":10,"question_id":4,"test_id":42,"id":572}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
984	\N	\N	created	App\\Models\\Psychology\\Result	573	[]	{"answer_id":13,"question_id":5,"test_id":42,"id":573}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
985	\N	\N	created	App\\Models\\Psychology\\Result	574	[]	{"answer_id":17,"question_id":6,"test_id":42,"id":574}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
986	\N	\N	created	App\\Models\\Psychology\\Result	575	[]	{"answer_id":22,"question_id":7,"test_id":42,"id":575}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
987	\N	\N	created	App\\Models\\Psychology\\Result	576	[]	{"answer_id":25,"question_id":8,"test_id":42,"id":576}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
988	\N	\N	created	App\\Models\\Psychology\\Result	577	[]	{"answer_id":29,"question_id":9,"test_id":42,"id":577}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
989	\N	\N	created	App\\Models\\Psychology\\Result	578	[]	{"answer_id":33,"question_id":10,"test_id":42,"id":578}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
990	\N	\N	created	App\\Models\\Psychology\\Result	579	[]	{"answer_id":37,"question_id":11,"test_id":42,"id":579}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
991	\N	\N	created	App\\Models\\Psychology\\Result	580	[]	{"answer_id":92,"question_id":29,"test_id":42,"id":580}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
992	\N	\N	updated	App\\Models\\Psychology\\Test	42	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"04-42-0401819362","score":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 16:44:18	2022-03-18 16:44:18
993	\N	\N	created	App\\Models\\Authentication\\User	47	[]	{"name":"IV\\u00e1N MARCELO","email":"marcelocarrazcoc@hotmail.com","lastname":"CARRAZCO CASTELO","username":"0601916380","phone":"0991210760","password":"$2y$10$Hr69h4CKrmjMAqQs6IAh8.di3yins4lqMRMwWYY1O5BoDxrHT46S.","id":47}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
994	\N	\N	created	App\\Models\\Psychology\\Test	43	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":47,"age":18,"terms_conditions":true,"type":"psc17","id":43}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
995	\N	\N	created	App\\Models\\Psychology\\Result	581	[]	{"answer_id":2,"question_id":1,"test_id":43,"id":581}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
996	\N	\N	created	App\\Models\\Psychology\\Result	582	[]	{"answer_id":4,"question_id":2,"test_id":43,"id":582}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
997	\N	\N	created	App\\Models\\Psychology\\Result	583	[]	{"answer_id":41,"question_id":12,"test_id":43,"id":583}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
998	\N	\N	created	App\\Models\\Psychology\\Result	584	[]	{"answer_id":44,"question_id":13,"test_id":43,"id":584}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
999	\N	\N	created	App\\Models\\Psychology\\Result	585	[]	{"answer_id":47,"question_id":14,"test_id":43,"id":585}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1000	\N	\N	created	App\\Models\\Psychology\\Result	586	[]	{"answer_id":50,"question_id":15,"test_id":43,"id":586}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1001	\N	\N	created	App\\Models\\Psychology\\Result	587	[]	{"answer_id":53,"question_id":16,"test_id":43,"id":587}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1002	\N	\N	created	App\\Models\\Psychology\\Result	588	[]	{"answer_id":56,"question_id":17,"test_id":43,"id":588}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1003	\N	\N	created	App\\Models\\Psychology\\Result	589	[]	{"answer_id":59,"question_id":18,"test_id":43,"id":589}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1004	\N	\N	created	App\\Models\\Psychology\\Result	590	[]	{"answer_id":62,"question_id":19,"test_id":43,"id":590}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1005	\N	\N	created	App\\Models\\Psychology\\Result	591	[]	{"answer_id":65,"question_id":20,"test_id":43,"id":591}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1006	\N	\N	created	App\\Models\\Psychology\\Result	592	[]	{"answer_id":68,"question_id":21,"test_id":43,"id":592}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1007	\N	\N	created	App\\Models\\Psychology\\Result	593	[]	{"answer_id":71,"question_id":22,"test_id":43,"id":593}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1008	\N	\N	created	App\\Models\\Psychology\\Result	594	[]	{"answer_id":74,"question_id":23,"test_id":43,"id":594}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1009	\N	\N	created	App\\Models\\Psychology\\Result	595	[]	{"answer_id":78,"question_id":24,"test_id":43,"id":595}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1010	\N	\N	created	App\\Models\\Psychology\\Result	596	[]	{"answer_id":80,"question_id":25,"test_id":43,"id":596}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1011	\N	\N	created	App\\Models\\Psychology\\Result	597	[]	{"answer_id":83,"question_id":26,"test_id":43,"id":597}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1012	\N	\N	created	App\\Models\\Psychology\\Result	598	[]	{"answer_id":86,"question_id":27,"test_id":43,"id":598}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1013	\N	\N	created	App\\Models\\Psychology\\Result	599	[]	{"answer_id":89,"question_id":28,"test_id":43,"id":599}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1014	\N	\N	created	App\\Models\\Psychology\\Result	600	[]	{"answer_id":92,"question_id":29,"test_id":43,"id":600}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1015	\N	\N	updated	App\\Models\\Psychology\\Test	43	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-43-0601916380","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 16:44:25	2022-03-18 16:44:25
1016	\N	\N	created	App\\Models\\Authentication\\User	48	[]	{"name":"KEMIL","email":"kestrada@esquel.org.ec","lastname":"ESTRADA","username":"1709999690","phone":"0986359706","password":"$2y$10$09lI51H8KdCXpJLTIjEa\\/.DSWrbhP8Bwz3.P7By1AQ8xPist\\/QTFK","id":48}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1017	\N	\N	created	App\\Models\\Psychology\\Test	44	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":48,"age":18,"terms_conditions":true,"type":"psc17","id":44}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1018	\N	\N	created	App\\Models\\Psychology\\Result	601	[]	{"answer_id":2,"question_id":1,"test_id":44,"id":601}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1019	\N	\N	created	App\\Models\\Psychology\\Result	602	[]	{"answer_id":4,"question_id":2,"test_id":44,"id":602}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1020	\N	\N	created	App\\Models\\Psychology\\Result	603	[]	{"answer_id":41,"question_id":12,"test_id":44,"id":603}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1021	\N	\N	created	App\\Models\\Psychology\\Result	604	[]	{"answer_id":44,"question_id":13,"test_id":44,"id":604}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1022	\N	\N	created	App\\Models\\Psychology\\Result	605	[]	{"answer_id":47,"question_id":14,"test_id":44,"id":605}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1023	\N	\N	created	App\\Models\\Psychology\\Result	606	[]	{"answer_id":50,"question_id":15,"test_id":44,"id":606}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1024	\N	\N	created	App\\Models\\Psychology\\Result	607	[]	{"answer_id":53,"question_id":16,"test_id":44,"id":607}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1025	\N	\N	created	App\\Models\\Psychology\\Result	608	[]	{"answer_id":56,"question_id":17,"test_id":44,"id":608}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1026	\N	\N	created	App\\Models\\Psychology\\Result	609	[]	{"answer_id":60,"question_id":18,"test_id":44,"id":609}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1027	\N	\N	created	App\\Models\\Psychology\\Result	610	[]	{"answer_id":62,"question_id":19,"test_id":44,"id":610}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1028	\N	\N	created	App\\Models\\Psychology\\Result	611	[]	{"answer_id":65,"question_id":20,"test_id":44,"id":611}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1029	\N	\N	created	App\\Models\\Psychology\\Result	612	[]	{"answer_id":69,"question_id":21,"test_id":44,"id":612}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1030	\N	\N	created	App\\Models\\Psychology\\Result	613	[]	{"answer_id":71,"question_id":22,"test_id":44,"id":613}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1031	\N	\N	created	App\\Models\\Psychology\\Result	614	[]	{"answer_id":74,"question_id":23,"test_id":44,"id":614}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1211	\N	\N	created	App\\Models\\Psychology\\Result	751	[]	{"answer_id":9,"question_id":4,"test_id":54,"id":751}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1032	\N	\N	created	App\\Models\\Psychology\\Result	615	[]	{"answer_id":79,"question_id":24,"test_id":44,"id":615}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1033	\N	\N	created	App\\Models\\Psychology\\Result	616	[]	{"answer_id":80,"question_id":25,"test_id":44,"id":616}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1034	\N	\N	created	App\\Models\\Psychology\\Result	617	[]	{"answer_id":83,"question_id":26,"test_id":44,"id":617}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1035	\N	\N	created	App\\Models\\Psychology\\Result	618	[]	{"answer_id":86,"question_id":27,"test_id":44,"id":618}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1036	\N	\N	created	App\\Models\\Psychology\\Result	619	[]	{"answer_id":89,"question_id":28,"test_id":44,"id":619}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1037	\N	\N	created	App\\Models\\Psychology\\Result	620	[]	{"answer_id":92,"question_id":29,"test_id":44,"id":620}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1038	\N	\N	updated	App\\Models\\Psychology\\Test	44	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"02-44-1709999690","score":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 16:44:28	2022-03-18 16:44:28
1039	\N	\N	created	App\\Models\\Authentication\\User	49	[]	{"name":"KATHERINE STEFFANY","email":"kattsmile_07@hotmail.com","lastname":"REAL CARRILLO","username":"0201580263","phone":"0987556575","password":"$2y$10$ITzzj2t5lxEkX6NlgMbUCuK1zoml9rhgebSCTWOw0V\\/8C2DUteRuq","id":49}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1040	\N	\N	created	App\\Models\\Psychology\\Test	45	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":49,"age":18,"terms_conditions":true,"type":"phq9a","id":45}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1041	\N	\N	created	App\\Models\\Psychology\\Result	621	[]	{"answer_id":1,"question_id":1,"test_id":45,"id":621}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1042	\N	\N	created	App\\Models\\Psychology\\Result	622	[]	{"answer_id":4,"question_id":2,"test_id":45,"id":622}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1043	\N	\N	created	App\\Models\\Psychology\\Result	623	[]	{"answer_id":5,"question_id":3,"test_id":45,"id":623}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1044	\N	\N	created	App\\Models\\Psychology\\Result	624	[]	{"answer_id":9,"question_id":4,"test_id":45,"id":624}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1045	\N	\N	created	App\\Models\\Psychology\\Result	625	[]	{"answer_id":13,"question_id":5,"test_id":45,"id":625}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1046	\N	\N	created	App\\Models\\Psychology\\Result	626	[]	{"answer_id":17,"question_id":6,"test_id":45,"id":626}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1047	\N	\N	created	App\\Models\\Psychology\\Result	627	[]	{"answer_id":21,"question_id":7,"test_id":45,"id":627}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1048	\N	\N	created	App\\Models\\Psychology\\Result	628	[]	{"answer_id":25,"question_id":8,"test_id":45,"id":628}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1049	\N	\N	created	App\\Models\\Psychology\\Result	629	[]	{"answer_id":29,"question_id":9,"test_id":45,"id":629}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1050	\N	\N	created	App\\Models\\Psychology\\Result	630	[]	{"answer_id":33,"question_id":10,"test_id":45,"id":630}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1051	\N	\N	created	App\\Models\\Psychology\\Result	631	[]	{"answer_id":37,"question_id":11,"test_id":45,"id":631}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1052	\N	\N	created	App\\Models\\Psychology\\Result	632	[]	{"answer_id":92,"question_id":29,"test_id":45,"id":632}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1053	\N	\N	updated	App\\Models\\Psychology\\Test	45	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"02-45-0201580263","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 16:45:04	2022-03-18 16:45:04
1054	\N	\N	created	App\\Models\\Authentication\\User	50	[]	{"name":"DIANA CAROLINA","email":"diakarocat180187@ymail.com","lastname":"CARRASCO ASOGUE","username":"1804133286","phone":"0984871904","password":"$2y$10$7BUXRatIM0YW2cs.CR19CewsweRMe3i0AIn2Ynf02ZN3ooxf6g3Ca","id":50}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1055	\N	\N	created	App\\Models\\Psychology\\Test	46	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":50,"age":18,"terms_conditions":true,"type":"psc17","id":46}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1056	\N	\N	created	App\\Models\\Psychology\\Result	633	[]	{"answer_id":2,"question_id":1,"test_id":46,"id":633}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1057	\N	\N	created	App\\Models\\Psychology\\Result	634	[]	{"answer_id":4,"question_id":2,"test_id":46,"id":634}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1058	\N	\N	created	App\\Models\\Psychology\\Result	635	[]	{"answer_id":42,"question_id":12,"test_id":46,"id":635}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1059	\N	\N	created	App\\Models\\Psychology\\Result	636	[]	{"answer_id":45,"question_id":13,"test_id":46,"id":636}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1060	\N	\N	created	App\\Models\\Psychology\\Result	637	[]	{"answer_id":48,"question_id":14,"test_id":46,"id":637}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1061	\N	\N	created	App\\Models\\Psychology\\Result	638	[]	{"answer_id":51,"question_id":15,"test_id":46,"id":638}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1062	\N	\N	created	App\\Models\\Psychology\\Result	639	[]	{"answer_id":54,"question_id":16,"test_id":46,"id":639}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1063	\N	\N	created	App\\Models\\Psychology\\Result	640	[]	{"answer_id":57,"question_id":17,"test_id":46,"id":640}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1064	\N	\N	created	App\\Models\\Psychology\\Result	641	[]	{"answer_id":60,"question_id":18,"test_id":46,"id":641}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1065	\N	\N	created	App\\Models\\Psychology\\Result	642	[]	{"answer_id":62,"question_id":19,"test_id":46,"id":642}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1066	\N	\N	created	App\\Models\\Psychology\\Result	643	[]	{"answer_id":66,"question_id":20,"test_id":46,"id":643}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1067	\N	\N	created	App\\Models\\Psychology\\Result	644	[]	{"answer_id":69,"question_id":21,"test_id":46,"id":644}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1068	\N	\N	created	App\\Models\\Psychology\\Result	645	[]	{"answer_id":72,"question_id":22,"test_id":46,"id":645}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1069	\N	\N	created	App\\Models\\Psychology\\Result	646	[]	{"answer_id":75,"question_id":23,"test_id":46,"id":646}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1070	\N	\N	created	App\\Models\\Psychology\\Result	647	[]	{"answer_id":78,"question_id":24,"test_id":46,"id":647}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1071	\N	\N	created	App\\Models\\Psychology\\Result	648	[]	{"answer_id":80,"question_id":25,"test_id":46,"id":648}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1072	\N	\N	created	App\\Models\\Psychology\\Result	649	[]	{"answer_id":84,"question_id":26,"test_id":46,"id":649}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1073	\N	\N	created	App\\Models\\Psychology\\Result	650	[]	{"answer_id":86,"question_id":27,"test_id":46,"id":650}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1074	\N	\N	created	App\\Models\\Psychology\\Result	651	[]	{"answer_id":90,"question_id":28,"test_id":46,"id":651}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1075	\N	\N	created	App\\Models\\Psychology\\Result	652	[]	{"answer_id":92,"question_id":29,"test_id":46,"id":652}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1076	\N	\N	updated	App\\Models\\Psychology\\Test	46	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"18-46-1804133286","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:46:35	2022-03-18 16:46:35
1077	\N	\N	created	App\\Models\\Authentication\\User	51	[]	{"name":"ANAMARIA","email":"anamarialarread@hotmail.com","lastname":"LARREA D\\u00e1VALOS","username":"0603332032","phone":"0992781547","password":"$2y$10$CjPPlVH0A7d7Lly7rzxM6uzGf6qyvxG7ieE0BUwACcTyj7.vY7iIi","id":51}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1078	\N	\N	created	App\\Models\\Psychology\\Test	47	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":51,"age":18,"terms_conditions":true,"type":"phq9a","id":47}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1079	\N	\N	created	App\\Models\\Psychology\\Result	653	[]	{"answer_id":1,"question_id":1,"test_id":47,"id":653}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1080	\N	\N	created	App\\Models\\Psychology\\Result	654	[]	{"answer_id":4,"question_id":2,"test_id":47,"id":654}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1081	\N	\N	created	App\\Models\\Psychology\\Result	655	[]	{"answer_id":6,"question_id":3,"test_id":47,"id":655}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1082	\N	\N	created	App\\Models\\Psychology\\Result	656	[]	{"answer_id":10,"question_id":4,"test_id":47,"id":656}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1083	\N	\N	created	App\\Models\\Psychology\\Result	657	[]	{"answer_id":14,"question_id":5,"test_id":47,"id":657}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1084	\N	\N	created	App\\Models\\Psychology\\Result	658	[]	{"answer_id":18,"question_id":6,"test_id":47,"id":658}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1085	\N	\N	created	App\\Models\\Psychology\\Result	659	[]	{"answer_id":22,"question_id":7,"test_id":47,"id":659}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1086	\N	\N	created	App\\Models\\Psychology\\Result	660	[]	{"answer_id":26,"question_id":8,"test_id":47,"id":660}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1087	\N	\N	created	App\\Models\\Psychology\\Result	661	[]	{"answer_id":30,"question_id":9,"test_id":47,"id":661}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1088	\N	\N	created	App\\Models\\Psychology\\Result	662	[]	{"answer_id":34,"question_id":10,"test_id":47,"id":662}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1089	\N	\N	created	App\\Models\\Psychology\\Result	663	[]	{"answer_id":37,"question_id":11,"test_id":47,"id":663}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1090	\N	\N	created	App\\Models\\Psychology\\Result	664	[]	{"answer_id":92,"question_id":29,"test_id":47,"id":664}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1091	\N	\N	updated	App\\Models\\Psychology\\Test	47	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-47-0603332032","score":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-18 16:48:33	2022-03-18 16:48:33
1111	\N	\N	created	App\\Models\\Psychology\\Result	682	[]	{"answer_id":86,"question_id":27,"test_id":48,"id":682}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1092	\N	\N	created	App\\Models\\Authentication\\User	52	[]	{"name":"BLANCA CECILIA","email":"ceciliallasag@yahoo.e","lastname":"LLASAG FERN\\u00e1NDEZ","username":"0502041866","phone":"0988128085","password":"$2y$10$YvF.XpC33x2G3L1KLYS16.37en3gn3Eb5heXVK9zWSYz6KZnOwote","id":52}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1093	\N	\N	created	App\\Models\\Psychology\\Test	48	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":52,"age":18,"terms_conditions":true,"type":"psc17","id":48}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1094	\N	\N	created	App\\Models\\Psychology\\Result	665	[]	{"answer_id":2,"question_id":1,"test_id":48,"id":665}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1095	\N	\N	created	App\\Models\\Psychology\\Result	666	[]	{"answer_id":4,"question_id":2,"test_id":48,"id":666}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1096	\N	\N	created	App\\Models\\Psychology\\Result	667	[]	{"answer_id":42,"question_id":12,"test_id":48,"id":667}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1097	\N	\N	created	App\\Models\\Psychology\\Result	668	[]	{"answer_id":45,"question_id":13,"test_id":48,"id":668}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:44	2022-03-18 17:17:44
1098	\N	\N	created	App\\Models\\Psychology\\Result	669	[]	{"answer_id":48,"question_id":14,"test_id":48,"id":669}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1099	\N	\N	created	App\\Models\\Psychology\\Result	670	[]	{"answer_id":51,"question_id":15,"test_id":48,"id":670}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1100	\N	\N	created	App\\Models\\Psychology\\Result	671	[]	{"answer_id":54,"question_id":16,"test_id":48,"id":671}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1101	\N	\N	created	App\\Models\\Psychology\\Result	672	[]	{"answer_id":57,"question_id":17,"test_id":48,"id":672}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1102	\N	\N	created	App\\Models\\Psychology\\Result	673	[]	{"answer_id":60,"question_id":18,"test_id":48,"id":673}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1103	\N	\N	created	App\\Models\\Psychology\\Result	674	[]	{"answer_id":63,"question_id":19,"test_id":48,"id":674}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1104	\N	\N	created	App\\Models\\Psychology\\Result	675	[]	{"answer_id":66,"question_id":20,"test_id":48,"id":675}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1105	\N	\N	created	App\\Models\\Psychology\\Result	676	[]	{"answer_id":69,"question_id":21,"test_id":48,"id":676}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1106	\N	\N	created	App\\Models\\Psychology\\Result	677	[]	{"answer_id":72,"question_id":22,"test_id":48,"id":677}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1107	\N	\N	created	App\\Models\\Psychology\\Result	678	[]	{"answer_id":75,"question_id":23,"test_id":48,"id":678}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1108	\N	\N	created	App\\Models\\Psychology\\Result	679	[]	{"answer_id":77,"question_id":24,"test_id":48,"id":679}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1109	\N	\N	created	App\\Models\\Psychology\\Result	680	[]	{"answer_id":81,"question_id":25,"test_id":48,"id":680}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1110	\N	\N	created	App\\Models\\Psychology\\Result	681	[]	{"answer_id":84,"question_id":26,"test_id":48,"id":681}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1112	\N	\N	created	App\\Models\\Psychology\\Result	683	[]	{"answer_id":90,"question_id":28,"test_id":48,"id":683}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1113	\N	\N	created	App\\Models\\Psychology\\Result	684	[]	{"answer_id":93,"question_id":29,"test_id":48,"id":684}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1114	\N	\N	updated	App\\Models\\Psychology\\Test	48	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"18-48-0502041866","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:17:45	2022-03-18 17:17:45
1115	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\TransactionalCode	35	[]	{"username":"samia.cgarcia@gmail.com","token":2095,"id":35}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 17:20:45	2022-03-18 17:20:45
1116	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	36	[]	{"username":"nathyraquel12@yahoo.es","token":9426,"id":36}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 17:21:09	2022-03-18 17:21:09
1117	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	37	[]	{"username":"kattsmile_07@hotmail.com","token":2298,"id":37}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 17:21:33	2022-03-18 17:21:33
1118	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	38	[]	{"username":"karly.pozo29@hotmail.com","token":9495,"id":38}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; TECNO CE7j) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-18 17:22:04	2022-03-18 17:22:04
1119	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	39	[]	{"username":"diaspessoa@live.com","token":2072,"id":39}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:22:07	2022-03-18 17:22:07
1120	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	40	[]	{"username":"kestrada@esquel.org.ec","token":8215,"id":40}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	\N	2022-03-18 17:22:20	2022-03-18 17:22:20
1121	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	41	[]	{"username":"ceciliallasag@yahoo.es","token":8991,"id":41}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:22:42	2022-03-18 17:22:42
1122	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	42	[]	{"username":"ceciliallasag@yahoo.es","token":3601,"id":42}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:22:51	2022-03-18 17:22:51
1123	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	43	[]	{"username":"ceciliallasag@yahoo.es","token":2589,"id":43}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:23:05	2022-03-18 17:23:05
1124	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	44	[]	{"username":"ceciliallasag@yahoo.es","token":3948,"id":44}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:23:09	2022-03-18 17:23:09
1125	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	45	[]	{"username":"ceciliallasag@yahoo.es","token":9688,"id":45}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:23:12	2022-03-18 17:23:12
1126	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	39	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:23:50	2022-03-18 17:23:50
1127	\N	\N	created	App\\Models\\Authentication\\User	53	[]	{"name":"JULIENE","email":"","lastname":"DIAS PESS\\u00f4A","username":"9282828119","phone":"","password":"$2y$10$8J.47cf3Spuv\\/lDWZVSHke6sYpGrfyuezAVT4gt0oqcn2pNuwketi","id":53}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1128	\N	\N	created	App\\Models\\Psychology\\Test	49	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":53,"age":15,"terms_conditions":true,"type":"psc17","id":49}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1129	\N	\N	created	App\\Models\\Psychology\\Result	685	[]	{"answer_id":2,"question_id":1,"test_id":49,"id":685}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1188	\N	\N	created	App\\Models\\Psychology\\Result	733	[]	{"answer_id":15,"question_id":5,"test_id":52,"id":733}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1130	\N	\N	created	App\\Models\\Psychology\\Result	686	[]	{"answer_id":4,"question_id":2,"test_id":49,"id":686}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1131	\N	\N	created	App\\Models\\Psychology\\Result	687	[]	{"answer_id":42,"question_id":12,"test_id":49,"id":687}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1132	\N	\N	created	App\\Models\\Psychology\\Result	688	[]	{"answer_id":45,"question_id":13,"test_id":49,"id":688}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1133	\N	\N	created	App\\Models\\Psychology\\Result	689	[]	{"answer_id":48,"question_id":14,"test_id":49,"id":689}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1134	\N	\N	created	App\\Models\\Psychology\\Result	690	[]	{"answer_id":52,"question_id":15,"test_id":49,"id":690}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1135	\N	\N	created	App\\Models\\Psychology\\Result	691	[]	{"answer_id":55,"question_id":16,"test_id":49,"id":691}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1136	\N	\N	created	App\\Models\\Psychology\\Result	692	[]	{"answer_id":56,"question_id":17,"test_id":49,"id":692}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1137	\N	\N	created	App\\Models\\Psychology\\Result	693	[]	{"answer_id":59,"question_id":18,"test_id":49,"id":693}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1138	\N	\N	created	App\\Models\\Psychology\\Result	694	[]	{"answer_id":63,"question_id":19,"test_id":49,"id":694}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1139	\N	\N	created	App\\Models\\Psychology\\Result	695	[]	{"answer_id":66,"question_id":20,"test_id":49,"id":695}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1140	\N	\N	created	App\\Models\\Psychology\\Result	696	[]	{"answer_id":68,"question_id":21,"test_id":49,"id":696}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1141	\N	\N	created	App\\Models\\Psychology\\Result	697	[]	{"answer_id":72,"question_id":22,"test_id":49,"id":697}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1142	\N	\N	created	App\\Models\\Psychology\\Result	698	[]	{"answer_id":75,"question_id":23,"test_id":49,"id":698}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1143	\N	\N	created	App\\Models\\Psychology\\Result	699	[]	{"answer_id":78,"question_id":24,"test_id":49,"id":699}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1144	\N	\N	created	App\\Models\\Psychology\\Result	700	[]	{"answer_id":80,"question_id":25,"test_id":49,"id":700}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1145	\N	\N	created	App\\Models\\Psychology\\Result	701	[]	{"answer_id":83,"question_id":26,"test_id":49,"id":701}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1146	\N	\N	created	App\\Models\\Psychology\\Result	702	[]	{"answer_id":86,"question_id":27,"test_id":49,"id":702}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1147	\N	\N	created	App\\Models\\Psychology\\Result	703	[]	{"answer_id":89,"question_id":28,"test_id":49,"id":703}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1148	\N	\N	created	App\\Models\\Psychology\\Result	704	[]	{"answer_id":93,"question_id":29,"test_id":49,"id":704}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1149	\N	\N	updated	App\\Models\\Psychology\\Test	49	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"17-49-9282828119","score":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1150	\N	\N	created	App\\Models\\Psychology\\Agent	5	[]	{"test_id":49,"email":"diaspessoa@live.com","identification":"366777877","lastname":"D\\u00edas Pess\\u00f4a","name":"Julienr","phone":"979097681","id":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:28:56	2022-03-18 17:28:56
1151	\N	\N	updated	App\\Models\\Authentication\\User	52	{"email":"ceciliallasag@yahoo.e","password":"$2y$10$YvF.XpC33x2G3L1KLYS16.37en3gn3Eb5heXVK9zWSYz6KZnOwote","phone":"0988128085"}	{"email":"","password":"$2y$10$s00Dpblg3UoEDR\\/F6V4B1OVkDDBWsDoy95IcI0DPWaInwFm55mtr2","phone":""}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1152	\N	\N	created	App\\Models\\Psychology\\Test	50	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":52,"age":15,"terms_conditions":true,"type":"phq9a","id":50}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1153	\N	\N	created	App\\Models\\Psychology\\Result	705	[]	{"answer_id":1,"question_id":1,"test_id":50,"id":705}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1154	\N	\N	created	App\\Models\\Psychology\\Result	706	[]	{"answer_id":3,"question_id":2,"test_id":50,"id":706}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1155	\N	\N	created	App\\Models\\Psychology\\Result	707	[]	{"answer_id":6,"question_id":3,"test_id":50,"id":707}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1156	\N	\N	created	App\\Models\\Psychology\\Result	708	[]	{"answer_id":10,"question_id":4,"test_id":50,"id":708}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1157	\N	\N	created	App\\Models\\Psychology\\Result	709	[]	{"answer_id":16,"question_id":5,"test_id":50,"id":709}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1158	\N	\N	created	App\\Models\\Psychology\\Result	710	[]	{"answer_id":20,"question_id":6,"test_id":50,"id":710}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1159	\N	\N	created	App\\Models\\Psychology\\Result	711	[]	{"answer_id":22,"question_id":7,"test_id":50,"id":711}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1160	\N	\N	created	App\\Models\\Psychology\\Result	712	[]	{"answer_id":26,"question_id":8,"test_id":50,"id":712}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1161	\N	\N	created	App\\Models\\Psychology\\Result	713	[]	{"answer_id":31,"question_id":9,"test_id":50,"id":713}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1162	\N	\N	created	App\\Models\\Psychology\\Result	714	[]	{"answer_id":34,"question_id":10,"test_id":50,"id":714}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1163	\N	\N	created	App\\Models\\Psychology\\Result	715	[]	{"answer_id":37,"question_id":11,"test_id":50,"id":715}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1164	\N	\N	created	App\\Models\\Psychology\\Result	716	[]	{"answer_id":93,"question_id":29,"test_id":50,"id":716}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1165	\N	\N	updated	App\\Models\\Psychology\\Test	50	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"18-50-0502041866","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1166	\N	\N	created	App\\Models\\Psychology\\Agent	6	[]	{"test_id":50,"email":"ceciliallasag@yahoo.es","identification":"0502041866","lastname":"Heredia Llasag","name":"Romulo Santiago","phone":"0988128085","id":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 17:33:00	2022-03-18 17:33:00
1167	App\\Models\\Authentication\\User	20	created	App\\Models\\Authentication\\User	54	[]	{"name":"DANIEL","email":"djerez@esquel.org.ec","lastname":"J\\u00e9REZ","username":"1723801923","phone":"0938401984","password":"$2y$10$6WycsX6XII67CO079UNBAeFS0qH3ZweJeA\\/6MdNyfymYsgU6bAEXG","id":54}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1168	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Test	51	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":54,"age":18,"terms_conditions":true,"type":"phq9a","id":51}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1169	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	717	[]	{"answer_id":1,"question_id":1,"test_id":51,"id":717}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1170	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	718	[]	{"answer_id":4,"question_id":2,"test_id":51,"id":718}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1171	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	719	[]	{"answer_id":7,"question_id":3,"test_id":51,"id":719}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1172	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	720	[]	{"answer_id":11,"question_id":4,"test_id":51,"id":720}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1173	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	721	[]	{"answer_id":14,"question_id":5,"test_id":51,"id":721}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1174	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	722	[]	{"answer_id":19,"question_id":6,"test_id":51,"id":722}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1175	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	723	[]	{"answer_id":22,"question_id":7,"test_id":51,"id":723}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1176	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	724	[]	{"answer_id":27,"question_id":8,"test_id":51,"id":724}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1177	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	725	[]	{"answer_id":30,"question_id":9,"test_id":51,"id":725}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1178	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	726	[]	{"answer_id":35,"question_id":10,"test_id":51,"id":726}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1179	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	727	[]	{"answer_id":38,"question_id":11,"test_id":51,"id":727}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1180	App\\Models\\Authentication\\User	20	created	App\\Models\\Psychology\\Result	728	[]	{"answer_id":93,"question_id":29,"test_id":51,"id":728}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:35	2022-03-18 18:13:35
1181	App\\Models\\Authentication\\User	20	updated	App\\Models\\Psychology\\Test	51	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"18-51-1723801923","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:37	2022-03-18 18:13:37
1182	\N	\N	updated	App\\Models\\Authentication\\User	47	{"email":"marcelocarrazcoc@hotmail.com","password":"$2y$10$Hr69h4CKrmjMAqQs6IAh8.di3yins4lqMRMwWYY1O5BoDxrHT46S."}	{"email":"marcelocarrazcoc@hotmail","password":"$2y$10$eqzoCzudDZtHKIIecMYfj.yXzGpqEGzr1k8X\\/9prpn6TBV72SA\\/jO"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1183	\N	\N	created	App\\Models\\Psychology\\Test	52	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":47,"age":18,"terms_conditions":true,"type":"phq9a","id":52}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1184	\N	\N	created	App\\Models\\Psychology\\Result	729	[]	{"answer_id":1,"question_id":1,"test_id":52,"id":729}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1185	\N	\N	created	App\\Models\\Psychology\\Result	730	[]	{"answer_id":4,"question_id":2,"test_id":52,"id":730}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1186	\N	\N	created	App\\Models\\Psychology\\Result	731	[]	{"answer_id":7,"question_id":3,"test_id":52,"id":731}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1187	\N	\N	created	App\\Models\\Psychology\\Result	732	[]	{"answer_id":10,"question_id":4,"test_id":52,"id":732}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1189	\N	\N	created	App\\Models\\Psychology\\Result	734	[]	{"answer_id":18,"question_id":6,"test_id":52,"id":734}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1190	\N	\N	created	App\\Models\\Psychology\\Result	735	[]	{"answer_id":23,"question_id":7,"test_id":52,"id":735}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1191	\N	\N	updated	App\\Models\\Authentication\\User	52	{"email":"","password":"$2y$10$s00Dpblg3UoEDR\\/F6V4B1OVkDDBWsDoy95IcI0DPWaInwFm55mtr2","phone":""}	{"email":"ceciliallasag@yahoo.es","password":"$2y$10$m5M41czA..x5qcybuAH\\/S.qfUu39xeAwg1fyKPIdzXS6bRnIkblpG","phone":"0988128085"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1192	\N	\N	created	App\\Models\\Psychology\\Result	736	[]	{"answer_id":26,"question_id":8,"test_id":52,"id":736}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1193	\N	\N	created	App\\Models\\Psychology\\Result	737	[]	{"answer_id":31,"question_id":9,"test_id":52,"id":737}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1194	\N	\N	created	App\\Models\\Psychology\\Test	53	[]	{"canton_id":459,"province_id":266,"state_id":1,"user_id":52,"age":18,"terms_conditions":true,"type":"phq9a","id":53}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1195	\N	\N	created	App\\Models\\Psychology\\Result	738	[]	{"answer_id":34,"question_id":10,"test_id":52,"id":738}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1196	\N	\N	created	App\\Models\\Psychology\\Result	739	[]	{"answer_id":1,"question_id":1,"test_id":53,"id":739}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1197	\N	\N	updated	App\\Models\\Authentication\\User	43	{"password":"$2y$10$RwJi21orAzER8L8pPOifjOy54SDu8S2LSBvxdrzZgykR9\\/.PKB6iK","phone":"0992567270"}	{"password":"$2y$10$aPkXQmfOQlc1wchPFDiA1.CLYwWMkZv\\/0so6tGXTt\\/w51ON4TV9C6","phone":"099256720"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1198	\N	\N	created	App\\Models\\Psychology\\Result	740	[]	{"answer_id":4,"question_id":2,"test_id":53,"id":740}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1199	\N	\N	created	App\\Models\\Psychology\\Result	741	[]	{"answer_id":38,"question_id":11,"test_id":52,"id":741}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1200	\N	\N	created	App\\Models\\Psychology\\Result	742	[]	{"answer_id":7,"question_id":3,"test_id":53,"id":742}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1201	\N	\N	created	App\\Models\\Psychology\\Result	743	[]	{"answer_id":93,"question_id":29,"test_id":52,"id":743}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1202	\N	\N	created	App\\Models\\Psychology\\Test	54	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":43,"age":18,"terms_conditions":true,"type":"phq9a","id":54}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1203	\N	\N	created	App\\Models\\Psychology\\Result	744	[]	{"answer_id":10,"question_id":4,"test_id":53,"id":744}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1204	\N	\N	created	App\\Models\\Psychology\\Result	746	[]	{"answer_id":15,"question_id":5,"test_id":53,"id":746}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1205	\N	\N	created	App\\Models\\Psychology\\Result	745	[]	{"answer_id":1,"question_id":1,"test_id":54,"id":745}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1206	\N	\N	created	App\\Models\\Psychology\\Result	747	[]	{"answer_id":18,"question_id":6,"test_id":53,"id":747}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1207	\N	\N	created	App\\Models\\Psychology\\Result	748	[]	{"answer_id":4,"question_id":2,"test_id":54,"id":748}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1208	\N	\N	created	App\\Models\\Psychology\\Result	749	[]	{"answer_id":5,"question_id":3,"test_id":54,"id":749}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1209	\N	\N	created	App\\Models\\Psychology\\Result	750	[]	{"answer_id":23,"question_id":7,"test_id":53,"id":750}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1210	\N	\N	created	App\\Models\\Psychology\\Result	752	[]	{"answer_id":27,"question_id":8,"test_id":53,"id":752}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1213	\N	\N	created	App\\Models\\Psychology\\Result	753	[]	{"answer_id":30,"question_id":9,"test_id":53,"id":753}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1215	\N	\N	created	App\\Models\\Psychology\\Result	756	[]	{"answer_id":35,"question_id":10,"test_id":53,"id":756}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1216	\N	\N	created	App\\Models\\Psychology\\Result	758	[]	{"answer_id":38,"question_id":11,"test_id":53,"id":758}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1219	\N	\N	created	App\\Models\\Psychology\\Result	760	[]	{"answer_id":93,"question_id":29,"test_id":53,"id":760}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1226	\N	\N	updated	App\\Models\\Psychology\\Test	53	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"18-53-0502041866","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:13:42	2022-03-18 18:13:42
1212	\N	\N	created	App\\Models\\Psychology\\Result	754	[]	{"answer_id":15,"question_id":5,"test_id":54,"id":754}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1214	\N	\N	created	App\\Models\\Psychology\\Result	755	[]	{"answer_id":18,"question_id":6,"test_id":54,"id":755}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1217	\N	\N	created	App\\Models\\Psychology\\Result	757	[]	{"answer_id":23,"question_id":7,"test_id":54,"id":757}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1218	\N	\N	created	App\\Models\\Psychology\\Result	759	[]	{"answer_id":27,"question_id":8,"test_id":54,"id":759}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1220	\N	\N	created	App\\Models\\Psychology\\Result	761	[]	{"answer_id":30,"question_id":9,"test_id":54,"id":761}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1221	\N	\N	created	App\\Models\\Psychology\\Result	762	[]	{"answer_id":34,"question_id":10,"test_id":54,"id":762}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1222	\N	\N	created	App\\Models\\Psychology\\Result	763	[]	{"answer_id":38,"question_id":11,"test_id":54,"id":763}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1223	\N	\N	created	App\\Models\\Psychology\\Result	764	[]	{"answer_id":93,"question_id":29,"test_id":54,"id":764}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:39	2022-03-18 18:13:39
1225	\N	\N	updated	App\\Models\\Psychology\\Test	54	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-54-1722505466","score":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-18 18:13:41	2022-03-18 18:13:41
1224	\N	\N	updated	App\\Models\\Psychology\\Test	52	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"06-52-0601916380","score":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0; MYA-L23) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-18 18:13:40	2022-03-18 18:13:40
1227	\N	\N	created	App\\Models\\Authentication\\User	55	[]	{"name":"JULIENE","email":"diaspessoa@live.com","lastname":"D\\u00edAS PESS\\u00f4A","username":"7377777","phone":"0979097681","password":"$2y$10$QhWplW4ICVmoEK90ReXkoe78AWJxdCU81JlJ\\/CAFNCT0BAz2w2VX2","id":55}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1228	\N	\N	created	App\\Models\\Psychology\\Test	55	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":55,"age":18,"terms_conditions":true,"type":"phq9a","id":55}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1229	\N	\N	created	App\\Models\\Psychology\\Result	765	[]	{"answer_id":1,"question_id":1,"test_id":55,"id":765}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1230	\N	\N	created	App\\Models\\Psychology\\Result	766	[]	{"answer_id":3,"question_id":2,"test_id":55,"id":766}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1231	\N	\N	created	App\\Models\\Psychology\\Result	767	[]	{"answer_id":6,"question_id":3,"test_id":55,"id":767}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1232	\N	\N	created	App\\Models\\Psychology\\Result	768	[]	{"answer_id":11,"question_id":4,"test_id":55,"id":768}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1233	\N	\N	created	App\\Models\\Psychology\\Result	769	[]	{"answer_id":15,"question_id":5,"test_id":55,"id":769}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1234	\N	\N	created	App\\Models\\Psychology\\Result	770	[]	{"answer_id":19,"question_id":6,"test_id":55,"id":770}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1235	\N	\N	created	App\\Models\\Psychology\\Result	771	[]	{"answer_id":24,"question_id":7,"test_id":55,"id":771}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1236	\N	\N	created	App\\Models\\Psychology\\Result	772	[]	{"answer_id":28,"question_id":8,"test_id":55,"id":772}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1237	\N	\N	created	App\\Models\\Psychology\\Result	773	[]	{"answer_id":32,"question_id":9,"test_id":55,"id":773}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1238	\N	\N	created	App\\Models\\Psychology\\Result	774	[]	{"answer_id":35,"question_id":10,"test_id":55,"id":774}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1239	\N	\N	created	App\\Models\\Psychology\\Result	775	[]	{"answer_id":40,"question_id":11,"test_id":55,"id":775}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1240	\N	\N	created	App\\Models\\Psychology\\Result	776	[]	{"answer_id":93,"question_id":29,"test_id":55,"id":776}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:18	2022-03-18 18:14:18
1241	\N	\N	updated	App\\Models\\Psychology\\Test	55	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-55-7377777","score":23}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-18 18:14:19	2022-03-18 18:14:19
1242	\N	\N	updated	App\\Models\\Authentication\\User	49	{"lastname":"REAL CARRILLO","name":"KATHERINE STEFFANY","password":"$2y$10$ITzzj2t5lxEkX6NlgMbUCuK1zoml9rhgebSCTWOw0V\\/8C2DUteRuq"}	{"lastname":"REAL","name":"KATY","password":"$2y$10$ySJXqLxnwW\\/IFfeCZOIPSeopWwh49aXTrQa1bHBE\\/7\\/JMFdeuLHsO"}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1243	\N	\N	created	App\\Models\\Psychology\\Test	56	[]	{"canton_id":289,"province_id":250,"state_id":1,"user_id":49,"age":18,"terms_conditions":true,"type":"phq9a","id":56}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1244	\N	\N	created	App\\Models\\Psychology\\Result	777	[]	{"answer_id":1,"question_id":1,"test_id":56,"id":777}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1245	\N	\N	created	App\\Models\\Psychology\\Result	778	[]	{"answer_id":3,"question_id":2,"test_id":56,"id":778}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1246	\N	\N	created	App\\Models\\Psychology\\Result	779	[]	{"answer_id":7,"question_id":3,"test_id":56,"id":779}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1247	\N	\N	created	App\\Models\\Psychology\\Result	780	[]	{"answer_id":11,"question_id":4,"test_id":56,"id":780}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1248	\N	\N	created	App\\Models\\Psychology\\Result	781	[]	{"answer_id":15,"question_id":5,"test_id":56,"id":781}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1249	\N	\N	created	App\\Models\\Psychology\\Result	782	[]	{"answer_id":19,"question_id":6,"test_id":56,"id":782}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1250	\N	\N	created	App\\Models\\Psychology\\Result	783	[]	{"answer_id":23,"question_id":7,"test_id":56,"id":783}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1251	\N	\N	created	App\\Models\\Psychology\\Result	784	[]	{"answer_id":26,"question_id":8,"test_id":56,"id":784}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1252	\N	\N	created	App\\Models\\Psychology\\Result	785	[]	{"answer_id":30,"question_id":9,"test_id":56,"id":785}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1253	\N	\N	created	App\\Models\\Psychology\\Result	786	[]	{"answer_id":34,"question_id":10,"test_id":56,"id":786}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1254	\N	\N	created	App\\Models\\Psychology\\Result	787	[]	{"answer_id":38,"question_id":11,"test_id":56,"id":787}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1255	\N	\N	created	App\\Models\\Psychology\\Result	788	[]	{"answer_id":92,"question_id":29,"test_id":56,"id":788}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:57	2022-03-18 18:17:57
1256	\N	\N	updated	App\\Models\\Psychology\\Test	56	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"02-56-0201580263","score":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	\N	2022-03-18 18:17:58	2022-03-18 18:17:58
1257	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	46	[]	{"username":"paty_ali@live.com","token":9734,"id":46}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:35:41	2022-03-19 13:35:41
1258	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	46	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:36:38	2022-03-19 13:36:38
1259	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	47	[]	{"username":"carmitapadilla8.78@gmail.com","token":5955,"id":47}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:44	2022-03-19 13:42:44
1260	\N	\N	created	App\\Models\\Authentication\\User	56	[]	{"name":"ALISON PATRICIA","email":"","lastname":"POZO CIFUENTES","username":"0402043368","phone":"","password":"$2y$10$5ixpoek2zuX\\/vubU3MCU4eSRSb28\\/jN6Qw\\/2eeVGt.C6odQN83Nym","id":56}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1261	\N	\N	created	App\\Models\\Psychology\\Test	57	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":56,"age":17,"terms_conditions":true,"type":"phq9a","id":57}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1262	\N	\N	created	App\\Models\\Psychology\\Result	789	[]	{"answer_id":1,"question_id":1,"test_id":57,"id":789}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1263	\N	\N	created	App\\Models\\Psychology\\Result	790	[]	{"answer_id":4,"question_id":2,"test_id":57,"id":790}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1264	\N	\N	created	App\\Models\\Psychology\\Result	791	[]	{"answer_id":6,"question_id":3,"test_id":57,"id":791}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1265	\N	\N	created	App\\Models\\Psychology\\Result	792	[]	{"answer_id":10,"question_id":4,"test_id":57,"id":792}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1266	\N	\N	created	App\\Models\\Psychology\\Result	793	[]	{"answer_id":16,"question_id":5,"test_id":57,"id":793}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1267	\N	\N	created	App\\Models\\Psychology\\Result	794	[]	{"answer_id":19,"question_id":6,"test_id":57,"id":794}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1268	\N	\N	created	App\\Models\\Psychology\\Result	795	[]	{"answer_id":24,"question_id":7,"test_id":57,"id":795}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1269	\N	\N	created	App\\Models\\Psychology\\Result	796	[]	{"answer_id":27,"question_id":8,"test_id":57,"id":796}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1270	\N	\N	created	App\\Models\\Psychology\\Result	797	[]	{"answer_id":32,"question_id":9,"test_id":57,"id":797}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1271	\N	\N	created	App\\Models\\Psychology\\Result	798	[]	{"answer_id":33,"question_id":10,"test_id":57,"id":798}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1272	\N	\N	created	App\\Models\\Psychology\\Result	799	[]	{"answer_id":38,"question_id":11,"test_id":57,"id":799}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1273	\N	\N	created	App\\Models\\Psychology\\Result	800	[]	{"answer_id":93,"question_id":29,"test_id":57,"id":800}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:42:59	2022-03-19 13:42:59
1274	\N	\N	updated	App\\Models\\Psychology\\Test	57	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-57-0402043368","score":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:43:00	2022-03-19 13:43:00
1275	\N	\N	created	App\\Models\\Psychology\\Agent	7	[]	{"test_id":57,"email":"paty_ali@live.com","identification":"0401073614","lastname":"Cifuentes Zambrano","name":"Patricia Janneth","phone":"0989340359","id":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 8.0.0; RNE-L03) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:43:00	2022-03-19 13:43:00
1276	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	47	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:46:43	2022-03-19 13:46:43
1277	\N	\N	created	App\\Models\\Authentication\\User	57	[]	{"name":"HEIDY YAILY","email":"","lastname":"POZO PADILLA","username":"0402124143","phone":"","password":"$2y$10$9TpSc.Uzfd83JpeWUL.QKenoNdtgMkQ2LR8\\/JOqfqOO6eGFvjYOuK","id":57}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1278	\N	\N	created	App\\Models\\Psychology\\Test	58	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":57,"age":13,"terms_conditions":true,"type":"psc17","id":58}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1279	\N	\N	created	App\\Models\\Psychology\\Result	801	[]	{"answer_id":2,"question_id":1,"test_id":58,"id":801}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1280	\N	\N	created	App\\Models\\Psychology\\Result	802	[]	{"answer_id":4,"question_id":2,"test_id":58,"id":802}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1281	\N	\N	created	App\\Models\\Psychology\\Result	803	[]	{"answer_id":41,"question_id":12,"test_id":58,"id":803}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1282	\N	\N	created	App\\Models\\Psychology\\Result	804	[]	{"answer_id":45,"question_id":13,"test_id":58,"id":804}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1283	\N	\N	created	App\\Models\\Psychology\\Result	805	[]	{"answer_id":47,"question_id":14,"test_id":58,"id":805}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1284	\N	\N	created	App\\Models\\Psychology\\Result	806	[]	{"answer_id":50,"question_id":15,"test_id":58,"id":806}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1285	\N	\N	created	App\\Models\\Psychology\\Result	807	[]	{"answer_id":54,"question_id":16,"test_id":58,"id":807}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1286	\N	\N	created	App\\Models\\Psychology\\Result	808	[]	{"answer_id":56,"question_id":17,"test_id":58,"id":808}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1287	\N	\N	created	App\\Models\\Psychology\\Result	809	[]	{"answer_id":59,"question_id":18,"test_id":58,"id":809}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1288	\N	\N	created	App\\Models\\Psychology\\Result	810	[]	{"answer_id":62,"question_id":19,"test_id":58,"id":810}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1289	\N	\N	created	App\\Models\\Psychology\\Result	811	[]	{"answer_id":66,"question_id":20,"test_id":58,"id":811}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1290	\N	\N	created	App\\Models\\Psychology\\Result	812	[]	{"answer_id":68,"question_id":21,"test_id":58,"id":812}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1291	\N	\N	created	App\\Models\\Psychology\\Result	813	[]	{"answer_id":71,"question_id":22,"test_id":58,"id":813}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1292	\N	\N	created	App\\Models\\Psychology\\Result	814	[]	{"answer_id":74,"question_id":23,"test_id":58,"id":814}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1293	\N	\N	created	App\\Models\\Psychology\\Result	815	[]	{"answer_id":78,"question_id":24,"test_id":58,"id":815}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1294	\N	\N	created	App\\Models\\Psychology\\Result	816	[]	{"answer_id":80,"question_id":25,"test_id":58,"id":816}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1295	\N	\N	created	App\\Models\\Psychology\\Result	817	[]	{"answer_id":84,"question_id":26,"test_id":58,"id":817}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1296	\N	\N	created	App\\Models\\Psychology\\Result	818	[]	{"answer_id":86,"question_id":27,"test_id":58,"id":818}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1297	\N	\N	created	App\\Models\\Psychology\\Result	819	[]	{"answer_id":89,"question_id":28,"test_id":58,"id":819}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1298	\N	\N	created	App\\Models\\Psychology\\Result	820	[]	{"answer_id":92,"question_id":29,"test_id":58,"id":820}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1299	\N	\N	updated	App\\Models\\Psychology\\Test	58	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-58-0402124143","score":6}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1300	\N	\N	created	App\\Models\\Psychology\\Agent	8	[]	{"test_id":58,"email":"carmitapadilla8.78@gmail.com","identification":"0401202247","lastname":"Padilla Morillo","name":"Carmen Veronica","phone":"0980296330","id":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A015M) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 13:53:19	2022-03-19 13:53:19
1301	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	48	[]	{"username":"mirypozoch@gmail.com","token":9533,"id":48}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:02:36	2022-03-19 15:02:36
1302	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	48	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:03:49	2022-03-19 15:03:49
1303	\N	\N	created	App\\Models\\Authentication\\User	58	[]	{"name":"EYDER JHAIR","email":"","lastname":"AYALA POZO","username":"0450235320","phone":"","password":"$2y$10$ZCP1B\\/pEOF4HGYJZMvULOu.65P\\/.AuhvjddY8JrtlqSXk8FYmxcyq","id":58}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1304	\N	\N	created	App\\Models\\Psychology\\Test	59	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":58,"age":16,"terms_conditions":true,"type":"psc17","id":59}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1305	\N	\N	created	App\\Models\\Psychology\\Result	821	[]	{"answer_id":2,"question_id":1,"test_id":59,"id":821}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1306	\N	\N	created	App\\Models\\Psychology\\Result	822	[]	{"answer_id":4,"question_id":2,"test_id":59,"id":822}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1307	\N	\N	created	App\\Models\\Psychology\\Result	823	[]	{"answer_id":42,"question_id":12,"test_id":59,"id":823}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1308	\N	\N	created	App\\Models\\Psychology\\Result	824	[]	{"answer_id":46,"question_id":13,"test_id":59,"id":824}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1309	\N	\N	created	App\\Models\\Psychology\\Result	825	[]	{"answer_id":47,"question_id":14,"test_id":59,"id":825}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1310	\N	\N	created	App\\Models\\Psychology\\Result	826	[]	{"answer_id":50,"question_id":15,"test_id":59,"id":826}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1311	\N	\N	created	App\\Models\\Psychology\\Result	827	[]	{"answer_id":54,"question_id":16,"test_id":59,"id":827}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1312	\N	\N	created	App\\Models\\Psychology\\Result	828	[]	{"answer_id":56,"question_id":17,"test_id":59,"id":828}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1313	\N	\N	created	App\\Models\\Psychology\\Result	829	[]	{"answer_id":61,"question_id":18,"test_id":59,"id":829}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1314	\N	\N	created	App\\Models\\Psychology\\Result	830	[]	{"answer_id":62,"question_id":19,"test_id":59,"id":830}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1315	\N	\N	created	App\\Models\\Psychology\\Result	831	[]	{"answer_id":65,"question_id":20,"test_id":59,"id":831}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1316	\N	\N	created	App\\Models\\Psychology\\Result	832	[]	{"answer_id":68,"question_id":21,"test_id":59,"id":832}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1317	\N	\N	created	App\\Models\\Psychology\\Result	833	[]	{"answer_id":72,"question_id":22,"test_id":59,"id":833}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1318	\N	\N	created	App\\Models\\Psychology\\Result	834	[]	{"answer_id":74,"question_id":23,"test_id":59,"id":834}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1319	\N	\N	created	App\\Models\\Psychology\\Result	835	[]	{"answer_id":79,"question_id":24,"test_id":59,"id":835}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1320	\N	\N	created	App\\Models\\Psychology\\Result	836	[]	{"answer_id":81,"question_id":25,"test_id":59,"id":836}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1321	\N	\N	created	App\\Models\\Psychology\\Result	837	[]	{"answer_id":83,"question_id":26,"test_id":59,"id":837}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1322	\N	\N	created	App\\Models\\Psychology\\Result	838	[]	{"answer_id":86,"question_id":27,"test_id":59,"id":838}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1323	\N	\N	created	App\\Models\\Psychology\\Result	839	[]	{"answer_id":89,"question_id":28,"test_id":59,"id":839}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1324	\N	\N	created	App\\Models\\Psychology\\Result	840	[]	{"answer_id":92,"question_id":29,"test_id":59,"id":840}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1325	\N	\N	updated	App\\Models\\Psychology\\Test	59	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-59-0450235320","score":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1326	\N	\N	created	App\\Models\\Psychology\\Agent	9	[]	{"test_id":59,"email":"mirypozoch@gmail.com","identification":"0401024591","lastname":"Pozo Champutiz","name":"Miriam Del Roc\\u00edo","phone":"0994280885","id":9}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 12; M1908C3JGG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:07:57	2022-03-19 15:07:57
1327	\N	\N	created	App\\Models\\Authentication\\User	59	[]	{"name":"DANIELA MISHELL","email":"danireascos123456@gmail.com","lastname":"REASCOS GARC\\u00edA","username":"0450075551","phone":"0979087716","password":"$2y$10$mCcTHwgGcqe9VrfX8ravW.Ir4jKRL8TbPnCyj89TJZ81MKJRTFPTS","id":59}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1328	\N	\N	created	App\\Models\\Psychology\\Test	60	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":59,"age":18,"terms_conditions":true,"type":"phq9a","id":60}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1329	\N	\N	created	App\\Models\\Psychology\\Result	841	[]	{"answer_id":1,"question_id":1,"test_id":60,"id":841}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1330	\N	\N	created	App\\Models\\Psychology\\Result	842	[]	{"answer_id":3,"question_id":2,"test_id":60,"id":842}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1331	\N	\N	created	App\\Models\\Psychology\\Result	843	[]	{"answer_id":7,"question_id":3,"test_id":60,"id":843}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1332	\N	\N	created	App\\Models\\Psychology\\Result	844	[]	{"answer_id":11,"question_id":4,"test_id":60,"id":844}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1333	\N	\N	created	App\\Models\\Psychology\\Result	845	[]	{"answer_id":15,"question_id":5,"test_id":60,"id":845}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1334	\N	\N	created	App\\Models\\Psychology\\Result	846	[]	{"answer_id":19,"question_id":6,"test_id":60,"id":846}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1335	\N	\N	created	App\\Models\\Psychology\\Result	847	[]	{"answer_id":24,"question_id":7,"test_id":60,"id":847}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1336	\N	\N	created	App\\Models\\Psychology\\Result	848	[]	{"answer_id":25,"question_id":8,"test_id":60,"id":848}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1337	\N	\N	created	App\\Models\\Psychology\\Result	849	[]	{"answer_id":32,"question_id":9,"test_id":60,"id":849}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1338	\N	\N	created	App\\Models\\Psychology\\Result	850	[]	{"answer_id":33,"question_id":10,"test_id":60,"id":850}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1339	\N	\N	created	App\\Models\\Psychology\\Result	851	[]	{"answer_id":37,"question_id":11,"test_id":60,"id":851}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1340	\N	\N	created	App\\Models\\Psychology\\Result	852	[]	{"answer_id":93,"question_id":29,"test_id":60,"id":852}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1341	\N	\N	updated	App\\Models\\Psychology\\Test	60	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-60-0450075551","score":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:19:41	2022-03-19 15:19:41
1342	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	49	[]	{"username":"ximena1967@gmail.com","token":3900,"id":49}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:21:59	2022-03-19 15:21:59
1343	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	50	[]	{"username":"victorcusangua@gmail.com","token":4728,"id":50}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:23:11	2022-03-19 15:23:11
1344	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	51	[]	{"username":"nagellyk1909@gmail","token":9610,"id":51}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SAMSUNG SM-A315G) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:23:14	2022-03-19 15:23:14
1345	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	52	[]	{"username":"pinchaodamaris@gmail.com","token":3944,"id":52}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:24:18	2022-03-19 15:24:18
1346	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	53	[]	{"username":"pinchaodamaris@gmail.com","token":7060,"id":53}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:24:29	2022-03-19 15:24:29
1347	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	52	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:25:10	2022-03-19 15:25:10
1348	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	54	[]	{"username":"davichocusangua@gmail.com","token":5221,"id":54}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:26:05	2022-03-19 15:26:05
1349	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	54	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:26:50	2022-03-19 15:26:50
1350	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	55	[]	{"username":"ximenaobando1967@gmail.com","token":5606,"id":55}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:27:02	2022-03-19 15:27:02
1351	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	55	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:27:34	2022-03-19 15:27:34
1352	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	56	[]	{"username":"davidburbanoromero@gmail.com","token":3479,"id":56}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 8T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:28:59	2022-03-19 15:28:59
1353	\N	\N	created	App\\Models\\Authentication\\User	60	[]	{"name":"DAMARIS GISELLA","email":"","lastname":"PINCHAO L\\u00f3PEZ","username":"0450042122","phone":"","password":"$2y$10$hcp.uOV9d3sYjgtGGsQI5eGMEBePFi7a7SGweRelyB5I0HTcBJi3m","id":60}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1354	\N	\N	created	App\\Models\\Psychology\\Test	61	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":60,"age":17,"terms_conditions":true,"type":"psc17","id":61}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1355	\N	\N	created	App\\Models\\Psychology\\Result	853	[]	{"answer_id":2,"question_id":1,"test_id":61,"id":853}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1356	\N	\N	created	App\\Models\\Psychology\\Result	854	[]	{"answer_id":4,"question_id":2,"test_id":61,"id":854}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1357	\N	\N	created	App\\Models\\Psychology\\Result	855	[]	{"answer_id":41,"question_id":12,"test_id":61,"id":855}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1358	\N	\N	created	App\\Models\\Psychology\\Result	856	[]	{"answer_id":45,"question_id":13,"test_id":61,"id":856}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1359	\N	\N	created	App\\Models\\Psychology\\Result	857	[]	{"answer_id":47,"question_id":14,"test_id":61,"id":857}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1360	\N	\N	created	App\\Models\\Psychology\\Result	858	[]	{"answer_id":50,"question_id":15,"test_id":61,"id":858}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1361	\N	\N	created	App\\Models\\Psychology\\Result	859	[]	{"answer_id":54,"question_id":16,"test_id":61,"id":859}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1362	\N	\N	created	App\\Models\\Psychology\\Result	860	[]	{"answer_id":56,"question_id":17,"test_id":61,"id":860}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1363	\N	\N	created	App\\Models\\Psychology\\Result	861	[]	{"answer_id":59,"question_id":18,"test_id":61,"id":861}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1364	\N	\N	created	App\\Models\\Psychology\\Result	862	[]	{"answer_id":62,"question_id":19,"test_id":61,"id":862}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1365	\N	\N	created	App\\Models\\Psychology\\Result	863	[]	{"answer_id":65,"question_id":20,"test_id":61,"id":863}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1366	\N	\N	created	App\\Models\\Psychology\\Result	864	[]	{"answer_id":68,"question_id":21,"test_id":61,"id":864}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1367	\N	\N	created	App\\Models\\Psychology\\Result	865	[]	{"answer_id":72,"question_id":22,"test_id":61,"id":865}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1368	\N	\N	created	App\\Models\\Psychology\\Result	866	[]	{"answer_id":74,"question_id":23,"test_id":61,"id":866}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1369	\N	\N	created	App\\Models\\Psychology\\Result	867	[]	{"answer_id":79,"question_id":24,"test_id":61,"id":867}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1370	\N	\N	created	App\\Models\\Psychology\\Result	868	[]	{"answer_id":80,"question_id":25,"test_id":61,"id":868}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1371	\N	\N	created	App\\Models\\Psychology\\Result	869	[]	{"answer_id":83,"question_id":26,"test_id":61,"id":869}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1372	\N	\N	created	App\\Models\\Psychology\\Result	870	[]	{"answer_id":86,"question_id":27,"test_id":61,"id":870}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1373	\N	\N	created	App\\Models\\Psychology\\Result	871	[]	{"answer_id":90,"question_id":28,"test_id":61,"id":871}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1374	\N	\N	created	App\\Models\\Psychology\\Result	872	[]	{"answer_id":92,"question_id":29,"test_id":61,"id":872}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1375	\N	\N	updated	App\\Models\\Psychology\\Test	61	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-61-0450042122","score":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1376	\N	\N	created	App\\Models\\Psychology\\Agent	10	[]	{"test_id":61,"email":"pinchaodamaris@gmail.com","identification":"0401005483","lastname":"L\\u00f3pez Titistar","name":"Teresita del Consuelo","phone":"0997880368","id":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 10; es-us; Redmi Note 9S Build/QKQ1.191215.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/79.0.3945.147 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.10.8-gn	\N	2022-03-19 15:29:01	2022-03-19 15:29:01
1377	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	57	[]	{"username":"micaelaalenis6@gmail.com","token":2158,"id":57}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:29:20	2022-03-19 15:29:20
1378	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	57	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:29:46	2022-03-19 15:29:46
1379	\N	\N	created	App\\Models\\Authentication\\User	61	[]	{"name":"AYELEN NOELIA","email":"","lastname":"PAZMI\\u00f1O OBANDO","username":"0402193379","phone":"","password":"$2y$10$.ByYiA6RBIHCeqPn7Gl9Jueje7xGUBAuhiR5h\\/\\/jzaY3LAAVIyivG","id":61}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1380	\N	\N	created	App\\Models\\Psychology\\Test	62	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":61,"age":17,"terms_conditions":true,"type":"phq9a","id":62}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1381	\N	\N	created	App\\Models\\Psychology\\Result	873	[]	{"answer_id":1,"question_id":1,"test_id":62,"id":873}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1382	\N	\N	created	App\\Models\\Psychology\\Result	874	[]	{"answer_id":4,"question_id":2,"test_id":62,"id":874}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1383	\N	\N	created	App\\Models\\Psychology\\Result	875	[]	{"answer_id":5,"question_id":3,"test_id":62,"id":875}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1384	\N	\N	created	App\\Models\\Psychology\\Result	876	[]	{"answer_id":10,"question_id":4,"test_id":62,"id":876}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1385	\N	\N	created	App\\Models\\Psychology\\Result	877	[]	{"answer_id":13,"question_id":5,"test_id":62,"id":877}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1386	\N	\N	created	App\\Models\\Psychology\\Result	878	[]	{"answer_id":20,"question_id":6,"test_id":62,"id":878}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1387	\N	\N	created	App\\Models\\Psychology\\Result	879	[]	{"answer_id":21,"question_id":7,"test_id":62,"id":879}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1388	\N	\N	created	App\\Models\\Psychology\\Result	880	[]	{"answer_id":25,"question_id":8,"test_id":62,"id":880}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1389	\N	\N	created	App\\Models\\Psychology\\Result	881	[]	{"answer_id":30,"question_id":9,"test_id":62,"id":881}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1390	\N	\N	created	App\\Models\\Psychology\\Result	882	[]	{"answer_id":33,"question_id":10,"test_id":62,"id":882}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1391	\N	\N	created	App\\Models\\Psychology\\Result	883	[]	{"answer_id":37,"question_id":11,"test_id":62,"id":883}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1392	\N	\N	created	App\\Models\\Psychology\\Result	884	[]	{"answer_id":92,"question_id":29,"test_id":62,"id":884}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1393	\N	\N	updated	App\\Models\\Psychology\\Test	62	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"04-62-0402193379","score":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1394	\N	\N	created	App\\Models\\Psychology\\Agent	11	[]	{"test_id":62,"email":"ximenaobando1967@gmail.com","identification":"0400851754","lastname":"Obando Rosero","name":"Ximena de Jes\\u00fas","phone":"0984340825","id":11}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; 21061119AL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:29:47	2022-03-19 15:29:47
1395	\N	\N	created	App\\Models\\Authentication\\User	62	[]	{"name":"JUAN DAVID","email":"","lastname":"CUSANGUA CISNEROS","username":"0450168489","phone":"","password":"$2y$10$VPDb7LI7XdiGujJxVHlkA.4RzOsYkvGNCTMaBB.fWHgVEyxHcVWQi","id":62}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1396	\N	\N	created	App\\Models\\Psychology\\Test	63	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":62,"age":17,"terms_conditions":true,"type":"phq9a","id":63}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1397	\N	\N	created	App\\Models\\Psychology\\Result	885	[]	{"answer_id":1,"question_id":1,"test_id":63,"id":885}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1398	\N	\N	created	App\\Models\\Psychology\\Result	886	[]	{"answer_id":3,"question_id":2,"test_id":63,"id":886}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1399	\N	\N	created	App\\Models\\Psychology\\Result	887	[]	{"answer_id":6,"question_id":3,"test_id":63,"id":887}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1400	\N	\N	created	App\\Models\\Psychology\\Result	888	[]	{"answer_id":10,"question_id":4,"test_id":63,"id":888}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1401	\N	\N	created	App\\Models\\Psychology\\Result	889	[]	{"answer_id":14,"question_id":5,"test_id":63,"id":889}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1402	\N	\N	created	App\\Models\\Psychology\\Result	890	[]	{"answer_id":18,"question_id":6,"test_id":63,"id":890}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1403	\N	\N	created	App\\Models\\Psychology\\Result	891	[]	{"answer_id":22,"question_id":7,"test_id":63,"id":891}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1404	\N	\N	created	App\\Models\\Psychology\\Result	892	[]	{"answer_id":25,"question_id":8,"test_id":63,"id":892}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1405	\N	\N	created	App\\Models\\Psychology\\Result	893	[]	{"answer_id":29,"question_id":9,"test_id":63,"id":893}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1406	\N	\N	created	App\\Models\\Psychology\\Result	894	[]	{"answer_id":35,"question_id":10,"test_id":63,"id":894}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1407	\N	\N	created	App\\Models\\Psychology\\Result	895	[]	{"answer_id":37,"question_id":11,"test_id":63,"id":895}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1408	\N	\N	created	App\\Models\\Psychology\\Result	896	[]	{"answer_id":92,"question_id":29,"test_id":63,"id":896}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1409	\N	\N	updated	App\\Models\\Psychology\\Test	63	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-63-0450168489","score":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1410	\N	\N	created	App\\Models\\Psychology\\Agent	12	[]	{"test_id":63,"email":"davichocusangua@gmail.com","identification":"0400732830","lastname":"Cusangua Fueltala","name":"Carlos Alberto","phone":"0963971045","id":12}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:10	2022-03-19 15:30:10
1411	\N	\N	created	App\\Models\\Authentication\\User	63	[]	{"name":"VICTOR MATEO","email":"victorcusangua@gmail.com","lastname":"CUSANGUA FUELTALA","username":"0450168760","phone":"0995367233","password":"$2y$10$P3xhH\\/C1xLK92kZxgGcNdeUonjxyKVQE5ObpEgCSqlgK4rmBRVZXm","id":63}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1412	\N	\N	created	App\\Models\\Psychology\\Test	64	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":63,"age":18,"terms_conditions":true,"type":"psc17","id":64}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1413	\N	\N	created	App\\Models\\Psychology\\Result	897	[]	{"answer_id":2,"question_id":1,"test_id":64,"id":897}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1414	\N	\N	created	App\\Models\\Psychology\\Result	898	[]	{"answer_id":4,"question_id":2,"test_id":64,"id":898}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1415	\N	\N	created	App\\Models\\Psychology\\Result	899	[]	{"answer_id":43,"question_id":12,"test_id":64,"id":899}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1416	\N	\N	created	App\\Models\\Psychology\\Result	900	[]	{"answer_id":45,"question_id":13,"test_id":64,"id":900}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:19	2022-03-19 15:30:19
1417	\N	\N	created	App\\Models\\Psychology\\Result	901	[]	{"answer_id":48,"question_id":14,"test_id":64,"id":901}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1418	\N	\N	created	App\\Models\\Psychology\\Result	902	[]	{"answer_id":50,"question_id":15,"test_id":64,"id":902}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1419	\N	\N	created	App\\Models\\Psychology\\Result	903	[]	{"answer_id":53,"question_id":16,"test_id":64,"id":903}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1420	\N	\N	created	App\\Models\\Psychology\\Result	904	[]	{"answer_id":58,"question_id":17,"test_id":64,"id":904}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1421	\N	\N	created	App\\Models\\Psychology\\Result	905	[]	{"answer_id":60,"question_id":18,"test_id":64,"id":905}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1422	\N	\N	created	App\\Models\\Psychology\\Result	906	[]	{"answer_id":62,"question_id":19,"test_id":64,"id":906}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1423	\N	\N	created	App\\Models\\Psychology\\Result	907	[]	{"answer_id":66,"question_id":20,"test_id":64,"id":907}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1424	\N	\N	created	App\\Models\\Psychology\\Result	908	[]	{"answer_id":68,"question_id":21,"test_id":64,"id":908}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1425	\N	\N	created	App\\Models\\Psychology\\Result	909	[]	{"answer_id":71,"question_id":22,"test_id":64,"id":909}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1426	\N	\N	created	App\\Models\\Psychology\\Result	910	[]	{"answer_id":75,"question_id":23,"test_id":64,"id":910}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1427	\N	\N	created	App\\Models\\Psychology\\Result	911	[]	{"answer_id":79,"question_id":24,"test_id":64,"id":911}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1428	\N	\N	created	App\\Models\\Psychology\\Result	912	[]	{"answer_id":81,"question_id":25,"test_id":64,"id":912}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1429	\N	\N	created	App\\Models\\Psychology\\Result	913	[]	{"answer_id":84,"question_id":26,"test_id":64,"id":913}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1430	\N	\N	created	App\\Models\\Psychology\\Result	914	[]	{"answer_id":86,"question_id":27,"test_id":64,"id":914}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1431	\N	\N	created	App\\Models\\Psychology\\Result	915	[]	{"answer_id":89,"question_id":28,"test_id":64,"id":915}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1432	\N	\N	created	App\\Models\\Psychology\\Result	916	[]	{"answer_id":92,"question_id":29,"test_id":64,"id":916}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1433	\N	\N	updated	App\\Models\\Psychology\\Test	64	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-64-0450168760","score":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2003J15SC) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 15:30:20	2022-03-19 15:30:20
1434	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	58	[]	{"username":"davidburbanoromero@gmail.com","token":8892,"id":58}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 8T) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:30:39	2022-03-19 15:30:39
1435	\N	\N	created	App\\Models\\Authentication\\User	64	[]	{"name":"ALENIS MICAELA","email":"","lastname":"BEDOYA AYALA","username":"0402053078","phone":"","password":"$2y$10$6dDO3UpA2kjF2reG9N3aNe88QF20eq7o4bOJaDnYw5DOxD2ifNLni","id":64}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1436	\N	\N	created	App\\Models\\Psychology\\Test	65	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":64,"age":17,"terms_conditions":true,"type":"phq9a","id":65}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1437	\N	\N	created	App\\Models\\Psychology\\Result	917	[]	{"answer_id":1,"question_id":1,"test_id":65,"id":917}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1438	\N	\N	created	App\\Models\\Psychology\\Result	918	[]	{"answer_id":3,"question_id":2,"test_id":65,"id":918}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1439	\N	\N	created	App\\Models\\Psychology\\Result	919	[]	{"answer_id":6,"question_id":3,"test_id":65,"id":919}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1440	\N	\N	created	App\\Models\\Psychology\\Result	920	[]	{"answer_id":10,"question_id":4,"test_id":65,"id":920}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1441	\N	\N	created	App\\Models\\Psychology\\Result	921	[]	{"answer_id":16,"question_id":5,"test_id":65,"id":921}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1442	\N	\N	created	App\\Models\\Psychology\\Result	922	[]	{"answer_id":17,"question_id":6,"test_id":65,"id":922}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1443	\N	\N	created	App\\Models\\Psychology\\Result	923	[]	{"answer_id":22,"question_id":7,"test_id":65,"id":923}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1444	\N	\N	created	App\\Models\\Psychology\\Result	924	[]	{"answer_id":26,"question_id":8,"test_id":65,"id":924}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1445	\N	\N	created	App\\Models\\Psychology\\Result	925	[]	{"answer_id":29,"question_id":9,"test_id":65,"id":925}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1446	\N	\N	created	App\\Models\\Psychology\\Result	926	[]	{"answer_id":33,"question_id":10,"test_id":65,"id":926}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1447	\N	\N	created	App\\Models\\Psychology\\Result	927	[]	{"answer_id":37,"question_id":11,"test_id":65,"id":927}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1448	\N	\N	created	App\\Models\\Psychology\\Result	928	[]	{"answer_id":92,"question_id":29,"test_id":65,"id":928}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1449	\N	\N	updated	App\\Models\\Psychology\\Test	65	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-65-0402053078","score":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1450	\N	\N	created	App\\Models\\Psychology\\Agent	13	[]	{"test_id":65,"email":"micaelaalenis6@gmail.com","identification":"0400970414","lastname":"Ayala Coral","name":"Noris Rosenda","phone":"0967962396","id":13}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7BL) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:32:55	2022-03-19 15:32:55
1451	\N	\N	created	App\\Models\\Authentication\\User	65	[]	{"name":"JOHN SEBASTI\\u00e1N","email":"sebastiancuaspa326@gmail.com","lastname":"CUASPA REVELO","username":"0450138656","phone":"0983309862","password":"$2y$10$wM0PlqcOsIDoVj5c4shbzu7lCFJqdXCGtj6m\\/8pj053PUw6V79CXu","id":65}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1452	\N	\N	created	App\\Models\\Psychology\\Test	66	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":65,"age":18,"terms_conditions":true,"type":"psc17","id":66}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1453	\N	\N	created	App\\Models\\Psychology\\Result	929	[]	{"answer_id":2,"question_id":1,"test_id":66,"id":929}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1454	\N	\N	created	App\\Models\\Psychology\\Result	930	[]	{"answer_id":4,"question_id":2,"test_id":66,"id":930}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1455	\N	\N	created	App\\Models\\Psychology\\Result	931	[]	{"answer_id":41,"question_id":12,"test_id":66,"id":931}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1456	\N	\N	created	App\\Models\\Psychology\\Result	932	[]	{"answer_id":45,"question_id":13,"test_id":66,"id":932}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1457	\N	\N	created	App\\Models\\Psychology\\Result	933	[]	{"answer_id":47,"question_id":14,"test_id":66,"id":933}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1458	\N	\N	created	App\\Models\\Psychology\\Result	934	[]	{"answer_id":50,"question_id":15,"test_id":66,"id":934}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1459	\N	\N	created	App\\Models\\Psychology\\Result	935	[]	{"answer_id":54,"question_id":16,"test_id":66,"id":935}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1460	\N	\N	created	App\\Models\\Psychology\\Result	936	[]	{"answer_id":56,"question_id":17,"test_id":66,"id":936}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1461	\N	\N	created	App\\Models\\Psychology\\Result	937	[]	{"answer_id":60,"question_id":18,"test_id":66,"id":937}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1462	\N	\N	created	App\\Models\\Psychology\\Result	938	[]	{"answer_id":62,"question_id":19,"test_id":66,"id":938}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1463	\N	\N	created	App\\Models\\Psychology\\Result	939	[]	{"answer_id":65,"question_id":20,"test_id":66,"id":939}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1464	\N	\N	created	App\\Models\\Psychology\\Result	940	[]	{"answer_id":68,"question_id":21,"test_id":66,"id":940}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1465	\N	\N	created	App\\Models\\Psychology\\Result	941	[]	{"answer_id":72,"question_id":22,"test_id":66,"id":941}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1466	\N	\N	created	App\\Models\\Psychology\\Result	942	[]	{"answer_id":74,"question_id":23,"test_id":66,"id":942}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1467	\N	\N	created	App\\Models\\Psychology\\Result	943	[]	{"answer_id":78,"question_id":24,"test_id":66,"id":943}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1468	\N	\N	created	App\\Models\\Psychology\\Result	944	[]	{"answer_id":80,"question_id":25,"test_id":66,"id":944}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1469	\N	\N	created	App\\Models\\Psychology\\Result	945	[]	{"answer_id":84,"question_id":26,"test_id":66,"id":945}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1470	\N	\N	created	App\\Models\\Psychology\\Result	946	[]	{"answer_id":86,"question_id":27,"test_id":66,"id":946}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1471	\N	\N	created	App\\Models\\Psychology\\Result	947	[]	{"answer_id":90,"question_id":28,"test_id":66,"id":947}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1472	\N	\N	created	App\\Models\\Psychology\\Result	948	[]	{"answer_id":92,"question_id":29,"test_id":66,"id":948}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1473	\N	\N	updated	App\\Models\\Psychology\\Test	66	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-66-0450138656","score":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 6.0.1; SAMSUNG SM-G532M) AppleWebKit/537.36 (KHTML, like Gecko) SamsungBrowser/16.2 Chrome/92.0.4515.166 Mobile Safari/537.36	\N	2022-03-19 15:35:09	2022-03-19 15:35:09
1474	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	59	[]	{"username":"davidburbanoromero@gmail.com","token":6284,"id":59}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:35:25	2022-03-19 15:35:25
1475	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	59	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:35:49	2022-03-19 15:35:49
1476	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	60	[]	{"username":"g@d","token":2615,"id":60}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:36:19	2022-03-19 15:36:19
1477	\N	\N	created	App\\Models\\Authentication\\User	66	[]	{"name":"DAVID NICOL\\u00e1S","email":"","lastname":"BURBANO ROMERO","username":"0402102875","phone":"","password":"$2y$10$0Dw2EvdvLF\\/p0RCKKLT4juzay21n5j4lOsi5ePyvK4TMLvL.lqAG6","id":66}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:55	2022-03-19 15:38:55
1478	\N	\N	created	App\\Models\\Psychology\\Test	67	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":66,"age":17,"terms_conditions":true,"type":"psc17","id":67}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:55	2022-03-19 15:38:55
1479	\N	\N	created	App\\Models\\Psychology\\Result	949	[]	{"answer_id":2,"question_id":1,"test_id":67,"id":949}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:55	2022-03-19 15:38:55
1480	\N	\N	created	App\\Models\\Psychology\\Result	950	[]	{"answer_id":4,"question_id":2,"test_id":67,"id":950}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:55	2022-03-19 15:38:55
1481	\N	\N	created	App\\Models\\Psychology\\Result	951	[]	{"answer_id":41,"question_id":12,"test_id":67,"id":951}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:55	2022-03-19 15:38:55
1482	\N	\N	created	App\\Models\\Psychology\\Result	952	[]	{"answer_id":44,"question_id":13,"test_id":67,"id":952}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1483	\N	\N	created	App\\Models\\Psychology\\Result	953	[]	{"answer_id":47,"question_id":14,"test_id":67,"id":953}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1484	\N	\N	created	App\\Models\\Psychology\\Result	954	[]	{"answer_id":50,"question_id":15,"test_id":67,"id":954}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1485	\N	\N	created	App\\Models\\Psychology\\Result	955	[]	{"answer_id":54,"question_id":16,"test_id":67,"id":955}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1486	\N	\N	created	App\\Models\\Psychology\\Result	956	[]	{"answer_id":56,"question_id":17,"test_id":67,"id":956}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1487	\N	\N	created	App\\Models\\Psychology\\Result	957	[]	{"answer_id":59,"question_id":18,"test_id":67,"id":957}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1488	\N	\N	created	App\\Models\\Psychology\\Result	958	[]	{"answer_id":62,"question_id":19,"test_id":67,"id":958}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1489	\N	\N	created	App\\Models\\Psychology\\Result	959	[]	{"answer_id":65,"question_id":20,"test_id":67,"id":959}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1490	\N	\N	created	App\\Models\\Psychology\\Result	960	[]	{"answer_id":68,"question_id":21,"test_id":67,"id":960}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1491	\N	\N	created	App\\Models\\Psychology\\Result	961	[]	{"answer_id":71,"question_id":22,"test_id":67,"id":961}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1492	\N	\N	created	App\\Models\\Psychology\\Result	962	[]	{"answer_id":75,"question_id":23,"test_id":67,"id":962}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1493	\N	\N	created	App\\Models\\Psychology\\Result	963	[]	{"answer_id":77,"question_id":24,"test_id":67,"id":963}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1494	\N	\N	created	App\\Models\\Psychology\\Result	964	[]	{"answer_id":81,"question_id":25,"test_id":67,"id":964}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1495	\N	\N	created	App\\Models\\Psychology\\Result	965	[]	{"answer_id":83,"question_id":26,"test_id":67,"id":965}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1496	\N	\N	created	App\\Models\\Psychology\\Result	966	[]	{"answer_id":86,"question_id":27,"test_id":67,"id":966}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1497	\N	\N	created	App\\Models\\Psychology\\Result	967	[]	{"answer_id":89,"question_id":28,"test_id":67,"id":967}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1498	\N	\N	created	App\\Models\\Psychology\\Result	968	[]	{"answer_id":92,"question_id":29,"test_id":67,"id":968}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1499	\N	\N	updated	App\\Models\\Psychology\\Test	67	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"04-67-0402102875","score":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1519	\N	\N	created	App\\Models\\Psychology\\Result	982	[]	{"answer_id":4,"question_id":2,"test_id":69,"id":982}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1500	\N	\N	created	App\\Models\\Psychology\\Agent	14	[]	{"test_id":67,"email":"davidburbanoromero@gmail.com","identification":"0400980587","lastname":"Romero Palacios","name":"Mar\\u00eda del Carmen","phone":"B","id":14}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; U; Android 11; es-us; Redmi Note 8 Build/RKQ1.201004.002) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/89.0.4389.116 Mobile Safari/537.36 XiaoMi/MiuiBrowser/12.24.1-gn	\N	2022-03-19 15:38:56	2022-03-19 15:38:56
1501	\N	\N	created	App\\Models\\Authentication\\User	67	[]	{"name":"G\\u00e9NESIS XIOMARA","email":"genesisrojas1889@gmail.com","lastname":"ROJAS CUC\\u00e1S","username":"0401822424","phone":"0994569271","password":"$2y$10$PPU9amKoZYq5cE4rVyo8iu8qedNndw3xYE9fH2FB05vfdklUtgHvK","id":67}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1502	\N	\N	created	App\\Models\\Psychology\\Test	68	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":67,"age":18,"terms_conditions":true,"type":"phq9a","id":68}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1503	\N	\N	created	App\\Models\\Psychology\\Result	969	[]	{"answer_id":2,"question_id":1,"test_id":68,"id":969}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1504	\N	\N	created	App\\Models\\Psychology\\Result	970	[]	{"answer_id":3,"question_id":2,"test_id":68,"id":970}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1505	\N	\N	created	App\\Models\\Psychology\\Result	971	[]	{"answer_id":6,"question_id":3,"test_id":68,"id":971}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1506	\N	\N	created	App\\Models\\Psychology\\Result	972	[]	{"answer_id":10,"question_id":4,"test_id":68,"id":972}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1507	\N	\N	created	App\\Models\\Psychology\\Result	973	[]	{"answer_id":14,"question_id":5,"test_id":68,"id":973}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1508	\N	\N	created	App\\Models\\Psychology\\Result	974	[]	{"answer_id":19,"question_id":6,"test_id":68,"id":974}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1509	\N	\N	created	App\\Models\\Psychology\\Result	975	[]	{"answer_id":21,"question_id":7,"test_id":68,"id":975}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1510	\N	\N	created	App\\Models\\Psychology\\Result	976	[]	{"answer_id":26,"question_id":8,"test_id":68,"id":976}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1511	\N	\N	created	App\\Models\\Psychology\\Result	977	[]	{"answer_id":30,"question_id":9,"test_id":68,"id":977}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1512	\N	\N	created	App\\Models\\Psychology\\Result	978	[]	{"answer_id":33,"question_id":10,"test_id":68,"id":978}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1513	\N	\N	created	App\\Models\\Psychology\\Result	979	[]	{"answer_id":37,"question_id":11,"test_id":68,"id":979}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1514	\N	\N	created	App\\Models\\Psychology\\Result	980	[]	{"answer_id":93,"question_id":29,"test_id":68,"id":980}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1515	\N	\N	updated	App\\Models\\Psychology\\Test	68	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"04-68-0401822424","score":8}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1516	\N	\N	created	App\\Models\\Authentication\\User	68	[]	{"name":"JOSEPH YAHIR","email":"yahirrosales770@gmail","lastname":"ROSALES MORALES","username":"0402040935","phone":"0962543664","password":"$2y$10$62GPyzBTl7bF8AdzZOU1m.aZg.iLQ6Y62DMP8FHZD7dPUCZxIiih6","id":68}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1517	\N	\N	created	App\\Models\\Psychology\\Test	69	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":68,"age":18,"terms_conditions":true,"type":"psc17","id":69}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1518	\N	\N	created	App\\Models\\Psychology\\Result	981	[]	{"answer_id":2,"question_id":1,"test_id":69,"id":981}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1520	\N	\N	created	App\\Models\\Psychology\\Result	983	[]	{"answer_id":42,"question_id":12,"test_id":69,"id":983}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1521	\N	\N	created	App\\Models\\Psychology\\Result	984	[]	{"answer_id":45,"question_id":13,"test_id":69,"id":984}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1522	\N	\N	created	App\\Models\\Psychology\\Result	985	[]	{"answer_id":47,"question_id":14,"test_id":69,"id":985}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1523	\N	\N	created	App\\Models\\Psychology\\Result	986	[]	{"answer_id":50,"question_id":15,"test_id":69,"id":986}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1524	\N	\N	created	App\\Models\\Psychology\\Result	987	[]	{"answer_id":54,"question_id":16,"test_id":69,"id":987}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1525	\N	\N	created	App\\Models\\Psychology\\Result	988	[]	{"answer_id":56,"question_id":17,"test_id":69,"id":988}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1526	\N	\N	created	App\\Models\\Psychology\\Result	989	[]	{"answer_id":60,"question_id":18,"test_id":69,"id":989}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1527	\N	\N	created	App\\Models\\Psychology\\Result	990	[]	{"answer_id":62,"question_id":19,"test_id":69,"id":990}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1528	\N	\N	created	App\\Models\\Psychology\\Result	991	[]	{"answer_id":65,"question_id":20,"test_id":69,"id":991}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1529	\N	\N	created	App\\Models\\Psychology\\Result	992	[]	{"answer_id":68,"question_id":21,"test_id":69,"id":992}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1530	\N	\N	created	App\\Models\\Psychology\\Result	993	[]	{"answer_id":71,"question_id":22,"test_id":69,"id":993}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1531	\N	\N	created	App\\Models\\Psychology\\Result	994	[]	{"answer_id":74,"question_id":23,"test_id":69,"id":994}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1532	\N	\N	created	App\\Models\\Psychology\\Result	995	[]	{"answer_id":78,"question_id":24,"test_id":69,"id":995}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1533	\N	\N	created	App\\Models\\Psychology\\Result	996	[]	{"answer_id":80,"question_id":25,"test_id":69,"id":996}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1534	\N	\N	created	App\\Models\\Psychology\\Result	997	[]	{"answer_id":84,"question_id":26,"test_id":69,"id":997}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1535	\N	\N	created	App\\Models\\Psychology\\Result	998	[]	{"answer_id":86,"question_id":27,"test_id":69,"id":998}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1536	\N	\N	created	App\\Models\\Psychology\\Result	999	[]	{"answer_id":90,"question_id":28,"test_id":69,"id":999}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1537	\N	\N	created	App\\Models\\Psychology\\Result	1000	[]	{"answer_id":93,"question_id":29,"test_id":69,"id":1000}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1538	\N	\N	updated	App\\Models\\Psychology\\Test	69	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"04-69-0402040935","score":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 10; STK-LX3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 15:40:45	2022-03-19 15:40:45
1539	\N	\N	created	App\\Models\\Authentication\\User	69	[]	{"name":"MATEO ISRAEL","email":"mateorevelo1000@gmail.com","lastname":"REVELO OBANDO","username":"0400858783","phone":"0982275911","password":"$2y$10$1yqRKxtOn9InmtpZFoa\\/c.9KMKyxnfxPSrg7yAn4HxRA66SUkI3ya","id":69}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1540	\N	\N	created	App\\Models\\Psychology\\Test	70	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":69,"age":18,"terms_conditions":true,"type":"phq9a","id":70}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1541	\N	\N	created	App\\Models\\Psychology\\Result	1001	[]	{"answer_id":1,"question_id":1,"test_id":70,"id":1001}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1542	\N	\N	created	App\\Models\\Psychology\\Result	1002	[]	{"answer_id":4,"question_id":2,"test_id":70,"id":1002}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1543	\N	\N	created	App\\Models\\Psychology\\Result	1003	[]	{"answer_id":5,"question_id":3,"test_id":70,"id":1003}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1544	\N	\N	created	App\\Models\\Psychology\\Result	1004	[]	{"answer_id":9,"question_id":4,"test_id":70,"id":1004}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1545	\N	\N	created	App\\Models\\Psychology\\Result	1005	[]	{"answer_id":14,"question_id":5,"test_id":70,"id":1005}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1546	\N	\N	created	App\\Models\\Psychology\\Result	1006	[]	{"answer_id":17,"question_id":6,"test_id":70,"id":1006}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1547	\N	\N	created	App\\Models\\Psychology\\Result	1007	[]	{"answer_id":21,"question_id":7,"test_id":70,"id":1007}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1548	\N	\N	created	App\\Models\\Psychology\\Result	1008	[]	{"answer_id":25,"question_id":8,"test_id":70,"id":1008}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1549	\N	\N	created	App\\Models\\Psychology\\Result	1009	[]	{"answer_id":29,"question_id":9,"test_id":70,"id":1009}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1550	\N	\N	created	App\\Models\\Psychology\\Result	1010	[]	{"answer_id":33,"question_id":10,"test_id":70,"id":1010}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1551	\N	\N	created	App\\Models\\Psychology\\Result	1011	[]	{"answer_id":37,"question_id":11,"test_id":70,"id":1011}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1552	\N	\N	created	App\\Models\\Psychology\\Result	1012	[]	{"answer_id":93,"question_id":29,"test_id":70,"id":1012}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1553	\N	\N	updated	App\\Models\\Psychology\\Test	70	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"04-70-0400858783","score":2}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 12_5_5 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-19 15:43:39	2022-03-19 15:43:39
1554	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	61	[]	{"username":"jennrosero@gamil.com","token":7834,"id":61}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-19 15:53:52	2022-03-19 15:53:52
1555	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	62	[]	{"username":"laraelian52@gmail.com","token":6700,"id":62}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:03:28	2022-03-19 19:03:28
1556	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	62	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:03:56	2022-03-19 19:03:56
1557	\N	\N	created	App\\Models\\Authentication\\User	70	[]	{"name":"ELIAN","email":"","lastname":"LARA","username":"0402006886","phone":"","password":"$2y$10$GRsDf6BhEcJTbVmt637NQecvIkO.i33f4TZHWM.FOtSMlwYIMVcMe","id":70}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1558	\N	\N	created	App\\Models\\Psychology\\Test	71	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":70,"age":17,"terms_conditions":true,"type":"phq9a","id":71}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1559	\N	\N	created	App\\Models\\Psychology\\Result	1013	[]	{"answer_id":1,"question_id":1,"test_id":71,"id":1013}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1560	\N	\N	created	App\\Models\\Psychology\\Result	1014	[]	{"answer_id":3,"question_id":2,"test_id":71,"id":1014}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1561	\N	\N	created	App\\Models\\Psychology\\Result	1015	[]	{"answer_id":8,"question_id":3,"test_id":71,"id":1015}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1562	\N	\N	created	App\\Models\\Psychology\\Result	1016	[]	{"answer_id":12,"question_id":4,"test_id":71,"id":1016}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1563	\N	\N	created	App\\Models\\Psychology\\Result	1017	[]	{"answer_id":15,"question_id":5,"test_id":71,"id":1017}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1564	\N	\N	created	App\\Models\\Psychology\\Result	1018	[]	{"answer_id":19,"question_id":6,"test_id":71,"id":1018}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1565	\N	\N	created	App\\Models\\Psychology\\Result	1019	[]	{"answer_id":24,"question_id":7,"test_id":71,"id":1019}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1566	\N	\N	created	App\\Models\\Psychology\\Result	1020	[]	{"answer_id":28,"question_id":8,"test_id":71,"id":1020}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1567	\N	\N	created	App\\Models\\Psychology\\Result	1021	[]	{"answer_id":32,"question_id":9,"test_id":71,"id":1021}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1568	\N	\N	created	App\\Models\\Psychology\\Result	1022	[]	{"answer_id":35,"question_id":10,"test_id":71,"id":1022}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1569	\N	\N	created	App\\Models\\Psychology\\Result	1023	[]	{"answer_id":40,"question_id":11,"test_id":71,"id":1023}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1570	\N	\N	created	App\\Models\\Psychology\\Result	1024	[]	{"answer_id":93,"question_id":29,"test_id":71,"id":1024}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:15	2022-03-19 19:06:15
1571	\N	\N	updated	App\\Models\\Psychology\\Test	71	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-71-0402006886","score":26}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:17	2022-03-19 19:06:17
1572	\N	\N	created	App\\Models\\Psychology\\Agent	15	[]	{"test_id":71,"email":"laraelian52@gmail.com","identification":"0402006886","lastname":"Elian Lara","name":"Elian","phone":"0939985411","id":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Redmi Note 9S) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 19:06:17	2022-03-19 19:06:17
1573	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	63	[]	{"username":"heydyquinonez82@gmail.com","token":7465,"id":63}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:28:04	2022-03-19 20:28:04
1574	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	63	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:29:00	2022-03-19 20:29:00
1575	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	64	[]	{"username":"candobradley12@gmail.com","token":7820,"id":64}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:30:56	2022-03-19 20:30:56
1576	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	65	[]	{"username":"candobradley12@gmail.com","token":7799,"id":65}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:31:36	2022-03-19 20:31:36
1577	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	66	[]	{"username":"candobradley12@gmail.com","token":2700,"id":66}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:31:52	2022-03-19 20:31:52
1578	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	67	[]	{"username":"candobradley12@gmail.com","token":9445,"id":67}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:31:58	2022-03-19 20:31:58
1579	\N	\N	created	App\\Models\\Authentication\\User	71	[]	{"name":"HEIDY TATIANA","email":"","lastname":"QUI\\u00f1ONEZ MALQUIN","username":"0450217054","phone":"","password":"$2y$10$SG6WzpOnn3RIDmxga2B7HOkOoYzzzdhTnkMxx\\/.0aOL41gIG4glcy","id":71}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1580	\N	\N	created	App\\Models\\Psychology\\Test	72	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":71,"age":15,"terms_conditions":true,"type":"phq9a","id":72}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1581	\N	\N	created	App\\Models\\Psychology\\Result	1025	[]	{"answer_id":2,"question_id":1,"test_id":72,"id":1025}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1582	\N	\N	created	App\\Models\\Psychology\\Result	1026	[]	{"answer_id":3,"question_id":2,"test_id":72,"id":1026}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1583	\N	\N	created	App\\Models\\Psychology\\Result	1027	[]	{"answer_id":6,"question_id":3,"test_id":72,"id":1027}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1584	\N	\N	created	App\\Models\\Psychology\\Result	1028	[]	{"answer_id":9,"question_id":4,"test_id":72,"id":1028}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1585	\N	\N	created	App\\Models\\Psychology\\Result	1029	[]	{"answer_id":14,"question_id":5,"test_id":72,"id":1029}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1586	\N	\N	created	App\\Models\\Psychology\\Result	1030	[]	{"answer_id":18,"question_id":6,"test_id":72,"id":1030}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1587	\N	\N	created	App\\Models\\Psychology\\Result	1031	[]	{"answer_id":21,"question_id":7,"test_id":72,"id":1031}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1588	\N	\N	created	App\\Models\\Psychology\\Result	1032	[]	{"answer_id":26,"question_id":8,"test_id":72,"id":1032}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1589	\N	\N	created	App\\Models\\Psychology\\Result	1033	[]	{"answer_id":29,"question_id":9,"test_id":72,"id":1033}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1590	\N	\N	created	App\\Models\\Psychology\\Result	1034	[]	{"answer_id":33,"question_id":10,"test_id":72,"id":1034}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1591	\N	\N	created	App\\Models\\Psychology\\Result	1035	[]	{"answer_id":38,"question_id":11,"test_id":72,"id":1035}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1592	\N	\N	created	App\\Models\\Psychology\\Result	1036	[]	{"answer_id":92,"question_id":29,"test_id":72,"id":1036}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:49	2022-03-19 20:32:49
1593	\N	\N	updated	App\\Models\\Psychology\\Test	72	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"04-72-0450217054","score":7}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:50	2022-03-19 20:32:50
1594	\N	\N	created	App\\Models\\Psychology\\Agent	16	[]	{"test_id":72,"email":"heydyquinonez82@gmail.com","identification":"0401507660","lastname":"Erika Malquin","name":"Erika Tatiana Malquin Muepaz","phone":"0993838432","id":16}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; SM-A205GN) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-19 20:32:50	2022-03-19 20:32:50
1595	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	67	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:33:08	2022-03-19 20:33:08
1596	\N	\N	created	App\\Models\\Authentication\\User	72	[]	{"name":"BRADLEY YARIEL","email":"","lastname":"CANDO ALEM\\u00e1N","username":"0450142575","phone":"","password":"$2y$10$VszKTg\\/ECo5.5Gb9L1lecuTiVR1VhU2MH1YVm\\/CBzjeQ5Oqgzbj3q","id":72}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1597	\N	\N	created	App\\Models\\Psychology\\Test	73	[]	{"canton_id":303,"province_id":252,"state_id":1,"user_id":72,"age":12,"terms_conditions":true,"type":"psc17","id":73}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1598	\N	\N	created	App\\Models\\Psychology\\Result	1037	[]	{"answer_id":2,"question_id":1,"test_id":73,"id":1037}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1599	\N	\N	created	App\\Models\\Psychology\\Result	1038	[]	{"answer_id":4,"question_id":2,"test_id":73,"id":1038}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1600	\N	\N	created	App\\Models\\Psychology\\Result	1039	[]	{"answer_id":41,"question_id":12,"test_id":73,"id":1039}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1601	\N	\N	created	App\\Models\\Psychology\\Result	1040	[]	{"answer_id":44,"question_id":13,"test_id":73,"id":1040}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1602	\N	\N	created	App\\Models\\Psychology\\Result	1041	[]	{"answer_id":47,"question_id":14,"test_id":73,"id":1041}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1603	\N	\N	created	App\\Models\\Psychology\\Result	1042	[]	{"answer_id":51,"question_id":15,"test_id":73,"id":1042}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1604	\N	\N	created	App\\Models\\Psychology\\Result	1043	[]	{"answer_id":53,"question_id":16,"test_id":73,"id":1043}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1605	\N	\N	created	App\\Models\\Psychology\\Result	1044	[]	{"answer_id":56,"question_id":17,"test_id":73,"id":1044}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1606	\N	\N	created	App\\Models\\Psychology\\Result	1045	[]	{"answer_id":60,"question_id":18,"test_id":73,"id":1045}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1607	\N	\N	created	App\\Models\\Psychology\\Result	1046	[]	{"answer_id":62,"question_id":19,"test_id":73,"id":1046}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1608	\N	\N	created	App\\Models\\Psychology\\Result	1047	[]	{"answer_id":65,"question_id":20,"test_id":73,"id":1047}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1609	\N	\N	created	App\\Models\\Psychology\\Result	1048	[]	{"answer_id":68,"question_id":21,"test_id":73,"id":1048}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1610	\N	\N	created	App\\Models\\Psychology\\Result	1049	[]	{"answer_id":72,"question_id":22,"test_id":73,"id":1049}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1611	\N	\N	created	App\\Models\\Psychology\\Result	1050	[]	{"answer_id":74,"question_id":23,"test_id":73,"id":1050}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1612	\N	\N	created	App\\Models\\Psychology\\Result	1051	[]	{"answer_id":78,"question_id":24,"test_id":73,"id":1051}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1613	\N	\N	created	App\\Models\\Psychology\\Result	1052	[]	{"answer_id":80,"question_id":25,"test_id":73,"id":1052}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1614	\N	\N	created	App\\Models\\Psychology\\Result	1053	[]	{"answer_id":83,"question_id":26,"test_id":73,"id":1053}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1615	\N	\N	created	App\\Models\\Psychology\\Result	1054	[]	{"answer_id":86,"question_id":27,"test_id":73,"id":1054}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1616	\N	\N	created	App\\Models\\Psychology\\Result	1055	[]	{"answer_id":90,"question_id":28,"test_id":73,"id":1055}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1617	\N	\N	created	App\\Models\\Psychology\\Result	1056	[]	{"answer_id":93,"question_id":29,"test_id":73,"id":1056}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1618	\N	\N	updated	App\\Models\\Psychology\\Test	73	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"04-73-0450142575","score":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1619	\N	\N	created	App\\Models\\Psychology\\Agent	17	[]	{"test_id":73,"email":"candobradley12@gmail.com","identification":"0401089727","lastname":"Alem\\u00e1n Aguilar","name":"Erika Yajaira","phone":"0997865545","id":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; Infinix X659B) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.58 Mobile Safari/537.36	\N	2022-03-19 20:39:10	2022-03-19 20:39:10
1620	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	68	[]	{"username":"karennicole2006@outlook.es","token":2964,"id":68}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:25:10	2022-03-20 16:25:10
1621	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	68	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:25:47	2022-03-20 16:25:47
1642	\N	\N	created	App\\Models\\Psychology\\Result	1075	[]	{"answer_id":89,"question_id":28,"test_id":74,"id":1075}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1622	\N	\N	created	App\\Models\\Authentication\\User	73	[]	{"name":"KAREN NICOLE","email":"","lastname":"TENEMPAGUAY VASQUEZ","username":"0606244887","phone":"","password":"$2y$10$LpcW6Q68K0p1FVWCHkXFaOy4wQtzISiFiNlxTGgMuzmYAbmHlTaV6","id":73}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1623	\N	\N	created	App\\Models\\Psychology\\Test	74	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":73,"age":15,"terms_conditions":true,"type":"psc17","id":74}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1624	\N	\N	created	App\\Models\\Psychology\\Result	1057	[]	{"answer_id":2,"question_id":1,"test_id":74,"id":1057}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1625	\N	\N	created	App\\Models\\Psychology\\Result	1058	[]	{"answer_id":4,"question_id":2,"test_id":74,"id":1058}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1626	\N	\N	created	App\\Models\\Psychology\\Result	1059	[]	{"answer_id":41,"question_id":12,"test_id":74,"id":1059}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1627	\N	\N	created	App\\Models\\Psychology\\Result	1060	[]	{"answer_id":45,"question_id":13,"test_id":74,"id":1060}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1628	\N	\N	created	App\\Models\\Psychology\\Result	1061	[]	{"answer_id":47,"question_id":14,"test_id":74,"id":1061}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1629	\N	\N	created	App\\Models\\Psychology\\Result	1062	[]	{"answer_id":50,"question_id":15,"test_id":74,"id":1062}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1630	\N	\N	created	App\\Models\\Psychology\\Result	1063	[]	{"answer_id":53,"question_id":16,"test_id":74,"id":1063}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1631	\N	\N	created	App\\Models\\Psychology\\Result	1064	[]	{"answer_id":56,"question_id":17,"test_id":74,"id":1064}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1632	\N	\N	created	App\\Models\\Psychology\\Result	1065	[]	{"answer_id":59,"question_id":18,"test_id":74,"id":1065}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1633	\N	\N	created	App\\Models\\Psychology\\Result	1066	[]	{"answer_id":62,"question_id":19,"test_id":74,"id":1066}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1634	\N	\N	created	App\\Models\\Psychology\\Result	1067	[]	{"answer_id":65,"question_id":20,"test_id":74,"id":1067}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1635	\N	\N	created	App\\Models\\Psychology\\Result	1068	[]	{"answer_id":68,"question_id":21,"test_id":74,"id":1068}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1636	\N	\N	created	App\\Models\\Psychology\\Result	1069	[]	{"answer_id":73,"question_id":22,"test_id":74,"id":1069}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1637	\N	\N	created	App\\Models\\Psychology\\Result	1070	[]	{"answer_id":74,"question_id":23,"test_id":74,"id":1070}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1638	\N	\N	created	App\\Models\\Psychology\\Result	1071	[]	{"answer_id":78,"question_id":24,"test_id":74,"id":1071}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1639	\N	\N	created	App\\Models\\Psychology\\Result	1072	[]	{"answer_id":80,"question_id":25,"test_id":74,"id":1072}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1640	\N	\N	created	App\\Models\\Psychology\\Result	1073	[]	{"answer_id":83,"question_id":26,"test_id":74,"id":1073}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1641	\N	\N	created	App\\Models\\Psychology\\Result	1074	[]	{"answer_id":86,"question_id":27,"test_id":74,"id":1074}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1643	\N	\N	created	App\\Models\\Psychology\\Result	1076	[]	{"answer_id":93,"question_id":29,"test_id":74,"id":1076}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1644	\N	\N	updated	App\\Models\\Psychology\\Test	74	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"06-74-0606244887","score":4}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1645	\N	\N	created	App\\Models\\Psychology\\Agent	18	[]	{"test_id":74,"email":"karennicole2006@outlook.es","identification":"0606244887","lastname":"Vasquez Paredes","name":"Silvana Deysi","phone":"0999912892","id":18}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 16:29:34	2022-03-20 16:29:34
1646	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	69	[]	{"username":"gaby.velategui2006@gmail.com","token":3154,"id":69}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone13,2; iOS 15_3_1; es_EC; es-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 16:43:41	2022-03-20 16:43:41
1647	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	70	[]	{"username":"gaby.velategui2006@gmail.com","token":2673,"id":70}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone13,2; iOS 15_3_1; es_EC; es-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 16:45:55	2022-03-20 16:45:55
1648	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	71	[]	{"username":"abejita1578@gmail.com","token":7016,"id":71}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; moto g stylus (2021)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 17:02:11	2022-03-20 17:02:11
1649	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	72	[]	{"username":"Joyce2006erazo@gmail.com","token":5350,"id":72}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:09:30	2022-03-20 17:09:30
1650	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	73	[]	{"username":"abejita1578@gmail.com","token":3142,"id":73}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; moto g stylus (2021)) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 17:09:37	2022-03-20 17:09:37
1651	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	72	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:11:56	2022-03-20 17:11:56
1652	\N	\N	created	App\\Models\\Authentication\\User	74	[]	{"name":"JOYCE CRISTELL","email":"","lastname":"ERAZO MART\\u00edNEZ","username":"0605935543","phone":"","password":"$2y$10$n9P5Q2lAT\\/p943CWFt.XS.wLKxhRBux9yqFViSYCx3LDtw4PR1boq","id":74}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1653	\N	\N	created	App\\Models\\Psychology\\Test	75	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":74,"age":15,"terms_conditions":true,"type":"phq9a","id":75}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1654	\N	\N	created	App\\Models\\Psychology\\Result	1077	[]	{"answer_id":2,"question_id":1,"test_id":75,"id":1077}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1655	\N	\N	created	App\\Models\\Psychology\\Result	1078	[]	{"answer_id":3,"question_id":2,"test_id":75,"id":1078}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1656	\N	\N	created	App\\Models\\Psychology\\Result	1079	[]	{"answer_id":5,"question_id":3,"test_id":75,"id":1079}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1657	\N	\N	created	App\\Models\\Psychology\\Result	1080	[]	{"answer_id":10,"question_id":4,"test_id":75,"id":1080}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1658	\N	\N	created	App\\Models\\Psychology\\Result	1081	[]	{"answer_id":13,"question_id":5,"test_id":75,"id":1081}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1659	\N	\N	created	App\\Models\\Psychology\\Result	1082	[]	{"answer_id":17,"question_id":6,"test_id":75,"id":1082}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1660	\N	\N	created	App\\Models\\Psychology\\Result	1083	[]	{"answer_id":22,"question_id":7,"test_id":75,"id":1083}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1661	\N	\N	created	App\\Models\\Psychology\\Result	1084	[]	{"answer_id":25,"question_id":8,"test_id":75,"id":1084}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1662	\N	\N	created	App\\Models\\Psychology\\Result	1085	[]	{"answer_id":29,"question_id":9,"test_id":75,"id":1085}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1663	\N	\N	created	App\\Models\\Psychology\\Result	1086	[]	{"answer_id":33,"question_id":10,"test_id":75,"id":1086}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1664	\N	\N	created	App\\Models\\Psychology\\Result	1087	[]	{"answer_id":37,"question_id":11,"test_id":75,"id":1087}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1665	\N	\N	created	App\\Models\\Psychology\\Result	1088	[]	{"answer_id":93,"question_id":29,"test_id":75,"id":1088}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1666	\N	\N	updated	App\\Models\\Psychology\\Test	75	{"priority_id":null,"code":null,"score":null}	{"priority_id":4,"code":"06-75-0605935543","score":3}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1667	\N	\N	created	App\\Models\\Psychology\\Agent	19	[]	{"test_id":75,"email":"Joyce2006erazo@gmail.com","identification":"0603828161","lastname":"Mart\\u00ednez Delgado","name":"Andrea Elizabeth","phone":"0984780026","id":19}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 225.0.0.9.115 (iPhone10,1; iOS 15_4; es_EC; es-EC; scale=2.00; 750x1334; 355286437)	\N	2022-03-20 17:16:58	2022-03-20 17:16:58
1668	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	74	[]	{"username":"raque.c307@gmail.com","token":5548,"id":74}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:21:27	2022-03-20 17:21:27
1669	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	74	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:22:00	2022-03-20 17:22:00
1670	\N	\N	created	App\\Models\\Authentication\\User	75	[]	{"name":"DANIELA","email":"","lastname":"CABA PAREDES","username":"0650113400","phone":"","password":"$2y$10$nIKAFmTJSaLvJyw4UiYVo.2wJVFPNh30kPQa9nrbUeRyY\\/3hSTtru","id":75}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1671	\N	\N	created	App\\Models\\Psychology\\Test	76	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":75,"age":15,"terms_conditions":true,"type":"phq9a","id":76}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1672	\N	\N	created	App\\Models\\Psychology\\Result	1089	[]	{"answer_id":1,"question_id":1,"test_id":76,"id":1089}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1673	\N	\N	created	App\\Models\\Psychology\\Result	1090	[]	{"answer_id":3,"question_id":2,"test_id":76,"id":1090}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1674	\N	\N	created	App\\Models\\Psychology\\Result	1091	[]	{"answer_id":6,"question_id":3,"test_id":76,"id":1091}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1675	\N	\N	created	App\\Models\\Psychology\\Result	1092	[]	{"answer_id":11,"question_id":4,"test_id":76,"id":1092}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1676	\N	\N	created	App\\Models\\Psychology\\Result	1093	[]	{"answer_id":16,"question_id":5,"test_id":76,"id":1093}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1677	\N	\N	created	App\\Models\\Psychology\\Result	1094	[]	{"answer_id":19,"question_id":6,"test_id":76,"id":1094}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1678	\N	\N	created	App\\Models\\Psychology\\Result	1095	[]	{"answer_id":24,"question_id":7,"test_id":76,"id":1095}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1679	\N	\N	created	App\\Models\\Psychology\\Result	1096	[]	{"answer_id":26,"question_id":8,"test_id":76,"id":1096}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1680	\N	\N	created	App\\Models\\Psychology\\Result	1097	[]	{"answer_id":31,"question_id":9,"test_id":76,"id":1097}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1681	\N	\N	created	App\\Models\\Psychology\\Result	1098	[]	{"answer_id":35,"question_id":10,"test_id":76,"id":1098}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1682	\N	\N	created	App\\Models\\Psychology\\Result	1099	[]	{"answer_id":39,"question_id":11,"test_id":76,"id":1099}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1683	\N	\N	created	App\\Models\\Psychology\\Result	1100	[]	{"answer_id":93,"question_id":29,"test_id":76,"id":1100}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:29	2022-03-20 17:25:29
1684	\N	\N	updated	App\\Models\\Psychology\\Test	76	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"06-76-0650113400","score":20}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:30	2022-03-20 17:25:30
1685	\N	\N	created	App\\Models\\Psychology\\Agent	20	[]	{"test_id":76,"email":"raque.c307@gmail.com","identification":"0603411870","lastname":"Raquel Caba","name":"Raquel Caba","phone":"0992692224","id":20}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone14,5; iOS 15_4; en_EC; en-EC; scale=3.00; 1170x2532; 356244938)	\N	2022-03-20 17:25:30	2022-03-20 17:25:30
1686	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	75	[]	{"username":"dannabenarive@gmail.com","token":9312,"id":75}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:25:33	2022-03-20 17:25:33
1687	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	75	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:26:09	2022-03-20 17:26:09
1688	\N	\N	created	App\\Models\\Authentication\\User	76	[]	{"name":"EMILIA SOF\\u00edA","email":"","lastname":"CELI CARRASCO","username":"0602987433","phone":"","password":"$2y$10$fVUrCQrIetj1JxQgXQFpOuIG8s4V2TM.KJigjjfUPPsASgWhkwHTW","id":76}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1689	\N	\N	created	App\\Models\\Psychology\\Test	77	[]	{"canton_id":460,"province_id":266,"state_id":1,"user_id":76,"age":14,"terms_conditions":true,"type":"phq9a","id":77}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1690	\N	\N	created	App\\Models\\Psychology\\Result	1101	[]	{"answer_id":1,"question_id":1,"test_id":77,"id":1101}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1691	\N	\N	created	App\\Models\\Psychology\\Result	1102	[]	{"answer_id":3,"question_id":2,"test_id":77,"id":1102}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1692	\N	\N	created	App\\Models\\Psychology\\Result	1103	[]	{"answer_id":6,"question_id":3,"test_id":77,"id":1103}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1693	\N	\N	created	App\\Models\\Psychology\\Result	1104	[]	{"answer_id":10,"question_id":4,"test_id":77,"id":1104}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1694	\N	\N	created	App\\Models\\Psychology\\Result	1105	[]	{"answer_id":14,"question_id":5,"test_id":77,"id":1105}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1695	\N	\N	created	App\\Models\\Psychology\\Result	1106	[]	{"answer_id":19,"question_id":6,"test_id":77,"id":1106}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1696	\N	\N	created	App\\Models\\Psychology\\Result	1107	[]	{"answer_id":22,"question_id":7,"test_id":77,"id":1107}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1697	\N	\N	created	App\\Models\\Psychology\\Result	1108	[]	{"answer_id":26,"question_id":8,"test_id":77,"id":1108}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1698	\N	\N	created	App\\Models\\Psychology\\Result	1109	[]	{"answer_id":32,"question_id":9,"test_id":77,"id":1109}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1699	\N	\N	created	App\\Models\\Psychology\\Result	1110	[]	{"answer_id":35,"question_id":10,"test_id":77,"id":1110}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1700	\N	\N	created	App\\Models\\Psychology\\Result	1111	[]	{"answer_id":37,"question_id":11,"test_id":77,"id":1111}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1701	\N	\N	created	App\\Models\\Psychology\\Result	1112	[]	{"answer_id":92,"question_id":29,"test_id":77,"id":1112}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1702	\N	\N	updated	App\\Models\\Psychology\\Test	77	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"18-77-0602987433","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1703	\N	\N	created	App\\Models\\Psychology\\Agent	21	[]	{"test_id":77,"email":"dannabenarive@gmail.com","identification":"0603897544","lastname":"Fierro Castillo","name":"Juan Sebasti\\u00e1n","phone":"0984567298","id":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_1; es_EC; es-EC; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 17:28:33	2022-03-20 17:28:33
1704	\N	\N	created	App\\Models\\Authentication\\User	77	[]	{"name":"MAR\\u00edA EMILIA","email":"mylyemiitadavila@gmail.com","lastname":"D\\u00e1VILA HIDALGO","username":"0605847888","phone":"0999435446","password":"$2y$10$uez33M8XmUB1t81oDfLhdeU8jb\\/g2LRoyGYybZMerqFw6uFflfRaG","id":77}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1705	\N	\N	created	App\\Models\\Psychology\\Test	78	[]	{"canton_id":451,"province_id":265,"state_id":1,"user_id":77,"age":18,"terms_conditions":true,"type":"phq9a","id":78}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1706	\N	\N	created	App\\Models\\Psychology\\Result	1113	[]	{"answer_id":1,"question_id":1,"test_id":78,"id":1113}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1707	\N	\N	created	App\\Models\\Psychology\\Result	1114	[]	{"answer_id":3,"question_id":2,"test_id":78,"id":1114}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1708	\N	\N	created	App\\Models\\Psychology\\Result	1115	[]	{"answer_id":6,"question_id":3,"test_id":78,"id":1115}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1709	\N	\N	created	App\\Models\\Psychology\\Result	1116	[]	{"answer_id":10,"question_id":4,"test_id":78,"id":1116}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1710	\N	\N	created	App\\Models\\Psychology\\Result	1117	[]	{"answer_id":16,"question_id":5,"test_id":78,"id":1117}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1711	\N	\N	created	App\\Models\\Psychology\\Result	1118	[]	{"answer_id":19,"question_id":6,"test_id":78,"id":1118}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1712	\N	\N	created	App\\Models\\Psychology\\Result	1119	[]	{"answer_id":23,"question_id":7,"test_id":78,"id":1119}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1713	\N	\N	created	App\\Models\\Psychology\\Result	1120	[]	{"answer_id":28,"question_id":8,"test_id":78,"id":1120}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1714	\N	\N	created	App\\Models\\Psychology\\Result	1121	[]	{"answer_id":32,"question_id":9,"test_id":78,"id":1121}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1715	\N	\N	created	App\\Models\\Psychology\\Result	1122	[]	{"answer_id":35,"question_id":10,"test_id":78,"id":1122}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1716	\N	\N	created	App\\Models\\Psychology\\Result	1123	[]	{"answer_id":38,"question_id":11,"test_id":78,"id":1123}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1717	\N	\N	created	App\\Models\\Psychology\\Result	1124	[]	{"answer_id":92,"question_id":29,"test_id":78,"id":1124}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:08	2022-03-20 17:40:08
1718	\N	\N	updated	App\\Models\\Psychology\\Test	78	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"17-78-0605847888","score":21}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 17:40:10	2022-03-20 17:40:10
1719	\N	\N	created	App\\Models\\Authentication\\User	78	[]	{"name":"MARIO C\\u00f3RDOVA","email":"marito2416@gmail.com","lastname":"CORDOVA IZURIETA","username":"1750331199","phone":"0985994349","password":"$2y$10$RTIPPTaqnS47aO74eQ1c5uXlIq1dB1CijnV.\\/k6JNdHJoaYDWA8ea","id":78}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1720	\N	\N	created	App\\Models\\Psychology\\Test	79	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":78,"age":18,"terms_conditions":true,"type":"phq9a","id":79}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1721	\N	\N	created	App\\Models\\Psychology\\Result	1125	[]	{"answer_id":1,"question_id":1,"test_id":79,"id":1125}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1722	\N	\N	created	App\\Models\\Psychology\\Result	1126	[]	{"answer_id":4,"question_id":2,"test_id":79,"id":1126}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1723	\N	\N	created	App\\Models\\Psychology\\Result	1127	[]	{"answer_id":5,"question_id":3,"test_id":79,"id":1127}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1724	\N	\N	created	App\\Models\\Psychology\\Result	1128	[]	{"answer_id":11,"question_id":4,"test_id":79,"id":1128}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1725	\N	\N	created	App\\Models\\Psychology\\Result	1129	[]	{"answer_id":16,"question_id":5,"test_id":79,"id":1129}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1726	\N	\N	created	App\\Models\\Psychology\\Result	1130	[]	{"answer_id":20,"question_id":6,"test_id":79,"id":1130}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1727	\N	\N	created	App\\Models\\Psychology\\Result	1131	[]	{"answer_id":23,"question_id":7,"test_id":79,"id":1131}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1728	\N	\N	created	App\\Models\\Psychology\\Result	1132	[]	{"answer_id":27,"question_id":8,"test_id":79,"id":1132}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1729	\N	\N	created	App\\Models\\Psychology\\Result	1133	[]	{"answer_id":30,"question_id":9,"test_id":79,"id":1133}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1730	\N	\N	created	App\\Models\\Psychology\\Result	1134	[]	{"answer_id":36,"question_id":10,"test_id":79,"id":1134}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1731	\N	\N	created	App\\Models\\Psychology\\Result	1135	[]	{"answer_id":37,"question_id":11,"test_id":79,"id":1135}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1732	\N	\N	created	App\\Models\\Psychology\\Result	1136	[]	{"answer_id":93,"question_id":29,"test_id":79,"id":1136}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1733	\N	\N	updated	App\\Models\\Psychology\\Test	79	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-79-1750331199","score":17}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.36	\N	2022-03-20 20:31:50	2022-03-20 20:31:50
1734	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	76	[]	{"username":"mareojeda2004@gmail.com","token":3781,"id":76}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 14_8 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/14.1.2 Mobile/15E148 Safari/604.1	\N	2022-03-20 20:40:04	2022-03-20 20:40:04
1735	\N	\N	created	App\\Models\\Authentication\\User	79	[]	{"name":"NICOL\\u00e1S FRANCISCO","email":"nico456654@gmail.com","lastname":"MONCAYO L\\u00f3PEZ","username":"0604764225","phone":"0983424017","password":"$2y$10$1Z49oNA9BBjU4SfQ5\\/nu\\/emXgplSJn4CmGxe6qrTiDRXdxSocp9ky","id":79}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1736	\N	\N	created	App\\Models\\Psychology\\Test	80	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":79,"age":18,"terms_conditions":true,"type":"phq9a","id":80}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1737	\N	\N	created	App\\Models\\Psychology\\Result	1137	[]	{"answer_id":1,"question_id":1,"test_id":80,"id":1137}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1738	\N	\N	created	App\\Models\\Psychology\\Result	1138	[]	{"answer_id":3,"question_id":2,"test_id":80,"id":1138}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1739	\N	\N	created	App\\Models\\Psychology\\Result	1139	[]	{"answer_id":6,"question_id":3,"test_id":80,"id":1139}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1740	\N	\N	created	App\\Models\\Psychology\\Result	1140	[]	{"answer_id":11,"question_id":4,"test_id":80,"id":1140}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1741	\N	\N	created	App\\Models\\Psychology\\Result	1141	[]	{"answer_id":16,"question_id":5,"test_id":80,"id":1141}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1742	\N	\N	created	App\\Models\\Psychology\\Result	1142	[]	{"answer_id":18,"question_id":6,"test_id":80,"id":1142}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1743	\N	\N	created	App\\Models\\Psychology\\Result	1143	[]	{"answer_id":22,"question_id":7,"test_id":80,"id":1143}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1744	\N	\N	created	App\\Models\\Psychology\\Result	1144	[]	{"answer_id":28,"question_id":8,"test_id":80,"id":1144}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1745	\N	\N	created	App\\Models\\Psychology\\Result	1145	[]	{"answer_id":31,"question_id":9,"test_id":80,"id":1145}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1746	\N	\N	created	App\\Models\\Psychology\\Result	1146	[]	{"answer_id":33,"question_id":10,"test_id":80,"id":1146}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1747	\N	\N	created	App\\Models\\Psychology\\Result	1147	[]	{"answer_id":37,"question_id":11,"test_id":80,"id":1147}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1748	\N	\N	created	App\\Models\\Psychology\\Result	1148	[]	{"answer_id":93,"question_id":29,"test_id":80,"id":1148}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1749	\N	\N	updated	App\\Models\\Psychology\\Test	80	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-80-0604764225","score":15}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.4 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:02:28	2022-03-20 21:02:28
1750	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	77	[]	{"username":"chemaquirola@gmail.com","token":2594,"id":77}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:08:17	2022-03-20 21:08:17
1751	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	77	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:08:54	2022-03-20 21:08:54
1752	\N	\N	created	App\\Models\\Authentication\\User	80	[]	{"name":"JOS\\u00e9 MARIA","email":"","lastname":"QUIROLA MERINO","username":"1751402528","phone":"","password":"$2y$10$nS6QpqZU1dTw44LxCkZdU.3AuxTyGY4QcrDH2Zf\\/eiXjsPaypPyH2","id":80}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1753	\N	\N	created	App\\Models\\Psychology\\Test	81	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":80,"age":16,"terms_conditions":true,"type":"phq9a","id":81}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1754	\N	\N	created	App\\Models\\Psychology\\Result	1149	[]	{"answer_id":1,"question_id":1,"test_id":81,"id":1149}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1755	\N	\N	created	App\\Models\\Psychology\\Result	1150	[]	{"answer_id":4,"question_id":2,"test_id":81,"id":1150}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1756	\N	\N	created	App\\Models\\Psychology\\Result	1151	[]	{"answer_id":6,"question_id":3,"test_id":81,"id":1151}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1757	\N	\N	created	App\\Models\\Psychology\\Result	1152	[]	{"answer_id":10,"question_id":4,"test_id":81,"id":1152}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1758	\N	\N	created	App\\Models\\Psychology\\Result	1153	[]	{"answer_id":13,"question_id":5,"test_id":81,"id":1153}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1759	\N	\N	created	App\\Models\\Psychology\\Result	1154	[]	{"answer_id":17,"question_id":6,"test_id":81,"id":1154}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1760	\N	\N	created	App\\Models\\Psychology\\Result	1155	[]	{"answer_id":21,"question_id":7,"test_id":81,"id":1155}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1761	\N	\N	created	App\\Models\\Psychology\\Result	1156	[]	{"answer_id":25,"question_id":8,"test_id":81,"id":1156}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1762	\N	\N	created	App\\Models\\Psychology\\Result	1157	[]	{"answer_id":31,"question_id":9,"test_id":81,"id":1157}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1763	\N	\N	created	App\\Models\\Psychology\\Result	1158	[]	{"answer_id":33,"question_id":10,"test_id":81,"id":1158}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1764	\N	\N	created	App\\Models\\Psychology\\Result	1159	[]	{"answer_id":37,"question_id":11,"test_id":81,"id":1159}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:33	2022-03-20 21:13:33
1765	\N	\N	created	App\\Models\\Psychology\\Result	1160	[]	{"answer_id":93,"question_id":29,"test_id":81,"id":1160}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:34	2022-03-20 21:13:34
1766	\N	\N	updated	App\\Models\\Psychology\\Test	81	{"priority_id":null,"code":null,"score":null}	{"priority_id":3,"code":"06-81-1751402528","score":5}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:34	2022-03-20 21:13:34
1767	\N	\N	created	App\\Models\\Psychology\\Agent	22	[]	{"test_id":81,"email":"chemaquirola@gmail.com","identification":"1751402528","lastname":"Merino Darquea","name":"Maricruz","phone":"0987217654","id":22}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_3_1 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/15.3 Mobile/15E148 Safari/604.1	\N	2022-03-20 21:13:34	2022-03-20 21:13:34
1768	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	78	[]	{"username":"j.i.pazminox@gmail.com","token":4484,"id":78}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:16:09	2022-03-20 21:16:09
1769	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	78	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:18:12	2022-03-20 21:18:12
1770	\N	\N	created	App\\Models\\Authentication\\TransactionalCode	79	[]	{"username":"vevalentinaochoa@gmail.com","token":2533,"id":79}	https://api.temi.esquel.org.ec/api/v1/tests/generate-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:19:07	2022-03-20 21:19:07
1771	\N	\N	updated	App\\Models\\Authentication\\TransactionalCode	79	{"used":false}	{"used":true}	https://api.temi.esquel.org.ec/api/v1/tests/verify-transactional-code?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:19:32	2022-03-20 21:19:32
1772	\N	\N	created	App\\Models\\Authentication\\User	81	[]	{"name":"JOS\\u00e9 IGNACIO","email":"","lastname":"PAZMI\\u00f1O SALAS","username":"1727248039","phone":"","password":"$2y$10$xQTecC0dyKdlchmsRCh3duW5eDsTWE.cFCxAqX1wvYMPRQnS6m89.","id":81}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1773	\N	\N	created	App\\Models\\Psychology\\Test	82	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":81,"age":17,"terms_conditions":true,"type":"phq9a","id":82}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1774	\N	\N	created	App\\Models\\Psychology\\Result	1161	[]	{"answer_id":1,"question_id":1,"test_id":82,"id":1161}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1775	\N	\N	created	App\\Models\\Psychology\\Result	1162	[]	{"answer_id":3,"question_id":2,"test_id":82,"id":1162}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1776	\N	\N	created	App\\Models\\Psychology\\Result	1163	[]	{"answer_id":7,"question_id":3,"test_id":82,"id":1163}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1777	\N	\N	created	App\\Models\\Psychology\\Result	1164	[]	{"answer_id":11,"question_id":4,"test_id":82,"id":1164}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1778	\N	\N	created	App\\Models\\Psychology\\Result	1165	[]	{"answer_id":16,"question_id":5,"test_id":82,"id":1165}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1779	\N	\N	created	App\\Models\\Psychology\\Result	1166	[]	{"answer_id":20,"question_id":6,"test_id":82,"id":1166}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1780	\N	\N	created	App\\Models\\Psychology\\Result	1167	[]	{"answer_id":24,"question_id":7,"test_id":82,"id":1167}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1781	\N	\N	created	App\\Models\\Psychology\\Result	1168	[]	{"answer_id":28,"question_id":8,"test_id":82,"id":1168}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1782	\N	\N	created	App\\Models\\Psychology\\Result	1169	[]	{"answer_id":32,"question_id":9,"test_id":82,"id":1169}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1783	\N	\N	created	App\\Models\\Psychology\\Result	1170	[]	{"answer_id":33,"question_id":10,"test_id":82,"id":1170}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1784	\N	\N	created	App\\Models\\Psychology\\Result	1171	[]	{"answer_id":40,"question_id":11,"test_id":82,"id":1171}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1785	\N	\N	created	App\\Models\\Psychology\\Result	1172	[]	{"answer_id":92,"question_id":29,"test_id":82,"id":1172}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:07	2022-03-20 21:21:07
1786	\N	\N	updated	App\\Models\\Psychology\\Test	82	{"priority_id":null,"code":null,"score":null}	{"priority_id":1,"code":"06-82-1727248039","score":25}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:09	2022-03-20 21:21:09
1787	\N	\N	created	App\\Models\\Psychology\\Agent	23	[]	{"test_id":82,"email":"j.i.pazminox@gmail.com","identification":"1706726971","lastname":"Pazmi\\u00f1o Boza","name":"David","phone":"0998722416","id":23}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Linux; Android 11; M2101K7AG) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.73 Mobile Safari/537.36	\N	2022-03-20 21:21:09	2022-03-20 21:21:09
1788	\N	\N	created	App\\Models\\Authentication\\User	82	[]	{"name":"VERONICA VALENTINA","email":"","lastname":"OCHOA R\\u00edOS","username":"0605999242","phone":"","password":"$2y$10$ctW1E1j8O11U8waTZfIhe.TobL6aXCFjtwvkFwpWjvNuiJMm9pgCG","id":82}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1789	\N	\N	created	App\\Models\\Psychology\\Test	83	[]	{"canton_id":316,"province_id":254,"state_id":1,"user_id":82,"age":16,"terms_conditions":true,"type":"psc17","id":83}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1790	\N	\N	created	App\\Models\\Psychology\\Result	1173	[]	{"answer_id":2,"question_id":1,"test_id":83,"id":1173}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1791	\N	\N	created	App\\Models\\Psychology\\Result	1174	[]	{"answer_id":4,"question_id":2,"test_id":83,"id":1174}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1792	\N	\N	created	App\\Models\\Psychology\\Result	1175	[]	{"answer_id":42,"question_id":12,"test_id":83,"id":1175}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1793	\N	\N	created	App\\Models\\Psychology\\Result	1176	[]	{"answer_id":46,"question_id":13,"test_id":83,"id":1176}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1794	\N	\N	created	App\\Models\\Psychology\\Result	1177	[]	{"answer_id":47,"question_id":14,"test_id":83,"id":1177}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1795	\N	\N	created	App\\Models\\Psychology\\Result	1178	[]	{"answer_id":50,"question_id":15,"test_id":83,"id":1178}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1796	\N	\N	created	App\\Models\\Psychology\\Result	1179	[]	{"answer_id":53,"question_id":16,"test_id":83,"id":1179}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1797	\N	\N	created	App\\Models\\Psychology\\Result	1180	[]	{"answer_id":56,"question_id":17,"test_id":83,"id":1180}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1798	\N	\N	created	App\\Models\\Psychology\\Result	1181	[]	{"answer_id":60,"question_id":18,"test_id":83,"id":1181}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1799	\N	\N	created	App\\Models\\Psychology\\Result	1182	[]	{"answer_id":62,"question_id":19,"test_id":83,"id":1182}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1800	\N	\N	created	App\\Models\\Psychology\\Result	1183	[]	{"answer_id":65,"question_id":20,"test_id":83,"id":1183}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1801	\N	\N	created	App\\Models\\Psychology\\Result	1184	[]	{"answer_id":68,"question_id":21,"test_id":83,"id":1184}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1802	\N	\N	created	App\\Models\\Psychology\\Result	1185	[]	{"answer_id":72,"question_id":22,"test_id":83,"id":1185}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1803	\N	\N	created	App\\Models\\Psychology\\Result	1186	[]	{"answer_id":74,"question_id":23,"test_id":83,"id":1186}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1804	\N	\N	created	App\\Models\\Psychology\\Result	1187	[]	{"answer_id":79,"question_id":24,"test_id":83,"id":1187}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1805	\N	\N	created	App\\Models\\Psychology\\Result	1188	[]	{"answer_id":80,"question_id":25,"test_id":83,"id":1188}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1806	\N	\N	created	App\\Models\\Psychology\\Result	1189	[]	{"answer_id":84,"question_id":26,"test_id":83,"id":1189}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1807	\N	\N	created	App\\Models\\Psychology\\Result	1190	[]	{"answer_id":86,"question_id":27,"test_id":83,"id":1190}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1808	\N	\N	created	App\\Models\\Psychology\\Result	1191	[]	{"answer_id":90,"question_id":28,"test_id":83,"id":1191}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1809	\N	\N	created	App\\Models\\Psychology\\Result	1192	[]	{"answer_id":92,"question_id":29,"test_id":83,"id":1192}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1810	\N	\N	updated	App\\Models\\Psychology\\Test	83	{"priority_id":null,"code":null,"score":null}	{"priority_id":2,"code":"06-83-0605999242","score":10}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1811	\N	\N	created	App\\Models\\Psychology\\Agent	24	[]	{"test_id":83,"email":"vevalentinaochoa@gmail.com","identification":"1103762868","lastname":"R\\u00edos Plaza","name":"Johanna Lucia","phone":"0983994697","id":24}	https://api.temi.esquel.org.ec/api/v1/tests/chat?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (iPhone; CPU iPhone OS 15_4 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/15E148 Instagram 226.0.0.13.117 (iPhone12,1; iOS 15_4; en_EC; en-GB; scale=2.00; 828x1792; 356244938)	\N	2022-03-20 21:22:27	2022-03-20 21:22:27
1812	App\\Models\\Authentication\\User	20	updated	App\\Models\\Authentication\\User	20	{"max_attempts":3}	{"max_attempts":2}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-20 22:54:09	2022-03-20 22:54:09
1813	\N	\N	updated	App\\Models\\Authentication\\User	20	{"max_attempts":2}	{"max_attempts":1}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-20 22:54:28	2022-03-20 22:54:28
1814	\N	\N	created	App\\Models\\Authentication\\PasswordReset	10	[]	{"username":"1724581218","token":"oeHEyfADRaTTb3MZ9mhsyfjjPctP88dj8z1CZLhW7PJZsZRGTNgTH6eUki8mXx1aHqIgGr","id":10}	https://api.temi.esquel.org.ec/api/v1/auth/request-password-reset?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-20 23:01:35	2022-03-20 23:01:35
1815	\N	\N	updated	App\\Models\\Authentication\\User	20	{"max_attempts":1}	{"max_attempts":0}	https://api.temi.esquel.org.ec/api/v1/auth/login?page=1&per_page=15	10.128.0.14	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	\N	2022-03-20 23:01:49	2022-03-20 23:01:49
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: menus; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.menus (id, created_at, updated_at, deleted_at, parent_id, role_id, color, description, icon, label, router_link, type) FROM stdin;
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	1	#9c9c9c	\N	pi pi-users	Administración Usuarios	/user-administration	\N
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	2	#9c9c9c	\N	pi pi-book	Tests	/test	\N
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.migrations (id, migration, batch) FROM stdin;
1	2021_08_05_0_create_core__catalogues_table	1
2	2021_08_05_0_create_core__locations_table	1
3	2021_08_05_1_create_core__address_table	1
4	2021_08_05_1_create_core__emails_table	1
5	2021_08_05_1_create_core__phones_table	1
6	2021_08_05_2_create_core__files_table	1
7	2021_08_05_2_create_core__images_table	1
8	2021_08_05_2_create_core__socialmedia_table	1
9	2021_08_05_2_create_core__states_table	1
10	2021_08_05_3_create_core__socialmediables_table	1
11	2021_08_05_3_create_core__stateables_table	1
12	2021_08_06_0_create_authentication__audits_table	1
13	2021_08_06_0_create_authentication__password_resets_table	1
14	2021_08_06_0_create_authentication__permission_tables	1
15	2021_08_06_0_create_authentication__personal_access_tokens_table	1
16	2021_08_06_0_create_authentication__users_table	1
17	2021_08_06_1_create_authentication__failed_jobs_table	1
18	2021_08_06_1_create_authentication__transactional_codes_table	1
19	2021_08_06_2_create_authentication__menus_table	1
20	2021_08_06_2_create_authentication__systems_table	1
21	2022_01_01_0_create_psychology__catalogues_table	1
22	2022_01_01_0_create_psychology__priorities_table	1
23	2022_01_01_0_create_psychology__states_table	1
24	2022_01_01_1_create_psychology__institutions_table	1
25	2022_01_01_1_create_psychology__questions_table	1
26	2022_01_01_1_create_psychology__tests_table	1
27	2022_01_01_2_create_psychology__agents_table	1
28	2022_01_01_2_create_psychology__answers_table	1
29	2022_01_01_3_create_psychology__assignments_table	1
30	2022_01_01_3_create_psychology__results_table	1
\.


--
-- Data for Name: model_has_permissions; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.model_has_permissions (permission_id, model_type, model_id) FROM stdin;
\.


--
-- Data for Name: model_has_roles; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.model_has_roles (role_id, model_type, model_id) FROM stdin;
1	App\\Models\\Authentication\\User	1
2	App\\Models\\Authentication\\User	2
3	App\\Models\\Authentication\\User	3
2	App\\Models\\Authentication\\User	8
2	App\\Models\\Authentication\\User	12
3	App\\Models\\Authentication\\User	13
1	App\\Models\\Authentication\\User	14
2	App\\Models\\Authentication\\User	16
2	App\\Models\\Authentication\\User	20
\.


--
-- Data for Name: password_resets; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.password_resets (id, created_at, updated_at, deleted_at, token, used, username) FROM stdin;
1	2022-03-07 17:55:50	2022-03-07 17:55:50	\N	Lpybz2WyoASk6dvWTp5wwzvj55DVOHAK3jltDx0FEJKIyGqoJrj3TBmmI399WcBQoiGz6w	f	1717175366
2	2022-03-07 17:58:22	2022-03-07 17:58:22	\N	1r1rmo1kR6uDsCaCcXToj7EGvMw07DxdpfWWlijqgUbbiUm4yd4OCGnP9UuZa0ocCIrX92	f	1717175366
3	2022-03-07 17:58:26	2022-03-07 17:58:26	\N	as8XXbsZf1CSAAxTOj8AqNMq5aEjFl98OdCPiZ4bqVPaOMFsQzMySVkagvpSxJzV5SHvpE	f	1717175366
4	2022-03-07 17:58:32	2022-03-07 17:58:32	\N	wJMBiOxlg1QoBsmvcdp2lLv0d7eaK6iJlStelqmQ8O0OhjcwMhc2WBhQt78IZAT6sk1P4x	f	1712728060
5	2022-03-07 17:58:56	2022-03-07 17:58:56	\N	7233dCjiTVz7mkwA7MVScIYlCLMIQzr4p1KrAghSo3PlIzlSM2vd8h4dwVJmuDkyhaT4us	f	1717175366
6	2022-03-07 17:59:06	2022-03-07 18:01:13	\N	42U4VohgBODxG2CGj6MTmjtqzbSMjBLkfp4BiQDRISFZowFOAWSTkxhPh4FO2HIzAsm689	t	1717175366
7	2022-03-10 18:38:33	2022-03-10 18:38:33	\N	bvYAZfsDxTGh91TiRWqXBCuWDFaAhfm77BwupjHyBYGfJmcHvJTtQmnTjLfff2rUz6mu6U	f	1717175366
8	2022-03-11 17:49:17	2022-03-11 17:49:17	\N	GoP2PBVtrfTOaCu9x4jNCXDgC0Udxb7nU32BGwDmMl4BSaIob1r5HRIvXZUQbaDfrUwuqE	f	1717175366
9	2022-03-12 17:35:48	2022-03-12 17:35:48	\N	JXKzj9QNkwrI1idzWBkQYO2GE5c1e9FdTkuEH8zBvgXANM3qAgjnDAsKz7ZwESYDoFKZTY	f	1724581218
10	2022-03-20 23:01:35	2022-03-20 23:01:35	\N	oeHEyfADRaTTb3MZ9mhsyfjjPctP88dj8z1CZLhW7PJZsZRGTNgTH6eUki8mXx1aHqIgGr	f	1724581218
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.permissions (id, name, guard_name, created_at, updated_at) FROM stdin;
1	view-users	web	2022-03-03 23:26:22	2022-03-03 23:26:22
2	store-users	web	2022-03-03 23:26:22	2022-03-03 23:26:22
3	update-users	web	2022-03-03 23:26:22	2022-03-03 23:26:22
4	delete-users	web	2022-03-03 23:26:22	2022-03-03 23:26:22
5	view-tests	web	2022-03-03 23:26:22	2022-03-03 23:26:22
6	store-tests	web	2022-03-03 23:26:22	2022-03-03 23:26:22
7	update-tests	web	2022-03-03 23:26:22	2022-03-03 23:26:22
8	delete-tests	web	2022-03-03 23:26:22	2022-03-03 23:26:22
9	store-assignments	web	2022-03-03 23:26:22	2022-03-03 23:26:22
10	update-assignments	web	2022-03-03 23:26:22	2022-03-03 23:26:22
\.


--
-- Data for Name: personal_access_tokens; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.personal_access_tokens (id, created_at, updated_at, tokenable_type, tokenable_id, abilities, last_used_at, name, token) FROM stdin;
28	2022-03-07 17:56:41	2022-03-07 17:56:41	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	bfc3b2fd6a4dafef786af49de50fa93dd43e52565a727c83dd8274eb2552473f
31	2022-03-07 18:01:31	2022-03-07 18:01:31	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	901bd3ad5521547b076c202345636663df9cac6a96e88efa8232137789e57a5f
32	2022-03-07 18:01:45	2022-03-07 18:01:45	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	a1fd6ea0fed0d4ccb18a086690d01b903278ce721e70d71227054cd1ef527996
2	2022-03-03 23:30:15	2022-03-03 23:30:15	App\\Models\\Authentication\\User	2	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	80ab772cf0b05c72bb2a1e76a0e7cf7b6cfba1a57a9add2114ba43cae6fbac88
3	2022-03-03 23:30:21	2022-03-03 23:30:21	App\\Models\\Authentication\\User	2	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	2692a18d22669d637421a89c4377cc328233db78ddc759af8146658ad90b3b68
16	2022-03-04 20:19:50	2022-03-04 20:20:05	App\\Models\\Authentication\\User	2	["*"]	2022-03-04 20:20:05	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	7f88b436be483bafa149fb8720cdade63fe354c5cde891cebc1270e491f9d10b
5	2022-03-03 23:34:17	2022-03-03 23:34:17	App\\Models\\Authentication\\User	2	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	a92f0777f5a5032751d0f008c6fa0543e5ec59b3c9c871b57903f3575099f3fa
11	2022-03-03 23:46:28	2022-03-03 23:51:14	App\\Models\\Authentication\\User	2	["*"]	2022-03-03 23:51:14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	f5ceb763cd6f7cac86dcdd1bcfd599c8f8bf94b734f456a50b8da42df112161c
7	2022-03-03 23:40:35	2022-03-03 23:40:35	App\\Models\\Authentication\\User	3	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	ed45b8f8d76b94e92f87b5baa67d0c1a65f12fc5bd0eaf34088064e37833728b
33	2022-03-07 18:02:12	2022-03-07 18:02:12	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	b3d24c68375b106b4e43c76540ebdb4c28ff110b9b0ca488e26831706e367d91
9	2022-03-03 23:42:39	2022-03-03 23:42:39	App\\Models\\Authentication\\User	3	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	1ba4ad5df66e5595de1612787da7457bae4cab39a0995350189c1ac430b5ded5
22	2022-03-07 12:38:33	2022-03-07 12:38:49	App\\Models\\Authentication\\User	1	["*"]	2022-03-07 12:38:49	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	2d98c5dc62a3130b28dc3de654d2140dcef247020f24eb49894a4da1f84d574c
14	2022-03-04 16:30:21	2022-03-04 16:30:40	App\\Models\\Authentication\\User	1	["*"]	2022-03-04 16:30:40	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.62	607eb4e2546781ef3c4d146f88d70cf92eae7b7cb470cd9229da3b2559df3e40
17	2022-03-04 20:27:44	2022-03-04 20:28:06	App\\Models\\Authentication\\User	1	["*"]	2022-03-04 20:28:06	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	5ada6b216eeec3f59a9cf21f388f0aa2ca6d8a824c64e49e9eea87a1c4d972a3
23	2022-03-07 17:52:26	2022-03-07 17:52:26	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	a1e8fe48a9c103bf860f54f0b70a5da8389878b1bcd55a77112b910716acba08
21	2022-03-04 20:31:51	2022-03-04 20:34:58	App\\Models\\Authentication\\User	2	["*"]	2022-03-04 20:34:58	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	53795b3e52fc591ae8b44b015ca17b9927f4b95db31b9e945d8226c572a6914b
24	2022-03-07 17:52:34	2022-03-07 17:52:34	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	c421675d63ac2cae7d17e131d3175df97e078c009286fe1ad18d585faf0be62b
25	2022-03-07 17:52:56	2022-03-07 17:52:56	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	33b1339d8aecf6edee30496e4bc9c0a38d2b5b692989382c5f721b30c8394408
26	2022-03-07 17:55:18	2022-03-07 17:55:51	App\\Models\\Authentication\\User	6	["*"]	2022-03-07 17:55:51	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	e20061852f3c4fad981a3c142e171e2e81b9e993f3468c6a6f821db38f094b33
27	2022-03-07 17:56:25	2022-03-07 17:56:25	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	fbb4e0cc08c2d5d79288d0d91cb0159fc846c2ee5324f6ab90d16d5c6eb0dcb2
29	2022-03-07 17:57:36	2022-03-07 18:01:13	App\\Models\\Authentication\\User	6	["*"]	2022-03-07 18:01:13	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	a5fabf24f44232abf502e189e89d3852fe6b8193f7d5fe07a38f716f889ca743
30	2022-03-07 18:01:26	2022-03-07 18:01:26	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 OPR/84.0.4316.21	7ba3db1f382ff95ec6b6237b606b5aa772eef698457b12b796b9f4151d6e3c0f
35	2022-03-07 23:11:17	2022-03-07 23:18:25	App\\Models\\Authentication\\User	2	["*"]	2022-03-07 23:18:25	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	abeb1481021ee939becc6181d5da110c7f30667e8fa1c3552060d31feaed9694
56	2022-03-11 17:59:11	2022-03-11 17:59:13	App\\Models\\Authentication\\User	12	["*"]	2022-03-11 17:59:13	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	2bba940617ae20f9a86cbb80255badb8f376f37f3589c7339ed5d7ca7d8228fe
36	2022-03-08 11:42:19	2022-03-08 11:44:04	App\\Models\\Authentication\\User	1	["*"]	2022-03-08 11:44:04	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.30	6af31f7e0eb9d30cb658ea176ea56cf018a50312bc0af4bcdf7463a74d793a49
37	2022-03-10 09:23:44	2022-03-10 09:23:44	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	2a4b5c9a6cc67361b124bdb2243ef0f159981240684d9bf45991e708bcaa922f
38	2022-03-10 18:35:41	2022-03-10 18:38:33	App\\Models\\Authentication\\User	6	["*"]	2022-03-10 18:38:33	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	3ea1c674804691964494acc7ea9c3aa0a1b2b18d7bb5b0c18acf3d955fc89d78
39	2022-03-10 18:38:43	2022-03-10 18:38:43	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	3604cdcc0055fae139e2987cd88325913c99cf0d75348f2de0100970454dfcb5
47	2022-03-11 17:30:21	2022-03-11 17:31:08	App\\Models\\Authentication\\User	16	["*"]	2022-03-11 17:31:08	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.109 Safari/537.36 OPR/84.0.4316.31	ce1e1d22f3225d2237547eb275ef24a6ec009ddfcf6e9ad3de0f6a56bd5a9aab
62	2022-03-14 22:31:24	2022-03-14 22:56:41	App\\Models\\Authentication\\User	1	["*"]	2022-03-14 22:56:41	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	71de08235d3ead1eb191871b40d43b8521876e8529e43b16abc359bf941f38f5
53	2022-03-11 17:53:34	2022-03-11 17:53:36	App\\Models\\Authentication\\User	13	["*"]	2022-03-11 17:53:36	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	5f72b0a7a23212a3a388a371322cd29b358ea9849ba1a03e59d9525d2c9bcdc5
48	2022-03-11 17:40:41	2022-03-11 17:40:41	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	f5f665610b4b76645f6d979f7b9dc57919e4cf8f2b096ca4a43f69d2ec40e17f
43	2022-03-11 15:24:25	2022-03-11 15:24:44	App\\Models\\Authentication\\User	16	["*"]	2022-03-11 15:24:44	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	7aef80d7d7503f82c8ac1d6fcafb2279a8115d3c6bce9b0cd0c57a2542129b00
49	2022-03-11 17:40:41	2022-03-11 17:40:41	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	fcee9fa45f80f324945aafe7f9043781691081ad620ab5163d8ee31cb69493e3
50	2022-03-11 17:40:46	2022-03-11 17:49:17	App\\Models\\Authentication\\User	6	["*"]	2022-03-11 17:49:17	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	1236c85e7f71376e84982fd08e2d700471b2930d9dfde214ce5eb1246d3d0119
54	2022-03-11 17:54:54	2022-03-11 17:54:54	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	933f4bb6458915637186281919fee8fd6dcd3912b518a07fbf489e049240f72c
59	2022-03-12 17:37:28	2022-03-20 22:54:09	App\\Models\\Authentication\\User	20	["*"]	2022-03-20 22:54:09	Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	4bd7dac71eb4a19071fd6f8d54a917f05cb656ae763a81771175b2cc9389552f
65	2022-03-20 22:33:42	2022-03-20 22:40:14	App\\Models\\Authentication\\User	13	["*"]	2022-03-20 22:40:14	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.46	6efd6543ae7a5e2a99fcc3f5774f00bae9f6866369bc36518ce7e106e0f19920
55	2022-03-11 17:56:58	2022-03-11 17:56:58	App\\Models\\Authentication\\User	6	["*"]	\N	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/98.0.4758.102 Safari/537.36 Edg/98.0.1108.56	0d3ec625dba4c5c3458bf3c3287b4c1e04764d1ac57cf052d51a4cfee2d5883d
51	2022-03-11 17:52:46	2022-03-11 17:57:46	App\\Models\\Authentication\\User	1	["*"]	2022-03-11 17:57:46	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	aaace740b4dc90d22a9812227748811c88849e2c69f939fe8bc2250407426c34
58	2022-03-11 18:30:04	2022-03-11 18:30:06	App\\Models\\Authentication\\User	13	["*"]	2022-03-11 18:30:06	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36 Edg/99.0.1150.36	3c3efb317143e904f2629ad7cd98decd4e23592ba83c597c0532d353bda3f043
40	2022-03-11 15:06:42	2022-03-11 20:21:50	App\\Models\\Authentication\\User	1	["*"]	2022-03-11 20:21:50	Mozilla/5.0 (Linux; Android 12; M2101K6G) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Mobile Safari/537.36 EdgA/99.0.1150.39	250867f3c20ea1489ba279d57b99ba579e96609145e44f91dd6a96736354a5e1
66	2022-03-20 23:01:36	2022-03-20 23:05:30	App\\Models\\Authentication\\User	13	["*"]	2022-03-20 23:05:30	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.46	577d533f95302fa494007ee75ace56e3ea58bbaef52d9b8197c2fc7f5b0bcdd4
63	2022-03-15 19:09:07	2022-03-18 13:24:12	App\\Models\\Authentication\\User	13	["*"]	2022-03-18 13:24:12	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	32bdbc91f21cab1a1b1fd7569908e11607584e00a8baf8eb7ae4aaadd40b3861
61	2022-03-14 22:30:31	2022-03-15 18:59:02	App\\Models\\Authentication\\User	12	["*"]	2022-03-15 18:59:02	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.51 Safari/537.36	26d270b095a0eeffc2d056d045176f8b10547ab895b9ef1d569aff80bf32db47
64	2022-03-18 16:56:50	2022-03-18 16:59:41	App\\Models\\Authentication\\User	13	["*"]	2022-03-18 16:59:41	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36	ada57c7cc3dfb9983f9077af0346883d47b62d4718a01cc8221f6beb32845a0e
67	2022-03-20 23:27:20	2022-03-20 23:27:22	App\\Models\\Authentication\\User	13	["*"]	2022-03-20 23:27:22	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36 Edg/99.0.1150.46	44dbfe8c65d824e00d602b9372ce3ed5b0189f025e1ce20fa8ab6a818615bd49
\.


--
-- Data for Name: role_has_permissions; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.role_has_permissions (permission_id, role_id) FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
5	2
6	2
7	2
8	2
9	2
10	2
5	3
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.roles (id, name, guard_name, created_at, updated_at) FROM stdin;
1	admin	web	2022-03-03 23:26:22	2022-03-03 23:26:22
2	support	web	2022-03-03 23:26:22	2022-03-03 23:26:22
3	viewer	web	2022-03-03 23:26:22	2022-03-03 23:26:22
\.


--
-- Data for Name: systems; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.systems (id, created_at, updated_at, deleted_at, acronym, code, description, date, icon, name, redirect, state, version) FROM stdin;
1	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	Esquel	IGNUG	\N	2022-02-15	\N	Esquel - ChatBot	http://temi.esquel.org.ec/#/login	t	2.2.3
\.


--
-- Data for Name: transactional_codes; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.transactional_codes (id, created_at, updated_at, deleted_at, token, used, username) FROM stdin;
1	2022-03-03 23:29:49	2022-03-03 23:29:49	\N	7529	f	ldfjdfjasld.oqijrqrewf@jldfsa.caom
2	2022-03-03 23:55:53	2022-03-03 23:55:53	\N	9524	f	cesar.tamayo0204@gmail.com
3	2022-03-03 23:57:50	2022-03-03 23:57:50	\N	7638	f	cesar.tamayo0204@gmail.com
4	2022-03-04 00:01:04	2022-03-04 00:01:04	\N	4618	f	cesar.tamayo0204@gmail.com
5	2022-03-04 00:01:24	2022-03-04 00:01:58	\N	9869	t	cesar.tamayo0204@gmail.com
6	2022-03-04 09:08:09	2022-03-04 09:09:25	\N	9878	t	samia.cgarcia@gmail.com
7	2022-03-07 17:30:42	2022-03-07 17:31:21	\N	6091	t	danieljerezcamino@gmail.com
8	2022-03-07 17:54:59	2022-03-07 17:55:19	\N	3166	t	samia.cgarcia@gmail.com
9	2022-03-10 09:55:00	2022-03-10 09:55:19	\N	3767	t	sistemas@esquel.org.ec
10	2022-03-10 09:59:33	2022-03-10 09:59:57	\N	8928	t	sistemas@esquel.org.ec
11	2022-03-15 15:06:35	2022-03-15 15:07:17	\N	4343	t	kywishai@gmail.com
12	2022-03-15 15:06:59	2022-03-15 15:07:38	\N	2177	t	yguerra@einstein.k12.ec
13	2022-03-15 18:54:28	2022-03-15 18:54:28	\N	1811	f	cesar.tamayo0204@gmail.com
14	2022-03-15 18:56:59	2022-03-15 18:56:59	\N	9864	f	ceasr.tamayo0204@gmail.com
15	2022-03-15 18:57:44	2022-03-15 18:57:44	\N	4599	f	cesar.tamayo0204@gmail.com
16	2022-03-15 18:59:02	2022-03-15 18:59:02	\N	6650	f	cesar.tamayo0204@gmail.com
17	2022-03-15 19:12:35	2022-03-15 19:13:31	\N	4683	t	samia.cgarcia@gmail.com
18	2022-03-18 11:45:05	2022-03-18 11:45:05	\N	5174	f	samia.cgarcia@gmail.com
19	2022-03-18 11:45:12	2022-03-18 11:45:12	\N	6702	f	samia.cgarcia@gmail.com
20	2022-03-18 11:45:18	2022-03-18 11:45:18	\N	1968	f	samia.cgarcia@gmail.com
21	2022-03-18 11:45:21	2022-03-18 11:45:21	\N	2219	f	samia.cgarcia@gmail.com
22	2022-03-18 11:45:23	2022-03-18 11:45:23	\N	3487	f	samia.cgarcia@gmail.com
23	2022-03-18 12:00:49	2022-03-18 12:00:49	\N	8889	f	fanny@hotmail.com
24	2022-03-18 12:00:52	2022-03-18 12:00:52	\N	5588	f	fanny@hotmail.com
25	2022-03-18 12:00:59	2022-03-18 12:00:59	\N	5965	f	fanny_luz@hotmail.com
26	2022-03-18 12:01:08	2022-03-18 12:01:08	\N	7008	f	fanny_luz@hotmail.com
27	2022-03-18 12:21:01	2022-03-18 12:21:01	\N	1840	f	cesar.tamayo02@outlook.com
28	2022-03-18 12:22:00	2022-03-18 12:22:00	\N	5176	f	cesar.tamayo0204@gmail.com
29	2022-03-18 12:23:20	2022-03-18 12:23:20	\N	5360	f	cesar.tamayo0204@gmail.com
30	2022-03-18 12:29:14	2022-03-18 12:29:14	\N	8977	f	cesar.tamayo0204@gmail.com
31	2022-03-18 12:45:39	2022-03-18 12:45:39	\N	6200	f	cesar.tamay0204@gmail.com
32	2022-03-18 12:45:50	2022-03-18 12:45:50	\N	3907	f	cesar.tamay0204@gmail.com
33	2022-03-18 13:14:28	2022-03-18 13:14:28	\N	9408	f	cesar.tamayo0204@gmail.com
34	2022-03-18 13:14:41	2022-03-18 13:15:04	\N	9584	t	cesar.tamayo0204@gmail.com
35	2022-03-18 17:20:45	2022-03-18 17:20:45	\N	2095	f	samia.cgarcia@gmail.com
36	2022-03-18 17:21:09	2022-03-18 17:21:09	\N	9426	f	nathyraquel12@yahoo.es
37	2022-03-18 17:21:33	2022-03-18 17:21:33	\N	2298	f	kattsmile_07@hotmail.com
38	2022-03-18 17:22:04	2022-03-18 17:22:04	\N	9495	f	karly.pozo29@hotmail.com
40	2022-03-18 17:22:20	2022-03-18 17:22:20	\N	8215	f	kestrada@esquel.org.ec
41	2022-03-18 17:22:42	2022-03-18 17:22:42	\N	8991	f	ceciliallasag@yahoo.es
42	2022-03-18 17:22:51	2022-03-18 17:22:51	\N	3601	f	ceciliallasag@yahoo.es
43	2022-03-18 17:23:05	2022-03-18 17:23:05	\N	2589	f	ceciliallasag@yahoo.es
44	2022-03-18 17:23:09	2022-03-18 17:23:09	\N	3948	f	ceciliallasag@yahoo.es
45	2022-03-18 17:23:12	2022-03-18 17:23:12	\N	9688	f	ceciliallasag@yahoo.es
39	2022-03-18 17:22:07	2022-03-18 17:23:50	\N	2072	t	diaspessoa@live.com
46	2022-03-19 13:35:40	2022-03-19 13:36:38	\N	9734	t	paty_ali@live.com
47	2022-03-19 13:42:44	2022-03-19 13:46:43	\N	5955	t	carmitapadilla8.78@gmail.com
48	2022-03-19 15:02:36	2022-03-19 15:03:49	\N	9533	t	mirypozoch@gmail.com
49	2022-03-19 15:21:59	2022-03-19 15:21:59	\N	3900	f	ximena1967@gmail.com
50	2022-03-19 15:23:11	2022-03-19 15:23:11	\N	4728	f	victorcusangua@gmail.com
51	2022-03-19 15:23:14	2022-03-19 15:23:14	\N	9610	f	nagellyk1909@gmail
53	2022-03-19 15:24:29	2022-03-19 15:24:29	\N	7060	f	pinchaodamaris@gmail.com
52	2022-03-19 15:24:18	2022-03-19 15:25:10	\N	3944	t	pinchaodamaris@gmail.com
54	2022-03-19 15:26:05	2022-03-19 15:26:50	\N	5221	t	davichocusangua@gmail.com
55	2022-03-19 15:27:02	2022-03-19 15:27:34	\N	5606	t	ximenaobando1967@gmail.com
56	2022-03-19 15:28:58	2022-03-19 15:28:58	\N	3479	f	davidburbanoromero@gmail.com
57	2022-03-19 15:29:20	2022-03-19 15:29:46	\N	2158	t	micaelaalenis6@gmail.com
58	2022-03-19 15:30:39	2022-03-19 15:30:39	\N	8892	f	davidburbanoromero@gmail.com
59	2022-03-19 15:35:25	2022-03-19 15:35:49	\N	6284	t	davidburbanoromero@gmail.com
60	2022-03-19 15:36:19	2022-03-19 15:36:19	\N	2615	f	g@d
61	2022-03-19 15:53:52	2022-03-19 15:53:52	\N	7834	f	jennrosero@gamil.com
62	2022-03-19 19:03:28	2022-03-19 19:03:56	\N	6700	t	laraelian52@gmail.com
63	2022-03-19 20:28:04	2022-03-19 20:29:00	\N	7465	t	heydyquinonez82@gmail.com
64	2022-03-19 20:30:56	2022-03-19 20:30:56	\N	7820	f	candobradley12@gmail.com
65	2022-03-19 20:31:36	2022-03-19 20:31:36	\N	7799	f	candobradley12@gmail.com
66	2022-03-19 20:31:52	2022-03-19 20:31:52	\N	2700	f	candobradley12@gmail.com
67	2022-03-19 20:31:58	2022-03-19 20:33:08	\N	9445	t	candobradley12@gmail.com
68	2022-03-20 16:25:10	2022-03-20 16:25:47	\N	2964	t	karennicole2006@outlook.es
69	2022-03-20 16:43:41	2022-03-20 16:43:41	\N	3154	f	gaby.velategui2006@gmail.com
70	2022-03-20 16:45:55	2022-03-20 16:45:55	\N	2673	f	gaby.velategui2006@gmail.com
71	2022-03-20 17:02:11	2022-03-20 17:02:11	\N	7016	f	abejita1578@gmail.com
73	2022-03-20 17:09:37	2022-03-20 17:09:37	\N	3142	f	abejita1578@gmail.com
72	2022-03-20 17:09:30	2022-03-20 17:11:56	\N	5350	t	Joyce2006erazo@gmail.com
74	2022-03-20 17:21:27	2022-03-20 17:22:00	\N	5548	t	raque.c307@gmail.com
75	2022-03-20 17:25:33	2022-03-20 17:26:09	\N	9312	t	dannabenarive@gmail.com
76	2022-03-20 20:40:04	2022-03-20 20:40:04	\N	3781	f	mareojeda2004@gmail.com
77	2022-03-20 21:08:17	2022-03-20 21:08:54	\N	2594	t	chemaquirola@gmail.com
78	2022-03-20 21:16:09	2022-03-20 21:18:12	\N	4484	t	j.i.pazminox@gmail.com
79	2022-03-20 21:19:07	2022-03-20 21:19:32	\N	2533	t	vevalentinaochoa@gmail.com
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: authentication; Owner: postgres
--

COPY authentication.users (id, created_at, updated_at, deleted_at, remember_token, blood_type_id, civil_status_id, ethnic_origin_id, gender_id, identification_type_id, sex_id, avatar, birthdate, email, email_verified_at, lastname, max_attempts, name, password, password_changed, phone, suspended, username) FROM stdin;
2	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	13	31	28	10	6	8	\N	2018-12-07	grayson.gaylord@example.net	2022-03-03 23:26:21	ROBERTS	3	CAROLE ROHAN II	$2y$10$NHrBK/j26SlE/Qmhp5h8weVGRQZnoFxgm1vYzQFoFwXE3.5UGaJ/2	f	+1 (754) 316-9529	f	1023379837
4	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	20	34	28	11	5	7	\N	1991-12-12	aryanna60@example.org	2022-03-03 23:26:22	GERLACH	3	PROF. ENRICO BOYLE DDS	$2y$10$GpUl3Ofm2TS8exyob9UOPuCQGRQIANByAroGIjxynUg07WQ0gzYZC	f	+1-279-956-6915	f	1004518599
12	2022-03-08 11:42:56	2022-03-11 17:11:20	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	ctamayo@yavirac.edu.ec	\N	USUARIO UNO	3	USUARIO UNO	$2y$10$pKsXDdNQGof9.6PBeiYEj.R28piZsnl/u7LdsrcBqOGwHlutmoEsa	f	\N	f	1234567891
3	2022-03-03 23:26:22	2022-03-03 23:27:00	\N	\N	20	32	27	11	6	8	\N	2009-09-10	lulu.adams@example.net	2022-03-03 23:26:21	MORISSETTE	3	PROF. SISTER WHITE JR.	$2y$10$5lxrtEGm4YNJmAMfFXCFDOfuEHhvo1ngfkfWUEqyb2Lzq3h9UfstG	f	989.643.1639	f	1041828856
5	2022-03-03 23:49:05	2022-03-03 23:49:05	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	TAMAYO LOPEZ	3	CESAR MAURICIO	$2y$10$xz6jCdbEHjkwXDeejFywK.GqfKE1/Eas.W69CJ.V0Q3S21Sl1Q5.i	f	0982417259	f	172490443
18	2022-03-11 17:02:13	2022-03-11 17:28:17	2022-03-11 17:28:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	NEJAJSJAJA	3	IQKDHWOSNSHQH	$2y$10$tC0/FGld3FCJJqU5fWTfq.XR15tEnGf/lHHbnsvDYCHPWNxuUQkLu	f	2749199119	f	18382818
19	2022-03-11 17:11:36	2022-03-11 17:28:25	2022-03-11 17:28:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	SMAISHAJ	3	KWJDJAJAJA	$2y$10$6127vP3ee9rDGlaSBUzG6e22xWc8VF3dHPAkjvniFy6kX0Kqa11di	f	184718181	f	18371818
8	2022-03-04 20:30:01	2022-03-06 21:14:32	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	pablorobayo@gmail.com	\N	ROBAYO CASTELLANOS	0	PABLO JAVIER	$2y$10$oN60QK/geU0imai0psUNXOvkDaQS66MrOfrAsMLb6LbYPypWO497G	f	0999705620	f	1712728060
10	2022-03-07 18:02:55	2022-03-11 17:28:25	2022-03-11 17:28:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	SJAKDHAJAJ	3	JSKAIAJA	$2y$10$9g.HU15avXYXc51Fr9xJROVq6ejkDIibzRfROvGxCos5zq6uHwHEK	f	02939191	f	18737118
17	2022-03-11 16:59:12	2022-03-11 17:28:25	2022-03-11 17:28:25	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	NSJAKAJA	3	HSJAJSJAJA	$2y$10$COKuwo5S5QbQdp53hTGtz.PQslSDt9QeY6zhJw06SJNsVsgvJCR7K	f	0882737281	f	8173727181
11	2022-03-07 23:15:53	2022-03-07 23:15:53	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	e.titomh@hotmail.com	\N	ARéVALO ARICO	3	EMILIO ARéVALO	$2y$10$Y52pZ/0XY6PCOFnnidqBieJhRXPyEgSVcr8UWKF8S6iMZJnW02QVK	f	0983884579	f	1724229651
13	2022-03-08 11:43:23	2022-03-08 11:43:23	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	cesar.tamayo02@outlook.com	\N	USUARIOS DOS	3	USUARIO DOS	$2y$10$Msimc5q8V5ZyaKFQBtZJz.QhOJV6BG7.0/FXQKdZKBPhvk8kN/t0m	f	\N	f	1234567892
14	2022-03-08 11:44:04	2022-03-08 11:44:04	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	cmtamayol@pucesd.edu.ec	\N	USUARIO TRES	3	USUARIO TRES	$2y$10$bQXk09PewedRvNZuBzM/1udbdNSm7/L13jg0Vy9QUtw9E5ySkBbGS	f	\N	f	1234567893
7	2022-03-04 09:12:38	2022-03-11 17:28:35	2022-03-11 17:28:35	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	SAMIA	3	JAJAJAJA	$2y$10$AsaVFV/a0Ui5K4RkcauVmOAw9fPKaGVjEszW/K2xcG.TbxozOBcau	f		f	1724581228
35	2022-03-18 11:50:51	2022-03-18 11:50:51	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	danibriones98@gmail.com	\N	BRIONES BUENO	3	CARLOS	$2y$10$eHbkNHrizA48Bi.C6RbVWOvgO11qDjGbpIQW2dJX2PD5p/qwYtAPi	f	0928148939	f	0984817903
15	2022-03-10 10:14:35	2022-03-10 10:14:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sistemas@esquel.org.ec	\N	DSFASDFDAS	3	ADFASFAFA	$2y$10$nyfE/SQ5LjPtQ9eYhxK0i.YaPg4YvPkrOspWjaeDYM6gI845anB5O	f	2342432424	f	2342341234
21	2022-03-11 17:33:17	2022-03-11 17:33:17	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	SMAKDKQKA	3	SAMIA	$2y$10$HIPkWmtGyVOS8Z7rQXnKfeSG7xSpMWjSn0W8yBY0jbOtJ.qK6fafu	f	2847191919	f	1947181819
28	2022-03-17 21:06:56	2022-03-17 21:06:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	SMISIDJAK	3	JFKAJSIA	$2y$10$q2bCtywVrA0PJYb2XVzRKOJM7bqZQdaeC29LbDbLYQRW5WKA.6FBe	f	29382829	f	1973819191
16	2022-03-11 15:17:23	2022-03-11 15:24:25	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	pjrobayo@hotmail.com	\N	TESTER	3	TEST	$2y$10$iVUb45jRS0I84E6z1l90wu9LRxKVQyzAY6LL3nhQt4nLoi5FVsk/O	f	\N	f	2222222222
29	2022-03-17 21:39:06	2022-03-17 21:39:06	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	LOPEZ	3	DASD	$2y$10$SBESOE/7X/nw6IrzOOrZ/uAyju5LWwefQ272OZS6Wkb8NFi29cree	f	1231232131	f	1234567899
6	2022-03-04 00:03:06	2022-03-17 21:39:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	bdjejfklqjsy@ndkf.com	\N	KFIRORK	3	FDAHRIC	$2y$10$I4hTnjMki5tzrgK6hQT0Q.DPKOxfCY4WWgJ7Jo/lWtLbjkkPElh1u	f	9864784930	f	1717175366
22	2022-03-12 17:30:54	2022-03-12 17:30:54	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	DHFAJATS	3	HRAHRANQRJ	$2y$10$He1XECliwF59DtjNcjW2ieG/bnN/3nMXxE4s7tsckz0U9eEtwGTPW	f	841814141	f	1836711881
23	2022-03-12 17:33:15	2022-03-12 17:33:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	HDJAKASJNA	3	LDNWOAKANA	$2y$10$.Y1NOPQJAuNm3Q4TwUB1COaecpEkyKuKL18jTXTlje0hOa3XkpF2O	f	0183729191	f	1874819191
36	2022-03-18 11:57:35	2022-03-18 11:57:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	lily.llive1@gmail.com	\N	LLIVE BASTIDAS	3	LILIAN ESTEFANIA	$2y$10$xtFWOZn2dEscY2.HgkNLbuwpjD4HIPYiG4TUzOe/Ctwv2BO5UCW/.	f	0992579221	f	1725985368
9	2022-03-04 22:21:26	2022-03-14 22:29:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	TAMAYO LOPEZ	3	CESAR MAURICIO	$2y$10$3oIWsRihJ0ua4E2h5P6mheZhKZcvzl435qBV.K8y4trl6WOOB9pNW	f	0987654321	f	1724909443
24	2022-03-14 22:36:45	2022-03-14 22:36:45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	ASD	3	AD	$2y$10$DIAOTcyhJrT7DT.OGRsTYeb48XTVthdsR4Md1.WD122VblTdEFHce	f	1231231231	f	1123123123
25	2022-03-15 16:50:59	2022-03-15 16:50:59	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	GUERRA GUACHAMIN	3	YULIANA MONSERRATHE	$2y$10$oHK.xHmSiQ8vFBSys.9XKOCNYa./XxRY1tS2h.6jxfSUhnP8poL1q	f		f	1750249920
26	2022-03-15 19:15:47	2022-03-15 19:15:47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	SJAKALSKAK	3	NSKAIDBS	$2y$10$pWGJ3mroRy5mzv71Z45Mb.hSi3170rpwRq6Lz2rkLCdFmHko9qQay	f		f	9183819191
27	2022-03-15 19:27:16	2022-03-15 19:27:16	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	GARCIA	3	SAMIA	$2y$10$8ut9JxDlOz8qw.1GzypYEedeNfgnJPffZk8obGcKuLTz6IumnlOlS	f	0284819191	f	1724619371
30	2022-03-17 21:49:38	2022-03-17 21:49:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	ASDASD	3	ASDASD	$2y$10$RzJ5fyjwdPX4YQtYmsh8yOmJDf3Y6NB1oi0BfhI/XS9YdTVFmdLBC	f	1231231231	f	123121313
31	2022-03-17 21:52:35	2022-03-17 21:52:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	ASDASD	3	ASDASDASD	$2y$10$G/F6xoaOvRnsRUMaLUYNB.opAkBXJuhz2sxxOQLzhDRmfDV9cZbIi	f	1231231231	f	1231221312
32	2022-03-17 21:55:38	2022-03-17 21:55:38	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	ASDASDASD	3	ADSASD	$2y$10$684usiBpH7fi51d0NxhC/u.xf2.L0nOR6YkmA/8BTtEVFLcDyDZA.	f	123123121	f	1231231312
1	2022-03-03 23:26:21	2022-03-18 11:49:59	\N	\N	17	34	24	12	5	7	\N	2003-07-14	floresk560@gmail.com	2022-03-03 23:26:21	FLORES ARTEAGA	3	KEVIN STEVEN	$2y$10$aaSrV87YJa4Dv4KyGSJf2ujxLdxguXGr.Vcu855gWFP4rw2XwWY3e	f	0987945056	f	1234567890
33	2022-03-18 11:50:02	2022-03-18 11:50:02	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	kjazmerizalde@gmail.com	\N	VALDIVIEZO	3	KARLA	$2y$10$gRDftrQcrpK0QdPBoqqVset/9xJQE/voOGyGueJ3i3xHJGqxsdgF2	f	0984528838	f	0780448838
34	2022-03-18 11:50:35	2022-03-18 11:50:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	gabrielamora_urquizo@hotmail.com	\N	MORA URQUIZO	3	MARIA GABRIELA	$2y$10$.DvD9TkH0tZdex4dtjsQ5.74ymcW/wEGkzp7c8xU3KPVVAmKqZ3ay	f	0962564943	f	0931063663
37	2022-03-18 11:59:01	2022-03-18 11:59:01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	oviedogabriela96@gmail.com	\N	OVIEDO OVIEDO	3	GABRIELA DANIELA	$2y$10$AulGDKWX/BBMYxhmfNca2uiNpxj0LNms5jirb8qDRbC.GnEQWTOg6	f	0979864926	f	1105542094
38	2022-03-18 12:01:21	2022-03-18 12:01:21	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	samia.cgarcia@gmail.com	\N	GARCIA	3	SAMIA	$2y$10$mNkaHZQNGru2sh2TFroh/..HYpRAezDT6Ag144R4a36orUH2l8ZDO	f	1837181919	f	1727271818
39	2022-03-18 13:16:09	2022-03-18 13:16:09	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	ASD ASD	3	ASD ASD	$2y$10$SIoC.Y75i25LXNOnkxgREei5n.6qDM2Pwjs/grRKu/hlNMA/BoOBW	f		f	1231231231
40	2022-03-18 13:24:12	2022-03-18 13:24:12	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	cesar.tamayo0204@gmail.com	\N	ASDASD	3	ASDASD	$2y$10$u2ij.ENVzqjUg47kfJOrwOvJkyyjSs/ZT3iY.XeeXdkOxvpEI2MU6	f	123123123	f	3123123123
41	2022-03-18 14:30:56	2022-03-18 14:30:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sammycris4@gmail.com	\N	QUISHPE SANTILLáN	3	SAMANTHA CRISTINA	$2y$10$dS.KC5pn5ZovnRofjGwFzOFatTgXX/phtiipj81FGdNzuJSSBQKFW	f	0961003657	f	1727725002
42	2022-03-18 14:31:22	2022-03-18 14:31:22	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	villagomezlucero0@gmail.com	\N	VILLAGOMEZ ALMEIDA	3	LUCERO MARIBEL	$2y$10$Y1oe2Eqpfa3rzZc6AnYdhO1BDR/J3nfmX5yGO.QYDKC5OvXajTT4S	f	0984311824	f	1753032828
44	2022-03-18 16:42:32	2022-03-18 16:42:32	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	diaspessoa@live.com	\N	DíAS PESSôA	3	JULIENE	$2y$10$OyWttAxJIY59a23.aB3ZdeTWKH0yyZHbK81FgdsNc0g0JYsQiQyc2	f	979097681	f	614354
45	2022-03-18 16:42:39	2022-03-18 16:42:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	erickaestefania902@gmail.com	\N	SOLIS GUERRERO	3	ERICKA ESTEFANIA	$2y$10$tOcpE/n8vhWf1WjPqLJtWOMBxAVpxGr7iHR6r3d7ImZ5TS1eibBra	f	0978878816	f	1804672184
46	2022-03-18 16:44:18	2022-03-18 16:44:18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	karly.pozo29@hotmail.com	\N	POZO PADILLA	3	JEAN KARLA	$2y$10$WMwl7eXpCATfeKYKgWlMeudmES7yGEz9dDmVnolIH.fFUBC6L65JG	f	0986887854	f	0401819362
48	2022-03-18 16:44:28	2022-03-18 16:44:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	kestrada@esquel.org.ec	\N	ESTRADA	3	KEMIL	$2y$10$09lI51H8KdCXpJLTIjEa/.DSWrbhP8Bwz3.P7By1AQ8xPist/QTFK	f	0986359706	f	1709999690
50	2022-03-18 16:46:35	2022-03-18 16:46:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	diakarocat180187@ymail.com	\N	CARRASCO ASOGUE	3	DIANA CAROLINA	$2y$10$7BUXRatIM0YW2cs.CR19CewsweRMe3i0AIn2Ynf02ZN3ooxf6g3Ca	f	0984871904	f	1804133286
51	2022-03-18 16:48:33	2022-03-18 16:48:33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	anamarialarread@hotmail.com	\N	LARREA DáVALOS	3	ANAMARIA	$2y$10$CjPPlVH0A7d7Lly7rzxM6uzGf6qyvxG7ieE0BUwACcTyj7.vY7iIi	f	0992781547	f	0603332032
53	2022-03-18 17:28:56	2022-03-18 17:28:56	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	DIAS PESSôA	3	JULIENE	$2y$10$8J.47cf3Spuv/lDWZVSHke6sYpGrfyuezAVT4gt0oqcn2pNuwketi	f		f	9282828119
72	2022-03-19 20:39:10	2022-03-19 20:39:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	CANDO ALEMáN	3	BRADLEY YARIEL	$2y$10$VszKTg/ECo5.5Gb9L1lecuTiVR1VhU2MH1YVm/CBzjeQ5Oqgzbj3q	f		f	0450142575
54	2022-03-18 18:13:35	2022-03-18 18:13:35	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	djerez@esquel.org.ec	\N	JéREZ	3	DANIEL	$2y$10$6WycsX6XII67CO079UNBAeFS0qH3ZweJeA/6MdNyfymYsgU6bAEXG	f	0938401984	f	1723801923
47	2022-03-18 16:44:25	2022-03-18 18:13:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	marcelocarrazcoc@hotmail	\N	CARRAZCO CASTELO	3	IVáN MARCELO	$2y$10$eqzoCzudDZtHKIIecMYfj.yXzGpqEGzr1k8X/9prpn6TBV72SA/jO	f	0991210760	f	0601916380
52	2022-03-18 17:17:44	2022-03-18 18:13:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	ceciliallasag@yahoo.es	\N	LLASAG FERNáNDEZ	3	BLANCA CECILIA	$2y$10$m5M41czA..x5qcybuAH/S.qfUu39xeAwg1fyKPIdzXS6bRnIkblpG	f	0988128085	f	0502041866
43	2022-03-18 16:40:05	2022-03-18 18:13:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	nathyraquel12@yahoo.es	\N	PRADO ALMINATTI	3	NATHALIE RAQUEL	$2y$10$aPkXQmfOQlc1wchPFDiA1.CLYwWMkZv/0so6tGXTt/w51ON4TV9C6	f	099256720	f	1722505466
55	2022-03-18 18:14:18	2022-03-18 18:14:18	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	diaspessoa@live.com	\N	DíAS PESSôA	3	JULIENE	$2y$10$QhWplW4ICVmoEK90ReXkoe78AWJxdCU81JlJ/CAFNCT0BAz2w2VX2	f	0979097681	f	7377777
49	2022-03-18 16:45:04	2022-03-18 18:17:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	kattsmile_07@hotmail.com	\N	REAL	3	KATY	$2y$10$ySJXqLxnwW/IFfeCZOIPSeopWwh49aXTrQa1bHBE/7/JMFdeuLHsO	f	0987556575	f	0201580263
56	2022-03-19 13:42:58	2022-03-19 13:42:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	POZO CIFUENTES	3	ALISON PATRICIA	$2y$10$5ixpoek2zuX/vubU3MCU4eSRSb28/jN6Qw/2eeVGt.C6odQN83Nym	f		f	0402043368
57	2022-03-19 13:53:19	2022-03-19 13:53:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	POZO PADILLA	3	HEIDY YAILY	$2y$10$9TpSc.Uzfd83JpeWUL.QKenoNdtgMkQ2LR8/JOqfqOO6eGFvjYOuK	f		f	0402124143
58	2022-03-19 15:07:57	2022-03-19 15:07:57	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	AYALA POZO	3	EYDER JHAIR	$2y$10$ZCP1B/pEOF4HGYJZMvULOu.65P/.AuhvjddY8JrtlqSXk8FYmxcyq	f		f	0450235320
59	2022-03-19 15:19:41	2022-03-19 15:19:41	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	danireascos123456@gmail.com	\N	REASCOS GARCíA	3	DANIELA MISHELL	$2y$10$mCcTHwgGcqe9VrfX8ravW.Ir4jKRL8TbPnCyj89TJZ81MKJRTFPTS	f	0979087716	f	0450075551
60	2022-03-19 15:29:01	2022-03-19 15:29:01	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	PINCHAO LóPEZ	3	DAMARIS GISELLA	$2y$10$hcp.uOV9d3sYjgtGGsQI5eGMEBePFi7a7SGweRelyB5I0HTcBJi3m	f		f	0450042122
61	2022-03-19 15:29:47	2022-03-19 15:29:47	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	PAZMIñO OBANDO	3	AYELEN NOELIA	$2y$10$.ByYiA6RBIHCeqPn7Gl9Jueje7xGUBAuhiR5h//jzaY3LAAVIyivG	f		f	0402193379
62	2022-03-19 15:30:10	2022-03-19 15:30:10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	CUSANGUA CISNEROS	3	JUAN DAVID	$2y$10$VPDb7LI7XdiGujJxVHlkA.4RzOsYkvGNCTMaBB.fWHgVEyxHcVWQi	f		f	0450168489
63	2022-03-19 15:30:19	2022-03-19 15:30:19	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	victorcusangua@gmail.com	\N	CUSANGUA FUELTALA	3	VICTOR MATEO	$2y$10$P3xhH/C1xLK92kZxgGcNdeUonjxyKVQE5ObpEgCSqlgK4rmBRVZXm	f	0995367233	f	0450168760
64	2022-03-19 15:32:55	2022-03-19 15:32:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	BEDOYA AYALA	3	ALENIS MICAELA	$2y$10$6dDO3UpA2kjF2reG9N3aNe88QF20eq7o4bOJaDnYw5DOxD2ifNLni	f		f	0402053078
65	2022-03-19 15:35:09	2022-03-19 15:35:09	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	sebastiancuaspa326@gmail.com	\N	CUASPA REVELO	3	JOHN SEBASTIáN	$2y$10$wM0PlqcOsIDoVj5c4shbzu7lCFJqdXCGtj6m/8pj053PUw6V79CXu	f	0983309862	f	0450138656
66	2022-03-19 15:38:55	2022-03-19 15:38:55	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	BURBANO ROMERO	3	DAVID NICOLáS	$2y$10$0Dw2EvdvLF/p0RCKKLT4juzay21n5j4lOsi5ePyvK4TMLvL.lqAG6	f		f	0402102875
67	2022-03-19 15:40:45	2022-03-19 15:40:45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	genesisrojas1889@gmail.com	\N	ROJAS CUCáS	3	GéNESIS XIOMARA	$2y$10$PPU9amKoZYq5cE4rVyo8iu8qedNndw3xYE9fH2FB05vfdklUtgHvK	f	0994569271	f	0401822424
68	2022-03-19 15:40:45	2022-03-19 15:40:45	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	yahirrosales770@gmail	\N	ROSALES MORALES	3	JOSEPH YAHIR	$2y$10$62GPyzBTl7bF8AdzZOU1m.aZg.iLQ6Y62DMP8FHZD7dPUCZxIiih6	f	0962543664	f	0402040935
69	2022-03-19 15:43:39	2022-03-19 15:43:39	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mateorevelo1000@gmail.com	\N	REVELO OBANDO	3	MATEO ISRAEL	$2y$10$1yqRKxtOn9InmtpZFoa/c.9KMKyxnfxPSrg7yAn4HxRA66SUkI3ya	f	0982275911	f	0400858783
70	2022-03-19 19:06:15	2022-03-19 19:06:15	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	LARA	3	ELIAN	$2y$10$GRsDf6BhEcJTbVmt637NQecvIkO.i33f4TZHWM.FOtSMlwYIMVcMe	f		f	0402006886
71	2022-03-19 20:32:49	2022-03-19 20:32:49	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	QUIñONEZ MALQUIN	3	HEIDY TATIANA	$2y$10$SG6WzpOnn3RIDmxga2B7HOkOoYzzzdhTnkMxx/.0aOL41gIG4glcy	f		f	0450217054
73	2022-03-20 16:29:34	2022-03-20 16:29:34	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	TENEMPAGUAY VASQUEZ	3	KAREN NICOLE	$2y$10$LpcW6Q68K0p1FVWCHkXFaOy4wQtzISiFiNlxTGgMuzmYAbmHlTaV6	f		f	0606244887
74	2022-03-20 17:16:58	2022-03-20 17:16:58	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	ERAZO MARTíNEZ	3	JOYCE CRISTELL	$2y$10$n9P5Q2lAT/p943CWFt.XS.wLKxhRBux9yqFViSYCx3LDtw4PR1boq	f		f	0605935543
75	2022-03-20 17:25:29	2022-03-20 17:25:29	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	CABA PAREDES	3	DANIELA	$2y$10$nIKAFmTJSaLvJyw4UiYVo.2wJVFPNh30kPQa9nrbUeRyY/3hSTtru	f		f	0650113400
76	2022-03-20 17:28:33	2022-03-20 17:28:33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	CELI CARRASCO	3	EMILIA SOFíA	$2y$10$fVUrCQrIetj1JxQgXQFpOuIG8s4V2TM.KJigjjfUPPsASgWhkwHTW	f		f	0602987433
77	2022-03-20 17:40:08	2022-03-20 17:40:08	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	mylyemiitadavila@gmail.com	\N	DáVILA HIDALGO	3	MARíA EMILIA	$2y$10$uez33M8XmUB1t81oDfLhdeU8jb/g2LRoyGYybZMerqFw6uFflfRaG	f	0999435446	f	0605847888
78	2022-03-20 20:31:50	2022-03-20 20:31:50	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	marito2416@gmail.com	\N	CORDOVA IZURIETA	3	MARIO CóRDOVA	$2y$10$RTIPPTaqnS47aO74eQ1c5uXlIq1dB1CijnV./k6JNdHJoaYDWA8ea	f	0985994349	f	1750331199
79	2022-03-20 21:02:28	2022-03-20 21:02:28	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	nico456654@gmail.com	\N	MONCAYO LóPEZ	3	NICOLáS FRANCISCO	$2y$10$1Z49oNA9BBjU4SfQ5/nu/emXgplSJn4CmGxe6qrTiDRXdxSocp9ky	f	0983424017	f	0604764225
80	2022-03-20 21:13:33	2022-03-20 21:13:33	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	QUIROLA MERINO	3	JOSé MARIA	$2y$10$nS6QpqZU1dTw44LxCkZdU.3AuxTyGY4QcrDH2Zf/eiXjsPaypPyH2	f		f	1751402528
81	2022-03-20 21:21:07	2022-03-20 21:21:07	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	PAZMIñO SALAS	3	JOSé IGNACIO	$2y$10$xQTecC0dyKdlchmsRCh3duW5eDsTWE.cFCxAqX1wvYMPRQnS6m89.	f		f	1727248039
82	2022-03-20 21:22:27	2022-03-20 21:22:27	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N		\N	OCHOA RíOS	3	VERONICA VALENTINA	$2y$10$ctW1E1j8O11U8waTZfIhe.TobL6aXCFjtwvkFwpWjvNuiJMm9pgCG	f		f	0605999242
20	2022-03-11 17:29:42	2022-03-20 23:01:49	\N	\N	\N	\N	\N	\N	5	\N	\N	\N	samia.cgarcia@gmail.com	\N	GARCÍA	0	SAMIA	$2y$10$YB2rrZ6LtGvvpUdmX2.PW.p5fIbpWrCvCek13scrnqkW82QiEtOoC	f	1092849389	f	1724581218
\.


--
-- Data for Name: address; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.address (id, created_at, updated_at, deleted_at, location_id, sector_id, latitude, longitude, main_street, secondary_street, number, post_code, reference) FROM stdin;
\.


--
-- Data for Name: catalogues; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.catalogues (id, created_at, updated_at, deleted_at, parent_id, code, color, description, icon, name, type) FROM stdin;
1	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	COUNTRY	#cab802	\N	pi pi-check-circle	PAIS	LOCATION
2	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	PROVINCE	#cf34e9	\N	pi pi-map-marker	PROVINCIA	LOCATION
3	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	CANTON	#a24d5c	\N	pi pi-cloud-download	CANTON	LOCATION
4	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	PARISH	#17d5f8	\N	pi pi-angle-right	PARROQUIA	LOCATION
5	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	CC	#15a5f0	\N	pi pi-unlock	CEDULA	IDENTIFICATION_PROFESSIONAL_TYPE
6	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	PASSPORT	#17bc37	\N	pi pi-info	PASAPORTE	IDENTIFICATION_PROFESSIONAL_TYPE
7	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	MALE	#8d8f47	\N	pi pi-step-forward-alt	HOMBRE	SEX_TYPE
8	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	FEMALE	#c1d748	\N	pi pi-mobile	MUJER	SEX_TYPE
9	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	MALE	#57d29b	\N	pi pi-book	MASCULINO	GENDER_TYPE
10	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	FEMALE	#4f43b6	\N	pi pi-search-minus	FEMENINO	GENDER_TYPE
11	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	OTHER	#a81286	\N	pi pi-sort-alpha-up	OTRO	GENDER_TYPE
12	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	NOT_SAY	#3ccca4	\N	pi pi-user-plus	PREFIERO NO DECIRLO	GENDER_TYPE
13	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	A-	#dc95ef	\N	pi pi-align-right	A-	BLOOD_TYPE
14	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	A+	#c78660	\N	pi pi-key	A+	BLOOD_TYPE
15	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	B-	#0429b7	\N	pi pi-unlock	B-	BLOOD_TYPE
16	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	B+	#5a1710	\N	pi pi-spinner	B+	BLOOD_TYPE
17	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	AB-	#7d13d7	\N	pi pi-user	AB-	BLOOD_TYPE
18	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	AB+	#dd839d	\N	pi pi-thumbs-down	AB+	BLOOD_TYPE
19	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	O-	#0fd33e	\N	pi pi-arrow-circle-down	O-	BLOOD_TYPE
20	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	O+	#02ca3a	\N	pi pi-briefcase	O+	BLOOD_TYPE
21	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	1	#3460e3	\N	pi pi-id-card	INDIGENA	ETHNIC_ORIGIN_TYPE
22	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	2	#4e36c5	\N	pi pi-users	AFROECUATORIANO	ETHNIC_ORIGIN_TYPE
23	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	3	#e657f4	\N	pi pi-sort-alt	NEGRO	ETHNIC_ORIGIN_TYPE
24	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	4	#3f6a34	\N	pi pi-angle-double-right	MULATO	ETHNIC_ORIGIN_TYPE
25	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	5	#5398c6	\N	pi pi-sort-numeric-down	MONTUVIO	ETHNIC_ORIGIN_TYPE
26	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	6	#29b1dd	\N	pi pi-comments	MESTIZO	ETHNIC_ORIGIN_TYPE
27	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	7	#4ecf79	\N	pi pi-calendar-times	BLANCO	ETHNIC_ORIGIN_TYPE
28	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	8	#c2e0f8	\N	pi pi-play	OTRO	ETHNIC_ORIGIN_TYPE
29	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	9	#dd6d37	\N	pi pi-angle-down	NO REGISTRA	ETHNIC_ORIGIN_TYPE
30	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	MARRIED	#eaa93d	\N	pi pi-camera	CASADO/A	CIVIL_STATUS
31	2022-03-03 23:26:20	2022-03-03 23:26:20	\N	\N	SINGLE	#167894	\N	pi pi-sort	SOLTERO/A	CIVIL_STATUS
32	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	DIVORCED	#f952ee	\N	pi pi-backward	DIVORCIADO/A	CIVIL_STATUS
33	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	WIDOWER	#a7a505	\N	pi pi-chart-bar	VIUDO/A	CIVIL_STATUS
34	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	UNION	#ed87d4	\N	pi pi-sort-up	UNION DE HECHO	CIVIL_STATUS
35	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	05553594	#94897e	\N	pi pi-upload	NORTE	SECTOR
36	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	73616962	#968b38	\N	pi pi-replay	CENTRO	SECTOR
37	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	82194741	#6c3489	\N	pi pi-arrow-circle-left	SUR	SECTOR
38	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	13237790	#c950d1	\N	pi pi-sign-out	CLARO	PHONE_OPERATOR
39	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	26166148	#2a989b	\N	pi pi-clone	CNT	PHONE_OPERATOR
40	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	97789659	#3dc480	\N	pi pi-map-marker	MOVISTAR	PHONE_OPERATOR
41	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	73926962	#1dcf82	\N	pi pi-exclamation-triangle 	CELULAR	PHONE_TYPE
42	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	96438459	#5cd02d	\N	pi pi-cloud-upload	CONVENCIONAL	PHONE_TYPE
43	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	\N	08007070	#fd1c30	\N	pi pi-shield	FAX	PHONE_TYPE
\.


--
-- Data for Name: emails; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.emails (id, created_at, updated_at, deleted_at, emailable_type, emailable_id, domain, email, icon) FROM stdin;
1	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	1	ruecker.biz	kailyn59@example.org	ab
2	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	1	gaylord.org	joy.bernier@example.org	ab
3	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	2	casper.com	burley.dach@example.com	neque
4	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	2	skiles.com	morar.sunny@example.org	possimus
5	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	3	witting.com	huels.keanu@example.org	molestiae
6	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	3	moen.com	verona92@example.org	et
7	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	4	ebert.com	wilkinson.amira@example.org	et
8	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	4	schaden.info	ymayer@example.org	id
\.


--
-- Data for Name: files; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.files (id, created_at, updated_at, deleted_at, fileable_type, fileable_id, description, directory, extension, name) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.images (id, created_at, updated_at, deleted_at, imageable_type, imageable_id, description, directory, extension, name) FROM stdin;
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.locations (id, created_at, updated_at, deleted_at, parent_id, type_id, alpha2_code, alpha3_code, calling_code, capital, code, flag, name, region, subregion, timezones, top_level_domain) FROM stdin;
1	\N	\N	2022-03-03 00:00:00	\N	1	AF	AFG	+93	\N	1	\N	AFGANISTÁN	\N	\N	\N	\N
2	\N	\N	2022-03-03 00:00:00	\N	1	AL	ALB	+355	\N	2	\N	ALBANIA	\N	\N	\N	\N
3	\N	\N	2022-03-03 00:00:00	\N	1	DE	DEU	+49	\N	3	\N	ALEMANIA	\N	\N	\N	\N
4	\N	\N	2022-03-03 00:00:00	\N	1	AD	AND	+376	\N	4	\N	ANDORRA	\N	\N	\N	\N
5	\N	\N	2022-03-03 00:00:00	\N	1	AO	AGO	+244	\N	5	\N	ANGOLA	\N	\N	\N	\N
6	\N	\N	2022-03-03 00:00:00	\N	1	AI	AIA	+1264	\N	6	\N	ANGUILA	\N	\N	\N	\N
7	\N	\N	2022-03-03 00:00:00	\N	1	AG	ATG	+1268	\N	7	\N	ANTIGUA Y BARBUDA	\N	\N	\N	\N
8	\N	\N	2022-03-03 00:00:00	\N	1	SA	SAU	+966	\N	8	\N	ARABIA SAUDITA	\N	\N	\N	\N
9	\N	\N	2022-03-03 00:00:00	\N	1	DZ	DZA	+213	\N	9	\N	ARGELIA	\N	\N	\N	\N
10	\N	\N	2022-03-03 00:00:00	\N	1	AR	ARG	+54	\N	10	\N	ARGENTINA	\N	\N	\N	\N
11	\N	\N	2022-03-03 00:00:00	\N	1	AM	ARM	+374	\N	11	\N	ARMENIA	\N	\N	\N	\N
12	\N	\N	2022-03-03 00:00:00	\N	1	AW	ABW	+297	\N	12	\N	ARUBA	\N	\N	\N	\N
13	\N	\N	2022-03-03 00:00:00	\N	1	AU	AUS	+61	\N	13	\N	AUSTRALIA	\N	\N	\N	\N
14	\N	\N	2022-03-03 00:00:00	\N	1	AT	AUT	+43	\N	14	\N	AUSTRIA	\N	\N	\N	\N
15	\N	\N	2022-03-03 00:00:00	\N	1	AZ	AZE	+994	\N	15	\N	AZERBAIYÁN	\N	\N	\N	\N
16	\N	\N	2022-03-03 00:00:00	\N	1	BS	BHS	+1242	\N	16	\N	BAHAMAS	\N	\N	\N	\N
17	\N	\N	2022-03-03 00:00:00	\N	1	BH	BHR	+973	\N	17	\N	BAHREIN	\N	\N	\N	\N
18	\N	\N	2022-03-03 00:00:00	\N	1	BD	BGD	+880	\N	18	\N	BANGLADESH	\N	\N	\N	\N
19	\N	\N	2022-03-03 00:00:00	\N	1	BB	BRB	+1246	\N	19	\N	BARBADOS	\N	\N	\N	\N
20	\N	\N	2022-03-03 00:00:00	\N	1	BB	BRB	+1246	\N	20	\N	BÉLGICA	\N	\N	\N	\N
21	\N	\N	2022-03-03 00:00:00	\N	1	BZ	BLZ	+501	\N	21	\N	BELICE	\N	\N	\N	\N
22	\N	\N	2022-03-03 00:00:00	\N	1	BJ	BEN	+229	\N	22	\N	BENIN	\N	\N	\N	\N
23	\N	\N	2022-03-03 00:00:00	\N	1	BJ	BEN	+229	\N	23	\N	BERMUDAS	\N	\N	\N	\N
24	\N	\N	2022-03-03 00:00:00	\N	1	BY	BLR	+375	\N	24	\N	BIELORRUSIA	\N	\N	\N	\N
25	\N	\N	2022-03-03 00:00:00	\N	1	BO	BOL	+591	\N	25	\N	BOLIVIA	\N	\N	\N	\N
26	\N	\N	2022-03-03 00:00:00	\N	1	BO	BOL	+591	\N	26	\N	BONAIRE, SAN EUSTAQUIO Y SABA	\N	\N	\N	\N
27	\N	\N	2022-03-03 00:00:00	\N	1	BA	BIH	+387	\N	27	\N	BOSNIA Y HERZEGOVINA	\N	\N	\N	\N
28	\N	\N	2022-03-03 00:00:00	\N	1	BW	BWA	+267	\N	28	\N	BOTSWANA	\N	\N	\N	\N
29	\N	\N	2022-03-03 00:00:00	\N	1	BR	BRA	+55	\N	29	\N	BRASIL	\N	\N	\N	\N
30	\N	\N	2022-03-03 00:00:00	\N	1	BN	BRN	+673	\N	30	\N	BRUNEI DARUSSALAM	\N	\N	\N	\N
31	\N	\N	2022-03-03 00:00:00	\N	1	BG	BGR	+359	\N	31	\N	BULGARIA	\N	\N	\N	\N
32	\N	\N	2022-03-03 00:00:00	\N	1	BF	BFA	+226	\N	32	\N	BURKINA FASO	\N	\N	\N	\N
33	\N	\N	2022-03-03 00:00:00	\N	1	BI	BDI	+257	\N	33	\N	BURUNDI	\N	\N	\N	\N
34	\N	\N	2022-03-03 00:00:00	\N	1	BI	BDI	+257	\N	34	\N	BUTÁN	\N	\N	\N	\N
35	\N	\N	2022-03-03 00:00:00	\N	1	CV	CPV	+238	\N	35	\N	CABO VERDE	\N	\N	\N	\N
36	\N	\N	2022-03-03 00:00:00	\N	1	KH	KHM	+855	\N	36	\N	CAMBOYA	\N	\N	\N	\N
37	\N	\N	2022-03-03 00:00:00	\N	1	CM	CMR	+237	\N	37	\N	CAMERÚN	\N	\N	\N	\N
38	\N	\N	2022-03-03 00:00:00	\N	1	CA	CAN	+1	\N	38	\N	CANADA	\N	\N	\N	\N
39	\N	\N	2022-03-03 00:00:00	\N	1	TD	TCD	+235	\N	39	\N	CHAD	\N	\N	\N	\N
40	\N	\N	2022-03-03 00:00:00	\N	1	CL	CHL	+56	\N	40	\N	CHILE	\N	\N	\N	\N
41	\N	\N	2022-03-03 00:00:00	\N	1	CN	CHN	+86	\N	41	\N	CHINA	\N	\N	\N	\N
42	\N	\N	2022-03-03 00:00:00	\N	1	CY	CYP	+357	\N	42	\N	CHIPRE	\N	\N	\N	\N
43	\N	\N	2022-03-03 00:00:00	\N	1	CO	COL	+57	\N	43	\N	COLOMBIA	\N	\N	\N	\N
44	\N	\N	2022-03-03 00:00:00	\N	1	KM	COM	+269	\N	44	\N	COMORAS	\N	\N	\N	\N
45	\N	\N	2022-03-03 00:00:00	\N	1	KM	COM	+269	\N	45	\N	CONGO	\N	\N	\N	\N
46	\N	\N	2022-03-03 00:00:00	\N	1	KP	PRK	+850	\N	46	\N	COREA DEL NORTE	\N	\N	\N	\N
47	\N	\N	2022-03-03 00:00:00	\N	1	KR	KOR	+82	\N	47	\N	COREA DEL SUR	\N	\N	\N	\N
48	\N	\N	2022-03-03 00:00:00	\N	1	CI	CIV	+225	\N	48	\N	COSTA DE MARﬁL	\N	\N	\N	\N
49	\N	\N	2022-03-03 00:00:00	\N	1	CR	CRI	+506	\N	49	\N	COSTA RICA	\N	\N	\N	\N
50	\N	\N	2022-03-03 00:00:00	\N	1	HR	HRV	+385	\N	50	\N	CROACIA	\N	\N	\N	\N
51	\N	\N	2022-03-03 00:00:00	\N	1	CU	CUB	+53	\N	51	\N	CUBA	\N	\N	\N	\N
52	\N	\N	2022-03-03 00:00:00	\N	1	CU	CUB	+53	\N	52	\N	CURAÇAO	\N	\N	\N	\N
53	\N	\N	2022-03-03 00:00:00	\N	1	DK	DNK	+45	\N	53	\N	DINAMARCA	\N	\N	\N	\N
54	\N	\N	2022-03-03 00:00:00	\N	1	DK	DNK	+45	\N	54	\N	DJIBOUTI	\N	\N	\N	\N
55	\N	\N	2022-03-03 00:00:00	\N	1	DM	DMA	+1767	\N	55	\N	DOMINICA	\N	\N	\N	\N
56	\N	\N	2022-03-03 00:00:00	\N	1	EC	ECU	+593	\N	56	\N	ECUADOR	\N	\N	\N	\N
57	\N	\N	2022-03-03 00:00:00	\N	1	EG	EGY	+20	\N	57	\N	EGIPTO	\N	\N	\N	\N
58	\N	\N	2022-03-03 00:00:00	\N	1	SV	SLV	+503	\N	58	\N	EL SALVADOR	\N	\N	\N	\N
59	\N	\N	2022-03-03 00:00:00	\N	1	SV	SLV	+503	\N	59	\N	EL VATICANO	\N	\N	\N	\N
60	\N	\N	2022-03-03 00:00:00	\N	1	AE	ARE	+971	\N	60	\N	EMIRATOS ÁRABES UNIDOS	\N	\N	\N	\N
61	\N	\N	2022-03-03 00:00:00	\N	1	ER	ERI	+291	\N	61	\N	ERITREA	\N	\N	\N	\N
62	\N	\N	2022-03-03 00:00:00	\N	1	SK	SVK	+421	\N	62	\N	ESLOVAQUIA	\N	\N	\N	\N
63	\N	\N	2022-03-03 00:00:00	\N	1	SI	SVN	+386	\N	63	\N	ESLOVENIA	\N	\N	\N	\N
64	\N	\N	2022-03-03 00:00:00	\N	1	ES	ESP	+34	\N	64	\N	ESPAÑA	\N	\N	\N	\N
65	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	65	\N	ESTADO DE PALESTINA	\N	\N	\N	\N
66	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	66	\N	ESTADOS UNIDOS DE AMÉRICA	\N	\N	\N	\N
67	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	67	\N	ESTONIA	\N	\N	\N	\N
68	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	68	\N	ETIOPÍA	\N	\N	\N	\N
69	\N	\N	2022-03-03 00:00:00	\N	1	FJ	FJI	+679	\N	69	\N	FIYI	\N	\N	\N	\N
70	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	70	\N	FILIPINAS	\N	\N	\N	\N
71	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	71	\N	FINLANDIA	\N	\N	\N	\N
72	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	72	\N	FRANCIA	\N	\N	\N	\N
73	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	73	\N	GABÓN	\N	\N	\N	\N
74	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	74	\N	GAMBIA	\N	\N	\N	\N
75	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	75	\N	GEORGIA	\N	\N	\N	\N
76	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	76	\N	GHANA	\N	\N	\N	\N
77	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	77	\N	GIBRALTAR	\N	\N	\N	\N
78	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	78	\N	GRANADA	\N	\N	\N	\N
79	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	79	\N	GRECIA	\N	\N	\N	\N
80	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	80	\N	GROENLANDIA	\N	\N	\N	\N
81	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	81	\N	GUADALUPE	\N	\N	\N	\N
82	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	82	\N	GUAM	\N	\N	\N	\N
83	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	83	\N	GUATEMALA	\N	\N	\N	\N
84	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	84	\N	GUAYANA FRANCESA	\N	\N	\N	\N
85	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	85	\N	GUERNSEY	\N	\N	\N	\N
86	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	86	\N	GUINEA	\N	\N	\N	\N
87	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	87	\N	GUINEA ECUATORIAL	\N	\N	\N	\N
88	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	88	\N	GUINEA-BISSAU	\N	\N	\N	\N
89	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	89	\N	GUYANA	\N	\N	\N	\N
90	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	90	\N	HAITÍ	\N	\N	\N	\N
91	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	91	\N	HONDURAS	\N	\N	\N	\N
92	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	92	\N	HONG KONG	\N	\N	\N	\N
93	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	93	\N	HUNGRÍA	\N	\N	\N	\N
94	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	94	\N	INDIA	\N	\N	\N	\N
95	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	95	\N	INDONESIA	\N	\N	\N	\N
96	\N	\N	2022-03-03 00:00:00	\N	1	IQ	IRQ	+964	\N	96	\N	IRAK	\N	\N	\N	\N
97	\N	\N	2022-03-03 00:00:00	\N	1	IM	SN	SN	\N	97	\N	IRÁN	\N	\N	\N	\N
98	\N	\N	2022-03-03 00:00:00	\N	1	NF	SN	SN	\N	98	\N	IRLANDA	\N	\N	\N	\N
99	\N	\N	2022-03-03 00:00:00	\N	1	IS	IMN	+44	\N	99	\N	ISLA DE MAN	\N	\N	\N	\N
100	\N	\N	2022-03-03 00:00:00	\N	1	IS	NFK	+672	\N	100	\N	ISLA NORFOLK	\N	\N	\N	\N
101	\N	\N	2022-03-03 00:00:00	\N	1	KY	ISL	+354	\N	101	\N	ISLANDIA	\N	\N	\N	\N
102	\N	\N	2022-03-03 00:00:00	\N	1	CK	ISL	+354	\N	102	\N	ISLAS ÅLAND	\N	\N	\N	\N
103	\N	\N	2022-03-03 00:00:00	\N	1	FO	CYM	+1345	\N	103	\N	ISLAS CAIMÁN	\N	\N	\N	\N
104	\N	\N	2022-03-03 00:00:00	\N	1	FK	COK	+682	\N	104	\N	ISLAS COOK	\N	\N	\N	\N
105	\N	\N	2022-03-03 00:00:00	\N	1	MP	FRO	+298	\N	105	\N	ISLAS FEROE	\N	\N	\N	\N
106	\N	\N	2022-03-03 00:00:00	\N	1	MH	FLK	+500	\N	106	\N	ISLAS MALVINAS (FALKLAND)	\N	\N	\N	\N
107	\N	\N	2022-03-03 00:00:00	\N	1	SB	MNP	+1670	\N	107	\N	ISLAS MARIANAS DEL NORTE	\N	\N	\N	\N
108	\N	\N	2022-03-03 00:00:00	\N	1	TC	MHL	+692	\N	108	\N	ISLAS MARSHALL	\N	\N	\N	\N
109	\N	\N	2022-03-03 00:00:00	\N	1	UM	SLB	+677	\N	109	\N	ISLAS SALOMÓN	\N	\N	\N	\N
110	\N	\N	2022-03-03 00:00:00	\N	1	VG	TCA	+1649	\N	110	\N	ISLAS TURCAS Y CAICOS	\N	\N	\N	\N
111	\N	\N	2022-03-03 00:00:00	\N	1	VI	UMI	+246	\N	111	\N	ISLAS VÍRGENES AMERICANAS	\N	\N	\N	\N
112	\N	\N	2022-03-03 00:00:00	\N	1	PS	VGB	+1284	\N	112	\N	ISLAS VÍRGENES BRITÁNICAS	\N	\N	\N	\N
113	\N	\N	2022-03-03 00:00:00	\N	1	IT	VIR	+1340	\N	113	\N	ISLAS WALLIS Y FUTUNA	\N	\N	\N	\N
114	\N	\N	2022-03-03 00:00:00	\N	1	JM	PSE	+970	\N	114	\N	ISRAEL	\N	\N	\N	\N
115	\N	\N	2022-03-03 00:00:00	\N	1	JP	ITA	+39	\N	115	\N	ITALIA	\N	\N	\N	\N
116	\N	\N	2022-03-03 00:00:00	\N	1	JE	JAM	+1876	\N	116	\N	JAMAICA	\N	\N	\N	\N
117	\N	\N	2022-03-03 00:00:00	\N	1	JO	JPN	+81	\N	117	\N	JAPÓN	\N	\N	\N	\N
118	\N	\N	2022-03-03 00:00:00	\N	1	KZ	JEY	+44	\N	118	\N	JERSEY	\N	\N	\N	\N
119	\N	\N	2022-03-03 00:00:00	\N	1	KE	JOR	+962	\N	119	\N	JORDANIA	\N	\N	\N	\N
120	\N	\N	2022-03-03 00:00:00	\N	1	KG	KAZ	+7	\N	120	\N	KAZAJSTÁN	\N	\N	\N	\N
121	\N	\N	2022-03-03 00:00:00	\N	1	KI	KEN	+254	\N	121	\N	KENYA	\N	\N	\N	\N
122	\N	\N	2022-03-03 00:00:00	\N	1	KW	KGZ	+996	\N	122	\N	KIRGUISTÁN	\N	\N	\N	\N
123	\N	\N	2022-03-03 00:00:00	\N	1	KW	KIR	+686	\N	123	\N	KIRIBATI	\N	\N	\N	\N
124	\N	\N	2022-03-03 00:00:00	\N	1	KW	KWT	+965	\N	124	\N	KUWAIT	\N	\N	\N	\N
125	\N	\N	2022-03-03 00:00:00	\N	1	LV	KWT	+965	\N	125	\N	LA EX REPÚBLICA YUGOSLAVA DE MACEDONIA	\N	\N	\N	\N
126	\N	\N	2022-03-03 00:00:00	\N	1	LV	KWT	+965	\N	126	\N	LESOTO	\N	\N	\N	\N
127	\N	\N	2022-03-03 00:00:00	\N	1	LR	LVA	+371	\N	127	\N	LETONIA	\N	\N	\N	\N
128	\N	\N	2022-03-03 00:00:00	\N	1	LY	LVA	+371	\N	128	\N	LÍBANO	\N	\N	\N	\N
129	\N	\N	2022-03-03 00:00:00	\N	1	LI	LBR	+231	\N	129	\N	LIBERIA	\N	\N	\N	\N
130	\N	\N	2022-03-03 00:00:00	\N	1	LT	LBY	+218	\N	130	\N	LIBIA	\N	\N	\N	\N
131	\N	\N	2022-03-03 00:00:00	\N	1	LU	LIE	+423	\N	131	\N	LIECHTENSTEIN	\N	\N	\N	\N
132	\N	\N	2022-03-03 00:00:00	\N	1	LU	LTU	+370	\N	132	\N	LITUANIA	\N	\N	\N	\N
133	\N	\N	2022-03-03 00:00:00	\N	1	LU	LUX	+352	\N	133	\N	LUXEMBURGO	\N	\N	\N	\N
134	\N	\N	2022-03-03 00:00:00	\N	1	LU	LUX	+352	\N	134	\N	MACAO	\N	\N	\N	\N
135	\N	\N	2022-03-03 00:00:00	\N	1	MY	LUX	+352	\N	135	\N	MADAGASCAR	\N	\N	\N	\N
136	\N	\N	2022-03-03 00:00:00	\N	1	MW	LUX	+352	\N	136	\N	MALASIA	\N	\N	\N	\N
137	\N	\N	2022-03-03 00:00:00	\N	1	ML	MYS	+60	\N	137	\N	MALAUI	\N	\N	\N	\N
138	\N	\N	2022-03-03 00:00:00	\N	1	MT	MWI	+265	\N	138	\N	MALDIVAS	\N	\N	\N	\N
139	\N	\N	2022-03-03 00:00:00	\N	1	MA	MLI	+223	\N	139	\N	MALÍ	\N	\N	\N	\N
140	\N	\N	2022-03-03 00:00:00	\N	1	MQ	MLT	+356	\N	140	\N	MALTA	\N	\N	\N	\N
141	\N	\N	2022-03-03 00:00:00	\N	1	MU	MAR	+212	\N	141	\N	MARRUECOS	\N	\N	\N	\N
142	\N	\N	2022-03-03 00:00:00	\N	1	MR	MTQ	+596	\N	142	\N	MARTINICA	\N	\N	\N	\N
143	\N	\N	2022-03-03 00:00:00	\N	1	PS	MUS	+230	\N	143	\N	MAURICIO	\N	\N	\N	\N
144	\N	\N	2022-03-03 00:00:00	\N	1	YT	MRT	+222	\N	144	\N	MAURITANIA	\N	\N	\N	\N
145	\N	\N	2022-03-03 00:00:00	\N	1	FM	PSE	+970	\N	145	\N	MAYOTTE	\N	\N	\N	\N
146	\N	\N	2022-03-03 00:00:00	\N	1	MD	MYT	+262	\N	146	\N	MÉXICO	\N	\N	\N	\N
147	\N	\N	2022-03-03 00:00:00	\N	1	MN	FSM	+691	\N	147	\N	MICRONESIA	\N	\N	\N	\N
148	\N	\N	2022-03-03 00:00:00	\N	1	ME	MDA	+373	\N	148	\N	MÓNACO	\N	\N	\N	\N
149	\N	\N	2022-03-03 00:00:00	\N	1	MS	MNG	+976	\N	149	\N	MONGOLIA	\N	\N	\N	\N
150	\N	\N	2022-03-03 00:00:00	\N	1	MZ	MNE	+382	\N	150	\N	MONTENEGRO	\N	\N	\N	\N
151	\N	\N	2022-03-03 00:00:00	\N	1	MZ	MSR	+1664	\N	151	\N	MONTSERRAT	\N	\N	\N	\N
152	\N	\N	2022-03-03 00:00:00	\N	1	NA	MOZ	+258	\N	152	\N	MOZAMBIQUE	\N	\N	\N	\N
153	\N	\N	2022-03-03 00:00:00	\N	1	NR	MOZ	+258	\N	153	\N	MYANMAR	\N	\N	\N	\N
154	\N	\N	2022-03-03 00:00:00	\N	1	NP	NAM	+264	\N	154	\N	NAMIBIA	\N	\N	\N	\N
155	\N	\N	2022-03-03 00:00:00	\N	1	NI	NRU	+674	\N	155	\N	NAURU	\N	\N	\N	\N
156	\N	\N	2022-03-03 00:00:00	\N	1	NE	NPL	+977	\N	156	\N	NEPAL	\N	\N	\N	\N
157	\N	\N	2022-03-03 00:00:00	\N	1	NG	NIC	+505	\N	157	\N	NICARAGUA	\N	\N	\N	\N
158	\N	\N	2022-03-03 00:00:00	\N	1	NU	NER	+227	\N	158	\N	NÍGER	\N	\N	\N	\N
159	\N	\N	2022-03-03 00:00:00	\N	1	PS	NGA	+234	\N	159	\N	NIGERIA	\N	\N	\N	\N
160	\N	\N	2022-03-03 00:00:00	\N	1	NC	NIU	+683	\N	160	\N	NIUE	\N	\N	\N	\N
161	\N	\N	2022-03-03 00:00:00	\N	1	NZ	PSE	+970	\N	161	\N	NORUEGA	\N	\N	\N	\N
162	\N	\N	2022-03-03 00:00:00	\N	1	OM	NCL	+687	\N	162	\N	NUEVA CALEDONIA	\N	\N	\N	\N
163	\N	\N	2022-03-03 00:00:00	\N	1	PS	NZL	+64	\N	163	\N	NUEVA ZELANDA	\N	\N	\N	\N
164	\N	\N	2022-03-03 00:00:00	\N	1	PK	OMN	+968	\N	164	\N	OMÁN	\N	\N	\N	\N
165	\N	\N	2022-03-03 00:00:00	\N	1	PS	PSE	+970	\N	165	\N	PAÍSES BAJOS	\N	\N	\N	\N
166	\N	\N	2022-03-03 00:00:00	\N	1	PA	PAK	+92	\N	166	\N	PAKISTÁN	\N	\N	\N	\N
167	\N	\N	2022-03-03 00:00:00	\N	1	PG	PSE	+970	\N	167	\N	PALAU	\N	\N	\N	\N
168	\N	\N	2022-03-03 00:00:00	\N	1	PY	PAN	+507	\N	168	\N	PANAMÁ	\N	\N	\N	\N
169	\N	\N	2022-03-03 00:00:00	\N	1	PE	PNG	+675	\N	169	\N	PAPÚA NUEVA GUINEA	\N	\N	\N	\N
170	\N	\N	2022-03-03 00:00:00	\N	1	PE	PRY	+595	\N	170	\N	PARAGUAY	\N	\N	\N	\N
171	\N	\N	2022-03-03 00:00:00	\N	1	PE	PER	+51	\N	171	\N	PERÚ	\N	\N	\N	\N
172	\N	\N	2022-03-03 00:00:00	\N	1	PL	PER	+51	\N	172	\N	PITCAIRN	\N	\N	\N	\N
173	\N	\N	2022-03-03 00:00:00	\N	1	PT	PER	+51	\N	173	\N	POLINESIA FRANCÉS	\N	\N	\N	\N
174	\N	\N	2022-03-03 00:00:00	\N	1	PR	POL	+48	\N	174	\N	POLONIA	\N	\N	\N	\N
175	\N	\N	2022-03-03 00:00:00	\N	1	QA	PRT	+351	\N	175	\N	PORTUGAL	\N	\N	\N	\N
176	\N	\N	2022-03-03 00:00:00	\N	1	GB	PRI	+1	\N	176	\N	PUERTO RICO	\N	\N	\N	\N
177	\N	\N	2022-03-03 00:00:00	\N	1	GB	QAT	+974	\N	177	\N	QATAR	\N	\N	\N	\N
178	\N	\N	2022-03-03 00:00:00	\N	1	CF	GBR	+44	\N	178	\N	REINO UNIDO DE GRAN BRETAÑA E IRLANDA DEL NORTE	\N	\N	\N	\N
179	\N	\N	2022-03-03 00:00:00	\N	1	CZ	GBR	+44	\N	179	\N	REPÚBLICA ÁRABE SIRIA	\N	\N	\N	\N
180	\N	\N	2022-03-03 00:00:00	\N	1	CZ	CAF	+236	\N	180	\N	REPÚBLICA CENTROAFRICANA	\N	\N	\N	\N
181	\N	\N	2022-03-03 00:00:00	\N	1	SS	CZE	+420	\N	181	\N	REPÚBLICA CHECA	\N	\N	\N	\N
182	\N	\N	2022-03-03 00:00:00	\N	1	CZ	CZE	+420	\N	182	\N	REPÚBLICA DE MOLDAVIA	\N	\N	\N	\N
183	\N	\N	2022-03-03 00:00:00	\N	1	SS	SSD	+211	\N	183	\N	REPÚBLICA DEMOCRÁTICA DEL CONGO	\N	\N	\N	\N
184	\N	\N	2022-03-03 00:00:00	\N	1	SS	CZE	+420	\N	184	\N	REPÚBLICA DEMOCRÁTICA POPULAR LAO	\N	\N	\N	\N
185	\N	\N	2022-03-03 00:00:00	\N	1	RE	SSD	+211	\N	185	\N	REPÚBLICA DOMINICANA	\N	\N	\N	\N
186	\N	\N	2022-03-03 00:00:00	\N	1	RO	SSD	+211	\N	186	\N	REPÚBLICA UNIDA DE TANZANIA	\N	\N	\N	\N
187	\N	\N	2022-03-03 00:00:00	\N	1	RU	REU	+262	\N	187	\N	RÉUNION	\N	\N	\N	\N
188	\N	\N	2022-03-03 00:00:00	\N	1	RU	ROU	+40	\N	188	\N	RUMANIA	\N	\N	\N	\N
189	\N	\N	2022-03-03 00:00:00	\N	1	EH	RUS	+7	\N	189	\N	RUSIA	\N	\N	\N	\N
190	\N	\N	2022-03-03 00:00:00	\N	1	EH	RUS	+7	\N	190	\N	RWANDA	\N	\N	\N	\N
191	\N	\N	2022-03-03 00:00:00	\N	1	EH	ESH	+212	\N	191	\N	SÁHARA OCCIDENTAL	\N	\N	\N	\N
192	\N	\N	2022-03-03 00:00:00	\N	1	WS	ESH	+212	\N	192	\N	SAINT-BARTHÉLEMY	\N	\N	\N	\N
193	\N	\N	2022-03-03 00:00:00	\N	1	AS	ESH	+212	\N	193	\N	SAINT-MARTIN	\N	\N	\N	\N
194	\N	\N	2022-03-03 00:00:00	\N	1	KN	WSM	+685	\N	194	\N	SAMOA	\N	\N	\N	\N
195	\N	\N	2022-03-03 00:00:00	\N	1	SM	ASM	+1684	\N	195	\N	SAMOA AMERICANA	\N	\N	\N	\N
196	\N	\N	2022-03-03 00:00:00	\N	1	PM	KNA	+1869	\N	196	\N	SAN CRISTÓBAL Y NIEVES	\N	\N	\N	\N
197	\N	\N	2022-03-03 00:00:00	\N	1	VC	SMR	+378	\N	197	\N	SAN MARINO	\N	\N	\N	\N
198	\N	\N	2022-03-03 00:00:00	\N	1	SH	SPM	+508	\N	198	\N	SAN PEDRO Y MIQUELÓN	\N	\N	\N	\N
199	\N	\N	2022-03-03 00:00:00	\N	1	LC	VCT	+1784	\N	199	\N	SAN VICENTE Y LAS GRANADINAS	\N	\N	\N	\N
200	\N	\N	2022-03-03 00:00:00	\N	1	ST	SHN	+290	\N	200	\N	SANTA ELENA	\N	\N	\N	\N
201	\N	\N	2022-03-03 00:00:00	\N	1	SN	LCA	+1758	\N	201	\N	SANTA LUCÍA	\N	\N	\N	\N
202	\N	\N	2022-03-03 00:00:00	\N	1	RS	STP	+239	\N	202	\N	SANTO TOMÉ Y PRÍNCIPE	\N	\N	\N	\N
203	\N	\N	2022-03-03 00:00:00	\N	1	SC	SEN	+221	\N	203	\N	SENEGAL	\N	\N	\N	\N
204	\N	\N	2022-03-03 00:00:00	\N	1	SL	SRB	+381	\N	204	\N	SERBIA	\N	\N	\N	\N
205	\N	\N	2022-03-03 00:00:00	\N	1	SG	SYC	+248	\N	205	\N	SEYCHELLES	\N	\N	\N	\N
206	\N	\N	2022-03-03 00:00:00	\N	1	SX	SLE	+232	\N	206	\N	SIERRA LEONA	\N	\N	\N	\N
207	\N	\N	2022-03-03 00:00:00	\N	1	SO	SGP	+65	\N	207	\N	SINGAPUR	\N	\N	\N	\N
208	\N	\N	2022-03-03 00:00:00	\N	1	LK	SMX	+1721	\N	208	\N	SINT MAARTEN	\N	\N	\N	\N
209	\N	\N	2022-03-03 00:00:00	\N	1	ZA	SOM	+252	\N	209	\N	SOMALIA	\N	\N	\N	\N
210	\N	\N	2022-03-03 00:00:00	\N	1	SD	LKA	+94	\N	210	\N	SRI LANKA	\N	\N	\N	\N
211	\N	\N	2022-03-03 00:00:00	\N	1	SD	ZAF	+27	\N	211	\N	SUDÁFRICA	\N	\N	\N	\N
212	\N	\N	2022-03-03 00:00:00	\N	1	SE	SDN	+249	\N	212	\N	SUDÁN	\N	\N	\N	\N
213	\N	\N	2022-03-03 00:00:00	\N	1	CH	SDN	+249	\N	213	\N	SUDÁN DEL SUR	\N	\N	\N	\N
214	\N	\N	2022-03-03 00:00:00	\N	1	SR	SWE	+46	\N	214	\N	SUECIA	\N	\N	\N	\N
215	\N	\N	2022-03-03 00:00:00	\N	1	SJ	CHE	+41	\N	215	\N	SUIZA	\N	\N	\N	\N
216	\N	\N	2022-03-03 00:00:00	\N	1	SZ	SUR	+597	\N	216	\N	SURINAME	\N	\N	\N	\N
217	\N	\N	2022-03-03 00:00:00	\N	1	TH	SJM	+47	\N	217	\N	SVALBARD Y JAN MAYEN	\N	\N	\N	\N
218	\N	\N	2022-03-03 00:00:00	\N	1	TJ	SWZ	+268	\N	218	\N	SWAZILANDIA	\N	\N	\N	\N
219	\N	\N	2022-03-03 00:00:00	\N	1	TL	THA	+66	\N	219	\N	TAILANDIA	\N	\N	\N	\N
220	\N	\N	2022-03-03 00:00:00	\N	1	TG	TJK	+992	\N	220	\N	TAYIKISTÁN	\N	\N	\N	\N
221	\N	\N	2022-03-03 00:00:00	\N	1	TK	TLS	+670	\N	221	\N	TIMOR-LESTE	\N	\N	\N	\N
222	\N	\N	2022-03-03 00:00:00	\N	1	TO	TGO	+228	\N	222	\N	TOGO	\N	\N	\N	\N
223	\N	\N	2022-03-03 00:00:00	\N	1	TT	TKL	+690	\N	223	\N	TOKELAU	\N	\N	\N	\N
224	\N	\N	2022-03-03 00:00:00	\N	1	TN	TON	+676	\N	224	\N	TONGA	\N	\N	\N	\N
225	\N	\N	2022-03-03 00:00:00	\N	1	TM	TTO	+1868	\N	225	\N	TRINIDAD Y TOBAGO	\N	\N	\N	\N
226	\N	\N	2022-03-03 00:00:00	\N	1	TR	TUN	+216	\N	226	\N	TÚNEZ	\N	\N	\N	\N
227	\N	\N	2022-03-03 00:00:00	\N	1	TV	TKM	+993	\N	227	\N	TURKMENISTÁN	\N	\N	\N	\N
228	\N	\N	2022-03-03 00:00:00	\N	1	UA	TUR	+90	\N	228	\N	TURQUÍA	\N	\N	\N	\N
229	\N	\N	2022-03-03 00:00:00	\N	1	UG	TUV	+688	\N	229	\N	TUVALU	\N	\N	\N	\N
230	\N	\N	2022-03-03 00:00:00	\N	1	UY	UKR	+380	\N	230	\N	UCRANIA	\N	\N	\N	\N
231	\N	\N	2022-03-03 00:00:00	\N	1	UZ	UGA	+256	\N	231	\N	UGANDA	\N	\N	\N	\N
232	\N	\N	2022-03-03 00:00:00	\N	1	VU	URY	+598	\N	232	\N	URUGUAY	\N	\N	\N	\N
233	\N	\N	2022-03-03 00:00:00	\N	1	VE	UZB	+998	\N	233	\N	UZBEKISTÁN	\N	\N	\N	\N
234	\N	\N	2022-03-03 00:00:00	\N	1	VE	VUT	+678	\N	234	\N	VANUATU	\N	\N	\N	\N
235	\N	\N	2022-03-03 00:00:00	\N	1	YE	VEN	+58	\N	235	\N	VENEZUELA	\N	\N	\N	\N
236	\N	\N	2022-03-03 00:00:00	\N	1	ZM	VEN	+58	\N	236	\N	VIET NAM	\N	\N	\N	\N
237	\N	\N	2022-03-03 00:00:00	\N	1	ZW	YEM	+967	\N	237	\N	YEMEN	\N	\N	\N	\N
238	\N	\N	2022-03-03 00:00:00	\N	1	ZM	ZMB	+260	\N	238	\N	ZAMBIA	\N	\N	\N	\N
239	\N	\N	2022-03-03 00:00:00	\N	1	ZW	ZWE	+263	\N	239	\N	ZIMBABWE	\N	\N	\N	\N
240	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	240	\N	ANTÁRTIDA	\N	\N	\N	\N
241	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	241	\N	ISLA BOUVET	\N	\N	\N	\N
242	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	242	\N	TERRITORIO BRITÁNICO DE LA OCÉANO ÍNDICO	\N	\N	\N	\N
243	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	243	\N	TAIWÁN	\N	\N	\N	\N
244	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	244	\N	ISLA DE NAVIDAD	\N	\N	\N	\N
245	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	245	\N	ISLAS COCOS	\N	\N	\N	\N
246	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	246	\N	GEORGIA DEL SUR Y LAS ISLAS SANDWICH DEL SUR	\N	\N	\N	\N
247	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	247	\N	TERRITORIOS AUSTRALES FRANCESES	\N	\N	\N	\N
248	\N	\N	2022-03-03 00:00:00	\N	1	SN	SN	SN	\N	999	\N	NO REGISTRA	\N	\N	\N	\N
249	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	01	\N	AZUAY	\N	\N	\N	\N
251	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	03	\N	CAÑAR	\N	\N	\N	\N
253	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	05	\N	COTOPAXI	\N	\N	\N	\N
255	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	07	\N	EL ORO	\N	\N	\N	\N
256	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	08	\N	ESMERALDAS	\N	\N	\N	\N
257	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	09	\N	GUAYAS	\N	\N	\N	\N
258	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	10	\N	IMBABURA	\N	\N	\N	\N
259	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	11	\N	LOJA	\N	\N	\N	\N
260	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	12	\N	LOS RIOS	\N	\N	\N	\N
261	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	13	\N	MANABI	\N	\N	\N	\N
262	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	14	\N	MORONA SANTIAGO	\N	\N	\N	\N
263	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	15	\N	NAPO	\N	\N	\N	\N
264	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	16	\N	PASTAZA	\N	\N	\N	\N
267	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	19	\N	ZAMORA CHINCHIPE	\N	\N	\N	\N
268	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	20	\N	GALAPAGOS	\N	\N	\N	\N
269	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	21	\N	SUCUMBIOS	\N	\N	\N	\N
270	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	22	\N	ORELLANA	\N	\N	\N	\N
271	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	23	\N	SANTO DOMINGO DE LOS TSACHILAS	\N	\N	\N	\N
272	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	24	\N	SANTA ELENA	\N	\N	\N	\N
273	\N	\N	2022-03-03 00:00:00	56	2	\N	\N	\N	\N	90	\N	ZONAS NO DELIMITADAS	\N	\N	\N	\N
274	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0101	\N	CUENCA	\N	\N	\N	\N
275	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0102	\N	GIRÓN	\N	\N	\N	\N
276	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0103	\N	GUALACEO	\N	\N	\N	\N
277	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0104	\N	NABÓN	\N	\N	\N	\N
278	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0105	\N	PAUTE	\N	\N	\N	\N
279	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0106	\N	PUCARA	\N	\N	\N	\N
280	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0107	\N	SAN FERNANDO	\N	\N	\N	\N
281	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0108	\N	SANTA ISABEL	\N	\N	\N	\N
282	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0109	\N	SIGSIG	\N	\N	\N	\N
283	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0110	\N	OÑA	\N	\N	\N	\N
284	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0111	\N	CHORDELEG	\N	\N	\N	\N
285	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0112	\N	EL PAN	\N	\N	\N	\N
286	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0113	\N	SEVILLA DE ORO	\N	\N	\N	\N
287	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0114	\N	GUACHAPALA	\N	\N	\N	\N
288	\N	\N	2022-03-03 00:00:00	249	3	\N	\N	\N	\N	0115	\N	CAMILO PONCE ENRÍQUEZ	\N	\N	\N	\N
296	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0301	\N	AZOGUES	\N	\N	\N	\N
297	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0302	\N	BIBLIÁN	\N	\N	\N	\N
298	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0303	\N	CAÑAR	\N	\N	\N	\N
299	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0304	\N	LA TRONCAL	\N	\N	\N	\N
300	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0305	\N	EL TAMBO	\N	\N	\N	\N
301	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0306	\N	DÉLEG	\N	\N	\N	\N
302	\N	\N	2022-03-03 00:00:00	251	3	\N	\N	\N	\N	0307	\N	SUSCAL	\N	\N	\N	\N
309	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0501	\N	LATACUNGA	\N	\N	\N	\N
310	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0502	\N	LA MANÁ	\N	\N	\N	\N
311	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0503	\N	PANGUA	\N	\N	\N	\N
312	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0504	\N	PUJILI	\N	\N	\N	\N
313	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0505	\N	SALCEDO	\N	\N	\N	\N
314	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0506	\N	SAQUISILÍ	\N	\N	\N	\N
315	\N	\N	2022-03-03 00:00:00	253	3	\N	\N	\N	\N	0507	\N	SIGCHOS	\N	\N	\N	\N
326	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0701	\N	MACHALA	\N	\N	\N	\N
327	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0702	\N	ARENILLAS	\N	\N	\N	\N
328	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0703	\N	ATAHUALPA	\N	\N	\N	\N
329	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0704	\N	BALSAS	\N	\N	\N	\N
330	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0705	\N	CHILLA	\N	\N	\N	\N
331	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0706	\N	EL GUABO	\N	\N	\N	\N
332	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0707	\N	HUAQUILLAS	\N	\N	\N	\N
333	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0708	\N	MARCABELÍ	\N	\N	\N	\N
334	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0709	\N	PASAJE	\N	\N	\N	\N
335	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0710	\N	PIÑAS	\N	\N	\N	\N
336	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0711	\N	PORTOVELO	\N	\N	\N	\N
337	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0712	\N	SANTA ROSA	\N	\N	\N	\N
338	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0713	\N	ZARUMA	\N	\N	\N	\N
339	\N	\N	2022-03-03 00:00:00	255	3	\N	\N	\N	\N	0714	\N	LAS LAJAS	\N	\N	\N	\N
340	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0801	\N	ESMERALDAS	\N	\N	\N	\N
341	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0802	\N	ELOY ALFARO	\N	\N	\N	\N
342	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0803	\N	MUISNE	\N	\N	\N	\N
343	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0804	\N	QUININDÉ	\N	\N	\N	\N
344	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0805	\N	SAN LORENZO	\N	\N	\N	\N
345	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0806	\N	ATACAMES	\N	\N	\N	\N
346	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0807	\N	RIOVERDE	\N	\N	\N	\N
347	\N	\N	2022-03-03 00:00:00	256	3	\N	\N	\N	\N	0808	\N	LA CONCORDIA	\N	\N	\N	\N
348	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0901	\N	GUAYAQUIL	\N	\N	\N	\N
349	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0902	\N	EDO BAQUERIZO MORENO (JU	\N	\N	\N	\N
350	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0903	\N	BALAO	\N	\N	\N	\N
351	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0904	\N	BALZAR	\N	\N	\N	\N
352	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0905	\N	COLIMES	\N	\N	\N	\N
353	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0906	\N	DAULE	\N	\N	\N	\N
354	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0907	\N	DURÁN	\N	\N	\N	\N
355	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0908	\N	EL EMPALME	\N	\N	\N	\N
356	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0909	\N	EL TRIUNFO	\N	\N	\N	\N
357	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0910	\N	MILAGRO	\N	\N	\N	\N
358	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0911	\N	NARANJAL	\N	\N	\N	\N
359	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0912	\N	NARANJITO	\N	\N	\N	\N
360	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0913	\N	PALESTINA	\N	\N	\N	\N
361	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0914	\N	PEDRO CARBO	\N	\N	\N	\N
362	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0915	\N	SAMBORONDÓN	\N	\N	\N	\N
363	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0916	\N	SANTA LUCÍA	\N	\N	\N	\N
364	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0917	\N	SALITRE (URBINA JADO)	\N	\N	\N	\N
365	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0918	\N	SAN JACINTO DE YAGUACHI	\N	\N	\N	\N
366	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0919	\N	PLAYAS	\N	\N	\N	\N
367	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0920	\N	SIMÓN BOLÍVAR	\N	\N	\N	\N
368	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0921	\N	RONEL MARCELINO MARIDUE	\N	\N	\N	\N
369	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0922	\N	LOMAS DE SARGENTILLO	\N	\N	\N	\N
370	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0923	\N	NOBOL	\N	\N	\N	\N
371	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0924	\N	GENERAL ANTONIO ELIZALDE	\N	\N	\N	\N
372	\N	\N	2022-03-03 00:00:00	257	3	\N	\N	\N	\N	0925	\N	ISIDRO AYORA	\N	\N	\N	\N
373	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1001	\N	IBARRA	\N	\N	\N	\N
374	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1002	\N	ANTONIO ANTE	\N	\N	\N	\N
375	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1003	\N	COTACACHI	\N	\N	\N	\N
376	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1004	\N	OTAVALO	\N	\N	\N	\N
377	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1005	\N	PIMAMPIRO	\N	\N	\N	\N
378	\N	\N	2022-03-03 00:00:00	258	3	\N	\N	\N	\N	1006	\N	SAN MIGUEL DE URCUQUÍ	\N	\N	\N	\N
379	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1107	\N	LOJA	\N	\N	\N	\N
380	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1108	\N	CALVAS	\N	\N	\N	\N
381	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1109	\N	CATAMAYO	\N	\N	\N	\N
382	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1110	\N	CELICA	\N	\N	\N	\N
383	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1111	\N	CHAGUARPAMBA	\N	\N	\N	\N
384	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1112	\N	ESPÍNDOLA	\N	\N	\N	\N
385	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1113	\N	GONZANAMÁ	\N	\N	\N	\N
386	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1114	\N	MACARÁ	\N	\N	\N	\N
387	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1115	\N	PALTAS	\N	\N	\N	\N
388	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1116	\N	PUYANGO	\N	\N	\N	\N
389	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1117	\N	SARAGURO	\N	\N	\N	\N
390	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1118	\N	SOZORANGA	\N	\N	\N	\N
391	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1119	\N	ZAPOTILLO	\N	\N	\N	\N
392	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1120	\N	PINDAL	\N	\N	\N	\N
393	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1121	\N	QUILANGA	\N	\N	\N	\N
394	\N	\N	2022-03-03 00:00:00	259	3	\N	\N	\N	\N	1122	\N	OLMEDO	\N	\N	\N	\N
395	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1201	\N	BABAHOYO	\N	\N	\N	\N
396	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1202	\N	BABA	\N	\N	\N	\N
397	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1203	\N	MONTALVO	\N	\N	\N	\N
398	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1204	\N	PUEBLOVIEJO	\N	\N	\N	\N
399	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1205	\N	QUEVEDO	\N	\N	\N	\N
400	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1206	\N	URDANETA	\N	\N	\N	\N
401	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1207	\N	VENTANAS	\N	\N	\N	\N
402	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1208	\N	VÍNCES	\N	\N	\N	\N
403	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1209	\N	PALENQUE	\N	\N	\N	\N
404	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1210	\N	BUENA FÉ	\N	\N	\N	\N
405	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1211	\N	VALENCIA	\N	\N	\N	\N
406	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1212	\N	MOCACHE	\N	\N	\N	\N
407	\N	\N	2022-03-03 00:00:00	260	3	\N	\N	\N	\N	1213	\N	QUINSALOMA	\N	\N	\N	\N
408	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1301	\N	PORTOVIEJO	\N	\N	\N	\N
409	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1302	\N	BOLÍVAR	\N	\N	\N	\N
410	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1303	\N	CHONE	\N	\N	\N	\N
411	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1304	\N	EL CARMEN	\N	\N	\N	\N
412	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1305	\N	FLAVIO ALFARO	\N	\N	\N	\N
413	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1306	\N	JIPIJAPA	\N	\N	\N	\N
414	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1307	\N	JUNÍN	\N	\N	\N	\N
415	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1308	\N	MANTA	\N	\N	\N	\N
416	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1309	\N	MONTECRISTI	\N	\N	\N	\N
417	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1310	\N	PAJÁN	\N	\N	\N	\N
418	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1311	\N	PICHINCHA	\N	\N	\N	\N
419	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1312	\N	ROCAFUERTE	\N	\N	\N	\N
420	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1313	\N	SANTA ANA	\N	\N	\N	\N
421	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1314	\N	SUCRE	\N	\N	\N	\N
422	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1315	\N	TOSAGUA	\N	\N	\N	\N
423	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1316	\N	24 DE MAYO	\N	\N	\N	\N
424	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1317	\N	PEDERNALES	\N	\N	\N	\N
425	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1318	\N	OLMEDO	\N	\N	\N	\N
426	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1319	\N	PUERTO LÓPEZ	\N	\N	\N	\N
427	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1320	\N	JAMA	\N	\N	\N	\N
428	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1321	\N	JARAMIJÓ	\N	\N	\N	\N
429	\N	\N	2022-03-03 00:00:00	261	3	\N	\N	\N	\N	1322	\N	SAN VICENTE	\N	\N	\N	\N
430	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1401	\N	MORONA	\N	\N	\N	\N
431	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1402	\N	GUALAQUIZA	\N	\N	\N	\N
432	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1403	\N	LIMÓN INDANZA	\N	\N	\N	\N
433	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1404	\N	PALORA	\N	\N	\N	\N
434	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1405	\N	SANTIAGO	\N	\N	\N	\N
435	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1406	\N	SUCÚA	\N	\N	\N	\N
436	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1407	\N	HUAMBOYA	\N	\N	\N	\N
437	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1408	\N	SAN JUAN BOSCO	\N	\N	\N	\N
438	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1409	\N	TAISHA	\N	\N	\N	\N
439	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1410	\N	LOGROÑO	\N	\N	\N	\N
440	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1411	\N	PABLO SEXTO	\N	\N	\N	\N
441	\N	\N	2022-03-03 00:00:00	262	3	\N	\N	\N	\N	1412	\N	TIWINTZA	\N	\N	\N	\N
442	\N	\N	2022-03-03 00:00:00	263	3	\N	\N	\N	\N	1501	\N	TENA	\N	\N	\N	\N
443	\N	\N	2022-03-03 00:00:00	263	3	\N	\N	\N	\N	1502	\N	ARCHIDONA	\N	\N	\N	\N
444	\N	\N	2022-03-03 00:00:00	263	3	\N	\N	\N	\N	1503	\N	EL CHACO	\N	\N	\N	\N
445	\N	\N	2022-03-03 00:00:00	263	3	\N	\N	\N	\N	1504	\N	QUIJOS	\N	\N	\N	\N
446	\N	\N	2022-03-03 00:00:00	263	3	\N	\N	\N	\N	1505	\N	ARLOS JULIO AROSEMENA TOL	\N	\N	\N	\N
447	\N	\N	2022-03-03 00:00:00	264	3	\N	\N	\N	\N	1601	\N	PASTAZA	\N	\N	\N	\N
448	\N	\N	2022-03-03 00:00:00	264	3	\N	\N	\N	\N	1602	\N	MERA	\N	\N	\N	\N
449	\N	\N	2022-03-03 00:00:00	264	3	\N	\N	\N	\N	1603	\N	SANTA CLARA	\N	\N	\N	\N
450	\N	\N	2022-03-03 00:00:00	264	3	\N	\N	\N	\N	1604	\N	ARAJUNO	\N	\N	\N	\N
468	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1901	\N	ZAMORA	\N	\N	\N	\N
469	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1902	\N	CHINCHIPE	\N	\N	\N	\N
470	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1903	\N	NANGARITZA	\N	\N	\N	\N
471	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1904	\N	YACUAMBI	\N	\N	\N	\N
472	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1905	\N	YANTZAZA (YANZATZA)	\N	\N	\N	\N
473	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1906	\N	EL PANGUI	\N	\N	\N	\N
474	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1907	\N	CENTINELA DEL CÓNDOR	\N	\N	\N	\N
475	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1908	\N	PALANDA	\N	\N	\N	\N
476	\N	\N	2022-03-03 00:00:00	267	3	\N	\N	\N	\N	1909	\N	PAQUISHA	\N	\N	\N	\N
477	\N	\N	2022-03-03 00:00:00	268	3	\N	\N	\N	\N	2001	\N	SAN CRISTÓBAL	\N	\N	\N	\N
478	\N	\N	2022-03-03 00:00:00	268	3	\N	\N	\N	\N	2002	\N	ISABELA	\N	\N	\N	\N
479	\N	\N	2022-03-03 00:00:00	268	3	\N	\N	\N	\N	2003	\N	SANTA CRUZ	\N	\N	\N	\N
480	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2101	\N	LAGO AGRIO	\N	\N	\N	\N
481	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2102	\N	GONZALO PIZARRO	\N	\N	\N	\N
482	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2103	\N	PUTUMAYO	\N	\N	\N	\N
483	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2104	\N	SHUSHUFINDI	\N	\N	\N	\N
484	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2105	\N	SUCUMBÍOS	\N	\N	\N	\N
485	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2106	\N	CASCALES	\N	\N	\N	\N
486	\N	\N	2022-03-03 00:00:00	269	3	\N	\N	\N	\N	2107	\N	CUYABENO	\N	\N	\N	\N
487	\N	\N	2022-03-03 00:00:00	270	3	\N	\N	\N	\N	2201	\N	ORELLANA	\N	\N	\N	\N
488	\N	\N	2022-03-03 00:00:00	270	3	\N	\N	\N	\N	2202	\N	AGUARICO	\N	\N	\N	\N
489	\N	\N	2022-03-03 00:00:00	270	3	\N	\N	\N	\N	2203	\N	LA JOYA DE LOS SACHAS	\N	\N	\N	\N
490	\N	\N	2022-03-03 00:00:00	270	3	\N	\N	\N	\N	2204	\N	LORETO	\N	\N	\N	\N
491	\N	\N	2022-03-03 00:00:00	271	3	\N	\N	\N	\N	2301	\N	SANTO DOMINGO	\N	\N	\N	\N
492	\N	\N	2022-03-03 00:00:00	272	3	\N	\N	\N	\N	2401	\N	SANTA ELENA	\N	\N	\N	\N
493	\N	\N	2022-03-03 00:00:00	272	3	\N	\N	\N	\N	2402	\N	LA LIBERTAD	\N	\N	\N	\N
494	\N	\N	2022-03-03 00:00:00	272	3	\N	\N	\N	\N	2403	\N	SALINAS	\N	\N	\N	\N
495	\N	\N	2022-03-03 00:00:00	273	3	\N	\N	\N	\N	9001	\N	LAS GOLONDRINAS	\N	\N	\N	\N
496	\N	\N	2022-03-03 00:00:00	273	3	\N	\N	\N	\N	9002	\N	MANGA DEL CURA	\N	\N	\N	\N
497	\N	\N	2022-03-03 00:00:00	273	3	\N	\N	\N	\N	9003	\N	EL PIEDRERO	\N	\N	\N	\N
250	\N	\N	\N	56	2	\N	\N	\N	\N	02	\N	BOLIVAR	\N	\N	\N	\N
252	\N	\N	\N	56	2	\N	\N	\N	\N	04	\N	CARCHI	\N	\N	\N	\N
254	\N	\N	\N	56	2	\N	\N	\N	\N	06	\N	CHIMBORAZO	\N	\N	\N	\N
265	\N	\N	\N	56	2	\N	\N	\N	\N	17	\N	PICHINCHA	\N	\N	\N	\N
266	\N	\N	\N	56	2	\N	\N	\N	\N	18	\N	TUNGURAHUA	\N	\N	\N	\N
289	\N	\N	\N	250	3	\N	\N	\N	\N	0201	\N	GUARANDA	\N	\N	\N	\N
290	\N	\N	\N	250	3	\N	\N	\N	\N	0202	\N	CHILLANES	\N	\N	\N	\N
291	\N	\N	\N	250	3	\N	\N	\N	\N	0203	\N	CHIMBO	\N	\N	\N	\N
292	\N	\N	\N	250	3	\N	\N	\N	\N	0204	\N	ECHEANDÍA	\N	\N	\N	\N
293	\N	\N	\N	250	3	\N	\N	\N	\N	0205	\N	SAN MIGUEL	\N	\N	\N	\N
294	\N	\N	\N	250	3	\N	\N	\N	\N	0206	\N	CALUMA	\N	\N	\N	\N
295	\N	\N	\N	250	3	\N	\N	\N	\N	0207	\N	LAS NAVES	\N	\N	\N	\N
303	\N	\N	\N	252	3	\N	\N	\N	\N	0401	\N	TULCÁN	\N	\N	\N	\N
304	\N	\N	\N	252	3	\N	\N	\N	\N	0402	\N	BOLÍVAR	\N	\N	\N	\N
305	\N	\N	\N	252	3	\N	\N	\N	\N	0403	\N	ESPEJO	\N	\N	\N	\N
306	\N	\N	\N	252	3	\N	\N	\N	\N	0404	\N	MIRA	\N	\N	\N	\N
307	\N	\N	\N	252	3	\N	\N	\N	\N	0405	\N	MONTÚFAR	\N	\N	\N	\N
308	\N	\N	\N	252	3	\N	\N	\N	\N	0406	\N	SAN PEDRO DE HUACA	\N	\N	\N	\N
316	\N	\N	\N	254	3	\N	\N	\N	\N	0601	\N	RIOBAMBA	\N	\N	\N	\N
317	\N	\N	\N	254	3	\N	\N	\N	\N	0602	\N	ALAUSI	\N	\N	\N	\N
318	\N	\N	\N	254	3	\N	\N	\N	\N	0603	\N	COLTA	\N	\N	\N	\N
319	\N	\N	\N	254	3	\N	\N	\N	\N	0604	\N	CHAMBO	\N	\N	\N	\N
320	\N	\N	\N	254	3	\N	\N	\N	\N	0605	\N	CHUNCHI	\N	\N	\N	\N
321	\N	\N	\N	254	3	\N	\N	\N	\N	0606	\N	GUAMOTE	\N	\N	\N	\N
322	\N	\N	\N	254	3	\N	\N	\N	\N	0607	\N	GUANO	\N	\N	\N	\N
323	\N	\N	\N	254	3	\N	\N	\N	\N	0608	\N	PALLATANGA	\N	\N	\N	\N
324	\N	\N	\N	254	3	\N	\N	\N	\N	0609	\N	PENIPE	\N	\N	\N	\N
325	\N	\N	\N	254	3	\N	\N	\N	\N	0610	\N	CUMANDÁ	\N	\N	\N	\N
451	\N	\N	\N	265	3	\N	\N	\N	\N	1701	\N	QUITO	\N	\N	\N	\N
452	\N	\N	\N	265	3	\N	\N	\N	\N	1702	\N	CAYAMBE	\N	\N	\N	\N
453	\N	\N	\N	265	3	\N	\N	\N	\N	1703	\N	MEJIA	\N	\N	\N	\N
454	\N	\N	\N	265	3	\N	\N	\N	\N	1704	\N	PEDRO MONCAYO	\N	\N	\N	\N
455	\N	\N	\N	265	3	\N	\N	\N	\N	1705	\N	RUMIÑAHUI	\N	\N	\N	\N
456	\N	\N	\N	265	3	\N	\N	\N	\N	1706	\N	SAN MIGUEL DE LOS BANCOS	\N	\N	\N	\N
457	\N	\N	\N	265	3	\N	\N	\N	\N	1707	\N	PEDRO VICENTE MALDONADO	\N	\N	\N	\N
458	\N	\N	\N	265	3	\N	\N	\N	\N	1708	\N	PUERTO QUITO	\N	\N	\N	\N
459	\N	\N	\N	266	3	\N	\N	\N	\N	1801	\N	AMBATO	\N	\N	\N	\N
460	\N	\N	\N	266	3	\N	\N	\N	\N	1802	\N	BAÑOS DE AGUA SANTA	\N	\N	\N	\N
461	\N	\N	\N	266	3	\N	\N	\N	\N	1803	\N	CEVALLOS	\N	\N	\N	\N
462	\N	\N	\N	266	3	\N	\N	\N	\N	1804	\N	MOCHA	\N	\N	\N	\N
463	\N	\N	\N	266	3	\N	\N	\N	\N	1805	\N	PATATE	\N	\N	\N	\N
464	\N	\N	\N	266	3	\N	\N	\N	\N	1806	\N	QUERO	\N	\N	\N	\N
465	\N	\N	\N	266	3	\N	\N	\N	\N	1807	\N	SAN PEDRO DE PELILEO	\N	\N	\N	\N
466	\N	\N	\N	266	3	\N	\N	\N	\N	1808	\N	SANTIAGO DE PÍLLARO	\N	\N	\N	\N
467	\N	\N	\N	266	3	\N	\N	\N	\N	1809	\N	TISALEO	\N	\N	\N	\N
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.phones (id, created_at, updated_at, deleted_at, phoneable_type, phoneable_id, location_id, operator_id, type_id, number) FROM stdin;
1	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	1	82	38	\N	+1-469-534-7928
2	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	1	82	38	\N	+1 (603) 500-7880
3	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	2	\N	40	\N	360.240.9147
4	2022-03-03 23:26:21	2022-03-03 23:26:21	\N	App\\Models\\Authentication\\User	2	\N	40	\N	+1-610-209-6889
5	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	3	\N	39	\N	904.779.6867
6	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	3	\N	39	\N	(386) 901-6273
7	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	4	\N	40	\N	+1.308.433.6439
8	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	App\\Models\\Authentication\\User	4	\N	40	\N	1-732-237-5449
\.


--
-- Data for Name: socialmedia; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.socialmedia (id, created_at, updated_at, deleted_at, icon, logo, name) FROM stdin;
\.


--
-- Data for Name: socialmediables; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.socialmediables (id, created_at, updated_at, socialmediables_type, socialmediables_id, socialmedia_id, url, "user") FROM stdin;
\.


--
-- Data for Name: stateables; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.stateables (id, created_at, updated_at, stateable_type, stateable_id, state_id) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: core; Owner: postgres
--

COPY core.states (id, created_at, updated_at, deleted_at, code, name) FROM stdin;
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	da5a0050-2c4b-35db-8b46-09f0459afeef	voluptatibus
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	158a859e-a4b7-3c4f-a151-f9bdde8878c2	consequatur
3	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5e3f6f15-bf23-3fed-a9a3-52a1542752fc	non
4	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	89b78391-95f6-34f3-834e-5b6d9f2b6d06	quasi
5	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7685ff3d-2a9c-3ef9-990c-d58e261c0725	magni
6	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4e01526f-326f-3f74-8a7b-20bd9f61110f	harum
7	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	94561cba-d337-3789-9775-3b3e40307db6	ad
\.


--
-- Data for Name: agents; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.agents (id, created_at, updated_at, deleted_at, test_id, email, identification, lastname, name, phone) FROM stdin;
1	2022-03-04 00:03:32	2022-03-04 00:03:32	\N	2	cesar.tamayo0204@gmail.com	1234567893	asd asd	asd asd	123123123
2	2022-03-04 09:12:39	2022-03-04 09:12:39	\N	3	samia.cgarcia@gmail.com	1724581218	Najdjaks	Jsjajaja @1!,72&/	0192737281
3	2022-03-15 16:50:59	2022-03-15 16:50:59	\N	17	yguerra@einstein.k12.ec	1713911963	Guerra Guerra	Gloria Maria	0999460418
4	2022-03-18 13:16:11	2022-03-18 13:16:11	\N	34	cesar.tamayo0204@gmail.com	1231231231	Tamayo López	César Mauricio	1231231231
5	2022-03-18 17:28:56	2022-03-18 17:28:56	\N	49	diaspessoa@live.com	366777877	Días Pessôa	Julienr	979097681
6	2022-03-18 17:33:00	2022-03-18 17:33:00	\N	50	ceciliallasag@yahoo.es	0502041866	Heredia Llasag	Romulo Santiago	0988128085
7	2022-03-19 13:43:00	2022-03-19 13:43:00	\N	57	paty_ali@live.com	0401073614	Cifuentes Zambrano	Patricia Janneth	0989340359
8	2022-03-19 13:53:19	2022-03-19 13:53:19	\N	58	carmitapadilla8.78@gmail.com	0401202247	Padilla Morillo	Carmen Veronica	0980296330
9	2022-03-19 15:07:57	2022-03-19 15:07:57	\N	59	mirypozoch@gmail.com	0401024591	Pozo Champutiz	Miriam Del Rocío	0994280885
10	2022-03-19 15:29:01	2022-03-19 15:29:01	\N	61	pinchaodamaris@gmail.com	0401005483	López Titistar	Teresita del Consuelo	0997880368
11	2022-03-19 15:29:47	2022-03-19 15:29:47	\N	62	ximenaobando1967@gmail.com	0400851754	Obando Rosero	Ximena de Jesús	0984340825
12	2022-03-19 15:30:10	2022-03-19 15:30:10	\N	63	davichocusangua@gmail.com	0400732830	Cusangua Fueltala	Carlos Alberto	0963971045
13	2022-03-19 15:32:55	2022-03-19 15:32:55	\N	65	micaelaalenis6@gmail.com	0400970414	Ayala Coral	Noris Rosenda	0967962396
14	2022-03-19 15:38:56	2022-03-19 15:38:56	\N	67	davidburbanoromero@gmail.com	0400980587	Romero Palacios	María del Carmen	B
15	2022-03-19 19:06:17	2022-03-19 19:06:17	\N	71	laraelian52@gmail.com	0402006886	Elian Lara	Elian	0939985411
16	2022-03-19 20:32:50	2022-03-19 20:32:50	\N	72	heydyquinonez82@gmail.com	0401507660	Erika Malquin	Erika Tatiana Malquin Muepaz	0993838432
17	2022-03-19 20:39:10	2022-03-19 20:39:10	\N	73	candobradley12@gmail.com	0401089727	Alemán Aguilar	Erika Yajaira	0997865545
18	2022-03-20 16:29:34	2022-03-20 16:29:34	\N	74	karennicole2006@outlook.es	0606244887	Vasquez Paredes	Silvana Deysi	0999912892
19	2022-03-20 17:16:58	2022-03-20 17:16:58	\N	75	Joyce2006erazo@gmail.com	0603828161	Martínez Delgado	Andrea Elizabeth	0984780026
20	2022-03-20 17:25:30	2022-03-20 17:25:30	\N	76	raque.c307@gmail.com	0603411870	Raquel Caba	Raquel Caba	0992692224
21	2022-03-20 17:28:33	2022-03-20 17:28:33	\N	77	dannabenarive@gmail.com	0603897544	Fierro Castillo	Juan Sebastián	0984567298
22	2022-03-20 21:13:34	2022-03-20 21:13:34	\N	81	chemaquirola@gmail.com	1751402528	Merino Darquea	Maricruz	0987217654
23	2022-03-20 21:21:09	2022-03-20 21:21:09	\N	82	j.i.pazminox@gmail.com	1706726971	Pazmiño Boza	David	0998722416
24	2022-03-20 21:22:27	2022-03-20 21:22:27	\N	83	vevalentinaochoa@gmail.com	1103762868	Ríos Plaza	Johanna Lucia	0983994697
\.


--
-- Data for Name: answers; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.answers (id, created_at, updated_at, deleted_at, question_id, class, icon, "order", score, value) FROM stdin;
89	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	28	p-button-info	\N	1	0	Nunca
92	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	29	p-button-info	\N	1	1	SI
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	p-button-info	\N	1	1	SI
3	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	2	p-button-info	\N	1	1	SI
5	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	p-button-info	\N	1	0	Para nada
9	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	p-button-info	\N	1	0	Para nada
13	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	p-button-info	\N	1	0	Para nada
17	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	p-button-info	\N	1	0	Para nada
21	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	p-button-info	\N	1	0	Para nada
25	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	p-button-info	\N	1	0	Para nada
29	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	p-button-info	\N	1	0	Para nada
33	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	10	p-button-info	\N	1	0	Para nada
37	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	11	p-button-info	\N	1	0	Para nada
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	p-button-help	\N	2	0	NO
4	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	2	p-button-help	\N	2	0	NO
6	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
10	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
14	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
18	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
22	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
26	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
30	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
34	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	10	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
38	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	11	p-button-help	\N	2	1	Varios días (entre 1 a 6 días)
7	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
11	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
15	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
19	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
23	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
27	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
31	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
35	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	10	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
39	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	11	p-button-warning	\N	3	2	La mitad de los días o más (entre 7 y 11 días)
8	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
12	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
16	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
20	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
24	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
28	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
32	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
36	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	10	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
41	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	12	p-button-info	\N	1	0	Nunca
44	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	13	p-button-info	\N	1	0	Nunca
47	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	14	p-button-info	\N	1	0	Nunca
50	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	15	p-button-info	\N	1	0	Nunca
53	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	16	p-button-info	\N	1	0	Nunca
56	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	17	p-button-info	\N	1	0	Nunca
59	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	18	p-button-info	\N	1	0	Nunca
62	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	19	p-button-info	\N	1	0	Nunca
65	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	20	p-button-info	\N	1	0	Nunca
68	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	21	p-button-info	\N	1	0	Nunca
71	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	22	p-button-info	\N	1	0	Nunca
74	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	23	p-button-info	\N	1	0	Nunca
77	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	24	p-button-info	\N	1	0	Nunca
80	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	25	p-button-info	\N	1	0	Nunca
83	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	26	p-button-info	\N	1	0	Nunca
86	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	27	p-button-info	\N	1	0	Nunca
42	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	12	p-button-help	\N	2	1	Algunas veces
45	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	13	p-button-help	\N	2	1	Algunas veces
48	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	14	p-button-help	\N	2	1	Algunas veces
51	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	15	p-button-help	\N	2	1	Algunas veces
54	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	16	p-button-help	\N	2	1	Algunas veces
57	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	17	p-button-help	\N	2	1	Algunas veces
60	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	18	p-button-help	\N	2	1	Algunas veces
63	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	19	p-button-help	\N	2	1	Algunas veces
66	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	20	p-button-help	\N	2	1	Algunas veces
69	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	21	p-button-help	\N	2	1	Algunas veces
72	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	22	p-button-help	\N	2	1	Algunas veces
75	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	23	p-button-help	\N	2	1	Algunas veces
78	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	24	p-button-help	\N	2	1	Algunas veces
81	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	25	p-button-help	\N	2	1	Algunas veces
84	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	26	p-button-help	\N	2	1	Algunas veces
87	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	27	p-button-help	\N	2	1	Algunas veces
90	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	28	p-button-help	\N	2	1	Algunas veces
93	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	29	p-button-help	\N	2	0	NO
43	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	12	p-button-warning	\N	3	2	Frecuentemente
46	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	13	p-button-warning	\N	3	2	Frecuentemente
49	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	14	p-button-warning	\N	3	2	Frecuentemente
52	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	15	p-button-warning	\N	3	2	Frecuentemente
55	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	16	p-button-warning	\N	3	2	Frecuentemente
58	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	17	p-button-warning	\N	3	2	Frecuentemente
61	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	18	p-button-warning	\N	3	2	Frecuentemente
64	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	19	p-button-warning	\N	3	2	Frecuentemente
67	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	20	p-button-warning	\N	3	2	Frecuentemente
70	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	21	p-button-warning	\N	3	2	Frecuentemente
73	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	22	p-button-warning	\N	3	2	Frecuentemente
76	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	23	p-button-warning	\N	3	2	Frecuentemente
79	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	24	p-button-warning	\N	3	2	Frecuentemente
82	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	25	p-button-warning	\N	3	2	Frecuentemente
85	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	26	p-button-warning	\N	3	2	Frecuentemente
88	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	27	p-button-warning	\N	3	2	Frecuentemente
91	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	28	p-button-warning	\N	3	2	Frecuentemente
40	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	11	p-button-secondary	\N	4	3	Casi todos los días (12 días o más)
\.


--
-- Data for Name: assignments; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.assignments (id, created_at, updated_at, deleted_at, institution_id, test_id, user_id, ended_at, observations, started_at) FROM stdin;
1	2022-03-03 23:50:16	2022-03-03 23:50:16	\N	3	1	2	\N	\N	2022-03-03
2	2022-03-04 00:07:02	2022-03-04 00:07:02	\N	1	2	2	\N	\N	2022-03-04
3	2022-03-07 23:17:48	2022-03-07 23:17:48	\N	7	7	2	\N	\N	2022-03-07
4	2022-03-12 17:38:07	2022-03-12 17:38:07	\N	1	14	20	\N	\N	2022-03-12
5	2022-03-12 17:38:24	2022-03-12 17:38:24	\N	4	13	20	\N	\N	2022-03-12
\.


--
-- Data for Name: catalogues; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.catalogues (id, created_at, updated_at, deleted_at, parent_id, code, description, icon, name, type) FROM stdin;
\.


--
-- Data for Name: institutions; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.institutions (id, created_at, updated_at, deleted_at, address_id, acronym, code, denomination, email, logo, name, phone, short_name, slogan, web) FROM stdin;
1	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	ORGAEPSI	ABC1	48212908	oceane71@steuber.info	\N	ORGAEPSI	+1 (217) 280-7638	ORGAEPSI	\N	http://gutkowski.biz/vel-quos-velit-est-vitae-quo-architecto-quia
2	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	PUCE	ABC2	91607652	fabiola.leuschke@reilly.net	\N	PUCE	984.285.1413	PUCE	\N	http://schamberger.com/
3	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	SEK	ABC3	75141646	hulda.borer@hagenes.com	\N	SEK	1-283-339-2252	SEK	\N	http://schulist.biz/aut-sint-sunt-mollitia-repellendus-nam-sunt
4	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	INDOAMERICA	ABC4	62495394	huels.iva@nicolas.net	\N	INDOAMERICA	740-683-7564	INDOAMERICA	\N	http://www.homenick.com/possimus-quasi-dolor-ex
5	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	ESPOCH	ABC5	79387873	monserrat.hoeger@oreilly.info	\N	ESPOCH	773-865-2096	ESPOCH	\N	http://oconner.net/non-quis-sint-architecto-non
6	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	UNACH	ABC6	12494507	jaden21@reynolds.net	\N	UNACH	+1.458.673.2765	UNACH	\N	http://stokes.com/aut-aliquid-porro-quis-enim-earum
7	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	MSP	ABC7	57685403	athena35@bogan.info	\N	MSP	1-484-928-6534	MSP	\N	http://www.jacobs.org/quae-nihil-atque-sunt-maxime-commodi
8	2022-03-03 23:26:23	2022-03-03 23:26:23	\N	\N	OTROS	ABC8	64542034	nkuhic@leuschke.com	\N	OTROS	1-959-902-2548	OTROS	\N	http://reichel.org/
\.


--
-- Data for Name: priorities; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.priorities (id, created_at, updated_at, deleted_at, description, level, name, state) FROM stdin;
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	1	Alta Intensidad	t
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	2	Media Intensidad	t
3	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	3	Baja Intensidad	t
4	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	\N	4	Sin Problemas	t
\.


--
-- Data for Name: questions; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.questions (id, created_at, updated_at, deleted_at, "order", type, value) FROM stdin;
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	phq2	En las últimas dos semanas, ¿te has sentido triste, deprimido o sin esperanzas?
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	2	phq2	En las últimas dos semanas, ¿Has perdido el interés o placer en hacer cosas que te hacían sentir bien?
3	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	phq9a	Si has perdido el interés, las ganas o el placer en hacer las cosas, ayúdame a saber ¿Cuánto días te has sentido así en las últimas dos semanas?
4	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	2	phq9a	Si te has sentido desanimado, deprimido o triste/sin esperanza, ayúdame a saber ¿Cuánto días te has sentido así en las últimas dos semanas?
5	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	phq9a	¿Has tenido problemas para dormir o mantenerte dormido/a, o duermes demasiado?
6	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	phq9a	¿Has sentido poco apetito o has estado comiendo en exceso?
7	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	phq9a	¿Te has sentido cansado o con poca energía?
8	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	phq9a	¿Te sientes mal por tí mismo/a, o has sentido que eres un/a fracasado/a, o que le has fallado a tu familia o a tí mismo?
9	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	phq9a	¿Tienes problemas para concentrarte en cosas tales como tareas escolares, leer, o ver televisión?
10	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	phq9a	¿Has sentado muy tranquilo/a  que los demás se han dado cuenta, o has estado muy intraquilo/a que las demás personas han podido notarlo?
11	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	phq9a	¿Has tenido pensamientos de que sería mejor estar muerto/a o has querido hacerte daño de alguna forma?
12	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	psc17	En las últimas dos semanas, ¿te has sentido inquieto o se te dificulta mantenerte sentado o calmado?
13	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	2	psc17	¿Sueñas despierto demasiado?
14	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	3	psc17	En las últimas dos semanas, ¿te has sentido triste o infeliz?
15	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	4	psc17	¿Te niegas a compartir tus útiles escolares o tus pertenencias?
16	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	5	psc17	¿Se te dificulta comprender los sentimientos de los demás?
17	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	6	psc17	¿Te sientes sin esperanzas?
18	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	7	psc17	En las últimas dos semanas, ¿has tenido problemas para concentrarte?
19	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	8	psc17	¿Te peleas con otros jóvenes en tu colegio o tu barrio?
20	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	9	psc17	¿Te criticas a ti mismo?
21	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	10	psc17	¿Culpas a otros por tus problemas?
22	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	11	psc17	En las últimas dos semanas, ¿parece que te diviertes menos?
23	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	12	psc17	Sientes que se te dificulta obedecer reglas
24	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	13	psc17	En las últimas dos semanas, ¿te has sentido muy activo o con mucha energía?
25	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	14	psc17	¿Molestas o te burlas de otros?
26	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	15	psc17	En las últimas dos semanas, ¿te has sentido muy preocupado/a?
27	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	16	psc17	¿Tomas cosas que no te pertenecen?
28	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	17	psc17	¿Te es díficil mantener la atención o te distraes fácilmente?
29	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	1	duel	Durante la pandemia, ¿alguna persona importante de tu entorno ha fallecido?
\.


--
-- Data for Name: results; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.results (id, created_at, updated_at, deleted_at, answer_id, question_id, test_id) FROM stdin;
1	2022-03-04 04:48:45	2022-03-04 04:48:45	\N	1	1	1
2	2022-03-04 04:48:47	2022-03-04 04:48:47	\N	4	2	1
3	2022-03-04 04:48:49	2022-03-04 04:48:49	\N	7	3	1
4	2022-03-04 04:48:51	2022-03-04 04:48:51	\N	10	4	1
5	2022-03-04 04:48:52	2022-03-04 04:48:52	\N	15	5	1
6	2022-03-04 04:48:54	2022-03-04 04:48:54	\N	18	6	1
7	2022-03-04 04:48:56	2022-03-04 04:48:56	\N	23	7	1
8	2022-03-04 04:48:58	2022-03-04 04:48:58	\N	26	8	1
9	2022-03-04 04:49:00	2022-03-04 04:49:00	\N	31	9	1
10	2022-03-04 04:49:01	2022-03-04 04:49:01	\N	34	10	1
11	2022-03-04 04:49:03	2022-03-04 04:49:03	\N	39	11	1
12	2022-03-04 04:49:04	2022-03-04 04:49:04	\N	92	29	1
13	2022-03-04 05:02:43	2022-03-04 05:02:43	\N	1	1	2
14	2022-03-04 05:02:45	2022-03-04 05:02:45	\N	4	2	2
15	2022-03-04 05:02:47	2022-03-04 05:02:47	\N	7	3	2
16	2022-03-04 05:02:49	2022-03-04 05:02:49	\N	11	4	2
17	2022-03-04 05:02:50	2022-03-04 05:02:50	\N	16	5	2
18	2022-03-04 05:02:52	2022-03-04 05:02:52	\N	18	6	2
19	2022-03-04 05:02:54	2022-03-04 05:02:54	\N	23	7	2
20	2022-03-04 05:02:56	2022-03-04 05:02:56	\N	28	8	2
21	2022-03-04 05:02:58	2022-03-04 05:02:58	\N	32	9	2
22	2022-03-04 05:03:00	2022-03-04 05:03:00	\N	35	10	2
23	2022-03-04 05:03:02	2022-03-04 05:03:02	\N	39	11	2
24	2022-03-04 05:03:03	2022-03-04 05:03:03	\N	93	29	2
25	2022-03-04 14:10:37	2022-03-04 14:10:37	\N	2	1	3
26	2022-03-04 14:10:39	2022-03-04 14:10:39	\N	4	2	3
27	2022-03-04 14:10:45	2022-03-04 14:10:45	\N	42	12	3
28	2022-03-04 14:11:07	2022-03-04 14:11:07	\N	45	13	3
29	2022-03-04 14:11:13	2022-03-04 14:11:13	\N	48	14	3
30	2022-03-04 14:11:19	2022-03-04 14:11:19	\N	50	15	3
31	2022-03-04 14:11:25	2022-03-04 14:11:25	\N	53	16	3
32	2022-03-04 14:11:30	2022-03-04 14:11:30	\N	56	17	3
33	2022-03-04 14:11:36	2022-03-04 14:11:36	\N	59	18	3
34	2022-03-04 14:11:45	2022-03-04 14:11:45	\N	62	19	3
35	2022-03-04 14:11:49	2022-03-04 14:11:49	\N	66	20	3
36	2022-03-04 14:11:52	2022-03-04 14:11:52	\N	68	21	3
37	2022-03-04 14:11:57	2022-03-04 14:11:57	\N	71	22	3
38	2022-03-04 14:12:01	2022-03-04 14:12:01	\N	74	23	3
39	2022-03-04 14:12:11	2022-03-04 14:12:11	\N	77	24	3
40	2022-03-04 14:12:20	2022-03-04 14:12:20	\N	80	25	3
41	2022-03-04 14:12:26	2022-03-04 14:12:26	\N	83	26	3
42	2022-03-04 14:12:29	2022-03-04 14:12:29	\N	86	27	3
43	2022-03-04 14:12:34	2022-03-04 14:12:34	\N	89	28	3
44	2022-03-04 14:12:37	2022-03-04 14:12:37	\N	92	29	3
45	2022-03-05 01:49:44	2022-03-05 01:49:44	\N	2	1	4
46	2022-03-05 01:49:49	2022-03-05 01:49:49	\N	4	2	4
47	2022-03-05 01:49:55	2022-03-05 01:49:55	\N	42	12	4
48	2022-03-05 01:50:02	2022-03-05 01:50:02	\N	44	13	4
49	2022-03-05 01:50:08	2022-03-05 01:50:08	\N	47	14	4
50	2022-03-05 01:50:16	2022-03-05 01:50:16	\N	51	15	4
51	2022-03-05 01:50:27	2022-03-05 01:50:27	\N	54	16	4
52	2022-03-05 01:50:30	2022-03-05 01:50:30	\N	56	17	4
53	2022-03-05 01:50:37	2022-03-05 01:50:37	\N	59	18	4
54	2022-03-05 01:50:42	2022-03-05 01:50:42	\N	63	19	4
55	2022-03-05 01:50:46	2022-03-05 01:50:46	\N	65	20	4
56	2022-03-05 01:50:57	2022-03-05 01:50:57	\N	68	21	4
57	2022-03-05 01:51:08	2022-03-05 01:51:08	\N	73	22	4
58	2022-03-05 01:51:14	2022-03-05 01:51:14	\N	75	23	4
59	2022-03-05 01:51:20	2022-03-05 01:51:20	\N	79	24	4
60	2022-03-05 01:51:26	2022-03-05 01:51:26	\N	80	25	4
61	2022-03-05 01:51:34	2022-03-05 01:51:34	\N	83	26	4
62	2022-03-05 01:51:39	2022-03-05 01:51:39	\N	86	27	4
63	2022-03-05 01:51:43	2022-03-05 01:51:43	\N	90	28	4
64	2022-03-05 01:51:46	2022-03-05 01:51:46	\N	93	29	4
65	2022-03-05 03:21:01	2022-03-05 03:21:01	\N	2	1	5
66	2022-03-05 03:21:04	2022-03-05 03:21:04	\N	3	2	5
67	2022-03-05 03:21:06	2022-03-05 03:21:06	\N	6	3	5
68	2022-03-05 03:21:08	2022-03-05 03:21:08	\N	10	4	5
69	2022-03-05 03:21:10	2022-03-05 03:21:10	\N	13	5	5
70	2022-03-05 03:21:11	2022-03-05 03:21:11	\N	17	6	5
71	2022-03-05 03:21:13	2022-03-05 03:21:13	\N	21	7	5
72	2022-03-05 03:21:15	2022-03-05 03:21:15	\N	25	8	5
73	2022-03-05 03:21:17	2022-03-05 03:21:17	\N	29	9	5
74	2022-03-05 03:21:19	2022-03-05 03:21:19	\N	33	10	5
75	2022-03-05 03:21:20	2022-03-05 03:21:20	\N	37	11	5
76	2022-03-05 03:21:24	2022-03-05 03:21:24	\N	92	29	5
77	2022-03-07 23:00:52	2022-03-07 23:00:52	\N	2	1	6
78	2022-03-07 23:00:55	2022-03-07 23:00:55	\N	3	2	6
79	2022-03-07 23:02:34	2022-03-07 23:02:34	\N	7	3	6
80	2022-03-07 23:02:37	2022-03-07 23:02:37	\N	11	4	6
81	2022-03-07 23:02:40	2022-03-07 23:02:40	\N	15	5	6
82	2022-03-07 23:02:43	2022-03-07 23:02:43	\N	19	6	6
83	2022-03-07 23:02:44	2022-03-07 23:02:44	\N	23	7	6
84	2022-03-07 23:02:46	2022-03-07 23:02:46	\N	27	8	6
85	2022-03-07 23:02:47	2022-03-07 23:02:47	\N	31	9	6
86	2022-03-07 23:02:50	2022-03-07 23:02:50	\N	35	10	6
87	2022-03-07 23:02:52	2022-03-07 23:02:52	\N	39	11	6
88	2022-03-07 23:02:54	2022-03-07 23:02:54	\N	93	29	6
89	2022-03-08 04:12:23	2022-03-08 04:12:23	\N	2	1	7
90	2022-03-08 04:12:36	2022-03-08 04:12:36	\N	4	2	7
91	2022-03-08 04:12:53	2022-03-08 04:12:53	\N	41	12	7
92	2022-03-08 04:13:02	2022-03-08 04:13:02	\N	45	13	7
93	2022-03-08 04:13:10	2022-03-08 04:13:10	\N	47	14	7
94	2022-03-08 04:13:36	2022-03-08 04:13:36	\N	50	15	7
95	2022-03-08 04:13:49	2022-03-08 04:13:49	\N	53	16	7
96	2022-03-08 04:13:54	2022-03-08 04:13:54	\N	56	17	7
97	2022-03-08 04:14:00	2022-03-08 04:14:00	\N	59	18	7
98	2022-03-08 04:14:06	2022-03-08 04:14:06	\N	62	19	7
99	2022-03-08 04:14:10	2022-03-08 04:14:10	\N	65	20	7
100	2022-03-08 04:14:16	2022-03-08 04:14:16	\N	68	21	7
101	2022-03-08 04:14:21	2022-03-08 04:14:21	\N	71	22	7
102	2022-03-08 04:14:28	2022-03-08 04:14:28	\N	74	23	7
103	2022-03-08 04:14:35	2022-03-08 04:14:35	\N	77	24	7
104	2022-03-08 04:14:40	2022-03-08 04:14:40	\N	80	25	7
105	2022-03-08 04:14:45	2022-03-08 04:14:45	\N	83	26	7
106	2022-03-08 04:14:50	2022-03-08 04:14:50	\N	86	27	7
107	2022-03-08 04:15:36	2022-03-08 04:15:36	\N	89	28	7
108	2022-03-08 04:15:51	2022-03-08 04:15:51	\N	92	29	7
109	2022-03-10 15:04:02	2022-03-10 15:04:02	\N	1	1	8
110	2022-03-10 15:10:54	2022-03-10 15:10:54	\N	3	2	8
111	2022-03-10 15:11:42	2022-03-10 15:11:42	\N	6	3	8
112	2022-03-10 15:11:46	2022-03-10 15:11:46	\N	10	4	8
113	2022-03-10 15:11:50	2022-03-10 15:11:50	\N	15	5	8
114	2022-03-10 15:11:53	2022-03-10 15:11:53	\N	17	6	8
115	2022-03-10 15:11:57	2022-03-10 15:11:57	\N	23	7	8
116	2022-03-10 15:12:01	2022-03-10 15:12:01	\N	27	8	8
117	2022-03-10 15:12:04	2022-03-10 15:12:04	\N	31	9	8
118	2022-03-10 15:12:24	2022-03-10 15:12:24	\N	33	10	8
119	2022-03-10 15:14:12	2022-03-10 15:14:12	\N	38	11	8
120	2022-03-10 15:14:34	2022-03-10 15:14:34	\N	92	29	8
121	2022-03-11 21:52:17	2022-03-11 21:52:17	\N	2	1	9
122	2022-03-11 21:52:19	2022-03-11 21:52:19	\N	4	2	9
123	2022-03-11 21:55:19	2022-03-11 21:55:19	\N	42	12	9
124	2022-03-11 21:55:36	2022-03-11 21:55:36	\N	44	13	9
125	2022-03-11 21:55:50	2022-03-11 21:55:50	\N	48	14	9
126	2022-03-11 21:55:55	2022-03-11 21:55:55	\N	51	15	9
127	2022-03-11 21:56:11	2022-03-11 21:56:11	\N	53	16	9
128	2022-03-11 21:56:24	2022-03-11 21:56:24	\N	56	17	9
129	2022-03-11 21:56:43	2022-03-11 21:56:43	\N	59	18	9
130	2022-03-11 21:56:55	2022-03-11 21:56:55	\N	63	19	9
131	2022-03-11 21:57:07	2022-03-11 21:57:07	\N	65	20	9
132	2022-03-11 21:57:21	2022-03-11 21:57:21	\N	68	21	9
133	2022-03-11 21:57:32	2022-03-11 21:57:32	\N	71	22	9
134	2022-03-11 21:57:36	2022-03-11 21:57:36	\N	74	23	9
135	2022-03-11 21:58:07	2022-03-11 21:58:07	\N	78	24	9
136	2022-03-11 21:58:20	2022-03-11 21:58:20	\N	81	25	9
137	2022-03-11 21:58:33	2022-03-11 21:58:33	\N	84	26	9
138	2022-03-11 21:58:47	2022-03-11 21:58:47	\N	87	27	9
139	2022-03-11 21:59:01	2022-03-11 21:59:01	\N	90	28	9
140	2022-03-11 21:59:11	2022-03-11 21:59:11	\N	93	29	9
141	2022-03-11 22:00:57	2022-03-11 22:00:57	\N	1	1	10
142	2022-03-11 22:00:59	2022-03-11 22:00:59	\N	4	2	10
143	2022-03-11 22:01:03	2022-03-11 22:01:03	\N	7	3	10
144	2022-03-11 22:01:04	2022-03-11 22:01:04	\N	11	4	10
145	2022-03-11 22:01:06	2022-03-11 22:01:06	\N	15	5	10
146	2022-03-11 22:01:08	2022-03-11 22:01:08	\N	19	6	10
147	2022-03-11 22:01:10	2022-03-11 22:01:10	\N	23	7	10
148	2022-03-11 22:01:12	2022-03-11 22:01:12	\N	27	8	10
149	2022-03-11 22:01:13	2022-03-11 22:01:13	\N	30	9	10
150	2022-03-11 22:01:15	2022-03-11 22:01:15	\N	34	10	10
151	2022-03-11 22:01:17	2022-03-11 22:01:17	\N	39	11	10
152	2022-03-11 22:02:11	2022-03-11 22:02:11	\N	93	29	10
153	2022-03-11 22:10:45	2022-03-11 22:10:45	\N	1	1	11
154	2022-03-11 22:10:47	2022-03-11 22:10:47	\N	4	2	11
155	2022-03-11 22:10:49	2022-03-11 22:10:49	\N	5	3	11
156	2022-03-11 22:10:51	2022-03-11 22:10:51	\N	9	4	11
157	2022-03-11 22:10:52	2022-03-11 22:10:52	\N	13	5	11
158	2022-03-11 22:10:54	2022-03-11 22:10:54	\N	17	6	11
159	2022-03-11 22:10:56	2022-03-11 22:10:56	\N	21	7	11
160	2022-03-11 22:10:57	2022-03-11 22:10:57	\N	25	8	11
161	2022-03-11 22:10:59	2022-03-11 22:10:59	\N	29	9	11
162	2022-03-11 22:11:01	2022-03-11 22:11:01	\N	33	10	11
163	2022-03-11 22:11:06	2022-03-11 22:11:06	\N	37	11	11
164	2022-03-11 22:11:34	2022-03-11 22:11:34	\N	92	29	11
165	2022-03-11 22:32:36	2022-03-11 22:32:36	\N	2	1	12
166	2022-03-11 22:32:38	2022-03-11 22:32:38	\N	4	2	12
167	2022-03-11 22:32:42	2022-03-11 22:32:42	\N	42	12	12
168	2022-03-11 22:32:43	2022-03-11 22:32:43	\N	45	13	12
169	2022-03-11 22:32:49	2022-03-11 22:32:49	\N	48	14	12
170	2022-03-11 22:32:51	2022-03-11 22:32:51	\N	51	15	12
171	2022-03-11 22:32:53	2022-03-11 22:32:53	\N	54	16	12
172	2022-03-11 22:32:54	2022-03-11 22:32:54	\N	57	17	12
173	2022-03-11 22:32:56	2022-03-11 22:32:56	\N	61	18	12
174	2022-03-11 22:32:57	2022-03-11 22:32:57	\N	62	19	12
175	2022-03-11 22:32:59	2022-03-11 22:32:59	\N	67	20	12
176	2022-03-11 22:33:01	2022-03-11 22:33:01	\N	69	21	12
177	2022-03-11 22:33:02	2022-03-11 22:33:02	\N	73	22	12
178	2022-03-11 22:33:04	2022-03-11 22:33:04	\N	75	23	12
179	2022-03-11 22:33:06	2022-03-11 22:33:06	\N	79	24	12
180	2022-03-11 22:33:08	2022-03-11 22:33:08	\N	81	25	12
181	2022-03-11 22:33:10	2022-03-11 22:33:10	\N	84	26	12
182	2022-03-11 22:33:12	2022-03-11 22:33:12	\N	87	27	12
183	2022-03-11 22:33:14	2022-03-11 22:33:14	\N	89	28	12
184	2022-03-11 22:33:16	2022-03-11 22:33:16	\N	93	29	12
185	2022-03-12 22:30:31	2022-03-12 22:30:31	\N	1	1	13
186	2022-03-12 22:30:33	2022-03-12 22:30:33	\N	3	2	13
187	2022-03-12 22:30:36	2022-03-12 22:30:36	\N	8	3	13
188	2022-03-12 22:30:37	2022-03-12 22:30:37	\N	12	4	13
189	2022-03-12 22:30:39	2022-03-12 22:30:39	\N	16	5	13
190	2022-03-12 22:30:41	2022-03-12 22:30:41	\N	20	6	13
191	2022-03-12 22:30:43	2022-03-12 22:30:43	\N	24	7	13
192	2022-03-12 22:30:45	2022-03-12 22:30:45	\N	28	8	13
193	2022-03-12 22:30:46	2022-03-12 22:30:46	\N	32	9	13
194	2022-03-12 22:30:48	2022-03-12 22:30:48	\N	36	10	13
195	2022-03-12 22:30:50	2022-03-12 22:30:50	\N	40	11	13
196	2022-03-12 22:30:53	2022-03-12 22:30:53	\N	93	29	13
197	2022-03-12 22:32:52	2022-03-12 22:32:52	\N	1	1	14
198	2022-03-12 22:32:54	2022-03-12 22:32:54	\N	3	2	14
199	2022-03-12 22:32:57	2022-03-12 22:32:57	\N	7	3	14
200	2022-03-12 22:32:59	2022-03-12 22:32:59	\N	12	4	14
201	2022-03-12 22:33:00	2022-03-12 22:33:00	\N	16	5	14
202	2022-03-12 22:33:02	2022-03-12 22:33:02	\N	20	6	14
203	2022-03-12 22:33:04	2022-03-12 22:33:04	\N	24	7	14
204	2022-03-12 22:33:06	2022-03-12 22:33:06	\N	28	8	14
205	2022-03-12 22:33:07	2022-03-12 22:33:07	\N	32	9	14
206	2022-03-12 22:33:09	2022-03-12 22:33:09	\N	36	10	14
207	2022-03-12 22:33:13	2022-03-12 22:33:13	\N	37	11	14
208	2022-03-12 22:33:14	2022-03-12 22:33:14	\N	93	29	14
209	2022-03-15 03:27:53	2022-03-15 03:27:53	\N	1	1	15
210	2022-03-15 03:27:57	2022-03-15 03:27:57	\N	4	2	15
211	2022-03-15 03:28:02	2022-03-15 03:28:02	\N	6	3	15
212	2022-03-15 03:28:05	2022-03-15 03:28:05	\N	11	4	15
213	2022-03-15 03:28:09	2022-03-15 03:28:09	\N	14	5	15
214	2022-03-15 03:28:14	2022-03-15 03:28:14	\N	19	6	15
215	2022-03-15 03:28:19	2022-03-15 03:28:19	\N	22	7	15
216	2022-03-15 03:29:03	2022-03-15 03:29:03	\N	26	8	15
217	2022-03-15 03:29:08	2022-03-15 03:29:08	\N	32	9	15
218	2022-03-15 03:29:12	2022-03-15 03:29:12	\N	35	10	15
219	2022-03-15 03:29:15	2022-03-15 03:29:15	\N	39	11	15
220	2022-03-15 03:29:17	2022-03-15 03:29:17	\N	93	29	15
221	2022-03-15 03:35:52	2022-03-15 03:35:52	\N	2	1	16
222	2022-03-15 03:35:56	2022-03-15 03:35:56	\N	3	2	16
223	2022-03-15 03:35:58	2022-03-15 03:35:58	\N	7	3	16
224	2022-03-15 03:36:01	2022-03-15 03:36:01	\N	11	4	16
225	2022-03-15 03:36:05	2022-03-15 03:36:05	\N	14	5	16
226	2022-03-15 03:36:09	2022-03-15 03:36:09	\N	20	6	16
227	2022-03-15 03:36:12	2022-03-15 03:36:12	\N	24	7	16
228	2022-03-15 03:36:18	2022-03-15 03:36:18	\N	28	8	16
229	2022-03-15 03:36:25	2022-03-15 03:36:25	\N	32	9	16
230	2022-03-15 03:36:37	2022-03-15 03:36:37	\N	36	10	16
231	2022-03-15 03:36:40	2022-03-15 03:36:40	\N	40	11	16
232	2022-03-15 03:36:41	2022-03-15 03:36:41	\N	92	29	16
233	2022-03-15 20:08:55	2022-03-15 20:08:55	\N	1	1	17
234	2022-03-15 20:09:29	2022-03-15 20:09:29	\N	4	2	17
235	2022-03-15 20:09:59	2022-03-15 20:09:59	\N	5	3	17
236	2022-03-15 21:48:09	2022-03-15 21:48:09	\N	9	4	17
237	2022-03-15 21:48:42	2022-03-15 21:48:42	\N	14	5	17
238	2022-03-15 21:49:05	2022-03-15 21:49:05	\N	19	6	17
239	2022-03-15 21:49:18	2022-03-15 21:49:18	\N	22	7	17
240	2022-03-15 21:49:27	2022-03-15 21:49:27	\N	26	8	17
241	2022-03-15 21:49:44	2022-03-15 21:49:44	\N	30	9	17
242	2022-03-15 21:50:36	2022-03-15 21:50:36	\N	34	10	17
243	2022-03-15 21:50:51	2022-03-15 21:50:51	\N	37	11	17
244	2022-03-15 21:50:57	2022-03-15 21:50:57	\N	93	29	17
245	2022-03-16 00:25:50	2022-03-16 00:25:50	\N	2	1	19
246	2022-03-16 00:25:54	2022-03-16 00:25:54	\N	4	2	19
247	2022-03-16 00:25:59	2022-03-16 00:25:59	\N	43	12	19
248	2022-03-16 00:26:01	2022-03-16 00:26:01	\N	46	13	19
249	2022-03-16 00:26:05	2022-03-16 00:26:05	\N	49	14	19
250	2022-03-16 00:26:09	2022-03-16 00:26:09	\N	52	15	19
251	2022-03-16 00:26:12	2022-03-16 00:26:12	\N	54	16	19
252	2022-03-16 00:26:16	2022-03-16 00:26:16	\N	57	17	19
253	2022-03-16 00:26:21	2022-03-16 00:26:21	\N	59	18	19
254	2022-03-16 00:26:25	2022-03-16 00:26:25	\N	62	19	19
255	2022-03-16 00:26:31	2022-03-16 00:26:31	\N	66	20	19
256	2022-03-16 00:26:37	2022-03-16 00:26:37	\N	70	21	19
257	2022-03-16 00:26:40	2022-03-16 00:26:40	\N	72	22	19
258	2022-03-16 00:26:44	2022-03-16 00:26:44	\N	74	23	19
259	2022-03-16 00:26:49	2022-03-16 00:26:49	\N	79	24	19
260	2022-03-16 00:26:53	2022-03-16 00:26:53	\N	82	25	19
261	2022-03-16 00:26:56	2022-03-16 00:26:56	\N	84	26	19
262	2022-03-16 00:27:03	2022-03-16 00:27:03	\N	86	27	19
263	2022-03-16 00:27:10	2022-03-16 00:27:10	\N	91	28	19
264	2022-03-16 00:27:14	2022-03-16 00:27:14	\N	93	29	19
265	2022-03-18 02:05:59	2022-03-18 02:05:59	\N	1	1	20
266	2022-03-18 02:06:03	2022-03-18 02:06:03	\N	3	2	20
267	2022-03-18 02:06:13	2022-03-18 02:06:13	\N	6	3	20
268	2022-03-18 02:06:15	2022-03-18 02:06:15	\N	10	4	20
269	2022-03-18 02:06:21	2022-03-18 02:06:21	\N	14	5	20
270	2022-03-18 02:06:25	2022-03-18 02:06:25	\N	19	6	20
271	2022-03-18 02:06:34	2022-03-18 02:06:34	\N	22	7	20
272	2022-03-18 02:06:39	2022-03-18 02:06:39	\N	28	8	20
273	2022-03-18 02:06:43	2022-03-18 02:06:43	\N	29	9	20
274	2022-03-18 02:06:47	2022-03-18 02:06:47	\N	33	10	20
275	2022-03-18 02:06:52	2022-03-18 02:06:52	\N	39	11	20
276	2022-03-18 02:06:54	2022-03-18 02:06:54	\N	93	29	20
277	2022-03-18 02:38:12	2022-03-18 02:38:12	\N	1	1	21
278	2022-03-18 02:38:18	2022-03-18 02:38:18	\N	4	2	21
279	2022-03-18 02:38:21	2022-03-18 02:38:21	\N	7	3	21
280	2022-03-18 02:38:27	2022-03-18 02:38:27	\N	10	4	21
281	2022-03-18 02:38:30	2022-03-18 02:38:30	\N	15	5	21
282	2022-03-18 02:38:41	2022-03-18 02:38:41	\N	18	6	21
283	2022-03-18 02:38:45	2022-03-18 02:38:45	\N	23	7	21
284	2022-03-18 02:38:50	2022-03-18 02:38:50	\N	25	8	21
285	2022-03-18 02:38:54	2022-03-18 02:38:54	\N	32	9	21
286	2022-03-18 02:38:58	2022-03-18 02:38:58	\N	34	10	21
287	2022-03-18 02:39:02	2022-03-18 02:39:02	\N	39	11	21
288	2022-03-18 02:39:05	2022-03-18 02:39:05	\N	92	29	21
289	2022-03-18 02:36:59	2022-03-18 02:36:59	\N	2	1	22
290	2022-03-18 02:37:06	2022-03-18 02:37:06	\N	4	2	22
291	2022-03-18 02:37:17	2022-03-18 02:37:17	\N	41	12	22
292	2022-03-18 02:37:30	2022-03-18 02:37:30	\N	44	13	22
293	2022-03-18 02:37:40	2022-03-18 02:37:40	\N	47	14	22
294	2022-03-18 02:37:50	2022-03-18 02:37:50	\N	50	15	22
295	2022-03-18 02:38:03	2022-03-18 02:38:03	\N	53	16	22
296	2022-03-18 02:38:08	2022-03-18 02:38:08	\N	56	17	22
297	2022-03-18 02:38:15	2022-03-18 02:38:15	\N	59	18	22
298	2022-03-18 02:38:22	2022-03-18 02:38:22	\N	62	19	22
299	2022-03-18 02:38:26	2022-03-18 02:38:26	\N	65	20	22
300	2022-03-18 02:38:34	2022-03-18 02:38:34	\N	68	21	22
301	2022-03-18 02:38:38	2022-03-18 02:38:38	\N	71	22	22
302	2022-03-18 02:38:43	2022-03-18 02:38:43	\N	74	23	22
303	2022-03-18 02:38:51	2022-03-18 02:38:51	\N	77	24	22
304	2022-03-18 02:38:57	2022-03-18 02:38:57	\N	80	25	22
305	2022-03-18 02:39:01	2022-03-18 02:39:01	\N	83	26	22
306	2022-03-18 02:39:07	2022-03-18 02:39:07	\N	86	27	22
307	2022-03-18 02:39:12	2022-03-18 02:39:12	\N	89	28	22
308	2022-03-18 02:39:15	2022-03-18 02:39:15	\N	93	29	22
309	2022-03-18 02:48:55	2022-03-18 02:48:55	\N	1	1	23
310	2022-03-18 02:48:58	2022-03-18 02:48:58	\N	4	2	23
311	2022-03-18 02:49:02	2022-03-18 02:49:02	\N	6	3	23
312	2022-03-18 02:49:05	2022-03-18 02:49:05	\N	11	4	23
313	2022-03-18 02:49:09	2022-03-18 02:49:09	\N	16	5	23
314	2022-03-18 02:49:14	2022-03-18 02:49:14	\N	18	6	23
315	2022-03-18 02:49:18	2022-03-18 02:49:18	\N	22	7	23
316	2022-03-18 02:49:23	2022-03-18 02:49:23	\N	27	8	23
317	2022-03-18 02:49:27	2022-03-18 02:49:27	\N	32	9	23
318	2022-03-18 02:49:31	2022-03-18 02:49:31	\N	35	10	23
319	2022-03-18 02:49:35	2022-03-18 02:49:35	\N	40	11	23
320	2022-03-18 02:49:37	2022-03-18 02:49:37	\N	92	29	23
321	2022-03-18 02:51:57	2022-03-18 02:51:57	\N	1	1	24
322	2022-03-18 02:52:00	2022-03-18 02:52:00	\N	4	2	24
323	2022-03-18 02:52:03	2022-03-18 02:52:03	\N	6	3	24
324	2022-03-18 02:52:06	2022-03-18 02:52:06	\N	11	4	24
325	2022-03-18 02:52:11	2022-03-18 02:52:11	\N	14	5	24
326	2022-03-18 02:52:13	2022-03-18 02:52:13	\N	19	6	24
327	2022-03-18 02:52:17	2022-03-18 02:52:17	\N	24	7	24
328	2022-03-18 02:52:20	2022-03-18 02:52:20	\N	28	8	24
329	2022-03-18 02:52:24	2022-03-18 02:52:24	\N	32	9	24
330	2022-03-18 02:52:28	2022-03-18 02:52:28	\N	36	10	24
331	2022-03-18 02:52:32	2022-03-18 02:52:32	\N	40	11	24
332	2022-03-18 02:52:34	2022-03-18 02:52:34	\N	93	29	24
333	2022-03-18 02:54:35	2022-03-18 02:54:35	\N	1	1	25
334	2022-03-18 02:54:52	2022-03-18 02:54:52	\N	3	2	25
335	2022-03-18 02:55:00	2022-03-18 02:55:00	\N	7	3	25
336	2022-03-18 02:55:04	2022-03-18 02:55:04	\N	11	4	25
337	2022-03-18 02:55:10	2022-03-18 02:55:10	\N	15	5	25
338	2022-03-18 02:55:13	2022-03-18 02:55:13	\N	19	6	25
339	2022-03-18 02:55:18	2022-03-18 02:55:18	\N	22	7	25
340	2022-03-18 02:55:23	2022-03-18 02:55:23	\N	26	8	25
341	2022-03-18 02:55:27	2022-03-18 02:55:27	\N	31	9	25
342	2022-03-18 02:55:31	2022-03-18 02:55:31	\N	34	10	25
343	2022-03-18 02:55:35	2022-03-18 02:55:35	\N	40	11	25
344	2022-03-18 02:55:36	2022-03-18 02:55:36	\N	92	29	25
345	2022-03-18 16:57:15	2022-03-18 16:57:15	\N	2	1	26
346	2022-03-18 16:57:22	2022-03-18 16:57:22	\N	4	2	26
347	2022-03-18 16:57:46	2022-03-18 16:57:46	\N	41	12	26
348	2022-03-18 16:57:54	2022-03-18 16:57:54	\N	44	13	26
349	2022-03-18 16:58:01	2022-03-18 16:58:01	\N	47	14	26
350	2022-03-18 16:58:10	2022-03-18 16:58:10	\N	50	15	26
351	2022-03-18 16:58:17	2022-03-18 16:58:17	\N	53	16	26
352	2022-03-18 16:58:22	2022-03-18 16:58:22	\N	56	17	26
353	2022-03-18 16:58:28	2022-03-18 16:58:28	\N	59	18	26
354	2022-03-18 16:58:33	2022-03-18 16:58:33	\N	62	19	26
355	2022-03-18 16:58:38	2022-03-18 16:58:38	\N	65	20	26
356	2022-03-18 16:58:44	2022-03-18 16:58:44	\N	68	21	26
357	2022-03-18 16:58:49	2022-03-18 16:58:49	\N	71	22	26
358	2022-03-18 16:59:00	2022-03-18 16:59:00	\N	74	23	26
359	2022-03-18 16:59:10	2022-03-18 16:59:10	\N	79	24	26
360	2022-03-18 16:59:14	2022-03-18 16:59:14	\N	80	25	26
361	2022-03-18 16:59:21	2022-03-18 16:59:21	\N	83	26	26
362	2022-03-18 16:59:29	2022-03-18 16:59:29	\N	86	27	26
363	2022-03-18 16:59:34	2022-03-18 16:59:34	\N	89	28	26
364	2022-03-18 16:59:37	2022-03-18 16:59:37	\N	93	29	26
365	2022-03-18 16:48:19	2022-03-18 16:48:19	\N	1	1	27
366	2022-03-18 16:48:30	2022-03-18 16:48:30	\N	4	2	27
367	2022-03-18 16:48:46	2022-03-18 16:48:46	\N	5	3	27
368	2022-03-18 16:48:52	2022-03-18 16:48:52	\N	9	4	27
369	2022-03-18 16:49:01	2022-03-18 16:49:01	\N	14	5	27
370	2022-03-18 16:49:18	2022-03-18 16:49:18	\N	18	6	27
371	2022-03-18 16:49:22	2022-03-18 16:49:22	\N	21	7	27
372	2022-03-18 16:49:31	2022-03-18 16:49:31	\N	26	8	27
373	2022-03-18 16:49:36	2022-03-18 16:49:36	\N	30	9	27
374	2022-03-18 16:49:54	2022-03-18 16:49:54	\N	34	10	27
375	2022-03-18 16:50:02	2022-03-18 16:50:02	\N	37	11	27
376	2022-03-18 16:50:06	2022-03-18 16:50:06	\N	93	29	27
377	2022-03-18 16:48:00	2022-03-18 16:48:00	\N	2	1	28
378	2022-03-18 16:48:10	2022-03-18 16:48:10	\N	4	2	28
379	2022-03-18 16:48:22	2022-03-18 16:48:22	\N	42	12	28
380	2022-03-18 16:48:28	2022-03-18 16:48:28	\N	45	13	28
381	2022-03-18 16:48:36	2022-03-18 16:48:36	\N	47	14	28
382	2022-03-18 16:48:44	2022-03-18 16:48:44	\N	50	15	28
383	2022-03-18 16:48:55	2022-03-18 16:48:55	\N	53	16	28
384	2022-03-18 16:49:00	2022-03-18 16:49:00	\N	56	17	28
385	2022-03-18 16:49:07	2022-03-18 16:49:07	\N	60	18	28
386	2022-03-18 16:49:21	2022-03-18 16:49:21	\N	62	19	28
387	2022-03-18 16:49:29	2022-03-18 16:49:29	\N	66	20	28
388	2022-03-18 16:49:35	2022-03-18 16:49:35	\N	68	21	28
389	2022-03-18 16:49:42	2022-03-18 16:49:42	\N	71	22	28
390	2022-03-18 16:49:49	2022-03-18 16:49:49	\N	74	23	28
391	2022-03-18 16:49:55	2022-03-18 16:49:55	\N	78	24	28
392	2022-03-18 16:50:02	2022-03-18 16:50:02	\N	81	25	28
393	2022-03-18 16:50:11	2022-03-18 16:50:11	\N	84	26	28
394	2022-03-18 16:50:17	2022-03-18 16:50:17	\N	86	27	28
395	2022-03-18 16:50:29	2022-03-18 16:50:29	\N	90	28	28
396	2022-03-18 16:50:33	2022-03-18 16:50:33	\N	93	29	28
397	2022-03-18 16:47:30	2022-03-18 16:47:30	\N	1	1	29
398	2022-03-18 16:48:12	2022-03-18 16:48:12	\N	3	2	29
399	2022-03-18 16:48:26	2022-03-18 16:48:26	\N	8	3	29
400	2022-03-18 16:48:35	2022-03-18 16:48:35	\N	12	4	29
401	2022-03-18 16:48:41	2022-03-18 16:48:41	\N	15	5	29
402	2022-03-18 16:49:00	2022-03-18 16:49:00	\N	18	6	29
403	2022-03-18 16:49:11	2022-03-18 16:49:11	\N	24	7	29
404	2022-03-18 16:49:18	2022-03-18 16:49:18	\N	26	8	29
405	2022-03-18 16:49:25	2022-03-18 16:49:25	\N	32	9	29
406	2022-03-18 16:50:27	2022-03-18 16:50:27	\N	34	10	29
407	2022-03-18 16:50:43	2022-03-18 16:50:43	\N	37	11	29
408	2022-03-18 16:50:46	2022-03-18 16:50:46	\N	93	29	29
409	2022-03-18 16:48:10	2022-03-18 16:48:10	\N	1	1	30
410	2022-03-18 16:48:19	2022-03-18 16:48:19	\N	4	2	30
411	2022-03-18 16:48:35	2022-03-18 16:48:35	\N	5	3	30
412	2022-03-18 16:48:41	2022-03-18 16:48:41	\N	10	4	30
413	2022-03-18 16:48:49	2022-03-18 16:48:49	\N	15	5	30
414	2022-03-18 16:49:06	2022-03-18 16:49:06	\N	19	6	30
415	2022-03-18 16:49:51	2022-03-18 16:49:51	\N	22	7	30
416	2022-03-18 16:49:58	2022-03-18 16:49:58	\N	25	8	30
417	2022-03-18 16:50:05	2022-03-18 16:50:05	\N	30	9	30
418	2022-03-18 16:50:14	2022-03-18 16:50:14	\N	33	10	30
419	2022-03-18 16:50:40	2022-03-18 16:50:40	\N	37	11	30
420	2022-03-18 16:50:59	2022-03-18 16:50:59	\N	93	29	30
421	2022-03-18 16:53:27	2022-03-18 16:53:27	\N	1	1	31
422	2022-03-18 16:54:08	2022-03-18 16:54:08	\N	3	2	31
423	2022-03-18 16:54:31	2022-03-18 16:54:31	\N	6	3	31
424	2022-03-18 16:54:43	2022-03-18 16:54:43	\N	10	4	31
425	2022-03-18 16:55:08	2022-03-18 16:55:08	\N	13	5	31
426	2022-03-18 16:55:15	2022-03-18 16:55:15	\N	19	6	31
427	2022-03-18 16:55:21	2022-03-18 16:55:21	\N	23	7	31
428	2022-03-18 16:56:20	2022-03-18 16:56:20	\N	26	8	31
429	2022-03-18 16:56:28	2022-03-18 16:56:28	\N	30	9	31
430	2022-03-18 16:57:23	2022-03-18 16:57:23	\N	33	10	31
431	2022-03-18 16:57:29	2022-03-18 16:57:29	\N	37	11	31
432	2022-03-18 16:57:32	2022-03-18 16:57:32	\N	92	29	31
433	2022-03-18 16:57:08	2022-03-18 16:57:08	\N	1	1	32
434	2022-03-18 16:57:17	2022-03-18 16:57:17	\N	4	2	32
435	2022-03-18 16:57:30	2022-03-18 16:57:30	\N	5	3	32
436	2022-03-18 16:57:48	2022-03-18 16:57:48	\N	10	4	32
437	2022-03-18 16:57:59	2022-03-18 16:57:59	\N	13	5	32
438	2022-03-18 16:58:06	2022-03-18 16:58:06	\N	18	6	32
439	2022-03-18 16:58:15	2022-03-18 16:58:15	\N	22	7	32
440	2022-03-18 16:58:23	2022-03-18 16:58:23	\N	25	8	32
441	2022-03-18 16:58:32	2022-03-18 16:58:32	\N	29	9	32
442	2022-03-18 16:58:43	2022-03-18 16:58:43	\N	33	10	32
443	2022-03-18 16:58:51	2022-03-18 16:58:51	\N	37	11	32
444	2022-03-18 16:58:57	2022-03-18 16:58:57	\N	92	29	32
445	2022-03-18 17:00:08	2022-03-18 17:00:08	\N	2	1	33
446	2022-03-18 17:00:11	2022-03-18 17:00:11	\N	4	2	33
447	2022-03-18 17:00:16	2022-03-18 17:00:16	\N	42	12	33
448	2022-03-18 17:00:20	2022-03-18 17:00:20	\N	45	13	33
449	2022-03-18 17:00:24	2022-03-18 17:00:24	\N	48	14	33
450	2022-03-18 17:00:28	2022-03-18 17:00:28	\N	51	15	33
451	2022-03-18 17:00:32	2022-03-18 17:00:32	\N	54	16	33
452	2022-03-18 17:00:35	2022-03-18 17:00:35	\N	57	17	33
453	2022-03-18 17:00:38	2022-03-18 17:00:38	\N	59	18	33
454	2022-03-18 17:00:42	2022-03-18 17:00:42	\N	62	19	33
455	2022-03-18 17:00:46	2022-03-18 17:00:46	\N	65	20	33
456	2022-03-18 17:00:50	2022-03-18 17:00:50	\N	68	21	33
457	2022-03-18 17:00:54	2022-03-18 17:00:54	\N	71	22	33
458	2022-03-18 17:00:58	2022-03-18 17:00:58	\N	76	23	33
459	2022-03-18 17:01:02	2022-03-18 17:01:02	\N	79	24	33
460	2022-03-18 17:01:07	2022-03-18 17:01:07	\N	82	25	33
461	2022-03-18 17:01:11	2022-03-18 17:01:11	\N	85	26	33
462	2022-03-18 17:01:14	2022-03-18 17:01:14	\N	88	27	33
463	2022-03-18 17:01:19	2022-03-18 17:01:19	\N	91	28	33
464	2022-03-18 17:01:20	2022-03-18 17:01:20	\N	93	29	33
465	2022-03-18 18:15:32	2022-03-18 18:15:32	\N	1	1	34
466	2022-03-18 18:15:35	2022-03-18 18:15:35	\N	3	2	34
467	2022-03-18 18:15:40	2022-03-18 18:15:40	\N	7	3	34
468	2022-03-18 18:15:43	2022-03-18 18:15:43	\N	10	4	34
469	2022-03-18 18:15:46	2022-03-18 18:15:46	\N	14	5	34
470	2022-03-18 18:15:49	2022-03-18 18:15:49	\N	20	6	34
471	2022-03-18 18:15:53	2022-03-18 18:15:53	\N	22	7	34
472	2022-03-18 18:15:56	2022-03-18 18:15:56	\N	27	8	34
473	2022-03-18 18:15:59	2022-03-18 18:15:59	\N	32	9	34
474	2022-03-18 18:16:04	2022-03-18 18:16:04	\N	34	10	34
475	2022-03-18 18:16:07	2022-03-18 18:16:07	\N	39	11	34
476	2022-03-18 18:16:08	2022-03-18 18:16:08	\N	93	29	34
477	2022-03-18 18:23:20	2022-03-18 18:23:20	\N	1	1	35
478	2022-03-18 18:23:34	2022-03-18 18:23:34	\N	4	2	35
479	2022-03-18 18:23:38	2022-03-18 18:23:38	\N	6	3	35
480	2022-03-18 18:23:42	2022-03-18 18:23:42	\N	11	4	35
481	2022-03-18 18:23:46	2022-03-18 18:23:46	\N	15	5	35
482	2022-03-18 18:23:49	2022-03-18 18:23:49	\N	20	6	35
483	2022-03-18 18:23:53	2022-03-18 18:23:53	\N	23	7	35
484	2022-03-18 18:23:57	2022-03-18 18:23:57	\N	26	8	35
485	2022-03-18 18:24:02	2022-03-18 18:24:02	\N	30	9	35
486	2022-03-18 18:24:07	2022-03-18 18:24:07	\N	36	10	35
487	2022-03-18 18:24:11	2022-03-18 18:24:11	\N	39	11	35
488	2022-03-18 18:24:12	2022-03-18 18:24:12	\N	92	29	35
489	2022-03-18 19:29:26	2022-03-18 19:29:26	\N	2	1	36
490	2022-03-18 19:29:34	2022-03-18 19:29:34	\N	3	2	36
491	2022-03-18 19:29:45	2022-03-18 19:29:45	\N	6	3	36
492	2022-03-18 19:29:55	2022-03-18 19:29:55	\N	9	4	36
493	2022-03-18 19:30:05	2022-03-18 19:30:05	\N	13	5	36
494	2022-03-18 19:30:12	2022-03-18 19:30:12	\N	17	6	36
495	2022-03-18 19:30:19	2022-03-18 19:30:19	\N	22	7	36
496	2022-03-18 19:30:28	2022-03-18 19:30:28	\N	27	8	36
497	2022-03-18 19:30:36	2022-03-18 19:30:36	\N	31	9	36
498	2022-03-18 19:30:44	2022-03-18 19:30:44	\N	34	10	36
499	2022-03-18 19:30:52	2022-03-18 19:30:52	\N	37	11	36
500	2022-03-18 19:30:54	2022-03-18 19:30:54	\N	92	29	36
501	2022-03-18 19:29:25	2022-03-18 19:29:25	\N	1	1	37
502	2022-03-18 19:29:57	2022-03-18 19:29:57	\N	4	2	37
503	2022-03-18 19:30:13	2022-03-18 19:30:13	\N	5	3	37
504	2022-03-18 19:30:18	2022-03-18 19:30:18	\N	10	4	37
505	2022-03-18 19:30:21	2022-03-18 19:30:21	\N	14	5	37
506	2022-03-18 19:30:26	2022-03-18 19:30:26	\N	18	6	37
507	2022-03-18 19:30:30	2022-03-18 19:30:30	\N	23	7	37
508	2022-03-18 19:30:34	2022-03-18 19:30:34	\N	28	8	37
509	2022-03-18 19:30:39	2022-03-18 19:30:39	\N	30	9	37
510	2022-03-18 19:30:45	2022-03-18 19:30:45	\N	33	10	37
511	2022-03-18 19:30:49	2022-03-18 19:30:49	\N	38	11	37
512	2022-03-18 19:31:01	2022-03-18 19:31:01	\N	93	29	37
513	2022-03-18 19:29:50	2022-03-18 19:29:50	\N	1	1	38
514	2022-03-18 19:30:08	2022-03-18 19:30:08	\N	3	2	38
515	2022-03-18 19:30:19	2022-03-18 19:30:19	\N	6	3	38
516	2022-03-18 19:30:25	2022-03-18 19:30:25	\N	11	4	38
517	2022-03-18 19:30:30	2022-03-18 19:30:30	\N	16	5	38
518	2022-03-18 19:30:40	2022-03-18 19:30:40	\N	17	6	38
519	2022-03-18 19:31:03	2022-03-18 19:31:03	\N	22	7	38
520	2022-03-18 19:31:08	2022-03-18 19:31:08	\N	25	8	38
521	2022-03-18 19:31:11	2022-03-18 19:31:11	\N	29	9	38
522	2022-03-18 19:31:14	2022-03-18 19:31:14	\N	35	10	38
523	2022-03-18 19:31:18	2022-03-18 19:31:18	\N	37	11	38
524	2022-03-18 19:31:21	2022-03-18 19:31:21	\N	92	29	38
525	2022-03-18 21:38:05	2022-03-18 21:38:05	\N	2	1	39
526	2022-03-18 21:38:12	2022-03-18 21:38:12	\N	3	2	39
527	2022-03-18 21:38:40	2022-03-18 21:38:40	\N	6	3	39
528	2022-03-18 21:38:49	2022-03-18 21:38:49	\N	10	4	39
529	2022-03-18 21:39:07	2022-03-18 21:39:07	\N	13	5	39
530	2022-03-18 21:39:15	2022-03-18 21:39:15	\N	17	6	39
531	2022-03-18 21:39:27	2022-03-18 21:39:27	\N	22	7	39
532	2022-03-18 21:39:34	2022-03-18 21:39:34	\N	25	8	39
533	2022-03-18 21:39:42	2022-03-18 21:39:42	\N	29	9	39
534	2022-03-18 21:39:53	2022-03-18 21:39:53	\N	33	10	39
535	2022-03-18 21:39:59	2022-03-18 21:39:59	\N	37	11	39
536	2022-03-18 21:40:07	2022-03-18 21:40:07	\N	93	29	39
537	2022-03-18 21:39:22	2022-03-18 21:39:22	\N	1	1	40
538	2022-03-18 21:39:33	2022-03-18 21:39:33	\N	3	2	40
539	2022-03-18 21:39:52	2022-03-18 21:39:52	\N	7	3	40
540	2022-03-18 21:40:00	2022-03-18 21:40:00	\N	11	4	40
541	2022-03-18 21:40:23	2022-03-18 21:40:23	\N	16	5	40
542	2022-03-18 21:40:44	2022-03-18 21:40:44	\N	18	6	40
543	2022-03-18 21:41:07	2022-03-18 21:41:07	\N	21	7	40
544	2022-03-18 21:41:17	2022-03-18 21:41:17	\N	25	8	40
545	2022-03-18 21:41:32	2022-03-18 21:41:32	\N	30	9	40
546	2022-03-18 21:42:12	2022-03-18 21:42:12	\N	33	10	40
547	2022-03-18 21:42:23	2022-03-18 21:42:23	\N	38	11	40
548	2022-03-18 21:42:31	2022-03-18 21:42:31	\N	92	29	40
549	2022-03-18 21:39:02	2022-03-18 21:39:02	\N	2	1	41
550	2022-03-18 21:39:28	2022-03-18 21:39:28	\N	4	2	41
551	2022-03-18 21:39:37	2022-03-18 21:39:37	\N	42	12	41
552	2022-03-18 21:39:44	2022-03-18 21:39:44	\N	45	13	41
553	2022-03-18 21:39:55	2022-03-18 21:39:55	\N	48	14	41
554	2022-03-18 21:40:11	2022-03-18 21:40:11	\N	50	15	41
555	2022-03-18 21:40:17	2022-03-18 21:40:17	\N	54	16	41
556	2022-03-18 21:40:23	2022-03-18 21:40:23	\N	56	17	41
557	2022-03-18 21:40:45	2022-03-18 21:40:45	\N	60	18	41
558	2022-03-18 21:40:58	2022-03-18 21:40:58	\N	62	19	41
559	2022-03-18 21:41:04	2022-03-18 21:41:04	\N	66	20	41
560	2022-03-18 21:41:11	2022-03-18 21:41:11	\N	69	21	41
561	2022-03-18 21:41:23	2022-03-18 21:41:23	\N	72	22	41
562	2022-03-18 21:41:31	2022-03-18 21:41:31	\N	75	23	41
563	2022-03-18 21:41:42	2022-03-18 21:41:42	\N	79	24	41
564	2022-03-18 21:41:49	2022-03-18 21:41:49	\N	80	25	41
565	2022-03-18 21:42:03	2022-03-18 21:42:03	\N	84	26	41
566	2022-03-18 21:42:11	2022-03-18 21:42:11	\N	86	27	41
567	2022-03-18 21:42:23	2022-03-18 21:42:23	\N	89	28	41
568	2022-03-18 21:42:31	2022-03-18 21:42:31	\N	93	29	41
569	2022-03-18 21:40:55	2022-03-18 21:40:55	\N	1	1	42
570	2022-03-18 21:41:11	2022-03-18 21:41:11	\N	3	2	42
571	2022-03-18 21:41:53	2022-03-18 21:41:53	\N	6	3	42
572	2022-03-18 21:42:28	2022-03-18 21:42:28	\N	10	4	42
573	2022-03-18 21:42:40	2022-03-18 21:42:40	\N	13	5	42
574	2022-03-18 21:43:01	2022-03-18 21:43:01	\N	17	6	42
575	2022-03-18 21:43:18	2022-03-18 21:43:18	\N	22	7	42
576	2022-03-18 21:43:30	2022-03-18 21:43:30	\N	25	8	42
577	2022-03-18 21:43:40	2022-03-18 21:43:40	\N	29	9	42
578	2022-03-18 21:43:57	2022-03-18 21:43:57	\N	33	10	42
579	2022-03-18 21:44:08	2022-03-18 21:44:08	\N	37	11	42
580	2022-03-18 21:44:16	2022-03-18 21:44:16	\N	92	29	42
581	2022-03-18 21:41:21	2022-03-18 21:41:21	\N	2	1	43
582	2022-03-18 21:41:34	2022-03-18 21:41:34	\N	4	2	43
583	2022-03-18 21:41:48	2022-03-18 21:41:48	\N	41	12	43
584	2022-03-18 21:42:02	2022-03-18 21:42:02	\N	44	13	43
585	2022-03-18 21:42:16	2022-03-18 21:42:16	\N	47	14	43
586	2022-03-18 21:42:26	2022-03-18 21:42:26	\N	50	15	43
587	2022-03-18 21:42:36	2022-03-18 21:42:36	\N	53	16	43
588	2022-03-18 21:42:46	2022-03-18 21:42:46	\N	56	17	43
589	2022-03-18 21:42:54	2022-03-18 21:42:54	\N	59	18	43
590	2022-03-18 21:43:01	2022-03-18 21:43:01	\N	62	19	43
591	2022-03-18 21:43:07	2022-03-18 21:43:07	\N	65	20	43
592	2022-03-18 21:43:20	2022-03-18 21:43:20	\N	68	21	43
593	2022-03-18 21:43:27	2022-03-18 21:43:27	\N	71	22	43
594	2022-03-18 21:43:34	2022-03-18 21:43:34	\N	74	23	43
595	2022-03-18 21:43:49	2022-03-18 21:43:49	\N	78	24	43
596	2022-03-18 21:43:55	2022-03-18 21:43:55	\N	80	25	43
597	2022-03-18 21:44:03	2022-03-18 21:44:03	\N	83	26	43
598	2022-03-18 21:44:09	2022-03-18 21:44:09	\N	86	27	43
599	2022-03-18 21:44:16	2022-03-18 21:44:16	\N	89	28	43
600	2022-03-18 21:44:23	2022-03-18 21:44:23	\N	92	29	43
601	2022-03-18 21:39:55	2022-03-18 21:39:55	\N	2	1	44
602	2022-03-18 21:40:05	2022-03-18 21:40:05	\N	4	2	44
603	2022-03-18 21:40:29	2022-03-18 21:40:29	\N	41	12	44
604	2022-03-18 21:40:55	2022-03-18 21:40:55	\N	44	13	44
605	2022-03-18 21:41:09	2022-03-18 21:41:09	\N	47	14	44
606	2022-03-18 21:41:25	2022-03-18 21:41:25	\N	50	15	44
607	2022-03-18 21:41:55	2022-03-18 21:41:55	\N	53	16	44
608	2022-03-18 21:42:03	2022-03-18 21:42:03	\N	56	17	44
609	2022-03-18 21:42:18	2022-03-18 21:42:18	\N	60	18	44
610	2022-03-18 21:42:30	2022-03-18 21:42:30	\N	62	19	44
611	2022-03-18 21:42:39	2022-03-18 21:42:39	\N	65	20	44
612	2022-03-18 21:42:59	2022-03-18 21:42:59	\N	69	21	44
613	2022-03-18 21:43:14	2022-03-18 21:43:14	\N	71	22	44
614	2022-03-18 21:43:25	2022-03-18 21:43:25	\N	74	23	44
615	2022-03-18 21:43:42	2022-03-18 21:43:42	\N	79	24	44
616	2022-03-18 21:43:48	2022-03-18 21:43:48	\N	80	25	44
617	2022-03-18 21:44:04	2022-03-18 21:44:04	\N	83	26	44
618	2022-03-18 21:44:10	2022-03-18 21:44:10	\N	86	27	44
619	2022-03-18 21:44:19	2022-03-18 21:44:19	\N	89	28	44
620	2022-03-18 21:44:26	2022-03-18 21:44:26	\N	92	29	44
621	2022-03-18 21:42:01	2022-03-18 21:42:01	\N	1	1	45
622	2022-03-18 21:42:29	2022-03-18 21:42:29	\N	4	2	45
623	2022-03-18 21:42:45	2022-03-18 21:42:45	\N	5	3	45
624	2022-03-18 21:43:10	2022-03-18 21:43:10	\N	9	4	45
625	2022-03-18 21:43:42	2022-03-18 21:43:42	\N	13	5	45
626	2022-03-18 21:43:51	2022-03-18 21:43:51	\N	17	6	45
627	2022-03-18 21:43:57	2022-03-18 21:43:57	\N	21	7	45
628	2022-03-18 21:44:06	2022-03-18 21:44:06	\N	25	8	45
629	2022-03-18 21:44:19	2022-03-18 21:44:19	\N	29	9	45
630	2022-03-18 21:44:37	2022-03-18 21:44:37	\N	33	10	45
631	2022-03-18 21:44:52	2022-03-18 21:44:52	\N	37	11	45
632	2022-03-18 21:45:02	2022-03-18 21:45:02	\N	92	29	45
633	2022-03-18 21:42:46	2022-03-18 21:42:46	\N	2	1	46
634	2022-03-18 21:42:59	2022-03-18 21:42:59	\N	4	2	46
635	2022-03-18 21:43:08	2022-03-18 21:43:08	\N	42	12	46
636	2022-03-18 21:43:27	2022-03-18 21:43:27	\N	45	13	46
637	2022-03-18 21:43:35	2022-03-18 21:43:35	\N	48	14	46
638	2022-03-18 21:43:59	2022-03-18 21:43:59	\N	51	15	46
639	2022-03-18 21:44:09	2022-03-18 21:44:09	\N	54	16	46
640	2022-03-18 21:44:18	2022-03-18 21:44:18	\N	57	17	46
641	2022-03-18 21:44:26	2022-03-18 21:44:26	\N	60	18	46
642	2022-03-18 21:44:42	2022-03-18 21:44:42	\N	62	19	46
643	2022-03-18 21:44:50	2022-03-18 21:44:50	\N	66	20	46
644	2022-03-18 21:44:55	2022-03-18 21:44:55	\N	69	21	46
645	2022-03-18 21:45:06	2022-03-18 21:45:06	\N	72	22	46
646	2022-03-18 21:45:27	2022-03-18 21:45:27	\N	75	23	46
647	2022-03-18 21:45:37	2022-03-18 21:45:37	\N	78	24	46
648	2022-03-18 21:45:45	2022-03-18 21:45:45	\N	80	25	46
649	2022-03-18 21:45:57	2022-03-18 21:45:57	\N	84	26	46
650	2022-03-18 21:46:06	2022-03-18 21:46:06	\N	86	27	46
651	2022-03-18 21:46:27	2022-03-18 21:46:27	\N	90	28	46
652	2022-03-18 21:46:33	2022-03-18 21:46:33	\N	92	29	46
653	2022-03-18 21:46:25	2022-03-18 21:46:25	\N	1	1	47
654	2022-03-18 21:46:32	2022-03-18 21:46:32	\N	4	2	47
655	2022-03-18 21:46:53	2022-03-18 21:46:53	\N	6	3	47
656	2022-03-18 21:47:06	2022-03-18 21:47:06	\N	10	4	47
657	2022-03-18 21:47:13	2022-03-18 21:47:13	\N	14	5	47
658	2022-03-18 21:47:33	2022-03-18 21:47:33	\N	18	6	47
659	2022-03-18 21:47:40	2022-03-18 21:47:40	\N	22	7	47
660	2022-03-18 21:47:47	2022-03-18 21:47:47	\N	26	8	47
661	2022-03-18 21:48:11	2022-03-18 21:48:11	\N	30	9	47
662	2022-03-18 21:48:19	2022-03-18 21:48:19	\N	34	10	47
663	2022-03-18 21:48:27	2022-03-18 21:48:27	\N	37	11	47
664	2022-03-18 21:48:32	2022-03-18 21:48:32	\N	92	29	47
665	2022-03-18 22:13:31	2022-03-18 22:13:31	\N	2	1	48
666	2022-03-18 22:13:42	2022-03-18 22:13:42	\N	4	2	48
667	2022-03-18 22:14:18	2022-03-18 22:14:18	\N	42	12	48
668	2022-03-18 22:14:29	2022-03-18 22:14:29	\N	45	13	48
669	2022-03-18 22:15:16	2022-03-18 22:15:16	\N	48	14	48
670	2022-03-18 22:15:31	2022-03-18 22:15:31	\N	51	15	48
671	2022-03-18 22:15:42	2022-03-18 22:15:42	\N	54	16	48
672	2022-03-18 22:15:49	2022-03-18 22:15:49	\N	57	17	48
673	2022-03-18 22:15:57	2022-03-18 22:15:57	\N	60	18	48
674	2022-03-18 22:16:07	2022-03-18 22:16:07	\N	63	19	48
675	2022-03-18 22:16:13	2022-03-18 22:16:13	\N	66	20	48
676	2022-03-18 22:16:20	2022-03-18 22:16:20	\N	69	21	48
677	2022-03-18 22:16:29	2022-03-18 22:16:29	\N	72	22	48
678	2022-03-18 22:16:39	2022-03-18 22:16:39	\N	75	23	48
679	2022-03-18 22:16:55	2022-03-18 22:16:55	\N	77	24	48
680	2022-03-18 22:17:03	2022-03-18 22:17:03	\N	81	25	48
681	2022-03-18 22:17:14	2022-03-18 22:17:14	\N	84	26	48
682	2022-03-18 22:17:25	2022-03-18 22:17:25	\N	86	27	48
683	2022-03-18 22:17:36	2022-03-18 22:17:36	\N	90	28	48
684	2022-03-18 22:17:43	2022-03-18 22:17:43	\N	93	29	48
685	2022-03-18 22:25:00	2022-03-18 22:25:00	\N	2	1	49
686	2022-03-18 22:25:07	2022-03-18 22:25:07	\N	4	2	49
687	2022-03-18 22:26:57	2022-03-18 22:26:57	\N	42	12	49
688	2022-03-18 22:27:04	2022-03-18 22:27:04	\N	45	13	49
689	2022-03-18 22:27:14	2022-03-18 22:27:14	\N	48	14	49
690	2022-03-18 22:27:22	2022-03-18 22:27:22	\N	52	15	49
691	2022-03-18 22:27:29	2022-03-18 22:27:29	\N	55	16	49
692	2022-03-18 22:27:36	2022-03-18 22:27:36	\N	56	17	49
693	2022-03-18 22:27:42	2022-03-18 22:27:42	\N	59	18	49
694	2022-03-18 22:27:49	2022-03-18 22:27:49	\N	63	19	49
695	2022-03-18 22:27:57	2022-03-18 22:27:57	\N	66	20	49
696	2022-03-18 22:28:03	2022-03-18 22:28:03	\N	68	21	49
697	2022-03-18 22:28:10	2022-03-18 22:28:10	\N	72	22	49
698	2022-03-18 22:28:16	2022-03-18 22:28:16	\N	75	23	49
699	2022-03-18 22:28:23	2022-03-18 22:28:23	\N	78	24	49
700	2022-03-18 22:28:32	2022-03-18 22:28:32	\N	80	25	49
701	2022-03-18 22:28:38	2022-03-18 22:28:38	\N	83	26	49
702	2022-03-18 22:28:44	2022-03-18 22:28:44	\N	86	27	49
703	2022-03-18 22:28:52	2022-03-18 22:28:52	\N	89	28	49
704	2022-03-18 22:28:54	2022-03-18 22:28:54	\N	93	29	49
705	2022-03-18 22:24:52	2022-03-18 22:24:52	\N	1	1	50
706	2022-03-18 22:25:18	2022-03-18 22:25:18	\N	3	2	50
707	2022-03-18 22:30:13	2022-03-18 22:30:13	\N	6	3	50
708	2022-03-18 22:30:31	2022-03-18 22:30:31	\N	10	4	50
709	2022-03-18 22:31:05	2022-03-18 22:31:05	\N	16	5	50
710	2022-03-18 22:31:20	2022-03-18 22:31:20	\N	20	6	50
711	2022-03-18 22:31:34	2022-03-18 22:31:34	\N	22	7	50
712	2022-03-18 22:31:51	2022-03-18 22:31:51	\N	26	8	50
713	2022-03-18 22:32:03	2022-03-18 22:32:03	\N	31	9	50
714	2022-03-18 22:32:36	2022-03-18 22:32:36	\N	34	10	50
715	2022-03-18 22:32:51	2022-03-18 22:32:51	\N	37	11	50
716	2022-03-18 22:32:58	2022-03-18 22:32:58	\N	93	29	50
717	2022-03-18 23:12:21	2022-03-18 23:12:21	\N	1	1	51
718	2022-03-18 23:12:27	2022-03-18 23:12:27	\N	4	2	51
719	2022-03-18 23:12:45	2022-03-18 23:12:45	\N	7	3	51
720	2022-03-18 23:12:49	2022-03-18 23:12:49	\N	11	4	51
721	2022-03-18 23:12:52	2022-03-18 23:12:52	\N	14	5	51
722	2022-03-18 23:12:56	2022-03-18 23:12:56	\N	19	6	51
723	2022-03-18 23:13:00	2022-03-18 23:13:00	\N	22	7	51
724	2022-03-18 23:13:06	2022-03-18 23:13:06	\N	27	8	51
725	2022-03-18 23:13:09	2022-03-18 23:13:09	\N	30	9	51
726	2022-03-18 23:13:13	2022-03-18 23:13:13	\N	35	10	51
727	2022-03-18 23:13:30	2022-03-18 23:13:30	\N	38	11	51
728	2022-03-18 23:13:34	2022-03-18 23:13:34	\N	93	29	51
729	2022-03-18 23:12:25	2022-03-18 23:12:25	\N	1	1	52
730	2022-03-18 23:12:37	2022-03-18 23:12:37	\N	4	2	52
731	2022-03-18 23:12:54	2022-03-18 23:12:54	\N	7	3	52
732	2022-03-18 23:12:59	2022-03-18 23:12:59	\N	10	4	52
733	2022-03-18 23:13:04	2022-03-18 23:13:04	\N	15	5	52
734	2022-03-18 23:13:07	2022-03-18 23:13:07	\N	18	6	52
735	2022-03-18 23:13:11	2022-03-18 23:13:11	\N	23	7	52
736	2022-03-18 23:13:15	2022-03-18 23:13:15	\N	26	8	52
737	2022-03-18 23:13:19	2022-03-18 23:13:19	\N	31	9	52
738	2022-03-18 23:13:24	2022-03-18 23:13:24	\N	34	10	52
739	2022-03-18 23:12:22	2022-03-18 23:12:22	\N	1	1	53
740	2022-03-18 23:12:31	2022-03-18 23:12:31	\N	4	2	53
741	2022-03-18 23:13:33	2022-03-18 23:13:33	\N	38	11	52
742	2022-03-18 23:12:49	2022-03-18 23:12:49	\N	7	3	53
743	2022-03-18 23:13:36	2022-03-18 23:13:36	\N	93	29	52
744	2022-03-18 23:12:59	2022-03-18 23:12:59	\N	10	4	53
745	2022-03-18 23:12:25	2022-03-18 23:12:25	\N	1	1	54
746	2022-03-18 23:13:03	2022-03-18 23:13:03	\N	15	5	53
747	2022-03-18 23:13:07	2022-03-18 23:13:07	\N	18	6	53
748	2022-03-18 23:12:31	2022-03-18 23:12:31	\N	4	2	54
749	2022-03-18 23:12:40	2022-03-18 23:12:40	\N	5	3	54
750	2022-03-18 23:13:10	2022-03-18 23:13:10	\N	23	7	53
752	2022-03-18 23:13:15	2022-03-18 23:13:15	\N	27	8	53
753	2022-03-18 23:13:21	2022-03-18 23:13:21	\N	30	9	53
756	2022-03-18 23:13:25	2022-03-18 23:13:25	\N	35	10	53
758	2022-03-18 23:13:35	2022-03-18 23:13:35	\N	38	11	53
760	2022-03-18 23:13:37	2022-03-18 23:13:37	\N	93	29	53
751	2022-03-18 23:12:44	2022-03-18 23:12:44	\N	9	4	54
754	2022-03-18 23:12:54	2022-03-18 23:12:54	\N	15	5	54
755	2022-03-18 23:12:59	2022-03-18 23:12:59	\N	18	6	54
757	2022-03-18 23:13:04	2022-03-18 23:13:04	\N	23	7	54
759	2022-03-18 23:13:10	2022-03-18 23:13:10	\N	27	8	54
761	2022-03-18 23:13:14	2022-03-18 23:13:14	\N	30	9	54
762	2022-03-18 23:13:19	2022-03-18 23:13:19	\N	34	10	54
763	2022-03-18 23:13:23	2022-03-18 23:13:23	\N	38	11	54
764	2022-03-18 23:13:41	2022-03-18 23:13:41	\N	93	29	54
765	2022-03-18 23:13:21	2022-03-18 23:13:21	\N	1	1	55
766	2022-03-18 23:13:27	2022-03-18 23:13:27	\N	3	2	55
767	2022-03-18 23:13:37	2022-03-18 23:13:37	\N	6	3	55
768	2022-03-18 23:13:43	2022-03-18 23:13:43	\N	11	4	55
769	2022-03-18 23:13:51	2022-03-18 23:13:51	\N	15	5	55
770	2022-03-18 23:13:57	2022-03-18 23:13:57	\N	19	6	55
771	2022-03-18 23:14:00	2022-03-18 23:14:00	\N	24	7	55
772	2022-03-18 23:14:04	2022-03-18 23:14:04	\N	28	8	55
773	2022-03-18 23:14:08	2022-03-18 23:14:08	\N	32	9	55
774	2022-03-18 23:14:12	2022-03-18 23:14:12	\N	35	10	55
775	2022-03-18 23:14:16	2022-03-18 23:14:16	\N	40	11	55
776	2022-03-18 23:14:17	2022-03-18 23:14:17	\N	93	29	55
777	2022-03-18 23:16:27	2022-03-18 23:16:27	\N	1	1	56
778	2022-03-18 23:16:33	2022-03-18 23:16:33	\N	3	2	56
779	2022-03-18 23:16:39	2022-03-18 23:16:39	\N	7	3	56
780	2022-03-18 23:16:43	2022-03-18 23:16:43	\N	11	4	56
781	2022-03-18 23:16:48	2022-03-18 23:16:48	\N	15	5	56
782	2022-03-18 23:17:01	2022-03-18 23:17:01	\N	19	6	56
783	2022-03-18 23:17:05	2022-03-18 23:17:05	\N	23	7	56
784	2022-03-18 23:17:13	2022-03-18 23:17:13	\N	26	8	56
785	2022-03-18 23:17:18	2022-03-18 23:17:18	\N	30	9	56
786	2022-03-18 23:17:34	2022-03-18 23:17:34	\N	34	10	56
787	2022-03-18 23:17:41	2022-03-18 23:17:41	\N	38	11	56
788	2022-03-18 23:17:47	2022-03-18 23:17:47	\N	92	29	56
789	2022-03-19 18:37:52	2022-03-19 18:37:52	\N	1	1	57
790	2022-03-19 18:38:04	2022-03-19 18:38:04	\N	4	2	57
791	2022-03-19 18:38:44	2022-03-19 18:38:44	\N	6	3	57
792	2022-03-19 18:38:57	2022-03-19 18:38:57	\N	10	4	57
793	2022-03-19 18:39:07	2022-03-19 18:39:07	\N	16	5	57
794	2022-03-19 18:39:19	2022-03-19 18:39:19	\N	19	6	57
795	2022-03-19 18:39:25	2022-03-19 18:39:25	\N	24	7	57
796	2022-03-19 18:39:35	2022-03-19 18:39:35	\N	27	8	57
797	2022-03-19 18:39:43	2022-03-19 18:39:43	\N	32	9	57
798	2022-03-19 18:42:30	2022-03-19 18:42:30	\N	33	10	57
799	2022-03-19 18:42:42	2022-03-19 18:42:42	\N	38	11	57
800	2022-03-19 18:42:48	2022-03-19 18:42:48	\N	93	29	57
801	2022-03-19 18:48:53	2022-03-19 18:48:53	\N	2	1	58
802	2022-03-19 18:49:14	2022-03-19 18:49:14	\N	4	2	58
803	2022-03-19 18:49:40	2022-03-19 18:49:40	\N	41	12	58
804	2022-03-19 18:50:04	2022-03-19 18:50:04	\N	45	13	58
805	2022-03-19 18:50:28	2022-03-19 18:50:28	\N	47	14	58
806	2022-03-19 18:50:49	2022-03-19 18:50:49	\N	50	15	58
807	2022-03-19 18:50:58	2022-03-19 18:50:58	\N	54	16	58
808	2022-03-19 18:51:04	2022-03-19 18:51:04	\N	56	17	58
809	2022-03-19 18:51:16	2022-03-19 18:51:16	\N	59	18	58
810	2022-03-19 18:51:24	2022-03-19 18:51:24	\N	62	19	58
811	2022-03-19 18:51:35	2022-03-19 18:51:35	\N	66	20	58
812	2022-03-19 18:51:43	2022-03-19 18:51:43	\N	68	21	58
813	2022-03-19 18:51:52	2022-03-19 18:51:52	\N	71	22	58
814	2022-03-19 18:52:06	2022-03-19 18:52:06	\N	74	23	58
815	2022-03-19 18:52:17	2022-03-19 18:52:17	\N	78	24	58
816	2022-03-19 18:52:23	2022-03-19 18:52:23	\N	80	25	58
817	2022-03-19 18:52:41	2022-03-19 18:52:41	\N	84	26	58
818	2022-03-19 18:52:52	2022-03-19 18:52:52	\N	86	27	58
819	2022-03-19 18:53:10	2022-03-19 18:53:10	\N	89	28	58
820	2022-03-19 18:53:17	2022-03-19 18:53:17	\N	92	29	58
821	2022-03-19 20:05:07	2022-03-19 20:05:07	\N	2	1	59
822	2022-03-19 20:05:17	2022-03-19 20:05:17	\N	4	2	59
823	2022-03-19 20:05:32	2022-03-19 20:05:32	\N	42	12	59
824	2022-03-19 20:05:52	2022-03-19 20:05:52	\N	46	13	59
825	2022-03-19 20:06:02	2022-03-19 20:06:02	\N	47	14	59
826	2022-03-19 20:06:08	2022-03-19 20:06:08	\N	50	15	59
827	2022-03-19 20:06:17	2022-03-19 20:06:17	\N	54	16	59
828	2022-03-19 20:06:25	2022-03-19 20:06:25	\N	56	17	59
829	2022-03-19 20:06:36	2022-03-19 20:06:36	\N	61	18	59
830	2022-03-19 20:06:42	2022-03-19 20:06:42	\N	62	19	59
831	2022-03-19 20:06:48	2022-03-19 20:06:48	\N	65	20	59
832	2022-03-19 20:06:55	2022-03-19 20:06:55	\N	68	21	59
833	2022-03-19 20:07:02	2022-03-19 20:07:02	\N	72	22	59
834	2022-03-19 20:07:08	2022-03-19 20:07:08	\N	74	23	59
835	2022-03-19 20:07:18	2022-03-19 20:07:18	\N	79	24	59
836	2022-03-19 20:07:25	2022-03-19 20:07:25	\N	81	25	59
837	2022-03-19 20:07:34	2022-03-19 20:07:34	\N	83	26	59
838	2022-03-19 20:07:42	2022-03-19 20:07:42	\N	86	27	59
839	2022-03-19 20:07:50	2022-03-19 20:07:50	\N	89	28	59
840	2022-03-19 20:07:55	2022-03-19 20:07:55	\N	92	29	59
841	2022-03-19 20:18:02	2022-03-19 20:18:02	\N	1	1	60
842	2022-03-19 20:18:11	2022-03-19 20:18:11	\N	3	2	60
843	2022-03-19 20:18:28	2022-03-19 20:18:28	\N	7	3	60
844	2022-03-19 20:18:36	2022-03-19 20:18:36	\N	11	4	60
845	2022-03-19 20:18:43	2022-03-19 20:18:43	\N	15	5	60
846	2022-03-19 20:18:51	2022-03-19 20:18:51	\N	19	6	60
847	2022-03-19 20:18:57	2022-03-19 20:18:57	\N	24	7	60
848	2022-03-19 20:19:05	2022-03-19 20:19:05	\N	25	8	60
849	2022-03-19 20:19:15	2022-03-19 20:19:15	\N	32	9	60
850	2022-03-19 20:19:29	2022-03-19 20:19:29	\N	33	10	60
851	2022-03-19 20:19:36	2022-03-19 20:19:36	\N	37	11	60
852	2022-03-19 20:19:40	2022-03-19 20:19:40	\N	93	29	60
853	2022-03-19 20:26:20	2022-03-19 20:26:20	\N	2	1	61
854	2022-03-19 20:26:29	2022-03-19 20:26:29	\N	4	2	61
855	2022-03-19 20:26:42	2022-03-19 20:26:42	\N	41	12	61
856	2022-03-19 20:26:50	2022-03-19 20:26:50	\N	45	13	61
857	2022-03-19 20:26:57	2022-03-19 20:26:57	\N	47	14	61
858	2022-03-19 20:27:09	2022-03-19 20:27:09	\N	50	15	61
859	2022-03-19 20:27:19	2022-03-19 20:27:19	\N	54	16	61
860	2022-03-19 20:27:25	2022-03-19 20:27:25	\N	56	17	61
861	2022-03-19 20:27:32	2022-03-19 20:27:32	\N	59	18	61
862	2022-03-19 20:27:38	2022-03-19 20:27:38	\N	62	19	61
863	2022-03-19 20:27:43	2022-03-19 20:27:43	\N	65	20	61
864	2022-03-19 20:27:51	2022-03-19 20:27:51	\N	68	21	61
865	2022-03-19 20:28:02	2022-03-19 20:28:02	\N	72	22	61
866	2022-03-19 20:28:07	2022-03-19 20:28:07	\N	74	23	61
867	2022-03-19 20:28:18	2022-03-19 20:28:18	\N	79	24	61
868	2022-03-19 20:28:26	2022-03-19 20:28:26	\N	80	25	61
869	2022-03-19 20:28:32	2022-03-19 20:28:32	\N	83	26	61
870	2022-03-19 20:28:40	2022-03-19 20:28:40	\N	86	27	61
871	2022-03-19 20:28:54	2022-03-19 20:28:54	\N	90	28	61
872	2022-03-19 20:28:59	2022-03-19 20:28:59	\N	92	29	61
873	2022-03-19 20:28:19	2022-03-19 20:28:19	\N	1	1	62
874	2022-03-19 20:28:27	2022-03-19 20:28:27	\N	4	2	62
875	2022-03-19 20:28:36	2022-03-19 20:28:36	\N	5	3	62
876	2022-03-19 20:28:46	2022-03-19 20:28:46	\N	10	4	62
877	2022-03-19 20:28:53	2022-03-19 20:28:53	\N	13	5	62
878	2022-03-19 20:29:00	2022-03-19 20:29:00	\N	20	6	62
879	2022-03-19 20:29:06	2022-03-19 20:29:06	\N	21	7	62
880	2022-03-19 20:29:13	2022-03-19 20:29:13	\N	25	8	62
881	2022-03-19 20:29:19	2022-03-19 20:29:19	\N	30	9	62
882	2022-03-19 20:29:35	2022-03-19 20:29:35	\N	33	10	62
883	2022-03-19 20:29:41	2022-03-19 20:29:41	\N	37	11	62
884	2022-03-19 20:29:45	2022-03-19 20:29:45	\N	92	29	62
885	2022-03-19 20:27:49	2022-03-19 20:27:49	\N	1	1	63
886	2022-03-19 20:28:04	2022-03-19 20:28:04	\N	3	2	63
887	2022-03-19 20:28:18	2022-03-19 20:28:18	\N	6	3	63
888	2022-03-19 20:28:36	2022-03-19 20:28:36	\N	10	4	63
889	2022-03-19 20:29:01	2022-03-19 20:29:01	\N	14	5	63
890	2022-03-19 20:29:08	2022-03-19 20:29:08	\N	18	6	63
891	2022-03-19 20:29:12	2022-03-19 20:29:12	\N	22	7	63
892	2022-03-19 20:29:24	2022-03-19 20:29:24	\N	25	8	63
893	2022-03-19 20:29:36	2022-03-19 20:29:36	\N	29	9	63
894	2022-03-19 20:29:56	2022-03-19 20:29:56	\N	35	10	63
895	2022-03-19 20:30:03	2022-03-19 20:30:03	\N	37	11	63
896	2022-03-19 20:30:07	2022-03-19 20:30:07	\N	92	29	63
897	2022-03-19 20:26:21	2022-03-19 20:26:21	\N	2	1	64
898	2022-03-19 20:26:39	2022-03-19 20:26:39	\N	4	2	64
899	2022-03-19 20:26:50	2022-03-19 20:26:50	\N	43	12	64
900	2022-03-19 20:26:58	2022-03-19 20:26:58	\N	45	13	64
901	2022-03-19 20:27:11	2022-03-19 20:27:11	\N	48	14	64
902	2022-03-19 20:27:23	2022-03-19 20:27:23	\N	50	15	64
903	2022-03-19 20:27:43	2022-03-19 20:27:43	\N	53	16	64
904	2022-03-19 20:27:52	2022-03-19 20:27:52	\N	58	17	64
905	2022-03-19 20:28:02	2022-03-19 20:28:02	\N	60	18	64
906	2022-03-19 20:28:10	2022-03-19 20:28:10	\N	62	19	64
907	2022-03-19 20:28:19	2022-03-19 20:28:19	\N	66	20	64
908	2022-03-19 20:28:28	2022-03-19 20:28:28	\N	68	21	64
909	2022-03-19 20:29:22	2022-03-19 20:29:22	\N	71	22	64
910	2022-03-19 20:29:28	2022-03-19 20:29:28	\N	75	23	64
911	2022-03-19 20:29:40	2022-03-19 20:29:40	\N	79	24	64
912	2022-03-19 20:29:46	2022-03-19 20:29:46	\N	81	25	64
913	2022-03-19 20:29:55	2022-03-19 20:29:55	\N	84	26	64
914	2022-03-19 20:30:04	2022-03-19 20:30:04	\N	86	27	64
915	2022-03-19 20:30:14	2022-03-19 20:30:14	\N	89	28	64
916	2022-03-19 20:30:18	2022-03-19 20:30:18	\N	92	29	64
917	2022-03-19 20:31:22	2022-03-19 20:31:22	\N	1	1	65
918	2022-03-19 20:31:29	2022-03-19 20:31:29	\N	3	2	65
919	2022-03-19 20:31:44	2022-03-19 20:31:44	\N	6	3	65
920	2022-03-19 20:31:52	2022-03-19 20:31:52	\N	10	4	65
921	2022-03-19 20:32:00	2022-03-19 20:32:00	\N	16	5	65
922	2022-03-19 20:32:06	2022-03-19 20:32:06	\N	17	6	65
923	2022-03-19 20:32:11	2022-03-19 20:32:11	\N	22	7	65
924	2022-03-19 20:32:19	2022-03-19 20:32:19	\N	26	8	65
925	2022-03-19 20:32:28	2022-03-19 20:32:28	\N	29	9	65
926	2022-03-19 20:32:39	2022-03-19 20:32:39	\N	33	10	65
927	2022-03-19 20:32:46	2022-03-19 20:32:46	\N	37	11	65
928	2022-03-19 20:32:53	2022-03-19 20:32:53	\N	92	29	65
929	2022-03-19 20:28:53	2022-03-19 20:28:53	\N	2	1	66
930	2022-03-19 20:29:05	2022-03-19 20:29:05	\N	4	2	66
931	2022-03-19 20:29:31	2022-03-19 20:29:31	\N	41	12	66
932	2022-03-19 20:29:45	2022-03-19 20:29:45	\N	45	13	66
933	2022-03-19 20:30:01	2022-03-19 20:30:01	\N	47	14	66
934	2022-03-19 20:30:41	2022-03-19 20:30:41	\N	50	15	66
935	2022-03-19 20:30:55	2022-03-19 20:30:55	\N	54	16	66
936	2022-03-19 20:31:15	2022-03-19 20:31:15	\N	56	17	66
937	2022-03-19 20:31:24	2022-03-19 20:31:24	\N	60	18	66
938	2022-03-19 20:31:31	2022-03-19 20:31:31	\N	62	19	66
939	2022-03-19 20:31:37	2022-03-19 20:31:37	\N	65	20	66
940	2022-03-19 20:31:43	2022-03-19 20:31:43	\N	68	21	66
941	2022-03-19 20:32:36	2022-03-19 20:32:36	\N	72	22	66
942	2022-03-19 20:32:52	2022-03-19 20:32:52	\N	74	23	66
943	2022-03-19 20:33:29	2022-03-19 20:33:29	\N	78	24	66
944	2022-03-19 20:34:16	2022-03-19 20:34:16	\N	80	25	66
945	2022-03-19 20:34:27	2022-03-19 20:34:27	\N	84	26	66
946	2022-03-19 20:34:35	2022-03-19 20:34:35	\N	86	27	66
947	2022-03-19 20:34:49	2022-03-19 20:34:49	\N	90	28	66
948	2022-03-19 20:34:59	2022-03-19 20:34:59	\N	92	29	66
949	2022-03-19 20:36:39	2022-03-19 20:36:39	\N	2	1	67
950	2022-03-19 20:36:47	2022-03-19 20:36:47	\N	4	2	67
951	2022-03-19 20:36:56	2022-03-19 20:36:56	\N	41	12	67
952	2022-03-19 20:37:04	2022-03-19 20:37:04	\N	44	13	67
953	2022-03-19 20:37:11	2022-03-19 20:37:11	\N	47	14	67
954	2022-03-19 20:37:31	2022-03-19 20:37:31	\N	50	15	67
955	2022-03-19 20:37:37	2022-03-19 20:37:37	\N	54	16	67
956	2022-03-19 20:37:41	2022-03-19 20:37:41	\N	56	17	67
957	2022-03-19 20:37:49	2022-03-19 20:37:49	\N	59	18	67
958	2022-03-19 20:37:55	2022-03-19 20:37:55	\N	62	19	67
959	2022-03-19 20:38:00	2022-03-19 20:38:00	\N	65	20	67
960	2022-03-19 20:38:04	2022-03-19 20:38:04	\N	68	21	67
961	2022-03-19 20:38:10	2022-03-19 20:38:10	\N	71	22	67
962	2022-03-19 20:38:16	2022-03-19 20:38:16	\N	75	23	67
963	2022-03-19 20:38:23	2022-03-19 20:38:23	\N	77	24	67
964	2022-03-19 20:38:30	2022-03-19 20:38:30	\N	81	25	67
965	2022-03-19 20:38:36	2022-03-19 20:38:36	\N	83	26	67
966	2022-03-19 20:38:42	2022-03-19 20:38:42	\N	86	27	67
967	2022-03-19 20:38:50	2022-03-19 20:38:50	\N	89	28	67
968	2022-03-19 20:38:53	2022-03-19 20:38:53	\N	92	29	67
969	2022-03-19 20:38:44	2022-03-19 20:38:44	\N	2	1	68
970	2022-03-19 20:38:51	2022-03-19 20:38:51	\N	3	2	68
971	2022-03-19 20:39:05	2022-03-19 20:39:05	\N	6	3	68
972	2022-03-19 20:39:12	2022-03-19 20:39:12	\N	10	4	68
973	2022-03-19 20:39:25	2022-03-19 20:39:25	\N	14	5	68
974	2022-03-19 20:39:37	2022-03-19 20:39:37	\N	19	6	68
975	2022-03-19 20:39:41	2022-03-19 20:39:41	\N	21	7	68
976	2022-03-19 20:39:49	2022-03-19 20:39:49	\N	26	8	68
977	2022-03-19 20:40:22	2022-03-19 20:40:22	\N	30	9	68
978	2022-03-19 20:40:33	2022-03-19 20:40:33	\N	33	10	68
979	2022-03-19 20:40:41	2022-03-19 20:40:41	\N	37	11	68
980	2022-03-19 20:40:43	2022-03-19 20:40:43	\N	93	29	68
981	2022-03-19 20:38:02	2022-03-19 20:38:02	\N	2	1	69
982	2022-03-19 20:38:11	2022-03-19 20:38:11	\N	4	2	69
983	2022-03-19 20:38:22	2022-03-19 20:38:22	\N	42	12	69
984	2022-03-19 20:38:32	2022-03-19 20:38:32	\N	45	13	69
985	2022-03-19 20:38:41	2022-03-19 20:38:41	\N	47	14	69
986	2022-03-19 20:38:48	2022-03-19 20:38:48	\N	50	15	69
987	2022-03-19 20:39:00	2022-03-19 20:39:00	\N	54	16	69
988	2022-03-19 20:39:10	2022-03-19 20:39:10	\N	56	17	69
989	2022-03-19 20:39:22	2022-03-19 20:39:22	\N	60	18	69
990	2022-03-19 20:39:29	2022-03-19 20:39:29	\N	62	19	69
991	2022-03-19 20:39:36	2022-03-19 20:39:36	\N	65	20	69
992	2022-03-19 20:39:44	2022-03-19 20:39:44	\N	68	21	69
993	2022-03-19 20:39:53	2022-03-19 20:39:53	\N	71	22	69
994	2022-03-19 20:40:00	2022-03-19 20:40:00	\N	74	23	69
995	2022-03-19 20:40:07	2022-03-19 20:40:07	\N	78	24	69
996	2022-03-19 20:40:13	2022-03-19 20:40:13	\N	80	25	69
997	2022-03-19 20:40:28	2022-03-19 20:40:28	\N	84	26	69
998	2022-03-19 20:40:34	2022-03-19 20:40:34	\N	86	27	69
999	2022-03-19 20:40:40	2022-03-19 20:40:40	\N	90	28	69
1000	2022-03-19 20:40:44	2022-03-19 20:40:44	\N	93	29	69
1001	2022-03-19 20:41:05	2022-03-19 20:41:05	\N	1	1	70
1002	2022-03-19 20:41:19	2022-03-19 20:41:19	\N	4	2	70
1003	2022-03-19 20:41:36	2022-03-19 20:41:36	\N	5	3	70
1004	2022-03-19 20:41:45	2022-03-19 20:41:45	\N	9	4	70
1005	2022-03-19 20:41:59	2022-03-19 20:41:59	\N	14	5	70
1006	2022-03-19 20:42:10	2022-03-19 20:42:10	\N	17	6	70
1007	2022-03-19 20:42:19	2022-03-19 20:42:19	\N	21	7	70
1008	2022-03-19 20:42:30	2022-03-19 20:42:30	\N	25	8	70
1009	2022-03-19 20:42:44	2022-03-19 20:42:44	\N	29	9	70
1010	2022-03-19 20:43:17	2022-03-19 20:43:17	\N	33	10	70
1011	2022-03-19 20:43:25	2022-03-19 20:43:25	\N	37	11	70
1012	2022-03-19 20:43:38	2022-03-19 20:43:38	\N	93	29	70
1013	2022-03-20 00:05:42	2022-03-20 00:05:42	\N	1	1	71
1014	2022-03-20 00:05:52	2022-03-20 00:05:52	\N	3	2	71
1015	2022-03-20 00:06:02	2022-03-20 00:06:02	\N	8	3	71
1016	2022-03-20 00:06:12	2022-03-20 00:06:12	\N	12	4	71
1017	2022-03-20 00:06:17	2022-03-20 00:06:17	\N	15	5	71
1018	2022-03-20 00:06:24	2022-03-20 00:06:24	\N	19	6	71
1019	2022-03-20 00:06:31	2022-03-20 00:06:31	\N	24	7	71
1020	2022-03-20 00:06:38	2022-03-20 00:06:38	\N	28	8	71
1021	2022-03-20 00:06:44	2022-03-20 00:06:44	\N	32	9	71
1022	2022-03-20 00:07:09	2022-03-20 00:07:09	\N	35	10	71
1023	2022-03-20 00:07:16	2022-03-20 00:07:16	\N	40	11	71
1024	2022-03-20 00:07:19	2022-03-20 00:07:19	\N	93	29	71
1025	2022-03-20 01:30:24	2022-03-20 01:30:24	\N	2	1	72
1026	2022-03-20 01:30:39	2022-03-20 01:30:39	\N	3	2	72
1027	2022-03-20 01:30:56	2022-03-20 01:30:56	\N	6	3	72
1028	2022-03-20 01:31:11	2022-03-20 01:31:11	\N	9	4	72
1029	2022-03-20 01:31:20	2022-03-20 01:31:20	\N	14	5	72
1030	2022-03-20 01:31:31	2022-03-20 01:31:31	\N	18	6	72
1031	2022-03-20 01:31:39	2022-03-20 01:31:39	\N	21	7	72
1032	2022-03-20 01:31:49	2022-03-20 01:31:49	\N	26	8	72
1033	2022-03-20 01:31:58	2022-03-20 01:31:58	\N	29	9	72
1034	2022-03-20 01:32:13	2022-03-20 01:32:13	\N	33	10	72
1035	2022-03-20 01:32:28	2022-03-20 01:32:28	\N	38	11	72
1036	2022-03-20 01:32:34	2022-03-20 01:32:34	\N	92	29	72
1037	2022-03-20 01:35:25	2022-03-20 01:35:25	\N	2	1	73
1038	2022-03-20 01:35:37	2022-03-20 01:35:37	\N	4	2	73
1039	2022-03-20 01:36:03	2022-03-20 01:36:03	\N	41	12	73
1040	2022-03-20 01:36:33	2022-03-20 01:36:33	\N	44	13	73
1041	2022-03-20 01:36:42	2022-03-20 01:36:42	\N	47	14	73
1042	2022-03-20 01:36:52	2022-03-20 01:36:52	\N	51	15	73
1043	2022-03-20 01:37:00	2022-03-20 01:37:00	\N	53	16	73
1044	2022-03-20 01:37:07	2022-03-20 01:37:07	\N	56	17	73
1045	2022-03-20 01:37:15	2022-03-20 01:37:15	\N	60	18	73
1046	2022-03-20 01:37:24	2022-03-20 01:37:24	\N	62	19	73
1047	2022-03-20 01:37:29	2022-03-20 01:37:29	\N	65	20	73
1048	2022-03-20 01:37:35	2022-03-20 01:37:35	\N	68	21	73
1049	2022-03-20 01:37:47	2022-03-20 01:37:47	\N	72	22	73
1050	2022-03-20 01:37:58	2022-03-20 01:37:58	\N	74	23	73
1051	2022-03-20 01:38:27	2022-03-20 01:38:27	\N	78	24	73
1052	2022-03-20 01:38:34	2022-03-20 01:38:34	\N	80	25	73
1053	2022-03-20 01:38:40	2022-03-20 01:38:40	\N	83	26	73
1054	2022-03-20 01:38:47	2022-03-20 01:38:47	\N	86	27	73
1055	2022-03-20 01:39:01	2022-03-20 01:39:01	\N	90	28	73
1056	2022-03-20 01:39:08	2022-03-20 01:39:08	\N	93	29	73
1057	2022-03-20 21:26:39	2022-03-20 21:26:39	\N	2	1	74
1058	2022-03-20 21:26:51	2022-03-20 21:26:51	\N	4	2	74
1059	2022-03-20 21:27:03	2022-03-20 21:27:03	\N	41	12	74
1060	2022-03-20 21:27:11	2022-03-20 21:27:11	\N	45	13	74
1061	2022-03-20 21:27:21	2022-03-20 21:27:21	\N	47	14	74
1062	2022-03-20 21:27:27	2022-03-20 21:27:27	\N	50	15	74
1063	2022-03-20 21:27:48	2022-03-20 21:27:48	\N	53	16	74
1064	2022-03-20 21:27:54	2022-03-20 21:27:54	\N	56	17	74
1065	2022-03-20 21:28:01	2022-03-20 21:28:01	\N	59	18	74
1066	2022-03-20 21:28:07	2022-03-20 21:28:07	\N	62	19	74
1067	2022-03-20 21:28:12	2022-03-20 21:28:12	\N	65	20	74
1068	2022-03-20 21:28:18	2022-03-20 21:28:18	\N	68	21	74
1069	2022-03-20 21:28:31	2022-03-20 21:28:31	\N	73	22	74
1070	2022-03-20 21:28:37	2022-03-20 21:28:37	\N	74	23	74
1071	2022-03-20 21:28:47	2022-03-20 21:28:47	\N	78	24	74
1072	2022-03-20 21:28:52	2022-03-20 21:28:52	\N	80	25	74
1073	2022-03-20 21:29:08	2022-03-20 21:29:08	\N	83	26	74
1074	2022-03-20 21:29:14	2022-03-20 21:29:14	\N	86	27	74
1075	2022-03-20 21:29:27	2022-03-20 21:29:27	\N	89	28	74
1076	2022-03-20 21:29:32	2022-03-20 21:29:32	\N	93	29	74
1077	2022-03-20 22:14:51	2022-03-20 22:14:51	\N	2	1	75
1078	2022-03-20 22:15:00	2022-03-20 22:15:00	\N	3	2	75
1079	2022-03-20 22:15:20	2022-03-20 22:15:20	\N	5	3	75
1080	2022-03-20 22:15:41	2022-03-20 22:15:41	\N	10	4	75
1081	2022-03-20 22:15:50	2022-03-20 22:15:50	\N	13	5	75
1082	2022-03-20 22:15:58	2022-03-20 22:15:58	\N	17	6	75
1083	2022-03-20 22:16:04	2022-03-20 22:16:04	\N	22	7	75
1084	2022-03-20 22:16:11	2022-03-20 22:16:11	\N	25	8	75
1085	2022-03-20 22:16:19	2022-03-20 22:16:19	\N	29	9	75
1086	2022-03-20 22:16:41	2022-03-20 22:16:41	\N	33	10	75
1087	2022-03-20 22:16:48	2022-03-20 22:16:48	\N	37	11	75
1088	2022-03-20 22:16:56	2022-03-20 22:16:56	\N	93	29	75
1089	2022-03-20 22:23:36	2022-03-20 22:23:36	\N	1	1	76
1090	2022-03-20 22:23:44	2022-03-20 22:23:44	\N	3	2	76
1091	2022-03-20 22:24:06	2022-03-20 22:24:06	\N	6	3	76
1092	2022-03-20 22:24:15	2022-03-20 22:24:15	\N	11	4	76
1093	2022-03-20 22:24:24	2022-03-20 22:24:24	\N	16	5	76
1094	2022-03-20 22:24:31	2022-03-20 22:24:31	\N	19	6	76
1095	2022-03-20 22:24:39	2022-03-20 22:24:39	\N	24	7	76
1096	2022-03-20 22:24:48	2022-03-20 22:24:48	\N	26	8	76
1097	2022-03-20 22:24:56	2022-03-20 22:24:56	\N	31	9	76
1098	2022-03-20 22:25:14	2022-03-20 22:25:14	\N	35	10	76
1099	2022-03-20 22:25:22	2022-03-20 22:25:22	\N	39	11	76
1100	2022-03-20 22:25:27	2022-03-20 22:25:27	\N	93	29	76
1101	2022-03-20 22:27:28	2022-03-20 22:27:28	\N	1	1	77
1102	2022-03-20 22:27:36	2022-03-20 22:27:36	\N	3	2	77
1103	2022-03-20 22:27:48	2022-03-20 22:27:48	\N	6	3	77
1104	2022-03-20 22:27:54	2022-03-20 22:27:54	\N	10	4	77
1105	2022-03-20 22:27:59	2022-03-20 22:27:59	\N	14	5	77
1106	2022-03-20 22:28:02	2022-03-20 22:28:02	\N	19	6	77
1107	2022-03-20 22:28:14	2022-03-20 22:28:14	\N	22	7	77
1108	2022-03-20 22:28:17	2022-03-20 22:28:17	\N	26	8	77
1109	2022-03-20 22:28:20	2022-03-20 22:28:20	\N	32	9	77
1110	2022-03-20 22:28:24	2022-03-20 22:28:24	\N	35	10	77
1111	2022-03-20 22:28:28	2022-03-20 22:28:28	\N	37	11	77
1112	2022-03-20 22:28:32	2022-03-20 22:28:32	\N	92	29	77
1113	2022-03-20 22:38:00	2022-03-20 22:38:00	\N	1	1	78
1114	2022-03-20 22:38:10	2022-03-20 22:38:10	\N	3	2	78
1115	2022-03-20 22:38:28	2022-03-20 22:38:28	\N	6	3	78
1116	2022-03-20 22:38:36	2022-03-20 22:38:36	\N	10	4	78
1117	2022-03-20 22:38:50	2022-03-20 22:38:50	\N	16	5	78
1118	2022-03-20 22:39:00	2022-03-20 22:39:00	\N	19	6	78
1119	2022-03-20 22:39:10	2022-03-20 22:39:10	\N	23	7	78
1120	2022-03-20 22:39:19	2022-03-20 22:39:19	\N	28	8	78
1121	2022-03-20 22:39:31	2022-03-20 22:39:31	\N	32	9	78
1122	2022-03-20 22:39:51	2022-03-20 22:39:51	\N	35	10	78
1123	2022-03-20 22:40:04	2022-03-20 22:40:04	\N	38	11	78
1124	2022-03-20 22:40:07	2022-03-20 22:40:07	\N	92	29	78
1125	2022-03-21 01:29:03	2022-03-21 01:29:03	\N	1	1	79
1126	2022-03-21 01:29:09	2022-03-21 01:29:09	\N	4	2	79
1127	2022-03-21 01:29:27	2022-03-21 01:29:27	\N	5	3	79
1128	2022-03-21 01:29:39	2022-03-21 01:29:39	\N	11	4	79
1129	2022-03-21 01:29:51	2022-03-21 01:29:51	\N	16	5	79
1130	2022-03-21 01:30:06	2022-03-21 01:30:06	\N	20	6	79
1131	2022-03-21 01:30:50	2022-03-21 01:30:50	\N	23	7	79
1132	2022-03-21 01:31:00	2022-03-21 01:31:00	\N	27	8	79
1133	2022-03-21 01:31:07	2022-03-21 01:31:07	\N	30	9	79
1134	2022-03-21 01:31:24	2022-03-21 01:31:24	\N	36	10	79
1135	2022-03-21 01:31:44	2022-03-21 01:31:44	\N	37	11	79
1136	2022-03-21 01:31:49	2022-03-21 01:31:49	\N	93	29	79
1137	2022-03-21 02:00:11	2022-03-21 02:00:11	\N	1	1	80
1138	2022-03-21 02:00:23	2022-03-21 02:00:23	\N	3	2	80
1139	2022-03-21 02:00:42	2022-03-21 02:00:42	\N	6	3	80
1140	2022-03-21 02:01:00	2022-03-21 02:01:00	\N	11	4	80
1141	2022-03-21 02:01:10	2022-03-21 02:01:10	\N	16	5	80
1142	2022-03-21 02:01:21	2022-03-21 02:01:21	\N	18	6	80
1143	2022-03-21 02:01:28	2022-03-21 02:01:28	\N	22	7	80
1144	2022-03-21 02:01:37	2022-03-21 02:01:37	\N	28	8	80
1145	2022-03-21 02:01:45	2022-03-21 02:01:45	\N	31	9	80
1146	2022-03-21 02:02:10	2022-03-21 02:02:10	\N	33	10	80
1147	2022-03-21 02:02:21	2022-03-21 02:02:21	\N	37	11	80
1148	2022-03-21 02:02:27	2022-03-21 02:02:27	\N	93	29	80
1149	2022-03-21 02:09:44	2022-03-21 02:09:44	\N	1	1	81
1150	2022-03-21 02:11:01	2022-03-21 02:11:01	\N	4	2	81
1151	2022-03-21 02:11:18	2022-03-21 02:11:18	\N	6	3	81
1152	2022-03-21 02:11:28	2022-03-21 02:11:28	\N	10	4	81
1153	2022-03-21 02:11:37	2022-03-21 02:11:37	\N	13	5	81
1154	2022-03-21 02:11:49	2022-03-21 02:11:49	\N	17	6	81
1155	2022-03-21 02:12:31	2022-03-21 02:12:31	\N	21	7	81
1156	2022-03-21 02:12:41	2022-03-21 02:12:41	\N	25	8	81
1157	2022-03-21 02:13:03	2022-03-21 02:13:03	\N	31	9	81
1158	2022-03-21 02:13:11	2022-03-21 02:13:11	\N	33	10	81
1159	2022-03-21 02:13:24	2022-03-21 02:13:24	\N	37	11	81
1160	2022-03-21 02:13:32	2022-03-21 02:13:32	\N	93	29	81
1161	2022-03-21 02:19:16	2022-03-21 02:19:16	\N	1	1	82
1162	2022-03-21 02:19:21	2022-03-21 02:19:21	\N	3	2	82
1163	2022-03-21 02:19:32	2022-03-21 02:19:32	\N	7	3	82
1164	2022-03-21 02:19:40	2022-03-21 02:19:40	\N	11	4	82
1165	2022-03-21 02:19:50	2022-03-21 02:19:50	\N	16	5	82
1166	2022-03-21 02:20:01	2022-03-21 02:20:01	\N	20	6	82
1167	2022-03-21 02:20:15	2022-03-21 02:20:15	\N	24	7	82
1168	2022-03-21 02:20:26	2022-03-21 02:20:26	\N	28	8	82
1169	2022-03-21 02:20:35	2022-03-21 02:20:35	\N	32	9	82
1170	2022-03-21 02:20:51	2022-03-21 02:20:51	\N	33	10	82
1171	2022-03-21 02:20:59	2022-03-21 02:20:59	\N	40	11	82
1172	2022-03-21 02:21:04	2022-03-21 02:21:04	\N	92	29	82
1173	2022-03-21 02:20:23	2022-03-21 02:20:23	\N	2	1	83
1174	2022-03-21 02:20:32	2022-03-21 02:20:32	\N	4	2	83
1175	2022-03-21 02:20:47	2022-03-21 02:20:47	\N	42	12	83
1176	2022-03-21 02:20:54	2022-03-21 02:20:54	\N	46	13	83
1177	2022-03-21 02:21:07	2022-03-21 02:21:07	\N	47	14	83
1178	2022-03-21 02:21:15	2022-03-21 02:21:15	\N	50	15	83
1179	2022-03-21 02:21:20	2022-03-21 02:21:20	\N	53	16	83
1180	2022-03-21 02:21:24	2022-03-21 02:21:24	\N	56	17	83
1181	2022-03-21 02:21:30	2022-03-21 02:21:30	\N	60	18	83
1182	2022-03-21 02:21:35	2022-03-21 02:21:35	\N	62	19	83
1183	2022-03-21 02:21:39	2022-03-21 02:21:39	\N	65	20	83
1184	2022-03-21 02:21:43	2022-03-21 02:21:43	\N	68	21	83
1185	2022-03-21 02:21:48	2022-03-21 02:21:48	\N	72	22	83
1186	2022-03-21 02:21:54	2022-03-21 02:21:54	\N	74	23	83
1187	2022-03-21 02:22:00	2022-03-21 02:22:00	\N	79	24	83
1188	2022-03-21 02:22:06	2022-03-21 02:22:06	\N	80	25	83
1189	2022-03-21 02:22:13	2022-03-21 02:22:13	\N	84	26	83
1190	2022-03-21 02:22:18	2022-03-21 02:22:18	\N	86	27	83
1191	2022-03-21 02:22:23	2022-03-21 02:22:23	\N	90	28	83
1192	2022-03-21 02:22:25	2022-03-21 02:22:25	\N	92	29	83
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.states (id, created_at, updated_at, deleted_at, code, description, name, "order", state, type) FROM stdin;
1	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	NOT_ASSIGNED	\N	SIN ASIGNAR	1	t	App/Models/Psychology/Tests
2	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	ASSIGNED	\N	ASIGNADO	2	t	App/Models/Psychology/Tests
3	2022-03-03 23:26:22	2022-03-03 23:26:22	\N	FINISHED	\N	CERRADO	3	t	App/Models/Psychology/Tests
\.


--
-- Data for Name: tests; Type: TABLE DATA; Schema: psychology; Owner: postgres
--

COPY psychology.tests (id, created_at, updated_at, deleted_at, canton_id, priority_id, province_id, state_id, user_id, age, code, score, terms_conditions, type) FROM stdin;
30	2022-03-18 11:51:00	2022-03-18 11:51:00	\N	459	3	266	1	20	18	18-30-1724581218	8	t	phq9a
1	2022-03-03 23:49:05	2022-03-03 23:50:30	\N	451	1	265	3	5	18	17-1-172490443	16	t	phq9a
31	2022-03-18 11:57:35	2022-03-18 11:57:36	\N	451	2	265	1	36	18	17-31-1725985368	11	t	phq9a
2	2022-03-04 00:03:06	2022-03-04 00:07:02	\N	451	1	265	2	6	12	17-2-12123423	21	t	phq9a
3	2022-03-04 09:12:38	2022-03-04 09:12:39	\N	451	3	265	1	7	16	17-3-1724581228	5	t	psc17
4	2022-03-04 20:51:48	2022-03-04 20:51:48	\N	451	4	265	1	8	18	17-4-1712728060	10	t	psc17
5	2022-03-04 22:21:26	2022-03-04 22:21:26	\N	451	3	265	1	9	18	17-5-1724909443	4	t	phq9a
6	2022-03-07 18:02:55	2022-03-07 18:02:57	\N	451	1	265	1	10	18	17-6-18737118	19	t	phq9a
7	2022-03-07 23:15:53	2022-03-07 23:17:48	\N	451	3	265	2	11	18	17-7-1724229651	2	t	psc17
8	2022-03-10 10:14:35	2022-03-10 10:14:37	\N	307	1	252	1	15	18	04-8-2342341234	14	t	phq9a
9	2022-03-11 16:59:12	2022-03-11 16:59:13	\N	289	4	250	1	17	18	02-9-8173727181	9	t	psc17
10	2022-03-11 17:02:13	2022-03-11 17:02:14	\N	289	1	250	1	18	18	02-10-18382818	17	t	phq9a
32	2022-03-18 11:59:01	2022-03-18 11:59:01	\N	451	3	265	1	37	18	17-32-1105542094	5	t	phq9a
33	2022-03-18 12:01:21	2022-03-18 12:01:21	\N	321	2	254	1	38	18	06-33-1727271818	18	t	psc17
14	2022-03-12 17:33:15	2022-03-12 17:38:07	\N	292	1	250	2	23	18	02-14-1874819191	25	t	phq9a
13	2022-03-12 17:30:54	2022-03-12 17:38:24	\N	305	1	252	2	22	18	04-13-1836711881	29	t	phq9a
11	2022-03-11 17:11:36	2022-03-12 17:41:00	2022-03-12 17:41:00	289	3	250	1	19	18	02-11-18371818	2	t	phq9a
12	2022-03-11 17:33:17	2022-03-12 17:41:00	2022-03-12 17:41:00	289	2	250	1	21	18	02-12-1947181819	19	t	psc17
15	2022-03-14 22:29:21	2022-03-14 22:29:24	\N	451	1	265	1	9	18	17-15-1724909443	16	t	phq9a
16	2022-03-14 22:36:45	2022-03-14 22:36:47	\N	292	1	250	1	24	18	02-16-1123123123	25	t	phq9a
17	2022-03-15 16:50:59	2022-03-15 16:50:59	\N	451	3	265	1	25	15	17-17-1750249920	8	t	phq9a
19	2022-03-15 19:27:16	2022-03-15 19:27:16	\N	292	2	250	1	27	18	02-19-1724619371	21	t	psc17
20	2022-03-17 21:06:56	2022-03-17 21:06:56	\N	316	\N	254	1	28	18	\N	0	t	phq9a
21	2022-03-17 21:39:06	2022-03-17 21:39:06	\N	451	\N	265	1	29	18	\N	0	t	phq9a
22	2022-03-17 21:39:15	2022-03-17 21:39:15	\N	321	4	254	1	6	18	06-22-1717175366	0	t	psc17
23	2022-03-17 21:49:38	2022-03-17 21:49:38	\N	451	\N	265	1	30	18	\N	0	t	phq9a
24	2022-03-17 21:52:35	2022-03-17 21:52:35	\N	292	\N	250	1	31	18	\N	0	t	phq9a
25	2022-03-17 21:55:38	2022-03-17 21:55:39	\N	451	1	265	1	32	18	17-25-1231231312	19	t	phq9a
26	2022-03-18 11:49:59	2022-03-18 11:50:00	\N	451	4	265	1	1	18	17-26-1234567890	2	t	psc17
27	2022-03-18 11:50:02	2022-03-18 11:50:03	\N	451	3	265	1	33	18	17-27-0780448838	6	t	phq9a
28	2022-03-18 11:50:35	2022-03-18 11:50:35	\N	460	4	266	1	34	18	18-28-0931063663	8	t	psc17
29	2022-03-18 11:50:51	2022-03-18 11:50:51	\N	451	2	265	1	35	18	17-29-0984817903	19	t	phq9a
34	2022-03-18 13:16:09	2022-03-18 13:16:11	\N	292	1	250	1	39	12	02-34-1231231231	18	t	phq9a
35	2022-03-18 13:24:12	2022-03-18 13:24:14	\N	455	1	265	1	40	18	17-35-3123123123	19	t	phq9a
36	2022-03-18 14:30:56	2022-03-18 14:30:56	\N	452	3	265	1	41	18	17-36-1727725002	9	t	phq9a
37	2022-03-18 14:31:03	2022-03-18 14:31:04	\N	303	1	252	1	20	18	04-37-1724581218	11	t	phq9a
38	2022-03-18 14:31:22	2022-03-18 14:31:22	\N	451	2	265	1	42	18	17-38-1753032828	12	t	phq9a
39	2022-03-18 16:40:05	2022-03-18 16:40:06	\N	451	4	265	1	43	18	17-39-1722505466	4	t	phq9a
40	2022-03-18 16:42:32	2022-03-18 16:42:34	\N	451	1	265	1	44	18	17-40-614354	13	t	phq9a
41	2022-03-18 16:42:39	2022-03-18 16:42:39	\N	459	4	266	1	45	18	18-41-1804672184	12	t	psc17
42	2022-03-18 16:44:18	2022-03-18 16:44:18	\N	303	3	252	1	46	18	04-42-0401819362	6	t	phq9a
43	2022-03-18 16:44:25	2022-03-18 16:44:25	\N	316	2	254	1	47	18	06-43-0601916380	2	t	psc17
44	2022-03-18 16:44:28	2022-03-18 16:44:28	\N	289	2	250	1	48	18	02-44-1709999690	5	t	psc17
45	2022-03-18 16:45:04	2022-03-18 16:45:04	\N	289	2	250	1	49	18	02-45-0201580263	2	t	phq9a
46	2022-03-18 16:46:35	2022-03-18 16:46:35	\N	459	2	266	1	50	18	18-46-1804133286	15	t	psc17
47	2022-03-18 16:48:33	2022-03-18 16:48:33	\N	316	2	254	1	51	18	06-47-0603332032	10	t	phq9a
48	2022-03-18 17:17:44	2022-03-18 17:17:45	\N	459	2	266	1	52	18	18-48-0502041866	15	t	psc17
49	2022-03-18 17:28:56	2022-03-18 17:28:56	\N	451	4	265	1	53	15	17-49-9282828119	12	t	psc17
50	2022-03-18 17:33:00	2022-03-18 17:33:00	\N	459	2	266	1	52	15	18-50-0502041866	15	t	phq9a
51	2022-03-18 18:13:35	2022-03-18 18:13:37	\N	459	1	266	1	54	18	18-51-1723801923	15	t	phq9a
52	2022-03-18 18:13:39	2022-03-18 18:13:40	\N	316	1	254	1	47	18	06-52-0601916380	14	t	phq9a
54	2022-03-18 18:13:39	2022-03-18 18:13:41	\N	451	1	265	1	43	18	17-54-1722505466	11	t	phq9a
53	2022-03-18 18:13:39	2022-03-18 18:13:42	\N	459	1	266	1	52	18	18-53-0502041866	15	t	phq9a
55	2022-03-18 18:14:18	2022-03-18 18:14:19	\N	451	1	265	1	55	18	17-55-7377777	23	t	phq9a
56	2022-03-18 18:17:57	2022-03-18 18:17:58	\N	289	1	250	1	49	18	02-56-0201580263	17	t	phq9a
57	2022-03-19 13:42:59	2022-03-19 13:43:00	\N	303	1	252	1	56	17	04-57-0402043368	17	t	phq9a
58	2022-03-19 13:53:19	2022-03-19 13:53:19	\N	303	2	252	1	57	13	04-58-0402124143	6	t	psc17
59	2022-03-19 15:07:57	2022-03-19 15:07:57	\N	303	2	252	1	58	16	04-59-0450235320	11	t	psc17
60	2022-03-19 15:19:41	2022-03-19 15:19:41	\N	303	2	252	1	59	18	04-60-0450075551	16	t	phq9a
61	2022-03-19 15:29:01	2022-03-19 15:29:01	\N	303	2	252	1	60	17	04-61-0450042122	7	t	psc17
62	2022-03-19 15:29:47	2022-03-19 15:29:47	\N	303	3	252	1	61	17	04-62-0402193379	7	t	phq9a
63	2022-03-19 15:30:10	2022-03-19 15:30:10	\N	303	2	252	1	62	17	04-63-0450168489	10	t	phq9a
64	2022-03-19 15:30:19	2022-03-19 15:30:20	\N	303	2	252	1	63	18	04-64-0450168760	14	t	psc17
65	2022-03-19 15:32:55	2022-03-19 15:32:55	\N	303	2	252	1	64	17	04-65-0402053078	10	t	phq9a
66	2022-03-19 15:35:09	2022-03-19 15:35:09	\N	303	2	252	1	65	18	04-66-0450138656	8	t	psc17
67	2022-03-19 15:38:55	2022-03-19 15:38:56	\N	303	2	252	1	66	17	04-67-0402102875	4	t	psc17
68	2022-03-19 15:40:45	2022-03-19 15:40:45	\N	303	3	252	1	67	18	04-68-0401822424	8	t	phq9a
69	2022-03-19 15:40:45	2022-03-19 15:40:45	\N	303	4	252	1	68	18	04-69-0402040935	7	t	psc17
70	2022-03-19 15:43:39	2022-03-19 15:43:39	\N	303	4	252	1	69	18	04-70-0400858783	2	t	phq9a
71	2022-03-19 19:06:15	2022-03-19 19:06:17	\N	303	1	252	1	70	17	04-71-0402006886	26	t	phq9a
72	2022-03-19 20:32:49	2022-03-19 20:32:50	\N	303	1	252	1	71	15	04-72-0450217054	7	t	phq9a
73	2022-03-19 20:39:10	2022-03-19 20:39:10	\N	303	4	252	1	72	12	04-73-0450142575	5	t	psc17
74	2022-03-20 16:29:34	2022-03-20 16:29:34	\N	316	4	254	1	73	15	06-74-0606244887	4	t	psc17
75	2022-03-20 17:16:58	2022-03-20 17:16:58	\N	316	4	254	1	74	15	06-75-0605935543	3	t	phq9a
76	2022-03-20 17:25:29	2022-03-20 17:25:30	\N	316	1	254	1	75	15	06-76-0650113400	20	t	phq9a
77	2022-03-20 17:28:33	2022-03-20 17:28:33	\N	460	2	266	1	76	14	18-77-0602987433	15	t	phq9a
78	2022-03-20 17:40:08	2022-03-20 17:40:10	\N	451	1	265	1	77	18	17-78-0605847888	21	t	phq9a
79	2022-03-20 20:31:50	2022-03-20 20:31:50	\N	316	2	254	1	78	18	06-79-1750331199	17	t	phq9a
80	2022-03-20 21:02:28	2022-03-20 21:02:28	\N	316	2	254	1	79	18	06-80-0604764225	15	t	phq9a
81	2022-03-20 21:13:33	2022-03-20 21:13:34	\N	316	3	254	1	80	16	06-81-1751402528	5	t	phq9a
82	2022-03-20 21:21:07	2022-03-20 21:21:09	\N	316	1	254	1	81	17	06-82-1727248039	25	t	phq9a
83	2022-03-20 21:22:27	2022-03-20 21:22:27	\N	316	2	254	1	82	16	06-83-0605999242	10	t	psc17
\.


--
-- Name: audits_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.audits_id_seq', 1815, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.failed_jobs_id_seq', 1, false);


--
-- Name: menus_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.menus_id_seq', 2, true);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.migrations_id_seq', 30, true);


--
-- Name: password_resets_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.password_resets_id_seq', 10, true);


--
-- Name: permissions_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.permissions_id_seq', 10, true);


--
-- Name: personal_access_tokens_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.personal_access_tokens_id_seq', 67, true);


--
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.roles_id_seq', 3, true);


--
-- Name: systems_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.systems_id_seq', 1, true);


--
-- Name: transactional_codes_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.transactional_codes_id_seq', 79, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: authentication; Owner: postgres
--

SELECT pg_catalog.setval('authentication.users_id_seq', 82, true);


--
-- Name: address_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.address_id_seq', 1, false);


--
-- Name: catalogues_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.catalogues_id_seq', 43, true);


--
-- Name: emails_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.emails_id_seq', 8, true);


--
-- Name: files_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.files_id_seq', 1, false);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.images_id_seq', 1, false);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.locations_id_seq', 497, true);


--
-- Name: phones_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.phones_id_seq', 8, true);


--
-- Name: socialmedia_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.socialmedia_id_seq', 1, false);


--
-- Name: socialmediables_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.socialmediables_id_seq', 1, false);


--
-- Name: stateables_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.stateables_id_seq', 1, false);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: core; Owner: postgres
--

SELECT pg_catalog.setval('core.states_id_seq', 7, true);


--
-- Name: agents_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.agents_id_seq', 24, true);


--
-- Name: answers_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.answers_id_seq', 93, true);


--
-- Name: assignments_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.assignments_id_seq', 5, true);


--
-- Name: catalogues_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.catalogues_id_seq', 1, false);


--
-- Name: institutions_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.institutions_id_seq', 8, true);


--
-- Name: priorities_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.priorities_id_seq', 4, true);


--
-- Name: questions_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.questions_id_seq', 29, true);


--
-- Name: results_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.results_id_seq', 1192, true);


--
-- Name: states_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.states_id_seq', 3, true);


--
-- Name: tests_id_seq; Type: SEQUENCE SET; Schema: psychology; Owner: postgres
--

SELECT pg_catalog.setval('psychology.tests_id_seq', 83, true);


--
-- Name: audits audits_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.audits
    ADD CONSTRAINT audits_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: menus menus_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.menus
    ADD CONSTRAINT menus_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: model_has_permissions model_has_permissions_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.model_has_permissions
    ADD CONSTRAINT model_has_permissions_pkey PRIMARY KEY (permission_id, model_id, model_type);


--
-- Name: model_has_roles model_has_roles_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.model_has_roles
    ADD CONSTRAINT model_has_roles_pkey PRIMARY KEY (role_id, model_id, model_type);


--
-- Name: password_resets password_resets_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.password_resets
    ADD CONSTRAINT password_resets_pkey PRIMARY KEY (id);


--
-- Name: permissions permissions_name_guard_name_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.permissions
    ADD CONSTRAINT permissions_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: permissions permissions_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_pkey PRIMARY KEY (id);


--
-- Name: personal_access_tokens personal_access_tokens_token_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.personal_access_tokens
    ADD CONSTRAINT personal_access_tokens_token_unique UNIQUE (token);


--
-- Name: role_has_permissions role_has_permissions_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.role_has_permissions
    ADD CONSTRAINT role_has_permissions_pkey PRIMARY KEY (permission_id, role_id);


--
-- Name: roles roles_name_guard_name_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.roles
    ADD CONSTRAINT roles_name_guard_name_unique UNIQUE (name, guard_name);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (id);


--
-- Name: transactional_codes transactional_codes_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.transactional_codes
    ADD CONSTRAINT transactional_codes_pkey PRIMARY KEY (id);


--
-- Name: users users_avatar_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_avatar_unique UNIQUE (avatar);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_unique; Type: CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_username_unique UNIQUE (username);


--
-- Name: address address_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.address
    ADD CONSTRAINT address_pkey PRIMARY KEY (id);


--
-- Name: catalogues catalogues_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);


--
-- Name: emails emails_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.emails
    ADD CONSTRAINT emails_pkey PRIMARY KEY (id);


--
-- Name: files files_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.files
    ADD CONSTRAINT files_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: socialmedia socialmedia_name_unique; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmedia
    ADD CONSTRAINT socialmedia_name_unique UNIQUE (name);


--
-- Name: socialmedia socialmedia_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmedia
    ADD CONSTRAINT socialmedia_pkey PRIMARY KEY (id);


--
-- Name: socialmediables socialmediables_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmediables
    ADD CONSTRAINT socialmediables_pkey PRIMARY KEY (id);


--
-- Name: socialmediables socialmediables_socialmedia_id_user_unique; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmediables
    ADD CONSTRAINT socialmediables_socialmedia_id_user_unique UNIQUE (socialmedia_id, "user");


--
-- Name: stateables stateables_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.stateables
    ADD CONSTRAINT stateables_pkey PRIMARY KEY (id);


--
-- Name: stateables stateables_state_id_stateable_id_stateable_type_unique; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.stateables
    ADD CONSTRAINT stateables_state_id_stateable_id_stateable_type_unique UNIQUE (state_id, stateable_id, stateable_type);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: agents agents_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.agents
    ADD CONSTRAINT agents_pkey PRIMARY KEY (id);


--
-- Name: answers answers_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.answers
    ADD CONSTRAINT answers_pkey PRIMARY KEY (id);


--
-- Name: assignments assignments_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.assignments
    ADD CONSTRAINT assignments_pkey PRIMARY KEY (id);


--
-- Name: catalogues catalogues_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.catalogues
    ADD CONSTRAINT catalogues_pkey PRIMARY KEY (id);


--
-- Name: catalogues catalogues_type_unique; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.catalogues
    ADD CONSTRAINT catalogues_type_unique UNIQUE (type);


--
-- Name: institutions institutions_code_unique; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.institutions
    ADD CONSTRAINT institutions_code_unique UNIQUE (code);


--
-- Name: institutions institutions_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.institutions
    ADD CONSTRAINT institutions_pkey PRIMARY KEY (id);


--
-- Name: institutions institutions_short_name_unique; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.institutions
    ADD CONSTRAINT institutions_short_name_unique UNIQUE (short_name);


--
-- Name: priorities priorities_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.priorities
    ADD CONSTRAINT priorities_pkey PRIMARY KEY (id);


--
-- Name: questions questions_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.questions
    ADD CONSTRAINT questions_pkey PRIMARY KEY (id);


--
-- Name: results results_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.results
    ADD CONSTRAINT results_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: tests tests_pkey; Type: CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_pkey PRIMARY KEY (id);


--
-- Name: audits_auditable_type_auditable_id_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX audits_auditable_type_auditable_id_index ON authentication.audits USING btree (auditable_type, auditable_id);


--
-- Name: audits_user_id_user_type_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX audits_user_id_user_type_index ON authentication.audits USING btree (user_id, user_type);


--
-- Name: model_has_permissions_model_id_model_type_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX model_has_permissions_model_id_model_type_index ON authentication.model_has_permissions USING btree (model_id, model_type);


--
-- Name: model_has_roles_model_id_model_type_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX model_has_roles_model_id_model_type_index ON authentication.model_has_roles USING btree (model_id, model_type);


--
-- Name: password_resets_username_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX password_resets_username_index ON authentication.password_resets USING btree (username);


--
-- Name: personal_access_tokens_tokenable_type_tokenable_id_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX personal_access_tokens_tokenable_type_tokenable_id_index ON authentication.personal_access_tokens USING btree (tokenable_type, tokenable_id);


--
-- Name: transactional_codes_token_index; Type: INDEX; Schema: authentication; Owner: postgres
--

CREATE INDEX transactional_codes_token_index ON authentication.transactional_codes USING btree (token);


--
-- Name: emails_emailable_type_emailable_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX emails_emailable_type_emailable_id_index ON core.emails USING btree (emailable_type, emailable_id);


--
-- Name: files_fileable_type_fileable_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX files_fileable_type_fileable_id_index ON core.files USING btree (fileable_type, fileable_id);


--
-- Name: images_imageable_type_imageable_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX images_imageable_type_imageable_id_index ON core.images USING btree (imageable_type, imageable_id);


--
-- Name: phones_phoneable_type_phoneable_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX phones_phoneable_type_phoneable_id_index ON core.phones USING btree (phoneable_type, phoneable_id);


--
-- Name: socialmediables_socialmediables_type_socialmediables_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX socialmediables_socialmediables_type_socialmediables_id_index ON core.socialmediables USING btree (socialmediables_type, socialmediables_id);


--
-- Name: stateables_stateable_type_stateable_id_index; Type: INDEX; Schema: core; Owner: postgres
--

CREATE INDEX stateables_stateable_type_stateable_id_index ON core.stateables USING btree (stateable_type, stateable_id);


--
-- Name: menus menus_parent_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.menus
    ADD CONSTRAINT menus_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES authentication.menus(id);


--
-- Name: menus menus_role_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.menus
    ADD CONSTRAINT menus_role_id_foreign FOREIGN KEY (role_id) REFERENCES authentication.roles(id);


--
-- Name: model_has_permissions model_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.model_has_permissions
    ADD CONSTRAINT model_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES authentication.permissions(id) ON DELETE CASCADE;


--
-- Name: model_has_roles model_has_roles_role_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.model_has_roles
    ADD CONSTRAINT model_has_roles_role_id_foreign FOREIGN KEY (role_id) REFERENCES authentication.roles(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_permission_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.role_has_permissions
    ADD CONSTRAINT role_has_permissions_permission_id_foreign FOREIGN KEY (permission_id) REFERENCES authentication.permissions(id) ON DELETE CASCADE;


--
-- Name: role_has_permissions role_has_permissions_role_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.role_has_permissions
    ADD CONSTRAINT role_has_permissions_role_id_foreign FOREIGN KEY (role_id) REFERENCES authentication.roles(id) ON DELETE CASCADE;


--
-- Name: users users_blood_type_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_blood_type_id_foreign FOREIGN KEY (blood_type_id) REFERENCES core.catalogues(id);


--
-- Name: users users_civil_status_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_civil_status_id_foreign FOREIGN KEY (civil_status_id) REFERENCES core.catalogues(id);


--
-- Name: users users_ethnic_origin_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_ethnic_origin_id_foreign FOREIGN KEY (ethnic_origin_id) REFERENCES core.catalogues(id);


--
-- Name: users users_gender_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_gender_id_foreign FOREIGN KEY (gender_id) REFERENCES core.catalogues(id);


--
-- Name: users users_identification_type_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_identification_type_id_foreign FOREIGN KEY (identification_type_id) REFERENCES core.catalogues(id);


--
-- Name: users users_sex_id_foreign; Type: FK CONSTRAINT; Schema: authentication; Owner: postgres
--

ALTER TABLE ONLY authentication.users
    ADD CONSTRAINT users_sex_id_foreign FOREIGN KEY (sex_id) REFERENCES core.catalogues(id);


--
-- Name: address address_location_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.address
    ADD CONSTRAINT address_location_id_foreign FOREIGN KEY (location_id) REFERENCES core.locations(id);


--
-- Name: address address_sector_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.address
    ADD CONSTRAINT address_sector_id_foreign FOREIGN KEY (sector_id) REFERENCES core.catalogues(id);


--
-- Name: catalogues catalogues_parent_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.catalogues
    ADD CONSTRAINT catalogues_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES core.catalogues(id);


--
-- Name: locations locations_parent_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.locations
    ADD CONSTRAINT locations_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES core.locations(id);


--
-- Name: locations locations_type_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.locations
    ADD CONSTRAINT locations_type_id_foreign FOREIGN KEY (type_id) REFERENCES core.catalogues(id);


--
-- Name: phones phones_location_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.phones
    ADD CONSTRAINT phones_location_id_foreign FOREIGN KEY (location_id) REFERENCES core.locations(id);


--
-- Name: phones phones_operator_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.phones
    ADD CONSTRAINT phones_operator_id_foreign FOREIGN KEY (operator_id) REFERENCES core.catalogues(id);


--
-- Name: phones phones_type_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.phones
    ADD CONSTRAINT phones_type_id_foreign FOREIGN KEY (type_id) REFERENCES core.catalogues(id);


--
-- Name: socialmediables socialmediables_socialmedia_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.socialmediables
    ADD CONSTRAINT socialmediables_socialmedia_id_foreign FOREIGN KEY (socialmedia_id) REFERENCES core.socialmedia(id);


--
-- Name: stateables stateables_state_id_foreign; Type: FK CONSTRAINT; Schema: core; Owner: postgres
--

ALTER TABLE ONLY core.stateables
    ADD CONSTRAINT stateables_state_id_foreign FOREIGN KEY (state_id) REFERENCES core.states(id);


--
-- Name: agents agents_test_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.agents
    ADD CONSTRAINT agents_test_id_foreign FOREIGN KEY (test_id) REFERENCES psychology.tests(id);


--
-- Name: answers answers_question_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.answers
    ADD CONSTRAINT answers_question_id_foreign FOREIGN KEY (question_id) REFERENCES psychology.questions(id);


--
-- Name: assignments assignments_institution_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.assignments
    ADD CONSTRAINT assignments_institution_id_foreign FOREIGN KEY (institution_id) REFERENCES psychology.institutions(id);


--
-- Name: assignments assignments_test_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.assignments
    ADD CONSTRAINT assignments_test_id_foreign FOREIGN KEY (test_id) REFERENCES psychology.tests(id);


--
-- Name: assignments assignments_user_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.assignments
    ADD CONSTRAINT assignments_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);


--
-- Name: catalogues catalogues_parent_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.catalogues
    ADD CONSTRAINT catalogues_parent_id_foreign FOREIGN KEY (parent_id) REFERENCES psychology.catalogues(id);


--
-- Name: institutions institutions_address_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.institutions
    ADD CONSTRAINT institutions_address_id_foreign FOREIGN KEY (address_id) REFERENCES core.address(id);


--
-- Name: results results_answer_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.results
    ADD CONSTRAINT results_answer_id_foreign FOREIGN KEY (answer_id) REFERENCES psychology.answers(id);


--
-- Name: results results_question_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.results
    ADD CONSTRAINT results_question_id_foreign FOREIGN KEY (question_id) REFERENCES psychology.questions(id);


--
-- Name: results results_test_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.results
    ADD CONSTRAINT results_test_id_foreign FOREIGN KEY (test_id) REFERENCES psychology.tests(id);


--
-- Name: tests tests_canton_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_canton_id_foreign FOREIGN KEY (canton_id) REFERENCES core.locations(id);


--
-- Name: tests tests_priority_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_priority_id_foreign FOREIGN KEY (priority_id) REFERENCES psychology.priorities(id);


--
-- Name: tests tests_province_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_province_id_foreign FOREIGN KEY (province_id) REFERENCES core.locations(id);


--
-- Name: tests tests_state_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_state_id_foreign FOREIGN KEY (state_id) REFERENCES psychology.states(id);


--
-- Name: tests tests_user_id_foreign; Type: FK CONSTRAINT; Schema: psychology; Owner: postgres
--

ALTER TABLE ONLY psychology.tests
    ADD CONSTRAINT tests_user_id_foreign FOREIGN KEY (user_id) REFERENCES authentication.users(id);


--
-- PostgreSQL database dump complete
--

