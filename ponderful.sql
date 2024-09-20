--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

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
-- Name: tiger_data; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA tiger_data;


ALTER SCHEMA tiger_data OWNER TO postgres;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry and geography spatial types and functions';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id bigint NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: ponderful_mcda_action_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_action_types (
    id bigint NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ponderful_mcda_action_types OWNER TO postgres;

--
-- Name: ponderful_mcda_action_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_action_types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_action_types_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_action_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_action_types_id_seq OWNED BY public.ponderful_mcda_action_types.id;


--
-- Name: ponderful_mcda_alternatives_params; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_alternatives_params (
    id bigint NOT NULL,
    pond_min integer NOT NULL,
    pond_max integer NOT NULL,
    pond_size character varying(255) NOT NULL,
    action_id bigint NOT NULL,
    user_id bigint NOT NULL,
    analysis_run_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_alternatives_params OWNER TO postgres;

--
-- Name: ponderful_mcda_alternatives_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_alternatives_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_alternatives_params_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_alternatives_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_alternatives_params_id_seq OWNED BY public.ponderful_mcda_alternatives_params.id;


--
-- Name: ponderful_mcda_analysisrun; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_analysisrun (
    id bigint NOT NULL,
    created_at timestamp with time zone NOT NULL,
    user_id bigint NOT NULL,
    analysis_number integer NOT NULL
);


ALTER TABLE public.ponderful_mcda_analysisrun OWNER TO postgres;

--
-- Name: ponderful_mcda_analysisrun_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_analysisrun_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_analysisrun_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_analysisrun_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_analysisrun_id_seq OWNED BY public.ponderful_mcda_analysisrun.id;


--
-- Name: ponderful_mcda_criteria; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_criteria (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    unit_of_measure character varying(255) NOT NULL,
    name_en character varying(255),
    name_fr character varying(255),
    unit_of_measure_en character varying(255),
    unit_of_measure_fr character varying(255)
);


ALTER TABLE public.ponderful_mcda_criteria OWNER TO postgres;

--
-- Name: ponderful_mcda_criteria_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_criteria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_criteria_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_criteria_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_criteria_id_seq OWNED BY public.ponderful_mcda_criteria.id;


--
-- Name: ponderful_mcda_criteria_params; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_criteria_params (
    id bigint NOT NULL,
    weight double precision NOT NULL,
    rank integer NOT NULL,
    criteria_id bigint NOT NULL,
    study_area_id bigint NOT NULL,
    user_id bigint NOT NULL,
    weight_range double precision[],
    weight_percentage double precision NOT NULL,
    analysis_run_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_criteria_params OWNER TO postgres;

--
-- Name: ponderful_mcda_criteria_params_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_criteria_params_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_criteria_params_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_criteria_params_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_criteria_params_id_seq OWNED BY public.ponderful_mcda_criteria_params.id;


--
-- Name: ponderful_mcda_customuser; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_customuser (
    id bigint NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    organization character varying(255) NOT NULL
);


ALTER TABLE public.ponderful_mcda_customuser OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_customuser_groups (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.ponderful_mcda_customuser_groups OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_customuser_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_customuser_groups_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_customuser_groups_id_seq OWNED BY public.ponderful_mcda_customuser_groups.id;


--
-- Name: ponderful_mcda_customuser_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_customuser_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_customuser_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_customuser_id_seq OWNED BY public.ponderful_mcda_customuser.id;


--
-- Name: ponderful_mcda_customuser_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_customuser_user_permissions (
    id bigint NOT NULL,
    customuser_id bigint NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.ponderful_mcda_customuser_user_permissions OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_customuser_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_customuser_user_permissions_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_customuser_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_customuser_user_permissions_id_seq OWNED BY public.ponderful_mcda_customuser_user_permissions.id;


--
-- Name: ponderful_mcda_mcda_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_mcda_result (
    id bigint NOT NULL,
    alternative character varying(255) NOT NULL,
    model_result double precision NOT NULL,
    weight double precision NOT NULL,
    partial_satisfaction double precision NOT NULL,
    weighted_avg double precision NOT NULL,
    analysis_run_id bigint NOT NULL,
    criteria_id bigint NOT NULL,
    scenario_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_mcda_result OWNER TO postgres;

--
-- Name: ponderful_mcda_mcda_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_mcda_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_mcda_result_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_mcda_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_mcda_result_id_seq OWNED BY public.ponderful_mcda_mcda_result.id;


--
-- Name: ponderful_mcda_modeling_result; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_modeling_result (
    id bigint NOT NULL,
    pond_num integer,
    output double precision NOT NULL,
    action_id bigint NOT NULL,
    criteria_id bigint NOT NULL,
    scenario_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_modeling_result OWNER TO postgres;

--
-- Name: ponderful_mcda_modeling_result_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_modeling_result_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_modeling_result_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_modeling_result_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_modeling_result_id_seq OWNED BY public.ponderful_mcda_modeling_result.id;


--
-- Name: ponderful_mcda_satisfaction_threshold; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_satisfaction_threshold (
    id bigint NOT NULL,
    threshold_min double precision NOT NULL,
    threshold_max double precision NOT NULL,
    criteria_id_id bigint NOT NULL,
    study_area_id bigint NOT NULL,
    user_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_satisfaction_threshold OWNER TO postgres;

--
-- Name: ponderful_mcda_satisfaction_threshold_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_satisfaction_threshold_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_satisfaction_threshold_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_satisfaction_threshold_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_satisfaction_threshold_id_seq OWNED BY public.ponderful_mcda_satisfaction_threshold.id;


--
-- Name: ponderful_mcda_scenario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_scenario (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.ponderful_mcda_scenario OWNER TO postgres;

--
-- Name: ponderful_mcda_scenario_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_scenario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_scenario_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_scenario_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_scenario_id_seq OWNED BY public.ponderful_mcda_scenario.id;


--
-- Name: ponderful_mcda_scenario_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_scenario_user (
    id bigint NOT NULL,
    analysis_run_id bigint NOT NULL,
    scenario_type_id bigint NOT NULL
);


ALTER TABLE public.ponderful_mcda_scenario_user OWNER TO postgres;

--
-- Name: ponderful_mcda_scenario_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_scenario_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_scenario_user_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_scenario_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_scenario_user_id_seq OWNED BY public.ponderful_mcda_scenario_user.id;


--
-- Name: ponderful_mcda_studyarea; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ponderful_mcda_studyarea (
    id bigint NOT NULL,
    landuseintensity character varying(255) NOT NULL,
    num_small_pond integer,
    num_avg_pond integer,
    num_big_pond integer,
    geom public.geometry(Polygon,4326) NOT NULL,
    user_id bigint,
    name character varying(255) NOT NULL
);


ALTER TABLE public.ponderful_mcda_studyarea OWNER TO postgres;

--
-- Name: ponderful_mcda_studyarea_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ponderful_mcda_studyarea_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ponderful_mcda_studyarea_id_seq OWNER TO postgres;

--
-- Name: ponderful_mcda_studyarea_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ponderful_mcda_studyarea_id_seq OWNED BY public.ponderful_mcda_studyarea.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: ponderful_mcda_action_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_action_types ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_action_types_id_seq'::regclass);


--
-- Name: ponderful_mcda_alternatives_params id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_alternatives_params ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_alternatives_params_id_seq'::regclass);


--
-- Name: ponderful_mcda_analysisrun id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_analysisrun ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_analysisrun_id_seq'::regclass);


--
-- Name: ponderful_mcda_criteria id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_criteria_id_seq'::regclass);


--
-- Name: ponderful_mcda_criteria_params id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_criteria_params_id_seq'::regclass);


--
-- Name: ponderful_mcda_customuser id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_customuser_id_seq'::regclass);


--
-- Name: ponderful_mcda_customuser_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_groups ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_customuser_groups_id_seq'::regclass);


--
-- Name: ponderful_mcda_customuser_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_customuser_user_permissions_id_seq'::regclass);


--
-- Name: ponderful_mcda_mcda_result id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_mcda_result_id_seq'::regclass);


--
-- Name: ponderful_mcda_modeling_result id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_modeling_result ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_modeling_result_id_seq'::regclass);


--
-- Name: ponderful_mcda_satisfaction_threshold id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_satisfaction_threshold ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_satisfaction_threshold_id_seq'::regclass);


--
-- Name: ponderful_mcda_scenario id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_scenario_id_seq'::regclass);


--
-- Name: ponderful_mcda_scenario_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario_user ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_scenario_user_id_seq'::regclass);


--
-- Name: ponderful_mcda_studyarea id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_studyarea ALTER COLUMN id SET DEFAULT nextval('public.ponderful_mcda_studyarea_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add content type	4	add_contenttype
14	Can change content type	4	change_contenttype
15	Can delete content type	4	delete_contenttype
16	Can view content type	4	view_contenttype
17	Can add session	5	add_session
18	Can change session	5	change_session
19	Can delete session	5	delete_session
20	Can view session	5	view_session
21	Can add user	6	add_customuser
22	Can change user	6	change_customuser
23	Can delete user	6	delete_customuser
24	Can view user	6	view_customuser
25	Can add studyarea	7	add_studyarea
26	Can change studyarea	7	change_studyarea
27	Can delete studyarea	7	delete_studyarea
28	Can view studyarea	7	view_studyarea
29	Can add criteria	8	add_criteria
30	Can change criteria	8	change_criteria
31	Can delete criteria	8	delete_criteria
32	Can view criteria	8	view_criteria
33	Can add criteria_params	9	add_criteria_params
34	Can change criteria_params	9	change_criteria_params
35	Can delete criteria_params	9	delete_criteria_params
36	Can view criteria_params	9	view_criteria_params
37	Can add satisfaction_threshold	10	add_satisfaction_threshold
38	Can change satisfaction_threshold	10	change_satisfaction_threshold
39	Can delete satisfaction_threshold	10	delete_satisfaction_threshold
40	Can view satisfaction_threshold	10	view_satisfaction_threshold
41	Can add action_types	11	add_action_types
42	Can change action_types	11	change_action_types
43	Can delete action_types	11	delete_action_types
44	Can view action_types	11	view_action_types
45	Can add alternatives_params	12	add_alternatives_params
46	Can change alternatives_params	12	change_alternatives_params
47	Can delete alternatives_params	12	delete_alternatives_params
48	Can view alternatives_params	12	view_alternatives_params
49	Can add analysis run	13	add_analysisrun
50	Can change analysis run	13	change_analysisrun
51	Can delete analysis run	13	delete_analysisrun
52	Can view analysis run	13	view_analysisrun
53	Can add scenario_user	14	add_scenario_user
54	Can change scenario_user	14	change_scenario_user
55	Can delete scenario_user	14	delete_scenario_user
56	Can view scenario_user	14	view_scenario_user
57	Can add scenario	15	add_scenario
58	Can change scenario	15	change_scenario
59	Can delete scenario	15	delete_scenario
60	Can view scenario	15	view_scenario
61	Can add test	16	add_test
62	Can change test	16	change_test
63	Can delete test	16	delete_test
64	Can view test	16	view_test
65	Can add modeling_result	17	add_modeling_result
66	Can change modeling_result	17	change_modeling_result
67	Can delete modeling_result	17	delete_modeling_result
68	Can view modeling_result	17	view_modeling_result
69	Can add mcda_result	18	add_mcda_result
70	Can change mcda_result	18	change_mcda_result
71	Can delete mcda_result	18	delete_mcda_result
72	Can view mcda_result	18	view_mcda_result
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2023-12-07 12:55:22.89027+00	1	criteria object (1)	1	[{"added": {}}]	8	1
2	2023-12-07 12:55:36.646111+00	2	criteria object (2)	1	[{"added": {}}]	8	1
3	2023-12-07 12:55:48.32915+00	3	criteria object (3)	1	[{"added": {}}]	8	1
4	2023-12-07 12:55:59.013973+00	4	criteria object (4)	1	[{"added": {}}]	8	1
5	2023-12-07 13:03:47.548621+00	5	criteria object (5)	1	[{"added": {}}]	8	1
6	2023-12-07 13:04:29.216237+00	6	criteria object (6)	1	[{"added": {}}]	8	1
7	2023-12-07 13:04:42.199392+00	7	criteria object (7)	1	[{"added": {}}]	8	1
8	2023-12-07 13:05:24.408884+00	8	criteria object (8)	1	[{"added": {}}]	8	1
9	2023-12-07 13:06:17.691855+00	9	criteria object (9)	1	[{"added": {}}]	8	1
10	2023-12-07 13:06:55.245875+00	10	criteria object (10)	1	[{"added": {}}]	8	1
11	2023-12-07 13:07:27.714583+00	11	criteria object (11)	1	[{"added": {}}]	8	1
12	2023-12-12 16:54:08.370168+00	12	studyarea object (12)	3		7	1
13	2023-12-12 16:54:08.374566+00	11	studyarea object (11)	3		7	1
14	2023-12-12 16:54:08.378713+00	10	studyarea object (10)	3		7	1
15	2023-12-12 16:54:08.381216+00	9	studyarea object (9)	3		7	1
16	2023-12-12 16:54:08.383457+00	8	studyarea object (8)	3		7	1
17	2023-12-12 16:54:08.385747+00	7	studyarea object (7)	3		7	1
18	2023-12-12 16:54:08.388089+00	6	studyarea object (6)	3		7	1
19	2023-12-12 16:54:08.390405+00	5	studyarea object (5)	3		7	1
20	2023-12-12 16:54:08.392385+00	4	studyarea object (4)	3		7	1
21	2023-12-12 16:54:08.394512+00	3	studyarea object (3)	3		7	1
22	2023-12-12 16:54:08.396444+00	2	studyarea object (2)	3		7	1
23	2023-12-12 16:55:58.722819+00	2	test	1	[{"added": {}}]	6	1
24	2023-12-12 16:57:20.026783+00	13	studyarea object (13)	1	[{"added": {}}]	7	1
25	2023-12-12 16:57:41.299769+00	1	studyarea object (1)	2	[{"changed": {"fields": ["Study Area Name"]}}]	7	1
26	2023-12-19 14:39:41.474988+00	14	studyarea object (14)	1	[{"added": {}}]	7	1
27	2023-12-19 15:54:08.465019+00	15	studyarea object (15)	1	[{"added": {}}]	7	1
28	2023-12-19 15:55:03.264873+00	15	studyarea object (15)	3		7	1
29	2023-12-19 15:59:01.190616+00	16	studyarea object (16)	1	[{"added": {}}]	7	1
30	2023-12-20 16:00:48.668574+00	1	criteria_params object (1)	1	[{"added": {}}]	9	1
31	2023-12-27 15:32:11.511905+00	1	criteria_params object (1)	3		9	1
64	2024-01-03 15:44:31.959801+00	52	criteria_params object (52)	3		9	1
65	2024-01-03 15:44:31.964539+00	51	criteria_params object (51)	3		9	1
66	2024-01-03 15:44:31.966652+00	50	criteria_params object (50)	3		9	1
67	2024-01-03 15:44:31.968574+00	49	criteria_params object (49)	3		9	1
68	2024-01-03 15:44:31.970286+00	48	criteria_params object (48)	3		9	1
69	2024-01-03 15:44:31.971903+00	47	criteria_params object (47)	3		9	1
70	2024-01-03 15:44:31.973566+00	46	criteria_params object (46)	3		9	1
71	2024-01-03 15:44:31.975171+00	45	criteria_params object (45)	3		9	1
72	2024-01-03 15:44:31.976647+00	44	criteria_params object (44)	3		9	1
73	2024-01-03 15:44:31.978089+00	43	criteria_params object (43)	3		9	1
74	2024-01-03 15:44:31.979752+00	42	criteria_params object (42)	3		9	1
75	2024-01-03 15:44:31.981052+00	41	criteria_params object (41)	3		9	1
76	2024-01-03 15:44:31.982382+00	40	criteria_params object (40)	3		9	1
77	2024-01-03 15:44:31.98395+00	39	criteria_params object (39)	3		9	1
78	2024-01-03 15:44:31.985298+00	38	criteria_params object (38)	3		9	1
79	2024-01-03 15:44:31.986722+00	37	criteria_params object (37)	3		9	1
80	2024-01-03 15:44:31.987973+00	36	criteria_params object (36)	3		9	1
81	2024-01-03 15:44:31.989314+00	35	criteria_params object (35)	3		9	1
82	2024-01-03 15:44:31.990901+00	34	criteria_params object (34)	3		9	1
83	2024-01-03 15:44:31.992544+00	33	criteria_params object (33)	3		9	1
84	2024-01-03 15:44:31.994233+00	32	criteria_params object (32)	3		9	1
85	2024-01-03 15:44:31.995885+00	31	criteria_params object (31)	3		9	1
86	2024-01-03 15:44:31.997521+00	28	criteria_params object (28)	3		9	1
87	2024-01-03 15:44:31.999414+00	27	criteria_params object (27)	3		9	1
88	2024-01-03 15:44:32.001245+00	26	criteria_params object (26)	3		9	1
89	2024-01-03 15:44:32.002754+00	25	criteria_params object (25)	3		9	1
90	2024-01-03 15:44:32.004208+00	24	criteria_params object (24)	3		9	1
91	2024-01-03 15:44:32.005423+00	23	criteria_params object (23)	3		9	1
92	2024-01-03 15:44:32.006888+00	22	criteria_params object (22)	3		9	1
93	2024-01-03 15:44:32.008265+00	21	criteria_params object (21)	3		9	1
94	2024-01-03 15:44:32.009598+00	20	criteria_params object (20)	3		9	1
95	2024-01-03 15:44:32.010869+00	19	criteria_params object (19)	3		9	1
96	2024-01-03 15:44:32.012073+00	18	criteria_params object (18)	3		9	1
97	2024-01-03 15:44:32.013394+00	17	criteria_params object (17)	3		9	1
98	2024-01-03 15:44:32.014387+00	16	criteria_params object (16)	3		9	1
99	2024-01-03 15:44:32.015994+00	15	criteria_params object (15)	3		9	1
100	2024-01-03 15:44:32.017719+00	14	criteria_params object (14)	3		9	1
101	2024-01-03 15:44:32.019116+00	13	criteria_params object (13)	3		9	1
102	2024-01-03 15:44:32.020438+00	12	criteria_params object (12)	3		9	1
103	2024-01-03 15:44:32.021616+00	11	criteria_params object (11)	3		9	1
104	2024-01-03 15:44:32.022888+00	10	criteria_params object (10)	3		9	1
105	2024-01-03 15:44:32.02431+00	9	criteria_params object (9)	3		9	1
106	2024-01-03 15:44:32.025805+00	8	criteria_params object (8)	3		9	1
107	2024-01-03 15:44:32.027233+00	7	criteria_params object (7)	3		9	1
108	2024-01-03 15:44:32.029578+00	6	criteria_params object (6)	3		9	1
109	2024-01-03 15:44:32.031386+00	5	criteria_params object (5)	3		9	1
110	2024-01-03 15:44:32.032993+00	4	criteria_params object (4)	3		9	1
111	2024-01-03 15:44:32.034618+00	3	criteria_params object (3)	3		9	1
112	2024-01-03 15:44:32.035939+00	2	criteria_params object (2)	3		9	1
113	2024-01-04 09:10:16.647574+00	17	Yverdon	1	[{"added": {}}]	7	1
114	2024-01-17 10:46:50.701404+00	139	criteria_params object (139)	3		9	1
115	2024-01-17 10:46:50.708169+00	138	criteria_params object (138)	3		9	1
116	2024-01-17 10:46:50.710399+00	137	criteria_params object (137)	3		9	1
117	2024-01-17 10:46:50.712325+00	106	criteria_params object (106)	3		9	1
118	2024-01-17 10:46:50.718968+00	105	criteria_params object (105)	3		9	1
119	2024-01-17 10:46:50.721171+00	104	criteria_params object (104)	3		9	1
120	2024-01-17 10:46:50.723167+00	103	criteria_params object (103)	3		9	1
121	2024-01-17 10:46:50.724936+00	102	criteria_params object (102)	3		9	1
122	2024-01-17 10:46:50.726478+00	101	criteria_params object (101)	3		9	1
123	2024-01-17 10:46:50.727759+00	100	criteria_params object (100)	3		9	1
124	2024-01-17 10:46:50.72897+00	99	criteria_params object (99)	3		9	1
125	2024-01-17 10:46:50.731643+00	98	criteria_params object (98)	3		9	1
126	2024-01-17 10:46:50.735933+00	97	criteria_params object (97)	3		9	1
127	2024-01-17 10:46:50.73796+00	96	criteria_params object (96)	3		9	1
128	2024-01-17 10:46:50.739412+00	95	criteria_params object (95)	3		9	1
129	2024-01-17 10:46:50.74095+00	94	criteria_params object (94)	3		9	1
130	2024-01-17 10:46:50.742333+00	93	criteria_params object (93)	3		9	1
131	2024-01-17 10:46:50.743848+00	92	criteria_params object (92)	3		9	1
132	2024-01-17 10:46:50.745293+00	91	criteria_params object (91)	3		9	1
133	2024-01-17 10:46:50.748055+00	90	criteria_params object (90)	3		9	1
134	2024-01-17 10:46:50.751618+00	89	criteria_params object (89)	3		9	1
135	2024-01-17 10:46:50.753169+00	88	criteria_params object (88)	3		9	1
136	2024-01-17 10:46:50.754404+00	87	criteria_params object (87)	3		9	1
137	2024-01-17 10:46:50.755697+00	86	criteria_params object (86)	3		9	1
138	2024-01-17 10:46:50.757021+00	85	criteria_params object (85)	3		9	1
139	2024-01-17 10:46:50.758582+00	84	criteria_params object (84)	3		9	1
140	2024-01-17 10:46:50.760065+00	83	criteria_params object (83)	3		9	1
141	2024-01-17 10:46:50.761646+00	82	criteria_params object (82)	3		9	1
142	2024-01-17 10:46:50.765516+00	81	criteria_params object (81)	3		9	1
143	2024-01-17 10:46:50.767566+00	80	criteria_params object (80)	3		9	1
144	2024-01-17 10:46:50.769041+00	79	criteria_params object (79)	3		9	1
145	2024-01-17 10:46:50.770568+00	78	criteria_params object (78)	3		9	1
146	2024-01-17 10:46:50.771911+00	77	criteria_params object (77)	3		9	1
147	2024-01-17 10:46:50.773237+00	76	criteria_params object (76)	3		9	1
148	2024-01-17 10:46:50.774485+00	75	criteria_params object (75)	3		9	1
149	2024-01-17 10:46:50.775762+00	74	criteria_params object (74)	3		9	1
150	2024-01-17 10:46:50.777051+00	73	criteria_params object (73)	3		9	1
151	2024-01-17 10:46:50.778288+00	72	criteria_params object (72)	3		9	1
152	2024-01-17 10:46:50.779829+00	71	criteria_params object (71)	3		9	1
153	2024-01-17 10:46:50.781409+00	70	criteria_params object (70)	3		9	1
154	2024-01-17 10:46:50.782859+00	69	criteria_params object (69)	3		9	1
155	2024-01-17 10:46:50.784196+00	68	criteria_params object (68)	3		9	1
156	2024-01-17 10:46:50.785344+00	67	criteria_params object (67)	3		9	1
157	2024-01-17 10:46:50.786746+00	66	criteria_params object (66)	3		9	1
158	2024-01-17 10:46:50.788115+00	65	criteria_params object (65)	3		9	1
159	2024-01-17 10:46:50.790417+00	64	criteria_params object (64)	3		9	1
160	2024-01-17 10:46:50.792795+00	63	criteria_params object (63)	3		9	1
161	2024-01-17 10:46:50.794349+00	62	criteria_params object (62)	3		9	1
162	2024-01-17 10:46:50.799149+00	61	criteria_params object (61)	3		9	1
163	2024-01-17 10:46:50.802469+00	60	criteria_params object (60)	3		9	1
164	2024-01-17 10:46:50.804312+00	59	criteria_params object (59)	3		9	1
165	2024-01-17 10:46:50.805616+00	58	criteria_params object (58)	3		9	1
166	2024-01-17 10:46:50.806942+00	57	criteria_params object (57)	3		9	1
167	2024-01-17 10:46:50.808301+00	56	criteria_params object (56)	3		9	1
168	2024-01-17 10:46:50.809703+00	55	criteria_params object (55)	3		9	1
169	2024-01-17 10:46:50.810918+00	54	criteria_params object (54)	3		9	1
170	2024-01-17 10:46:50.812287+00	53	criteria_params object (53)	3		9	1
171	2024-01-17 12:29:13.460738+00	1	Creation	1	[{"added": {}}]	11	1
172	2024-01-17 12:30:19.529656+00	1	Creation	3		11	1
173	2024-01-17 12:32:01.345235+00	2	creation	1	[{"added": {}}]	11	1
174	2024-01-17 12:32:06.367578+00	3	restoration	1	[{"added": {}}]	11	1
175	2024-01-17 12:32:11.728973+00	4	water management	1	[{"added": {}}]	11	1
176	2024-01-17 12:32:16.897339+00	5	Land management	1	[{"added": {}}]	11	1
177	2024-01-17 12:32:21.513633+00	6	No action	1	[{"added": {}}]	11	1
178	2024-01-17 13:12:39.668347+00	1	alternatives_params object (1)	1	[{"added": {}}]	12	1
179	2024-01-30 16:41:02.441204+00	12	alternatives_params object (12)	3		12	1
180	2024-01-30 16:41:02.44606+00	11	alternatives_params object (11)	3		12	1
181	2024-01-30 16:41:02.448574+00	10	alternatives_params object (10)	3		12	1
182	2024-01-30 16:41:02.452175+00	9	alternatives_params object (9)	3		12	1
183	2024-01-30 16:41:02.453792+00	8	alternatives_params object (8)	3		12	1
184	2024-01-30 16:41:02.455136+00	7	alternatives_params object (7)	3		12	1
185	2024-01-30 16:41:02.456465+00	6	alternatives_params object (6)	3		12	1
186	2024-01-30 16:41:02.458524+00	5	alternatives_params object (5)	3		12	1
187	2024-01-30 16:41:02.460013+00	4	alternatives_params object (4)	3		12	1
188	2024-01-30 16:41:02.461427+00	3	alternatives_params object (3)	3		12	1
189	2024-01-30 16:41:02.462746+00	2	alternatives_params object (2)	3		12	1
190	2024-01-30 16:41:02.464046+00	1	alternatives_params object (1)	3		12	1
191	2024-01-30 16:41:13.64795+00	6	No action	3		11	1
192	2024-01-30 16:41:13.652311+00	5	Land management	3		11	1
193	2024-01-30 16:41:13.655099+00	4	water management	3		11	1
194	2024-01-30 16:41:13.656783+00	3	restoration	3		11	1
195	2024-01-30 16:41:13.658068+00	2	creation	3		11	1
196	2024-01-30 16:41:19.178647+00	7	Creation	1	[{"added": {}}]	11	1
197	2024-01-30 16:41:21.619573+00	8	Restoration	1	[{"added": {}}]	11	1
198	2024-01-30 16:41:24.19852+00	9	Water management	1	[{"added": {}}]	11	1
199	2024-01-30 16:41:27.659211+00	10	Land management	1	[{"added": {}}]	11	1
200	2024-01-30 16:41:30.237125+00	11	No action	1	[{"added": {}}]	11	1
201	2024-02-20 14:35:30.586257+00	3	mlotfian - Analysis 1	3		13	1
202	2024-02-20 14:35:30.590976+00	2	mlotfian - Analysis 1	3		13	1
203	2024-02-20 14:35:30.592278+00	1	mlotfian - Analysis 1	3		13	1
204	2024-02-20 14:56:49.637984+00	5	mlotfian - Analysis 1	3		13	1
205	2024-02-20 14:56:49.641986+00	4	mlotfian - Analysis 1	3		13	1
206	2024-02-20 14:57:12.536103+00	7	mlotfian - Analysis 3	3		13	1
207	2024-02-20 14:57:54.758122+00	8	mlotfian - Analysis 3	3		13	1
208	2024-02-20 14:57:54.761341+00	6	mlotfian - Analysis 2	3		13	1
209	2024-02-20 14:59:38.769455+00	58	alternatives_params object (58)	3		12	1
210	2024-02-20 14:59:38.772932+00	57	alternatives_params object (57)	3		12	1
211	2024-02-20 14:59:38.775525+00	56	alternatives_params object (56)	3		12	1
212	2024-02-20 14:59:38.777866+00	55	alternatives_params object (55)	3		12	1
213	2024-02-20 14:59:38.780333+00	54	alternatives_params object (54)	3		12	1
214	2024-02-20 14:59:38.783011+00	53	alternatives_params object (53)	3		12	1
215	2024-02-20 14:59:38.785137+00	52	alternatives_params object (52)	3		12	1
216	2024-02-20 14:59:38.787595+00	51	alternatives_params object (51)	3		12	1
217	2024-02-20 14:59:38.789999+00	50	alternatives_params object (50)	3		12	1
218	2024-02-20 14:59:38.79252+00	18	alternatives_params object (18)	3		12	1
219	2024-02-20 14:59:38.794925+00	17	alternatives_params object (17)	3		12	1
220	2024-02-20 14:59:38.797475+00	16	alternatives_params object (16)	3		12	1
221	2024-02-20 14:59:38.800569+00	15	alternatives_params object (15)	3		12	1
222	2024-02-20 14:59:38.802178+00	14	alternatives_params object (14)	3		12	1
223	2024-02-20 14:59:38.803892+00	13	alternatives_params object (13)	3		12	1
224	2024-02-20 14:59:49.086024+00	189	criteria_params object (189)	3		9	1
225	2024-02-20 14:59:49.090152+00	188	criteria_params object (188)	3		9	1
226	2024-02-20 14:59:49.091519+00	187	criteria_params object (187)	3		9	1
227	2024-02-20 14:59:49.092773+00	186	criteria_params object (186)	3		9	1
228	2024-02-20 14:59:49.094032+00	185	criteria_params object (185)	3		9	1
229	2024-02-20 14:59:49.095285+00	184	criteria_params object (184)	3		9	1
230	2024-02-20 14:59:49.096529+00	183	criteria_params object (183)	3		9	1
231	2024-02-20 14:59:49.097794+00	182	criteria_params object (182)	3		9	1
232	2024-02-20 14:59:49.09917+00	181	criteria_params object (181)	3		9	1
233	2024-02-20 14:59:49.100409+00	180	criteria_params object (180)	3		9	1
234	2024-02-20 14:59:49.102369+00	179	criteria_params object (179)	3		9	1
235	2024-02-20 14:59:49.105042+00	178	criteria_params object (178)	3		9	1
236	2024-02-20 14:59:49.106461+00	177	criteria_params object (177)	3		9	1
237	2024-02-20 14:59:49.107715+00	176	criteria_params object (176)	3		9	1
238	2024-02-20 14:59:49.108958+00	175	criteria_params object (175)	3		9	1
239	2024-02-20 14:59:49.110226+00	174	criteria_params object (174)	3		9	1
240	2024-02-20 14:59:49.111739+00	173	criteria_params object (173)	3		9	1
241	2024-02-20 14:59:49.113231+00	172	criteria_params object (172)	3		9	1
242	2024-02-20 14:59:49.11477+00	171	criteria_params object (171)	3		9	1
243	2024-02-20 14:59:49.116303+00	170	criteria_params object (170)	3		9	1
244	2024-02-20 14:59:49.117959+00	169	criteria_params object (169)	3		9	1
245	2024-02-20 14:59:49.120442+00	168	criteria_params object (168)	3		9	1
246	2024-02-20 14:59:49.122+00	167	criteria_params object (167)	3		9	1
247	2024-02-20 14:59:49.123566+00	166	criteria_params object (166)	3		9	1
248	2024-02-20 14:59:49.124844+00	165	criteria_params object (165)	3		9	1
249	2024-02-20 14:59:49.126144+00	164	criteria_params object (164)	3		9	1
250	2024-02-20 14:59:49.127569+00	163	criteria_params object (163)	3		9	1
251	2024-02-20 14:59:49.129131+00	162	criteria_params object (162)	3		9	1
252	2024-02-20 14:59:49.130311+00	161	criteria_params object (161)	3		9	1
253	2024-02-20 14:59:49.131638+00	160	criteria_params object (160)	3		9	1
254	2024-02-20 14:59:49.132956+00	159	criteria_params object (159)	3		9	1
255	2024-02-20 14:59:49.134266+00	158	criteria_params object (158)	3		9	1
256	2024-02-20 14:59:49.136818+00	157	criteria_params object (157)	3		9	1
257	2024-02-20 14:59:49.138314+00	156	criteria_params object (156)	3		9	1
258	2024-02-20 14:59:49.139672+00	155	criteria_params object (155)	3		9	1
259	2024-02-20 14:59:49.140892+00	154	criteria_params object (154)	3		9	1
260	2024-02-20 14:59:49.142186+00	153	criteria_params object (153)	3		9	1
261	2024-02-20 14:59:49.143315+00	152	criteria_params object (152)	3		9	1
262	2024-02-20 14:59:49.14449+00	151	criteria_params object (151)	3		9	1
263	2024-02-20 14:59:49.145717+00	150	criteria_params object (150)	3		9	1
264	2024-02-20 14:59:49.147079+00	149	criteria_params object (149)	3		9	1
265	2024-02-20 14:59:49.148436+00	148	criteria_params object (148)	3		9	1
266	2024-02-20 14:59:49.149636+00	147	criteria_params object (147)	3		9	1
267	2024-02-20 14:59:49.150862+00	146	criteria_params object (146)	3		9	1
268	2024-02-20 14:59:49.153712+00	145	criteria_params object (145)	3		9	1
269	2024-02-20 14:59:49.155953+00	144	criteria_params object (144)	3		9	1
270	2024-02-20 14:59:49.157588+00	143	criteria_params object (143)	3		9	1
271	2024-02-20 14:59:49.158885+00	142	criteria_params object (142)	3		9	1
272	2024-02-20 14:59:49.160287+00	141	criteria_params object (141)	3		9	1
273	2024-02-20 14:59:49.161627+00	140	criteria_params object (140)	3		9	1
274	2024-02-20 15:58:25.178755+00	192	criteria_params object (192)	3		9	1
275	2024-02-20 15:58:25.182621+00	191	criteria_params object (191)	3		9	1
276	2024-02-20 15:58:25.184979+00	190	criteria_params object (190)	3		9	1
277	2024-02-20 15:58:30.521557+00	10	mlotfian - Analysis 2	3		13	1
278	2024-02-20 15:58:30.524906+00	9	mlotfian - Analysis 1	3		13	1
279	2024-02-20 16:51:46.892745+00	1	Sustainability	1	[{"added": {}}]	15	1
280	2024-02-20 16:51:51.601333+00	2	Regional rivalry	1	[{"added": {}}]	15	1
281	2024-02-20 16:51:56.177154+00	3	Fossil-fueled development	1	[{"added": {}}]	15	1
282	2024-02-27 17:12:00.766293+00	1	modeling_result object (1)	1	[{"added": {}}]	17	1
283	2024-02-27 17:23:42.957379+00	1	modeling_result object (1)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
284	2024-02-27 17:24:28.540965+00	2	modeling_result object (2)	1	[{"added": {}}]	17	1
285	2024-02-27 17:24:49.948694+00	3	modeling_result object (3)	1	[{"added": {}}]	17	1
286	2024-02-27 17:24:59.633761+00	4	modeling_result object (4)	1	[{"added": {}}]	17	1
287	2024-02-27 17:25:11.769446+00	5	modeling_result object (5)	1	[{"added": {}}]	17	1
288	2024-02-27 17:25:25.402662+00	6	modeling_result object (6)	1	[{"added": {}}]	17	1
289	2024-02-27 17:25:43.478443+00	6	modeling_result object (6)	2	[]	17	1
290	2024-02-27 17:26:00.099289+00	7	modeling_result object (7)	1	[{"added": {}}]	17	1
291	2024-02-27 17:26:32.529298+00	8	modeling_result object (8)	1	[{"added": {}}]	17	1
292	2024-02-27 17:26:42.554933+00	9	modeling_result object (9)	1	[{"added": {}}]	17	1
293	2024-02-27 17:27:22.151477+00	10	modeling_result object (10)	1	[{"added": {}}]	17	1
294	2024-02-27 17:27:41.195596+00	11	modeling_result object (11)	1	[{"added": {}}]	17	1
295	2024-02-27 17:27:56.38409+00	12	modeling_result object (12)	1	[{"added": {}}]	17	1
296	2024-02-27 17:28:06.951318+00	13	modeling_result object (13)	1	[{"added": {}}]	17	1
297	2024-02-27 17:28:16.084457+00	14	modeling_result object (14)	1	[{"added": {}}]	17	1
298	2024-02-27 17:28:24.352785+00	15	modeling_result object (15)	1	[{"added": {}}]	17	1
299	2024-02-27 17:28:35.928976+00	16	modeling_result object (16)	1	[{"added": {}}]	17	1
300	2024-02-27 17:28:44.489203+00	17	modeling_result object (17)	1	[{"added": {}}]	17	1
301	2024-02-27 17:29:31.140644+00	18	modeling_result object (18)	1	[{"added": {}}]	17	1
302	2024-02-27 17:30:04.621666+00	19	modeling_result object (19)	1	[{"added": {}}]	17	1
303	2024-02-27 17:30:15.776079+00	20	modeling_result object (20)	1	[{"added": {}}]	17	1
304	2024-02-28 12:41:13.309235+00	21	modeling_result object (21)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
305	2024-02-28 12:41:58.539785+00	22	modeling_result object (22)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
306	2024-02-28 12:42:26.555641+00	23	modeling_result object (23)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
307	2024-02-28 12:42:33.674791+00	23	modeling_result object (23)	2	[]	17	1
308	2024-02-28 12:42:43.496828+00	24	modeling_result object (24)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
309	2024-02-28 12:42:52.12722+00	25	modeling_result object (25)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
310	2024-02-28 12:43:02.714668+00	26	modeling_result object (26)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
311	2024-02-28 12:43:11.386084+00	27	modeling_result object (27)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
312	2024-02-28 12:43:26.562851+00	28	modeling_result object (28)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
313	2024-02-28 12:43:35.251491+00	29	modeling_result object (29)	2	[{"changed": {"fields": ["Number of ponds", "Criteria"]}}]	17	1
314	2024-02-28 12:43:45.889913+00	30	modeling_result object (30)	2	[{"changed": {"fields": ["Number of ponds", "Criteria"]}}]	17	1
315	2024-02-28 12:43:52.741028+00	29	modeling_result object (29)	2	[]	17	1
316	2024-02-28 12:43:57.343901+00	30	modeling_result object (30)	2	[]	17	1
317	2024-02-28 12:44:01.847555+00	28	modeling_result object (28)	2	[]	17	1
318	2024-02-28 12:44:13.564902+00	31	modeling_result object (31)	2	[{"changed": {"fields": ["Number of ponds", "Criteria"]}}]	17	1
319	2024-02-28 12:44:26.340831+00	32	modeling_result object (32)	2	[{"changed": {"fields": ["Number of ponds", "Criteria"]}}]	17	1
320	2024-02-28 12:44:30.535063+00	32	modeling_result object (32)	2	[]	17	1
321	2024-02-28 12:44:38.830434+00	33	modeling_result object (33)	2	[{"changed": {"fields": ["Number of ponds", "Criteria"]}}]	17	1
322	2024-02-28 12:44:42.446869+00	33	modeling_result object (33)	2	[]	17	1
323	2024-02-28 12:44:49.845819+00	34	modeling_result object (34)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
324	2024-02-28 12:44:59.691006+00	35	modeling_result object (35)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
325	2024-02-28 12:45:11.361679+00	36	modeling_result object (36)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
326	2024-02-28 12:45:20.24273+00	37	modeling_result object (37)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
327	2024-02-28 12:45:30.780082+00	38	modeling_result object (38)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
328	2024-02-28 12:46:48.378176+00	39	modeling_result object (39)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
329	2024-02-28 12:46:59.891463+00	40	modeling_result object (40)	2	[{"changed": {"fields": ["Number of ponds", "Criteria", "Modeling output"]}}]	17	1
330	2024-02-28 12:52:03.236072+00	60	modeling_result object (60)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
331	2024-02-28 12:52:10.915087+00	59	modeling_result object (59)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
332	2024-02-28 12:52:16.198747+00	58	modeling_result object (58)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
333	2024-02-28 12:52:20.627002+00	57	modeling_result object (57)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
334	2024-02-28 12:52:26.859201+00	56	modeling_result object (56)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
335	2024-02-28 12:52:31.293125+00	57	modeling_result object (57)	2	[]	17	1
336	2024-02-28 12:52:35.553547+00	56	modeling_result object (56)	2	[]	17	1
337	2024-02-28 12:52:40.308749+00	55	modeling_result object (55)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
338	2024-02-28 12:52:44.355638+00	54	modeling_result object (54)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
339	2024-02-28 12:52:48.784639+00	53	modeling_result object (53)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
340	2024-02-28 12:52:54.136582+00	52	modeling_result object (52)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
341	2024-02-28 12:52:58.891989+00	51	modeling_result object (51)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
342	2024-02-28 12:53:03.418059+00	50	modeling_result object (50)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
343	2024-02-28 12:53:07.675215+00	49	modeling_result object (49)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
344	2024-02-28 12:53:13.661375+00	48	modeling_result object (48)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
345	2024-02-28 12:53:17.806602+00	48	modeling_result object (48)	2	[]	17	1
346	2024-02-28 12:53:21.385984+00	49	modeling_result object (49)	2	[]	17	1
347	2024-02-28 12:53:24.233515+00	48	modeling_result object (48)	2	[]	17	1
348	2024-02-28 12:53:29.309979+00	47	modeling_result object (47)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
349	2024-02-28 12:53:34.263514+00	46	modeling_result object (46)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
502	2024-03-05 15:57:22.818295+00	31	mcda_result object (31)	3		18	1
350	2024-02-28 12:53:39.667821+00	45	modeling_result object (45)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
351	2024-02-28 12:53:44.743026+00	44	modeling_result object (44)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
352	2024-02-28 12:53:50.617416+00	43	modeling_result object (43)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
353	2024-02-28 12:53:54.781057+00	44	modeling_result object (44)	2	[]	17	1
354	2024-02-28 12:53:59.26538+00	43	modeling_result object (43)	2	[]	17	1
355	2024-02-28 12:54:03.879061+00	42	modeling_result object (42)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
356	2024-02-28 12:54:08.280895+00	42	modeling_result object (42)	2	[]	17	1
357	2024-02-28 12:54:11.858884+00	43	modeling_result object (43)	2	[]	17	1
358	2024-02-28 12:54:16.538226+00	41	modeling_result object (41)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
359	2024-02-28 12:54:20.756929+00	40	modeling_result object (40)	2	[]	17	1
360	2024-02-28 12:54:30.699615+00	42	modeling_result object (42)	2	[]	17	1
361	2024-02-28 12:54:35.95586+00	41	modeling_result object (41)	2	[]	17	1
362	2024-02-28 12:54:45.282907+00	41	modeling_result object (41)	2	[]	17	1
363	2024-02-28 12:54:50.37078+00	41	modeling_result object (41)	2	[]	17	1
364	2024-02-28 12:54:54.913975+00	42	modeling_result object (42)	2	[]	17	1
365	2024-02-28 12:54:58.669554+00	43	modeling_result object (43)	2	[]	17	1
366	2024-02-28 12:55:02.701431+00	44	modeling_result object (44)	2	[]	17	1
367	2024-02-28 12:55:05.777297+00	45	modeling_result object (45)	2	[]	17	1
368	2024-02-28 12:55:08.894709+00	46	modeling_result object (46)	2	[]	17	1
369	2024-02-28 12:55:12.936159+00	47	modeling_result object (47)	2	[]	17	1
370	2024-02-28 12:55:17.383245+00	48	modeling_result object (48)	2	[]	17	1
371	2024-02-28 12:55:20.468374+00	49	modeling_result object (49)	2	[]	17	1
372	2024-02-28 12:55:23.860659+00	49	modeling_result object (49)	2	[]	17	1
373	2024-02-28 12:55:27.555144+00	50	modeling_result object (50)	2	[]	17	1
374	2024-02-28 12:55:30.660718+00	51	modeling_result object (51)	2	[]	17	1
375	2024-02-28 12:55:33.650912+00	52	modeling_result object (52)	2	[]	17	1
376	2024-02-28 12:55:37.082378+00	53	modeling_result object (53)	2	[]	17	1
377	2024-02-28 12:55:41.000423+00	54	modeling_result object (54)	2	[]	17	1
378	2024-02-28 12:55:45.247491+00	55	modeling_result object (55)	2	[]	17	1
379	2024-02-28 12:55:49.446328+00	56	modeling_result object (56)	2	[]	17	1
380	2024-02-28 12:55:53.369434+00	57	modeling_result object (57)	2	[]	17	1
381	2024-02-28 12:55:56.301996+00	58	modeling_result object (58)	2	[]	17	1
382	2024-02-28 12:55:59.551+00	59	modeling_result object (59)	2	[]	17	1
383	2024-02-28 13:30:45.966921+00	1	Regional rivalry	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
384	2024-02-28 13:30:54.871088+00	2	Regional rivalry	2	[]	15	1
385	2024-02-28 13:31:18.768441+00	1	Sustainability	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
386	2024-02-28 13:31:50.440808+00	2	Regional rivalry	2	[]	15	1
387	2024-02-28 13:32:30.319746+00	2	Regional rivalry	2	[]	15	1
388	2024-02-28 13:32:44.645359+00	1	Regional rivalry	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
389	2024-02-28 13:32:59.606435+00	1	Sustainability	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
390	2024-02-28 13:34:33.571758+00	80	modeling_result object (80)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
391	2024-02-28 13:34:52.230039+00	80	modeling_result object (80)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
392	2024-02-28 13:37:06.148598+00	80	modeling_result object (80)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
393	2024-02-28 13:37:06.153326+00	79	modeling_result object (79)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
394	2024-02-28 13:37:06.15627+00	78	modeling_result object (78)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
395	2024-02-28 13:37:06.159195+00	77	modeling_result object (77)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
396	2024-02-28 13:37:06.161882+00	76	modeling_result object (76)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
397	2024-02-28 13:37:06.164669+00	75	modeling_result object (75)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
398	2024-02-28 13:37:06.167302+00	74	modeling_result object (74)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
399	2024-02-28 13:37:06.169975+00	73	modeling_result object (73)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
400	2024-02-28 13:37:06.172808+00	72	modeling_result object (72)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
401	2024-02-28 13:37:06.175605+00	71	modeling_result object (71)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
402	2024-02-28 13:37:06.178203+00	70	modeling_result object (70)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
403	2024-02-28 13:37:06.181309+00	69	modeling_result object (69)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
404	2024-02-28 13:37:06.18598+00	68	modeling_result object (68)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
405	2024-02-28 13:37:06.189794+00	67	modeling_result object (67)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
406	2024-02-28 13:37:06.193059+00	66	modeling_result object (66)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
407	2024-02-28 13:37:06.195886+00	65	modeling_result object (65)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
408	2024-02-28 13:37:06.1987+00	64	modeling_result object (64)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
409	2024-02-28 13:37:06.202941+00	63	modeling_result object (63)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
410	2024-02-28 13:37:06.206006+00	62	modeling_result object (62)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
411	2024-02-28 13:37:06.208831+00	61	modeling_result object (61)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
412	2024-02-28 13:37:33.715705+00	81	modeling_result object (81)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
413	2024-02-28 13:40:00.716085+00	100	modeling_result object (100)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
414	2024-02-28 13:40:00.724127+00	99	modeling_result object (99)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
415	2024-02-28 13:40:00.72699+00	98	modeling_result object (98)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
416	2024-02-28 13:40:00.730578+00	97	modeling_result object (97)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
417	2024-02-28 13:40:00.733288+00	96	modeling_result object (96)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
418	2024-02-28 13:40:00.736044+00	95	modeling_result object (95)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
419	2024-02-28 13:40:00.738757+00	94	modeling_result object (94)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
420	2024-02-28 13:40:00.741826+00	93	modeling_result object (93)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
421	2024-02-28 13:40:00.74489+00	92	modeling_result object (92)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
422	2024-02-28 13:40:00.748335+00	91	modeling_result object (91)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
423	2024-02-28 13:40:00.755049+00	90	modeling_result object (90)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
424	2024-02-28 13:40:00.758416+00	89	modeling_result object (89)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
425	2024-02-28 13:40:00.761366+00	88	modeling_result object (88)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
426	2024-02-28 13:40:00.763906+00	87	modeling_result object (87)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
427	2024-02-28 13:40:00.766835+00	86	modeling_result object (86)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
428	2024-02-28 13:40:00.769976+00	85	modeling_result object (85)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
429	2024-02-28 13:40:00.773032+00	84	modeling_result object (84)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
430	2024-02-28 13:40:00.776209+00	83	modeling_result object (83)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
431	2024-02-28 13:40:00.781096+00	82	modeling_result object (82)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
432	2024-02-28 13:41:44.2832+00	120	modeling_result object (120)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
433	2024-02-28 13:41:44.290398+00	119	modeling_result object (119)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
434	2024-02-28 13:41:44.293031+00	118	modeling_result object (118)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
435	2024-02-28 13:41:44.295572+00	117	modeling_result object (117)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
436	2024-02-28 13:41:44.298125+00	116	modeling_result object (116)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
437	2024-02-28 13:41:44.300649+00	115	modeling_result object (115)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
438	2024-02-28 13:41:44.303214+00	114	modeling_result object (114)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
439	2024-02-28 13:41:44.305714+00	113	modeling_result object (113)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
440	2024-02-28 13:41:44.308271+00	112	modeling_result object (112)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
441	2024-02-28 13:41:44.31235+00	111	modeling_result object (111)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
442	2024-02-28 13:41:44.315012+00	110	modeling_result object (110)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
443	2024-02-28 13:41:44.317653+00	109	modeling_result object (109)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
444	2024-02-28 13:41:44.320263+00	108	modeling_result object (108)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
445	2024-02-28 13:41:44.322966+00	107	modeling_result object (107)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
446	2024-02-28 13:41:44.326651+00	106	modeling_result object (106)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
447	2024-02-28 13:41:44.329339+00	105	modeling_result object (105)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
448	2024-02-28 13:41:44.331965+00	104	modeling_result object (104)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
449	2024-02-28 13:41:44.335232+00	103	modeling_result object (103)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
450	2024-02-28 13:41:44.338974+00	102	modeling_result object (102)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
451	2024-02-28 13:41:44.342214+00	101	modeling_result object (101)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
452	2024-02-28 13:58:01.846583+00	121	modeling_result object (121)	1	[{"added": {}}]	17	1
453	2024-02-28 14:55:08.971572+00	123	modeling_result object (123)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
454	2024-02-28 14:55:08.978879+00	122	modeling_result object (122)	2	[{"changed": {"fields": ["Criteria"]}}]	17	1
455	2024-02-28 14:57:07.508747+00	126	modeling_result object (126)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
456	2024-02-28 14:57:07.513952+00	125	modeling_result object (125)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
457	2024-02-28 14:57:07.518546+00	124	modeling_result object (124)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
458	2024-02-28 16:24:07.417893+00	1	satisfaction_threshold object (1)	1	[{"added": {}}]	10	1
459	2024-02-28 16:28:18.683982+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Criteria id", "Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
460	2024-02-28 16:28:41.419376+00	3	satisfaction_threshold object (3)	2	[{"changed": {"fields": ["Criteria id", "Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
493	2024-03-01 08:17:02.667828+00	4	Invasive alien species	3		8	1
494	2024-03-01 10:21:12.594013+00	4	Without land use change	1	[{"added": {}}]	15	1
495	2024-03-01 10:21:33.760146+00	1	Sustainability	2	[{"changed": {"fields": ["Description"]}}]	15	1
496	2024-03-05 15:51:36.646321+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Minimum satisfaction threshold"]}}]	10	1
497	2024-03-05 15:57:22.803262+00	36	mcda_result object (36)	3		18	1
498	2024-03-05 15:57:22.806709+00	35	mcda_result object (35)	3		18	1
499	2024-03-05 15:57:22.808999+00	34	mcda_result object (34)	3		18	1
500	2024-03-05 15:57:22.811092+00	33	mcda_result object (33)	3		18	1
501	2024-03-05 15:57:22.813286+00	32	mcda_result object (32)	3		18	1
503	2024-03-05 15:57:22.821712+00	30	mcda_result object (30)	3		18	1
504	2024-03-05 15:57:22.823677+00	29	mcda_result object (29)	3		18	1
505	2024-03-05 15:57:22.825677+00	28	mcda_result object (28)	3		18	1
506	2024-03-05 15:57:22.827491+00	27	mcda_result object (27)	3		18	1
507	2024-03-05 15:57:22.828906+00	26	mcda_result object (26)	3		18	1
508	2024-03-05 15:57:22.830953+00	25	mcda_result object (25)	3		18	1
509	2024-03-05 15:57:22.833666+00	24	mcda_result object (24)	3		18	1
510	2024-03-05 15:57:22.835003+00	23	mcda_result object (23)	3		18	1
511	2024-03-05 15:57:22.836236+00	22	mcda_result object (22)	3		18	1
512	2024-03-05 15:57:22.837505+00	21	mcda_result object (21)	3		18	1
513	2024-03-05 15:57:22.838766+00	20	mcda_result object (20)	3		18	1
514	2024-03-05 15:57:22.839982+00	19	mcda_result object (19)	3		18	1
515	2024-03-05 15:57:22.841311+00	18	mcda_result object (18)	3		18	1
516	2024-03-05 15:57:22.842734+00	17	mcda_result object (17)	3		18	1
517	2024-03-05 15:57:22.844029+00	16	mcda_result object (16)	3		18	1
518	2024-03-05 15:57:22.845253+00	15	mcda_result object (15)	3		18	1
519	2024-03-05 15:57:22.846899+00	14	mcda_result object (14)	3		18	1
520	2024-03-05 15:57:22.850375+00	13	mcda_result object (13)	3		18	1
521	2024-03-05 15:57:22.851629+00	12	mcda_result object (12)	3		18	1
522	2024-03-05 15:57:22.852892+00	11	mcda_result object (11)	3		18	1
523	2024-03-05 15:57:22.854155+00	10	mcda_result object (10)	3		18	1
524	2024-03-05 15:57:22.855431+00	9	mcda_result object (9)	3		18	1
525	2024-03-05 15:57:22.856822+00	8	mcda_result object (8)	3		18	1
526	2024-03-05 15:57:22.858359+00	7	mcda_result object (7)	3		18	1
527	2024-03-05 15:57:22.859619+00	6	mcda_result object (6)	3		18	1
528	2024-03-05 15:57:22.860883+00	5	mcda_result object (5)	3		18	1
529	2024-03-05 15:57:22.862169+00	4	mcda_result object (4)	3		18	1
530	2024-03-05 15:57:22.86365+00	3	mcda_result object (3)	3		18	1
531	2024-03-05 15:57:22.86495+00	2	mcda_result object (2)	3		18	1
532	2024-03-05 15:57:22.866186+00	1	mcda_result object (1)	3		18	1
533	2024-03-05 17:00:48.647675+00	45	mcda_result object (45)	3		18	1
534	2024-03-05 17:00:48.65202+00	44	mcda_result object (44)	3		18	1
535	2024-03-05 17:00:48.654031+00	43	mcda_result object (43)	3		18	1
536	2024-03-05 17:00:48.656129+00	42	mcda_result object (42)	3		18	1
537	2024-03-05 17:00:48.658572+00	41	mcda_result object (41)	3		18	1
538	2024-03-05 17:00:48.660763+00	40	mcda_result object (40)	3		18	1
539	2024-03-05 17:00:48.662823+00	39	mcda_result object (39)	3		18	1
540	2024-03-05 17:00:48.665843+00	38	mcda_result object (38)	3		18	1
541	2024-03-05 17:00:48.668597+00	37	mcda_result object (37)	3		18	1
542	2024-03-05 17:09:00.306526+00	268	criteria_params object (268)	3		9	1
543	2024-03-05 17:09:00.310835+00	267	criteria_params object (267)	3		9	1
544	2024-03-05 17:09:00.312382+00	266	criteria_params object (266)	3		9	1
545	2024-03-05 17:09:00.313806+00	265	criteria_params object (265)	3		9	1
546	2024-03-05 17:09:00.315297+00	264	criteria_params object (264)	3		9	1
547	2024-03-05 17:09:00.317081+00	263	criteria_params object (263)	3		9	1
548	2024-03-05 17:09:00.31888+00	262	criteria_params object (262)	3		9	1
549	2024-03-05 17:09:00.320451+00	261	criteria_params object (261)	3		9	1
550	2024-03-05 17:09:00.32215+00	260	criteria_params object (260)	3		9	1
551	2024-03-05 17:09:00.323504+00	259	criteria_params object (259)	3		9	1
552	2024-03-05 17:09:00.325558+00	258	criteria_params object (258)	3		9	1
553	2024-03-05 17:09:00.32754+00	257	criteria_params object (257)	3		9	1
554	2024-03-05 17:09:00.328979+00	256	criteria_params object (256)	3		9	1
555	2024-03-05 17:09:00.330301+00	255	criteria_params object (255)	3		9	1
556	2024-03-05 17:09:00.331599+00	254	criteria_params object (254)	3		9	1
557	2024-03-05 17:09:00.332898+00	253	criteria_params object (253)	3		9	1
558	2024-03-05 17:09:00.334743+00	252	criteria_params object (252)	3		9	1
559	2024-03-05 17:09:00.336381+00	251	criteria_params object (251)	3		9	1
560	2024-03-05 17:09:00.338042+00	250	criteria_params object (250)	3		9	1
561	2024-03-05 17:09:00.339546+00	249	criteria_params object (249)	3		9	1
562	2024-03-05 17:09:00.341097+00	248	criteria_params object (248)	3		9	1
563	2024-03-05 17:09:00.342623+00	247	criteria_params object (247)	3		9	1
564	2024-03-05 17:09:00.344175+00	246	criteria_params object (246)	3		9	1
565	2024-03-05 17:09:00.350737+00	245	criteria_params object (245)	3		9	1
566	2024-03-05 17:09:00.35266+00	244	criteria_params object (244)	3		9	1
567	2024-03-05 17:09:00.354235+00	242	criteria_params object (242)	3		9	1
568	2024-03-05 17:09:00.356049+00	241	criteria_params object (241)	3		9	1
569	2024-03-05 17:09:00.357656+00	240	criteria_params object (240)	3		9	1
570	2024-03-05 17:09:00.358987+00	239	criteria_params object (239)	3		9	1
571	2024-03-05 17:09:00.360366+00	238	criteria_params object (238)	3		9	1
572	2024-03-05 17:09:00.361634+00	237	criteria_params object (237)	3		9	1
573	2024-03-05 17:09:00.362918+00	236	criteria_params object (236)	3		9	1
574	2024-03-05 17:09:00.364256+00	235	criteria_params object (235)	3		9	1
575	2024-03-05 17:09:00.365738+00	234	criteria_params object (234)	3		9	1
576	2024-03-05 17:09:00.367582+00	203	criteria_params object (203)	3		9	1
577	2024-03-05 17:09:00.369069+00	202	criteria_params object (202)	3		9	1
578	2024-03-05 17:09:00.370427+00	201	criteria_params object (201)	3		9	1
579	2024-03-05 17:09:00.371637+00	200	criteria_params object (200)	3		9	1
580	2024-03-05 17:09:00.372999+00	199	criteria_params object (199)	3		9	1
581	2024-03-05 17:09:00.374215+00	198	criteria_params object (198)	3		9	1
582	2024-03-05 17:09:00.375512+00	197	criteria_params object (197)	3		9	1
583	2024-03-05 17:09:00.376633+00	195	criteria_params object (195)	3		9	1
584	2024-03-05 17:09:00.378277+00	194	criteria_params object (194)	3		9	1
585	2024-03-05 17:09:09.175819+00	54	mcda_result object (54)	3		18	1
586	2024-03-05 17:09:09.180138+00	53	mcda_result object (53)	3		18	1
587	2024-03-05 17:09:09.182341+00	52	mcda_result object (52)	3		18	1
588	2024-03-05 17:09:09.18467+00	51	mcda_result object (51)	3		18	1
589	2024-03-05 17:09:09.187119+00	50	mcda_result object (50)	3		18	1
590	2024-03-05 17:09:09.189876+00	49	mcda_result object (49)	3		18	1
591	2024-03-05 17:09:09.191791+00	48	mcda_result object (48)	3		18	1
592	2024-03-05 17:09:09.193469+00	47	mcda_result object (47)	3		18	1
593	2024-03-05 17:09:09.194981+00	46	mcda_result object (46)	3		18	1
594	2024-03-06 16:42:36.42717+00	72	mcda_result object (72)	3		18	1
595	2024-03-06 16:42:36.434143+00	71	mcda_result object (71)	3		18	1
596	2024-03-06 16:42:36.435875+00	70	mcda_result object (70)	3		18	1
597	2024-03-06 16:42:36.437313+00	69	mcda_result object (69)	3		18	1
598	2024-03-06 16:42:36.439122+00	68	mcda_result object (68)	3		18	1
599	2024-03-06 16:42:36.440882+00	67	mcda_result object (67)	3		18	1
600	2024-03-06 16:42:36.442526+00	66	mcda_result object (66)	3		18	1
601	2024-03-06 16:42:36.444365+00	65	mcda_result object (65)	3		18	1
602	2024-03-06 16:42:36.446726+00	64	mcda_result object (64)	3		18	1
603	2024-03-06 16:42:36.448685+00	63	mcda_result object (63)	3		18	1
604	2024-03-06 16:42:36.450629+00	62	mcda_result object (62)	3		18	1
605	2024-03-06 16:42:36.452554+00	61	mcda_result object (61)	3		18	1
606	2024-03-06 16:42:36.453916+00	60	mcda_result object (60)	3		18	1
607	2024-03-06 16:42:36.455245+00	59	mcda_result object (59)	3		18	1
608	2024-03-06 16:42:36.456623+00	58	mcda_result object (58)	3		18	1
609	2024-03-06 16:42:36.458017+00	57	mcda_result object (57)	3		18	1
610	2024-03-06 16:42:36.459293+00	56	mcda_result object (56)	3		18	1
611	2024-03-06 16:42:36.46068+00	55	mcda_result object (55)	3		18	1
612	2024-03-06 16:47:13.113635+00	3	satisfaction_threshold object (3)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
613	2024-03-06 16:47:13.118512+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
614	2024-03-06 16:47:13.122825+00	1	satisfaction_threshold object (1)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
615	2024-03-06 16:47:37.496627+00	80	mcda_result object (80)	3		18	1
616	2024-03-06 16:47:37.501041+00	77	mcda_result object (77)	3		18	1
617	2024-03-06 16:47:37.503177+00	74	mcda_result object (74)	3		18	1
618	2024-03-06 16:47:37.505526+00	79	mcda_result object (79)	3		18	1
619	2024-03-06 16:47:37.50819+00	76	mcda_result object (76)	3		18	1
620	2024-03-06 16:47:37.510565+00	73	mcda_result object (73)	3		18	1
621	2024-03-06 16:47:37.512903+00	81	mcda_result object (81)	3		18	1
622	2024-03-06 16:47:37.515332+00	78	mcda_result object (78)	3		18	1
623	2024-03-06 16:47:37.518107+00	75	mcda_result object (75)	3		18	1
624	2024-03-12 17:32:59.870385+00	123	modeling_result object (123)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
625	2024-03-12 17:32:59.877801+00	122	modeling_result object (122)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
626	2024-03-12 17:32:59.881638+00	121	modeling_result object (121)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
627	2024-03-13 17:17:49.460855+00	5	Land Use: SSP1, Climate Change: SSP1	1	[{"added": {}}]	15	1
628	2024-03-13 17:18:01.185324+00	4	Without land use change	3		15	1
629	2024-03-13 17:18:01.192499+00	3	Fossil-fueled development	3		15	1
630	2024-03-13 17:18:01.196544+00	2	Regional rivalry	3		15	1
631	2024-03-13 17:18:01.199792+00	1	Sustainability	3		15	1
632	2024-03-13 17:18:16.044233+00	320	criteria_params object (320)	3		9	1
633	2024-03-13 17:18:16.047398+00	319	criteria_params object (319)	3		9	1
634	2024-03-13 17:18:16.049887+00	318	criteria_params object (318)	3		9	1
635	2024-03-13 17:18:16.052677+00	317	criteria_params object (317)	3		9	1
636	2024-03-13 17:18:16.055757+00	316	criteria_params object (316)	3		9	1
637	2024-03-13 17:18:16.06123+00	315	criteria_params object (315)	3		9	1
638	2024-03-13 17:18:16.063384+00	314	criteria_params object (314)	3		9	1
639	2024-03-13 17:18:16.065286+00	313	criteria_params object (313)	3		9	1
640	2024-03-13 17:18:16.067042+00	312	criteria_params object (312)	3		9	1
641	2024-03-13 17:18:16.069493+00	311	criteria_params object (311)	3		9	1
642	2024-03-13 17:18:16.073354+00	310	criteria_params object (310)	3		9	1
643	2024-03-13 17:18:16.076163+00	309	criteria_params object (309)	3		9	1
644	2024-03-13 17:18:16.078429+00	308	criteria_params object (308)	3		9	1
645	2024-03-13 17:18:16.079969+00	307	criteria_params object (307)	3		9	1
646	2024-03-13 17:18:16.081855+00	306	criteria_params object (306)	3		9	1
647	2024-03-13 17:18:16.083526+00	305	criteria_params object (305)	3		9	1
648	2024-03-13 17:18:16.085848+00	304	criteria_params object (304)	3		9	1
649	2024-03-13 17:18:16.089309+00	303	criteria_params object (303)	3		9	1
650	2024-03-13 17:18:16.092372+00	302	criteria_params object (302)	3		9	1
651	2024-03-13 17:18:16.094112+00	301	criteria_params object (301)	3		9	1
652	2024-03-13 17:18:16.095575+00	300	criteria_params object (300)	3		9	1
653	2024-03-13 17:18:16.096889+00	299	criteria_params object (299)	3		9	1
654	2024-03-13 17:18:16.098405+00	298	criteria_params object (298)	3		9	1
655	2024-03-13 17:18:16.099981+00	297	criteria_params object (297)	3		9	1
656	2024-03-13 17:18:16.102218+00	296	criteria_params object (296)	3		9	1
657	2024-03-13 17:18:16.104349+00	295	criteria_params object (295)	3		9	1
658	2024-03-13 17:18:16.109182+00	294	criteria_params object (294)	3		9	1
659	2024-03-13 17:18:16.110759+00	293	criteria_params object (293)	3		9	1
660	2024-03-13 17:18:16.112271+00	292	criteria_params object (292)	3		9	1
661	2024-03-13 17:18:16.113711+00	291	criteria_params object (291)	3		9	1
662	2024-03-13 17:18:16.115257+00	290	criteria_params object (290)	3		9	1
663	2024-03-13 17:18:16.116604+00	289	criteria_params object (289)	3		9	1
664	2024-03-13 17:18:16.118021+00	288	criteria_params object (288)	3		9	1
665	2024-03-13 17:18:16.11948+00	287	criteria_params object (287)	3		9	1
666	2024-03-13 17:18:16.121614+00	286	criteria_params object (286)	3		9	1
667	2024-03-13 17:18:16.123442+00	285	criteria_params object (285)	3		9	1
668	2024-03-13 17:18:16.125135+00	284	criteria_params object (284)	3		9	1
669	2024-03-13 17:18:16.127164+00	283	criteria_params object (283)	3		9	1
670	2024-03-13 17:18:16.129084+00	282	criteria_params object (282)	3		9	1
671	2024-03-13 17:18:16.130475+00	281	criteria_params object (281)	3		9	1
672	2024-03-13 17:18:16.131765+00	280	criteria_params object (280)	3		9	1
673	2024-03-13 17:18:16.133011+00	279	criteria_params object (279)	3		9	1
674	2024-03-13 17:18:16.134302+00	278	criteria_params object (278)	3		9	1
675	2024-03-13 17:18:16.135679+00	277	criteria_params object (277)	3		9	1
676	2024-03-13 17:18:16.13738+00	276	criteria_params object (276)	3		9	1
677	2024-03-13 17:18:16.141767+00	275	criteria_params object (275)	3		9	1
678	2024-03-13 17:18:16.143471+00	274	criteria_params object (274)	3		9	1
679	2024-03-13 17:18:16.144882+00	273	criteria_params object (273)	3		9	1
680	2024-03-13 17:18:16.146209+00	272	criteria_params object (272)	3		9	1
681	2024-03-13 17:18:16.147527+00	271	criteria_params object (271)	3		9	1
682	2024-03-13 17:18:16.148794+00	270	criteria_params object (270)	3		9	1
683	2024-03-13 17:18:16.150015+00	269	criteria_params object (269)	3		9	1
684	2024-03-13 17:18:37.760046+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
685	2024-03-13 17:18:49.803457+00	6	Land Use: SSP3, Climate Change: SSP3	1	[{"added": {}}]	15	1
686	2024-03-13 17:19:02.384129+00	7	Land Use: SSP5, Climate Change: SSP5	1	[{"added": {}}]	15	1
687	2024-03-13 17:19:23.414532+00	8	Land Use: No Change, Climate Change: SSP1	1	[{"added": {}}]	15	1
688	2024-03-13 17:19:29.031171+00	9	Land Use: No Chnage, Climate Change: SSP3	1	[{"added": {}}]	15	1
689	2024-03-13 17:19:33.926104+00	10	Land Use: No change, Climate Change: SSP5	1	[{"added": {}}]	15	1
690	2024-03-13 17:19:38.363022+00	11	Land Use: No Change, Climate Change: No Change	1	[{"added": {}}]	15	1
691	2024-03-13 17:20:01.329336+00	48	mlotfian - Analysis 38	3		13	1
692	2024-03-13 17:20:01.334296+00	47	mlotfian - Analysis 37	3		13	1
693	2024-03-13 17:20:01.337165+00	46	mlotfian - Analysis 36	3		13	1
694	2024-03-13 17:20:01.342876+00	45	mlotfian - Analysis 35	3		13	1
695	2024-03-13 17:20:01.346471+00	44	mlotfian - Analysis 34	3		13	1
696	2024-03-13 17:20:01.349857+00	43	mlotfian - Analysis 33	3		13	1
697	2024-03-13 17:20:01.352751+00	42	mlotfian - Analysis 32	3		13	1
698	2024-03-13 17:20:01.35704+00	41	mlotfian - Analysis 31	3		13	1
699	2024-03-13 17:20:01.36115+00	40	mlotfian - Analysis 30	3		13	1
700	2024-03-13 17:20:01.364172+00	39	mlotfian - Analysis 29	3		13	1
701	2024-03-13 17:20:01.366439+00	38	mlotfian - Analysis 28	3		13	1
702	2024-03-13 17:20:01.369229+00	37	mlotfian - Analysis 27	3		13	1
703	2024-03-13 17:20:01.372949+00	36	mlotfian - Analysis 26	3		13	1
704	2024-03-13 17:20:01.377029+00	35	mlotfian - Analysis 25	3		13	1
705	2024-03-13 17:20:01.380562+00	34	mlotfian - Analysis 24	3		13	1
706	2024-03-13 17:20:01.382713+00	33	mlotfian - Analysis 23	3		13	1
707	2024-03-13 17:20:01.385379+00	32	mlotfian - Analysis 22	3		13	1
708	2024-03-13 17:20:01.388717+00	31	mlotfian - Analysis 21	3		13	1
709	2024-03-13 17:20:01.391528+00	30	mlotfian - Analysis 20	3		13	1
710	2024-03-13 17:20:01.394322+00	29	mlotfian - Analysis 19	3		13	1
711	2024-03-13 17:20:01.396922+00	28	mlotfian - Analysis 18	3		13	1
712	2024-03-13 17:20:01.398994+00	27	mlotfian - Analysis 17	3		13	1
713	2024-03-13 17:20:01.400432+00	26	mlotfian - Analysis 16	3		13	1
714	2024-03-13 17:20:01.402159+00	25	mlotfian - Analysis 15	3		13	1
715	2024-03-13 17:20:01.403593+00	24	mlotfian - Analysis 14	3		13	1
716	2024-03-13 17:20:01.405635+00	23	mlotfian - Analysis 13	3		13	1
717	2024-03-13 17:20:01.40815+00	22	mlotfian - Analysis 12	3		13	1
718	2024-03-13 17:20:01.409445+00	21	mlotfian - Analysis 11	3		13	1
719	2024-03-13 17:20:01.410714+00	20	mlotfian - Analysis 10	3		13	1
720	2024-03-13 17:20:01.411989+00	19	mlotfian - Analysis 9	3		13	1
721	2024-03-13 17:20:01.413266+00	18	mlotfian - Analysis 8	3		13	1
722	2024-03-13 17:20:01.41456+00	17	mlotfian - Analysis 7	3		13	1
723	2024-03-13 17:20:01.415609+00	16	mlotfian - Analysis 6	3		13	1
724	2024-03-13 17:20:01.416964+00	15	mlotfian - Analysis 5	3		13	1
725	2024-03-13 17:20:01.418218+00	14	mlotfian - Analysis 4	3		13	1
726	2024-03-13 17:20:01.41956+00	13	mlotfian - Analysis 3	3		13	1
727	2024-03-13 17:20:01.420999+00	12	mlotfian - Analysis 2	3		13	1
728	2024-03-13 17:20:01.422378+00	11	mlotfian - Analysis 1	3		13	1
729	2024-03-13 17:21:00.828563+00	127	modeling_result object (127)	1	[{"added": {}}]	17	1
730	2024-03-13 17:21:34.091555+00	128	modeling_result object (128)	1	[{"added": {}}]	17	1
731	2024-03-13 17:22:11.975838+00	129	modeling_result object (129)	1	[{"added": {}}]	17	1
732	2024-03-13 17:22:24.404293+00	130	modeling_result object (130)	1	[{"added": {}}]	17	1
733	2024-03-13 17:23:04.854618+00	133	modeling_result object (133)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
734	2024-03-13 17:23:04.861626+00	132	modeling_result object (132)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
735	2024-03-13 17:23:04.865554+00	131	modeling_result object (131)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
736	2024-03-13 17:24:01.261044+00	140	modeling_result object (140)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
737	2024-03-13 17:24:01.267874+00	139	modeling_result object (139)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
738	2024-03-13 17:24:01.273925+00	138	modeling_result object (138)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
739	2024-03-13 17:24:01.277838+00	137	modeling_result object (137)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
740	2024-03-13 17:24:01.28188+00	136	modeling_result object (136)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
741	2024-03-13 17:24:01.284673+00	135	modeling_result object (135)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
742	2024-03-13 17:24:01.287384+00	134	modeling_result object (134)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
743	2024-03-13 17:24:56.132978+00	147	modeling_result object (147)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
973	2024-03-17 23:33:40.727812+00	15	Macroinvertebrates	1	[{"added": {}}]	8	1
744	2024-03-13 17:24:56.14136+00	146	modeling_result object (146)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
745	2024-03-13 17:24:56.148037+00	145	modeling_result object (145)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
746	2024-03-13 17:24:56.152512+00	144	modeling_result object (144)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
747	2024-03-13 17:24:56.159845+00	143	modeling_result object (143)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
748	2024-03-13 17:24:56.163998+00	142	modeling_result object (142)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
749	2024-03-13 17:24:56.168129+00	141	modeling_result object (141)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
750	2024-03-13 17:26:06.496414+00	154	modeling_result object (154)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
751	2024-03-13 17:26:06.502153+00	153	modeling_result object (153)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
752	2024-03-13 17:26:06.509036+00	152	modeling_result object (152)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
753	2024-03-13 17:26:06.515496+00	151	modeling_result object (151)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
754	2024-03-13 17:26:06.51954+00	150	modeling_result object (150)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
755	2024-03-13 17:26:06.525579+00	149	modeling_result object (149)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
756	2024-03-13 17:26:06.531966+00	148	modeling_result object (148)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
757	2024-03-13 17:31:55.80391+00	161	modeling_result object (161)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
758	2024-03-13 17:31:55.813885+00	160	modeling_result object (160)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
759	2024-03-13 17:31:55.818346+00	159	modeling_result object (159)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
760	2024-03-13 17:31:55.827512+00	158	modeling_result object (158)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
761	2024-03-13 17:31:55.833997+00	157	modeling_result object (157)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
762	2024-03-13 17:31:55.841145+00	156	modeling_result object (156)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
763	2024-03-13 17:31:55.84804+00	155	modeling_result object (155)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
764	2024-03-13 17:32:59.710267+00	168	modeling_result object (168)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
765	2024-03-13 17:32:59.716444+00	167	modeling_result object (167)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
766	2024-03-13 17:32:59.722237+00	166	modeling_result object (166)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
767	2024-03-13 17:32:59.733013+00	165	modeling_result object (165)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
768	2024-03-13 17:32:59.73907+00	164	modeling_result object (164)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
769	2024-03-13 17:32:59.745415+00	163	modeling_result object (163)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
770	2024-03-13 17:32:59.750906+00	162	modeling_result object (162)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
771	2024-03-13 17:33:41.180946+00	175	modeling_result object (175)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
772	2024-03-13 17:33:41.188285+00	174	modeling_result object (174)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
773	2024-03-13 17:33:41.196719+00	173	modeling_result object (173)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
774	2024-03-13 17:33:41.203325+00	172	modeling_result object (172)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
775	2024-03-13 17:33:41.212163+00	171	modeling_result object (171)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
776	2024-03-13 17:33:41.218282+00	170	modeling_result object (170)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
777	2024-03-13 17:33:41.224015+00	169	modeling_result object (169)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
778	2024-03-13 17:34:18.949406+00	182	modeling_result object (182)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
779	2024-03-13 17:34:18.956575+00	181	modeling_result object (181)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
780	2024-03-13 17:34:18.965359+00	180	modeling_result object (180)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
781	2024-03-13 17:34:18.970435+00	179	modeling_result object (179)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
782	2024-03-13 17:34:18.976565+00	178	modeling_result object (178)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
783	2024-03-13 17:34:18.982821+00	177	modeling_result object (177)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
784	2024-03-13 17:34:18.989668+00	176	modeling_result object (176)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
785	2024-03-13 17:34:54.20476+00	189	modeling_result object (189)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
786	2024-03-13 17:34:54.213646+00	188	modeling_result object (188)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
787	2024-03-13 17:34:54.218647+00	187	modeling_result object (187)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
788	2024-03-13 17:34:54.225926+00	186	modeling_result object (186)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
789	2024-03-13 17:34:54.233484+00	185	modeling_result object (185)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
790	2024-03-13 17:34:54.237753+00	184	modeling_result object (184)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
791	2024-03-13 17:34:54.248012+00	183	modeling_result object (183)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
792	2024-03-13 17:35:53.020146+00	196	modeling_result object (196)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
793	2024-03-13 17:35:53.030438+00	195	modeling_result object (195)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
794	2024-03-13 17:35:53.036757+00	194	modeling_result object (194)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
795	2024-03-13 17:35:53.042955+00	193	modeling_result object (193)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
796	2024-03-13 17:35:53.048868+00	192	modeling_result object (192)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
797	2024-03-13 17:35:53.055109+00	191	modeling_result object (191)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
974	2024-03-17 23:33:55.982574+00	16	Total biodiversity	1	[{"added": {}}]	8	1
798	2024-03-13 17:35:53.063334+00	190	modeling_result object (190)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
799	2024-03-13 17:37:19.609312+00	203	modeling_result object (203)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
800	2024-03-13 17:37:19.617272+00	202	modeling_result object (202)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
801	2024-03-13 17:37:19.626192+00	201	modeling_result object (201)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
802	2024-03-13 17:37:19.633506+00	200	modeling_result object (200)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
803	2024-03-13 17:37:19.640107+00	199	modeling_result object (199)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
804	2024-03-13 17:37:19.646579+00	198	modeling_result object (198)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
805	2024-03-13 17:37:19.653337+00	197	modeling_result object (197)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
806	2024-03-13 17:38:04.276764+00	210	modeling_result object (210)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
807	2024-03-13 17:38:04.284244+00	209	modeling_result object (209)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
808	2024-03-13 17:38:04.289174+00	208	modeling_result object (208)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
809	2024-03-13 17:38:04.29499+00	207	modeling_result object (207)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
810	2024-03-13 17:38:04.3003+00	206	modeling_result object (206)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
811	2024-03-13 17:38:04.305716+00	205	modeling_result object (205)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
812	2024-03-13 17:38:04.312055+00	204	modeling_result object (204)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
813	2024-03-13 17:39:57.931004+00	217	modeling_result object (217)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
814	2024-03-13 17:39:57.938438+00	216	modeling_result object (216)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
815	2024-03-13 17:39:57.946274+00	215	modeling_result object (215)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
816	2024-03-13 17:39:57.951906+00	214	modeling_result object (214)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
817	2024-03-13 17:39:57.95698+00	213	modeling_result object (213)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
818	2024-03-13 17:39:57.961656+00	212	modeling_result object (212)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
819	2024-03-13 17:39:57.966843+00	211	modeling_result object (211)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
820	2024-03-13 17:40:47.109197+00	224	modeling_result object (224)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
821	2024-03-13 17:40:47.11549+00	223	modeling_result object (223)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
822	2024-03-13 17:40:47.120591+00	222	modeling_result object (222)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
823	2024-03-13 17:40:47.127547+00	221	modeling_result object (221)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
824	2024-03-13 17:40:47.135383+00	220	modeling_result object (220)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
825	2024-03-13 17:40:47.140352+00	219	modeling_result object (219)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
826	2024-03-13 17:40:47.148282+00	218	modeling_result object (218)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
827	2024-03-13 17:45:05.442219+00	231	modeling_result object (231)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
828	2024-03-13 17:45:05.450045+00	230	modeling_result object (230)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
829	2024-03-13 17:45:05.458617+00	229	modeling_result object (229)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
830	2024-03-13 17:45:05.464272+00	228	modeling_result object (228)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
831	2024-03-13 17:45:05.470392+00	227	modeling_result object (227)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
832	2024-03-13 17:45:05.475835+00	226	modeling_result object (226)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
833	2024-03-13 17:45:05.481916+00	225	modeling_result object (225)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
834	2024-03-13 17:45:56.477059+00	231	modeling_result object (231)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
835	2024-03-13 17:45:56.483464+00	230	modeling_result object (230)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
836	2024-03-13 17:45:56.489996+00	229	modeling_result object (229)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
837	2024-03-13 17:45:56.495598+00	228	modeling_result object (228)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
838	2024-03-13 17:45:56.502386+00	227	modeling_result object (227)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
839	2024-03-13 17:45:56.53904+00	226	modeling_result object (226)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
840	2024-03-13 17:45:56.545246+00	225	modeling_result object (225)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
841	2024-03-13 17:46:59.198147+00	238	modeling_result object (238)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
842	2024-03-13 17:46:59.203981+00	237	modeling_result object (237)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
843	2024-03-13 17:46:59.209138+00	236	modeling_result object (236)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
844	2024-03-13 17:46:59.214853+00	235	modeling_result object (235)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
845	2024-03-13 17:46:59.22023+00	234	modeling_result object (234)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
846	2024-03-13 17:46:59.227766+00	233	modeling_result object (233)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
847	2024-03-13 17:46:59.233409+00	232	modeling_result object (232)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
848	2024-03-13 17:47:45.702007+00	245	modeling_result object (245)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
849	2024-03-13 17:47:45.708788+00	244	modeling_result object (244)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
850	2024-03-13 17:47:45.713903+00	243	modeling_result object (243)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
851	2024-03-13 17:47:45.719388+00	242	modeling_result object (242)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
852	2024-03-13 17:47:45.724873+00	241	modeling_result object (241)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
853	2024-03-13 17:47:45.730517+00	240	modeling_result object (240)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
975	2024-03-17 23:34:19.49989+00	17	Capacity of Carbone storage	1	[{"added": {}}]	8	1
854	2024-03-13 17:47:45.734429+00	239	modeling_result object (239)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
855	2024-03-13 17:48:39.593666+00	252	modeling_result object (252)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
856	2024-03-13 17:48:39.600389+00	251	modeling_result object (251)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
857	2024-03-13 17:48:39.605897+00	250	modeling_result object (250)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
858	2024-03-13 17:48:39.614008+00	249	modeling_result object (249)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
859	2024-03-13 17:48:39.618529+00	248	modeling_result object (248)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
860	2024-03-13 17:48:39.62463+00	247	modeling_result object (247)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
861	2024-03-13 17:48:39.630956+00	246	modeling_result object (246)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
862	2024-03-13 17:49:38.496387+00	259	modeling_result object (259)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
863	2024-03-13 17:49:38.503422+00	258	modeling_result object (258)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
864	2024-03-13 17:49:38.508232+00	257	modeling_result object (257)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
865	2024-03-13 17:49:38.514559+00	256	modeling_result object (256)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
866	2024-03-13 17:49:38.5201+00	255	modeling_result object (255)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
867	2024-03-13 17:49:38.527824+00	254	modeling_result object (254)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
868	2024-03-13 17:49:38.533011+00	253	modeling_result object (253)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
869	2024-03-14 07:27:06.089702+00	323	criteria_params object (323)	3		9	1
870	2024-03-14 07:27:06.092695+00	322	criteria_params object (322)	3		9	1
871	2024-03-14 07:27:06.094343+00	321	criteria_params object (321)	3		9	1
872	2024-03-14 07:27:13.852128+00	96	alternatives_params object (96)	3		12	1
873	2024-03-14 07:27:28.353098+00	36	scenario_user object (36)	3		14	1
874	2024-03-14 07:27:28.355847+00	35	scenario_user object (35)	3		14	1
875	2024-03-14 07:29:36.061533+00	11	Cost	3		8	1
876	2024-03-14 07:29:36.067501+00	10	Physical and psychological experience	3		8	1
877	2024-03-14 07:30:01.005859+00	12	Macrophyte	1	[{"added": {}}]	8	1
878	2024-03-14 07:45:23.441148+00	266	modeling_result object (266)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
879	2024-03-14 07:45:23.446591+00	265	modeling_result object (265)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
880	2024-03-14 07:45:23.450538+00	264	modeling_result object (264)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
881	2024-03-14 07:45:23.454083+00	263	modeling_result object (263)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
882	2024-03-14 07:45:23.458556+00	262	modeling_result object (262)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
883	2024-03-14 07:45:23.463565+00	261	modeling_result object (261)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
884	2024-03-14 07:45:23.471015+00	260	modeling_result object (260)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
885	2024-03-14 07:51:57.618684+00	306	modeling_result object (306)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
886	2024-03-14 07:51:57.622448+00	305	modeling_result object (305)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
887	2024-03-14 07:51:57.627275+00	304	modeling_result object (304)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
888	2024-03-14 07:51:57.630681+00	303	modeling_result object (303)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
889	2024-03-14 07:51:57.63378+00	302	modeling_result object (302)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
890	2024-03-14 07:51:57.63746+00	301	modeling_result object (301)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
891	2024-03-14 07:51:57.64305+00	300	modeling_result object (300)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
892	2024-03-14 07:51:57.64645+00	299	modeling_result object (299)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
893	2024-03-14 07:51:57.650761+00	298	modeling_result object (298)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
894	2024-03-14 07:51:57.654262+00	297	modeling_result object (297)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
895	2024-03-14 07:51:57.659617+00	296	modeling_result object (296)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
896	2024-03-14 07:51:57.664153+00	295	modeling_result object (295)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
897	2024-03-14 07:51:57.667005+00	294	modeling_result object (294)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
898	2024-03-14 07:51:57.669548+00	293	modeling_result object (293)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
899	2024-03-14 07:51:57.672002+00	292	modeling_result object (292)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
900	2024-03-14 07:51:57.674643+00	291	modeling_result object (291)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
901	2024-03-14 07:51:57.67766+00	290	modeling_result object (290)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
902	2024-03-14 07:51:57.680162+00	289	modeling_result object (289)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
903	2024-03-14 07:51:57.682695+00	288	modeling_result object (288)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
904	2024-03-14 07:51:57.685338+00	287	modeling_result object (287)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
905	2024-03-14 07:51:57.687782+00	286	modeling_result object (286)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
906	2024-03-14 07:51:57.690392+00	285	modeling_result object (285)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
907	2024-03-14 07:51:57.693973+00	284	modeling_result object (284)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
908	2024-03-14 07:51:57.697409+00	283	modeling_result object (283)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
909	2024-03-14 07:51:57.701045+00	282	modeling_result object (282)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
910	2024-03-14 07:51:57.704981+00	281	modeling_result object (281)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
911	2024-03-14 07:51:57.712063+00	280	modeling_result object (280)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
912	2024-03-14 07:51:57.717296+00	279	modeling_result object (279)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
913	2024-03-14 07:51:57.720826+00	278	modeling_result object (278)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
914	2024-03-14 07:51:57.725713+00	277	modeling_result object (277)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
915	2024-03-14 07:51:57.730182+00	276	modeling_result object (276)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
916	2024-03-14 07:51:57.734823+00	275	modeling_result object (275)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
917	2024-03-14 07:51:57.739537+00	274	modeling_result object (274)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
918	2024-03-14 07:51:57.743835+00	273	modeling_result object (273)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
919	2024-03-14 07:51:57.748693+00	272	modeling_result object (272)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
920	2024-03-14 07:51:57.753674+00	271	modeling_result object (271)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
921	2024-03-14 07:51:57.759333+00	270	modeling_result object (270)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
922	2024-03-14 07:51:57.766115+00	269	modeling_result object (269)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
923	2024-03-14 07:51:57.771763+00	268	modeling_result object (268)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
924	2024-03-14 07:51:57.778352+00	267	modeling_result object (267)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
925	2024-03-14 07:52:33.216003+00	307	modeling_result object (307)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
926	2024-03-14 07:52:50.163486+00	308	modeling_result object (308)	2	[{"changed": {"fields": ["Scenario"]}}]	17	1
927	2024-03-14 07:54:45.919395+00	3	satisfaction_threshold object (3)	2	[{"changed": {"fields": ["Criteria id", "Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
928	2024-03-14 07:57:23.515925+00	322	modeling_result object (322)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
929	2024-03-14 07:57:23.521538+00	321	modeling_result object (321)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
930	2024-03-14 07:57:23.527486+00	320	modeling_result object (320)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
931	2024-03-14 07:57:23.530883+00	319	modeling_result object (319)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
932	2024-03-14 07:57:23.533679+00	318	modeling_result object (318)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
933	2024-03-14 07:57:23.537608+00	317	modeling_result object (317)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
934	2024-03-14 07:57:23.541253+00	316	modeling_result object (316)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
935	2024-03-14 07:57:23.546856+00	315	modeling_result object (315)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
936	2024-03-14 07:57:23.551526+00	314	modeling_result object (314)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
937	2024-03-14 07:57:23.556487+00	313	modeling_result object (313)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
938	2024-03-14 07:57:23.564493+00	312	modeling_result object (312)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
939	2024-03-14 07:57:23.569169+00	311	modeling_result object (311)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
940	2024-03-14 07:57:23.575623+00	310	modeling_result object (310)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
941	2024-03-14 07:57:23.581896+00	309	modeling_result object (309)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
942	2024-03-14 08:43:14.466826+00	328	criteria_params object (328)	3		9	1
943	2024-03-14 08:43:14.472633+00	327	criteria_params object (327)	3		9	1
944	2024-03-14 08:43:14.474784+00	326	criteria_params object (326)	3		9	1
945	2024-03-14 08:43:14.476762+00	325	criteria_params object (325)	3		9	1
946	2024-03-14 08:43:14.479071+00	324	criteria_params object (324)	3		9	1
947	2024-03-14 08:48:52.143137+00	1	satisfaction_threshold object (1)	3		10	1
948	2024-03-14 09:15:36.265245+00	1	Aquatic plant species	3		8	1
949	2024-03-14 11:16:09.673507+00	4	aurelie.b	1	[{"added": {}}]	6	1
950	2024-03-14 11:17:10.885061+00	4	aurelie.b	2	[{"changed": {"fields": ["Staff status", "User permissions"]}}]	6	1
951	2024-03-14 11:18:17.155086+00	4	aurelie.b	3		6	1
952	2024-03-14 11:19:27.566133+00	5	aurelie.b	1	[{"added": {}}]	6	1
953	2024-03-14 11:20:16.930841+00	5	aurelie.b	2	[{"changed": {"fields": ["Email address", "Staff status", "User permissions"]}}]	6	1
954	2024-03-14 11:23:11.37455+00	5	aurelie.b	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	6	1
955	2024-03-14 11:24:11.140746+00	5	aurelie.b	2	[{"changed": {"fields": ["User permissions"]}}]	6	1
956	2024-03-14 11:25:22.234358+00	5	aurelie.b	2	[{"changed": {"fields": ["Staff status"]}}]	6	1
957	2024-03-14 11:27:48.283959+00	5	aurelie.b	2	[{"changed": {"fields": ["User permissions"]}}]	6	1
958	2024-03-14 11:29:00.915542+00	5	aurelie.b	2	[{"changed": {"fields": ["Superuser status"]}}]	6	1
959	2024-03-14 15:30:34.704839+00	12	Aquatic plant species	2	[{"changed": {"fields": ["Criteria Name"]}}]	8	5
960	2024-03-14 15:35:34.11632+00	7	Carbon budget	3		8	5
961	2024-03-14 15:41:57.156768+00	5	aurelie.b	2	[{"changed": {"fields": ["User permissions"]}}]	6	1
962	2024-03-14 15:46:13.687573+00	5	aurelie.b	2	[{"changed": {"fields": ["User permissions"]}}]	6	1
963	2024-03-17 19:08:21.933048+00	10	Land Use: No Change, Climate Change: SSP5	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
964	2024-03-17 19:08:41.72892+00	9	Land Use: No Change, Climate Change: SSP3	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
965	2024-03-17 23:32:09.060571+00	9	Water quality	3		8	1
966	2024-03-17 23:32:09.069626+00	8	Water quantity	3		8	1
967	2024-03-17 23:32:09.071925+00	6	GHG emission (CH4, CO2, N2O)	3		8	1
968	2024-03-17 23:32:09.074306+00	5	Capacity of C storage	3		8	1
969	2024-03-17 23:32:09.07807+00	3	Dragonfly species	3		8	1
970	2024-03-17 23:32:23.805778+00	13	test	1	[{"added": {}}]	8	1
971	2024-03-17 23:32:51.365634+00	13	test	3		8	1
972	2024-03-17 23:33:20.857941+00	14	Dragonflies	1	[{"added": {}}]	8	1
976	2024-03-17 23:34:36.241888+00	18	GHG emission (CH4, CO2, N2O)	1	[{"added": {}}]	8	1
977	2024-03-17 23:34:50.618567+00	19	Water quantity	1	[{"added": {}}]	8	1
978	2024-03-17 23:35:01.656509+00	20	Water quality	1	[{"added": {}}]	8	1
979	2024-03-17 23:37:02.260986+00	17	Yverdon	3		7	1
980	2024-03-17 23:37:02.270878+00	16	geneve2	3		7	1
981	2024-03-17 23:37:02.273471+00	14	geneve	3		7	1
982	2024-03-17 23:37:02.275981+00	1	Just test	3		7	1
983	2024-03-18 12:25:17.645304+00	329	modeling_result object (329)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
984	2024-03-18 12:25:17.653825+00	328	modeling_result object (328)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
985	2024-03-18 12:25:17.659039+00	327	modeling_result object (327)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
986	2024-03-18 12:25:17.664398+00	326	modeling_result object (326)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
987	2024-03-18 12:25:17.67123+00	325	modeling_result object (325)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
988	2024-03-18 12:25:17.676506+00	324	modeling_result object (324)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
989	2024-03-18 12:25:17.682398+00	323	modeling_result object (323)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
990	2024-03-18 12:27:06.670234+00	336	modeling_result object (336)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
991	2024-03-18 12:27:06.685706+00	335	modeling_result object (335)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
992	2024-03-18 12:27:06.694325+00	334	modeling_result object (334)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
993	2024-03-18 12:27:06.702701+00	333	modeling_result object (333)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
994	2024-03-18 12:27:06.71254+00	332	modeling_result object (332)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
995	2024-03-18 12:27:06.721788+00	331	modeling_result object (331)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
996	2024-03-18 12:27:06.729521+00	330	modeling_result object (330)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
997	2024-03-18 12:33:42.968141+00	343	modeling_result object (343)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
998	2024-03-18 12:33:42.973647+00	342	modeling_result object (342)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
999	2024-03-18 12:33:42.978846+00	341	modeling_result object (341)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1000	2024-03-18 12:33:42.982462+00	340	modeling_result object (340)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1001	2024-03-18 12:33:42.986355+00	339	modeling_result object (339)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1002	2024-03-18 12:33:42.990547+00	338	modeling_result object (338)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1003	2024-03-18 12:33:42.994984+00	337	modeling_result object (337)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1004	2024-03-18 12:37:07.450502+00	350	modeling_result object (350)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1005	2024-03-18 12:37:07.459793+00	349	modeling_result object (349)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1006	2024-03-18 12:37:07.46625+00	348	modeling_result object (348)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1007	2024-03-18 12:37:07.472746+00	347	modeling_result object (347)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1008	2024-03-18 12:37:07.480897+00	346	modeling_result object (346)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1009	2024-03-18 12:37:07.487116+00	345	modeling_result object (345)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1010	2024-03-18 12:37:07.493461+00	344	modeling_result object (344)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1011	2024-03-18 12:39:20.48838+00	357	modeling_result object (357)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1012	2024-03-18 12:39:20.500857+00	356	modeling_result object (356)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1013	2024-03-18 12:39:20.510625+00	355	modeling_result object (355)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1014	2024-03-18 12:39:20.51811+00	354	modeling_result object (354)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1015	2024-03-18 12:39:20.526489+00	353	modeling_result object (353)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1016	2024-03-18 12:39:20.534957+00	352	modeling_result object (352)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1017	2024-03-18 12:39:20.544427+00	351	modeling_result object (351)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1018	2024-03-18 12:42:05.775679+00	364	modeling_result object (364)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1019	2024-03-18 12:42:05.786069+00	363	modeling_result object (363)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1020	2024-03-18 12:42:05.794459+00	362	modeling_result object (362)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1021	2024-03-18 12:42:05.800722+00	361	modeling_result object (361)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1022	2024-03-18 12:42:05.807843+00	360	modeling_result object (360)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1023	2024-03-18 12:42:05.814505+00	359	modeling_result object (359)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1024	2024-03-18 12:42:05.821076+00	358	modeling_result object (358)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1025	2024-03-18 12:44:04.379775+00	371	modeling_result object (371)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1026	2024-03-18 12:44:04.385366+00	370	modeling_result object (370)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1027	2024-03-18 12:44:04.390422+00	369	modeling_result object (369)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1028	2024-03-18 12:44:04.394701+00	368	modeling_result object (368)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1029	2024-03-18 12:44:04.3986+00	367	modeling_result object (367)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1030	2024-03-18 12:44:04.40313+00	366	modeling_result object (366)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1031	2024-03-18 12:44:04.410502+00	365	modeling_result object (365)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1032	2024-03-18 12:45:55.73902+00	378	modeling_result object (378)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1033	2024-03-18 12:45:55.74782+00	377	modeling_result object (377)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1034	2024-03-18 12:45:55.755056+00	376	modeling_result object (376)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1035	2024-03-18 12:45:55.761622+00	375	modeling_result object (375)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1036	2024-03-18 12:45:55.766967+00	374	modeling_result object (374)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1037	2024-03-18 12:45:55.773008+00	373	modeling_result object (373)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1038	2024-03-18 12:45:55.782653+00	372	modeling_result object (372)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1039	2024-03-18 12:48:09.823737+00	385	modeling_result object (385)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1040	2024-03-18 12:48:09.831776+00	384	modeling_result object (384)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1041	2024-03-18 12:48:09.835763+00	383	modeling_result object (383)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1042	2024-03-18 12:48:09.840747+00	382	modeling_result object (382)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1043	2024-03-18 12:48:09.84462+00	381	modeling_result object (381)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1044	2024-03-18 12:48:09.848574+00	380	modeling_result object (380)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1045	2024-03-18 12:48:09.852286+00	379	modeling_result object (379)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1046	2024-03-18 12:49:46.662738+00	392	modeling_result object (392)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1047	2024-03-18 12:49:46.668724+00	391	modeling_result object (391)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1048	2024-03-18 12:49:46.675949+00	390	modeling_result object (390)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1049	2024-03-18 12:49:46.680227+00	389	modeling_result object (389)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1050	2024-03-18 12:49:46.684897+00	388	modeling_result object (388)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1051	2024-03-18 12:49:46.689838+00	387	modeling_result object (387)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1052	2024-03-18 12:49:46.694976+00	386	modeling_result object (386)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1053	2024-03-18 12:51:20.442458+00	399	modeling_result object (399)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1054	2024-03-18 12:51:20.450654+00	398	modeling_result object (398)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1055	2024-03-18 12:51:20.45568+00	397	modeling_result object (397)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1056	2024-03-18 12:51:20.459652+00	396	modeling_result object (396)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1057	2024-03-18 12:51:20.464069+00	395	modeling_result object (395)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1058	2024-03-18 12:51:20.469004+00	394	modeling_result object (394)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1059	2024-03-18 12:51:20.473769+00	393	modeling_result object (393)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1060	2024-03-18 12:52:16.906699+00	406	modeling_result object (406)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1061	2024-03-18 12:52:16.914424+00	405	modeling_result object (405)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1062	2024-03-18 12:52:16.92057+00	404	modeling_result object (404)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1063	2024-03-18 12:52:16.925849+00	403	modeling_result object (403)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1064	2024-03-18 12:52:16.930926+00	402	modeling_result object (402)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1065	2024-03-18 12:52:16.937735+00	401	modeling_result object (401)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1066	2024-03-18 12:52:16.942988+00	400	modeling_result object (400)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1067	2024-03-18 17:14:49.185509+00	413	modeling_result object (413)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1068	2024-03-18 17:14:49.190723+00	412	modeling_result object (412)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1069	2024-03-18 17:14:49.193563+00	411	modeling_result object (411)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1070	2024-03-18 17:14:49.196403+00	410	modeling_result object (410)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1071	2024-03-18 17:14:49.199674+00	409	modeling_result object (409)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1072	2024-03-18 17:14:49.203268+00	408	modeling_result object (408)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1073	2024-03-18 17:14:49.205877+00	407	modeling_result object (407)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1074	2024-03-18 17:15:57.286552+00	420	modeling_result object (420)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1075	2024-03-18 17:15:57.291166+00	419	modeling_result object (419)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1076	2024-03-18 17:15:57.296076+00	418	modeling_result object (418)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1077	2024-03-18 17:15:57.299669+00	417	modeling_result object (417)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1078	2024-03-18 17:15:57.302405+00	416	modeling_result object (416)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1079	2024-03-18 17:15:57.305001+00	415	modeling_result object (415)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1080	2024-03-18 17:15:57.30779+00	414	modeling_result object (414)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1081	2024-03-18 17:17:23.775667+00	427	modeling_result object (427)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1082	2024-03-18 17:17:23.783102+00	426	modeling_result object (426)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1083	2024-03-18 17:17:23.787597+00	425	modeling_result object (425)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1084	2024-03-18 17:17:23.790995+00	424	modeling_result object (424)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1085	2024-03-18 17:17:23.795365+00	423	modeling_result object (423)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1086	2024-03-18 17:17:23.800482+00	422	modeling_result object (422)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1087	2024-03-18 17:17:23.803269+00	421	modeling_result object (421)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1088	2024-03-18 17:18:14.323901+00	434	modeling_result object (434)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1089	2024-03-18 17:18:14.330085+00	433	modeling_result object (433)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1090	2024-03-18 17:18:14.333537+00	432	modeling_result object (432)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1091	2024-03-18 17:18:14.33701+00	431	modeling_result object (431)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1092	2024-03-18 17:18:14.340811+00	430	modeling_result object (430)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1093	2024-03-18 17:18:14.34667+00	429	modeling_result object (429)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1094	2024-03-18 17:18:14.350246+00	428	modeling_result object (428)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1095	2024-03-18 17:19:04.784812+00	441	modeling_result object (441)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1096	2024-03-18 17:19:04.789599+00	440	modeling_result object (440)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1097	2024-03-18 17:19:04.792555+00	439	modeling_result object (439)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1098	2024-03-18 17:19:04.79757+00	438	modeling_result object (438)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1099	2024-03-18 17:19:04.804178+00	437	modeling_result object (437)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1100	2024-03-18 17:19:04.807521+00	436	modeling_result object (436)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1101	2024-03-18 17:19:04.811193+00	435	modeling_result object (435)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1102	2024-03-18 17:22:55.401715+00	448	modeling_result object (448)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1103	2024-03-18 17:22:55.407124+00	447	modeling_result object (447)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1104	2024-03-18 17:22:55.410048+00	446	modeling_result object (446)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1105	2024-03-18 17:22:55.413109+00	445	modeling_result object (445)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1106	2024-03-18 17:22:55.416183+00	444	modeling_result object (444)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1107	2024-03-18 17:22:55.418875+00	443	modeling_result object (443)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1108	2024-03-18 17:22:55.422433+00	442	modeling_result object (442)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1109	2024-03-18 17:24:18.402707+00	455	modeling_result object (455)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1110	2024-03-18 17:24:18.407251+00	454	modeling_result object (454)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1111	2024-03-18 17:24:18.410397+00	453	modeling_result object (453)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1112	2024-03-18 17:24:18.413258+00	452	modeling_result object (452)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1113	2024-03-18 17:24:18.418825+00	451	modeling_result object (451)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1114	2024-03-18 17:24:18.422023+00	450	modeling_result object (450)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1115	2024-03-18 17:24:18.425235+00	449	modeling_result object (449)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1116	2024-03-18 17:25:04.750682+00	462	modeling_result object (462)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1117	2024-03-18 17:25:04.755108+00	461	modeling_result object (461)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1118	2024-03-18 17:25:04.759772+00	460	modeling_result object (460)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1119	2024-03-18 17:25:04.764787+00	459	modeling_result object (459)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1120	2024-03-18 17:25:04.769249+00	458	modeling_result object (458)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1121	2024-03-18 17:25:04.771967+00	457	modeling_result object (457)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1122	2024-03-18 17:25:04.774653+00	456	modeling_result object (456)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1123	2024-03-18 17:25:59.87015+00	469	modeling_result object (469)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1124	2024-03-18 17:25:59.875637+00	468	modeling_result object (468)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1125	2024-03-18 17:25:59.879279+00	467	modeling_result object (467)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1126	2024-03-18 17:25:59.884267+00	466	modeling_result object (466)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1127	2024-03-18 17:25:59.887779+00	465	modeling_result object (465)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1128	2024-03-18 17:25:59.890564+00	464	modeling_result object (464)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1129	2024-03-18 17:25:59.893382+00	463	modeling_result object (463)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1130	2024-03-18 17:28:32.505708+00	476	modeling_result object (476)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1131	2024-03-18 17:28:32.510501+00	475	modeling_result object (475)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1132	2024-03-18 17:28:32.513961+00	474	modeling_result object (474)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1133	2024-03-18 17:28:32.519208+00	473	modeling_result object (473)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1134	2024-03-18 17:28:32.522687+00	472	modeling_result object (472)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1135	2024-03-18 17:28:32.526145+00	471	modeling_result object (471)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1136	2024-03-18 17:28:32.52907+00	470	modeling_result object (470)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1137	2024-03-18 17:29:50.271924+00	483	modeling_result object (483)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1138	2024-03-18 17:29:50.278177+00	482	modeling_result object (482)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1139	2024-03-18 17:29:50.285076+00	481	modeling_result object (481)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1140	2024-03-18 17:29:50.288852+00	480	modeling_result object (480)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1141	2024-03-18 17:29:50.292087+00	479	modeling_result object (479)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1142	2024-03-18 17:29:50.294962+00	478	modeling_result object (478)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1270	2024-03-26 10:30:08.751427+00	678	mcda_result object (678)	3		18	1
1143	2024-03-18 17:29:50.297893+00	477	modeling_result object (477)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1144	2024-03-18 17:30:52.510976+00	490	modeling_result object (490)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1145	2024-03-18 17:30:52.515708+00	489	modeling_result object (489)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1146	2024-03-18 17:30:52.519028+00	488	modeling_result object (488)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1147	2024-03-18 17:30:52.522025+00	487	modeling_result object (487)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1148	2024-03-18 17:30:52.525134+00	486	modeling_result object (486)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1149	2024-03-18 17:30:52.529238+00	485	modeling_result object (485)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1150	2024-03-18 17:30:52.533518+00	484	modeling_result object (484)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1151	2024-03-18 17:31:35.043355+00	497	modeling_result object (497)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1152	2024-03-18 17:31:35.051398+00	496	modeling_result object (496)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1153	2024-03-18 17:31:35.056772+00	495	modeling_result object (495)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1154	2024-03-18 17:31:35.06021+00	494	modeling_result object (494)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1155	2024-03-18 17:31:35.064293+00	493	modeling_result object (493)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1156	2024-03-18 17:31:35.068876+00	492	modeling_result object (492)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1157	2024-03-18 17:31:35.072513+00	491	modeling_result object (491)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1158	2024-03-18 17:32:26.56739+00	504	modeling_result object (504)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1159	2024-03-18 17:32:26.571879+00	503	modeling_result object (503)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1160	2024-03-18 17:32:26.575245+00	502	modeling_result object (502)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1161	2024-03-18 17:32:26.578323+00	501	modeling_result object (501)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1162	2024-03-18 17:32:26.58171+00	500	modeling_result object (500)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1163	2024-03-18 17:32:26.588891+00	499	modeling_result object (499)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1164	2024-03-18 17:32:26.592527+00	498	modeling_result object (498)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1165	2024-03-18 17:33:19.682775+00	511	modeling_result object (511)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1166	2024-03-18 17:33:19.690408+00	510	modeling_result object (510)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1167	2024-03-18 17:33:19.694232+00	509	modeling_result object (509)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1168	2024-03-18 17:33:19.69716+00	508	modeling_result object (508)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1169	2024-03-18 17:33:19.702399+00	507	modeling_result object (507)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1170	2024-03-18 17:33:19.707221+00	506	modeling_result object (506)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1171	2024-03-18 17:33:19.710358+00	505	modeling_result object (505)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1172	2024-03-18 17:34:03.120532+00	518	modeling_result object (518)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1173	2024-03-18 17:34:03.124342+00	517	modeling_result object (517)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1174	2024-03-18 17:34:03.12735+00	516	modeling_result object (516)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1175	2024-03-18 17:34:03.130652+00	515	modeling_result object (515)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1176	2024-03-18 17:34:03.135989+00	514	modeling_result object (514)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1177	2024-03-18 17:34:03.139657+00	513	modeling_result object (513)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1178	2024-03-18 17:34:03.142569+00	512	modeling_result object (512)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1179	2024-03-18 17:34:54.252855+00	525	modeling_result object (525)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1180	2024-03-18 17:34:54.257918+00	524	modeling_result object (524)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1181	2024-03-18 17:34:54.260745+00	523	modeling_result object (523)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1182	2024-03-18 17:34:54.263529+00	522	modeling_result object (522)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1183	2024-03-18 17:34:54.266083+00	521	modeling_result object (521)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1184	2024-03-18 17:34:54.268763+00	520	modeling_result object (520)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1185	2024-03-18 17:34:54.271465+00	519	modeling_result object (519)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1186	2024-03-18 17:35:47.713657+00	532	modeling_result object (532)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1187	2024-03-18 17:35:47.720892+00	531	modeling_result object (531)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1188	2024-03-18 17:35:47.72399+00	530	modeling_result object (530)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1189	2024-03-18 17:35:47.726779+00	529	modeling_result object (529)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1190	2024-03-18 17:35:47.729405+00	528	modeling_result object (528)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1191	2024-03-18 17:35:47.732118+00	527	modeling_result object (527)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1192	2024-03-18 17:35:47.734757+00	526	modeling_result object (526)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1193	2024-03-18 17:38:51.843562+00	539	modeling_result object (539)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1194	2024-03-18 17:38:51.852002+00	538	modeling_result object (538)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1195	2024-03-18 17:38:51.859344+00	537	modeling_result object (537)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1196	2024-03-18 17:38:51.86425+00	536	modeling_result object (536)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1197	2024-03-18 17:38:51.872635+00	535	modeling_result object (535)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1198	2024-03-18 17:38:51.877808+00	534	modeling_result object (534)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1199	2024-03-18 17:38:51.882579+00	533	modeling_result object (533)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1200	2024-03-18 17:40:03.214426+00	539	modeling_result object (539)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1201	2024-03-18 17:40:03.219667+00	538	modeling_result object (538)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1202	2024-03-18 17:40:03.222646+00	537	modeling_result object (537)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1203	2024-03-18 17:40:03.22527+00	536	modeling_result object (536)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1204	2024-03-18 17:40:03.227797+00	535	modeling_result object (535)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1205	2024-03-18 17:40:03.232909+00	534	modeling_result object (534)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1206	2024-03-18 17:40:03.236171+00	533	modeling_result object (533)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1207	2024-03-18 17:41:30.060377+00	546	modeling_result object (546)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1208	2024-03-18 17:41:30.064543+00	545	modeling_result object (545)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1209	2024-03-18 17:41:30.067542+00	544	modeling_result object (544)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1210	2024-03-18 17:41:30.070584+00	543	modeling_result object (543)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1211	2024-03-18 17:41:30.074344+00	542	modeling_result object (542)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1212	2024-03-18 17:41:30.077398+00	541	modeling_result object (541)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1213	2024-03-18 17:41:30.080072+00	540	modeling_result object (540)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1214	2024-03-18 17:42:57.138298+00	4	satisfaction_threshold object (4)	1	[{"added": {}}]	10	1
1215	2024-03-18 17:45:28.393542+00	3	satisfaction_threshold object (3)	2	[{"changed": {"fields": ["Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
1216	2024-03-26 10:30:08.618174+00	732	mcda_result object (732)	3		18	1
1217	2024-03-26 10:30:08.626385+00	731	mcda_result object (731)	3		18	1
1218	2024-03-26 10:30:08.628678+00	730	mcda_result object (730)	3		18	1
1219	2024-03-26 10:30:08.630586+00	729	mcda_result object (729)	3		18	1
1220	2024-03-26 10:30:08.63248+00	728	mcda_result object (728)	3		18	1
1221	2024-03-26 10:30:08.634344+00	727	mcda_result object (727)	3		18	1
1222	2024-03-26 10:30:08.636235+00	726	mcda_result object (726)	3		18	1
1223	2024-03-26 10:30:08.638172+00	725	mcda_result object (725)	3		18	1
1224	2024-03-26 10:30:08.640291+00	724	mcda_result object (724)	3		18	1
1225	2024-03-26 10:30:08.644105+00	723	mcda_result object (723)	3		18	1
1226	2024-03-26 10:30:08.646098+00	722	mcda_result object (722)	3		18	1
1227	2024-03-26 10:30:08.648029+00	721	mcda_result object (721)	3		18	1
1228	2024-03-26 10:30:08.650099+00	720	mcda_result object (720)	3		18	1
1229	2024-03-26 10:30:08.65194+00	719	mcda_result object (719)	3		18	1
1230	2024-03-26 10:30:08.653696+00	718	mcda_result object (718)	3		18	1
1231	2024-03-26 10:30:08.655592+00	717	mcda_result object (717)	3		18	1
1232	2024-03-26 10:30:08.658171+00	716	mcda_result object (716)	3		18	1
1233	2024-03-26 10:30:08.660804+00	715	mcda_result object (715)	3		18	1
1234	2024-03-26 10:30:08.662599+00	714	mcda_result object (714)	3		18	1
1235	2024-03-26 10:30:08.664662+00	713	mcda_result object (713)	3		18	1
1236	2024-03-26 10:30:08.666635+00	712	mcda_result object (712)	3		18	1
1237	2024-03-26 10:30:08.668463+00	711	mcda_result object (711)	3		18	1
1238	2024-03-26 10:30:08.670353+00	710	mcda_result object (710)	3		18	1
1239	2024-03-26 10:30:08.67254+00	709	mcda_result object (709)	3		18	1
1240	2024-03-26 10:30:08.675342+00	708	mcda_result object (708)	3		18	1
1241	2024-03-26 10:30:08.679761+00	707	mcda_result object (707)	3		18	1
1242	2024-03-26 10:30:08.681888+00	706	mcda_result object (706)	3		18	1
1243	2024-03-26 10:30:08.683829+00	705	mcda_result object (705)	3		18	1
1244	2024-03-26 10:30:08.685644+00	704	mcda_result object (704)	3		18	1
1245	2024-03-26 10:30:08.687478+00	703	mcda_result object (703)	3		18	1
1246	2024-03-26 10:30:08.689374+00	702	mcda_result object (702)	3		18	1
1247	2024-03-26 10:30:08.694915+00	701	mcda_result object (701)	3		18	1
1248	2024-03-26 10:30:08.697941+00	700	mcda_result object (700)	3		18	1
1249	2024-03-26 10:30:08.700071+00	699	mcda_result object (699)	3		18	1
1250	2024-03-26 10:30:08.702482+00	698	mcda_result object (698)	3		18	1
1251	2024-03-26 10:30:08.704739+00	697	mcda_result object (697)	3		18	1
1252	2024-03-26 10:30:08.706991+00	696	mcda_result object (696)	3		18	1
1253	2024-03-26 10:30:08.710386+00	695	mcda_result object (695)	3		18	1
1254	2024-03-26 10:30:08.71311+00	694	mcda_result object (694)	3		18	1
1255	2024-03-26 10:30:08.715421+00	693	mcda_result object (693)	3		18	1
1256	2024-03-26 10:30:08.71754+00	692	mcda_result object (692)	3		18	1
1257	2024-03-26 10:30:08.719651+00	691	mcda_result object (691)	3		18	1
1258	2024-03-26 10:30:08.721869+00	690	mcda_result object (690)	3		18	1
1259	2024-03-26 10:30:08.724518+00	689	mcda_result object (689)	3		18	1
1260	2024-03-26 10:30:08.727829+00	688	mcda_result object (688)	3		18	1
1261	2024-03-26 10:30:08.729737+00	687	mcda_result object (687)	3		18	1
1262	2024-03-26 10:30:08.731391+00	686	mcda_result object (686)	3		18	1
1263	2024-03-26 10:30:08.733137+00	685	mcda_result object (685)	3		18	1
1264	2024-03-26 10:30:08.735318+00	684	mcda_result object (684)	3		18	1
1265	2024-03-26 10:30:08.737385+00	683	mcda_result object (683)	3		18	1
1266	2024-03-26 10:30:08.740743+00	682	mcda_result object (682)	3		18	1
1267	2024-03-26 10:30:08.7451+00	681	mcda_result object (681)	3		18	1
1268	2024-03-26 10:30:08.74722+00	680	mcda_result object (680)	3		18	1
1269	2024-03-26 10:30:08.749104+00	679	mcda_result object (679)	3		18	1
1271	2024-03-26 10:30:08.753495+00	677	mcda_result object (677)	3		18	1
1272	2024-03-26 10:30:08.755795+00	676	mcda_result object (676)	3		18	1
1273	2024-03-26 10:30:08.759688+00	675	mcda_result object (675)	3		18	1
1274	2024-03-26 10:30:08.761596+00	674	mcda_result object (674)	3		18	1
1275	2024-03-26 10:30:08.763555+00	673	mcda_result object (673)	3		18	1
1276	2024-03-26 10:30:08.765841+00	672	mcda_result object (672)	3		18	1
1277	2024-03-26 10:30:08.768379+00	671	mcda_result object (671)	3		18	1
1278	2024-03-26 10:30:08.770484+00	670	mcda_result object (670)	3		18	1
1279	2024-03-26 10:30:08.772412+00	669	mcda_result object (669)	3		18	1
1280	2024-03-26 10:30:08.776089+00	668	mcda_result object (668)	3		18	1
1281	2024-03-26 10:30:08.778211+00	667	mcda_result object (667)	3		18	1
1282	2024-03-26 10:30:08.780231+00	666	mcda_result object (666)	3		18	1
1283	2024-03-26 10:30:08.782138+00	665	mcda_result object (665)	3		18	1
1284	2024-03-26 10:30:08.784329+00	664	mcda_result object (664)	3		18	1
1285	2024-03-26 10:30:08.786235+00	663	mcda_result object (663)	3		18	1
1286	2024-03-26 10:30:08.788395+00	662	mcda_result object (662)	3		18	1
1287	2024-03-26 10:30:08.791037+00	661	mcda_result object (661)	3		18	1
1288	2024-03-26 10:30:08.794568+00	660	mcda_result object (660)	3		18	1
1289	2024-03-26 10:30:08.797081+00	659	mcda_result object (659)	3		18	1
1290	2024-03-26 10:30:08.799665+00	658	mcda_result object (658)	3		18	1
1291	2024-03-26 10:30:08.802202+00	657	mcda_result object (657)	3		18	1
1292	2024-03-26 10:30:08.804973+00	656	mcda_result object (656)	3		18	1
1293	2024-03-26 10:30:08.809249+00	655	mcda_result object (655)	3		18	1
1294	2024-03-26 10:30:08.811813+00	654	mcda_result object (654)	3		18	1
1295	2024-03-26 10:30:08.81437+00	653	mcda_result object (653)	3		18	1
1296	2024-03-26 10:30:08.816588+00	652	mcda_result object (652)	3		18	1
1297	2024-03-26 10:30:08.818769+00	651	mcda_result object (651)	3		18	1
1298	2024-03-26 10:30:08.820835+00	650	mcda_result object (650)	3		18	1
1299	2024-03-26 10:30:08.823476+00	649	mcda_result object (649)	3		18	1
1300	2024-03-26 10:30:08.826354+00	648	mcda_result object (648)	3		18	1
1301	2024-03-26 10:30:08.828673+00	647	mcda_result object (647)	3		18	1
1302	2024-03-26 10:30:08.830904+00	646	mcda_result object (646)	3		18	1
1303	2024-03-26 10:30:08.832652+00	645	mcda_result object (645)	3		18	1
1304	2024-03-26 10:30:08.834701+00	644	mcda_result object (644)	3		18	1
1305	2024-03-26 10:30:08.836538+00	643	mcda_result object (643)	3		18	1
1306	2024-03-26 10:30:08.838683+00	642	mcda_result object (642)	3		18	1
1307	2024-03-26 10:30:08.842374+00	641	mcda_result object (641)	3		18	1
1308	2024-03-26 10:30:08.844955+00	640	mcda_result object (640)	3		18	1
1309	2024-03-26 10:30:08.847071+00	639	mcda_result object (639)	3		18	1
1310	2024-03-26 10:30:08.849176+00	638	mcda_result object (638)	3		18	1
1311	2024-03-26 10:30:08.851414+00	637	mcda_result object (637)	3		18	1
1312	2024-03-26 10:30:08.853697+00	636	mcda_result object (636)	3		18	1
1313	2024-03-26 10:30:08.855984+00	635	mcda_result object (635)	3		18	1
1314	2024-03-26 10:30:08.858533+00	634	mcda_result object (634)	3		18	1
1315	2024-03-26 10:30:08.860509+00	633	mcda_result object (633)	3		18	1
1316	2024-03-26 10:30:26.050472+00	632	mcda_result object (632)	3		18	1
1317	2024-03-26 10:30:26.05603+00	631	mcda_result object (631)	3		18	1
1318	2024-03-26 10:30:26.061931+00	630	mcda_result object (630)	3		18	1
1319	2024-03-26 10:30:26.065797+00	629	mcda_result object (629)	3		18	1
1320	2024-03-26 10:30:26.069961+00	628	mcda_result object (628)	3		18	1
1321	2024-03-26 10:30:26.074672+00	627	mcda_result object (627)	3		18	1
1322	2024-03-26 10:30:26.079635+00	626	mcda_result object (626)	3		18	1
1323	2024-03-26 10:30:26.08307+00	625	mcda_result object (625)	3		18	1
1324	2024-03-26 10:30:26.085109+00	624	mcda_result object (624)	3		18	1
1325	2024-03-26 10:30:26.086761+00	623	mcda_result object (623)	3		18	1
1326	2024-03-26 10:30:26.08914+00	622	mcda_result object (622)	3		18	1
1327	2024-03-26 10:30:26.09444+00	621	mcda_result object (621)	3		18	1
1328	2024-03-26 10:30:26.097516+00	620	mcda_result object (620)	3		18	1
1329	2024-03-26 10:30:26.100163+00	619	mcda_result object (619)	3		18	1
1330	2024-03-26 10:30:26.103557+00	618	mcda_result object (618)	3		18	1
1331	2024-03-26 10:30:26.106693+00	617	mcda_result object (617)	3		18	1
1332	2024-03-26 10:30:26.11163+00	616	mcda_result object (616)	3		18	1
1333	2024-03-26 10:30:26.1149+00	615	mcda_result object (615)	3		18	1
1334	2024-03-26 10:30:26.118087+00	614	mcda_result object (614)	3		18	1
1335	2024-03-26 10:30:26.120897+00	613	mcda_result object (613)	3		18	1
1336	2024-03-26 10:30:26.125379+00	612	mcda_result object (612)	3		18	1
1337	2024-03-26 10:30:26.128114+00	611	mcda_result object (611)	3		18	1
1338	2024-03-26 10:30:26.130888+00	610	mcda_result object (610)	3		18	1
1339	2024-03-26 10:30:26.133866+00	609	mcda_result object (609)	3		18	1
1340	2024-03-26 10:30:26.136976+00	608	mcda_result object (608)	3		18	1
1341	2024-03-26 10:30:26.141786+00	607	mcda_result object (607)	3		18	1
1342	2024-03-26 10:30:26.145634+00	606	mcda_result object (606)	3		18	1
1343	2024-03-26 10:30:26.148435+00	605	mcda_result object (605)	3		18	1
1344	2024-03-26 10:30:26.151814+00	604	mcda_result object (604)	3		18	1
1345	2024-03-26 10:30:26.154731+00	603	mcda_result object (603)	3		18	1
1346	2024-03-26 10:30:26.159026+00	602	mcda_result object (602)	3		18	1
1347	2024-03-26 10:30:26.162493+00	601	mcda_result object (601)	3		18	1
1348	2024-03-26 10:30:26.165992+00	600	mcda_result object (600)	3		18	1
1349	2024-03-26 10:30:26.169425+00	599	mcda_result object (599)	3		18	1
1350	2024-03-26 10:30:26.172219+00	598	mcda_result object (598)	3		18	1
1351	2024-03-26 10:30:26.175003+00	597	mcda_result object (597)	3		18	1
1352	2024-03-26 10:30:26.178202+00	596	mcda_result object (596)	3		18	1
1353	2024-03-26 10:30:26.18124+00	595	mcda_result object (595)	3		18	1
1354	2024-03-26 10:30:26.184178+00	594	mcda_result object (594)	3		18	1
1355	2024-03-26 10:30:26.187272+00	593	mcda_result object (593)	3		18	1
1356	2024-03-26 10:30:26.191973+00	592	mcda_result object (592)	3		18	1
1357	2024-03-26 10:30:26.195278+00	591	mcda_result object (591)	3		18	1
1358	2024-03-26 10:30:26.198807+00	590	mcda_result object (590)	3		18	1
1359	2024-03-26 10:30:26.202367+00	589	mcda_result object (589)	3		18	1
1360	2024-03-26 10:30:26.205612+00	588	mcda_result object (588)	3		18	1
1361	2024-03-26 10:30:26.209023+00	587	mcda_result object (587)	3		18	1
1362	2024-03-26 10:30:26.211985+00	586	mcda_result object (586)	3		18	1
1363	2024-03-26 10:30:26.214723+00	585	mcda_result object (585)	3		18	1
1364	2024-03-26 10:30:26.218529+00	584	mcda_result object (584)	3		18	1
1365	2024-03-26 10:30:26.222033+00	583	mcda_result object (583)	3		18	1
1366	2024-03-26 10:30:26.226788+00	582	mcda_result object (582)	3		18	1
1367	2024-03-26 10:30:26.229765+00	581	mcda_result object (581)	3		18	1
1368	2024-03-26 10:30:26.233339+00	580	mcda_result object (580)	3		18	1
1369	2024-03-26 10:30:26.237221+00	579	mcda_result object (579)	3		18	1
1370	2024-03-26 10:30:26.240635+00	578	mcda_result object (578)	3		18	1
1371	2024-03-26 10:30:26.243698+00	577	mcda_result object (577)	3		18	1
1372	2024-03-26 10:30:26.24626+00	576	mcda_result object (576)	3		18	1
1373	2024-03-26 10:30:26.249372+00	575	mcda_result object (575)	3		18	1
1374	2024-03-26 10:30:26.253442+00	574	mcda_result object (574)	3		18	1
1375	2024-03-26 10:30:26.257318+00	573	mcda_result object (573)	3		18	1
1376	2024-03-26 10:30:26.26203+00	572	mcda_result object (572)	3		18	1
1377	2024-03-26 10:30:26.265562+00	571	mcda_result object (571)	3		18	1
1378	2024-03-26 10:30:26.269242+00	570	mcda_result object (570)	3		18	1
1379	2024-03-26 10:30:26.27201+00	569	mcda_result object (569)	3		18	1
1380	2024-03-26 10:30:26.275374+00	568	mcda_result object (568)	3		18	1
1381	2024-03-26 10:30:26.278658+00	567	mcda_result object (567)	3		18	1
1382	2024-03-26 10:30:26.281936+00	566	mcda_result object (566)	3		18	1
1383	2024-03-26 10:30:26.285749+00	565	mcda_result object (565)	3		18	1
1384	2024-03-26 10:30:26.289661+00	564	mcda_result object (564)	3		18	1
1385	2024-03-26 10:30:26.293649+00	563	mcda_result object (563)	3		18	1
1386	2024-03-26 10:30:26.297608+00	562	mcda_result object (562)	3		18	1
1387	2024-03-26 10:30:26.30054+00	561	mcda_result object (561)	3		18	1
1388	2024-03-26 10:30:26.303898+00	560	mcda_result object (560)	3		18	1
1389	2024-03-26 10:30:26.307065+00	559	mcda_result object (559)	3		18	1
1390	2024-03-26 10:30:26.311227+00	558	mcda_result object (558)	3		18	1
1391	2024-03-26 10:30:26.314467+00	557	mcda_result object (557)	3		18	1
1392	2024-03-26 10:30:26.317874+00	556	mcda_result object (556)	3		18	1
1393	2024-03-26 10:30:26.321347+00	555	mcda_result object (555)	3		18	1
1394	2024-03-26 10:30:26.325583+00	554	mcda_result object (554)	3		18	1
1395	2024-03-26 10:30:26.329223+00	553	mcda_result object (553)	3		18	1
1396	2024-03-26 10:30:26.332852+00	552	mcda_result object (552)	3		18	1
1397	2024-03-26 10:30:26.336736+00	551	mcda_result object (551)	3		18	1
1398	2024-03-26 10:30:26.34061+00	550	mcda_result object (550)	3		18	1
1399	2024-03-26 10:30:26.344241+00	549	mcda_result object (549)	3		18	1
1400	2024-03-26 10:30:26.347602+00	548	mcda_result object (548)	3		18	1
1401	2024-03-26 10:30:26.350232+00	547	mcda_result object (547)	3		18	1
1402	2024-03-26 10:30:26.352709+00	546	mcda_result object (546)	3		18	1
1403	2024-03-26 10:30:26.355955+00	545	mcda_result object (545)	3		18	1
1404	2024-03-26 10:30:26.359399+00	544	mcda_result object (544)	3		18	1
1405	2024-03-26 10:30:26.362659+00	543	mcda_result object (543)	3		18	1
1406	2024-03-26 10:30:26.365799+00	542	mcda_result object (542)	3		18	1
1407	2024-03-26 10:30:26.368933+00	541	mcda_result object (541)	3		18	1
1408	2024-03-26 10:30:26.371858+00	540	mcda_result object (540)	3		18	1
1409	2024-03-26 10:30:26.375802+00	539	mcda_result object (539)	3		18	1
1410	2024-03-26 10:30:26.378978+00	538	mcda_result object (538)	3		18	1
1411	2024-03-26 10:30:26.382705+00	537	mcda_result object (537)	3		18	1
1412	2024-03-26 10:30:26.385745+00	536	mcda_result object (536)	3		18	1
1413	2024-03-26 10:30:26.388943+00	535	mcda_result object (535)	3		18	1
1414	2024-03-26 10:30:26.39368+00	534	mcda_result object (534)	3		18	1
1415	2024-03-26 10:30:26.397138+00	533	mcda_result object (533)	3		18	1
1416	2024-03-26 10:30:32.987635+00	532	mcda_result object (532)	3		18	1
1417	2024-03-26 10:30:32.9941+00	531	mcda_result object (531)	3		18	1
1418	2024-03-26 10:30:32.997157+00	530	mcda_result object (530)	3		18	1
1419	2024-03-26 10:30:32.999724+00	529	mcda_result object (529)	3		18	1
1420	2024-03-26 10:30:33.002753+00	528	mcda_result object (528)	3		18	1
1421	2024-03-26 10:30:33.005738+00	527	mcda_result object (527)	3		18	1
1422	2024-03-26 10:30:33.009327+00	526	mcda_result object (526)	3		18	1
1423	2024-03-26 10:30:33.011594+00	525	mcda_result object (525)	3		18	1
1424	2024-03-26 10:30:33.014183+00	524	mcda_result object (524)	3		18	1
1425	2024-03-26 10:30:33.017341+00	523	mcda_result object (523)	3		18	1
1426	2024-03-26 10:30:33.020118+00	522	mcda_result object (522)	3		18	1
1427	2024-03-26 10:30:33.022815+00	521	mcda_result object (521)	3		18	1
1428	2024-03-26 10:30:33.027445+00	520	mcda_result object (520)	3		18	1
1429	2024-03-26 10:30:33.030807+00	519	mcda_result object (519)	3		18	1
1430	2024-03-26 10:30:33.033959+00	518	mcda_result object (518)	3		18	1
1431	2024-03-26 10:30:33.03728+00	517	mcda_result object (517)	3		18	1
1432	2024-03-26 10:30:33.040588+00	516	mcda_result object (516)	3		18	1
1433	2024-03-26 10:30:33.044341+00	515	mcda_result object (515)	3		18	1
1434	2024-03-26 10:30:33.048508+00	514	mcda_result object (514)	3		18	1
1435	2024-03-26 10:30:33.052423+00	513	mcda_result object (513)	3		18	1
1436	2024-03-26 10:30:33.056226+00	512	mcda_result object (512)	3		18	1
1437	2024-03-26 10:30:33.061682+00	511	mcda_result object (511)	3		18	1
1438	2024-03-26 10:30:33.065977+00	510	mcda_result object (510)	3		18	1
1439	2024-03-26 10:30:33.07001+00	509	mcda_result object (509)	3		18	1
1440	2024-03-26 10:30:33.073521+00	508	mcda_result object (508)	3		18	1
1441	2024-03-26 10:30:33.079652+00	507	mcda_result object (507)	3		18	1
1442	2024-03-26 10:30:33.083323+00	506	mcda_result object (506)	3		18	1
1443	2024-03-26 10:30:33.086299+00	505	mcda_result object (505)	3		18	1
1444	2024-03-26 10:30:33.089259+00	504	mcda_result object (504)	3		18	1
1445	2024-03-26 10:30:33.09324+00	503	mcda_result object (503)	3		18	1
1446	2024-03-26 10:30:33.098395+00	502	mcda_result object (502)	3		18	1
1447	2024-03-26 10:30:33.101945+00	501	mcda_result object (501)	3		18	1
1448	2024-03-26 10:30:33.104836+00	500	mcda_result object (500)	3		18	1
1449	2024-03-26 10:30:33.10907+00	499	mcda_result object (499)	3		18	1
1450	2024-03-26 10:30:33.112594+00	498	mcda_result object (498)	3		18	1
1451	2024-03-26 10:30:33.115287+00	497	mcda_result object (497)	3		18	1
1452	2024-03-26 10:30:33.119141+00	496	mcda_result object (496)	3		18	1
1453	2024-03-26 10:30:33.122273+00	495	mcda_result object (495)	3		18	1
1454	2024-03-26 10:30:33.127319+00	494	mcda_result object (494)	3		18	1
1455	2024-03-26 10:30:33.131493+00	493	mcda_result object (493)	3		18	1
1456	2024-03-26 10:30:33.135101+00	492	mcda_result object (492)	3		18	1
1457	2024-03-26 10:30:33.137988+00	491	mcda_result object (491)	3		18	1
1458	2024-03-26 10:30:33.140355+00	490	mcda_result object (490)	3		18	1
1459	2024-03-26 10:30:33.144613+00	489	mcda_result object (489)	3		18	1
1460	2024-03-26 10:30:33.14721+00	488	mcda_result object (488)	3		18	1
1461	2024-03-26 10:30:33.150157+00	487	mcda_result object (487)	3		18	1
1462	2024-03-26 10:30:33.152886+00	486	mcda_result object (486)	3		18	1
1463	2024-03-26 10:30:33.155033+00	485	mcda_result object (485)	3		18	1
1464	2024-03-26 10:30:33.157484+00	484	mcda_result object (484)	3		18	1
1465	2024-03-26 10:30:33.163506+00	483	mcda_result object (483)	3		18	1
1466	2024-03-26 10:30:33.166592+00	482	mcda_result object (482)	3		18	1
1467	2024-03-26 10:30:33.17017+00	481	mcda_result object (481)	3		18	1
1468	2024-03-26 10:30:33.172855+00	480	mcda_result object (480)	3		18	1
1469	2024-03-26 10:30:33.17801+00	479	mcda_result object (479)	3		18	1
1470	2024-03-26 10:30:33.180706+00	478	mcda_result object (478)	3		18	1
1471	2024-03-26 10:30:33.183081+00	477	mcda_result object (477)	3		18	1
1472	2024-03-26 10:30:33.185991+00	476	mcda_result object (476)	3		18	1
1473	2024-03-26 10:30:33.188793+00	475	mcda_result object (475)	3		18	1
1474	2024-03-26 10:30:33.191327+00	474	mcda_result object (474)	3		18	1
1475	2024-03-26 10:30:33.196275+00	473	mcda_result object (473)	3		18	1
1476	2024-03-26 10:30:33.199626+00	472	mcda_result object (472)	3		18	1
1477	2024-03-26 10:30:33.202819+00	471	mcda_result object (471)	3		18	1
1478	2024-03-26 10:30:33.205321+00	470	mcda_result object (470)	3		18	1
1479	2024-03-26 10:30:33.208488+00	469	mcda_result object (469)	3		18	1
1480	2024-03-26 10:30:33.211859+00	468	mcda_result object (468)	3		18	1
1481	2024-03-26 10:30:33.215332+00	467	mcda_result object (467)	3		18	1
1482	2024-03-26 10:30:33.218575+00	466	mcda_result object (466)	3		18	1
1483	2024-03-26 10:30:33.221242+00	465	mcda_result object (465)	3		18	1
1484	2024-03-26 10:30:33.223303+00	464	mcda_result object (464)	3		18	1
1485	2024-03-26 10:30:33.225763+00	463	mcda_result object (463)	3		18	1
1486	2024-03-26 10:30:33.230092+00	462	mcda_result object (462)	3		18	1
1487	2024-03-26 10:30:33.233126+00	461	mcda_result object (461)	3		18	1
1488	2024-03-26 10:30:33.235995+00	460	mcda_result object (460)	3		18	1
1489	2024-03-26 10:30:33.238279+00	459	mcda_result object (459)	3		18	1
1490	2024-03-26 10:30:33.240942+00	458	mcda_result object (458)	3		18	1
1491	2024-03-26 10:30:33.244336+00	457	mcda_result object (457)	3		18	1
1492	2024-03-26 10:30:33.247315+00	456	mcda_result object (456)	3		18	1
1493	2024-03-26 10:30:33.249961+00	455	mcda_result object (455)	3		18	1
1494	2024-03-26 10:30:33.252366+00	454	mcda_result object (454)	3		18	1
1495	2024-03-26 10:30:33.254778+00	453	mcda_result object (453)	3		18	1
1496	2024-03-26 10:30:33.257699+00	452	mcda_result object (452)	3		18	1
1497	2024-03-26 10:30:33.260973+00	451	mcda_result object (451)	3		18	1
1498	2024-03-26 10:30:33.264024+00	450	mcda_result object (450)	3		18	1
1499	2024-03-26 10:30:33.267993+00	449	mcda_result object (449)	3		18	1
1500	2024-03-26 10:30:33.270595+00	448	mcda_result object (448)	3		18	1
1501	2024-03-26 10:30:33.274025+00	447	mcda_result object (447)	3		18	1
1502	2024-03-26 10:30:33.276803+00	446	mcda_result object (446)	3		18	1
1503	2024-03-26 10:30:33.279806+00	445	mcda_result object (445)	3		18	1
1504	2024-03-26 10:30:33.281791+00	444	mcda_result object (444)	3		18	1
1505	2024-03-26 10:30:33.283793+00	443	mcda_result object (443)	3		18	1
1506	2024-03-26 10:30:33.285433+00	442	mcda_result object (442)	3		18	1
1507	2024-03-26 10:30:33.287249+00	441	mcda_result object (441)	3		18	1
1508	2024-03-26 10:30:33.289901+00	440	mcda_result object (440)	3		18	1
1509	2024-03-26 10:30:33.293657+00	439	mcda_result object (439)	3		18	1
1510	2024-03-26 10:30:33.295838+00	438	mcda_result object (438)	3		18	1
1511	2024-03-26 10:30:33.297529+00	437	mcda_result object (437)	3		18	1
1512	2024-03-26 10:30:33.29938+00	436	mcda_result object (436)	3		18	1
1513	2024-03-26 10:30:33.301145+00	435	mcda_result object (435)	3		18	1
1514	2024-03-26 10:30:33.303266+00	434	mcda_result object (434)	3		18	1
1515	2024-03-26 10:30:33.305034+00	433	mcda_result object (433)	3		18	1
1516	2024-03-26 10:31:18.318367+00	432	mcda_result object (432)	3		18	1
1517	2024-03-26 10:31:18.32412+00	431	mcda_result object (431)	3		18	1
1518	2024-03-26 10:31:18.326689+00	430	mcda_result object (430)	3		18	1
1519	2024-03-26 10:31:18.328999+00	429	mcda_result object (429)	3		18	1
1520	2024-03-26 10:31:18.332241+00	428	mcda_result object (428)	3		18	1
1521	2024-03-26 10:31:18.337221+00	427	mcda_result object (427)	3		18	1
1522	2024-03-26 10:31:18.34091+00	426	mcda_result object (426)	3		18	1
1523	2024-03-26 10:31:18.346496+00	425	mcda_result object (425)	3		18	1
1524	2024-03-26 10:31:18.352483+00	424	mcda_result object (424)	3		18	1
1525	2024-03-26 10:31:18.356242+00	423	mcda_result object (423)	3		18	1
1526	2024-03-26 10:31:18.359533+00	422	mcda_result object (422)	3		18	1
1527	2024-03-26 10:31:18.362455+00	421	mcda_result object (421)	3		18	1
1528	2024-03-26 10:31:18.366836+00	420	mcda_result object (420)	3		18	1
1529	2024-03-26 10:31:18.371111+00	419	mcda_result object (419)	3		18	1
1530	2024-03-26 10:31:18.374081+00	418	mcda_result object (418)	3		18	1
1531	2024-03-26 10:31:18.377956+00	417	mcda_result object (417)	3		18	1
1532	2024-03-26 10:31:18.381694+00	416	mcda_result object (416)	3		18	1
1533	2024-03-26 10:31:18.385803+00	415	mcda_result object (415)	3		18	1
1534	2024-03-26 10:31:18.388987+00	411	mcda_result object (411)	3		18	1
1535	2024-03-26 10:31:18.391638+00	410	mcda_result object (410)	3		18	1
1536	2024-03-26 10:31:18.394571+00	409	mcda_result object (409)	3		18	1
1537	2024-03-26 10:31:18.397574+00	408	mcda_result object (408)	3		18	1
1538	2024-03-26 10:31:18.40219+00	407	mcda_result object (407)	3		18	1
1539	2024-03-26 10:31:18.40538+00	406	mcda_result object (406)	3		18	1
1540	2024-03-26 10:31:18.409198+00	405	mcda_result object (405)	3		18	1
1541	2024-03-26 10:31:18.412197+00	404	mcda_result object (404)	3		18	1
1542	2024-03-26 10:31:18.41756+00	403	mcda_result object (403)	3		18	1
1543	2024-03-26 10:31:18.420644+00	396	mcda_result object (396)	3		18	1
1544	2024-03-26 10:31:18.424442+00	395	mcda_result object (395)	3		18	1
1545	2024-03-26 10:31:18.428485+00	394	mcda_result object (394)	3		18	1
1546	2024-03-26 10:31:18.434137+00	393	mcda_result object (393)	3		18	1
1547	2024-03-26 10:31:18.438581+00	392	mcda_result object (392)	3		18	1
1548	2024-03-26 10:31:18.443362+00	391	mcda_result object (391)	3		18	1
1549	2024-03-26 10:31:18.447955+00	390	mcda_result object (390)	3		18	1
1550	2024-03-26 10:31:18.45243+00	389	mcda_result object (389)	3		18	1
1551	2024-03-26 10:31:18.455781+00	388	mcda_result object (388)	3		18	1
1552	2024-03-26 10:31:18.459734+00	387	mcda_result object (387)	3		18	1
1553	2024-03-26 10:31:18.463859+00	386	mcda_result object (386)	3		18	1
1554	2024-03-26 10:31:18.46779+00	385	mcda_result object (385)	3		18	1
1555	2024-03-26 10:31:18.471731+00	384	mcda_result object (384)	3		18	1
1556	2024-03-26 10:31:18.475005+00	383	mcda_result object (383)	3		18	1
1557	2024-03-26 10:31:18.478673+00	382	mcda_result object (382)	3		18	1
1558	2024-03-26 10:31:18.483589+00	381	mcda_result object (381)	3		18	1
1559	2024-03-26 10:31:18.487027+00	380	mcda_result object (380)	3		18	1
1560	2024-03-26 10:31:18.490529+00	379	mcda_result object (379)	3		18	1
1561	2024-03-26 10:31:18.493705+00	378	mcda_result object (378)	3		18	1
1562	2024-03-26 10:31:18.496634+00	377	mcda_result object (377)	3		18	1
1563	2024-03-26 10:31:18.500113+00	376	mcda_result object (376)	3		18	1
1564	2024-03-26 10:31:18.503052+00	375	mcda_result object (375)	3		18	1
1565	2024-03-26 10:31:18.506275+00	374	mcda_result object (374)	3		18	1
1566	2024-03-26 10:31:18.509172+00	373	mcda_result object (373)	3		18	1
1567	2024-03-26 10:31:18.512312+00	372	mcda_result object (372)	3		18	1
1568	2024-03-26 10:31:18.517398+00	371	mcda_result object (371)	3		18	1
1569	2024-03-26 10:31:18.520024+00	370	mcda_result object (370)	3		18	1
1570	2024-03-26 10:31:18.522422+00	369	mcda_result object (369)	3		18	1
1571	2024-03-26 10:31:18.525312+00	368	mcda_result object (368)	3		18	1
1572	2024-03-26 10:31:18.527788+00	367	mcda_result object (367)	3		18	1
1573	2024-03-26 10:31:18.531333+00	366	mcda_result object (366)	3		18	1
1574	2024-03-26 10:31:18.53403+00	365	mcda_result object (365)	3		18	1
1575	2024-03-26 10:31:18.536727+00	364	mcda_result object (364)	3		18	1
1576	2024-03-26 10:31:18.538985+00	363	mcda_result object (363)	3		18	1
1577	2024-03-26 10:31:18.541548+00	362	mcda_result object (362)	3		18	1
1578	2024-03-26 10:31:18.543982+00	361	mcda_result object (361)	3		18	1
1579	2024-03-26 10:31:18.547551+00	360	mcda_result object (360)	3		18	1
1580	2024-03-26 10:31:18.551284+00	359	mcda_result object (359)	3		18	1
1581	2024-03-26 10:31:18.553793+00	358	mcda_result object (358)	3		18	1
1582	2024-03-26 10:31:18.556123+00	357	mcda_result object (357)	3		18	1
1583	2024-03-26 10:31:18.558409+00	356	mcda_result object (356)	3		18	1
1584	2024-03-26 10:31:18.561181+00	355	mcda_result object (355)	3		18	1
1585	2024-03-26 10:31:18.564286+00	354	mcda_result object (354)	3		18	1
1586	2024-03-26 10:31:18.567167+00	353	mcda_result object (353)	3		18	1
1587	2024-03-26 10:31:18.570395+00	352	mcda_result object (352)	3		18	1
1588	2024-03-26 10:31:18.572921+00	351	mcda_result object (351)	3		18	1
1589	2024-03-26 10:31:18.575878+00	350	mcda_result object (350)	3		18	1
1590	2024-03-26 10:31:18.578626+00	349	mcda_result object (349)	3		18	1
1591	2024-03-26 10:31:18.582955+00	348	mcda_result object (348)	3		18	1
1592	2024-03-26 10:31:18.585901+00	347	mcda_result object (347)	3		18	1
1593	2024-03-26 10:31:18.588442+00	346	mcda_result object (346)	3		18	1
1594	2024-03-26 10:31:18.590698+00	345	mcda_result object (345)	3		18	1
1595	2024-03-26 10:31:18.593034+00	344	mcda_result object (344)	3		18	1
1596	2024-03-26 10:31:18.595574+00	343	mcda_result object (343)	3		18	1
1597	2024-03-26 10:31:18.597772+00	342	mcda_result object (342)	3		18	1
1598	2024-03-26 10:31:18.599076+00	341	mcda_result object (341)	3		18	1
1599	2024-03-26 10:31:18.600332+00	340	mcda_result object (340)	3		18	1
1600	2024-03-26 10:31:18.601646+00	339	mcda_result object (339)	3		18	1
1601	2024-03-26 10:31:18.603049+00	338	mcda_result object (338)	3		18	1
1602	2024-03-26 10:31:18.604258+00	337	mcda_result object (337)	3		18	1
1603	2024-03-26 10:31:18.605569+00	336	mcda_result object (336)	3		18	1
1604	2024-03-26 10:31:18.607211+00	335	mcda_result object (335)	3		18	1
1605	2024-03-26 10:31:18.608606+00	334	mcda_result object (334)	3		18	1
1606	2024-03-26 10:31:18.610095+00	333	mcda_result object (333)	3		18	1
1607	2024-03-26 10:31:40.903705+00	332	mcda_result object (332)	3		18	1
1608	2024-03-26 10:31:40.909747+00	331	mcda_result object (331)	3		18	1
1609	2024-03-26 10:31:40.912993+00	330	mcda_result object (330)	3		18	1
1610	2024-03-26 10:31:40.915797+00	329	mcda_result object (329)	3		18	1
1611	2024-03-26 10:31:40.918658+00	328	mcda_result object (328)	3		18	1
1612	2024-03-26 10:31:40.92421+00	327	mcda_result object (327)	3		18	1
1613	2024-03-26 10:31:40.927982+00	326	mcda_result object (326)	3		18	1
1614	2024-03-26 10:31:40.931354+00	325	mcda_result object (325)	3		18	1
1615	2024-03-26 10:31:40.93382+00	324	mcda_result object (324)	3		18	1
1616	2024-03-26 10:31:40.937164+00	323	mcda_result object (323)	3		18	1
1617	2024-03-26 10:31:40.941629+00	322	mcda_result object (322)	3		18	1
1618	2024-03-26 10:31:40.945935+00	321	mcda_result object (321)	3		18	1
1619	2024-03-26 10:31:40.94949+00	320	mcda_result object (320)	3		18	1
1620	2024-03-26 10:31:40.954609+00	319	mcda_result object (319)	3		18	1
1621	2024-03-26 10:31:40.961218+00	318	mcda_result object (318)	3		18	1
1622	2024-03-26 10:31:40.964091+00	317	mcda_result object (317)	3		18	1
1623	2024-03-26 10:31:40.967192+00	316	mcda_result object (316)	3		18	1
1624	2024-03-26 10:31:40.972456+00	315	mcda_result object (315)	3		18	1
1625	2024-03-26 10:31:40.976323+00	314	mcda_result object (314)	3		18	1
1626	2024-03-26 10:31:40.978552+00	313	mcda_result object (313)	3		18	1
1627	2024-03-26 10:31:40.98207+00	312	mcda_result object (312)	3		18	1
1628	2024-03-26 10:31:40.98582+00	311	mcda_result object (311)	3		18	1
1629	2024-03-26 10:31:40.990703+00	310	mcda_result object (310)	3		18	1
1630	2024-03-26 10:31:40.993986+00	309	mcda_result object (309)	3		18	1
1631	2024-03-26 10:31:40.996586+00	308	mcda_result object (308)	3		18	1
1632	2024-03-26 10:31:41.000298+00	307	mcda_result object (307)	3		18	1
1633	2024-03-26 10:31:41.0054+00	306	mcda_result object (306)	3		18	1
1634	2024-03-26 10:31:41.009608+00	305	mcda_result object (305)	3		18	1
1635	2024-03-26 10:31:41.013442+00	304	mcda_result object (304)	3		18	1
1636	2024-03-26 10:31:41.017066+00	303	mcda_result object (303)	3		18	1
1637	2024-03-26 10:31:41.022855+00	302	mcda_result object (302)	3		18	1
1638	2024-03-26 10:31:41.026268+00	301	mcda_result object (301)	3		18	1
1639	2024-03-26 10:31:41.0296+00	300	mcda_result object (300)	3		18	1
1640	2024-03-26 10:31:41.0325+00	299	mcda_result object (299)	3		18	1
1641	2024-03-26 10:31:41.035027+00	298	mcda_result object (298)	3		18	1
1642	2024-03-26 10:31:41.039554+00	297	mcda_result object (297)	3		18	1
1643	2024-03-26 10:31:41.042424+00	296	mcda_result object (296)	3		18	1
1644	2024-03-26 10:31:41.04457+00	295	mcda_result object (295)	3		18	1
1645	2024-03-26 10:31:41.046602+00	294	mcda_result object (294)	3		18	1
1646	2024-03-26 10:31:41.048486+00	293	mcda_result object (293)	3		18	1
1647	2024-03-26 10:31:41.050028+00	292	mcda_result object (292)	3		18	1
1648	2024-03-26 10:31:41.053299+00	291	mcda_result object (291)	3		18	1
1649	2024-03-26 10:31:41.055011+00	290	mcda_result object (290)	3		18	1
1650	2024-03-26 10:31:41.056503+00	289	mcda_result object (289)	3		18	1
1651	2024-03-26 10:31:41.05777+00	288	mcda_result object (288)	3		18	1
1652	2024-03-26 10:31:41.059133+00	287	mcda_result object (287)	3		18	1
1653	2024-03-26 10:31:41.060385+00	286	mcda_result object (286)	3		18	1
1654	2024-03-26 10:31:41.061645+00	285	mcda_result object (285)	3		18	1
1655	2024-03-26 10:31:41.062983+00	284	mcda_result object (284)	3		18	1
1656	2024-03-26 10:31:41.064239+00	283	mcda_result object (283)	3		18	1
1657	2024-03-26 10:31:41.06564+00	282	mcda_result object (282)	3		18	1
1658	2024-03-26 10:31:41.066823+00	281	mcda_result object (281)	3		18	1
1659	2024-03-26 10:31:41.069271+00	280	mcda_result object (280)	3		18	1
1660	2024-03-26 10:31:41.070599+00	279	mcda_result object (279)	3		18	1
1661	2024-03-26 10:31:41.071796+00	278	mcda_result object (278)	3		18	1
1662	2024-03-26 10:31:41.073059+00	277	mcda_result object (277)	3		18	1
1663	2024-03-26 10:31:41.074338+00	276	mcda_result object (276)	3		18	1
1664	2024-03-26 10:31:41.075662+00	275	mcda_result object (275)	3		18	1
1665	2024-03-26 10:31:41.077189+00	274	mcda_result object (274)	3		18	1
1666	2024-03-26 10:31:41.078748+00	273	mcda_result object (273)	3		18	1
1667	2024-03-26 10:31:41.0803+00	272	mcda_result object (272)	3		18	1
1668	2024-03-26 10:31:41.081831+00	271	mcda_result object (271)	3		18	1
1669	2024-03-26 10:31:41.083658+00	270	mcda_result object (270)	3		18	1
1670	2024-03-26 10:31:41.086732+00	269	mcda_result object (269)	3		18	1
1671	2024-03-26 10:31:41.088287+00	268	mcda_result object (268)	3		18	1
1672	2024-03-26 10:31:41.089838+00	267	mcda_result object (267)	3		18	1
1673	2024-03-26 10:31:41.091093+00	266	mcda_result object (266)	3		18	1
1674	2024-03-26 10:31:41.092352+00	265	mcda_result object (265)	3		18	1
1675	2024-03-26 10:31:41.093624+00	264	mcda_result object (264)	3		18	1
1676	2024-03-26 10:31:41.094915+00	263	mcda_result object (263)	3		18	1
1677	2024-03-26 10:31:41.096121+00	262	mcda_result object (262)	3		18	1
1678	2024-03-26 10:31:41.097412+00	261	mcda_result object (261)	3		18	1
1679	2024-03-26 10:31:41.098591+00	260	mcda_result object (260)	3		18	1
1680	2024-03-26 10:31:41.099874+00	259	mcda_result object (259)	3		18	1
1681	2024-03-26 10:31:41.10251+00	258	mcda_result object (258)	3		18	1
1682	2024-03-26 10:31:41.104023+00	257	mcda_result object (257)	3		18	1
1683	2024-03-26 10:31:41.10533+00	256	mcda_result object (256)	3		18	1
1684	2024-03-26 10:31:41.106572+00	255	mcda_result object (255)	3		18	1
1685	2024-03-26 10:31:41.107777+00	254	mcda_result object (254)	3		18	1
1686	2024-03-26 10:31:41.109258+00	253	mcda_result object (253)	3		18	1
1687	2024-03-26 10:31:41.110513+00	252	mcda_result object (252)	3		18	1
1688	2024-03-26 10:31:41.111778+00	251	mcda_result object (251)	3		18	1
1689	2024-03-26 10:31:41.113037+00	250	mcda_result object (250)	3		18	1
1690	2024-03-26 10:31:41.114429+00	249	mcda_result object (249)	3		18	1
1691	2024-03-26 10:31:41.115673+00	248	mcda_result object (248)	3		18	1
1692	2024-03-26 10:31:41.11711+00	247	mcda_result object (247)	3		18	1
1693	2024-03-26 10:31:41.118479+00	246	mcda_result object (246)	3		18	1
1694	2024-03-26 10:31:41.119824+00	245	mcda_result object (245)	3		18	1
1695	2024-03-26 10:31:41.121108+00	244	mcda_result object (244)	3		18	1
1696	2024-03-26 10:31:41.122436+00	243	mcda_result object (243)	3		18	1
1697	2024-03-26 10:31:41.123705+00	242	mcda_result object (242)	3		18	1
1698	2024-03-26 10:32:00.429909+00	241	mcda_result object (241)	3		18	1
1699	2024-03-26 10:32:00.436542+00	240	mcda_result object (240)	3		18	1
1700	2024-03-26 10:32:00.44153+00	239	mcda_result object (239)	3		18	1
1701	2024-03-26 10:32:00.445685+00	238	mcda_result object (238)	3		18	1
1702	2024-03-26 10:32:00.448632+00	237	mcda_result object (237)	3		18	1
1703	2024-03-26 10:32:00.452698+00	236	mcda_result object (236)	3		18	1
1704	2024-03-26 10:32:00.45689+00	235	mcda_result object (235)	3		18	1
1705	2024-03-26 10:32:00.463196+00	234	mcda_result object (234)	3		18	1
1706	2024-03-26 10:32:00.466945+00	233	mcda_result object (233)	3		18	1
1707	2024-03-26 10:32:00.469882+00	232	mcda_result object (232)	3		18	1
1708	2024-03-26 10:32:00.473868+00	231	mcda_result object (231)	3		18	1
1709	2024-03-26 10:32:00.477133+00	230	mcda_result object (230)	3		18	1
1710	2024-03-26 10:32:00.480474+00	229	mcda_result object (229)	3		18	1
1711	2024-03-26 10:32:00.484003+00	228	mcda_result object (228)	3		18	1
1712	2024-03-26 10:32:00.48646+00	227	mcda_result object (227)	3		18	1
1713	2024-03-26 10:32:00.490942+00	226	mcda_result object (226)	3		18	1
1714	2024-03-26 10:32:00.49396+00	225	mcda_result object (225)	3		18	1
1715	2024-03-26 10:32:00.4966+00	224	mcda_result object (224)	3		18	1
1716	2024-03-26 10:33:26.398219+00	774	mcda_result object (774)	3		18	1
1717	2024-03-26 10:33:26.402609+00	773	mcda_result object (773)	3		18	1
1718	2024-03-26 10:33:26.406035+00	772	mcda_result object (772)	3		18	1
1719	2024-03-26 10:33:26.411383+00	771	mcda_result object (771)	3		18	1
1720	2024-03-26 10:33:26.413257+00	770	mcda_result object (770)	3		18	1
1721	2024-03-26 10:33:26.414937+00	769	mcda_result object (769)	3		18	1
1722	2024-03-26 10:33:26.416251+00	768	mcda_result object (768)	3		18	1
1723	2024-03-26 10:33:26.41761+00	767	mcda_result object (767)	3		18	1
1724	2024-03-26 10:33:26.419906+00	766	mcda_result object (766)	3		18	1
1725	2024-03-26 10:33:26.422589+00	765	mcda_result object (765)	3		18	1
1726	2024-03-26 10:33:26.423872+00	764	mcda_result object (764)	3		18	1
1727	2024-03-26 10:33:26.425139+00	763	mcda_result object (763)	3		18	1
1728	2024-03-26 10:33:26.426399+00	762	mcda_result object (762)	3		18	1
1729	2024-03-26 10:33:26.427691+00	761	mcda_result object (761)	3		18	1
1730	2024-03-26 10:33:26.429026+00	760	mcda_result object (760)	3		18	1
1731	2024-03-26 10:33:26.430301+00	759	mcda_result object (759)	3		18	1
1732	2024-03-26 10:33:26.431488+00	758	mcda_result object (758)	3		18	1
1733	2024-03-26 10:33:26.432858+00	757	mcda_result object (757)	3		18	1
1734	2024-03-26 10:33:26.434145+00	756	mcda_result object (756)	3		18	1
1735	2024-03-26 10:33:26.436258+00	755	mcda_result object (755)	3		18	1
1736	2024-03-26 10:33:26.438894+00	754	mcda_result object (754)	3		18	1
1737	2024-03-26 10:33:26.44023+00	753	mcda_result object (753)	3		18	1
1738	2024-03-26 10:33:26.441506+00	752	mcda_result object (752)	3		18	1
1739	2024-03-26 10:33:26.44278+00	751	mcda_result object (751)	3		18	1
1740	2024-03-26 10:33:26.443998+00	750	mcda_result object (750)	3		18	1
1741	2024-03-26 10:33:26.445328+00	749	mcda_result object (749)	3		18	1
1742	2024-03-26 10:33:26.446759+00	748	mcda_result object (748)	3		18	1
1743	2024-03-26 10:33:26.448047+00	747	mcda_result object (747)	3		18	1
1744	2024-03-26 10:33:26.449296+00	746	mcda_result object (746)	3		18	1
1745	2024-03-26 10:33:26.450727+00	745	mcda_result object (745)	3		18	1
1746	2024-03-26 10:33:26.452261+00	744	mcda_result object (744)	3		18	1
1747	2024-03-26 10:33:26.453462+00	743	mcda_result object (743)	3		18	1
1748	2024-03-26 10:33:26.454782+00	742	mcda_result object (742)	3		18	1
1749	2024-03-26 10:33:26.456052+00	741	mcda_result object (741)	3		18	1
1750	2024-03-26 10:33:26.457378+00	740	mcda_result object (740)	3		18	1
1751	2024-03-26 10:33:26.458412+00	739	mcda_result object (739)	3		18	1
1752	2024-03-26 10:33:26.459798+00	738	mcda_result object (738)	3		18	1
1753	2024-03-26 10:33:26.46137+00	737	mcda_result object (737)	3		18	1
1754	2024-03-26 10:33:26.462999+00	736	mcda_result object (736)	3		18	1
1755	2024-03-26 10:33:26.464361+00	735	mcda_result object (735)	3		18	1
1756	2024-03-26 10:33:26.465966+00	734	mcda_result object (734)	3		18	1
1757	2024-03-26 10:33:26.467694+00	733	mcda_result object (733)	3		18	1
1758	2024-03-26 10:38:24.739538+00	444	criteria_params object (444)	3		9	1
1759	2024-03-26 10:38:24.744177+00	443	criteria_params object (443)	3		9	1
1760	2024-03-26 10:38:24.749469+00	442	criteria_params object (442)	3		9	1
1761	2024-03-26 10:38:24.752286+00	441	criteria_params object (441)	3		9	1
1762	2024-03-26 17:04:15.595902+00	4	satisfaction_threshold object (4)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
1763	2024-03-26 17:04:15.603681+00	3	satisfaction_threshold object (3)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
1764	2024-03-26 17:04:15.610064+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
1765	2024-04-16 13:31:44.253877+00	21	test	1	[{"added": {}}]	8	1
1798	2024-04-16 13:46:04.083014+00	2	Amphibian species	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure"]}}]	8	1
1799	2024-04-16 13:46:58.458403+00	2	Amphibian species	2	[{"changed": {"fields": ["Unit of Measure [fr]"]}}]	8	1
1800	2024-04-16 13:47:10.873548+00	21	test	3		8	1
1801	2024-04-16 14:43:50.123975+00	12	Aquatic plant species	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1802	2024-04-16 14:44:09.464385+00	14	Dragonflies	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1803	2024-04-16 14:44:56.767493+00	15	Macroinvertebrates	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1804	2024-04-16 14:45:21.793609+00	16	Total biodiversity	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1805	2024-04-16 14:46:48.72508+00	17	Capacity of Carbon storage	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1806	2024-04-16 14:47:18.023939+00	18	GHG emission (CH4, CO2, N2O)	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1807	2024-04-16 14:47:58.007019+00	19	Water quantity	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1808	2024-04-16 14:48:56.187324+00	20	Water quality	2	[{"changed": {"fields": ["Criteria Name [fr]", "Unit of Measure", "Unit of Measure [en]", "Unit of Measure [fr]"]}}]	8	1
1809	2024-04-16 16:19:36.369244+00	20	Water quality	2	[{"changed": {"fields": ["Unit of Measure [fr]"]}}]	8	1
1810	2024-04-16 20:07:03.464983+00	11	Land Use: No Change, Climate Change: No Change	2	[{"changed": {"fields": ["Description"]}}]	15	1
1811	2024-04-16 21:15:11.140382+00	11	Land Use: No Change, Climate Change: No Change	2	[{"changed": {"fields": ["Description"]}}]	15	1
1812	2024-04-16 21:16:25.409138+00	10	Land Use: No Change, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
1813	2024-04-16 21:18:58.230585+00	9	Land Use: No Change, Climate Change: SSP3	2	[{"changed": {"fields": ["Description"]}}]	15	1
1814	2024-04-16 21:19:13.876879+00	10	Land Use: No Change, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
1815	2024-04-16 21:19:35.576903+00	8	Land Use: No Change, Climate Change: SSP1	2	[{"changed": {"fields": ["Description"]}}]	15	1
1816	2024-04-16 21:19:59.490399+00	7	Land Use: SSP5, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
1817	2024-04-16 21:20:12.380863+00	6	Land Use: SSP3, Climate Change: SSP3	2	[{"changed": {"fields": ["Description"]}}]	15	1
1818	2024-04-16 21:20:21.890918+00	7	Land Use: SSP5, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
1819	2024-04-16 21:20:35.01886+00	5	Land Use: SSP1, Climate Change: SSP1	2	[{"changed": {"fields": ["Description"]}}]	15	1
1820	2024-04-16 21:20:42.270587+00	10	Land Use: No Change, Climate Change: SSP5	2	[]	15	1
1821	2024-04-16 21:20:50.522621+00	9	Land Use: No Change, Climate Change: SSP3	2	[{"changed": {"fields": ["Description"]}}]	15	1
1822	2024-04-17 12:52:41.85489+00	547	modeling_result object (547)	1	[{"added": {}}]	17	1
1823	2024-04-17 13:13:57.967494+00	554	modeling_result object (554)	3		17	1
1824	2024-04-17 13:15:42.92794+00	553	modeling_result object (553)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1825	2024-04-17 13:15:42.933759+00	552	modeling_result object (552)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1826	2024-04-17 13:15:42.940705+00	551	modeling_result object (551)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1827	2024-04-17 13:15:42.951148+00	550	modeling_result object (550)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1828	2024-04-17 13:15:42.956258+00	549	modeling_result object (549)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1829	2024-04-17 13:15:42.967133+00	548	modeling_result object (548)	2	[{"changed": {"fields": ["Scenario", "Modeling output"]}}]	17	1
1830	2024-04-17 13:23:43.782433+00	561	modeling_result object (561)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1831	2024-04-17 13:23:43.797873+00	560	modeling_result object (560)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1832	2024-04-17 13:23:43.809193+00	559	modeling_result object (559)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1833	2024-04-17 13:23:43.814599+00	558	modeling_result object (558)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1834	2024-04-17 13:23:43.826078+00	557	modeling_result object (557)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1835	2024-04-17 13:23:43.836985+00	556	modeling_result object (556)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1836	2024-04-17 13:23:43.851569+00	555	modeling_result object (555)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1837	2024-04-17 13:24:14.122071+00	561	modeling_result object (561)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1838	2024-04-17 13:24:14.128698+00	560	modeling_result object (560)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1839	2024-04-17 13:24:14.132489+00	559	modeling_result object (559)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1840	2024-04-17 13:24:14.139971+00	558	modeling_result object (558)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1841	2024-04-17 13:24:14.144213+00	557	modeling_result object (557)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1842	2024-04-17 13:24:14.148452+00	556	modeling_result object (556)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1843	2024-04-17 13:24:14.15231+00	555	modeling_result object (555)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1844	2024-04-17 13:25:01.487797+00	568	modeling_result object (568)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1845	2024-04-17 13:25:01.495548+00	567	modeling_result object (567)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1846	2024-04-17 13:25:01.502001+00	566	modeling_result object (566)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1847	2024-04-17 13:25:01.506283+00	565	modeling_result object (565)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1848	2024-04-17 13:25:01.510994+00	564	modeling_result object (564)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1849	2024-04-17 13:25:01.515643+00	563	modeling_result object (563)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1850	2024-04-17 13:25:01.522077+00	562	modeling_result object (562)	2	[{"changed": {"fields": ["Number of ponds"]}}]	17	1
1851	2024-04-17 13:26:21.611915+00	568	modeling_result object (568)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1852	2024-04-17 13:26:21.617852+00	567	modeling_result object (567)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1853	2024-04-17 13:26:21.627504+00	566	modeling_result object (566)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1854	2024-04-17 13:26:21.632088+00	565	modeling_result object (565)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1855	2024-04-17 13:26:21.636545+00	564	modeling_result object (564)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1856	2024-04-17 13:26:21.649157+00	563	modeling_result object (563)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1857	2024-04-17 13:26:21.656561+00	562	modeling_result object (562)	2	[{"changed": {"fields": ["Modeling output"]}}]	17	1
1858	2024-04-17 13:28:12.53886+00	575	modeling_result object (575)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1859	2024-04-17 13:28:12.553933+00	574	modeling_result object (574)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1860	2024-04-17 13:28:12.564236+00	573	modeling_result object (573)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1861	2024-04-17 13:28:12.568419+00	572	modeling_result object (572)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1862	2024-04-17 13:28:12.572276+00	571	modeling_result object (571)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1863	2024-04-17 13:28:12.578825+00	570	modeling_result object (570)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1864	2024-04-17 13:28:12.587026+00	569	modeling_result object (569)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1865	2024-04-17 13:29:17.21581+00	5	satisfaction_threshold object (5)	1	[{"added": {}}]	10	1
1866	2024-04-17 14:45:14.917154+00	2	satisfaction_threshold object (2)	2	[{"changed": {"fields": ["Maximum satisfaction threshold"]}}]	10	1
1867	2024-04-17 14:51:44.916642+00	582	modeling_result object (582)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1868	2024-04-17 14:51:44.922486+00	581	modeling_result object (581)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1869	2024-04-17 14:51:44.931246+00	580	modeling_result object (580)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1870	2024-04-17 14:51:44.938571+00	579	modeling_result object (579)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1871	2024-04-17 14:51:44.943883+00	578	modeling_result object (578)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1872	2024-04-17 14:51:44.954204+00	577	modeling_result object (577)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1873	2024-04-17 14:51:44.958908+00	576	modeling_result object (576)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1874	2024-04-17 15:19:13.674057+00	589	modeling_result object (589)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1875	2024-04-17 15:19:13.680458+00	588	modeling_result object (588)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1876	2024-04-17 15:19:13.686624+00	587	modeling_result object (587)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1877	2024-04-17 15:19:13.690993+00	586	modeling_result object (586)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1878	2024-04-17 15:19:13.695541+00	585	modeling_result object (585)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1879	2024-04-17 15:19:13.704158+00	584	modeling_result object (584)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1880	2024-04-17 15:19:13.710343+00	583	modeling_result object (583)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1881	2024-04-17 15:21:49.180161+00	596	modeling_result object (596)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1882	2024-04-17 15:21:49.191866+00	595	modeling_result object (595)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1883	2024-04-17 15:21:49.196509+00	594	modeling_result object (594)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1884	2024-04-17 15:21:49.202696+00	593	modeling_result object (593)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1885	2024-04-17 15:21:49.208057+00	592	modeling_result object (592)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1886	2024-04-17 15:21:49.212695+00	591	modeling_result object (591)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1887	2024-04-17 15:21:49.218254+00	590	modeling_result object (590)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1888	2024-04-17 15:25:50.650153+00	603	modeling_result object (603)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1889	2024-04-17 15:25:50.660732+00	602	modeling_result object (602)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1890	2024-04-17 15:25:50.664717+00	601	modeling_result object (601)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1891	2024-04-17 15:25:50.670002+00	600	modeling_result object (600)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1892	2024-04-17 15:25:50.677048+00	599	modeling_result object (599)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1893	2024-04-17 15:25:50.680284+00	598	modeling_result object (598)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1894	2024-04-17 15:25:50.68404+00	597	modeling_result object (597)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1895	2024-04-17 15:27:40.240907+00	610	modeling_result object (610)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1896	2024-04-17 15:27:40.246658+00	609	modeling_result object (609)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1897	2024-04-17 15:27:40.250606+00	608	modeling_result object (608)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1898	2024-04-17 15:27:40.258601+00	607	modeling_result object (607)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1899	2024-04-17 15:27:40.262653+00	606	modeling_result object (606)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1900	2024-04-17 15:27:40.266579+00	605	modeling_result object (605)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1901	2024-04-17 15:27:40.271356+00	604	modeling_result object (604)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1902	2024-04-17 15:34:52.498357+00	617	modeling_result object (617)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1903	2024-04-17 15:34:52.507038+00	616	modeling_result object (616)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1904	2024-04-17 15:34:52.512401+00	615	modeling_result object (615)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1905	2024-04-17 15:34:52.517834+00	614	modeling_result object (614)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1906	2024-04-17 15:34:52.522978+00	613	modeling_result object (613)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1907	2024-04-17 15:34:52.528017+00	612	modeling_result object (612)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1908	2024-04-17 15:34:52.531526+00	611	modeling_result object (611)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1909	2024-04-17 15:37:07.012588+00	624	modeling_result object (624)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1910	2024-04-17 15:37:07.017465+00	623	modeling_result object (623)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1911	2024-04-17 15:37:07.021082+00	622	modeling_result object (622)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1912	2024-04-17 15:37:07.025509+00	621	modeling_result object (621)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1913	2024-04-17 15:37:07.032948+00	620	modeling_result object (620)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1914	2024-04-17 15:37:07.037421+00	619	modeling_result object (619)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1915	2024-04-17 15:37:07.043548+00	618	modeling_result object (618)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1916	2024-04-17 15:38:54.881211+00	631	modeling_result object (631)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1917	2024-04-17 15:38:54.886271+00	630	modeling_result object (630)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1918	2024-04-17 15:38:54.890439+00	629	modeling_result object (629)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1919	2024-04-17 15:38:54.901558+00	628	modeling_result object (628)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1920	2024-04-17 15:38:54.905817+00	627	modeling_result object (627)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1921	2024-04-17 15:38:54.914601+00	626	modeling_result object (626)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1922	2024-04-17 15:38:54.919098+00	625	modeling_result object (625)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1923	2024-04-17 15:40:27.112704+00	638	modeling_result object (638)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1924	2024-04-17 15:40:27.121244+00	637	modeling_result object (637)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1925	2024-04-17 15:40:27.129066+00	636	modeling_result object (636)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1926	2024-04-17 15:40:27.134499+00	635	modeling_result object (635)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1927	2024-04-17 15:40:27.140123+00	634	modeling_result object (634)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1928	2024-04-17 15:40:27.149243+00	633	modeling_result object (633)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1929	2024-04-17 15:40:27.154146+00	632	modeling_result object (632)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1930	2024-04-17 15:42:56.484271+00	645	modeling_result object (645)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1931	2024-04-17 15:42:56.488466+00	644	modeling_result object (644)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1932	2024-04-17 15:42:56.493151+00	643	modeling_result object (643)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1933	2024-04-17 15:42:56.49598+00	642	modeling_result object (642)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1934	2024-04-17 15:42:56.498531+00	641	modeling_result object (641)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1935	2024-04-17 15:42:56.501076+00	640	modeling_result object (640)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1936	2024-04-17 15:42:56.504049+00	639	modeling_result object (639)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1937	2024-04-17 15:44:59.573139+00	652	modeling_result object (652)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1938	2024-04-17 15:44:59.57869+00	651	modeling_result object (651)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1939	2024-04-17 15:44:59.584159+00	650	modeling_result object (650)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1940	2024-04-17 15:44:59.587283+00	649	modeling_result object (649)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1941	2024-04-17 15:44:59.589916+00	648	modeling_result object (648)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1942	2024-04-17 15:44:59.595291+00	647	modeling_result object (647)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1943	2024-04-17 15:44:59.598871+00	646	modeling_result object (646)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1944	2024-04-17 15:46:52.247502+00	659	modeling_result object (659)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1945	2024-04-17 15:46:52.254583+00	658	modeling_result object (658)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1946	2024-04-17 15:46:52.25826+00	657	modeling_result object (657)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1947	2024-04-17 15:46:52.265785+00	656	modeling_result object (656)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1948	2024-04-17 15:46:52.271852+00	655	modeling_result object (655)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1949	2024-04-17 15:46:52.275941+00	654	modeling_result object (654)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1950	2024-04-17 15:46:52.287178+00	653	modeling_result object (653)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1951	2024-04-17 15:48:43.496273+00	666	modeling_result object (666)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1952	2024-04-17 15:48:43.502242+00	665	modeling_result object (665)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1953	2024-04-17 15:48:43.505472+00	664	modeling_result object (664)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1954	2024-04-17 15:48:43.509113+00	663	modeling_result object (663)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1955	2024-04-17 15:48:43.515468+00	662	modeling_result object (662)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1956	2024-04-17 15:48:43.519042+00	661	modeling_result object (661)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1957	2024-04-17 15:48:43.522797+00	660	modeling_result object (660)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1958	2024-04-17 15:53:01.486606+00	673	modeling_result object (673)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1959	2024-04-17 15:53:01.491038+00	672	modeling_result object (672)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1960	2024-04-17 15:53:01.494454+00	671	modeling_result object (671)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1961	2024-04-17 15:53:01.497822+00	670	modeling_result object (670)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1962	2024-04-17 15:53:01.502864+00	669	modeling_result object (669)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1963	2024-04-17 15:53:01.506376+00	668	modeling_result object (668)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1964	2024-04-17 15:53:01.510386+00	667	modeling_result object (667)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1965	2024-04-17 15:55:25.372275+00	680	modeling_result object (680)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1966	2024-04-17 15:55:25.380804+00	679	modeling_result object (679)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1967	2024-04-17 15:55:25.391497+00	678	modeling_result object (678)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1968	2024-04-17 15:55:25.399574+00	677	modeling_result object (677)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1969	2024-04-17 15:55:25.409729+00	676	modeling_result object (676)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1970	2024-04-17 15:55:25.415864+00	675	modeling_result object (675)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1971	2024-04-17 15:55:25.420368+00	674	modeling_result object (674)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1972	2024-04-17 15:57:08.474501+00	687	modeling_result object (687)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1973	2024-04-17 15:57:08.4854+00	686	modeling_result object (686)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1974	2024-04-17 15:57:08.491111+00	685	modeling_result object (685)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1975	2024-04-17 15:57:08.498146+00	684	modeling_result object (684)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1976	2024-04-17 15:57:08.503809+00	683	modeling_result object (683)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1977	2024-04-17 15:57:08.510369+00	682	modeling_result object (682)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1978	2024-04-17 15:57:08.521627+00	681	modeling_result object (681)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1979	2024-04-17 16:02:41.553197+00	694	modeling_result object (694)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1980	2024-04-17 16:02:41.558156+00	693	modeling_result object (693)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1981	2024-04-17 16:02:41.562411+00	692	modeling_result object (692)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1982	2024-04-17 16:02:41.571946+00	691	modeling_result object (691)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1983	2024-04-17 16:02:41.5772+00	690	modeling_result object (690)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1984	2024-04-17 16:02:41.586303+00	689	modeling_result object (689)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1985	2024-04-17 16:02:41.591695+00	688	modeling_result object (688)	2	[{"changed": {"fields": ["Criteria", "Modeling output"]}}]	17	1
1986	2024-04-17 16:05:34.040092+00	701	modeling_result object (701)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1987	2024-04-17 16:05:34.046125+00	700	modeling_result object (700)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1988	2024-04-17 16:05:34.05269+00	699	modeling_result object (699)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1989	2024-04-17 16:05:34.056629+00	698	modeling_result object (698)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1990	2024-04-17 16:05:34.060052+00	697	modeling_result object (697)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1991	2024-04-17 16:05:34.063861+00	696	modeling_result object (696)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1992	2024-04-17 16:05:34.073151+00	695	modeling_result object (695)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1993	2024-04-17 16:08:08.441622+00	708	modeling_result object (708)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1994	2024-04-17 16:08:08.451747+00	707	modeling_result object (707)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1995	2024-04-17 16:08:08.464686+00	706	modeling_result object (706)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1996	2024-04-17 16:08:08.472769+00	705	modeling_result object (705)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1997	2024-04-17 16:08:08.477292+00	704	modeling_result object (704)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1998	2024-04-17 16:08:08.486372+00	703	modeling_result object (703)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
1999	2024-04-17 16:08:08.49367+00	702	modeling_result object (702)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2000	2024-04-17 16:15:21.539056+00	715	modeling_result object (715)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2001	2024-04-17 16:15:21.545635+00	714	modeling_result object (714)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2002	2024-04-17 16:15:21.551596+00	713	modeling_result object (713)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2003	2024-04-17 16:15:21.555611+00	712	modeling_result object (712)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2004	2024-04-17 16:15:21.559149+00	711	modeling_result object (711)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2005	2024-04-17 16:15:21.562552+00	710	modeling_result object (710)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2006	2024-04-17 16:15:21.569828+00	709	modeling_result object (709)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2007	2024-04-17 16:17:27.38659+00	722	modeling_result object (722)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2008	2024-04-17 16:17:27.39192+00	721	modeling_result object (721)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2009	2024-04-17 16:17:27.394964+00	720	modeling_result object (720)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2010	2024-04-17 16:17:27.398738+00	719	modeling_result object (719)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2011	2024-04-17 16:17:27.405421+00	718	modeling_result object (718)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2012	2024-04-17 16:17:27.409421+00	717	modeling_result object (717)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2013	2024-04-17 16:17:27.412922+00	716	modeling_result object (716)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2014	2024-04-17 16:20:00.434814+00	729	modeling_result object (729)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2015	2024-04-17 16:20:00.442188+00	728	modeling_result object (728)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2016	2024-04-17 16:20:00.449003+00	727	modeling_result object (727)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2017	2024-04-17 16:20:00.45695+00	726	modeling_result object (726)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2018	2024-04-17 16:20:00.46191+00	725	modeling_result object (725)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2019	2024-04-17 16:20:00.468082+00	724	modeling_result object (724)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2020	2024-04-17 16:20:00.47804+00	723	modeling_result object (723)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2021	2024-04-17 16:22:17.597303+00	736	modeling_result object (736)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2022	2024-04-17 16:22:17.606721+00	735	modeling_result object (735)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2023	2024-04-17 16:22:17.61104+00	734	modeling_result object (734)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2024	2024-04-17 16:22:17.615938+00	733	modeling_result object (733)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2025	2024-04-17 16:22:17.619688+00	732	modeling_result object (732)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2026	2024-04-17 16:22:17.623666+00	731	modeling_result object (731)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2027	2024-04-17 16:22:17.626712+00	730	modeling_result object (730)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2028	2024-04-17 16:24:12.25738+00	743	modeling_result object (743)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2029	2024-04-17 16:24:12.262642+00	742	modeling_result object (742)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2030	2024-04-17 16:24:12.266992+00	741	modeling_result object (741)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2031	2024-04-17 16:24:12.274225+00	740	modeling_result object (740)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2032	2024-04-17 16:24:12.277737+00	739	modeling_result object (739)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2033	2024-04-17 16:24:12.285672+00	738	modeling_result object (738)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2034	2024-04-17 16:24:12.291696+00	737	modeling_result object (737)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2035	2024-04-17 16:26:45.620911+00	750	modeling_result object (750)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2036	2024-04-17 16:26:45.625349+00	749	modeling_result object (749)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2037	2024-04-17 16:26:45.629336+00	748	modeling_result object (748)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2038	2024-04-17 16:26:45.633268+00	747	modeling_result object (747)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2039	2024-04-17 16:26:45.638247+00	746	modeling_result object (746)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2040	2024-04-17 16:26:45.640911+00	745	modeling_result object (745)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2041	2024-04-17 16:26:45.643892+00	744	modeling_result object (744)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2042	2024-04-17 16:31:32.498643+00	757	modeling_result object (757)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2043	2024-04-17 16:31:32.507191+00	756	modeling_result object (756)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2044	2024-04-17 16:31:32.513666+00	755	modeling_result object (755)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2045	2024-04-17 16:31:32.517489+00	754	modeling_result object (754)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2046	2024-04-17 16:31:32.525637+00	753	modeling_result object (753)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2047	2024-04-17 16:31:32.529188+00	752	modeling_result object (752)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2048	2024-04-17 16:31:32.532535+00	751	modeling_result object (751)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2049	2024-04-17 16:33:55.670358+00	764	modeling_result object (764)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2050	2024-04-17 16:33:55.676103+00	763	modeling_result object (763)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2051	2024-04-17 16:33:55.678807+00	762	modeling_result object (762)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2052	2024-04-17 16:33:55.681351+00	761	modeling_result object (761)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2053	2024-04-17 16:33:55.684103+00	760	modeling_result object (760)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2054	2024-04-17 16:33:55.687031+00	759	modeling_result object (759)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2055	2024-04-17 16:33:55.692596+00	758	modeling_result object (758)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2056	2024-04-17 16:36:05.663171+00	771	modeling_result object (771)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2057	2024-04-17 16:36:05.668501+00	770	modeling_result object (770)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2058	2024-04-17 16:36:05.675459+00	769	modeling_result object (769)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2059	2024-04-17 16:36:05.680613+00	768	modeling_result object (768)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2060	2024-04-17 16:36:05.685425+00	767	modeling_result object (767)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2061	2024-04-17 16:36:05.692104+00	766	modeling_result object (766)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2062	2024-04-17 16:36:05.700342+00	765	modeling_result object (765)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2063	2024-04-17 16:38:19.538036+00	778	modeling_result object (778)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2064	2024-04-17 16:38:19.550114+00	777	modeling_result object (777)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2065	2024-04-17 16:38:19.554098+00	776	modeling_result object (776)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2066	2024-04-17 16:38:19.55815+00	775	modeling_result object (775)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2067	2024-04-17 16:38:19.561862+00	774	modeling_result object (774)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2068	2024-04-17 16:38:19.567338+00	773	modeling_result object (773)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2069	2024-04-17 16:38:19.570982+00	772	modeling_result object (772)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2070	2024-04-17 16:40:05.163809+00	785	modeling_result object (785)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2071	2024-04-17 16:40:05.169897+00	784	modeling_result object (784)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2072	2024-04-17 16:40:05.173989+00	783	modeling_result object (783)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2073	2024-04-17 16:40:05.184862+00	782	modeling_result object (782)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2074	2024-04-17 16:40:05.18909+00	781	modeling_result object (781)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2075	2024-04-17 16:40:05.195298+00	780	modeling_result object (780)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2076	2024-04-17 16:40:05.200342+00	779	modeling_result object (779)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2077	2024-04-17 16:42:00.878531+00	792	modeling_result object (792)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2078	2024-04-17 16:42:00.889082+00	791	modeling_result object (791)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2079	2024-04-17 16:42:00.893963+00	790	modeling_result object (790)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2080	2024-04-17 16:42:00.902047+00	789	modeling_result object (789)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2081	2024-04-17 16:42:00.906853+00	788	modeling_result object (788)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2082	2024-04-17 16:42:00.911075+00	787	modeling_result object (787)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2083	2024-04-17 16:42:00.920937+00	786	modeling_result object (786)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2084	2024-04-17 16:43:45.351637+00	799	modeling_result object (799)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2085	2024-04-17 16:43:45.356477+00	798	modeling_result object (798)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2086	2024-04-17 16:43:45.36506+00	797	modeling_result object (797)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2087	2024-04-17 16:43:45.370847+00	796	modeling_result object (796)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2088	2024-04-17 16:43:45.376959+00	795	modeling_result object (795)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2089	2024-04-17 16:43:45.380924+00	794	modeling_result object (794)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2090	2024-04-17 16:43:45.385994+00	793	modeling_result object (793)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2091	2024-04-17 16:45:29.121475+00	806	modeling_result object (806)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2092	2024-04-17 16:45:29.126291+00	805	modeling_result object (805)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2093	2024-04-17 16:45:29.135764+00	804	modeling_result object (804)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2094	2024-04-17 16:45:29.139495+00	803	modeling_result object (803)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2095	2024-04-17 16:45:29.14493+00	802	modeling_result object (802)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2096	2024-04-17 16:45:29.148894+00	801	modeling_result object (801)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2097	2024-04-17 16:45:29.153465+00	800	modeling_result object (800)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2098	2024-04-17 16:47:09.527642+00	813	modeling_result object (813)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2099	2024-04-17 16:47:09.537145+00	812	modeling_result object (812)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2100	2024-04-17 16:47:09.541504+00	811	modeling_result object (811)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2101	2024-04-17 16:47:09.547621+00	810	modeling_result object (810)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2102	2024-04-17 16:47:09.551285+00	809	modeling_result object (809)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2103	2024-04-17 16:47:09.554779+00	808	modeling_result object (808)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2104	2024-04-17 16:47:09.558678+00	807	modeling_result object (807)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2105	2024-04-17 16:48:56.263031+00	820	modeling_result object (820)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2106	2024-04-17 16:48:56.273452+00	819	modeling_result object (819)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2107	2024-04-17 16:48:56.276964+00	818	modeling_result object (818)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2108	2024-04-17 16:48:56.283545+00	817	modeling_result object (817)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2109	2024-04-17 16:48:56.287508+00	816	modeling_result object (816)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2110	2024-04-17 16:48:56.292137+00	815	modeling_result object (815)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2111	2024-04-17 16:48:56.297562+00	814	modeling_result object (814)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2112	2024-04-17 16:51:43.540126+00	827	modeling_result object (827)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2113	2024-04-17 16:51:43.547642+00	826	modeling_result object (826)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2114	2024-04-17 16:51:43.552996+00	825	modeling_result object (825)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2115	2024-04-17 16:51:43.558346+00	824	modeling_result object (824)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2116	2024-04-17 16:51:43.563014+00	823	modeling_result object (823)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2117	2024-04-17 16:51:43.568055+00	822	modeling_result object (822)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2118	2024-04-17 16:51:43.572499+00	821	modeling_result object (821)	2	[{"changed": {"fields": ["Number of ponds", "Modeling output"]}}]	17	1
2119	2024-04-17 20:56:54.330359+00	11	Land Use: No Change, Climate Change: No Change	2	[{"changed": {"fields": ["Description"]}}]	15	1
2120	2024-04-17 20:57:33.150371+00	10	Land Use: No Change, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
2121	2024-04-17 20:58:15.748939+00	9	Land Use: No Change, Climate Change: SSP3	2	[{"changed": {"fields": ["Description"]}}]	15	1
2122	2024-04-17 20:58:19.821889+00	9	Land Use: No Change, Climate Change: SSP3	2	[]	15	1
2123	2024-04-17 20:58:40.515722+00	8	Land Use: No Change, Climate Change: SSP1	2	[{"changed": {"fields": ["Description"]}}]	15	1
2124	2024-04-17 21:01:34.127804+00	7	Land Use: SSP5, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
2125	2024-04-17 21:01:39.162712+00	8	Land Use: No Change, Climate Change: SSP1	2	[]	15	1
2126	2024-04-17 21:02:36.462398+00	7	Land Use: SSP5, Climate Change: SSP5	2	[{"changed": {"fields": ["Description"]}}]	15	1
2127	2024-04-17 21:03:43.336789+00	6	Land Use: SSP3, Climate Change: SSP3	2	[{"changed": {"fields": ["Description"]}}]	15	1
2128	2024-04-17 21:03:46.973132+00	6	Land Use: SSP3, Climate Change: SSP3	2	[]	15	1
2129	2024-04-17 21:04:54.042155+00	5	Land Use: SSP1, Climate Change: SSP1	2	[{"changed": {"fields": ["Description"]}}]	15	1
2130	2024-04-17 21:27:42.876+00	5	Utilisation des sols : SSP1, Changement climatique : SSP1	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2131	2024-04-17 21:31:50.953892+00	5	Land Use: SSP1, Climate Change: SSP1	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2164	2024-04-17 22:05:17.827062+00	5	Utilisation des sols : SSP1, Changement climatique : SSP1	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2165	2024-04-17 22:07:19.607496+00	6	Utilisation des sols : SSP3, Changement climatique : SSP3	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2166	2024-04-17 22:07:33.261718+00	7	Utilisation des sols : SSP3, Changement climatique : SSP5	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2167	2024-04-17 22:08:51.510844+00	7	Utilisation des sols : SSP5, Changement climatique : SSP5	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2168	2024-04-17 22:11:54.238603+00	11	Utilisation des sols : Pas de changement, changement climatique : Pas de changement	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2169	2024-04-17 22:12:06.731366+00	10	Utilisation des sols : Pas de changement, changement climatique : SSP5	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2170	2024-04-17 22:12:14.534345+00	9	Utilisation des sols : Pas de changement, changement climatique : SSP3	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2171	2024-04-17 22:12:20.542053+00	8	Utilisation des sols : Pas de changement, changement climatique : SSP1	2	[{"changed": {"fields": ["Climate Change Scenario"]}}]	15	1
2172	2024-04-18 05:08:37.222929+00	5	satisfaction_threshold object (5)	2	[{"changed": {"fields": ["Minimum satisfaction threshold", "Maximum satisfaction threshold"]}}]	10	1
2173	2024-04-18 05:10:57.695574+00	6	satisfaction_threshold object (6)	1	[{"added": {}}]	10	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	contenttypes	contenttype
5	sessions	session
6	ponderful_mcda	customuser
7	ponderful_mcda	studyarea
8	ponderful_mcda	criteria
9	ponderful_mcda	criteria_params
10	ponderful_mcda	satisfaction_threshold
11	ponderful_mcda	action_types
12	ponderful_mcda	alternatives_params
13	ponderful_mcda	analysisrun
14	ponderful_mcda	scenario_user
15	ponderful_mcda	scenario
16	ponderful_mcda	test
17	ponderful_mcda	modeling_result
18	ponderful_mcda	mcda_result
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2023-12-01 15:14:27.611371+00
2	contenttypes	0002_remove_content_type_name	2023-12-01 15:14:51.869491+00
3	auth	0001_initial	2023-12-01 15:14:51.9751+00
4	auth	0002_alter_permission_name_max_length	2023-12-01 15:14:51.982359+00
5	auth	0003_alter_user_email_max_length	2023-12-01 15:14:51.992787+00
6	auth	0004_alter_user_username_opts	2023-12-01 15:14:52.000276+00
7	auth	0005_alter_user_last_login_null	2023-12-01 15:14:52.010768+00
8	auth	0006_require_contenttypes_0002	2023-12-01 15:14:52.017241+00
9	auth	0007_alter_validators_add_error_messages	2023-12-01 15:14:52.031144+00
10	auth	0008_alter_user_username_max_length	2023-12-01 15:14:52.042502+00
11	auth	0009_alter_user_last_name_max_length	2023-12-01 15:14:52.055974+00
12	auth	0010_alter_group_name_max_length	2023-12-01 15:14:52.076895+00
13	auth	0011_update_proxy_permissions	2023-12-01 15:14:52.087104+00
14	auth	0012_alter_user_first_name_max_length	2023-12-01 15:14:52.0999+00
15	ponderful_mcda	0001_initial	2023-12-01 15:14:52.235457+00
16	admin	0001_initial	2023-12-01 15:14:52.280816+00
17	admin	0002_logentry_remove_auto_add	2023-12-01 15:14:52.29706+00
18	admin	0003_logentry_add_action_flag_choices	2023-12-01 15:14:52.310983+00
19	sessions	0001_initial	2023-12-01 15:14:52.360177+00
20	ponderful_mcda	0002_criteria	2023-12-07 10:49:46.210389+00
21	ponderful_mcda	0003_criteria_params	2023-12-12 16:43:55.873327+00
22	ponderful_mcda	0004_studyarea_name	2023-12-12 16:52:20.314684+00
23	ponderful_mcda	0005_alter_studyarea_name	2023-12-19 15:57:43.955581+00
24	ponderful_mcda	0006_delete_criteria_params	2023-12-20 13:48:42.295882+00
25	ponderful_mcda	0007_criteria_params	2023-12-20 13:49:34.008067+00
26	ponderful_mcda	0008_satisfaction_threshold	2023-12-20 14:30:42.461655+00
27	ponderful_mcda	0009_criteria_params_weight_range_and_more	2023-12-20 15:59:27.308434+00
28	ponderful_mcda	0010_alter_criteria_params_weight_range	2023-12-20 15:59:27.377752+00
29	ponderful_mcda	0011_rename_criteria_id_criteria_params_criteria	2023-12-27 15:33:39.461207+00
30	ponderful_mcda	0012_alter_criteria_params_weight_range	2024-01-17 10:02:11.704505+00
31	ponderful_mcda	0013_criteria_params_weight_percentage	2024-01-17 10:17:32.389263+00
32	ponderful_mcda	0014_action_types_alter_criteria_params_weight_percentage_and_more	2024-01-17 12:28:47.161281+00
33	ponderful_mcda	0015_alter_action_types_name	2024-01-17 12:31:48.884323+00
34	ponderful_mcda	0016_alter_action_types_name	2024-01-30 16:39:58.853522+00
35	ponderful_mcda	0017_analysisrun	2024-02-20 13:31:30.422307+00
36	ponderful_mcda	0018_analysisrun_analysis_number	2024-02-20 14:34:49.997333+00
37	ponderful_mcda	0019_criteria_params_analysis_run	2024-02-20 15:44:15.829503+00
38	ponderful_mcda	0020_alternatives_params_analysis_run	2024-02-20 16:28:36.525784+00
39	ponderful_mcda	0021_scenario_scenario_user	2024-02-20 16:49:17.649896+00
40	ponderful_mcda	0022_rename_scenario_scenario_user_scenario_type	2024-02-21 10:42:31.280765+00
41	ponderful_mcda	0023_test	2024-02-21 16:30:10.938436+00
42	ponderful_mcda	0024_delete_test	2024-02-22 08:50:44.173998+00
43	ponderful_mcda	0025_modeling_result	2024-02-27 17:09:34.249472+00
44	ponderful_mcda	0026_alter_modeling_result_pond_num	2024-02-28 13:57:05.369617+00
45	ponderful_mcda	0027_mcdm_result	2024-02-28 16:14:30.593266+00
46	ponderful_mcda	0028_delete_mcdm_result	2024-02-28 16:14:30.608364+00
47	ponderful_mcda	0029_mcda_result	2024-02-28 16:14:30.656323+00
48	ponderful_mcda	0030_alter_scenario_name	2024-03-01 10:19:00.707818+00
49	ponderful_mcda	0031_scenario_description	2024-03-01 10:20:43.40877+00
50	ponderful_mcda	0032_alter_scenario_name	2024-03-13 17:17:30.23612+00
51	ponderful_mcda	0033_alter_criteria_params_rank_alter_scenario_name	2024-03-17 19:06:32.372085+00
52	ponderful_mcda	0034_criteria_name_en_criteria_name_fr_and_more	2024-04-16 13:26:59.174423+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
j7i1l8q0s01y2r808bhf6mj54d5yqhyc	.eJxVjzFvwyAQhf-KxYwsY0NsPCZr0q1TFaEzHDWNCxLgIar634sjD650y33vvdO7H6JgzbNaE0blDBkJI_TIJtAP9JtgvsB_hloHn6Ob6s1S72qqb8Hgct69_w7MkOaS5ubE2ND2kjPOJFjbNIOehOyRs162J5TWCD5MHecN18IKnLrG8Ka3iFa2QzkKHpZncknF1b-6dq2kJOXVPBVEhBdjXUG4oM5olI4uY3RAxo-WsjLiTkkE_1AG8kYFZawI90MmafQQXSidr-BN9Z5wrN5CdZnL-0iry-K-IeO-HyTy-weid2xL:1rvDrV:PeJBUOQmKnw1YgCMMw9grZBCsVGD4ypA4DFeVFbMUTc	2024-04-26 10:10:25.233018+00
06186le1zn1bldmylp64dvu2wvo4uzvn	.eJxVkEFPxCAQhf9Kw5k0pRTo9rh7VW-ejCEDTC1uhQToYWP871JtzJrMZb733uRlPomGrSx6y5i0d2QigtB7ZsBeMeyCe4fwFlsbQ0netLulPdTcPkaH6_nw_juwQF5qelQKZytYb0bhBMdx5kPPnek5GxgMlrOTVFL1TpyUsdDJrhtQCjlzlB23ph6FAOst-6zTFn66srGjJJfN3TQkhF_GK8IVbUGnbfIFkwcyvfSU1RkoE6-UJAhX7aDsAqOcMkZ3_JfLFgMkH2vvBwiuec44NU-xuSz1BUiby-o_oOCx30nk6xslUGzu:1rpszn:oPBNAhhQIwcZLTff4_a1lQnbij01BiT2xkcax5NmOdA	2024-04-11 16:52:55.184825+00
8es3uyv0txf0fkpbo969h4fd6jqy95io	.eJxVjEEOwiAQRe_C2hCgQwGX7j0DAWZGqoYmpV0Z765NutDtf-_9l4hpW2vcOi1xQnEWWpx-t5zKg9oO8J7abZZlbusyZbkr8qBdXmek5-Vw_w5q6vVbA45ae-MCaNAhMSvlS7bBEWgXzEiB0YLPA4CCYtlSHhSCckzEwXjx_gC3bzcq:1rBEQF:zYopbAGr-Gx8naR9UaMMOrV27-4khIOAjo1qyk39kls	2023-12-21 13:28:11.532011+00
oooivglykbl8mphln6hosn1gcz56k3v1	.eJxVkM1uwyAQhF8FcbYssCH-OfZeKVLUUxWhNSw1DQEV8CGq-u4laQ7ubfebmdVov6mCraxqy5iUM3SmnDZ7toC-YLgL5hPCR2x1DCW5pb1b2qea29do0L88vf8OrJDXmhbmwPnYDZPggk9gLWOjXuQ0oODD1B1wskaKcemFYEJLK3HpmRFssIh26sZ6FAL4W3ZZpS08ukrJGprLZm4KEsKD8b4i9KgLGqWTK5gc0Pm9a3h3bmiCcFEGyh8S5505awyQXKxl34rzLkNxMRCDmeToM5nJEXJdiV7rI_CKoTS7mWjvrjXytWG1nk7Hnv78AsUqdKg:1rxo1G:dvLh5i_I9T1M0tvdUg7rYAlqcCuxmaQWuoULoq2KaY0	2024-05-03 13:11:10.640746+00
xylsvbo6gmi50wyursu0m7spofr1uu6x	.eJxVj8FuwyAQRH_F4owsAwY7PjbXpqoU9VRFaIF1TeNgCfAhqvrvxZEP6XHfzI5mfoiGNU96TRi1d2QgktBnZsBeMWyC-4bwtdR2CTl6U2-WeldTfVoczi-791_ABGkq333X4Wgl46aXTgrsR9Fy4QwXrGXQWsEOqlMdd_LQGQuNapoWlVSjQNUIa0ooBJjvyScd1_DoqhpKUl7dXUNEeCAmCsIZbUanbfQZowcyfHLK-IWSCOGqHeQNMSovT-ZkMUD0S-n6CsFVHwmH6m2pjlOZjbQ6zv4GGfd7qM7nd0Z-_wCYnWiv:1rknO3:dGMD71j-RToJ-lcUaPyV5AbyybVuEUoVb33usjpxz6s	2024-03-28 15:52:55.872702+00
jeew735fhqa8yyao55qbo4tkye6y6zql	.eJxVjsEOwiAQRP-FsyFsuxTw6N1vIAssttrQpLQHY_x3W9ODXufNvMxLeFqX3q-VZz8kcRYgTr9ZoPjgsoN0p3KbZJzKMg9B7hV50CqvU-LxcnT_BD3Vfltj6gBsYxwCgqOclbIxaGcYwbimY5eTRhtaRIVRZ82hVQmVyczZNXaTUqHxWYfq57V8v4K17w_NHT65:1rrczu:8Y1H2ZJko86Q82-_BvyJ2uUKNtnGz-obl1WAe3_NMQo	2024-04-16 12:12:14.568112+00
mwa38u9xmk9stgbzk5z4b1phknxew9vv	.eJxVjMsOwiAQRf-FtSHAMEBduvcbCI9BqgaS0q6M_65NutDtPefcF_NhW6vfBi1-zuzMkJ1-txjSg9oO8j20W-ept3WZI98VftDBrz3T83K4fwc1jPqtnbVUEkoVHWYEcgW0ghwVSC2DTiAnY41VGScbUxBGCE0GTQEyAlJk7w_KMTcU:1rkj8r:Ne-g9trc3MJpP_xONYKr1NLJpetIOxpLwrEeRkIe-X4	2024-03-28 11:20:57.058258+00
oekvubohrhyhksj5noaln3e6s43jqd3n	.eJxVkMFqwzAQRH_F6CyMpXUl28fm2kAh9FSC2EjrWo0jgyQfQum_V259SK9v3g7DfjGDa57Mmiga79jAesYf2QXtlcIWuE8MH0ttl5Cjv9SbUu9pqo-Lo_l5d_8VTJimcg0w9iQl2WZ0SoFWCC2QGEXfOK0FyFa6vgNJhN3YC606Zdv2adRFACmhlGLA-Z58MnENv1tFozhLeXV3g5Hwj0FBNJPN5IyNPlP0yIZ3yYU8cxYxXI3DvKGOd-cHOVkKGP1Sxr5gcNVboqE6nV6BV4fZ3zBTdZjKC3bKvn8AnNpmdw:1rnEk5:ctYAE2Zg-7aEqmMtaxQqYnWw7irRjofWmHmZk3FOdP8	2024-04-04 09:29:45.959538+00
7kuudvsww03p1eh7r9nuzhwb25u5melo	.eJxVjssOwiAURP-FdUMocAu4dO83kMvLVhuaQFk0xn_XNl3o9szMybyIxbaOttVY7BTIhSjS_TKH_hnzHoQH5vtC_ZLXMjm6V-iZVnpbQpyvZ_dPMGIdv2tAI4JWyHVIDIwHCV4mGAITjMXEjQYzSBCSAXcJTBT90GvJnWJCcLlLMeO81ana0vLx1aiO1LWFzWKJeKBevD9fbUQq:1rmFEX:pfIScxW0MJY3XLZuDnYmQnfdJfO4GyGXLT8ywg2zLXw	2024-04-01 15:49:05.489369+00
gnsuctqtg3cdaw4g0fv19l2obfctd6cb	.eJxVjk0KwyAUhO_iOoial0Sz7L4nKEX8eTa2wYCaRSm9e5OSRQuzmvlmmBfRZq2TXgtmHT0ZCSfNr2eNe2DaA3836bZQt6Sao6U7Qo-00PPicT4d7N_AZMq0tcH3nEsxKODAlQmBMelspwYEPijRowq-A2lbAAauCx3alnlgQ0AMSsht1CQzP0ssOq_p-5VL1ZCCM7qKXrscK-ZoyHgRDd8E1_cHxPdIaQ:1rrd20:xV9_B4390xQFqwEQksyYxm7NT-EY0EumyB0Q6hbsOJk	2024-04-16 12:14:24.485894+00
c4z28gt7l5gm6i1vqoqloirnl91mg97j	.eJxVj8FugzAQRH8F-YxQjO0QODbXpqoU9VRF1rK7FDfElmxziKr-e6HlkB73zexo5ktYmPNo58TROhKdkDtRPsIe8Mp-VegT_EeoMPgcXV-tlmpTU3UKxNPT5v0XMEIal2-ld4PUfFCmbxuSwwDQS9prAzg0oA0yaYZWIiusDeyxQaOaWuGALSoySyh4mO7JJRtn_1tWyroUKc90txAZ_phaEE-MmclidJmjA9G9y_pSigj-agnyCg6XB2NC9hBdWIo-g6fiLXFXvITiOC6buSyOk7tB5u3uivP5VYrvH_praiw:1rng04:Ua2m5I1r4SisjnVE-7AUKK7Cd9ZB5DLK-GfwQvxFujo	2024-04-05 14:36:04.220501+00
c3mv6nb3t198jd39y3s5glrox3vj7t1x	.eJxVjsEKwjAQRP8l51Ky7cY0Hr37BSJhk93YqrSQpgcR_90qCnp9b2aYu_K0lN4vs2Q_sNoqUNUvCxQvMr4En2k8TXWcxpKHUL8i9cfO9X5iue4-2b-BnuZ-bSNvALrGOgQERylp3cVgnBUE65qNuMQGu9AiaowmGQmtZtQ2iSTXdOvoXBa-ecpC76fQrkiuEouwj3kokgdS2wNUprLHSmUaL56pfBng8fEEbotNEQ:1rVwWT:9Y_Pu7gT1tayqCOpIwaajU3YnnHtTMUvB9sPG6gFOaw	2024-02-16 16:36:13.878883+00
3hnqvmn0tx7qvtokre5z51sv4s5ge801	.eJxVjjsOgzAQRO_iGiEblo8p0-cEEbLW3nUgICMZU0RR7h6IKJL2vZnRvITBLQ1mWzmakUQnlMh-mUU3cTgEPTDcl9wtIcXR5kckP-2aXxfi-XJm_wYGXIe9DVQr1RaNBgVKo_dSts5WumFQjS5q1p4qaG0JIMFVvmJbSgLZeGavi3YfXdNGT4OR8ftUlTvimV1iMi6OieOIorsVWdlnImKYDGE6iMrq_v0B9ZBMHQ:1rVwoF:fWZViturj53JUwE_uXt-p6d-A20ezeGj4iLGshjZgRU	2024-02-16 16:54:35.998995+00
4agrqh5mu4fsyzdjsqxd8yj41xxjhuby	.eJxVjrFuxCAQRP-FGlksXg64Mn2-IDqhhV1i5062hHERRfn32NEVSfvezGi-VKK9T2nfpKWZ1VWB0n9ZpnKX5RT8Qcv7OpR16W3OwxkZnnYbXleWx8sz-29gom062sgXgGB9RECIVKsxoWQXvSD4aC8SKzsMeUQ0WFx1kkfDaHwVqdGGY3TrO38makK_T2E8kDykdOFU2tylzaSub6CdDjetGi33xNRPZrXXYG_fP26xTRM:1rVwsG:7QZDOC_AH9nzzIwVnbLofK735ibSIbL2XWkM0Ur6puA	2024-02-16 16:58:44.349972+00
71br8pf25u4gn90pu3ofl04jnaun1d3t	.eJxVjDsOgzAQBe_iGiEblo8p0-cEEbLW3nUgIJBsU0RR7h6IaGhn3puPiGmjt8HAaEYSnSozYXBLg9kihz8SSlyYRTfxcgh64fJcc7cuKYw2Pyb5aWN-X4nn27m9BAaMw_4GqpVqi0aDAqXReylbZyvdMKhGFzVrTxW0tgSQ4CpfsS0lgWw8s9dFu0cjz-wSk3FhTBxGFN2jzKDPRMBlMoTpICqr--8PL_JMHw:1rc5U2:u2TdJyYaEXDkfLNJfNXUGeO1_Si5arYZWDCjFkZDL3U	2024-03-04 15:23:06.755564+00
qzmvsy6ic0a3215t6kg4wnq7byrjf9io	.eJxVj8FugzAQRH8F-YwQNkvAHJtrW1WKeqoia7HXwQ01km0OUdV_r5NwSI77ZnY088sUrmlSa6SgnGED46x8ZCPqM_mrYL7Rn5ZKLz4FN1ZXS7WpsXpbDM0vm_cpYMI45W8wO8570UngwCVaW9e9HlvZEfBOih1Ja1roxwagBt3alsamNlB3lshK0edQ9DhfoosqrP7WVfRQsphWc1EYCG-MNxnRTDqRUTq4RMEhG75EycWxZAH9WRlMdwTHB3PU5DG4JZd9RW-Kz0hD8b4U-ynvprLYz-4HE233UBwOHy37-wftKGkB:1rvDXj:AzPS3hs_w_B9jaGkjtQQnm4bzJpKp-BNbH399g3O3iI	2024-04-26 09:49:59.730037+00
ljjg9zykf1mr9hgv51hqm2ohdggf9451	.eJxVjssOgjAURP-la0J64Za2LN37BcY0fdwKSiBpy8IY_10wLHR7ZuZkXszYtQxmzZTMGFjPgFW_zFn_oHkPwt3Ot6X2y1zS6Oq9Uh9prs9LoOl0dP8Eg83DtsbQAahGagQEbWPkXHkntCQEqZuOdAwClWsROXoRBbmWB-QyEkXdqE2ayxqexiay36ewEZrIFwrGp7FQGi3rL8ArgOv7AxWiRq4:1rKy7w:LhkbpygxnBhju367YYVs6ArgzkyfKQEydy5ZO8dRFRc	2024-01-17 10:05:32.115144+00
twbdm7gfv82k7k8m5fmrgk540j921x77	.eJxVjj1uxCAQhe9CbVmMPV7MlulzgmiFBmaIyVpYAlysotw9drJFUr7v_eh9Kkd7W9xepbjE6qpAdX-Zp3CXfBr8Qfl968OWW0m-PyP9063968ayvjyz_wYWqsvRRr4AzIOxCAiWYtR6Dn6yRhCMHS5iI084-xFRY5jiJH7UjNpEkWiH-RilTOujpurKnn--Anaqtp0fjorQLxoPJKuEJuxCSU1KInV9M7dOFcp3x9RODXD7-gam3VLl:1rcjFC:1miw0-jFjSPSa0ztIOn_lZauqpEGkzc6TVvBwcjjshg	2024-03-06 09:50:26.063503+00
gbyf89gdw2zgygjwd6bnz704swmyukp6	.eJxtkDFvwyAQhf8KYrYsY4NtMnav1KVTFaEzHDUJARXwEFX978VRBlfqdve9905P900VbGVVW8aknKEnymhzZAvoK4ZdMBcIn7HVMZTklna3tE81t6_RoH95ev8cWCGvNc3NyNjcT5IzziRY23WzXoSckLNJ9iNKawSfl4HzjmthBS5DZ3g3WUQr-7kehQD-nl1WaQuPrkKwhuaymbuChPBgbKgIPeqCRunkCiYH9PTRN6w_NzRBuCoDZUe8Gc8Hc9YYILlYy74X512G4mIgBjPJ0WdyIm-Q60r0Wh-BNwylOcxEe3erka8N_7PSn1_Zn3nL:1s5Nkd:W0smP7NE_ZAR0vVlrbwHa332qSwfqHcLv8ybHFKl8mM	2024-05-24 10:45:19.945172+00
6x062gy3esduduzpmurpqmhuosd5lcfi	.eJxtUDtrxDAM_ivBswlx4jx8Y_dCl07lMIotN77zOdRyhqP0v9c5bkihoEH6Xkj6Zhq2vOiNMGlv2YkJxo_YDOaKcSfsBeLnWps15uTnepfUT5bq19VieHlq_wQsQEtxSzsIMbWjkkIKBc41zWTmXo0oxajaAZWzvZzmTspGmt71OHeNlc3oEJ1qpxIKEcKdPOm0xceu_dBwRnmzdw0J4YGJrkAY0GS02iSfMXlgp4-Wi1I9FyMX05mzBPGqLeSd22HJi3OXtOdDABmMkPxaDnjPPniC7NdYWaSK1kDVqXoDKmNllvIcvGHM_NBXJvhbsXxt-J-U_fwCA799lQ:1sGxfl:QdBrRoa4Dtf7LGX7lt7qDAPKxZrgq2sjuW5fGVClbbI	2024-06-25 09:20:09.064635+00
l1oopy14uh076p2uxmns7q51zy66qpok	.eJxtUEtrxCAQ_iviOQRNzMM99l7opaeyyETHxl1XqZrDUvrfa5Y9pFCYw8z34mO-qYKtrGrLmJQz9EQ5bY7YAvqKYSfMBcJnbHUMJbml3SXtk83tazToX57aPwEr5LW6hRk5n7tJCi64BGsZm_UyyAkFn2Q3orRmEPPSC8GEHuyAS8-MYJNFtLKbaygE8PfsskpbeHQdRt7QXDZzV5AQHhjvK4QedUGjdHIFkwN6-ugaXmdq-HxuaIJwVQbKTlTDPpVk54M1awyQXKzV34vzLkNxMRCDmeToMzmRN8j1JHqtb8EbhtIcdqK9u1XL14b_SenPL4hwfG8:1sPH9C:uOo1va5427aroridzoJvvyn_thUXs5jCQVeyaLS65Rk	2024-07-18 07:44:54.526929+00
n7wo3ydvhtlanf6ijrqz03boiw6qeurq	.eJxtkEFrxCAQhf-KeJagiSYxx94LvfRUikx0bNzNGqrmsJT-95plKVsozGHmm_cew3xRA3tZzJ4xmeDoRAVlj2wGe8Z4LNwJ4sfW2C2WFObmkDT3bW6eN4fr0137J2CBvFS3dL0QYztoKaTQ4D3no52VHlCKQbc9au-UHOdOSi6t8grnjjvJB4_odTvWUIiwXnPIJu3xdqvqJaO57O5qICHcmOgqwhVtQWdsCgVTADq9tUzUUu-MJohn46ActKoFZwf99WSLEVLY6s2vJawhQwlbJA4zyduayUReINeR2KX-Ay8YC3voiV3DpVo-d_xPSr9_AK0Oex0:1sRtun:cX3Siqe6CgDhoJ7IsSJCEeFjkRlBYMseFc77qqs-39E	2024-07-25 13:32:53.321806+00
b829wk0jczy7euz1fliits2vs87tg4r3	.eJxVUEtrwzAM_ivGZxPi1Hm0x90HhbLTKEax5cWt6zDLOZSx_z4n9JAhHaTvhdAP17DkSS-ESXvLT1wqLvbgCOaOcWXsDeLXXJk55uTHapVUL5aq99lieHtp_wVMQFNxD9A4qbqhc3LsnXKDbV0NY2OOsjXYObBSmWNn-sbZoW6MG1XdyG5UUJQd1CUUIoQnedJpiduxrVKCU17sU0NC2DB5KBAGNBmtNslnTB746bMRsnQv5HAVPEG8awt5JQax1XVnI4MRkp_L2R_ZB0-Q_RyZRWI0B2IndgYqKzNTeQk-MGaxm5kJ_lEs3wsW6eVyPvDfPy0NeAw:1rxMxu:t7nmG6GAvlaLcjD9zFAwPjOLEGIaCRu6gAbqSiyL1v4	2024-05-02 08:17:54.455185+00
o27suavonsi5uw4dvlaui3dtlxwxdo8h	.eJxtUE1rxCAQ_SviWYImZjfm2Huhl57KIqPONnZdpWoOS-l_r1m2kEJhDjPvi8d8UQ1rXfRaMGvv6EzFSNkeNGAvGDfGfUB8T51NsWZvuk3SPdjSPSeH4emh_ROwQFm2XMn5wfQABuQwTBzOih_QSm4n21tQBpVQVowwSeFASjmoIzdcoRrOE4x9C4UI4VZ80XmN97KjHBgtdXU3DRnhjokNwoC2otM2-4rZA53feibaHJmYToxmiBftoG6EGNnvnHbWYjFC9qlVf60--ALVp0gcFlJSKGQmL1DaSezS3oJXjJXtdmKDvzbL54r_Sen3D09KfQ8:1rxNMl:PTxL0h3IHaf5xXHtdXHz9lt9Z51iJd9ieGfOJTa2Ld0	2024-05-02 08:43:35.238721+00
5wr0t3c5rf5oia67n0cbso18fq5tf6sy	.eJxVjkEOgyAURO_C2hCQj0CX3fcM5AOfamswEV2YpndvNS7a7ZuZl3kxj-vS-7XS7IfELkyy5pcFjE8qe5AeWO4Tj1NZ5iHwvcLPtPLblGi8nt0_QY-1_64hdVLa1jiQIB3mLISNQTtDII1rO3I5abBBAQiIOmsKSiQQJhNl19qvFAuOWx2qn9dyfNVKNawua9o8zoQHk-r9AbVFRR4:1rxMT9:-WrJ8uqyFK7cm939dwh3A072M_tz3pE-0eal6kF-S3U	2024-05-02 07:46:07.98021+00
3wx6187c2bnk7dykrhjo8thwpef6muu5	.eJxVkEFrhDAQhf9KyFnEUWPVY--FhaWnsoQxGWu62Ugz8bCU_vfGZQ_2NvO994bH_EiNW1r0xhS1s3KUALI4wgnNlcKu2C8Mn2tp1pCim8rdUj5VLt9WS_716f13YEFecrq10wBKwUtDaHFQs-q72kI_9K2tDLTdpGYzVdTPWM0NdLOBqrZDDUQwtVWVj2JAf2fHOm7hUVa1XSE5bfauMRI-GDQZkSeTyGoTXaLoUI4fdQHqUsiI4aotph1BXXSXg5sNBYxuzW3fk_OOMbk1CEssePUsRnFCzqswS_4E3Sik4jAL490tR743ytbz-aTk7x8Hn3Wt:1rxNJH:55ENW6DTMQXnK4JqdIumhq4wO3AaatGflS6hlX2M-84	2024-05-02 08:39:59.798053+00
zcdi86p0t30qadzbnnrkbn617h0bdr6h	.eJxtkM1qxDAMhF_F-GxCnH_n2Huhl55KMbItN971OtRyDkvpuzdZlrKF3qRvZsSgL65hK4veCLMOjs9cNlw8QgP2jOlQ3AnSx1rZNZUcTHVYqrtK1fPqMD7dvX8OLEDLnu7kNHilrGsGY9vRDOiMB7DKoVK9l5Of6kYa08sWJj-0nUM5OK_qrrWtqo9WkCBeKZDOW7qV7btRcCqbu2rICDcm2x1hRFvQaZtDwRyAz2-yEXIUcnoXPEM6awflwKMYxMF-I2QxQQ7rXvm1hBgISlgTc0iM1khsZi9A-8rssr8DL5iKeJiZjeGyRz43_M_Kv38AuLd8Sw:1rxNU2:3bPng8h_26o-riQszQ6Qtac4oJixNluCpSYBIuzCIVc	2024-05-02 08:51:06.604601+00
\.


--
-- Data for Name: ponderful_mcda_action_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_action_types (id, name) FROM stdin;
7	Creation
8	Restoration
9	Water management
10	Land management
11	No action
\.


--
-- Data for Name: ponderful_mcda_alternatives_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_alternatives_params (id, pond_min, pond_max, pond_size, action_id, user_id, analysis_run_id) FROM stdin;
97	2	6	small	7	1	52
98	1	3	small	7	5	54
99	5	20	small	7	5	56
100	0	0	small	11	5	57
101	5	8	small	7	5	58
102	10	30	small	7	5	59
103	5	8	small	7	5	59
104	5	8	small	7	5	60
105	1	6	small	7	5	61
106	1	6	small	7	1	62
107	1	6	small	7	5	63
108	1	6	small	7	5	64
109	4	7	small	7	1	65
110	0	0	small	7	5	66
111	1	7	small	7	1	72
112	2	2	small	7	1	73
113	2	2	small	7	1	74
114	8	8	small	7	1	75
115	2	8	small	7	1	76
116	1	20	small	7	1	77
117	1	5	small	7	5	79
118	1	6	small	7	1	80
119	5	12	small	7	1	93
120	3	16	small	7	6	94
121	4	17	small	7	1	99
122	2	12	small	7	1	100
123	3	15	small	7	1	101
124	2	12	small	7	1	102
125	2	4	small	7	1	104
126	5	10	small	7	9	106
127	2	12	small	7	1	107
128	5	5	average	7	10	110
129	1	1	big	7	10	110
130	2	2	small	7	10	110
131	4	6	small	7	10	112
132	15	20	small	7	1	113
133	2	12	small	7	1	114
134	2	13	small	7	1	115
135	2	8	small	7	1	118
136	2	9	small	7	1	119
137	2	8	small	7	1	120
138	2	8	small	7	1	121
139	2	8	small	7	1	122
140	2	8	small	7	1	123
141	2	8	small	7	1	124
142	2	8	small	7	1	125
143	2	8	small	7	1	126
144	2	8	small	7	1	127
145	2	8	small	7	1	127
146	2	9	small	7	1	128
147	2	8	small	7	1	130
148	2	9	small	7	1	131
149	2	9	small	7	1	132
150	2	9	small	7	1	132
151	2	20	small	7	1	132
152	2	20	small	7	1	132
153	2	20	small	7	1	133
154	2	20	small	7	1	134
155	2	20	small	7	1	135
156	2	9	small	7	1	136
157	2	9	small	7	1	137
158	2	9	small	7	1	138
159	2	8	small	7	1	139
160	2	20	small	7	1	140
161	2	20	small	7	1	141
162	2	20	small	7	1	142
163	2	20	small	7	1	143
164	2	9	small	7	1	144
165	2	12	small	7	1	145
166	2	19	small	7	1	145
167	2	18	small	7	1	146
168	2	12	small	7	1	147
169	2	18	small	7	1	153
170	2	15	small	7	1	155
171	2	12	small	7	1	161
172	2	7	small	7	1	165
173	2	4	small	7	1	166
174	2	8	small	7	1	173
175	2	9	small	7	1	174
176	2	9	small	7	1	176
177	2	9	small	7	1	176
178	2	12	small	7	5	180
179	2	12	small	7	1	183
180	2	12	small	7	1	185
181	4	10	small	7	1	185
182	2	10	small	7	1	237
183	1	7	small	7	1	240
184	1	4	small	7	1	284
217	1	3	small	7	1	317
218	1	8	small	7	1	319
219	2	6	small	7	1	320
220	3	7	small	7	1	321
221	2	7	small	7	1	324
222	3	5	average	7	1	325
223	2	7	small	7	1	327
224	5	10	small	7	1	329
257	2	20	small	7	1	331
258	2	20	small	7	1	331
259	4	12	small	7	1	332
260	2	5	small	7	1	335
261	2	8	small	7	1	345
262	2	4	small	7	1	347
263	2	7	small	7	1	349
296	2	9	small	7	1	384
297	2	6	small	7	1	386
298	2	8	small	7	1	430
299	2	7	small	7	1	431
300	2	7	small	7	1	433
301	2	4	small	7	1	436
302	2	9	small	7	1	439
303	2	7	small	7	1	440
304	2	16	small	7	1	441
305	2	16	small	7	1	442
306	2	14	small	7	1	443
307	2	8	small	7	1	444
308	2	8	small	7	1	446
309	2	8	small	7	1	447
342	2	8	small	7	1	481
343	2	9	small	7	1	483
344	2	10	small	7	1	484
377	2	8	small	7	1	518
378	2	20	small	7	1	519
379	2	20	small	7	1	524
380	2	15	small	7	11	528
381	5	15	small	7	15	529
382	1	4	average	7	11	531
383	5	15	small	7	15	529
384	1	4	average	7	11	531
385	5	20	average	7	14	530
386	1	8	big	7	11	535
387	5	10	average	7	12	532
388	5	20	small	7	14	536
389	5	20	small	7	14	536
390	5	20	small	7	14	536
391	5	20	small	7	14	538
392	5	20	small	7	14	538
393	1	20	big	7	11	539
394	5	10	small	7	15	537
395	5	20	small	7	14	538
396	2	5	big	7	12	540
397	5	20	small	7	14	538
398	5	10	small	7	15	537
399	1	1	average	7	11	541
400	1	1	average	7	11	541
401	5	10	small	7	15	543
402	5	20	small	7	15	543
403	1	20	small	7	14	544
404	1	20	small	7	14	544
405	5	20	big	7	15	543
406	1	20	small	7	14	544
407	5	20	average	7	15	543
408	1	15	average	7	11	545
409	5	10	average	7	15	543
410	5	10	average	7	15	543
411	2	20	small	7	1	549
412	2	20	small	7	1	551
413	6	15	small	7	1	552
414	6	15	small	7	1	552
415	6	15	small	7	1	555
416	6	15	small	7	1	555
417	6	15	small	7	1	556
418	2	20	small	7	1	561
419	2	20	small	7	1	562
420	2	18	small	7	1	563
\.


--
-- Data for Name: ponderful_mcda_analysisrun; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_analysisrun (id, created_at, user_id, analysis_number) FROM stdin;
49	2024-03-13 17:51:35.167372+00	1	1
50	2024-03-14 07:26:32.677137+00	1	2
51	2024-03-14 08:28:35.710107+00	1	3
52	2024-03-14 08:43:20.531858+00	1	4
53	2024-03-14 09:15:08.199819+00	1	5
54	2024-03-14 11:29:58.022993+00	5	1
55	2024-03-14 15:31:13.314629+00	5	2
56	2024-03-14 15:31:28.866455+00	5	3
57	2024-03-14 15:41:29.072555+00	5	4
58	2024-03-14 15:44:01.429424+00	5	5
59	2024-03-14 15:45:12.744091+00	5	6
60	2024-03-14 15:52:31.391765+00	5	7
61	2024-03-15 08:17:47.842609+00	5	8
62	2024-03-15 08:19:03.194498+00	1	6
63	2024-03-15 09:25:26.341939+00	5	9
64	2024-03-15 09:26:15.21338+00	5	10
65	2024-03-15 09:27:51.00881+00	1	7
66	2024-03-15 09:29:36.450757+00	5	11
67	2024-03-15 10:07:13.834033+00	1	8
68	2024-03-15 10:09:42.467755+00	1	9
69	2024-03-15 15:18:35.397336+00	1	10
70	2024-03-17 14:53:36.15215+00	1	11
71	2024-03-17 15:48:14.010999+00	1	12
72	2024-03-17 15:48:56.669687+00	1	13
73	2024-03-17 16:56:49.432085+00	1	14
74	2024-03-17 20:02:56.001163+00	1	15
75	2024-03-17 20:03:41.164487+00	1	16
76	2024-03-17 20:36:02.444413+00	1	17
77	2024-03-17 23:32:37.016519+00	1	18
78	2024-03-17 23:42:04.752283+00	1	19
79	2024-03-17 23:59:02.061083+00	5	12
80	2024-03-18 07:29:33.698178+00	1	20
81	2024-03-18 07:42:15.514232+00	1	21
82	2024-03-18 08:26:47.943975+00	1	22
83	2024-03-18 09:07:09.755016+00	1	23
84	2024-03-18 09:36:23.7716+00	1	24
85	2024-03-18 09:37:38.656445+00	1	25
86	2024-03-18 09:37:44.728156+00	1	26
87	2024-03-18 09:37:51.257673+00	1	27
88	2024-03-18 09:43:41.76975+00	1	28
89	2024-03-18 09:54:17.421884+00	1	29
90	2024-03-18 09:57:57.244735+00	1	30
91	2024-03-18 09:58:18.14291+00	1	31
92	2024-03-18 10:43:09.168371+00	1	32
93	2024-03-18 12:53:11.421444+00	1	33
94	2024-03-18 14:37:07.330534+00	6	1
95	2024-03-18 15:28:05.539591+00	1	34
96	2024-03-18 15:29:17.656809+00	1	35
97	2024-03-18 15:49:03.808673+00	7	1
98	2024-03-18 15:56:52.772045+00	1	36
99	2024-03-18 16:50:25.610676+00	1	37
100	2024-03-18 17:45:46.787695+00	1	38
101	2024-03-18 20:25:35.873968+00	1	39
102	2024-03-18 21:37:55.909939+00	1	40
103	2024-03-19 13:46:23.854061+00	1	41
104	2024-03-20 09:06:07.59603+00	1	42
105	2024-03-21 07:58:23.028574+00	1	43
106	2024-03-21 09:29:26.139242+00	9	1
107	2024-03-21 14:19:46.982014+00	1	44
108	2024-03-21 14:23:53.924623+00	1	45
109	2024-03-22 13:53:31.15627+00	10	1
110	2024-03-22 13:54:07.12921+00	10	2
111	2024-03-22 14:05:30.074432+00	10	3
112	2024-03-22 14:35:30.8077+00	10	4
113	2024-03-22 14:42:15.304079+00	1	46
114	2024-03-22 15:08:59.792399+00	1	47
115	2024-03-25 12:35:23.585224+00	1	48
116	2024-03-25 12:37:18.119217+00	1	49
117	2024-03-25 13:40:16.037147+00	1	50
118	2024-03-25 14:22:53.94175+00	1	51
119	2024-03-25 14:27:40.378114+00	1	52
120	2024-03-25 14:29:31.259098+00	1	53
121	2024-03-25 14:36:52.155368+00	1	54
122	2024-03-25 14:43:03.837376+00	1	55
123	2024-03-25 14:46:29.162591+00	1	56
124	2024-03-25 15:40:21.133711+00	1	57
125	2024-03-25 16:27:11.179601+00	1	58
126	2024-03-25 16:29:11.707042+00	1	59
127	2024-03-26 10:28:22.446363+00	1	60
128	2024-03-26 10:41:25.073005+00	1	61
129	2024-03-26 10:41:45.382445+00	1	62
130	2024-03-26 10:53:15.683907+00	1	63
131	2024-03-26 10:58:21.272521+00	1	64
132	2024-03-26 14:35:19.531758+00	1	65
133	2024-03-26 15:33:14.155775+00	1	66
134	2024-03-26 15:33:55.272273+00	1	67
135	2024-03-26 15:34:31.964922+00	1	68
136	2024-03-26 15:39:27.217715+00	1	69
137	2024-03-26 15:40:52.35568+00	1	70
138	2024-03-26 16:15:23.666093+00	1	71
139	2024-03-26 16:40:10.587512+00	1	72
140	2024-03-26 17:01:08.907675+00	1	73
141	2024-03-26 17:04:19.175538+00	1	74
142	2024-03-26 17:05:15.792533+00	1	75
143	2024-03-26 17:15:44.556363+00	1	76
144	2024-03-26 17:31:31.571129+00	1	77
145	2024-03-26 18:40:30.586198+00	1	78
146	2024-03-27 07:43:56.70892+00	1	79
147	2024-03-27 13:58:59.387361+00	1	80
148	2024-03-27 15:24:59.427483+00	1	81
149	2024-03-27 15:42:06.956937+00	1	82
150	2024-03-27 16:06:33.288577+00	1	83
151	2024-03-27 17:21:43.468284+00	1	84
152	2024-03-27 17:23:26.414136+00	1	85
153	2024-03-27 17:25:20.260874+00	1	86
154	2024-03-27 17:53:28.311244+00	1	87
155	2024-03-27 22:24:30.840465+00	1	88
156	2024-03-27 22:28:00.653663+00	1	89
157	2024-03-27 22:31:37.377852+00	1	90
158	2024-03-27 22:37:02.370345+00	1	91
159	2024-03-27 22:39:29.470199+00	1	92
160	2024-03-27 22:40:14.515213+00	1	93
161	2024-03-27 22:43:07.751706+00	1	94
162	2024-03-27 22:49:47.853652+00	1	95
163	2024-03-28 07:43:33.097238+00	1	96
164	2024-03-28 07:55:08.77188+00	1	97
165	2024-03-28 08:43:36.322872+00	1	98
166	2024-03-28 08:52:07.917982+00	1	99
167	2024-03-28 08:52:55.396532+00	1	100
168	2024-03-28 08:53:18.147886+00	1	101
169	2024-03-28 09:38:17.940732+00	1	102
170	2024-03-28 09:39:34.037681+00	1	103
171	2024-03-28 09:41:57.341028+00	1	104
172	2024-03-28 09:47:37.936874+00	1	105
173	2024-03-28 09:48:17.454612+00	1	106
174	2024-03-28 09:51:29.355587+00	1	107
175	2024-03-28 09:59:30.17896+00	1	108
176	2024-03-28 09:59:59.048801+00	1	109
177	2024-03-28 13:57:01.855697+00	1	110
178	2024-03-28 13:57:08.730154+00	1	111
179	2024-03-28 16:51:49.795386+00	1	112
180	2024-03-28 16:52:31.10287+00	5	13
181	2024-04-02 07:16:57.896055+00	1	113
182	2024-04-02 07:49:02.992892+00	1	114
183	2024-04-02 09:33:58.685825+00	1	115
184	2024-04-02 12:09:44.658718+00	1	116
185	2024-04-02 12:09:51.224745+00	1	117
186	2024-04-02 12:11:11.255103+00	1	118
187	2024-04-02 12:11:59.070989+00	1	119
188	2024-04-02 12:12:14.564973+00	1	120
189	2024-04-02 12:12:39.894655+00	1	121
190	2024-04-02 12:14:00.616689+00	1	122
191	2024-04-03 14:13:54.015444+00	1	123
192	2024-04-03 14:15:50.114224+00	1	124
193	2024-04-09 16:39:43.628968+00	1	125
194	2024-04-11 12:04:33.874245+00	1	126
195	2024-04-11 12:06:57.244369+00	1	127
196	2024-04-12 07:14:03.478998+00	1	128
197	2024-04-12 07:15:01.437205+00	1	129
198	2024-04-12 07:15:32.027728+00	1	130
199	2024-04-12 07:15:55.541206+00	1	131
200	2024-04-12 07:16:16.985677+00	1	132
201	2024-04-12 07:30:12.084341+00	1	133
234	2024-04-12 07:30:47.894169+00	1	134
235	2024-04-12 07:31:20.083622+00	1	135
236	2024-04-12 07:32:11.705434+00	1	136
237	2024-04-12 07:35:41.86052+00	1	137
238	2024-04-12 07:58:13.4636+00	1	138
239	2024-04-12 07:58:23.842293+00	1	139
240	2024-04-12 09:20:01.575669+00	1	140
241	2024-04-12 09:21:30.215663+00	1	141
242	2024-04-12 09:22:30.450676+00	1	142
243	2024-04-12 09:22:40.820644+00	1	143
244	2024-04-12 09:31:53.56419+00	1	144
245	2024-04-12 09:32:24.949632+00	1	145
246	2024-04-12 09:36:12.764113+00	1	146
247	2024-04-12 09:42:41.21613+00	1	147
248	2024-04-12 09:43:59.27052+00	1	148
281	2024-04-12 09:44:57.648584+00	1	149
282	2024-04-12 09:48:28.638059+00	1	150
283	2024-04-12 09:48:59.912787+00	1	151
284	2024-04-12 09:49:46.35485+00	1	152
317	2024-04-12 09:50:46.840655+00	1	153
318	2024-04-12 09:51:49.519795+00	1	154
319	2024-04-12 09:54:12.988442+00	1	155
320	2024-04-12 09:55:22.32256+00	1	156
321	2024-04-12 09:56:21.47957+00	1	157
322	2024-04-12 09:58:33.714548+00	1	158
323	2024-04-12 10:01:09.760563+00	1	159
324	2024-04-12 10:02:35.56769+00	1	160
325	2024-04-12 10:03:41.674089+00	1	161
326	2024-04-12 10:05:33.64405+00	1	162
327	2024-04-12 10:08:22.486091+00	1	163
328	2024-04-12 10:09:14.444003+00	1	164
329	2024-04-12 10:10:05.566252+00	1	165
330	2024-04-15 07:12:01.138141+00	1	166
331	2024-04-15 07:14:43.593512+00	1	167
332	2024-04-15 07:46:57.830521+00	1	168
333	2024-04-15 15:51:06.603277+00	1	169
334	2024-04-15 21:08:53.123837+00	1	170
335	2024-04-15 21:09:07.878736+00	1	171
336	2024-04-16 07:21:14.742487+00	1	172
337	2024-04-16 07:21:44.290778+00	1	173
338	2024-04-16 08:52:16.037252+00	1	174
339	2024-04-16 09:02:06.116552+00	1	175
340	2024-04-16 09:02:11.547465+00	1	176
341	2024-04-16 09:03:04.76846+00	1	177
342	2024-04-16 09:07:18.640414+00	1	178
343	2024-04-16 09:07:46.253402+00	1	179
344	2024-04-16 09:12:46.378509+00	1	180
345	2024-04-16 09:13:11.948563+00	1	181
346	2024-04-16 09:19:36.956944+00	1	182
347	2024-04-16 09:19:59.881046+00	1	183
348	2024-04-16 12:41:13.362113+00	1	184
349	2024-04-16 13:24:13.884319+00	1	185
350	2024-04-16 13:24:46.458636+00	1	186
382	2024-04-16 13:28:12.77323+00	1	187
383	2024-04-16 13:45:16.533357+00	1	188
384	2024-04-16 13:59:47.456884+00	1	189
385	2024-04-16 14:41:11.267629+00	1	190
386	2024-04-16 14:49:53.255881+00	1	191
387	2024-04-16 14:51:03.697734+00	1	192
388	2024-04-16 15:06:01.282511+00	1	193
389	2024-04-16 15:19:55.256747+00	1	194
390	2024-04-16 15:54:26.464765+00	1	195
391	2024-04-16 16:01:37.171621+00	1	196
392	2024-04-16 16:02:10.988682+00	1	197
425	2024-04-16 16:22:34.952466+00	1	198
426	2024-04-16 19:25:52.82796+00	1	199
427	2024-04-16 19:27:20.187806+00	1	200
428	2024-04-16 19:48:14.310101+00	1	201
429	2024-04-16 20:01:37.174457+00	1	202
430	2024-04-16 20:02:43.796605+00	1	203
431	2024-04-16 20:35:08.952509+00	1	204
432	2024-04-16 21:01:01.884417+00	1	205
433	2024-04-16 21:27:40.07357+00	1	206
434	2024-04-17 07:01:43.932924+00	1	207
435	2024-04-17 11:33:57.24129+00	1	208
436	2024-04-17 13:29:26.799658+00	1	209
437	2024-04-17 13:49:38.67894+00	1	210
438	2024-04-17 13:58:23.507197+00	1	211
439	2024-04-17 14:39:35.030763+00	1	212
440	2024-04-17 14:40:23.838998+00	1	213
441	2024-04-17 14:43:19.463946+00	1	214
442	2024-04-17 14:45:22.500472+00	1	215
443	2024-04-17 20:22:43.695356+00	1	216
444	2024-04-17 20:41:46.535545+00	1	217
445	2024-04-17 20:55:19.7189+00	1	218
446	2024-04-17 21:28:03.98619+00	1	219
447	2024-04-17 21:32:33.229932+00	1	220
480	2024-04-17 21:39:52.461537+00	1	221
481	2024-04-17 21:53:40.12064+00	1	222
482	2024-04-17 22:17:08.189152+00	1	223
483	2024-04-17 22:33:15.032964+00	1	224
484	2024-04-17 23:15:25.511661+00	1	225
517	2024-04-17 23:18:18.58569+00	1	226
518	2024-04-18 05:23:17.422429+00	1	227
519	2024-04-18 05:24:21.552213+00	1	228
520	2024-04-18 05:25:29.339096+00	1	229
521	2024-04-18 05:29:32.128128+00	1	230
522	2024-04-18 05:33:25.711727+00	1	231
523	2024-04-18 05:34:01.070618+00	1	232
524	2024-04-18 05:38:04.53945+00	1	233
525	2024-04-18 05:41:26.619159+00	1	234
526	2024-04-18 06:35:35.74589+00	1	235
527	2024-04-18 06:53:06.393302+00	1	236
528	2024-04-18 06:54:17.032859+00	11	1
529	2024-04-18 07:43:23.359068+00	15	1
530	2024-04-18 07:43:27.047477+00	14	1
531	2024-04-18 07:44:02.377909+00	11	2
532	2024-04-18 07:44:19.264774+00	12	1
533	2024-04-18 07:46:05.408648+00	1	237
534	2024-04-18 07:47:58.517634+00	15	2
535	2024-04-18 07:48:57.079488+00	11	3
536	2024-04-18 07:53:13.261217+00	14	2
537	2024-04-18 07:55:47.831253+00	15	3
538	2024-04-18 07:58:16.105265+00	14	3
539	2024-04-18 07:59:36.214082+00	11	4
540	2024-04-18 08:01:30.26284+00	12	2
541	2024-04-18 08:04:55.601826+00	11	5
542	2024-04-18 08:05:02.181417+00	15	4
543	2024-04-18 08:07:11.412634+00	15	5
544	2024-04-18 08:13:38.435157+00	14	4
545	2024-04-18 08:23:06.402832+00	11	6
546	2024-04-18 08:39:37.43015+00	11	7
547	2024-04-18 08:50:59.973069+00	12	3
548	2024-04-19 08:38:43.656282+00	1	238
549	2024-04-19 13:05:47.861184+00	1	239
550	2024-04-19 13:11:10.629865+00	1	240
551	2024-05-10 10:44:50.589153+00	1	241
552	2024-06-06 06:20:51.972546+00	1	242
553	2024-06-06 06:41:56.039242+00	1	243
554	2024-06-06 07:01:26.066791+00	1	244
555	2024-06-06 07:01:59.474392+00	1	245
556	2024-06-06 08:04:47.030745+00	1	246
557	2024-06-06 12:23:22.88469+00	1	247
558	2024-06-11 07:34:01.835889+00	1	248
559	2024-06-11 08:53:34.890683+00	1	249
560	2024-06-11 09:20:06.887703+00	1	250
561	2024-07-04 07:44:26.508956+00	1	251
562	2024-07-09 08:38:27.313374+00	1	252
563	2024-07-09 08:39:44.725512+00	1	253
564	2024-07-11 13:32:51.690895+00	1	254
\.


--
-- Data for Name: ponderful_mcda_criteria; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_criteria (id, name, unit_of_measure, name_en, name_fr, unit_of_measure_en, unit_of_measure_fr) FROM stdin;
2	Amphibian species	Number of species	Amphibian species	Espèces d'amphibiens	Number of species	Nombre d'espèces
12	Aquatic plant species	Number of species	Aquatic plant species	Espèces de plantes aquatiques	Number of species	Nombre d'espèces
14	Dragonflies	Number of species	Dragonflies	Libellules	Number of species	Nombre d'espèces
15	Macroinvertebrates	Number of species	Macroinvertebrates	Macroinvertébrés	Number of species	Nombre d'espèces
16	Total biodiversity	Number of species	Total biodiversity	Biodiversité totale	Number of species	Nombre d'espèces
17	Capacity of Carbon storage	kg of CO2 equivalents /pondscape /year	Capacity of Carbon storage	Capacité de stockage du carbone	kg of CO2 equivalents /pondscape /year	kg d'équivalents CO2 /paysage d'étang /an
18	GHG emission (CH4, CO2, N2O)	kg of CO2 equivalents /pondscape /year	GHG emission (CH4, CO2, N2O)	Émissions de GES (CH4, CO2, N2O)	kg of CO2 equivalents /pondscape /year	kg d'équivalents CO2 /paysage d'étang /an
19	Water quantity	Total water volume (m3)	Water quantity	Quantité d'eau	Total water volume (m3)	Volume d'eau total (m3)
20	Water quality	Trophic status	Water quality	Qualité de l'eau	Trophic status	Indice qualitatif
\.


--
-- Data for Name: ponderful_mcda_criteria_params; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_criteria_params (id, weight, rank, criteria_id, study_area_id, user_id, weight_range, weight_percentage, analysis_run_id) FROM stdin;
358	8	3	2	13	1	{}	34.04255319148936	72
359	3	8	12	13	1	{}	12.76595744680851	72
376	5	1	2	13	1	{}	21.27659574468085	80
339	5	2	2	13	5	{}	17.857142857142858	58
341	6	2	2	13	5	{}	21.428571428571427	59
389	8.777777777777779	4	12	13	1	{}	37.35224586288417	100
343	5	1	2	13	5	{}	17.857142857142858	60
345	4	2	2	13	5	{}	14.285714285714285	61
349	11	2	2	13	5	{}	39.285714285714285	63
372	3	10	15	13	1	{}	12.76595744680851	77
351	11	3	2	13	5	{}	39.285714285714285	64
350	2	11	12	13	5	{}	7.142857142857142	63
393	2	13	15	13	1	{}	8.51063829787234	101
404	2	14	15	13	1	{}	8.51063829787234	107
340	2	5	12	13	5	{}	7.142857142857142	58
408	6	7	15	13	1	{}	25.53191489361702	108
415	1	1	15	13	1	{}	4.25531914893617	113
395	8	4	12	13	1	{}	34.04255319148936	102
398	7.6	6	12	13	1	{}	32.34042553191489	104
386	4	2	2	13	1	{}	17.02127659574468	99
430	1	3	12	13	1	{}	4.25531914893617	121
379	4	8	12	13	1	{}	17.02127659574468	81
342	2	6	12	13	5	{}	7.142857142857142	59
344	1	5	12	13	5	{}	3.571428571428571	60
390	2	11	15	13	1	{}	8.51063829787234	100
373	5	2	2	13	5	{}	17.857142857142858	79
374	2.333333333333333	4	12	13	5	{}	8.333333333333332	79
384	12	3	2	13	6	{}	80	94
385	3	12	12	13	6	{}	20	94
329	10	3	2	13	1	{}	42.5531914893617	52
383	5	7	12	13	1	{}	21.27659574468085	93
360	14	2	2	13	1	{}	59.57446808510638	73
375	2	5	14	13	5	{}	7.142857142857142	79
369	3	6	12	13	1	{}	12.76595744680851	76
365	3	5	12	13	1	{}	12.76595744680851	74
396	1	11	15	13	1	{}	4.25531914893617	102
364	5	3	2	13	1	{}	21.27659574468085	74
394	11	1	2	13	1	{}	46.808510638297875	102
356	4	2	2	13	5	{}	14.285714285714285	66
368	6	3	2	13	1	{}	25.53191489361702	76
399	2	12	15	13	1	{}	8.51063829787234	104
402	14	2	2	13	1	{}	59.57446808510638	107
405	12	1	2	13	1	{}	51.06382978723404	108
377	1	5	12	13	1	{}	4.25531914893617	80
382	7	5	2	13	1	{}	29.78723404255319	93
387	2	4	12	13	1	{}	8.51063829787234	99
367	2	5	12	13	1	{}	8.51063829787234	75
413	1	1	2	13	1	{}	4.25531914893617	113
392	9.727272727272727	5	12	13	1	{}	41.392649903288195	101
397	12	2	2	13	1	{}	51.06382978723404	104
378	8	4	2	13	1	{}	34.04255319148936	81
380	8	8	2	13	1	{}	34.04255319148936	91
330	3	10	12	13	1	{}	12.76595744680851	52
371	7.428571428571429	5	12	13	1	{}	31.61094224924012	77
407	12	1	14	13	1	{}	47.82608695652174	108
381	8	8	12	13	1	{}	34.04255319148936	91
406	9	4	12	13	1	{}	38.297872340425535	108
370	10	3	2	13	1	{}	42.5531914893617	77
347	8	8	2	13	1	{}	34.04255319148936	62
414	1	1	12	13	1	{}	4.25531914893617	113
366	5	2	2	13	1	{}	21.27659574468085	75
331	5	2	2	13	5	{}	17.857142857142858	54
333	11	1	2	13	5	{}	39.285714285714285	56
409	1	12	16	13	1	{}	2.7027027027027026	108
391	13	2	2	13	1	{}	55.319148936170215	101
336	11	2	2	13	5	{}	39.285714285714285	57
400	8	8	2	13	9	{}	50	106
401	8	8	12	13	9	{}	50	106
410	8	3	16	13	10	{}	72.72727272727273	110
411	3	8	19	13	10	{}	27.27272727272727	110
412	8	8	12	13	10	{}	100	112
418	13	1	2	13	1	{}	55.319148936170215	115
455	5	3	12	13	1	{}	21.27659574468085	132
432	2	4	12	13	1	{}	8.51063829787234	122
466	1	1	15	13	1	{}	4.25531914893617	133
468	1	1	12	13	1	{}	4.25531914893617	134
420	1	13	15	13	1	{}	4.25531914893617	115
445	2	2	2	13	1	{}	8.51063829787234	128
475	2	1	12	13	1	{}	8.51063829787234	137
434	1	4	12	13	1	{}	4.25531914893617	123
470	1	1	12	13	1	{}	4.25531914893617	135
447	3	4	12	13	1	{}	12.76595744680851	129
477	2	1	12	13	1	{}	8.51063829787234	138
479	2	2	2	13	1	{}	8.51063829787234	139
478	2	1	15	13	1	{}	8.51063829787234	138
453	5	2	15	13	1	{}	21.27659574468085	131
463	1	1	12	13	1	{}	4.25531914893617	132
416	5	3	2	13	1	{}	21.27659574468085	114
452	2	5	12	13	1	{}	8.51063829787234	131
448	3	1	2	13	1	{}	12.76595744680851	130
451	5	2	2	13	1	{}	21.27659574468085	131
457	2	3	12	13	1	{}	8.51063829787234	132
464	1	1	2	13	1	{}	4.25531914893617	133
481	1	1	2	13	1	{}	4.25531914893617	140
403	10.75	5	12	13	1	{}	45.744680851063826	107
480	2	2	12	13	1	{}	8.51063829787234	139
484	1	1	2	13	1	{}	4.25531914893617	141
427	3	1	2	13	1	{}	12.76595744680851	120
487	5	1	2	13	1	{}	21.27659574468085	142
419	9	5	12	13	1	{}	38.297872340425535	115
424	2	6	12	13	1	{}	8.51063829787234	118
490	1	1	2	13	1	{}	4.25531914893617	143
431	4	2	2	13	1	{}	17.02127659574468	122
438	2	4	12	13	1	{}	8.51063829787234	125
483	1	1	15	13	1	{}	4.25531914893617	140
425	5	1	2	13	1	{}	21.27659574468085	119
422	3	5	12	13	1	{}	12.76595744680851	117
472	1	1	2	13	1	{}	4.25531914893617	136
437	4	2	2	13	1	{}	17.02127659574468	125
486	1	1	15	13	1	{}	4.25531914893617	141
436	1	4	12	13	1	{}	4.25531914893617	124
489	1	5	15	13	1	{}	4.25531914893617	142
465	1	1	12	13	1	{}	4.25531914893617	133
735	11	4	12	13	1	{}	46.808510638297875	391
439	4	2	2	13	1	{}	17.02127659574468	126
482	1	1	12	13	1	{}	4.25531914893617	140
440	2	4	12	13	1	{}	8.51063829787234	126
433	4	1	2	13	1	{}	17.02127659574468	123
488	3	3	12	13	1	{}	12.76595744680851	142
435	4	1	2	13	1	{}	17.02127659574468	124
449	2	2	12	13	1	{}	8.51063829787234	130
473	1	1	12	13	1	{}	4.25531914893617	136
421	5	3	2	13	1	{}	21.27659574468085	117
417	3	5	12	13	1	{}	12.76595744680851	114
459	3	1	2	13	1	{}	12.76595744680851	132
423	6	2	2	13	1	{}	25.53191489361702	118
471	1	1	15	13	1	{}	4.25531914893617	135
458	3	2	15	13	1	{}	12.76595744680851	132
591	5	3	15	13	1	{}	21.27659574468085	235
454	3	5	2	13	1	{}	12.76595744680851	132
429	3	1	2	13	1	{}	12.76595744680851	121
460	3	1	12	13	1	{}	12.76595744680851	132
474	1	2	2	13	1	{}	4.25531914893617	137
446	4	3	2	13	1	{}	17.02127659574468	129
476	1	2	2	13	1	{}	4.25531914893617	138
388	11	2	2	13	1	{}	46.808510638297875	100
462	1	1	2	13	1	{}	4.25531914893617	132
456	3	2	2	13	1	{}	12.76595744680851	132
426	1	5	12	13	1	{}	4.25531914893617	119
469	1	1	2	13	1	{}	4.25531914893617	135
428	1	3	12	13	1	{}	4.25531914893617	120
450	1	3	15	13	1	{}	4.25531914893617	130
512	9	2	12	13	1	{}	38.297872340425535	148
500	1	1	12	13	1	{}	4.25531914893617	145
531	5	1	15	13	1	{}	21.27659574468085	166
519	1	6	15	13	1	{}	4.25531914893617	153
498	1	1	15	13	1	{}	4.25531914893617	145
501	1	1	15	13	1	{}	4.25531914893617	145
515	1	10	16	13	1	{}	2.7027027027027026	148
504	2	1	15	13	1	{}	8.51063829787234	146
537	2	11	12	13	1	{}	8.51063829787234	176
508	15	1	2	13	1	{}	63.829787234042556	147
496	1	1	2	13	1	{}	4.25531914893617	145
503	2	1	12	13	1	{}	8.51063829787234	146
511	10	1	2	13	1	{}	42.5531914893617	148
549	11.8	4	12	13	1	{}	50.21276595744681	183
551	12	2	2	13	1	{}	51.06382978723404	185
546	4	4	12	13	1	{}	17.02127659574468	182
507	1	1	15	13	1	{}	4.25531914893617	147
524	3	1	12	13	1	{}	12.76595744680851	161
493	1	1	2	13	1	{}	4.25531914893617	144
510	1	15	14	13	1	{}	3.985507246376812	147
534	4	2	2	13	1	{}	17.02127659574468	174
529	5	1	2	13	1	{}	21.27659574468085	166
514	3	8	15	13	1	{}	12.76595744680851	148
461	1	3	15	13	1	{}	4.25531914893617	132
734	14	1	2	13	1	{}	59.57446808510638	391
526	2	1	12	13	1	{}	8.51063829787234	162
492	1	1	15	13	1	{}	4.25531914893617	143
553	13	2	2	13	1	{}	55.319148936170215	186
539	5	3	12	13	1	{}	21.27659574468085	179
550	3	13	15	13	1	{}	12.76595744680851	183
530	1	5	12	13	1	{}	4.25531914893617	166
556	13	1	2	13	1	{}	55.319148936170215	200
532	3	2	2	13	1	{}	12.76595744680851	173
559	11	1	2	13	1	{}	46.808510638297875	200
547	1	7	14	13	1	{}	3.985507246376812	182
552	2	12	12	13	1	{}	8.51063829787234	185
497	1	1	12	13	1	{}	4.25531914893617	145
533	2	3	12	13	1	{}	8.51063829787234	173
520	5	1	2	13	1	{}	21.27659574468085	155
589	5	3	2	13	1	{}	21.27659574468085	235
505	1	1	2	13	1	{}	4.25531914893617	147
525	1	2	2	13	1	{}	4.25531914893617	162
491	1	1	12	13	1	{}	4.25531914893617	143
527	2	2	2	13	1	{}	8.51063829787234	165
513	8	3	14	13	1	{}	31.884057971014496	148
541	11	1	2	13	5	{}	39.285714285714285	180
542	9	3	12	13	5	{}	32.142857142857146	180
509	6	10	12	13	1	{}	25.53191489361702	147
518	5	2	12	13	1	{}	21.27659574468085	153
558	1	13	15	13	1	{}	4.25531914893617	200
557	11	3	12	13	1	{}	46.808510638297875	200
517	6	1	2	13	1	{}	25.53191489361702	153
554	2	13	12	13	1	{}	8.51063829787234	186
560	9	3	12	13	1	{}	38.297872340425535	200
543	1	11	14	13	5	{}	3.571428571428571	180
544	7	5	15	13	5	{}	25	180
561	1	11	15	13	1	{}	4.25531914893617	200
502	1	2	2	13	1	{}	4.25531914893617	146
590	3	5	12	13	1	{}	12.76595744680851	235
540	3	5	15	13	1	{}	12.76595744680851	179
499	1	1	2	13	1	{}	4.25531914893617	145
545	7	1	2	13	1	{}	29.78723404255319	182
523	1	3	2	13	1	{}	4.25531914893617	161
516	6	5	17	13	1	{}	14.634146341463413	148
506	1	1	12	13	1	{}	4.25531914893617	147
535	2	4	12	13	1	{}	8.51063829787234	174
538	3	5	2	13	1	{}	12.76595744680851	179
528	2	2	12	13	1	{}	8.51063829787234	165
536	11	2	2	13	1	{}	46.808510638297875	176
522	1	5	15	13	1	{}	4.25531914893617	155
548	13	3	2	13	1	{}	55.319148936170215	183
733	2	5	12	13	1	{}	8.51063829787234	389
639	3	1	2	13	1	{}	12.76595744680851	322
660	2	11	12	13	1	{}	8.51063829787234	347
638	1	3	12	13	1	{}	4.25531914893617	321
521	3	3	12	13	1	{}	12.76595744680851	155
495	1	1	15	13	1	{}	4.25531914893617	144
630	2	4	12	13	1	{}	8.51063829787234	317
646	3	4	12	13	1	{}	12.76595744680851	327
657	2	3	12	13	1	{}	8.51063829787234	335
642	3	3	12	13	1	{}	12.76595744680851	324
654	1	4	12	13	1	{}	4.25531914893617	332
649	5	12	15	13	1	{}	21.27659574468085	329
740	2	5	12	13	1	{}	8.51063829787234	426
595	2	3	12	13	1	{}	8.51063829787234	240
652	2	13	15	13	1	{}	8.51063829787234	331
745	3	3	2	13	1	{}	12.76595744680851	429
597	2	4	12	13	1	{}	8.51063829787234	284
742	2	4	12	13	1	{}	8.51063829787234	428
729	2	3	12	13	1	{}	8.51063829787234	384
632	1	3	15	13	1	{}	4.25531914893617	318
592	4	3	2	13	1	{}	17.02127659574468	237
593	3	4	12	13	1	{}	12.76595744680851	237
747	8	4	2	13	1	{}	34.04255319148936	430
696	2	4	12	13	1	{}	8.51063829787234	349
594	3	2	2	13	1	{}	12.76595744680851	240
643	10	6	2	13	1	{}	42.5531914893617	325
651	8.636363636363637	6	12	13	1	{}	36.750483558994205	331
744	15	5	12	13	1	{}	63.829787234042556	428
746	3	3	12	13	1	{}	12.76595744680851	429
749	3	3	2	13	1	{}	12.76595744680851	431
694	3	3	2	13	1	{}	12.76595744680851	348
751	4	3	2	13	1	{}	17.02127659574468	432
647	12	5	2	13	1	{}	51.06382978723404	329
693	8	8	12	13	1	{}	34.04255319148936	347
748	4	8	12	13	1	{}	17.02127659574468	430
750	3	3	12	13	1	{}	12.76595744680851	431
753	3	2	2	13	1	{}	12.76595744680851	433
755	2	1	2	13	1	{}	8.51063829787234	434
736	1	14	14	13	1	{}	3.985507246376812	391
633	3	2	2	13	1	{}	12.76595744680851	319
635	3	5	2	13	1	{}	12.76595744680851	320
752	3	4	12	13	1	{}	12.76595744680851	432
645	4	3	2	13	1	{}	17.02127659574468	327
637	3	1	2	13	1	{}	12.76595744680851	321
754	2	3	12	13	1	{}	8.51063829787234	433
653	1	4	2	13	1	{}	4.25531914893617	332
738	13	1	12	13	1	{}	55.319148936170215	425
656	3	2	2	13	1	{}	12.76595744680851	335
737	1	13	2	13	1	{}	4.25531914893617	425
596	4	2	2	13	1	{}	17.02127659574468	284
658	8	8	2	13	1	{}	34.04255319148936	345
659	11	2	2	13	1	{}	46.808510638297875	347
641	3	3	2	13	1	{}	12.76595744680851	324
629	4	2	2	13	1	{}	17.02127659574468	317
692	8	8	2	13	1	{}	34.04255319148936	347
731	2	3	12	13	1	{}	8.51063829787234	386
636	5	3	12	13	1	{}	21.27659574468085	320
730	3	2	2	13	1	{}	12.76595744680851	386
728	3	2	2	13	1	{}	12.76595744680851	384
732	5	2	2	13	1	{}	21.27659574468085	389
739	5	2	2	13	1	{}	21.27659574468085	426
741	4	2	2	13	1	{}	17.02127659574468	428
467	1	1	2	13	1	{}	4.25531914893617	134
631	3	1	12	13	1	{}	12.76595744680851	318
743	5	15	2	13	1	{}	21.27659574468085	428
634	2	3	12	13	1	{}	8.51063829787234	319
650	13	2	2	13	1	{}	55.319148936170215	331
648	2.571428571428571	11	12	13	1	{}	10.94224924012158	329
655	4	1	15	13	1	{}	17.02127659574468	332
695	4	2	2	13	1	{}	17.02127659574468	349
640	1	3	12	13	1	{}	4.25531914893617	322
861	13	13	2	13	1	{}	55.319148936170215	522
862	14	14	12	13	1	{}	59.57446808510638	522
756	1	2	12	13	1	{}	4.25531914893617	434
817	8	8	2	13	1	{}	34.04255319148936	482
769	5	2	2	13	1	{}	21.27659574468085	441
779	3	1	2	13	1	{}	12.76595744680851	445
818	2	2	2	13	1	{}	8.51063829787234	483
815	2	2	2	13	1	{}	8.51063829787234	480
765	4	1	14	13	1	{}	15.942028985507248	439
776	2	14	17	13	1	{}	4.878048780487805	443
816	2	2	2	13	1	{}	8.51063829787234	481
863	14	14	2	13	1	{}	59.57446808510638	524
854	1	8	15	13	1	{}	4.25531914893617	518
864	2.625	13	12	13	1	{}	11.170212765957446	524
780	1	3	12	13	1	{}	4.25531914893617	445
819	3	3	12	13	1	{}	12.76595744680851	484
758	8	3	12	13	1	{}	34.04255319148936	436
762	8	8	12	13	1	{}	34.04255319148936	437
774	2.083333333333333	13	12	13	1	{}	8.865248226950353	443
866	7.5	10	17	13	1	{}	18.29268292682927	524
763	3	2	2	13	1	{}	12.76595744680851	439
865	14	14	15	13	1	{}	59.57446808510638	524
773	14	2	2	13	1	{}	59.57446808510638	443
867	6	6	18	13	1	{}	14.634146341463413	524
775	10.75	5	15	13	1	{}	45.744680851063826	443
759	10	1	15	13	1	{}	42.5531914893617	436
782	2	2	2	13	1	{}	8.51063829787234	447
778	2	3	12	13	1	{}	8.51063829787234	444
781	3	3	2	13	1	{}	12.76595744680851	446
768	1	3	15	13	1	{}	4.25531914893617	440
777	3	2	2	13	1	{}	12.76595744680851	444
771	4	1	2	13	1	{}	17.02127659574468	442
757	9	2	2	13	1	{}	38.297872340425535	436
761	8	8	2	13	1	{}	34.04255319148936	437
852	8	1	2	13	1	{}	34.04255319148936	518
877	12	12	17	13	11	{}	47.129909365558916	531
881	3.6666666666666665	8	17	13	12	{}	19.81981981981982	532
853	6	3	12	13	1	{}	25.53191489361702	518
859	14	14	2	13	1	{}	59.57446808510638	521
857	6	3	17	13	1	{}	14.634146341463413	519
760	1	10	17	13	1	{}	2.4390243902439024	436
855	3	6	17	13	1	{}	7.317073170731707	518
858	3	6	18	13	1	{}	7.317073170731707	519
860	4	4	12	13	1	{}	17.02127659574468	521
764	1	4	12	13	1	{}	4.25531914893617	439
856	6	3	18	13	1	{}	14.634146341463413	518
767	3	1	12	13	1	{}	12.76595744680851	440
770	2	5	12	13	1	{}	8.51063829787234	441
766	1	3	2	13	1	{}	4.25531914893617	440
772	1	4	12	13	1	{}	4.25531914893617	442
485	1	1	12	13	1	{}	4.25531914893617	141
873	7.5	12	15	13	15	{}	15	529
494	1	1	12	13	1	{}	4.25531914893617	144
644	6	10	12	13	1	{}	25.53191489361702	325
886	8	8	17	13	14	{}	25	530
872	10.75	11	14	13	15	{}	17.768595041322314	529
876	14	14	16	13	11	{}	87.5	531
869	12	12	12	13	11	{}	75	528
875	10	10	17	13	15	{}	16.666666666666664	529
887	8	8	18	13	14	{}	25	530
878	7.5	13	19	13	11	{}	15.789473684210526	531
879	14	14	20	13	11	{}	29.47368421052631	531
880	6	6	2	13	12	{}	32.142857142857146	532
882	9	9	18	13	12	{}	48.64864864864865	532
888	13	13	2	13	15	{}	21.666666666666668	529
868	5	5	2	13	11	{}	27.77777777777778	528
870	7.5	12	2	13	15	{}	12.5	529
885	15	15	15	13	14	{}	45.45454545454545	530
884	15	15	12	13	14	{}	46.875	530
883	15	15	2	13	14	{}	46.875	530
874	14	14	16	13	15	{}	43.75	529
890	9	11	15	13	15	{}	18	529
897	5.3076923076923075	11	12	13	11	{}	33.17307692307692	535
892	10	10	18	13	15	{}	16.666666666666664	529
889	9	11	12	13	15	{}	15	529
895	15	15	17	13	11	{}	58.91238670694865	531
922	9	9	12	13	15	{}	15	537
944	1	1	2	13	11	{}	5.555555555555555	541
899	15	15	17	13	11	{}	58.91238670694865	535
945	15	15	12	13	11	{}	93.75	541
930	4.5	7	12	13	12	{}	24.324324324324326	540
931	6	6	17	13	12	{}	32.432432432432435	540
932	8	8	18	13	12	{}	43.24324324324324	540
918	15	15	15	13	14	{}	45.45454545454545	538
909	8	8	17	13	14	{}	25	536
907	15	15	12	13	14	{}	46.875	536
912	8	8	12	13	14	{}	25	538
910	8	8	18	13	14	{}	25	536
908	15	15	15	13	14	{}	45.45454545454545	536
914	15	15	17	13	14	{}	46.875	538
934	1	1	12	13	14	{}	3.125	538
928	1	1	17	13	14	{}	3.125	538
911	8	8	2	13	14	{}	25	538
916	15	15	2	13	14	{}	46.875	538
900	15	15	2	13	14	{}	46.875	536
919	8	8	17	13	14	{}	25	538
927	15	15	15	13	14	{}	45.45454545454545	538
906	15	15	2	13	14	{}	46.875	536
905	15	15	18	13	14	{}	46.875	536
903	8	8	15	13	14	{}	24.242424242424242	536
935	1	1	15	13	14	{}	3.0303030303030303	538
943	14	14	16	13	11	{}	87.5	541
946	7.5	12	2	13	15	{}	12.5	543
923	13	13	16	13	15	{}	40.625	537
937	15	15	18	13	14	{}	46.875	538
949	15	15	2	13	14	{}	46.875	544
950	15	15	17	13	14	{}	46.875	544
871	10.75	11	12	13	15	{}	17.916666666666668	529
947	10	10	12	13	15	{}	16.666666666666664	543
939	6.142857142857143	10	12	13	15	{}	10.238095238095239	537
940	13	13	17	13	15	{}	21.666666666666668	537
941	6	6	18	13	15	{}	10	537
959	14	14	2	13	15	{}	23.333333333333332	543
933	1	1	2	13	14	{}	3.125	538
917	15	15	12	13	14	{}	46.875	538
936	15	15	17	13	14	{}	46.875	538
920	8	8	18	13	14	{}	25	538
952	8	8	12	13	14	{}	25	544
915	15	15	18	13	14	{}	46.875	538
913	8	8	15	13	14	{}	24.242424242424242	538
953	8	8	17	13	14	{}	25	544
929	1	1	18	13	14	{}	3.125	538
951	8	8	2	13	14	{}	25	544
960	12	12	12	13	15	{}	20	543
896	2	2	2	13	11	{}	11.11111111111111	535
898	3.1538461538461537	13	15	13	11	{}	17.52136752136752	535
894	12	12	12	13	11	{}	75	531
924	15	15	2	13	11	{}	83.33333333333334	539
921	10	10	2	13	15	{}	16.666666666666664	537
948	14	14	17	13	15	{}	23.333333333333332	543
938	4.428571428571429	11	2	13	15	{}	7.380952380952381	537
902	8	8	12	13	14	{}	25	536
904	15	15	17	13	14	{}	46.875	536
926	15	15	12	13	14	{}	46.875	538
901	8	8	2	13	14	{}	25	536
954	8	8	18	13	14	{}	25	544
955	8	8	2	13	14	{}	25	544
925	15	15	2	13	14	{}	46.875	538
956	8	8	12	13	14	{}	25	544
957	8	8	17	13	14	{}	25	544
958	8	8	18	13	14	{}	25	544
893	5.666666666666667	14	2	13	11	{}	31.48148148148148	531
992	10.75	11	17	13	1	{}	26.21951219512195	555
993	10	10	18	13	1	{}	24.390243902439025	555
964	13	13	18	13	11	{}	63.106796116504846	545
962	4.6	10	2	13	11	{}	25.555555555555554	545
963	3	3	15	13	11	{}	16.666666666666664	545
942	2	2	2	13	11	{}	11.11111111111111	541
969	12	12	2	13	11	{}	66.66666666666666	546
970	6	6	15	13	11	{}	33.33333333333333	546
961	7.5	13	17	13	15	{}	12.5	543
891	9	11	17	13	15	{}	15	529
965	12	12	2	13	15	{}	20	543
966	7.5	13	12	13	15	{}	12.5	543
967	14	14	17	13	15	{}	23.333333333333332	543
968	14	14	18	13	15	{}	23.333333333333332	543
971	15	15	2	13	15	{}	25	543
972	15	15	12	13	15	{}	25	543
973	15	15	17	13	15	{}	25	543
974	15	15	18	13	15	{}	25	543
976	13	13	12	13	1	{}	55.319148936170215	548
1002	10	10	18	13	1	{}	24.390243902439025	561
977	2	2	2	13	1	{}	8.51063829787234	549
978	4	4	12	13	1	{}	17.02127659574468	549
983	2.4444444444444446	13	14	13	1	{}	9.742351046698875	552
979	4	4	2	13	1	{}	17.02127659574468	551
987	7.363636363636363	10	14	13	1	{}	29.34782608695652	553
991	14	14	15	13	1	{}	59.57446808510638	555
1005	4	4	14	13	1	{}	15.942028985507248	562
980	6	6	12	13	1	{}	25.53191489361702	551
989	14	14	2	13	1	{}	59.57446808510638	555
990	4.25	13	12	13	1	{}	18.085106382978726	555
997	12	12	17	13	1	{}	29.268292682926827	556
998	12	12	18	13	1	{}	29.268292682926827	556
999	13	13	2	13	1	{}	55.319148936170215	561
984	5	5	17	13	1	{}	12.195121951219512	552
1000	13	13	12	13	1	{}	55.319148936170215	561
996	10.333333333333334	13	15	13	1	{}	43.97163120567376	556
988	4	4	17	13	1	{}	9.75609756097561	553
1003	15	15	2	13	1	{}	63.829787234042556	562
1004	6.090909090909091	11	12	13	1	{}	25.918762088974855	562
994	15	15	2	13	1	{}	63.829787234042556	556
995	5.666666666666667	14	12	13	1	{}	24.113475177304966	556
981	14	14	2	13	1	{}	59.57446808510638	552
982	3.888888888888889	12	12	13	1	{}	16.548463356973993	552
985	15	15	2	13	1	{}	63.829787234042556	553
1006	13	13	2	13	1	{}	55.319148936170215	563
1001	5	12	17	13	1	{}	12.195121951219512	561
1007	5.5	10	12	13	1	{}	23.404255319148938	563
1008	5	5	15	13	1	{}	21.27659574468085	563
986	2.2727272727272725	14	12	13	1	{}	9.671179883945841	553
975	2	2	2	13	1	{}	8.51063829787234	548
\.


--
-- Data for Name: ponderful_mcda_customuser; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_customuser (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined, organization) FROM stdin;
13	pbkdf2_sha256$320000$OPQSyhS5EoQ8lxFC7T5CT9$VXS3VQBQjBpMk14nhUyh6IcjuPbVFIyR4BubuGhqv8s=	\N	f	user3			lotfian.maryam@gmail.com	f	t	2024-04-17 12:02:50.977666+00	parc
2	pbkdf2_sha256$320000$ghXoZMZYuLCrQxcFuH9tp8$n5cJ3h+P4cNGgtL9x1pydIZrKbfwzdqAR0YnL23yyUE=	\N	f	test				f	t	2023-12-12 16:55:58.63677+00	none
16	pbkdf2_sha256$320000$m77Fq72SQibPMUP6Zax6u3$sG/WpFExNQoVT5vgTKglW5BREMtDUfxnNez3sHQHflo=	\N	f	user6			lotfian.maryam@gmail.com	f	t	2024-04-17 12:03:45.77979+00	parc
3	pbkdf2_sha256$320000$mr8Gn5ejEbf3aBh5PQE3B2$6hlBjiSxpmKaQsQBrFpe4y7mILeaO4LOuEPUemKI95U=	2024-01-03 10:02:45.086166+00	f	mary			lotfian.maryam@gmail.com	f	t	2024-01-03 10:02:41.408543+00	none
6	pbkdf2_sha256$320000$kWvY4au12ZnRMBmDtO94MF$iYhrtGKkTJJcBJmxIUvnFG52mecTBKula44kAPwekOw=	2024-03-18 14:37:02.652404+00	f	test24			lotfian.maryam@gmail.com	f	t	2024-03-18 14:36:11.465821+00	nothing
7	pbkdf2_sha256$320000$NtTv11bbctXjduLFx888Mw$XcENnviVPK/lDoHaeJeOv/aDQLMDOmhXsoBlkXVtdFI=	2024-03-18 15:49:00.164746+00	f	tre			lotfian.maryam@gmail.com	f	t	2024-03-18 15:48:52.730738+00	nothing
15	pbkdf2_sha256$320000$jym1wNcvuSGflIMRrAo0dz$M/ewo44psuqPbHRDQWzh36W6lt1iHZqt1YA8H5iR7QI=	2024-04-18 07:43:19.636026+00	f	user5			lotfian.maryam@gmail.com	f	t	2024-04-17 12:03:26.825158+00	parc
14	pbkdf2_sha256$320000$HSStlP31ugFqkPX8skcZYm$t0fRbHO6iVgI3554CAyU+fQhz+xZOmvIbKguCNl/fWg=	2024-04-18 07:43:21.944712+00	f	user4			lotfian.maryam@gmail.com	f	t	2024-04-17 12:03:08.912027+00	parc
11	pbkdf2_sha256$320000$H6U5vCgCwipScOzk8q3kF7$0l2/cbtV2HBAssEF5x8YpJwvUxPPC0fibJYlkeIT0JE=	2024-04-18 07:43:33.459911+00	f	user1			lotfian.maryam@gmail.com	f	t	2024-04-17 12:00:55.825083+00	parc
12	pbkdf2_sha256$320000$blihylN26od8sVvgLx0ajY$UlSxeeo+YZVSIy/+YSd1gR7w1A5Ymm0H5nYptrSEXQE=	2024-04-18 07:44:09.661841+00	f	user2			lotfian.maryam@gmail.com	f	t	2024-04-17 12:02:29.444406+00	parc
8	pbkdf2_sha256$320000$lbSbIHqDIGy04wGGr1Q18N$FyooZk8UeAASik/ddP750zuNqKfIimEtLPUSr7sFTD8=	\N	f	Tuba			tbo@ecos.au.dk	f	t	2024-03-21 09:28:14.982794+00	Tuba Bucak Onay
9	pbkdf2_sha256$320000$wm9X6QEpuVS2hURz7pJn8E$GDbdtP320BPVId7Sin/fQQLoA1zvjOHMlJIYRTWbdf8=	2024-03-21 09:29:24.402578+00	f	tubabucak			tbo@ecos.au.dk	f	t	2024-03-21 09:29:18.870025+00	AU
10	pbkdf2_sha256$320000$dcRlGqBIQgUmzb9He3OIVW$2VR8RpCeg7tgsaoPyuSydBjf/+cknGTSIusfw/SJ3Mo=	2024-03-22 13:52:17.514205+00	f	beat.oertli			beat.oertli@hesge.ch	f	t	2024-03-22 13:52:02.703413+00	HES-SO HEPIA
1	pbkdf2_sha256$320000$6JUs85NruDs01JgaFWrmd8$d/rDqU5TiMuNVH0SjqEU3ExAgBoU6/X02oz7DPTaA5c=	2024-07-09 08:38:25.497684+00	t	mlotfian			m.lotfian@gmail.com	t	t	2023-12-01 15:19:15.588291+00	none
5	pbkdf2_sha256$320000$pDIV42du2MpErDVHHkC3KB$xUTSuDu+TtlKrg55YVfcIDJr+1pClHYU0zwoV23MsIA=	2024-03-28 16:52:29.861869+00	f	aurelie.b			lotfian.maryam@gmail.com	t	t	2024-03-14 11:19:27+00	none
\.


--
-- Data for Name: ponderful_mcda_customuser_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_customuser_groups (id, customuser_id, group_id) FROM stdin;
\.


--
-- Data for Name: ponderful_mcda_customuser_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_customuser_user_permissions (id, customuser_id, permission_id) FROM stdin;
76	5	65
77	5	66
78	5	67
4	5	1
5	5	2
6	5	4
79	5	68
80	5	33
81	5	34
82	5	35
83	5	36
32	5	29
33	5	30
34	5	31
35	5	32
\.


--
-- Data for Name: ponderful_mcda_mcda_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_mcda_result (id, alternative, model_result, weight, partial_satisfaction, weighted_avg, analysis_run_id, criteria_id, scenario_id, user_id) FROM stdin;
1972	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	5	1
1973	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	6	1
1974	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	7	1
1975	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	8	1
1976	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	11	1
1977	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	10	1
1978	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	9	1
1979	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	5	1
1980	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	6	1
1981	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	7	1
1982	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	8	1
1983	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	11	1
1984	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	10	1
1985	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	9	1
1986	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	5	1
1987	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	6	1
1988	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	7	1
1989	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	8	1
1990	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	11	1
1991	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	10	1
1992	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	9	1
1993	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	5	1
1994	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	6	1
1995	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	7	1
1996	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	8	1
1997	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	11	1
1998	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	10	1
1999	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	9	1
2000	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	5	1
2001	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	6	1
2002	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	7	1
2003	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	8	1
2004	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	11	1
2005	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	10	1
2006	Creation of 19 Ponds	12	33.33333333333333	100	33.33333333333333	145	2	9	1
2007	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	5	1
2008	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	6	1
2009	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	7	1
2010	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	8	1
2011	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	11	1
2012	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	10	1
2013	Creation of 10 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	9	1
852	Creation of 5 Ponds	18	16.666666666666664	20	3.3333333333333326	130	15	5	1
853	Creation of 5 Ponds	17	16.666666666666664	13.333333333333334	2.222222222222222	130	15	6	1
854	Creation of 5 Ponds	17	16.666666666666664	13.333333333333334	2.222222222222222	130	15	7	1
855	Creation of 5 Ponds	18	16.666666666666664	20	3.3333333333333326	130	15	8	1
856	Creation of 5 Ponds	21	16.666666666666664	40	6.666666666666665	130	15	11	1
857	Creation of 5 Ponds	17	16.666666666666664	13.333333333333334	2.222222222222222	130	15	10	1
858	Creation of 5 Ponds	17	16.666666666666664	13.333333333333334	2.222222222222222	130	15	9	1
903	Creation of 2 Ponds	13	41.66666666666667	0	0	131	15	7	1
904	Creation of 2 Ponds	14	41.66666666666667	0	0	131	15	8	1
905	Creation of 2 Ponds	17	41.66666666666667	13.333333333333334	5.555555555555556	131	15	11	1
906	Creation of 2 Ponds	14	41.66666666666667	0	0	131	15	10	1
907	Creation of 2 Ponds	13	41.66666666666667	0	0	131	15	9	1
908	Creation of 9 Ponds	20	41.66666666666667	33.33333333333333	13.88888888888889	131	15	5	1
909	Creation of 9 Ponds	19	41.66666666666667	26.666666666666668	11.111111111111112	131	15	6	1
910	Creation of 9 Ponds	19	41.66666666666667	26.666666666666668	11.111111111111112	131	15	7	1
911	Creation of 9 Ponds	20	41.66666666666667	33.33333333333333	13.88888888888889	131	15	8	1
912	Creation of 9 Ponds	23	41.66666666666667	53.333333333333336	22.222222222222225	131	15	11	1
913	Creation of 9 Ponds	19	41.66666666666667	26.666666666666668	11.111111111111112	131	15	10	1
914	Creation of 9 Ponds	19	41.66666666666667	26.666666666666668	11.111111111111112	131	15	9	1
915	Creation of 6 Ponds	18	41.66666666666667	20	8.333333333333336	131	15	5	1
916	Creation of 6 Ponds	17	41.66666666666667	13.333333333333334	5.555555555555556	131	15	6	1
917	Creation of 6 Ponds	17	41.66666666666667	13.333333333333334	5.555555555555556	131	15	7	1
918	Creation of 6 Ponds	18	41.66666666666667	20	8.333333333333336	131	15	8	1
775	Creation of 2 Ponds	8	100	12.5	12.5	128	2	5	1
776	Creation of 2 Ponds	8	100	12.5	12.5	128	2	6	1
777	Creation of 2 Ponds	8	100	12.5	12.5	128	2	7	1
778	Creation of 2 Ponds	8	100	12.5	12.5	128	2	8	1
779	Creation of 2 Ponds	8	100	12.5	12.5	128	2	11	1
780	Creation of 2 Ponds	8	100	12.5	12.5	128	2	10	1
781	Creation of 2 Ponds	8	100	12.5	12.5	128	2	9	1
782	Creation of 9 Ponds	10	100	37.5	37.5	128	2	5	1
783	Creation of 9 Ponds	10	100	37.5	37.5	128	2	6	1
784	Creation of 9 Ponds	10	100	37.5	37.5	128	2	7	1
785	Creation of 9 Ponds	10	100	37.5	37.5	128	2	8	1
786	Creation of 9 Ponds	10	100	37.5	37.5	128	2	11	1
787	Creation of 9 Ponds	10	100	37.5	37.5	128	2	10	1
788	Creation of 9 Ponds	10	100	37.5	37.5	128	2	9	1
789	Creation of 6 Ponds	10	100	37.5	37.5	128	2	5	1
790	Creation of 6 Ponds	10	100	37.5	37.5	128	2	6	1
791	Creation of 6 Ponds	10	100	37.5	37.5	128	2	7	1
792	Creation of 6 Ponds	10	100	37.5	37.5	128	2	8	1
793	Creation of 6 Ponds	10	100	37.5	37.5	128	2	11	1
794	Creation of 6 Ponds	10	100	37.5	37.5	128	2	10	1
795	Creation of 6 Ponds	10	100	37.5	37.5	128	2	9	1
859	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	5	1
860	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	6	1
861	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	7	1
862	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	8	1
863	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	11	1
864	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	10	1
865	Creation of 2 Ponds	8	41.66666666666667	12.5	5.208333333333334	131	2	9	1
866	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	5	1
867	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	6	1
868	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	7	1
869	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	8	1
870	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	11	1
871	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	10	1
872	Creation of 9 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	9	1
873	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	5	1
874	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	6	1
875	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	7	1
876	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	8	1
877	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	11	1
878	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	10	1
879	Creation of 6 Ponds	10	41.66666666666667	37.5	15.625000000000002	131	2	9	1
880	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	5	1
881	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	6	1
882	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	7	1
883	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	8	1
884	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	11	1
885	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	10	1
886	Creation of 2 Ponds	11	16.666666666666664	21.428571428571427	3.5714285714285707	131	12	9	1
887	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	5	1
888	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	6	1
889	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	7	1
890	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	8	1
891	Creation of 9 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	11	1
892	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	10	1
893	Creation of 9 Ponds	16	16.666666666666664	57.14285714285714	9.523809523809522	131	12	9	1
894	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	5	1
895	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	6	1
896	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	7	1
897	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	8	1
898	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	11	1
899	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	10	1
900	Creation of 6 Ponds	15	16.666666666666664	50	8.333333333333332	131	12	9	1
901	Creation of 2 Ponds	14	41.66666666666667	0	0	131	15	5	1
902	Creation of 2 Ponds	13	41.66666666666667	0	0	131	15	6	1
796	Creation of 2 Ponds	8	50	12.5	6.25	130	2	5	1
797	Creation of 2 Ponds	8	50	12.5	6.25	130	2	6	1
798	Creation of 2 Ponds	8	50	12.5	6.25	130	2	7	1
799	Creation of 2 Ponds	8	50	12.5	6.25	130	2	8	1
800	Creation of 2 Ponds	8	50	12.5	6.25	130	2	11	1
801	Creation of 2 Ponds	8	50	12.5	6.25	130	2	10	1
802	Creation of 2 Ponds	8	50	12.5	6.25	130	2	9	1
803	Creation of 8 Ponds	10	50	37.5	18.75	130	2	5	1
804	Creation of 8 Ponds	10	50	37.5	18.75	130	2	6	1
805	Creation of 8 Ponds	10	50	37.5	18.75	130	2	7	1
806	Creation of 8 Ponds	10	50	37.5	18.75	130	2	8	1
807	Creation of 8 Ponds	10	50	37.5	18.75	130	2	11	1
808	Creation of 8 Ponds	10	50	37.5	18.75	130	2	10	1
809	Creation of 8 Ponds	10	50	37.5	18.75	130	2	9	1
810	Creation of 5 Ponds	9	50	25	12.5	130	2	5	1
811	Creation of 5 Ponds	9	50	25	12.5	130	2	6	1
812	Creation of 5 Ponds	9	50	25	12.5	130	2	7	1
813	Creation of 5 Ponds	9	50	25	12.5	130	2	8	1
814	Creation of 5 Ponds	9	50	25	12.5	130	2	11	1
815	Creation of 5 Ponds	9	50	25	12.5	130	2	10	1
816	Creation of 5 Ponds	9	50	25	12.5	130	2	9	1
817	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	5	1
818	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	6	1
819	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	7	1
820	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	8	1
821	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	11	1
822	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	10	1
823	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	130	12	9	1
824	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	5	1
825	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	6	1
826	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	7	1
827	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	8	1
828	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	11	1
829	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	10	1
830	Creation of 8 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	130	12	9	1
831	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	5	1
832	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	6	1
833	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	7	1
834	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	8	1
835	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	11	1
836	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	10	1
837	Creation of 5 Ponds	14	33.33333333333333	42.857142857142854	14.285714285714283	130	12	9	1
838	Creation of 2 Ponds	14	16.666666666666664	0	0	130	15	5	1
397	Creation of 5 Ponds	9	50	25	12.5	106	2	6	9
398	Creation of 10 Ponds	11	50	50	25	106	2	6	9
399	Creation of 8 Ponds	10	50	37.5	18.75	106	2	6	9
400	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	106	12	6	9
401	Creation of 10 Ponds	17	50	64.28571428571429	32.142857142857146	106	12	6	9
402	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	106	12	6	9
839	Creation of 2 Ponds	13	16.666666666666664	0	0	130	15	6	1
840	Creation of 2 Ponds	13	16.666666666666664	0	0	130	15	7	1
841	Creation of 2 Ponds	14	16.666666666666664	0	0	130	15	8	1
842	Creation of 2 Ponds	17	16.666666666666664	13.333333333333334	2.222222222222222	130	15	11	1
843	Creation of 2 Ponds	14	16.666666666666664	0	0	130	15	10	1
844	Creation of 2 Ponds	13	16.666666666666664	0	0	130	15	9	1
845	Creation of 8 Ponds	20	16.666666666666664	33.33333333333333	5.5555555555555545	130	15	5	1
846	Creation of 8 Ponds	19	16.666666666666664	26.666666666666668	4.444444444444444	130	15	6	1
847	Creation of 8 Ponds	19	16.666666666666664	26.666666666666668	4.444444444444444	130	15	7	1
412	Creation of 4 Ponds	13	100	35.714285714285715	35.714285714285715	112	12	8	10
413	Creation of 6 Ponds	15	100	50	50	112	12	8	10
414	Creation of 5 Ponds	14	100	42.857142857142854	42.857142857142854	112	12	8	10
848	Creation of 8 Ponds	20	16.666666666666664	33.33333333333333	5.5555555555555545	130	15	8	1
849	Creation of 8 Ponds	23	16.666666666666664	53.333333333333336	8.888888888888888	130	15	11	1
850	Creation of 8 Ponds	19	16.666666666666664	26.666666666666668	4.444444444444444	130	15	10	1
851	Creation of 8 Ponds	19	16.666666666666664	26.666666666666668	4.444444444444444	130	15	9	1
919	Creation of 6 Ponds	21	41.66666666666667	40	16.66666666666667	131	15	11	1
920	Creation of 6 Ponds	17	41.66666666666667	13.333333333333334	5.555555555555556	131	15	10	1
921	Creation of 6 Ponds	17	41.66666666666667	13.333333333333334	5.555555555555556	131	15	9	1
922	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	5	1
923	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	6	1
924	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	7	1
925	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	8	1
926	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	11	1
927	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	10	1
928	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	9	1
929	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	5	1
930	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	6	1
931	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	7	1
932	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	8	1
933	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	11	1
934	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	10	1
935	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	9	1
936	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	5	1
937	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	6	1
938	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	7	1
939	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	8	1
940	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	11	1
941	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	10	1
942	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	9	1
943	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	5	1
944	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	6	1
945	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	7	1
946	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	8	1
947	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	11	1
948	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	10	1
949	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	9	1
950	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	5	1
951	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	6	1
952	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	7	1
953	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	8	1
954	Creation of 9 Ponds	15	62.5	50	31.25	132	12	11	1
955	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	10	1
956	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	9	1
957	Creation of 6 Ponds	15	62.5	50	31.25	132	12	5	1
958	Creation of 6 Ponds	15	62.5	50	31.25	132	12	6	1
959	Creation of 6 Ponds	15	62.5	50	31.25	132	12	7	1
960	Creation of 6 Ponds	15	62.5	50	31.25	132	12	8	1
961	Creation of 6 Ponds	15	62.5	50	31.25	132	12	11	1
962	Creation of 6 Ponds	15	62.5	50	31.25	132	12	10	1
963	Creation of 6 Ponds	15	62.5	50	31.25	132	12	9	1
964	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	5	1
965	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	6	1
966	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	7	1
967	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	8	1
968	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	11	1
969	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	10	1
970	Creation of 2 Ponds	8	37.5	12.5	4.6875	132	2	9	1
971	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	5	1
972	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	6	1
973	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	7	1
974	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	8	1
975	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	11	1
976	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	10	1
977	Creation of 9 Ponds	10	37.5	37.5	14.0625	132	2	9	1
978	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	5	1
979	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	6	1
980	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	7	1
981	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	8	1
982	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	11	1
983	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	10	1
984	Creation of 6 Ponds	10	37.5	37.5	14.0625	132	2	9	1
985	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	5	1
986	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	6	1
987	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	7	1
988	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	8	1
989	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	11	1
990	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	10	1
991	Creation of 2 Ponds	11	62.5	21.428571428571427	13.392857142857142	132	12	9	1
992	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	5	1
993	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	6	1
994	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	7	1
995	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	8	1
996	Creation of 9 Ponds	15	62.5	50	31.25	132	12	11	1
997	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	10	1
998	Creation of 9 Ponds	16	62.5	57.14285714285714	35.71428571428571	132	12	9	1
999	Creation of 6 Ponds	15	62.5	50	31.25	132	12	5	1
1000	Creation of 6 Ponds	15	62.5	50	31.25	132	12	6	1
1001	Creation of 6 Ponds	15	62.5	50	31.25	132	12	7	1
1002	Creation of 6 Ponds	15	62.5	50	31.25	132	12	8	1
1003	Creation of 6 Ponds	15	62.5	50	31.25	132	12	11	1
1004	Creation of 6 Ponds	15	62.5	50	31.25	132	12	10	1
1005	Creation of 6 Ponds	15	62.5	50	31.25	132	12	9	1
1006	Creation of 2 Ponds	14	37.5	0	0	132	15	5	1
1007	Creation of 2 Ponds	13	37.5	0	0	132	15	6	1
1008	Creation of 2 Ponds	13	37.5	0	0	132	15	7	1
1009	Creation of 2 Ponds	14	37.5	0	0	132	15	8	1
1010	Creation of 2 Ponds	17	37.5	13.333333333333334	5	132	15	11	1
1011	Creation of 2 Ponds	14	37.5	0	0	132	15	10	1
1012	Creation of 2 Ponds	13	37.5	0	0	132	15	9	1
1013	Creation of 9 Ponds	20	37.5	33.33333333333333	12.499999999999998	132	15	5	1
1014	Creation of 9 Ponds	19	37.5	26.666666666666668	10	132	15	6	1
1015	Creation of 9 Ponds	19	37.5	26.666666666666668	10	132	15	7	1
1016	Creation of 9 Ponds	20	37.5	33.33333333333333	12.499999999999998	132	15	8	1
1017	Creation of 9 Ponds	23	37.5	53.333333333333336	20	132	15	11	1
1018	Creation of 9 Ponds	19	37.5	26.666666666666668	10	132	15	10	1
1019	Creation of 9 Ponds	19	37.5	26.666666666666668	10	132	15	9	1
1020	Creation of 6 Ponds	18	37.5	20	7.5	132	15	5	1
1021	Creation of 6 Ponds	17	37.5	13.333333333333334	5	132	15	6	1
1022	Creation of 6 Ponds	17	37.5	13.333333333333334	5	132	15	7	1
1023	Creation of 6 Ponds	18	37.5	20	7.5	132	15	8	1
1024	Creation of 6 Ponds	21	37.5	40	15	132	15	11	1
1025	Creation of 6 Ponds	17	37.5	13.333333333333334	5	132	15	10	1
1026	Creation of 6 Ponds	17	37.5	13.333333333333334	5	132	15	9	1
1027	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	5	1
1028	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	6	1
1029	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	7	1
1030	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	8	1
1031	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	11	1
1032	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	10	1
1033	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	9	1
1034	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	5	1
1035	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	6	1
1036	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	7	1
1037	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	8	1
1038	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	11	1
1039	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	10	1
1040	Creation of 9 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	9	1
1041	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	5	1
1042	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	6	1
1043	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	7	1
1044	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	8	1
1045	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	11	1
1046	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	10	1
1047	Creation of 6 Ponds	10	42.857142857142854	37.5	16.07142857142857	132	2	9	1
1048	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	5	1
1049	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	6	1
1050	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	7	1
1051	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	8	1
1052	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	11	1
1053	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	10	1
1054	Creation of 2 Ponds	8	42.857142857142854	12.5	5.357142857142857	132	2	9	1
1055	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	5	1
1056	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	6	1
1057	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	7	1
1058	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	8	1
1059	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	11	1
1060	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	10	1
1061	Creation of 20 Ponds	12	42.857142857142854	62.5	26.785714285714285	132	2	9	1
1062	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	5	1
1063	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	6	1
1064	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	7	1
1065	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	8	1
1066	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	11	1
1067	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	10	1
1068	Creation of 11 Ponds	11	42.857142857142854	50	21.428571428571427	132	2	9	1
1069	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	5	1
1070	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	6	1
1071	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	7	1
1072	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	8	1
1073	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	11	1
1074	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	10	1
1075	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	9	1
1076	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	5	1
1077	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	6	1
1078	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	7	1
1079	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	8	1
1080	Creation of 9 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	11	1
1081	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	10	1
1082	Creation of 9 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	9	1
1083	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	5	1
1084	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	6	1
1085	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	7	1
1086	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	8	1
1087	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	11	1
1088	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	10	1
1089	Creation of 6 Ponds	15	71.42857142857143	50	35.714285714285715	132	12	9	1
1090	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	5	1
1091	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	6	1
1092	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	7	1
1093	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	8	1
1094	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	11	1
1095	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	10	1
1096	Creation of 2 Ponds	11	71.42857142857143	21.428571428571427	15.30612244897959	132	12	9	1
1097	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	5	1
1098	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	6	1
1099	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	7	1
1100	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	8	1
1101	Creation of 20 Ponds	19	71.42857142857143	78.57142857142857	56.12244897959184	132	12	11	1
1102	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	10	1
1103	Creation of 20 Ponds	20	71.42857142857143	85.71428571428571	61.22448979591836	132	12	9	1
1104	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	5	1
1105	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	6	1
1106	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	7	1
1107	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	8	1
1108	Creation of 11 Ponds	16	71.42857142857143	57.14285714285714	40.816326530612244	132	12	11	1
1109	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	10	1
1110	Creation of 11 Ponds	17	71.42857142857143	64.28571428571429	45.91836734693879	132	12	9	1
1111	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	5	1
1112	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	6	1
1113	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	7	1
1114	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	8	1
1115	Creation of 2 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	11	1
1116	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	10	1
1117	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	9	1
1118	Creation of 9 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	5	1
1119	Creation of 9 Ponds	19	42.857142857142854	26.666666666666668	11.428571428571429	132	15	6	1
1120	Creation of 9 Ponds	19	42.857142857142854	26.666666666666668	11.428571428571429	132	15	7	1
1121	Creation of 9 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	8	1
1122	Creation of 9 Ponds	23	42.857142857142854	53.333333333333336	22.857142857142858	132	15	11	1
1123	Creation of 9 Ponds	19	42.857142857142854	26.666666666666668	11.428571428571429	132	15	10	1
1124	Creation of 9 Ponds	19	42.857142857142854	26.666666666666668	11.428571428571429	132	15	9	1
1125	Creation of 6 Ponds	18	42.857142857142854	20	8.571428571428571	132	15	5	1
1126	Creation of 6 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	6	1
1127	Creation of 6 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	7	1
1128	Creation of 6 Ponds	18	42.857142857142854	20	8.571428571428571	132	15	8	1
1129	Creation of 6 Ponds	21	42.857142857142854	40	17.142857142857142	132	15	11	1
1130	Creation of 6 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	10	1
1131	Creation of 6 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	9	1
1132	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	5	1
1133	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	6	1
1134	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	7	1
1135	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	8	1
1136	Creation of 2 Ponds	17	42.857142857142854	13.333333333333334	5.714285714285714	132	15	11	1
1137	Creation of 2 Ponds	14	42.857142857142854	0	0	132	15	10	1
1138	Creation of 2 Ponds	13	42.857142857142854	0	0	132	15	9	1
1139	Creation of 20 Ponds	24	42.857142857142854	60	25.71428571428571	132	15	5	1
1140	Creation of 20 Ponds	23	42.857142857142854	53.333333333333336	22.857142857142858	132	15	6	1
1141	Creation of 20 Ponds	23	42.857142857142854	53.333333333333336	22.857142857142858	132	15	7	1
1142	Creation of 20 Ponds	24	42.857142857142854	60	25.71428571428571	132	15	8	1
1143	Creation of 20 Ponds	27	42.857142857142854	80	34.285714285714285	132	15	11	1
1144	Creation of 20 Ponds	23	42.857142857142854	53.333333333333336	22.857142857142858	132	15	10	1
1145	Creation of 20 Ponds	23	42.857142857142854	53.333333333333336	22.857142857142858	132	15	9	1
1146	Creation of 11 Ponds	21	42.857142857142854	40	17.142857142857142	132	15	5	1
1147	Creation of 11 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	6	1
1148	Creation of 11 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	7	1
1149	Creation of 11 Ponds	21	42.857142857142854	40	17.142857142857142	132	15	8	1
1150	Creation of 11 Ponds	24	42.857142857142854	60	25.71428571428571	132	15	11	1
1151	Creation of 11 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	10	1
1152	Creation of 11 Ponds	20	42.857142857142854	33.33333333333333	14.285714285714283	132	15	9	1
1153	Creation of 2 Ponds	8	150	12.5	18.75	132	2	5	1
1154	Creation of 2 Ponds	8	150	12.5	18.75	132	2	6	1
1155	Creation of 2 Ponds	8	150	12.5	18.75	132	2	7	1
1156	Creation of 2 Ponds	8	150	12.5	18.75	132	2	8	1
1157	Creation of 2 Ponds	8	150	12.5	18.75	132	2	11	1
1158	Creation of 2 Ponds	8	150	12.5	18.75	132	2	10	1
1159	Creation of 2 Ponds	8	150	12.5	18.75	132	2	9	1
1160	Creation of 9 Ponds	10	150	37.5	56.25	132	2	5	1
1161	Creation of 9 Ponds	10	150	37.5	56.25	132	2	6	1
1162	Creation of 9 Ponds	10	150	37.5	56.25	132	2	7	1
1163	Creation of 9 Ponds	10	150	37.5	56.25	132	2	8	1
1164	Creation of 9 Ponds	10	150	37.5	56.25	132	2	11	1
1165	Creation of 9 Ponds	10	150	37.5	56.25	132	2	10	1
1166	Creation of 9 Ponds	10	150	37.5	56.25	132	2	9	1
1167	Creation of 6 Ponds	10	150	37.5	56.25	132	2	5	1
1168	Creation of 6 Ponds	10	150	37.5	56.25	132	2	6	1
1169	Creation of 6 Ponds	10	150	37.5	56.25	132	2	7	1
1170	Creation of 6 Ponds	10	150	37.5	56.25	132	2	8	1
1171	Creation of 6 Ponds	10	150	37.5	56.25	132	2	11	1
1172	Creation of 6 Ponds	10	150	37.5	56.25	132	2	10	1
1173	Creation of 6 Ponds	10	150	37.5	56.25	132	2	9	1
1174	Creation of 2 Ponds	8	150	12.5	18.75	132	2	5	1
1175	Creation of 2 Ponds	8	150	12.5	18.75	132	2	6	1
1176	Creation of 2 Ponds	8	150	12.5	18.75	132	2	7	1
1177	Creation of 2 Ponds	8	150	12.5	18.75	132	2	8	1
1178	Creation of 2 Ponds	8	150	12.5	18.75	132	2	11	1
1179	Creation of 2 Ponds	8	150	12.5	18.75	132	2	10	1
1180	Creation of 2 Ponds	8	150	12.5	18.75	132	2	9	1
1181	Creation of 20 Ponds	12	150	62.5	93.75	132	2	5	1
1182	Creation of 20 Ponds	12	150	62.5	93.75	132	2	6	1
1183	Creation of 20 Ponds	12	150	62.5	93.75	132	2	7	1
1184	Creation of 20 Ponds	12	150	62.5	93.75	132	2	8	1
1185	Creation of 20 Ponds	12	150	62.5	93.75	132	2	11	1
1186	Creation of 20 Ponds	12	150	62.5	93.75	132	2	10	1
1187	Creation of 20 Ponds	12	150	62.5	93.75	132	2	9	1
1188	Creation of 11 Ponds	11	150	50	75	132	2	5	1
1189	Creation of 11 Ponds	11	150	50	75	132	2	6	1
1190	Creation of 11 Ponds	11	150	50	75	132	2	7	1
1191	Creation of 11 Ponds	11	150	50	75	132	2	8	1
1192	Creation of 11 Ponds	11	150	50	75	132	2	11	1
1193	Creation of 11 Ponds	11	150	50	75	132	2	10	1
1194	Creation of 11 Ponds	11	150	50	75	132	2	9	1
1195	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	5	1
1196	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	6	1
1197	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	7	1
1198	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	8	1
1199	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	11	1
1200	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	10	1
1201	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	9	1
1202	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	5	1
1203	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	6	1
1204	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	7	1
1205	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	8	1
1206	Creation of 9 Ponds	15	250	50	125	132	12	11	1
1207	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	10	1
1208	Creation of 9 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	9	1
1209	Creation of 6 Ponds	15	250	50	125	132	12	5	1
1210	Creation of 6 Ponds	15	250	50	125	132	12	6	1
1211	Creation of 6 Ponds	15	250	50	125	132	12	7	1
1212	Creation of 6 Ponds	15	250	50	125	132	12	8	1
1213	Creation of 6 Ponds	15	250	50	125	132	12	11	1
1214	Creation of 6 Ponds	15	250	50	125	132	12	10	1
1215	Creation of 6 Ponds	15	250	50	125	132	12	9	1
1216	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	5	1
1217	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	6	1
1218	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	7	1
1219	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	8	1
1220	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	11	1
1221	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	10	1
1222	Creation of 2 Ponds	11	250	21.428571428571427	53.57142857142857	132	12	9	1
1223	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	5	1
1224	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	6	1
1225	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	7	1
1226	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	8	1
1227	Creation of 20 Ponds	19	250	78.57142857142857	196.42857142857142	132	12	11	1
1228	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	10	1
1229	Creation of 20 Ponds	20	250	85.71428571428571	214.28571428571428	132	12	9	1
1230	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	5	1
1231	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	6	1
1232	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	7	1
1233	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	8	1
1234	Creation of 11 Ponds	16	250	57.14285714285714	142.85714285714283	132	12	11	1
1235	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	10	1
1236	Creation of 11 Ponds	17	250	64.28571428571429	160.71428571428572	132	12	9	1
1237	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	5	1
1238	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	6	1
1239	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	7	1
1240	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	8	1
1241	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	11	1
1242	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	10	1
1243	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	133	2	9	1
1244	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	5	1
1245	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	6	1
1246	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	7	1
1247	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	8	1
1248	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	11	1
1249	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	10	1
1250	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	133	2	9	1
1251	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	5	1
1252	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	6	1
1253	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	7	1
1254	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	8	1
1255	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	11	1
1256	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	10	1
1257	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	133	2	9	1
1258	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	5	1
1259	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	6	1
1260	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	7	1
1261	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	8	1
1262	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	11	1
1263	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	10	1
1264	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	133	12	9	1
1265	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	5	1
1266	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	6	1
1267	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	7	1
1268	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	8	1
1269	Creation of 20 Ponds	19	33.33333333333333	78.57142857142857	26.19047619047619	133	12	11	1
1270	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	10	1
1271	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	133	12	9	1
1272	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	5	1
1273	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	6	1
1274	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	7	1
1275	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	8	1
1276	Creation of 11 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	133	12	11	1
1277	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	10	1
1278	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	133	12	9	1
1279	Creation of 2 Ponds	14	33.33333333333333	0	0	133	15	5	1
1280	Creation of 2 Ponds	13	33.33333333333333	0	0	133	15	6	1
1281	Creation of 2 Ponds	13	33.33333333333333	0	0	133	15	7	1
1282	Creation of 2 Ponds	14	33.33333333333333	0	0	133	15	8	1
1283	Creation of 2 Ponds	17	33.33333333333333	13.333333333333334	4.444444444444444	133	15	11	1
1284	Creation of 2 Ponds	14	33.33333333333333	0	0	133	15	10	1
1285	Creation of 2 Ponds	13	33.33333333333333	0	0	133	15	9	1
1286	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	133	15	5	1
1287	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	133	15	6	1
1288	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	133	15	7	1
1289	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	133	15	8	1
1290	Creation of 20 Ponds	27	33.33333333333333	80	26.66666666666666	133	15	11	1
1291	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	133	15	10	1
1292	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	133	15	9	1
1293	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	133	15	5	1
1294	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	133	15	6	1
1295	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	133	15	7	1
1296	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	133	15	8	1
1297	Creation of 11 Ponds	24	33.33333333333333	60	19.999999999999996	133	15	11	1
1298	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	133	15	10	1
1299	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	133	15	9	1
1300	Creation of 2 Ponds	8	50	12.5	6.25	134	2	5	1
1301	Creation of 2 Ponds	8	50	12.5	6.25	134	2	6	1
1302	Creation of 2 Ponds	8	50	12.5	6.25	134	2	7	1
1303	Creation of 2 Ponds	8	50	12.5	6.25	134	2	8	1
1304	Creation of 2 Ponds	8	50	12.5	6.25	134	2	11	1
1305	Creation of 2 Ponds	8	50	12.5	6.25	134	2	10	1
1306	Creation of 2 Ponds	8	50	12.5	6.25	134	2	9	1
1307	Creation of 20 Ponds	12	50	62.5	31.25	134	2	5	1
1308	Creation of 20 Ponds	12	50	62.5	31.25	134	2	6	1
1309	Creation of 20 Ponds	12	50	62.5	31.25	134	2	7	1
1310	Creation of 20 Ponds	12	50	62.5	31.25	134	2	8	1
1311	Creation of 20 Ponds	12	50	62.5	31.25	134	2	11	1
1312	Creation of 20 Ponds	12	50	62.5	31.25	134	2	10	1
1313	Creation of 20 Ponds	12	50	62.5	31.25	134	2	9	1
1314	Creation of 11 Ponds	11	50	50	25	134	2	5	1
1315	Creation of 11 Ponds	11	50	50	25	134	2	6	1
1316	Creation of 11 Ponds	11	50	50	25	134	2	7	1
1317	Creation of 11 Ponds	11	50	50	25	134	2	8	1
1318	Creation of 11 Ponds	11	50	50	25	134	2	11	1
1319	Creation of 11 Ponds	11	50	50	25	134	2	10	1
1320	Creation of 11 Ponds	11	50	50	25	134	2	9	1
1321	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	5	1
1322	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	6	1
1323	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	7	1
1324	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	8	1
1325	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	11	1
1326	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	10	1
1327	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	134	12	9	1
1328	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	5	1
1329	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	6	1
1330	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	7	1
1331	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	8	1
1332	Creation of 20 Ponds	19	50	78.57142857142857	39.285714285714285	134	12	11	1
1333	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	10	1
1334	Creation of 20 Ponds	20	50	85.71428571428571	42.857142857142854	134	12	9	1
1335	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	5	1
1336	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	6	1
1337	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	7	1
1338	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	8	1
1339	Creation of 11 Ponds	16	50	57.14285714285714	28.57142857142857	134	12	11	1
1340	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	10	1
1341	Creation of 11 Ponds	17	50	64.28571428571429	32.142857142857146	134	12	9	1
1342	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	5	1
1343	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	6	1
1344	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	7	1
1345	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	8	1
1346	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	11	1
1347	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	10	1
1348	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	135	2	9	1
1349	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	5	1
1350	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	6	1
1351	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	7	1
1352	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	8	1
1353	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	11	1
1354	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	10	1
1355	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	135	2	9	1
1356	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	5	1
1357	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	6	1
1358	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	7	1
1359	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	8	1
1360	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	11	1
1361	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	10	1
1362	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	135	2	9	1
1363	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	5	1
1364	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	6	1
1365	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	7	1
1366	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	8	1
1367	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	11	1
1368	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	10	1
1369	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	135	12	9	1
1370	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	5	1
1371	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	6	1
1372	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	7	1
1373	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	8	1
1374	Creation of 20 Ponds	19	33.33333333333333	78.57142857142857	26.19047619047619	135	12	11	1
1375	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	10	1
1376	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	135	12	9	1
1377	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	5	1
1378	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	6	1
1379	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	7	1
1380	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	8	1
1381	Creation of 11 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	135	12	11	1
1382	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	10	1
1383	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	135	12	9	1
1384	Creation of 2 Ponds	14	33.33333333333333	0	0	135	15	5	1
1385	Creation of 2 Ponds	13	33.33333333333333	0	0	135	15	6	1
1386	Creation of 2 Ponds	13	33.33333333333333	0	0	135	15	7	1
1387	Creation of 2 Ponds	14	33.33333333333333	0	0	135	15	8	1
1388	Creation of 2 Ponds	17	33.33333333333333	13.333333333333334	4.444444444444444	135	15	11	1
1389	Creation of 2 Ponds	14	33.33333333333333	0	0	135	15	10	1
1390	Creation of 2 Ponds	13	33.33333333333333	0	0	135	15	9	1
1391	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	135	15	5	1
1392	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	135	15	6	1
1393	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	135	15	7	1
1394	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	135	15	8	1
1395	Creation of 20 Ponds	27	33.33333333333333	80	26.66666666666666	135	15	11	1
1396	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	135	15	10	1
1397	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	135	15	9	1
1398	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	135	15	5	1
1399	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	135	15	6	1
1400	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	135	15	7	1
1401	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	135	15	8	1
1402	Creation of 11 Ponds	24	33.33333333333333	60	19.999999999999996	135	15	11	1
1403	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	135	15	10	1
1404	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	135	15	9	1
1405	Creation of 2 Ponds	8	50	12.5	6.25	136	2	5	1
1406	Creation of 2 Ponds	8	50	12.5	6.25	136	2	6	1
1407	Creation of 2 Ponds	8	50	12.5	6.25	136	2	7	1
1408	Creation of 2 Ponds	8	50	12.5	6.25	136	2	8	1
1409	Creation of 2 Ponds	8	50	12.5	6.25	136	2	11	1
1410	Creation of 2 Ponds	8	50	12.5	6.25	136	2	10	1
1411	Creation of 2 Ponds	8	50	12.5	6.25	136	2	9	1
1412	Creation of 9 Ponds	10	50	37.5	18.75	136	2	5	1
1413	Creation of 9 Ponds	10	50	37.5	18.75	136	2	6	1
1414	Creation of 9 Ponds	10	50	37.5	18.75	136	2	7	1
1415	Creation of 9 Ponds	10	50	37.5	18.75	136	2	8	1
1416	Creation of 9 Ponds	10	50	37.5	18.75	136	2	11	1
1417	Creation of 9 Ponds	10	50	37.5	18.75	136	2	10	1
1418	Creation of 9 Ponds	10	50	37.5	18.75	136	2	9	1
1419	Creation of 6 Ponds	10	50	37.5	18.75	136	2	5	1
1420	Creation of 6 Ponds	10	50	37.5	18.75	136	2	6	1
1421	Creation of 6 Ponds	10	50	37.5	18.75	136	2	7	1
1422	Creation of 6 Ponds	10	50	37.5	18.75	136	2	8	1
1423	Creation of 6 Ponds	10	50	37.5	18.75	136	2	11	1
1424	Creation of 6 Ponds	10	50	37.5	18.75	136	2	10	1
1425	Creation of 6 Ponds	10	50	37.5	18.75	136	2	9	1
1426	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	5	1
1427	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	6	1
1428	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	7	1
1429	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	8	1
1430	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	11	1
1431	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	10	1
1432	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	136	12	9	1
1433	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	5	1
1434	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	6	1
1435	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	7	1
1436	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	8	1
1437	Creation of 9 Ponds	15	50	50	25	136	12	11	1
1438	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	10	1
1439	Creation of 9 Ponds	16	50	57.14285714285714	28.57142857142857	136	12	9	1
1440	Creation of 6 Ponds	15	50	50	25	136	12	5	1
1441	Creation of 6 Ponds	15	50	50	25	136	12	6	1
1442	Creation of 6 Ponds	15	50	50	25	136	12	7	1
1443	Creation of 6 Ponds	15	50	50	25	136	12	8	1
1444	Creation of 6 Ponds	15	50	50	25	136	12	11	1
1445	Creation of 6 Ponds	15	50	50	25	136	12	10	1
1446	Creation of 6 Ponds	15	50	50	25	136	12	9	1
1447	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	5	1
1448	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	6	1
1449	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	7	1
1450	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	8	1
1451	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	11	1
1452	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	10	1
1453	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	137	2	9	1
1454	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	5	1
1455	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	6	1
1456	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	7	1
1457	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	8	1
1458	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	11	1
1459	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	10	1
1460	Creation of 9 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	9	1
1461	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	5	1
1462	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	6	1
1463	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	7	1
1464	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	8	1
1465	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	11	1
1466	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	10	1
1467	Creation of 6 Ponds	10	33.33333333333333	37.5	12.499999999999998	137	2	9	1
1468	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	5	1
1469	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	6	1
1470	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	7	1
1471	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	8	1
1472	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	11	1
1473	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	10	1
1474	Creation of 2 Ponds	11	66.66666666666666	21.428571428571427	14.285714285714283	137	12	9	1
1475	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	5	1
1476	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	6	1
1477	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	7	1
1478	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	8	1
1479	Creation of 9 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	11	1
1480	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	10	1
1481	Creation of 9 Ponds	16	66.66666666666666	57.14285714285714	38.09523809523809	137	12	9	1
1482	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	5	1
1483	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	6	1
1484	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	7	1
1485	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	8	1
1486	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	11	1
1487	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	10	1
1488	Creation of 6 Ponds	15	66.66666666666666	50	33.33333333333333	137	12	9	1
1489	Creation of 2 Ponds	8	20	12.5	2.5	138	2	5	1
1490	Creation of 2 Ponds	8	20	12.5	2.5	138	2	6	1
1491	Creation of 2 Ponds	8	20	12.5	2.5	138	2	7	1
1492	Creation of 2 Ponds	8	20	12.5	2.5	138	2	8	1
1493	Creation of 2 Ponds	8	20	12.5	2.5	138	2	11	1
1494	Creation of 2 Ponds	8	20	12.5	2.5	138	2	10	1
1495	Creation of 2 Ponds	8	20	12.5	2.5	138	2	9	1
1496	Creation of 9 Ponds	10	20	37.5	7.5	138	2	5	1
1497	Creation of 9 Ponds	10	20	37.5	7.5	138	2	6	1
1498	Creation of 9 Ponds	10	20	37.5	7.5	138	2	7	1
1499	Creation of 9 Ponds	10	20	37.5	7.5	138	2	8	1
1500	Creation of 9 Ponds	10	20	37.5	7.5	138	2	11	1
1501	Creation of 9 Ponds	10	20	37.5	7.5	138	2	10	1
1502	Creation of 9 Ponds	10	20	37.5	7.5	138	2	9	1
1503	Creation of 6 Ponds	10	20	37.5	7.5	138	2	5	1
1504	Creation of 6 Ponds	10	20	37.5	7.5	138	2	6	1
1505	Creation of 6 Ponds	10	20	37.5	7.5	138	2	7	1
1506	Creation of 6 Ponds	10	20	37.5	7.5	138	2	8	1
1507	Creation of 6 Ponds	10	20	37.5	7.5	138	2	11	1
1508	Creation of 6 Ponds	10	20	37.5	7.5	138	2	10	1
1509	Creation of 6 Ponds	10	20	37.5	7.5	138	2	9	1
1510	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	5	1
1511	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	6	1
1512	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	7	1
1513	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	8	1
1514	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	11	1
1515	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	10	1
1516	Creation of 2 Ponds	11	40	21.428571428571427	8.571428571428571	138	12	9	1
1517	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	5	1
1518	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	6	1
1519	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	7	1
1520	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	8	1
1521	Creation of 9 Ponds	15	40	50	20	138	12	11	1
1522	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	10	1
1523	Creation of 9 Ponds	16	40	57.14285714285714	22.857142857142854	138	12	9	1
1524	Creation of 6 Ponds	15	40	50	20	138	12	5	1
1525	Creation of 6 Ponds	15	40	50	20	138	12	6	1
1526	Creation of 6 Ponds	15	40	50	20	138	12	7	1
1527	Creation of 6 Ponds	15	40	50	20	138	12	8	1
1528	Creation of 6 Ponds	15	40	50	20	138	12	11	1
1529	Creation of 6 Ponds	15	40	50	20	138	12	10	1
1530	Creation of 6 Ponds	15	40	50	20	138	12	9	1
1531	Creation of 2 Ponds	14	40	0	0	138	15	5	1
1532	Creation of 2 Ponds	13	40	0	0	138	15	6	1
1533	Creation of 2 Ponds	13	40	0	0	138	15	7	1
1534	Creation of 2 Ponds	14	40	0	0	138	15	8	1
1535	Creation of 2 Ponds	17	40	13.333333333333334	5.333333333333334	138	15	11	1
1536	Creation of 2 Ponds	14	40	0	0	138	15	10	1
1537	Creation of 2 Ponds	13	40	0	0	138	15	9	1
1538	Creation of 9 Ponds	20	40	33.33333333333333	13.33333333333333	138	15	5	1
1539	Creation of 9 Ponds	19	40	26.666666666666668	10.666666666666668	138	15	6	1
1540	Creation of 9 Ponds	19	40	26.666666666666668	10.666666666666668	138	15	7	1
1541	Creation of 9 Ponds	20	40	33.33333333333333	13.33333333333333	138	15	8	1
1542	Creation of 9 Ponds	23	40	53.333333333333336	21.333333333333336	138	15	11	1
1543	Creation of 9 Ponds	19	40	26.666666666666668	10.666666666666668	138	15	10	1
1544	Creation of 9 Ponds	19	40	26.666666666666668	10.666666666666668	138	15	9	1
1545	Creation of 6 Ponds	18	40	20	8	138	15	5	1
1546	Creation of 6 Ponds	17	40	13.333333333333334	5.333333333333334	138	15	6	1
1547	Creation of 6 Ponds	17	40	13.333333333333334	5.333333333333334	138	15	7	1
1548	Creation of 6 Ponds	18	40	20	8	138	15	8	1
1549	Creation of 6 Ponds	21	40	40	16	138	15	11	1
1550	Creation of 6 Ponds	17	40	13.333333333333334	5.333333333333334	138	15	10	1
1551	Creation of 6 Ponds	17	40	13.333333333333334	5.333333333333334	138	15	9	1
1552	Creation of 2 Ponds	8	50	12.5	6.25	139	2	5	1
1553	Creation of 2 Ponds	8	50	12.5	6.25	139	2	6	1
1554	Creation of 2 Ponds	8	50	12.5	6.25	139	2	7	1
1555	Creation of 2 Ponds	8	50	12.5	6.25	139	2	8	1
1556	Creation of 2 Ponds	8	50	12.5	6.25	139	2	11	1
1557	Creation of 2 Ponds	8	50	12.5	6.25	139	2	10	1
1558	Creation of 2 Ponds	8	50	12.5	6.25	139	2	9	1
1559	Creation of 8 Ponds	10	50	37.5	18.75	139	2	5	1
1560	Creation of 8 Ponds	10	50	37.5	18.75	139	2	6	1
1561	Creation of 8 Ponds	10	50	37.5	18.75	139	2	7	1
1562	Creation of 8 Ponds	10	50	37.5	18.75	139	2	8	1
1563	Creation of 8 Ponds	10	50	37.5	18.75	139	2	11	1
1564	Creation of 8 Ponds	10	50	37.5	18.75	139	2	10	1
1565	Creation of 8 Ponds	10	50	37.5	18.75	139	2	9	1
1566	Creation of 5 Ponds	9	50	25	12.5	139	2	5	1
1567	Creation of 5 Ponds	9	50	25	12.5	139	2	6	1
1568	Creation of 5 Ponds	9	50	25	12.5	139	2	7	1
1569	Creation of 5 Ponds	9	50	25	12.5	139	2	8	1
1570	Creation of 5 Ponds	9	50	25	12.5	139	2	11	1
1571	Creation of 5 Ponds	9	50	25	12.5	139	2	10	1
1572	Creation of 5 Ponds	9	50	25	12.5	139	2	9	1
1573	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	5	1
1574	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	6	1
1575	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	7	1
1576	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	8	1
1577	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	11	1
1578	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	10	1
1579	Creation of 2 Ponds	11	50	21.428571428571427	10.714285714285714	139	12	9	1
1580	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	5	1
1581	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	6	1
1582	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	7	1
1583	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	8	1
1584	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	11	1
1585	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	10	1
1586	Creation of 8 Ponds	16	50	57.14285714285714	28.57142857142857	139	12	9	1
1587	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	5	1
1588	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	6	1
1589	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	7	1
1590	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	8	1
1591	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	11	1
1592	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	10	1
1593	Creation of 5 Ponds	14	50	42.857142857142854	21.428571428571427	139	12	9	1
1594	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	5	1
1595	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	6	1
1596	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	7	1
1597	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	8	1
1598	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	11	1
1599	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	10	1
1600	Creation of 2 Ponds	8	33.33333333333333	12.5	4.166666666666666	140	2	9	1
1601	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	5	1
1602	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	6	1
1603	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	7	1
1604	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	8	1
1605	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	11	1
1606	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	10	1
1607	Creation of 20 Ponds	12	33.33333333333333	62.5	20.83333333333333	140	2	9	1
1608	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	5	1
1609	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	6	1
1610	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	7	1
1611	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	8	1
1612	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	11	1
1613	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	10	1
1614	Creation of 11 Ponds	11	33.33333333333333	50	16.666666666666664	140	2	9	1
1615	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	5	1
1616	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	6	1
1617	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	7	1
1618	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	8	1
1619	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	11	1
1620	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	10	1
1621	Creation of 2 Ponds	11	33.33333333333333	21.428571428571427	7.1428571428571415	140	12	9	1
1622	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	5	1
1623	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	6	1
1624	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	7	1
1625	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	8	1
1626	Creation of 20 Ponds	19	33.33333333333333	78.57142857142857	26.19047619047619	140	12	11	1
1627	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	10	1
1628	Creation of 20 Ponds	20	33.33333333333333	85.71428571428571	28.571428571428566	140	12	9	1
1629	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	5	1
1630	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	6	1
1631	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	7	1
1632	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	8	1
1633	Creation of 11 Ponds	16	33.33333333333333	57.14285714285714	19.047619047619044	140	12	11	1
1634	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	10	1
1635	Creation of 11 Ponds	17	33.33333333333333	64.28571428571429	21.428571428571427	140	12	9	1
1636	Creation of 2 Ponds	14	33.33333333333333	0	0	140	15	5	1
1637	Creation of 2 Ponds	13	33.33333333333333	0	0	140	15	6	1
1638	Creation of 2 Ponds	13	33.33333333333333	0	0	140	15	7	1
1639	Creation of 2 Ponds	14	33.33333333333333	0	0	140	15	8	1
1640	Creation of 2 Ponds	17	33.33333333333333	13.333333333333334	4.444444444444444	140	15	11	1
1641	Creation of 2 Ponds	14	33.33333333333333	0	0	140	15	10	1
1642	Creation of 2 Ponds	13	33.33333333333333	0	0	140	15	9	1
1643	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	140	15	5	1
1644	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	140	15	6	1
1645	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	140	15	7	1
1646	Creation of 20 Ponds	24	33.33333333333333	60	19.999999999999996	140	15	8	1
1647	Creation of 20 Ponds	27	33.33333333333333	80	26.66666666666666	140	15	11	1
1648	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	140	15	10	1
1649	Creation of 20 Ponds	23	33.33333333333333	53.333333333333336	17.777777777777775	140	15	9	1
1650	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	140	15	5	1
1651	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	140	15	6	1
1652	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	140	15	7	1
1653	Creation of 11 Ponds	21	33.33333333333333	40	13.33333333333333	140	15	8	1
1654	Creation of 11 Ponds	24	33.33333333333333	60	19.999999999999996	140	15	11	1
1655	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	140	15	10	1
1656	Creation of 11 Ponds	20	33.33333333333333	33.33333333333333	11.111111111111109	140	15	9	1
1657	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	5	1
1658	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	6	1
1659	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	7	1
1660	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	8	1
1661	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	11	1
1662	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	10	1
1663	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	141	2	9	1
1664	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	5	1
1665	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	6	1
1666	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	7	1
1667	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	8	1
1668	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	11	1
1669	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	10	1
1670	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	141	2	9	1
1671	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	5	1
1672	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	6	1
1673	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	7	1
1674	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	8	1
1675	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	11	1
1676	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	10	1
1677	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	141	2	9	1
1678	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	5	1
1679	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	6	1
1680	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	7	1
1681	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	8	1
1682	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	11	1
1683	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	10	1
1684	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	141	12	9	1
1685	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	5	1
1686	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	6	1
1687	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	7	1
1688	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	8	1
1689	Creation of 20 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	141	12	11	1
1690	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	10	1
1691	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	141	12	9	1
1692	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	5	1
1693	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	6	1
1694	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	7	1
1695	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	8	1
1696	Creation of 11 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	141	12	11	1
1697	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	10	1
1698	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	141	12	9	1
1699	Creation of 2 Ponds	14	33.33333333333333	0	0	141	15	5	1
1700	Creation of 2 Ponds	13	33.33333333333333	0	0	141	15	6	1
1701	Creation of 2 Ponds	13	33.33333333333333	0	0	141	15	7	1
1702	Creation of 2 Ponds	14	33.33333333333333	0	0	141	15	8	1
1703	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	141	15	11	1
1704	Creation of 2 Ponds	14	33.33333333333333	0	0	141	15	10	1
1705	Creation of 2 Ponds	13	33.33333333333333	0	0	141	15	9	1
1706	Creation of 20 Ponds	24	33.33333333333333	75	24.999999999999996	141	15	5	1
1707	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	141	15	6	1
1708	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	141	15	7	1
1709	Creation of 20 Ponds	24	33.33333333333333	75	24.999999999999996	141	15	8	1
1710	Creation of 20 Ponds	27	33.33333333333333	100	33.33333333333333	141	15	11	1
1711	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	141	15	10	1
1712	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	141	15	9	1
1713	Creation of 11 Ponds	21	33.33333333333333	50	16.666666666666664	141	15	5	1
1714	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	141	15	6	1
1715	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	141	15	7	1
1716	Creation of 11 Ponds	21	33.33333333333333	50	16.666666666666664	141	15	8	1
1717	Creation of 11 Ponds	24	33.33333333333333	75	24.999999999999996	141	15	11	1
1718	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	141	15	10	1
1719	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	141	15	9	1
1720	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	5	1
1721	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	6	1
1722	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	7	1
1723	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	8	1
1724	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	11	1
1725	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	10	1
1726	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	142	2	9	1
1727	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	5	1
1728	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	6	1
1729	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	7	1
1730	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	8	1
1731	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	11	1
1732	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	10	1
1733	Creation of 20 Ponds	12	55.55555555555556	100	55.55555555555556	142	2	9	1
1734	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	5	1
1735	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	6	1
1736	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	7	1
1737	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	8	1
1738	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	11	1
1739	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	10	1
1740	Creation of 11 Ponds	11	55.55555555555556	80	44.44444444444444	142	2	9	1
1741	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	5	1
1742	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	6	1
1743	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	7	1
1744	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	8	1
1745	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	11	1
1746	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	10	1
1747	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	142	12	9	1
1748	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	5	1
1749	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	6	1
1750	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	7	1
1751	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	8	1
1752	Creation of 20 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	142	12	11	1
1753	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	10	1
1754	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	142	12	9	1
1755	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	5	1
1756	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	6	1
1757	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	7	1
1758	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	8	1
1759	Creation of 11 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	142	12	11	1
1760	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	10	1
1761	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	142	12	9	1
1762	Creation of 2 Ponds	14	11.11111111111111	0	0	142	15	5	1
1763	Creation of 2 Ponds	13	11.11111111111111	0	0	142	15	6	1
1764	Creation of 2 Ponds	13	11.11111111111111	0	0	142	15	7	1
1765	Creation of 2 Ponds	14	11.11111111111111	0	0	142	15	8	1
1766	Creation of 2 Ponds	17	11.11111111111111	16.666666666666664	1.8518518518518516	142	15	11	1
1767	Creation of 2 Ponds	14	11.11111111111111	0	0	142	15	10	1
1768	Creation of 2 Ponds	13	11.11111111111111	0	0	142	15	9	1
1769	Creation of 20 Ponds	24	11.11111111111111	75	8.333333333333332	142	15	5	1
1770	Creation of 20 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	142	15	6	1
1771	Creation of 20 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	142	15	7	1
1772	Creation of 20 Ponds	24	11.11111111111111	75	8.333333333333332	142	15	8	1
1773	Creation of 20 Ponds	27	11.11111111111111	100	11.11111111111111	142	15	11	1
1774	Creation of 20 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	142	15	10	1
1775	Creation of 20 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	142	15	9	1
1776	Creation of 11 Ponds	21	11.11111111111111	50	5.555555555555555	142	15	5	1
1777	Creation of 11 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	142	15	6	1
1778	Creation of 11 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	142	15	7	1
1779	Creation of 11 Ponds	21	11.11111111111111	50	5.555555555555555	142	15	8	1
1780	Creation of 11 Ponds	24	11.11111111111111	75	8.333333333333332	142	15	11	1
1781	Creation of 11 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	142	15	10	1
1782	Creation of 11 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	142	15	9	1
1783	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	5	1
1784	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	6	1
1785	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	7	1
1786	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	8	1
1787	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	11	1
1788	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	10	1
1789	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	143	2	9	1
1790	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	5	1
1791	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	6	1
1792	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	7	1
1793	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	8	1
1794	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	11	1
1795	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	10	1
1796	Creation of 20 Ponds	12	33.33333333333333	100	33.33333333333333	143	2	9	1
1797	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	5	1
1798	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	6	1
1799	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	7	1
1800	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	8	1
1801	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	11	1
1802	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	10	1
1803	Creation of 11 Ponds	11	33.33333333333333	80	26.66666666666666	143	2	9	1
1804	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	5	1
1805	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	6	1
1806	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	7	1
1807	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	8	1
1808	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	11	1
1809	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	10	1
1810	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	143	12	9	1
1811	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	5	1
1812	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	6	1
1813	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	7	1
1814	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	8	1
1815	Creation of 20 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	143	12	11	1
1816	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	10	1
1817	Creation of 20 Ponds	20	33.33333333333333	100	33.33333333333333	143	12	9	1
1818	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	5	1
1819	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	6	1
1820	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	7	1
1821	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	8	1
1822	Creation of 11 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	143	12	11	1
1823	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	10	1
1824	Creation of 11 Ponds	17	33.33333333333333	75	24.999999999999996	143	12	9	1
1825	Creation of 2 Ponds	14	33.33333333333333	0	0	143	15	5	1
1826	Creation of 2 Ponds	13	33.33333333333333	0	0	143	15	6	1
1827	Creation of 2 Ponds	13	33.33333333333333	0	0	143	15	7	1
1828	Creation of 2 Ponds	14	33.33333333333333	0	0	143	15	8	1
1829	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	143	15	11	1
1830	Creation of 2 Ponds	14	33.33333333333333	0	0	143	15	10	1
1831	Creation of 2 Ponds	13	33.33333333333333	0	0	143	15	9	1
1832	Creation of 20 Ponds	24	33.33333333333333	75	24.999999999999996	143	15	5	1
1833	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	143	15	6	1
1834	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	143	15	7	1
1835	Creation of 20 Ponds	24	33.33333333333333	75	24.999999999999996	143	15	8	1
1836	Creation of 20 Ponds	27	33.33333333333333	100	33.33333333333333	143	15	11	1
1837	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	143	15	10	1
1838	Creation of 20 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	143	15	9	1
1839	Creation of 11 Ponds	21	33.33333333333333	50	16.666666666666664	143	15	5	1
1840	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	143	15	6	1
1841	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	143	15	7	1
1842	Creation of 11 Ponds	21	33.33333333333333	50	16.666666666666664	143	15	8	1
1843	Creation of 11 Ponds	24	33.33333333333333	75	24.999999999999996	143	15	11	1
1844	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	143	15	10	1
1845	Creation of 11 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	143	15	9	1
1846	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	5	1
1847	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	6	1
1848	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	7	1
1849	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	8	1
1850	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	11	1
1851	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	10	1
1852	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	144	2	9	1
1853	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	5	1
1854	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	6	1
1855	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	7	1
1856	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	8	1
1857	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	11	1
1858	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	10	1
1859	Creation of 9 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	9	1
1860	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	5	1
1861	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	6	1
1862	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	7	1
1863	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	8	1
1864	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	11	1
1865	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	10	1
1866	Creation of 6 Ponds	10	33.33333333333333	60	19.999999999999996	144	2	9	1
1867	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	5	1
1868	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	6	1
1869	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	7	1
1870	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	8	1
1871	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	11	1
1872	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	10	1
1873	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	144	12	9	1
1874	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	5	1
1875	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	6	1
1876	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	7	1
1877	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	8	1
1878	Creation of 9 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	11	1
1879	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	10	1
1880	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	144	12	9	1
1881	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	5	1
1882	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	6	1
1883	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	7	1
1884	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	8	1
1885	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	11	1
1886	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	10	1
1887	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	144	12	9	1
1888	Creation of 2 Ponds	14	33.33333333333333	0	0	144	15	5	1
1889	Creation of 2 Ponds	13	33.33333333333333	0	0	144	15	6	1
1890	Creation of 2 Ponds	13	33.33333333333333	0	0	144	15	7	1
1891	Creation of 2 Ponds	14	33.33333333333333	0	0	144	15	8	1
1892	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	144	15	11	1
1893	Creation of 2 Ponds	14	33.33333333333333	0	0	144	15	10	1
1894	Creation of 2 Ponds	13	33.33333333333333	0	0	144	15	9	1
1895	Creation of 9 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	144	15	5	1
1896	Creation of 9 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	144	15	6	1
1897	Creation of 9 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	144	15	7	1
1898	Creation of 9 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	144	15	8	1
1899	Creation of 9 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	144	15	11	1
1900	Creation of 9 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	144	15	10	1
1901	Creation of 9 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	144	15	9	1
1902	Creation of 6 Ponds	18	33.33333333333333	25	8.333333333333332	144	15	5	1
1903	Creation of 6 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	144	15	6	1
1904	Creation of 6 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	144	15	7	1
1905	Creation of 6 Ponds	18	33.33333333333333	25	8.333333333333332	144	15	8	1
1906	Creation of 6 Ponds	21	33.33333333333333	50	16.666666666666664	144	15	11	1
1907	Creation of 6 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	144	15	10	1
1908	Creation of 6 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	144	15	9	1
1909	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	5	1
1910	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	6	1
1911	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	7	1
1912	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	8	1
1913	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	11	1
1914	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	10	1
1915	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	145	2	9	1
1916	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	5	1
1917	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	6	1
1918	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	7	1
1919	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	8	1
1920	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	11	1
1921	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	10	1
1922	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	145	2	9	1
1923	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	5	1
1924	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	6	1
1925	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	7	1
1926	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	8	1
1927	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	11	1
1928	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	10	1
1929	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	145	2	9	1
1930	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	5	1
1931	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	6	1
1932	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	7	1
1933	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	8	1
1934	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	11	1
1935	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	10	1
1936	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	9	1
1937	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	5	1
1938	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	6	1
1939	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	7	1
1940	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	8	1
1941	Creation of 12 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	11	1
1942	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	10	1
1943	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	9	1
1944	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	5	1
1945	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	6	1
1946	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	7	1
1947	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	8	1
1948	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	11	1
1949	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	10	1
1950	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	9	1
1951	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	5	1
1952	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	6	1
1953	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	7	1
1954	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	8	1
1955	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	145	15	11	1
1956	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	10	1
1957	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	9	1
1958	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	5	1
1959	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	6	1
1960	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	7	1
1961	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	8	1
1962	Creation of 12 Ponds	24	33.33333333333333	75	24.999999999999996	145	15	11	1
1963	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	10	1
1964	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	9	1
1965	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	145	15	5	1
1966	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	6	1
1967	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	7	1
1968	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	145	15	8	1
1969	Creation of 7 Ponds	22	33.33333333333333	58.333333333333336	19.444444444444443	145	15	11	1
1970	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	10	1
1971	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	9	1
2014	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	5	1
2015	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	6	1
2016	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	7	1
2017	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	8	1
2018	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	11	1
2019	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	10	1
2020	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	9	1
2021	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	5	1
2022	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	6	1
2023	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	7	1
2024	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	8	1
2025	Creation of 12 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	11	1
2026	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	10	1
2027	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	145	12	9	1
2028	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	5	1
2029	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	6	1
2030	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	7	1
2031	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	8	1
2032	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	11	1
2033	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	10	1
2034	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	145	12	9	1
2035	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	5	1
2036	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	6	1
2037	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	7	1
2038	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	8	1
2039	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	11	1
2040	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	10	1
2041	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	145	12	9	1
2042	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	5	1
2043	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	6	1
2044	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	7	1
2045	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	8	1
2046	Creation of 19 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	145	12	11	1
2047	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	10	1
2048	Creation of 19 Ponds	20	33.33333333333333	100	33.33333333333333	145	12	9	1
2049	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	5	1
2050	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	6	1
2051	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	7	1
2052	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	8	1
2053	Creation of 10 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	145	12	11	1
2054	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	10	1
2055	Creation of 10 Ponds	17	33.33333333333333	75	24.999999999999996	145	12	9	1
2056	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	5	1
2057	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	6	1
2058	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	7	1
2059	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	8	1
2060	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	145	15	11	1
2061	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	10	1
2062	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	9	1
2063	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	5	1
2064	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	6	1
2065	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	7	1
2066	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	8	1
2067	Creation of 12 Ponds	24	33.33333333333333	75	24.999999999999996	145	15	11	1
2068	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	10	1
2069	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	9	1
2070	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	145	15	5	1
2071	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	6	1
2072	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	7	1
2073	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	145	15	8	1
2074	Creation of 7 Ponds	22	33.33333333333333	58.333333333333336	19.444444444444443	145	15	11	1
2075	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	10	1
2076	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	145	15	9	1
2077	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	5	1
2078	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	6	1
2079	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	7	1
2080	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	8	1
2081	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	145	15	11	1
2082	Creation of 2 Ponds	14	33.33333333333333	0	0	145	15	10	1
2083	Creation of 2 Ponds	13	33.33333333333333	0	0	145	15	9	1
2084	Creation of 19 Ponds	24	33.33333333333333	75	24.999999999999996	145	15	5	1
2085	Creation of 19 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	145	15	6	1
2086	Creation of 19 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	145	15	7	1
2087	Creation of 19 Ponds	24	33.33333333333333	75	24.999999999999996	145	15	8	1
2088	Creation of 19 Ponds	27	33.33333333333333	100	33.33333333333333	145	15	11	1
2089	Creation of 19 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	145	15	10	1
2090	Creation of 19 Ponds	23	33.33333333333333	66.66666666666666	22.222222222222218	145	15	9	1
2091	Creation of 10 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	5	1
2092	Creation of 10 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	6	1
2093	Creation of 10 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	7	1
2094	Creation of 10 Ponds	21	33.33333333333333	50	16.666666666666664	145	15	8	1
2095	Creation of 10 Ponds	24	33.33333333333333	75	24.999999999999996	145	15	11	1
2096	Creation of 10 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	10	1
2097	Creation of 10 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	145	15	9	1
2098	Creation of 2 Ponds	8	20	20	4	146	2	5	1
2099	Creation of 2 Ponds	8	20	20	4	146	2	6	1
2100	Creation of 2 Ponds	8	20	20	4	146	2	7	1
2101	Creation of 2 Ponds	8	20	20	4	146	2	8	1
2102	Creation of 2 Ponds	8	20	20	4	146	2	11	1
2103	Creation of 2 Ponds	8	20	20	4	146	2	10	1
2104	Creation of 2 Ponds	8	20	20	4	146	2	9	1
2105	Creation of 18 Ponds	12	20	100	20	146	2	5	1
2106	Creation of 18 Ponds	12	20	100	20	146	2	6	1
2107	Creation of 18 Ponds	12	20	100	20	146	2	7	1
2108	Creation of 18 Ponds	12	20	100	20	146	2	8	1
2109	Creation of 18 Ponds	12	20	100	20	146	2	11	1
2110	Creation of 18 Ponds	12	20	100	20	146	2	10	1
2111	Creation of 18 Ponds	12	20	100	20	146	2	9	1
2112	Creation of 10 Ponds	11	20	80	16	146	2	5	1
2113	Creation of 10 Ponds	11	20	80	16	146	2	6	1
2114	Creation of 10 Ponds	11	20	80	16	146	2	7	1
2115	Creation of 10 Ponds	11	20	80	16	146	2	8	1
2116	Creation of 10 Ponds	11	20	80	16	146	2	11	1
2117	Creation of 10 Ponds	11	20	80	16	146	2	10	1
2118	Creation of 10 Ponds	11	20	80	16	146	2	9	1
2119	Creation of 2 Ponds	11	40	25	10	146	12	5	1
2120	Creation of 2 Ponds	11	40	25	10	146	12	6	1
2121	Creation of 2 Ponds	11	40	25	10	146	12	7	1
2122	Creation of 2 Ponds	11	40	25	10	146	12	8	1
2123	Creation of 2 Ponds	11	40	25	10	146	12	11	1
2124	Creation of 2 Ponds	11	40	25	10	146	12	10	1
2125	Creation of 2 Ponds	11	40	25	10	146	12	9	1
2126	Creation of 18 Ponds	20	40	100	40	146	12	5	1
2127	Creation of 18 Ponds	20	40	100	40	146	12	6	1
2128	Creation of 18 Ponds	20	40	100	40	146	12	7	1
2129	Creation of 18 Ponds	20	40	100	40	146	12	8	1
2130	Creation of 18 Ponds	19	40	91.66666666666666	36.66666666666666	146	12	11	1
2131	Creation of 18 Ponds	20	40	100	40	146	12	10	1
2132	Creation of 18 Ponds	20	40	100	40	146	12	9	1
2133	Creation of 10 Ponds	17	40	75	30	146	12	5	1
2134	Creation of 10 Ponds	17	40	75	30	146	12	6	1
2135	Creation of 10 Ponds	17	40	75	30	146	12	7	1
2136	Creation of 10 Ponds	17	40	75	30	146	12	8	1
2137	Creation of 10 Ponds	16	40	66.66666666666666	26.66666666666666	146	12	11	1
2138	Creation of 10 Ponds	17	40	75	30	146	12	10	1
2139	Creation of 10 Ponds	17	40	75	30	146	12	9	1
2140	Creation of 2 Ponds	14	40	0	0	146	15	5	1
2141	Creation of 2 Ponds	13	40	0	0	146	15	6	1
2142	Creation of 2 Ponds	13	40	0	0	146	15	7	1
2143	Creation of 2 Ponds	14	40	0	0	146	15	8	1
2144	Creation of 2 Ponds	17	40	16.666666666666664	6.666666666666665	146	15	11	1
2145	Creation of 2 Ponds	14	40	0	0	146	15	10	1
2146	Creation of 2 Ponds	13	40	0	0	146	15	9	1
2147	Creation of 18 Ponds	23	40	66.66666666666666	26.66666666666666	146	15	5	1
2148	Creation of 18 Ponds	22	40	58.333333333333336	23.333333333333336	146	15	6	1
2149	Creation of 18 Ponds	22	40	58.333333333333336	23.333333333333336	146	15	7	1
2150	Creation of 18 Ponds	23	40	66.66666666666666	26.66666666666666	146	15	8	1
2151	Creation of 18 Ponds	26	40	91.66666666666666	36.66666666666666	146	15	11	1
2152	Creation of 18 Ponds	22	40	58.333333333333336	23.333333333333336	146	15	10	1
2153	Creation of 18 Ponds	22	40	58.333333333333336	23.333333333333336	146	15	9	1
2154	Creation of 10 Ponds	21	40	50	20	146	15	5	1
2155	Creation of 10 Ponds	20	40	41.66666666666667	16.66666666666667	146	15	6	1
2156	Creation of 10 Ponds	20	40	41.66666666666667	16.66666666666667	146	15	7	1
2157	Creation of 10 Ponds	21	40	50	20	146	15	8	1
2158	Creation of 10 Ponds	24	40	75	30	146	15	11	1
2159	Creation of 10 Ponds	20	40	41.66666666666667	16.66666666666667	146	15	10	1
2160	Creation of 10 Ponds	20	40	41.66666666666667	16.66666666666667	146	15	9	1
2161	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	5	1
2162	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	6	1
2163	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	7	1
2164	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	8	1
2165	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	11	1
2166	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	10	1
2167	Creation of 2 Ponds	8	33.33333333333333	20	6.666666666666665	147	2	9	1
2168	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	5	1
2169	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	6	1
2170	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	7	1
2171	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	8	1
2172	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	11	1
2173	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	10	1
2174	Creation of 12 Ponds	11	33.33333333333333	80	26.66666666666666	147	2	9	1
2175	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	5	1
2176	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	6	1
2177	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	7	1
2178	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	8	1
2179	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	11	1
2180	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	10	1
2181	Creation of 7 Ponds	10	33.33333333333333	60	19.999999999999996	147	2	9	1
2182	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	5	1
2183	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	6	1
2184	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	7	1
2185	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	8	1
2186	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	11	1
2187	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	10	1
2188	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	147	12	9	1
2189	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	5	1
2190	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	6	1
2191	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	7	1
2192	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	8	1
2193	Creation of 12 Ponds	17	33.33333333333333	75	24.999999999999996	147	12	11	1
2194	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	10	1
2195	Creation of 12 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	147	12	9	1
2196	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	5	1
2197	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	6	1
2198	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	7	1
2199	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	8	1
2200	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	11	1
2201	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	10	1
2202	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	147	12	9	1
2203	Creation of 2 Ponds	14	33.33333333333333	0	0	147	15	5	1
2204	Creation of 2 Ponds	13	33.33333333333333	0	0	147	15	6	1
2205	Creation of 2 Ponds	13	33.33333333333333	0	0	147	15	7	1
2206	Creation of 2 Ponds	14	33.33333333333333	0	0	147	15	8	1
2207	Creation of 2 Ponds	17	33.33333333333333	16.666666666666664	5.5555555555555545	147	15	11	1
2208	Creation of 2 Ponds	14	33.33333333333333	0	0	147	15	10	1
2209	Creation of 2 Ponds	13	33.33333333333333	0	0	147	15	9	1
2210	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	147	15	5	1
2211	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	147	15	6	1
2212	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	147	15	7	1
2213	Creation of 12 Ponds	21	33.33333333333333	50	16.666666666666664	147	15	8	1
2214	Creation of 12 Ponds	24	33.33333333333333	75	24.999999999999996	147	15	11	1
2215	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	147	15	10	1
2216	Creation of 12 Ponds	20	33.33333333333333	41.66666666666667	13.88888888888889	147	15	9	1
2217	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	147	15	5	1
2218	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	147	15	6	1
2219	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	147	15	7	1
2220	Creation of 7 Ponds	19	33.33333333333333	33.33333333333333	11.111111111111109	147	15	8	1
2221	Creation of 7 Ponds	22	33.33333333333333	58.333333333333336	19.444444444444443	147	15	11	1
2222	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	147	15	10	1
2223	Creation of 7 Ponds	18	33.33333333333333	25	8.333333333333332	147	15	9	1
2224	Creation of 2 Ponds	8	50	20	10	153	2	5	1
2225	Creation of 2 Ponds	8	50	20	10	153	2	6	1
2226	Creation of 2 Ponds	8	50	20	10	153	2	7	1
2227	Creation of 2 Ponds	8	50	20	10	153	2	8	1
2228	Creation of 2 Ponds	8	50	20	10	153	2	11	1
2229	Creation of 2 Ponds	8	50	20	10	153	2	10	1
2230	Creation of 2 Ponds	8	50	20	10	153	2	9	1
2231	Creation of 18 Ponds	12	50	100	50	153	2	5	1
2232	Creation of 18 Ponds	12	50	100	50	153	2	6	1
2233	Creation of 18 Ponds	12	50	100	50	153	2	7	1
2234	Creation of 18 Ponds	12	50	100	50	153	2	8	1
2235	Creation of 18 Ponds	12	50	100	50	153	2	11	1
2236	Creation of 18 Ponds	12	50	100	50	153	2	10	1
2237	Creation of 18 Ponds	12	50	100	50	153	2	9	1
2238	Creation of 10 Ponds	11	50	80	40	153	2	5	1
2239	Creation of 10 Ponds	11	50	80	40	153	2	6	1
2240	Creation of 10 Ponds	11	50	80	40	153	2	7	1
2241	Creation of 10 Ponds	11	50	80	40	153	2	8	1
2242	Creation of 10 Ponds	11	50	80	40	153	2	11	1
2243	Creation of 10 Ponds	11	50	80	40	153	2	10	1
2244	Creation of 10 Ponds	11	50	80	40	153	2	9	1
2245	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	5	1
2246	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	6	1
2247	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	7	1
2248	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	8	1
2249	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	11	1
2250	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	10	1
2251	Creation of 2 Ponds	11	41.66666666666667	25	10.416666666666668	153	12	9	1
2252	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	5	1
2253	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	6	1
2254	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	7	1
2255	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	8	1
2256	Creation of 18 Ponds	19	41.66666666666667	91.66666666666666	38.19444444444444	153	12	11	1
2257	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	10	1
2258	Creation of 18 Ponds	20	41.66666666666667	100	41.66666666666667	153	12	9	1
2259	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	5	1
2260	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	6	1
2261	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	7	1
2262	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	8	1
2263	Creation of 10 Ponds	16	41.66666666666667	66.66666666666666	27.77777777777778	153	12	11	1
2264	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	10	1
2265	Creation of 10 Ponds	17	41.66666666666667	75	31.250000000000004	153	12	9	1
2266	Creation of 2 Ponds	14	8.333333333333332	0	0	153	15	5	1
2267	Creation of 2 Ponds	13	8.333333333333332	0	0	153	15	6	1
2268	Creation of 2 Ponds	13	8.333333333333332	0	0	153	15	7	1
2269	Creation of 2 Ponds	14	8.333333333333332	0	0	153	15	8	1
2270	Creation of 2 Ponds	17	8.333333333333332	16.666666666666664	1.3888888888888886	153	15	11	1
2271	Creation of 2 Ponds	14	8.333333333333332	0	0	153	15	10	1
2272	Creation of 2 Ponds	13	8.333333333333332	0	0	153	15	9	1
2273	Creation of 18 Ponds	23	8.333333333333332	66.66666666666666	5.5555555555555545	153	15	5	1
2274	Creation of 18 Ponds	22	8.333333333333332	58.333333333333336	4.861111111111111	153	15	6	1
2275	Creation of 18 Ponds	22	8.333333333333332	58.333333333333336	4.861111111111111	153	15	7	1
2276	Creation of 18 Ponds	23	8.333333333333332	66.66666666666666	5.5555555555555545	153	15	8	1
2277	Creation of 18 Ponds	26	8.333333333333332	91.66666666666666	7.638888888888887	153	15	11	1
2278	Creation of 18 Ponds	22	8.333333333333332	58.333333333333336	4.861111111111111	153	15	10	1
2279	Creation of 18 Ponds	22	8.333333333333332	58.333333333333336	4.861111111111111	153	15	9	1
2280	Creation of 10 Ponds	21	8.333333333333332	50	4.166666666666666	153	15	5	1
2281	Creation of 10 Ponds	20	8.333333333333332	41.66666666666667	3.4722222222222223	153	15	6	1
2282	Creation of 10 Ponds	20	8.333333333333332	41.66666666666667	3.4722222222222223	153	15	7	1
2283	Creation of 10 Ponds	21	8.333333333333332	50	4.166666666666666	153	15	8	1
2284	Creation of 10 Ponds	24	8.333333333333332	75	6.249999999999999	153	15	11	1
2285	Creation of 10 Ponds	20	8.333333333333332	41.66666666666667	3.4722222222222223	153	15	10	1
2286	Creation of 10 Ponds	20	8.333333333333332	41.66666666666667	3.4722222222222223	153	15	9	1
2287	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	5	1
2288	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	6	1
2289	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	7	1
2290	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	8	1
2291	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	11	1
2292	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	10	1
2293	Creation of 2 Ponds	8	55.55555555555556	20	11.11111111111111	155	2	9	1
2294	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	5	1
2295	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	6	1
2296	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	7	1
2297	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	8	1
2298	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	11	1
2299	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	10	1
2300	Creation of 15 Ponds	11	55.55555555555556	80	44.44444444444444	155	2	9	1
2301	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	5	1
2302	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	6	1
2303	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	7	1
2304	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	8	1
2305	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	11	1
2306	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	10	1
2307	Creation of 8 Ponds	10	55.55555555555556	60	33.333333333333336	155	2	9	1
2308	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	5	1
2309	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	6	1
2310	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	7	1
2311	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	8	1
2312	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	11	1
2313	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	10	1
2314	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	155	12	9	1
2315	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	5	1
2316	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	6	1
2317	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	7	1
2318	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	8	1
2319	Creation of 15 Ponds	18	33.33333333333333	83.33333333333334	27.77777777777778	155	12	11	1
2320	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	10	1
2321	Creation of 15 Ponds	19	33.33333333333333	91.66666666666666	30.555555555555546	155	12	9	1
2322	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	5	1
2323	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	6	1
2324	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	7	1
2325	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	8	1
2326	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	11	1
2327	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	10	1
2328	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	155	12	9	1
2329	Creation of 2 Ponds	14	11.11111111111111	0	0	155	15	5	1
2330	Creation of 2 Ponds	13	11.11111111111111	0	0	155	15	6	1
2331	Creation of 2 Ponds	13	11.11111111111111	0	0	155	15	7	1
2332	Creation of 2 Ponds	14	11.11111111111111	0	0	155	15	8	1
2333	Creation of 2 Ponds	17	11.11111111111111	16.666666666666664	1.8518518518518516	155	15	11	1
2334	Creation of 2 Ponds	14	11.11111111111111	0	0	155	15	10	1
2335	Creation of 2 Ponds	13	11.11111111111111	0	0	155	15	9	1
2336	Creation of 15 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	155	15	5	1
2337	Creation of 15 Ponds	22	11.11111111111111	58.333333333333336	6.481481481481482	155	15	6	1
2338	Creation of 15 Ponds	22	11.11111111111111	58.333333333333336	6.481481481481482	155	15	7	1
2339	Creation of 15 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	155	15	8	1
2340	Creation of 15 Ponds	26	11.11111111111111	91.66666666666666	10.185185185185183	155	15	11	1
2341	Creation of 15 Ponds	22	11.11111111111111	58.333333333333336	6.481481481481482	155	15	10	1
2342	Creation of 15 Ponds	22	11.11111111111111	58.333333333333336	6.481481481481482	155	15	9	1
2343	Creation of 8 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	155	15	5	1
2344	Creation of 8 Ponds	19	11.11111111111111	33.33333333333333	3.7037037037037033	155	15	6	1
2345	Creation of 8 Ponds	19	11.11111111111111	33.33333333333333	3.7037037037037033	155	15	7	1
2346	Creation of 8 Ponds	20	11.11111111111111	41.66666666666667	4.62962962962963	155	15	8	1
2347	Creation of 8 Ponds	23	11.11111111111111	66.66666666666666	7.4074074074074066	155	15	11	1
2348	Creation of 8 Ponds	19	11.11111111111111	33.33333333333333	3.7037037037037033	155	15	10	1
2349	Creation of 8 Ponds	19	11.11111111111111	33.33333333333333	3.7037037037037033	155	15	9	1
2350	Creation of 2 Ponds	8	25	20	5	161	2	5	1
2351	Creation of 2 Ponds	8	25	20	5	161	2	6	1
2352	Creation of 2 Ponds	8	25	20	5	161	2	7	1
2353	Creation of 2 Ponds	8	25	20	5	161	2	8	1
2354	Creation of 2 Ponds	8	25	20	5	161	2	11	1
2355	Creation of 2 Ponds	8	25	20	5	161	2	10	1
2356	Creation of 2 Ponds	8	25	20	5	161	2	9	1
2357	Creation of 12 Ponds	11	25	80	20	161	2	5	1
2358	Creation of 12 Ponds	11	25	80	20	161	2	6	1
2359	Creation of 12 Ponds	11	25	80	20	161	2	7	1
2360	Creation of 12 Ponds	11	25	80	20	161	2	8	1
2361	Creation of 12 Ponds	11	25	80	20	161	2	11	1
2362	Creation of 12 Ponds	11	25	80	20	161	2	10	1
2363	Creation of 12 Ponds	11	25	80	20	161	2	9	1
2364	Creation of 7 Ponds	10	25	60	15	161	2	5	1
2365	Creation of 7 Ponds	10	25	60	15	161	2	6	1
2366	Creation of 7 Ponds	10	25	60	15	161	2	7	1
2367	Creation of 7 Ponds	10	25	60	15	161	2	8	1
2368	Creation of 7 Ponds	10	25	60	15	161	2	11	1
2369	Creation of 7 Ponds	10	25	60	15	161	2	10	1
2370	Creation of 7 Ponds	10	25	60	15	161	2	9	1
2371	Creation of 2 Ponds	11	75	25	18.75	161	12	5	1
2372	Creation of 2 Ponds	11	75	25	18.75	161	12	6	1
2373	Creation of 2 Ponds	11	75	25	18.75	161	12	7	1
2374	Creation of 2 Ponds	11	75	25	18.75	161	12	8	1
2375	Creation of 2 Ponds	11	75	25	18.75	161	12	11	1
2376	Creation of 2 Ponds	11	75	25	18.75	161	12	10	1
2377	Creation of 2 Ponds	11	75	25	18.75	161	12	9	1
2378	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	5	1
2379	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	6	1
2380	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	7	1
2381	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	8	1
2382	Creation of 12 Ponds	17	75	75	56.25	161	12	11	1
2383	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	10	1
2384	Creation of 12 Ponds	18	75	83.33333333333334	62.50000000000001	161	12	9	1
2385	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	5	1
2386	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	6	1
2387	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	7	1
2388	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	8	1
2389	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	11	1
2390	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	10	1
2391	Creation of 7 Ponds	15	75	58.333333333333336	43.75	161	12	9	1
2392	Creation of 2 Ponds	8	50	20	10	165	2	5	1
2393	Creation of 2 Ponds	8	50	20	10	165	2	6	1
2394	Creation of 2 Ponds	8	50	20	10	165	2	7	1
2395	Creation of 2 Ponds	8	50	20	10	165	2	8	1
2396	Creation of 2 Ponds	8	50	20	10	165	2	11	1
2397	Creation of 2 Ponds	8	50	20	10	165	2	10	1
2398	Creation of 2 Ponds	8	50	20	10	165	2	9	1
2399	Creation of 7 Ponds	10	50	60	30	165	2	5	1
2400	Creation of 7 Ponds	10	50	60	30	165	2	6	1
2401	Creation of 7 Ponds	10	50	60	30	165	2	7	1
2402	Creation of 7 Ponds	10	50	60	30	165	2	8	1
2403	Creation of 7 Ponds	10	50	60	30	165	2	11	1
2404	Creation of 7 Ponds	10	50	60	30	165	2	10	1
2405	Creation of 7 Ponds	10	50	60	30	165	2	9	1
2406	Creation of 4 Ponds	9	50	40	20	165	2	5	1
2407	Creation of 4 Ponds	9	50	40	20	165	2	6	1
2408	Creation of 4 Ponds	9	50	40	20	165	2	7	1
2409	Creation of 4 Ponds	9	50	40	20	165	2	8	1
2410	Creation of 4 Ponds	9	50	40	20	165	2	11	1
2411	Creation of 4 Ponds	9	50	40	20	165	2	10	1
2412	Creation of 4 Ponds	9	50	40	20	165	2	9	1
2413	Creation of 2 Ponds	11	50	25	12.5	165	12	5	1
2414	Creation of 2 Ponds	11	50	25	12.5	165	12	6	1
2415	Creation of 2 Ponds	11	50	25	12.5	165	12	7	1
2416	Creation of 2 Ponds	11	50	25	12.5	165	12	8	1
2417	Creation of 2 Ponds	11	50	25	12.5	165	12	11	1
2418	Creation of 2 Ponds	11	50	25	12.5	165	12	10	1
2419	Creation of 2 Ponds	11	50	25	12.5	165	12	9	1
2420	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	5	1
2421	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	6	1
2422	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	7	1
2423	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	8	1
2424	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	11	1
2425	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	10	1
2426	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	165	12	9	1
2427	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	5	1
2428	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	6	1
2429	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	7	1
2430	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	8	1
2431	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	11	1
2432	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	10	1
2433	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	165	12	9	1
2434	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	5	1
2435	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	6	1
2436	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	7	1
2437	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	8	1
2438	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	11	1
2439	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	10	1
2440	Creation of 2 Ponds	8	45.45454545454545	20	9.09090909090909	166	2	9	1
2441	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	5	1
2442	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	6	1
2443	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	7	1
2444	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	8	1
2445	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	11	1
2446	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	10	1
2447	Creation of 4 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	9	1
2448	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	5	1
2449	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	6	1
2450	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	7	1
2451	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	8	1
2452	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	11	1
2453	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	10	1
2454	Creation of 3 Ponds	9	45.45454545454545	40	18.18181818181818	166	2	9	1
2455	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	5	1
2456	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	6	1
2457	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	7	1
2458	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	8	1
2459	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	11	1
2460	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	10	1
2461	Creation of 2 Ponds	11	9.090909090909092	25	2.272727272727273	166	12	9	1
2462	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	5	1
2463	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	6	1
2464	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	7	1
2465	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	8	1
2466	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	11	1
2467	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	10	1
2468	Creation of 4 Ponds	13	9.090909090909092	41.66666666666667	3.7878787878787885	166	12	9	1
2469	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	5	1
2470	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	6	1
2471	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	7	1
2472	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	8	1
2473	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	11	1
2474	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	10	1
2475	Creation of 3 Ponds	12	9.090909090909092	33.33333333333333	3.03030303030303	166	12	9	1
2476	Creation of 2 Ponds	14	45.45454545454545	0	0	166	15	5	1
2477	Creation of 2 Ponds	13	45.45454545454545	0	0	166	15	6	1
2478	Creation of 2 Ponds	13	45.45454545454545	0	0	166	15	7	1
2479	Creation of 2 Ponds	14	45.45454545454545	0	0	166	15	8	1
2480	Creation of 2 Ponds	17	45.45454545454545	16.666666666666664	7.575757575757574	166	15	11	1
2481	Creation of 2 Ponds	14	45.45454545454545	0	0	166	15	10	1
2482	Creation of 2 Ponds	13	45.45454545454545	0	0	166	15	9	1
2483	Creation of 4 Ponds	17	45.45454545454545	16.666666666666664	7.575757575757574	166	15	5	1
2484	Creation of 4 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	6	1
2485	Creation of 4 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	7	1
2486	Creation of 4 Ponds	17	45.45454545454545	16.666666666666664	7.575757575757574	166	15	8	1
2487	Creation of 4 Ponds	20	45.45454545454545	41.66666666666667	18.93939393939394	166	15	11	1
2488	Creation of 4 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	10	1
2489	Creation of 4 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	9	1
2490	Creation of 3 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	5	1
2491	Creation of 3 Ponds	15	45.45454545454545	0	0	166	15	6	1
2492	Creation of 3 Ponds	15	45.45454545454545	0	0	166	15	7	1
2493	Creation of 3 Ponds	16	45.45454545454545	8.333333333333332	3.787878787878787	166	15	8	1
2494	Creation of 3 Ponds	19	45.45454545454545	33.33333333333333	15.151515151515149	166	15	11	1
2495	Creation of 3 Ponds	15	45.45454545454545	0	0	166	15	10	1
2496	Creation of 3 Ponds	15	45.45454545454545	0	0	166	15	9	1
2497	Creation of 2 Ponds	8	60	20	12	173	2	5	1
2498	Creation of 2 Ponds	8	60	20	12	173	2	6	1
2499	Creation of 2 Ponds	8	60	20	12	173	2	7	1
2500	Creation of 2 Ponds	8	60	20	12	173	2	8	1
2501	Creation of 2 Ponds	8	60	20	12	173	2	11	1
2502	Creation of 2 Ponds	8	60	20	12	173	2	10	1
2503	Creation of 2 Ponds	8	60	20	12	173	2	9	1
2504	Creation of 8 Ponds	10	60	60	36	173	2	5	1
2505	Creation of 8 Ponds	10	60	60	36	173	2	6	1
2506	Creation of 8 Ponds	10	60	60	36	173	2	7	1
2507	Creation of 8 Ponds	10	60	60	36	173	2	8	1
2508	Creation of 8 Ponds	10	60	60	36	173	2	11	1
2509	Creation of 8 Ponds	10	60	60	36	173	2	10	1
2510	Creation of 8 Ponds	10	60	60	36	173	2	9	1
2511	Creation of 5 Ponds	9	60	40	24	173	2	5	1
2512	Creation of 5 Ponds	9	60	40	24	173	2	6	1
2513	Creation of 5 Ponds	9	60	40	24	173	2	7	1
2514	Creation of 5 Ponds	9	60	40	24	173	2	8	1
2515	Creation of 5 Ponds	9	60	40	24	173	2	11	1
2516	Creation of 5 Ponds	9	60	40	24	173	2	10	1
2517	Creation of 5 Ponds	9	60	40	24	173	2	9	1
2518	Creation of 2 Ponds	11	40	25	10	173	12	5	1
2519	Creation of 2 Ponds	11	40	25	10	173	12	6	1
2520	Creation of 2 Ponds	11	40	25	10	173	12	7	1
2521	Creation of 2 Ponds	11	40	25	10	173	12	8	1
2522	Creation of 2 Ponds	11	40	25	10	173	12	11	1
2523	Creation of 2 Ponds	11	40	25	10	173	12	10	1
2524	Creation of 2 Ponds	11	40	25	10	173	12	9	1
2525	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	5	1
2526	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	6	1
2527	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	7	1
2528	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	8	1
2529	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	11	1
2530	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	10	1
2531	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	173	12	9	1
2532	Creation of 5 Ponds	14	40	50	20	173	12	5	1
2533	Creation of 5 Ponds	14	40	50	20	173	12	6	1
2534	Creation of 5 Ponds	14	40	50	20	173	12	7	1
2535	Creation of 5 Ponds	14	40	50	20	173	12	8	1
2536	Creation of 5 Ponds	14	40	50	20	173	12	11	1
2537	Creation of 5 Ponds	14	40	50	20	173	12	10	1
2538	Creation of 5 Ponds	14	40	50	20	173	12	9	1
2539	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	5	1
2540	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	6	1
2541	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	7	1
2542	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	8	1
2543	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	11	1
2544	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	10	1
2545	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	174	2	9	1
2546	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	5	1
2547	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	6	1
2548	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	7	1
2549	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	8	1
2550	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	11	1
2551	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	10	1
2552	Creation of 9 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	9	1
2553	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	5	1
2554	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	6	1
2555	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	7	1
2556	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	8	1
2557	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	11	1
2558	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	10	1
2559	Creation of 6 Ponds	10	66.66666666666666	60	39.99999999999999	174	2	9	1
2560	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	5	1
2561	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	6	1
2562	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	7	1
2563	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	8	1
2564	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	11	1
2565	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	10	1
2566	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	174	12	9	1
2567	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	5	1
2568	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	6	1
2569	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	7	1
2570	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	8	1
2571	Creation of 9 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	11	1
2572	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	10	1
2573	Creation of 9 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	174	12	9	1
2574	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	5	1
2575	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	6	1
2576	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	7	1
2577	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	8	1
2578	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	11	1
2579	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	10	1
2580	Creation of 6 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	174	12	9	1
2581	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	5	1
2582	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	6	1
2583	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	7	1
2584	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	8	1
2585	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	11	1
2586	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	10	1
2587	Creation of 2 Ponds	8	84.61538461538461	20	16.923076923076923	176	2	9	1
2588	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	5	1
2589	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	6	1
2590	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	7	1
2591	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	8	1
2592	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	11	1
2593	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	10	1
2594	Creation of 9 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	9	1
2595	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	5	1
2596	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	6	1
2597	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	7	1
2598	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	8	1
2599	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	11	1
2600	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	10	1
2601	Creation of 6 Ponds	10	84.61538461538461	60	50.769230769230774	176	2	9	1
2602	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	5	1
2603	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	6	1
2604	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	7	1
2605	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	8	1
2606	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	11	1
2607	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	10	1
2608	Creation of 2 Ponds	11	15.384615384615385	25	3.8461538461538463	176	12	9	1
2609	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	5	1
2610	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	6	1
2611	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	7	1
2612	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	8	1
2613	Creation of 9 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	11	1
2614	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	10	1
2615	Creation of 9 Ponds	16	15.384615384615385	66.66666666666666	10.256410256410255	176	12	9	1
2616	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	5	1
2617	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	6	1
2618	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	7	1
2619	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	8	1
2620	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	11	1
2621	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	10	1
2622	Creation of 6 Ponds	15	15.384615384615385	58.333333333333336	8.974358974358974	176	12	9	1
2623	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	5	5
2624	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	6	5
2625	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	7	5
2626	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	8	5
2627	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	11	5
2628	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	10	5
2629	Creation of 2 Ponds	8	39.285714285714285	20	7.857142857142857	180	2	9	5
2630	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	5	5
2631	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	6	5
2632	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	7	5
2633	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	8	5
2634	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	11	5
2635	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	10	5
2636	Creation of 12 Ponds	11	39.285714285714285	80	31.428571428571427	180	2	9	5
2637	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	5	5
2638	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	6	5
2639	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	7	5
2640	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	8	5
2641	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	11	5
2642	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	10	5
2643	Creation of 7 Ponds	10	39.285714285714285	60	23.57142857142857	180	2	9	5
2644	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	5	5
2645	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	6	5
2646	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	7	5
2647	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	8	5
2648	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	11	5
2649	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	10	5
2650	Creation of 2 Ponds	11	32.142857142857146	25	8.035714285714286	180	12	9	5
2651	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	5	5
2652	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	6	5
2653	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	7	5
2654	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	8	5
2655	Creation of 12 Ponds	17	32.142857142857146	75	24.107142857142858	180	12	11	5
2656	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	10	5
2657	Creation of 12 Ponds	18	32.142857142857146	83.33333333333334	26.785714285714292	180	12	9	5
2658	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	5	5
2659	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	6	5
2660	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	7	5
2661	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	8	5
2662	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	11	5
2663	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	10	5
2664	Creation of 7 Ponds	15	32.142857142857146	58.333333333333336	18.750000000000004	180	12	9	5
2665	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	5	1
2666	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	6	1
2667	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	7	1
2668	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	8	1
2669	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	11	1
2670	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	10	1
2671	Creation of 2 Ponds	8	46.76258992805755	20	9.35251798561151	183	2	9	1
2672	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	5	1
2673	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	6	1
2674	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	7	1
2675	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	8	1
2676	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	11	1
2677	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	10	1
2678	Creation of 12 Ponds	11	46.76258992805755	80	37.41007194244604	183	2	9	1
2679	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	5	1
2680	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	6	1
2681	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	7	1
2682	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	8	1
2683	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	11	1
2684	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	10	1
2685	Creation of 7 Ponds	10	46.76258992805755	60	28.057553956834532	183	2	9	1
2686	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	5	1
2687	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	6	1
2688	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	7	1
2689	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	8	1
2690	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	11	1
2691	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	10	1
2692	Creation of 2 Ponds	11	42.44604316546763	25	10.611510791366907	183	12	9	1
2693	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	5	1
2694	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	6	1
2695	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	7	1
2696	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	8	1
2697	Creation of 12 Ponds	17	42.44604316546763	75	31.83453237410072	183	12	11	1
2698	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	10	1
2699	Creation of 12 Ponds	18	42.44604316546763	83.33333333333334	35.37170263788969	183	12	9	1
2700	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	5	1
2701	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	6	1
2702	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	7	1
2703	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	8	1
2704	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	11	1
2705	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	10	1
2706	Creation of 7 Ponds	15	42.44604316546763	58.333333333333336	24.760191846522783	183	12	9	1
2707	Creation of 2 Ponds	14	10.79136690647482	0	0	183	15	5	1
2708	Creation of 2 Ponds	13	10.79136690647482	0	0	183	15	6	1
2709	Creation of 2 Ponds	13	10.79136690647482	0	0	183	15	7	1
2710	Creation of 2 Ponds	14	10.79136690647482	0	0	183	15	8	1
2711	Creation of 2 Ponds	17	10.79136690647482	16.666666666666664	1.7985611510791364	183	15	11	1
2712	Creation of 2 Ponds	14	10.79136690647482	0	0	183	15	10	1
2713	Creation of 2 Ponds	13	10.79136690647482	0	0	183	15	9	1
2714	Creation of 12 Ponds	21	10.79136690647482	50	5.39568345323741	183	15	5	1
2715	Creation of 12 Ponds	20	10.79136690647482	41.66666666666667	4.496402877697843	183	15	6	1
2716	Creation of 12 Ponds	20	10.79136690647482	41.66666666666667	4.496402877697843	183	15	7	1
2717	Creation of 12 Ponds	21	10.79136690647482	50	5.39568345323741	183	15	8	1
2718	Creation of 12 Ponds	24	10.79136690647482	75	8.093525179856115	183	15	11	1
2719	Creation of 12 Ponds	20	10.79136690647482	41.66666666666667	4.496402877697843	183	15	10	1
2720	Creation of 12 Ponds	20	10.79136690647482	41.66666666666667	4.496402877697843	183	15	9	1
2721	Creation of 7 Ponds	19	10.79136690647482	33.33333333333333	3.5971223021582728	183	15	5	1
2722	Creation of 7 Ponds	18	10.79136690647482	25	2.697841726618705	183	15	6	1
2723	Creation of 7 Ponds	18	10.79136690647482	25	2.697841726618705	183	15	7	1
2724	Creation of 7 Ponds	19	10.79136690647482	33.33333333333333	3.5971223021582728	183	15	8	1
2725	Creation of 7 Ponds	22	10.79136690647482	58.333333333333336	6.294964028776978	183	15	11	1
2726	Creation of 7 Ponds	18	10.79136690647482	25	2.697841726618705	183	15	10	1
2727	Creation of 7 Ponds	18	10.79136690647482	25	2.697841726618705	183	15	9	1
2728	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	5	1
2729	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	6	1
2730	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	7	1
2731	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	8	1
2732	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	11	1
2733	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	10	1
2734	Creation of 2 Ponds	8	85.71428571428571	20	17.142857142857142	185	2	9	1
2735	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	5	1
2736	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	6	1
2737	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	7	1
2738	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	8	1
2739	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	11	1
2740	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	10	1
2741	Creation of 12 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	9	1
2742	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	5	1
2743	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	6	1
2744	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	7	1
2745	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	8	1
2746	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	11	1
2747	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	10	1
2748	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	9	1
2749	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	5	1
2750	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	6	1
2751	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	7	1
2752	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	8	1
2753	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	11	1
2754	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	10	1
2755	Creation of 4 Ponds	9	85.71428571428571	40	34.285714285714285	185	2	9	1
2756	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	5	1
2757	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	6	1
2758	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	7	1
2759	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	8	1
2760	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	11	1
2761	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	10	1
2762	Creation of 10 Ponds	11	85.71428571428571	80	68.57142857142857	185	2	9	1
2763	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	5	1
2764	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	6	1
2765	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	7	1
2766	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	8	1
2767	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	11	1
2768	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	10	1
2769	Creation of 7 Ponds	10	85.71428571428571	60	51.42857142857142	185	2	9	1
2770	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	5	1
2771	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	6	1
2772	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	7	1
2773	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	8	1
2774	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	11	1
2775	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	10	1
2776	Creation of 2 Ponds	11	14.285714285714285	25	3.571428571428571	185	12	9	1
2777	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	5	1
2778	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	6	1
2779	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	7	1
2780	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	8	1
2781	Creation of 12 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	11	1
2782	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	10	1
2783	Creation of 12 Ponds	18	14.285714285714285	83.33333333333334	11.904761904761905	185	12	9	1
2784	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	5	1
2785	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	6	1
2786	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	7	1
2787	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	8	1
2788	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	11	1
2789	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	10	1
2790	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	9	1
2791	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	5	1
2792	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	6	1
2793	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	7	1
2794	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	8	1
2795	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	11	1
2796	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	10	1
2797	Creation of 4 Ponds	13	14.285714285714285	41.66666666666667	5.9523809523809526	185	12	9	1
2798	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	5	1
2799	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	6	1
2800	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	7	1
2801	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	8	1
2802	Creation of 10 Ponds	16	14.285714285714285	66.66666666666666	9.523809523809522	185	12	11	1
2803	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	10	1
2804	Creation of 10 Ponds	17	14.285714285714285	75	10.714285714285714	185	12	9	1
2805	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	5	1
2806	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	6	1
2807	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	7	1
2808	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	8	1
2809	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	11	1
2810	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	10	1
2811	Creation of 7 Ponds	15	14.285714285714285	58.333333333333336	8.333333333333332	185	12	9	1
2812	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	5	1
2813	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	6	1
2814	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	7	1
2815	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	8	1
2816	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	11	1
2817	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	10	1
2818	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	237	2	9	1
2819	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	5	1
2820	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	6	1
2821	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	7	1
2822	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	8	1
2823	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	11	1
2824	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	10	1
2825	Creation of 10 Ponds	11	57.14285714285714	80	45.71428571428571	237	2	9	1
2826	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	5	1
2827	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	6	1
2828	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	7	1
2829	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	8	1
2830	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	11	1
2831	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	10	1
2832	Creation of 6 Ponds	10	57.14285714285714	60	34.285714285714285	237	2	9	1
2833	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	5	1
2834	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	6	1
2835	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	7	1
2836	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	8	1
2837	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	11	1
2838	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	10	1
2839	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	237	12	9	1
2840	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	5	1
2841	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	6	1
2842	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	7	1
2843	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	8	1
2844	Creation of 10 Ponds	16	42.857142857142854	66.66666666666666	28.571428571428566	237	12	11	1
2845	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	10	1
2846	Creation of 10 Ponds	17	42.857142857142854	75	32.14285714285714	237	12	9	1
2847	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	5	1
2848	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	6	1
2849	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	7	1
2850	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	8	1
2851	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	11	1
2852	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	10	1
2853	Creation of 6 Ponds	15	42.857142857142854	58.333333333333336	25	237	12	9	1
2854	Creation of 1 Ponds	7	60	0	0	240	2	5	1
2855	Creation of 1 Ponds	7	60	0	0	240	2	6	1
2856	Creation of 1 Ponds	7	60	0	0	240	2	7	1
2857	Creation of 1 Ponds	7	60	0	0	240	2	8	1
2858	Creation of 1 Ponds	7	60	0	0	240	2	11	1
2859	Creation of 1 Ponds	7	60	0	0	240	2	10	1
2860	Creation of 1 Ponds	7	60	0	0	240	2	9	1
2861	Creation of 7 Ponds	10	60	60	36	240	2	5	1
2862	Creation of 7 Ponds	10	60	60	36	240	2	6	1
2863	Creation of 7 Ponds	10	60	60	36	240	2	7	1
2864	Creation of 7 Ponds	10	60	60	36	240	2	8	1
2865	Creation of 7 Ponds	10	60	60	36	240	2	11	1
2866	Creation of 7 Ponds	10	60	60	36	240	2	10	1
2867	Creation of 7 Ponds	10	60	60	36	240	2	9	1
2868	Creation of 4 Ponds	9	60	40	24	240	2	5	1
2869	Creation of 4 Ponds	9	60	40	24	240	2	6	1
2870	Creation of 4 Ponds	9	60	40	24	240	2	7	1
2871	Creation of 4 Ponds	9	60	40	24	240	2	8	1
2872	Creation of 4 Ponds	9	60	40	24	240	2	11	1
2873	Creation of 4 Ponds	9	60	40	24	240	2	10	1
2874	Creation of 4 Ponds	9	60	40	24	240	2	9	1
2875	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	5	1
2876	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	6	1
2877	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	7	1
2878	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	8	1
2879	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	11	1
2880	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	10	1
2881	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	240	12	9	1
2882	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	5	1
2883	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	6	1
2884	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	7	1
2885	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	8	1
2886	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	11	1
2887	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	10	1
2888	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	240	12	9	1
2889	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	5	1
2890	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	6	1
2891	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	7	1
2892	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	8	1
2893	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	11	1
2894	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	10	1
2895	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	240	12	9	1
2896	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	5	1
2897	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	6	1
2898	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	7	1
2899	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	8	1
2900	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	11	1
2901	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	10	1
2902	Creation of 1 Ponds	7	66.66666666666666	0	0	317	2	9	1
2903	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	5	1
2904	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	6	1
2905	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	7	1
2906	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	8	1
2907	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	11	1
2908	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	10	1
2909	Creation of 3 Ponds	9	66.66666666666666	40	26.66666666666666	317	2	9	1
2910	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	5	1
2911	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	6	1
2912	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	7	1
2913	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	8	1
2914	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	11	1
2915	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	10	1
2916	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	317	2	9	1
2917	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	5	1
2918	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	6	1
2919	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	7	1
2920	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	8	1
2921	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	11	1
2922	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	10	1
2923	Creation of 1 Ponds	9	33.33333333333333	8.333333333333332	2.7777777777777772	317	12	9	1
2924	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	5	1
2925	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	6	1
2926	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	7	1
2927	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	8	1
2928	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	11	1
2929	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	10	1
2930	Creation of 3 Ponds	12	33.33333333333333	33.33333333333333	11.111111111111109	317	12	9	1
2931	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	5	1
2932	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	6	1
2933	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	7	1
2934	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	8	1
2935	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	11	1
2936	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	10	1
2937	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	317	12	9	1
2938	Creation of 1 Ponds	7	60	0	0	319	2	5	1
2939	Creation of 1 Ponds	7	60	0	0	319	2	6	1
2940	Creation of 1 Ponds	7	60	0	0	319	2	7	1
2941	Creation of 1 Ponds	7	60	0	0	319	2	8	1
2942	Creation of 1 Ponds	7	60	0	0	319	2	11	1
2943	Creation of 1 Ponds	7	60	0	0	319	2	10	1
2944	Creation of 1 Ponds	7	60	0	0	319	2	9	1
2945	Creation of 8 Ponds	10	60	60	36	319	2	5	1
2946	Creation of 8 Ponds	10	60	60	36	319	2	6	1
2947	Creation of 8 Ponds	10	60	60	36	319	2	7	1
2948	Creation of 8 Ponds	10	60	60	36	319	2	8	1
2949	Creation of 8 Ponds	10	60	60	36	319	2	11	1
2950	Creation of 8 Ponds	10	60	60	36	319	2	10	1
2951	Creation of 8 Ponds	10	60	60	36	319	2	9	1
2952	Creation of 4 Ponds	9	60	40	24	319	2	5	1
2953	Creation of 4 Ponds	9	60	40	24	319	2	6	1
2954	Creation of 4 Ponds	9	60	40	24	319	2	7	1
2955	Creation of 4 Ponds	9	60	40	24	319	2	8	1
2956	Creation of 4 Ponds	9	60	40	24	319	2	11	1
2957	Creation of 4 Ponds	9	60	40	24	319	2	10	1
2958	Creation of 4 Ponds	9	60	40	24	319	2	9	1
2959	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	5	1
2960	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	6	1
2961	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	7	1
2962	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	8	1
2963	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	11	1
2964	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	10	1
2965	Creation of 1 Ponds	9	40	8.333333333333332	3.3333333333333326	319	12	9	1
2966	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	5	1
2967	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	6	1
2968	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	7	1
2969	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	8	1
2970	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	11	1
2971	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	10	1
2972	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	319	12	9	1
2973	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	5	1
2974	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	6	1
2975	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	7	1
2976	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	8	1
2977	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	11	1
2978	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	10	1
2979	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	319	12	9	1
2980	Creation of 2 Ponds	8	37.5	20	7.5	320	2	5	1
2981	Creation of 2 Ponds	8	37.5	20	7.5	320	2	6	1
2982	Creation of 2 Ponds	8	37.5	20	7.5	320	2	7	1
2983	Creation of 2 Ponds	8	37.5	20	7.5	320	2	8	1
2984	Creation of 2 Ponds	8	37.5	20	7.5	320	2	11	1
2985	Creation of 2 Ponds	8	37.5	20	7.5	320	2	10	1
2986	Creation of 2 Ponds	8	37.5	20	7.5	320	2	9	1
2987	Creation of 6 Ponds	10	37.5	60	22.5	320	2	5	1
2988	Creation of 6 Ponds	10	37.5	60	22.5	320	2	6	1
2989	Creation of 6 Ponds	10	37.5	60	22.5	320	2	7	1
2990	Creation of 6 Ponds	10	37.5	60	22.5	320	2	8	1
2991	Creation of 6 Ponds	10	37.5	60	22.5	320	2	11	1
2992	Creation of 6 Ponds	10	37.5	60	22.5	320	2	10	1
2993	Creation of 6 Ponds	10	37.5	60	22.5	320	2	9	1
2994	Creation of 4 Ponds	9	37.5	40	15	320	2	5	1
2995	Creation of 4 Ponds	9	37.5	40	15	320	2	6	1
2996	Creation of 4 Ponds	9	37.5	40	15	320	2	7	1
2997	Creation of 4 Ponds	9	37.5	40	15	320	2	8	1
2998	Creation of 4 Ponds	9	37.5	40	15	320	2	11	1
2999	Creation of 4 Ponds	9	37.5	40	15	320	2	10	1
3000	Creation of 4 Ponds	9	37.5	40	15	320	2	9	1
3001	Creation of 2 Ponds	11	62.5	25	15.625	320	12	5	1
3002	Creation of 2 Ponds	11	62.5	25	15.625	320	12	6	1
3003	Creation of 2 Ponds	11	62.5	25	15.625	320	12	7	1
3004	Creation of 2 Ponds	11	62.5	25	15.625	320	12	8	1
3005	Creation of 2 Ponds	11	62.5	25	15.625	320	12	11	1
3006	Creation of 2 Ponds	11	62.5	25	15.625	320	12	10	1
3007	Creation of 2 Ponds	11	62.5	25	15.625	320	12	9	1
3008	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	5	1
3009	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	6	1
3010	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	7	1
3011	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	8	1
3012	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	11	1
3013	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	10	1
3014	Creation of 6 Ponds	15	62.5	58.333333333333336	36.458333333333336	320	12	9	1
3015	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	5	1
3016	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	6	1
3017	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	7	1
3018	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	8	1
3019	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	11	1
3020	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	10	1
3021	Creation of 4 Ponds	13	62.5	41.66666666666667	26.04166666666667	320	12	9	1
3022	Creation of 3 Ponds	9	75	40	30	321	2	5	1
3023	Creation of 3 Ponds	9	75	40	30	321	2	6	1
3024	Creation of 3 Ponds	9	75	40	30	321	2	7	1
3025	Creation of 3 Ponds	9	75	40	30	321	2	8	1
3026	Creation of 3 Ponds	9	75	40	30	321	2	11	1
3027	Creation of 3 Ponds	9	75	40	30	321	2	10	1
3028	Creation of 3 Ponds	9	75	40	30	321	2	9	1
3029	Creation of 7 Ponds	10	75	60	45	321	2	5	1
3030	Creation of 7 Ponds	10	75	60	45	321	2	6	1
3031	Creation of 7 Ponds	10	75	60	45	321	2	7	1
3032	Creation of 7 Ponds	10	75	60	45	321	2	8	1
3033	Creation of 7 Ponds	10	75	60	45	321	2	11	1
3034	Creation of 7 Ponds	10	75	60	45	321	2	10	1
3035	Creation of 7 Ponds	10	75	60	45	321	2	9	1
3036	Creation of 5 Ponds	9	75	40	30	321	2	5	1
3037	Creation of 5 Ponds	9	75	40	30	321	2	6	1
3038	Creation of 5 Ponds	9	75	40	30	321	2	7	1
3039	Creation of 5 Ponds	9	75	40	30	321	2	8	1
3040	Creation of 5 Ponds	9	75	40	30	321	2	11	1
3041	Creation of 5 Ponds	9	75	40	30	321	2	10	1
3042	Creation of 5 Ponds	9	75	40	30	321	2	9	1
3043	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	5	1
3044	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	6	1
3045	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	7	1
3046	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	8	1
3047	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	11	1
3048	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	10	1
3049	Creation of 3 Ponds	12	25	33.33333333333333	8.333333333333332	321	12	9	1
3050	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	5	1
3051	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	6	1
3052	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	7	1
3053	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	8	1
3054	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	11	1
3055	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	10	1
3056	Creation of 7 Ponds	15	25	58.333333333333336	14.583333333333336	321	12	9	1
3057	Creation of 5 Ponds	14	25	50	12.5	321	12	5	1
3058	Creation of 5 Ponds	14	25	50	12.5	321	12	6	1
3059	Creation of 5 Ponds	14	25	50	12.5	321	12	7	1
3060	Creation of 5 Ponds	14	25	50	12.5	321	12	8	1
3061	Creation of 5 Ponds	14	25	50	12.5	321	12	11	1
3062	Creation of 5 Ponds	14	25	50	12.5	321	12	10	1
3063	Creation of 5 Ponds	14	25	50	12.5	321	12	9	1
3064	Creation of 2 Ponds	8	50	20	10	324	2	5	1
3065	Creation of 2 Ponds	8	50	20	10	324	2	6	1
3066	Creation of 2 Ponds	8	50	20	10	324	2	7	1
3067	Creation of 2 Ponds	8	50	20	10	324	2	8	1
3068	Creation of 2 Ponds	8	50	20	10	324	2	11	1
3069	Creation of 2 Ponds	8	50	20	10	324	2	10	1
3070	Creation of 2 Ponds	8	50	20	10	324	2	9	1
3071	Creation of 7 Ponds	10	50	60	30	324	2	5	1
3072	Creation of 7 Ponds	10	50	60	30	324	2	6	1
3073	Creation of 7 Ponds	10	50	60	30	324	2	7	1
3074	Creation of 7 Ponds	10	50	60	30	324	2	8	1
3075	Creation of 7 Ponds	10	50	60	30	324	2	11	1
3076	Creation of 7 Ponds	10	50	60	30	324	2	10	1
3077	Creation of 7 Ponds	10	50	60	30	324	2	9	1
3078	Creation of 4 Ponds	9	50	40	20	324	2	5	1
3079	Creation of 4 Ponds	9	50	40	20	324	2	6	1
3080	Creation of 4 Ponds	9	50	40	20	324	2	7	1
3081	Creation of 4 Ponds	9	50	40	20	324	2	8	1
3082	Creation of 4 Ponds	9	50	40	20	324	2	11	1
3083	Creation of 4 Ponds	9	50	40	20	324	2	10	1
3084	Creation of 4 Ponds	9	50	40	20	324	2	9	1
3085	Creation of 2 Ponds	11	50	25	12.5	324	12	5	1
3086	Creation of 2 Ponds	11	50	25	12.5	324	12	6	1
3087	Creation of 2 Ponds	11	50	25	12.5	324	12	7	1
3088	Creation of 2 Ponds	11	50	25	12.5	324	12	8	1
3089	Creation of 2 Ponds	11	50	25	12.5	324	12	11	1
3090	Creation of 2 Ponds	11	50	25	12.5	324	12	10	1
3091	Creation of 2 Ponds	11	50	25	12.5	324	12	9	1
3092	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	5	1
3093	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	6	1
3094	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	7	1
3095	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	8	1
3096	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	11	1
3097	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	10	1
3098	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	324	12	9	1
3099	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	5	1
3100	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	6	1
3101	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	7	1
3102	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	8	1
3103	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	11	1
3104	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	10	1
3105	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	324	12	9	1
3106	Creation of 3 Ponds	9	62.5	40	25	325	2	5	1
3107	Creation of 3 Ponds	9	62.5	40	25	325	2	6	1
3108	Creation of 3 Ponds	9	62.5	40	25	325	2	7	1
3109	Creation of 3 Ponds	9	62.5	40	25	325	2	8	1
3110	Creation of 3 Ponds	9	62.5	40	25	325	2	11	1
3111	Creation of 3 Ponds	9	62.5	40	25	325	2	10	1
3112	Creation of 3 Ponds	9	62.5	40	25	325	2	9	1
3113	Creation of 5 Ponds	9	62.5	40	25	325	2	5	1
3114	Creation of 5 Ponds	9	62.5	40	25	325	2	6	1
3115	Creation of 5 Ponds	9	62.5	40	25	325	2	7	1
3116	Creation of 5 Ponds	9	62.5	40	25	325	2	8	1
3117	Creation of 5 Ponds	9	62.5	40	25	325	2	11	1
3118	Creation of 5 Ponds	9	62.5	40	25	325	2	10	1
3119	Creation of 5 Ponds	9	62.5	40	25	325	2	9	1
3120	Creation of 4 Ponds	9	62.5	40	25	325	2	5	1
3121	Creation of 4 Ponds	9	62.5	40	25	325	2	6	1
3122	Creation of 4 Ponds	9	62.5	40	25	325	2	7	1
3123	Creation of 4 Ponds	9	62.5	40	25	325	2	8	1
3124	Creation of 4 Ponds	9	62.5	40	25	325	2	11	1
3125	Creation of 4 Ponds	9	62.5	40	25	325	2	10	1
3126	Creation of 4 Ponds	9	62.5	40	25	325	2	9	1
3127	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	5	1
3128	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	6	1
3129	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	7	1
3130	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	8	1
3131	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	11	1
3132	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	10	1
3133	Creation of 3 Ponds	12	37.5	33.33333333333333	12.499999999999998	325	12	9	1
3134	Creation of 5 Ponds	14	37.5	50	18.75	325	12	5	1
3135	Creation of 5 Ponds	14	37.5	50	18.75	325	12	6	1
3136	Creation of 5 Ponds	14	37.5	50	18.75	325	12	7	1
3137	Creation of 5 Ponds	14	37.5	50	18.75	325	12	8	1
3138	Creation of 5 Ponds	14	37.5	50	18.75	325	12	11	1
3139	Creation of 5 Ponds	14	37.5	50	18.75	325	12	10	1
3140	Creation of 5 Ponds	14	37.5	50	18.75	325	12	9	1
3141	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	5	1
3142	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	6	1
3143	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	7	1
3144	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	8	1
3145	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	11	1
3146	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	10	1
3147	Creation of 4 Ponds	13	37.5	41.66666666666667	15.625000000000002	325	12	9	1
3148	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	5	1
3149	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	6	1
3150	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	7	1
3151	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	8	1
3152	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	11	1
3153	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	10	1
3154	Creation of 2 Ponds	8	57.14285714285714	20	11.428571428571427	327	2	9	1
3155	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	5	1
3156	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	6	1
3157	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	7	1
3158	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	8	1
3159	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	11	1
3160	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	10	1
3161	Creation of 7 Ponds	10	57.14285714285714	60	34.285714285714285	327	2	9	1
3162	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	5	1
3163	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	6	1
3164	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	7	1
3165	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	8	1
3166	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	11	1
3167	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	10	1
3168	Creation of 4 Ponds	9	57.14285714285714	40	22.857142857142854	327	2	9	1
3169	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	5	1
3170	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	6	1
3171	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	7	1
3172	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	8	1
3173	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	11	1
3174	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	10	1
3175	Creation of 2 Ponds	11	42.857142857142854	25	10.714285714285714	327	12	9	1
3176	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	5	1
3177	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	6	1
3178	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	7	1
3179	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	8	1
3180	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	11	1
3181	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	10	1
3182	Creation of 7 Ponds	15	42.857142857142854	58.333333333333336	25	327	12	9	1
3183	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	5	1
3184	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	6	1
3185	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	7	1
3186	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	8	1
3187	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	11	1
3188	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	10	1
3189	Creation of 4 Ponds	13	42.857142857142854	41.66666666666667	17.857142857142858	327	12	9	1
3190	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	5	1
3191	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	6	1
3192	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	7	1
3193	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	8	1
3194	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	11	1
3195	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	10	1
3196	Creation of 5 Ponds	9	61.31386861313869	40	24.525547445255473	329	2	9	1
3197	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	5	1
3198	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	6	1
3199	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	7	1
3200	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	8	1
3201	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	11	1
3202	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	10	1
3203	Creation of 10 Ponds	11	61.31386861313869	80	49.051094890510946	329	2	9	1
3204	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	5	1
3205	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	6	1
3206	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	7	1
3207	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	8	1
3208	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	11	1
3209	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	10	1
3210	Creation of 8 Ponds	10	61.31386861313869	60	36.78832116788321	329	2	9	1
3211	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	5	1
3212	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	6	1
3213	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	7	1
3214	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	8	1
3215	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	11	1
3216	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	10	1
3217	Creation of 5 Ponds	14	13.138686131386862	50	6.569343065693431	329	12	9	1
3218	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	5	1
3219	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	6	1
3220	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	7	1
3221	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	8	1
3222	Creation of 10 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	11	1
3223	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	10	1
3224	Creation of 10 Ponds	17	13.138686131386862	75	9.854014598540147	329	12	9	1
3225	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	5	1
3226	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	6	1
3227	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	7	1
3228	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	8	1
3229	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	11	1
3230	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	10	1
3231	Creation of 8 Ponds	16	13.138686131386862	66.66666666666666	8.759124087591239	329	12	9	1
3232	Creation of 5 Ponds	18	25.547445255474454	25	6.386861313868613	329	15	5	1
3233	Creation of 5 Ponds	17	25.547445255474454	16.666666666666664	4.257907542579075	329	15	6	1
3234	Creation of 5 Ponds	17	25.547445255474454	16.666666666666664	4.257907542579075	329	15	7	1
3235	Creation of 5 Ponds	18	25.547445255474454	25	6.386861313868613	329	15	8	1
3236	Creation of 5 Ponds	21	25.547445255474454	50	12.773722627737227	329	15	11	1
3237	Creation of 5 Ponds	17	25.547445255474454	16.666666666666664	4.257907542579075	329	15	10	1
3238	Creation of 5 Ponds	17	25.547445255474454	16.666666666666664	4.257907542579075	329	15	9	1
3239	Creation of 10 Ponds	21	25.547445255474454	50	12.773722627737227	329	15	5	1
3240	Creation of 10 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	6	1
3241	Creation of 10 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	7	1
3242	Creation of 10 Ponds	21	25.547445255474454	50	12.773722627737227	329	15	8	1
3243	Creation of 10 Ponds	24	25.547445255474454	75	19.16058394160584	329	15	11	1
3244	Creation of 10 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	10	1
3245	Creation of 10 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	9	1
3246	Creation of 8 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	5	1
3247	Creation of 8 Ponds	19	25.547445255474454	33.33333333333333	8.51581508515815	329	15	6	1
3248	Creation of 8 Ponds	19	25.547445255474454	33.33333333333333	8.51581508515815	329	15	7	1
3249	Creation of 8 Ponds	20	25.547445255474454	41.66666666666667	10.64476885644769	329	15	8	1
3250	Creation of 8 Ponds	23	25.547445255474454	66.66666666666666	17.0316301703163	329	15	11	1
3251	Creation of 8 Ponds	19	25.547445255474454	33.33333333333333	8.51581508515815	329	15	10	1
3252	Creation of 8 Ponds	19	25.547445255474454	33.33333333333333	8.51581508515815	329	15	9	1
3256	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	5	1
3257	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	6	1
3258	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	7	1
3259	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	8	1
3260	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	11	1
3261	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	10	1
3262	Creation of 2 Ponds	8	55.00000000000001	20	11.000000000000002	331	2	9	1
3263	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	5	1
3264	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	6	1
3265	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	7	1
3266	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	8	1
3267	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	11	1
3268	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	10	1
3269	Creation of 20 Ponds	12	55.00000000000001	100	55.00000000000001	331	2	9	1
3270	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	5	1
3271	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	6	1
3272	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	7	1
3273	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	8	1
3274	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	11	1
3275	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	10	1
3276	Creation of 11 Ponds	11	55.00000000000001	80	44.00000000000001	331	2	9	1
3277	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	5	1
3278	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	6	1
3279	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	7	1
3280	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	8	1
3281	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	11	1
3282	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	10	1
3283	Creation of 2 Ponds	11	36.53846153846154	25	9.134615384615385	331	12	9	1
3284	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	5	1
3285	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	6	1
3286	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	7	1
3287	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	8	1
3288	Creation of 20 Ponds	19	36.53846153846154	91.66666666666666	33.493589743589745	331	12	11	1
3289	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	10	1
3290	Creation of 20 Ponds	20	36.53846153846154	100	36.53846153846154	331	12	9	1
3291	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	5	1
3292	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	6	1
3293	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	7	1
3294	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	8	1
3295	Creation of 11 Ponds	16	36.53846153846154	66.66666666666666	24.358974358974354	331	12	11	1
3296	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	10	1
3297	Creation of 11 Ponds	17	36.53846153846154	75	27.403846153846157	331	12	9	1
3298	Creation of 2 Ponds	14	8.461538461538462	0	0	331	15	5	1
3299	Creation of 2 Ponds	13	8.461538461538462	0	0	331	15	6	1
3300	Creation of 2 Ponds	13	8.461538461538462	0	0	331	15	7	1
3301	Creation of 2 Ponds	14	8.461538461538462	0	0	331	15	8	1
3302	Creation of 2 Ponds	17	8.461538461538462	16.666666666666664	1.4102564102564101	331	15	11	1
3303	Creation of 2 Ponds	14	8.461538461538462	0	0	331	15	10	1
3304	Creation of 2 Ponds	13	8.461538461538462	0	0	331	15	9	1
3305	Creation of 20 Ponds	24	8.461538461538462	75	6.346153846153847	331	15	5	1
3306	Creation of 20 Ponds	23	8.461538461538462	66.66666666666666	5.6410256410256405	331	15	6	1
3307	Creation of 20 Ponds	23	8.461538461538462	66.66666666666666	5.6410256410256405	331	15	7	1
3308	Creation of 20 Ponds	24	8.461538461538462	75	6.346153846153847	331	15	8	1
3309	Creation of 20 Ponds	27	8.461538461538462	100	8.461538461538462	331	15	11	1
3310	Creation of 20 Ponds	23	8.461538461538462	66.66666666666666	5.6410256410256405	331	15	10	1
3311	Creation of 20 Ponds	23	8.461538461538462	66.66666666666666	5.6410256410256405	331	15	9	1
3312	Creation of 11 Ponds	21	8.461538461538462	50	4.230769230769231	331	15	5	1
3313	Creation of 11 Ponds	20	8.461538461538462	41.66666666666667	3.525641025641026	331	15	6	1
3314	Creation of 11 Ponds	20	8.461538461538462	41.66666666666667	3.525641025641026	331	15	7	1
3315	Creation of 11 Ponds	21	8.461538461538462	50	4.230769230769231	331	15	8	1
3316	Creation of 11 Ponds	24	8.461538461538462	75	6.346153846153847	331	15	11	1
3317	Creation of 11 Ponds	20	8.461538461538462	41.66666666666667	3.525641025641026	331	15	10	1
3318	Creation of 11 Ponds	20	8.461538461538462	41.66666666666667	3.525641025641026	331	15	9	1
3319	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	5	1
3320	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	6	1
3321	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	7	1
3322	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	8	1
3323	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	11	1
3324	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	10	1
3325	Creation of 4 Ponds	9	16.666666666666664	40	6.666666666666665	332	2	9	1
3326	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	5	1
3327	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	6	1
3328	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	7	1
3329	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	8	1
3330	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	11	1
3331	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	10	1
3332	Creation of 12 Ponds	11	16.666666666666664	80	13.33333333333333	332	2	9	1
3333	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	5	1
3334	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	6	1
3335	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	7	1
3336	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	8	1
3337	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	11	1
3338	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	10	1
3339	Creation of 8 Ponds	10	16.666666666666664	60	9.999999999999998	332	2	9	1
3340	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	5	1
3341	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	6	1
3342	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	7	1
3343	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	8	1
3344	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	11	1
3345	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	10	1
3346	Creation of 4 Ponds	13	16.666666666666664	41.66666666666667	6.944444444444445	332	12	9	1
3347	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	5	1
3348	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	6	1
3349	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	7	1
3350	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	8	1
3351	Creation of 12 Ponds	17	16.666666666666664	75	12.499999999999998	332	12	11	1
3352	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	10	1
3353	Creation of 12 Ponds	18	16.666666666666664	83.33333333333334	13.88888888888889	332	12	9	1
3354	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	5	1
3355	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	6	1
3356	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	7	1
3357	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	8	1
3358	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	11	1
3359	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	10	1
3360	Creation of 8 Ponds	16	16.666666666666664	66.66666666666666	11.111111111111109	332	12	9	1
3361	Creation of 4 Ponds	17	66.66666666666666	16.666666666666664	11.111111111111109	332	15	5	1
3362	Creation of 4 Ponds	16	66.66666666666666	8.333333333333332	5.5555555555555545	332	15	6	1
3363	Creation of 4 Ponds	16	66.66666666666666	8.333333333333332	5.5555555555555545	332	15	7	1
3364	Creation of 4 Ponds	17	66.66666666666666	16.666666666666664	11.111111111111109	332	15	8	1
3365	Creation of 4 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	11	1
3366	Creation of 4 Ponds	16	66.66666666666666	8.333333333333332	5.5555555555555545	332	15	10	1
3367	Creation of 4 Ponds	16	66.66666666666666	8.333333333333332	5.5555555555555545	332	15	9	1
3368	Creation of 12 Ponds	21	66.66666666666666	50	33.33333333333333	332	15	5	1
3369	Creation of 12 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	6	1
3370	Creation of 12 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	7	1
3371	Creation of 12 Ponds	21	66.66666666666666	50	33.33333333333333	332	15	8	1
3372	Creation of 12 Ponds	24	66.66666666666666	75	49.99999999999999	332	15	11	1
3373	Creation of 12 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	10	1
3374	Creation of 12 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	9	1
3375	Creation of 8 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	5	1
3376	Creation of 8 Ponds	19	66.66666666666666	33.33333333333333	22.222222222222218	332	15	6	1
3377	Creation of 8 Ponds	19	66.66666666666666	33.33333333333333	22.222222222222218	332	15	7	1
3378	Creation of 8 Ponds	20	66.66666666666666	41.66666666666667	27.77777777777778	332	15	8	1
3379	Creation of 8 Ponds	23	66.66666666666666	66.66666666666666	44.444444444444436	332	15	11	1
3380	Creation of 8 Ponds	19	66.66666666666666	33.33333333333333	22.222222222222218	332	15	10	1
3381	Creation of 8 Ponds	19	66.66666666666666	33.33333333333333	22.222222222222218	332	15	9	1
3382	Creation of 2 Ponds	8	60	20	12	335	2	5	1
3383	Creation of 2 Ponds	8	60	20	12	335	2	6	1
3384	Creation of 2 Ponds	8	60	20	12	335	2	7	1
3385	Creation of 2 Ponds	8	60	20	12	335	2	8	1
3386	Creation of 2 Ponds	8	60	20	12	335	2	11	1
3387	Creation of 2 Ponds	8	60	20	12	335	2	10	1
3388	Creation of 2 Ponds	8	60	20	12	335	2	9	1
3389	Creation of 5 Ponds	9	60	40	24	335	2	5	1
3390	Creation of 5 Ponds	9	60	40	24	335	2	6	1
3391	Creation of 5 Ponds	9	60	40	24	335	2	7	1
3392	Creation of 5 Ponds	9	60	40	24	335	2	8	1
3393	Creation of 5 Ponds	9	60	40	24	335	2	11	1
3394	Creation of 5 Ponds	9	60	40	24	335	2	10	1
3395	Creation of 5 Ponds	9	60	40	24	335	2	9	1
3396	Creation of 4 Ponds	9	60	40	24	335	2	5	1
3397	Creation of 4 Ponds	9	60	40	24	335	2	6	1
3398	Creation of 4 Ponds	9	60	40	24	335	2	7	1
3399	Creation of 4 Ponds	9	60	40	24	335	2	8	1
3400	Creation of 4 Ponds	9	60	40	24	335	2	11	1
3401	Creation of 4 Ponds	9	60	40	24	335	2	10	1
3402	Creation of 4 Ponds	9	60	40	24	335	2	9	1
3403	Creation of 2 Ponds	11	40	25	10	335	12	5	1
3404	Creation of 2 Ponds	11	40	25	10	335	12	6	1
3405	Creation of 2 Ponds	11	40	25	10	335	12	7	1
3406	Creation of 2 Ponds	11	40	25	10	335	12	8	1
3407	Creation of 2 Ponds	11	40	25	10	335	12	11	1
3408	Creation of 2 Ponds	11	40	25	10	335	12	10	1
3409	Creation of 2 Ponds	11	40	25	10	335	12	9	1
3410	Creation of 5 Ponds	14	40	50	20	335	12	5	1
3411	Creation of 5 Ponds	14	40	50	20	335	12	6	1
3412	Creation of 5 Ponds	14	40	50	20	335	12	7	1
3413	Creation of 5 Ponds	14	40	50	20	335	12	8	1
3414	Creation of 5 Ponds	14	40	50	20	335	12	11	1
3415	Creation of 5 Ponds	14	40	50	20	335	12	10	1
3416	Creation of 5 Ponds	14	40	50	20	335	12	9	1
3417	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	5	1
3418	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	6	1
3419	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	7	1
3420	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	8	1
3421	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	11	1
3422	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	10	1
3423	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	335	12	9	1
3424	Creation of 2 Ponds	8	100	20	20	345	2	5	1
3425	Creation of 2 Ponds	8	100	20	20	345	2	6	1
3426	Creation of 2 Ponds	8	100	20	20	345	2	7	1
3427	Creation of 2 Ponds	8	100	20	20	345	2	8	1
3428	Creation of 2 Ponds	8	100	20	20	345	2	11	1
3429	Creation of 2 Ponds	8	100	20	20	345	2	10	1
3430	Creation of 2 Ponds	8	100	20	20	345	2	9	1
3431	Creation of 8 Ponds	10	100	60	60	345	2	5	1
3432	Creation of 8 Ponds	10	100	60	60	345	2	6	1
3433	Creation of 8 Ponds	10	100	60	60	345	2	7	1
3434	Creation of 8 Ponds	10	100	60	60	345	2	8	1
3435	Creation of 8 Ponds	10	100	60	60	345	2	11	1
3436	Creation of 8 Ponds	10	100	60	60	345	2	10	1
3437	Creation of 8 Ponds	10	100	60	60	345	2	9	1
3438	Creation of 5 Ponds	9	100	40	40	345	2	5	1
3439	Creation of 5 Ponds	9	100	40	40	345	2	6	1
3440	Creation of 5 Ponds	9	100	40	40	345	2	7	1
3441	Creation of 5 Ponds	9	100	40	40	345	2	8	1
3442	Creation of 5 Ponds	9	100	40	40	345	2	11	1
3443	Creation of 5 Ponds	9	100	40	40	345	2	10	1
3444	Creation of 5 Ponds	9	100	40	40	345	2	9	1
3445	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	5	1
3446	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	6	1
3447	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	7	1
3448	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	8	1
3449	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	11	1
3450	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	10	1
3451	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	349	2	9	1
3452	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	5	1
3453	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	6	1
3454	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	7	1
3455	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	8	1
3456	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	11	1
3457	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	10	1
3458	Creation of 7 Ponds	10	66.66666666666666	60	39.99999999999999	349	2	9	1
3459	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	5	1
3460	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	6	1
3461	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	7	1
3462	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	8	1
3463	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	11	1
3464	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	10	1
3465	Creation of 4 Ponds	9	66.66666666666666	40	26.66666666666666	349	2	9	1
3466	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	5	1
3467	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	6	1
3468	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	7	1
3469	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	8	1
3470	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	11	1
3471	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	10	1
3472	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	349	12	9	1
3473	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	5	1
3474	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	6	1
3475	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	7	1
3476	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	8	1
3477	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	11	1
3478	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	10	1
3479	Creation of 7 Ponds	15	33.33333333333333	58.333333333333336	19.444444444444443	349	12	9	1
3480	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	5	1
3481	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	6	1
3482	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	7	1
3483	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	8	1
3484	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	11	1
3485	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	10	1
3486	Creation of 4 Ponds	13	33.33333333333333	41.66666666666667	13.88888888888889	349	12	9	1
3511	Creation of 2 Ponds	8	60	20	12	384	2	5	1
3512	Creation of 2 Ponds	8	60	20	12	384	2	6	1
3513	Creation of 2 Ponds	8	60	20	12	384	2	7	1
3514	Creation of 2 Ponds	8	60	20	12	384	2	8	1
3515	Creation of 2 Ponds	8	60	20	12	384	2	11	1
3516	Creation of 2 Ponds	8	60	20	12	384	2	10	1
3517	Creation of 2 Ponds	8	60	20	12	384	2	9	1
3518	Creation of 9 Ponds	10	60	60	36	384	2	5	1
3519	Creation of 9 Ponds	10	60	60	36	384	2	6	1
3520	Creation of 9 Ponds	10	60	60	36	384	2	7	1
3521	Creation of 9 Ponds	10	60	60	36	384	2	8	1
3522	Creation of 9 Ponds	10	60	60	36	384	2	11	1
3523	Creation of 9 Ponds	10	60	60	36	384	2	10	1
3524	Creation of 9 Ponds	10	60	60	36	384	2	9	1
3525	Creation of 6 Ponds	10	60	60	36	384	2	5	1
3526	Creation of 6 Ponds	10	60	60	36	384	2	6	1
3527	Creation of 6 Ponds	10	60	60	36	384	2	7	1
3528	Creation of 6 Ponds	10	60	60	36	384	2	8	1
3529	Creation of 6 Ponds	10	60	60	36	384	2	11	1
3530	Creation of 6 Ponds	10	60	60	36	384	2	10	1
3531	Creation of 6 Ponds	10	60	60	36	384	2	9	1
3532	Creation of 2 Ponds	11	40	25	10	384	12	5	1
3533	Creation of 2 Ponds	11	40	25	10	384	12	6	1
3534	Creation of 2 Ponds	11	40	25	10	384	12	7	1
3535	Creation of 2 Ponds	11	40	25	10	384	12	8	1
3536	Creation of 2 Ponds	11	40	25	10	384	12	11	1
3537	Creation of 2 Ponds	11	40	25	10	384	12	10	1
3538	Creation of 2 Ponds	11	40	25	10	384	12	9	1
3539	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	5	1
3540	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	6	1
3541	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	7	1
3542	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	8	1
3543	Creation of 9 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	11	1
3544	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	10	1
3545	Creation of 9 Ponds	16	40	66.66666666666666	26.66666666666666	384	12	9	1
3546	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	5	1
3547	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	6	1
3548	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	7	1
3549	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	8	1
3550	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	11	1
3551	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	10	1
3552	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	384	12	9	1
3553	Creation of 2 Ponds	8	60	20	12	386	2	5	1
3554	Creation of 2 Ponds	8	60	20	12	386	2	6	1
3555	Creation of 2 Ponds	8	60	20	12	386	2	7	1
3556	Creation of 2 Ponds	8	60	20	12	386	2	8	1
3557	Creation of 2 Ponds	8	60	20	12	386	2	11	1
3558	Creation of 2 Ponds	8	60	20	12	386	2	10	1
3559	Creation of 2 Ponds	8	60	20	12	386	2	9	1
3560	Creation of 6 Ponds	10	60	60	36	386	2	5	1
3561	Creation of 6 Ponds	10	60	60	36	386	2	6	1
3562	Creation of 6 Ponds	10	60	60	36	386	2	7	1
3563	Creation of 6 Ponds	10	60	60	36	386	2	8	1
3564	Creation of 6 Ponds	10	60	60	36	386	2	11	1
3565	Creation of 6 Ponds	10	60	60	36	386	2	10	1
3566	Creation of 6 Ponds	10	60	60	36	386	2	9	1
3567	Creation of 4 Ponds	9	60	40	24	386	2	5	1
3568	Creation of 4 Ponds	9	60	40	24	386	2	6	1
3569	Creation of 4 Ponds	9	60	40	24	386	2	7	1
3570	Creation of 4 Ponds	9	60	40	24	386	2	8	1
3571	Creation of 4 Ponds	9	60	40	24	386	2	11	1
3572	Creation of 4 Ponds	9	60	40	24	386	2	10	1
3573	Creation of 4 Ponds	9	60	40	24	386	2	9	1
3574	Creation of 2 Ponds	11	40	25	10	386	12	5	1
3575	Creation of 2 Ponds	11	40	25	10	386	12	6	1
3576	Creation of 2 Ponds	11	40	25	10	386	12	7	1
3577	Creation of 2 Ponds	11	40	25	10	386	12	8	1
3578	Creation of 2 Ponds	11	40	25	10	386	12	11	1
3579	Creation of 2 Ponds	11	40	25	10	386	12	10	1
3580	Creation of 2 Ponds	11	40	25	10	386	12	9	1
3581	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	5	1
3582	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	6	1
3583	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	7	1
3584	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	8	1
3585	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	11	1
3586	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	10	1
3587	Creation of 6 Ponds	15	40	58.333333333333336	23.333333333333336	386	12	9	1
3588	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	5	1
3589	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	6	1
3590	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	7	1
3591	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	8	1
3592	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	11	1
3593	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	10	1
3594	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	386	12	9	1
3595	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	5	1
3596	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	6	1
3597	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	7	1
3598	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	8	1
3599	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	10	1
3600	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	9	1
3601	Creation of 2 Ponds	8	66.66666666666666	20	13.33333333333333	430	2	11	1
3602	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	5	1
3603	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	6	1
3604	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	7	1
3605	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	8	1
3606	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	10	1
3607	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	9	1
3608	Creation of 8 Ponds	10	66.66666666666666	60	39.99999999999999	430	2	11	1
3609	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	5	1
3610	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	6	1
3611	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	7	1
3612	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	8	1
3613	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	10	1
3614	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	9	1
3615	Creation of 5 Ponds	9	66.66666666666666	40	26.66666666666666	430	2	11	1
3616	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	5	1
3617	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	6	1
3618	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	7	1
3619	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	8	1
3620	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	10	1
3621	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	9	1
3622	Creation of 2 Ponds	11	33.33333333333333	25	8.333333333333332	430	12	11	1
3623	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	5	1
3624	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	6	1
3625	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	7	1
3626	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	8	1
3627	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	10	1
3628	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	9	1
3629	Creation of 8 Ponds	16	33.33333333333333	66.66666666666666	22.222222222222218	430	12	11	1
3630	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	5	1
3631	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	6	1
3632	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	7	1
3633	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	8	1
3634	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	10	1
3635	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	9	1
3636	Creation of 5 Ponds	14	33.33333333333333	50	16.666666666666664	430	12	11	1
3637	Creation of 2 Ponds	8	50	20	10	431	2	5	1
3638	Creation of 2 Ponds	8	50	20	10	431	2	6	1
3639	Creation of 2 Ponds	8	50	20	10	431	2	7	1
3640	Creation of 2 Ponds	8	50	20	10	431	2	8	1
3641	Creation of 2 Ponds	8	50	20	10	431	2	10	1
3642	Creation of 2 Ponds	8	50	20	10	431	2	9	1
3643	Creation of 2 Ponds	8	50	20	10	431	2	11	1
3644	Creation of 7 Ponds	10	50	60	30	431	2	5	1
3645	Creation of 7 Ponds	10	50	60	30	431	2	6	1
3646	Creation of 7 Ponds	10	50	60	30	431	2	7	1
3647	Creation of 7 Ponds	10	50	60	30	431	2	8	1
3648	Creation of 7 Ponds	10	50	60	30	431	2	10	1
3649	Creation of 7 Ponds	10	50	60	30	431	2	9	1
3650	Creation of 7 Ponds	10	50	60	30	431	2	11	1
3651	Creation of 4 Ponds	9	50	40	20	431	2	5	1
3652	Creation of 4 Ponds	9	50	40	20	431	2	6	1
3653	Creation of 4 Ponds	9	50	40	20	431	2	7	1
3654	Creation of 4 Ponds	9	50	40	20	431	2	8	1
3655	Creation of 4 Ponds	9	50	40	20	431	2	10	1
3656	Creation of 4 Ponds	9	50	40	20	431	2	9	1
3657	Creation of 4 Ponds	9	50	40	20	431	2	11	1
3658	Creation of 2 Ponds	11	50	25	12.5	431	12	5	1
3659	Creation of 2 Ponds	11	50	25	12.5	431	12	6	1
3660	Creation of 2 Ponds	11	50	25	12.5	431	12	7	1
3661	Creation of 2 Ponds	11	50	25	12.5	431	12	8	1
3662	Creation of 2 Ponds	11	50	25	12.5	431	12	10	1
3663	Creation of 2 Ponds	11	50	25	12.5	431	12	9	1
3664	Creation of 2 Ponds	11	50	25	12.5	431	12	11	1
3665	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	5	1
3666	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	6	1
3667	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	7	1
3668	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	8	1
3669	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	10	1
3670	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	9	1
3671	Creation of 7 Ponds	15	50	58.333333333333336	29.16666666666667	431	12	11	1
3672	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	5	1
3673	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	6	1
3674	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	7	1
3675	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	8	1
3676	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	10	1
3677	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	9	1
3678	Creation of 4 Ponds	13	50	41.66666666666667	20.833333333333336	431	12	11	1
3679	Creation of 2 Ponds	8	60	20	12	433	2	11	1
3680	Creation of 2 Ponds	8	60	20	12	433	2	8	1
3681	Creation of 2 Ponds	8	60	20	12	433	2	6	1
3682	Creation of 2 Ponds	8	60	20	12	433	2	7	1
3683	Creation of 2 Ponds	8	60	20	12	433	2	5	1
3684	Creation of 2 Ponds	8	60	20	12	433	2	10	1
3685	Creation of 2 Ponds	8	60	20	12	433	2	9	1
3686	Creation of 7 Ponds	10	60	60	36	433	2	11	1
3687	Creation of 7 Ponds	10	60	60	36	433	2	8	1
3688	Creation of 7 Ponds	10	60	60	36	433	2	6	1
3689	Creation of 7 Ponds	10	60	60	36	433	2	7	1
3690	Creation of 7 Ponds	10	60	60	36	433	2	5	1
3691	Creation of 7 Ponds	10	60	60	36	433	2	10	1
3692	Creation of 7 Ponds	10	60	60	36	433	2	9	1
3693	Creation of 4 Ponds	9	60	40	24	433	2	11	1
3694	Creation of 4 Ponds	9	60	40	24	433	2	8	1
3695	Creation of 4 Ponds	9	60	40	24	433	2	6	1
3696	Creation of 4 Ponds	9	60	40	24	433	2	7	1
3697	Creation of 4 Ponds	9	60	40	24	433	2	5	1
3698	Creation of 4 Ponds	9	60	40	24	433	2	10	1
3699	Creation of 4 Ponds	9	60	40	24	433	2	9	1
3700	Creation of 2 Ponds	11	40	25	10	433	12	11	1
3701	Creation of 2 Ponds	11	40	25	10	433	12	8	1
3702	Creation of 2 Ponds	11	40	25	10	433	12	6	1
3703	Creation of 2 Ponds	11	40	25	10	433	12	7	1
3704	Creation of 2 Ponds	11	40	25	10	433	12	5	1
3705	Creation of 2 Ponds	11	40	25	10	433	12	10	1
3706	Creation of 2 Ponds	11	40	25	10	433	12	9	1
3707	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	11	1
3708	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	8	1
3709	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	6	1
3710	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	7	1
3711	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	5	1
3712	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	10	1
3713	Creation of 7 Ponds	15	40	58.333333333333336	23.333333333333336	433	12	9	1
3714	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	11	1
3715	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	8	1
3716	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	6	1
3717	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	7	1
3718	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	5	1
3719	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	10	1
3720	Creation of 4 Ponds	13	40	41.66666666666667	16.66666666666667	433	12	9	1
3721	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	11	1
3722	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	8	1
3723	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	6	1
3724	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	7	1
3725	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	5	1
3726	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	10	1
3727	Creation of 2 Ponds	8	32.142857142857146	20	6.428571428571429	436	2	9	1
3728	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	11	1
3729	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	8	1
3730	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	6	1
3731	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	7	1
3732	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	5	1
3733	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	10	1
3734	Creation of 4 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	9	1
3735	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	11	1
3736	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	8	1
3737	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	6	1
3738	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	7	1
3739	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	5	1
3740	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	10	1
3741	Creation of 3 Ponds	9	32.142857142857146	40	12.857142857142858	436	2	9	1
3742	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	11	1
3743	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	8	1
3744	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	6	1
3745	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	7	1
3746	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	5	1
3747	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	10	1
3748	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	436	12	9	1
3749	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	11	1
3750	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	8	1
3751	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	6	1
3752	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	7	1
3753	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	5	1
3754	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	10	1
3755	Creation of 4 Ponds	13	28.57142857142857	41.66666666666667	11.904761904761905	436	12	9	1
3756	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	11	1
3757	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	8	1
3758	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	6	1
3759	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	7	1
3760	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	5	1
3761	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	10	1
3762	Creation of 3 Ponds	12	28.57142857142857	33.33333333333333	9.523809523809522	436	12	9	1
3763	Creation of 2 Ponds	17	35.714285714285715	16.666666666666664	5.952380952380952	436	15	11	1
3764	Creation of 2 Ponds	14	35.714285714285715	0	0	436	15	8	1
3765	Creation of 2 Ponds	13	35.714285714285715	0	0	436	15	6	1
3766	Creation of 2 Ponds	13	35.714285714285715	0	0	436	15	7	1
3767	Creation of 2 Ponds	14	35.714285714285715	0	0	436	15	5	1
3768	Creation of 2 Ponds	14	35.714285714285715	0	0	436	15	10	1
3769	Creation of 2 Ponds	13	35.714285714285715	0	0	436	15	9	1
3770	Creation of 4 Ponds	20	35.714285714285715	41.66666666666667	14.880952380952383	436	15	11	1
3771	Creation of 4 Ponds	17	35.714285714285715	16.666666666666664	5.952380952380952	436	15	8	1
3772	Creation of 4 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	6	1
3773	Creation of 4 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	7	1
3774	Creation of 4 Ponds	17	35.714285714285715	16.666666666666664	5.952380952380952	436	15	5	1
3775	Creation of 4 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	10	1
3776	Creation of 4 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	9	1
3777	Creation of 3 Ponds	19	35.714285714285715	33.33333333333333	11.904761904761903	436	15	11	1
3778	Creation of 3 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	8	1
3779	Creation of 3 Ponds	15	35.714285714285715	0	0	436	15	6	1
3780	Creation of 3 Ponds	15	35.714285714285715	0	0	436	15	7	1
3781	Creation of 3 Ponds	16	35.714285714285715	8.333333333333332	2.976190476190476	436	15	5	1
3782	Creation of 3 Ponds	15	35.714285714285715	0	0	436	15	10	1
3783	Creation of 3 Ponds	15	35.714285714285715	0	0	436	15	9	1
3784	Creation of 2 Ponds	5468.950705	3.571428571428571	27.432785611111115	0.9797423432539684	436	17	11	1
3785	Creation of 2 Ponds	5877.343785	3.571428571428571	31.9704865	1.1418030892857143	436	17	8	1
3786	Creation of 2 Ponds	5730.314498	3.571428571428571	30.33682775555555	1.083458134126984	436	17	6	1
3787	Creation of 2 Ponds	5730.314498	3.571428571428571	30.33682775555555	1.083458134126984	436	17	7	1
3788	Creation of 2 Ponds	5778.356564	3.571428571428571	30.870628488888883	1.1025224460317458	436	17	5	1
3789	Creation of 2 Ponds	5825.54143	3.571428571428571	31.394904777777782	1.1212465992063492	436	17	10	1
3790	Creation of 2 Ponds	5825.54143	3.571428571428571	31.394904777777782	1.1212465992063492	436	17	9	1
3791	Creation of 4 Ponds	10937.90141	3.571428571428571	88.19890455555556	3.1499608769841267	436	17	11	1
3792	Creation of 4 Ponds	11754.68757	3.571428571428571	97.27430633333334	3.4740823690476192	436	17	8	1
3793	Creation of 4 Ponds	11460.629	3.571428571428571	94.0069888888889	3.3573924603174605	436	17	6	1
3794	Creation of 4 Ponds	11460.629	3.571428571428571	94.0069888888889	3.3573924603174605	436	17	7	1
3795	Creation of 4 Ponds	11556.71313	3.571428571428571	95.07459033333333	3.395521083333333	436	17	5	1
3796	Creation of 4 Ponds	11651.08286	3.571428571428571	96.12314288888889	3.4329693888888886	436	17	10	1
3797	Creation of 4 Ponds	11651.08286	3.571428571428571	96.12314288888889	3.4329693888888886	436	17	9	1
3798	Creation of 3 Ponds	8203.426058	3.571428571428571	57.815845088888885	2.06485161031746	436	17	11	1
3799	Creation of 3 Ponds	8816.015678	3.571428571428571	64.62239642222222	2.307942729365079	436	17	8	1
3800	Creation of 3 Ponds	8595.471747	3.571428571428571	62.1719083	2.220425296428571	436	17	6	1
3801	Creation of 3 Ponds	8595.471747	3.571428571428571	62.1719083	2.220425296428571	436	17	7	1
3802	Creation of 3 Ponds	8667.534847	3.571428571428571	62.97260941111112	2.24902176468254	436	17	5	1
3803	Creation of 3 Ponds	8738.312145	3.571428571428571	63.75902383333333	2.277107994047619	436	17	10	1
3804	Creation of 3 Ponds	8738.312145	3.571428571428571	63.75902383333333	2.277107994047619	436	17	9	1
3805	Creation of 2 Ponds	8	37.5	20	7.5	439	2	11	1
3806	Creation of 2 Ponds	8	37.5	20	7.5	439	2	8	1
3807	Creation of 2 Ponds	8	37.5	20	7.5	439	2	6	1
3808	Creation of 2 Ponds	8	37.5	20	7.5	439	2	7	1
3809	Creation of 2 Ponds	8	37.5	20	7.5	439	2	5	1
3810	Creation of 2 Ponds	8	37.5	20	7.5	439	2	10	1
3811	Creation of 2 Ponds	8	37.5	20	7.5	439	2	9	1
3812	Creation of 9 Ponds	10	37.5	60	22.5	439	2	11	1
3813	Creation of 9 Ponds	10	37.5	60	22.5	439	2	8	1
3814	Creation of 9 Ponds	10	37.5	60	22.5	439	2	6	1
3815	Creation of 9 Ponds	10	37.5	60	22.5	439	2	7	1
3816	Creation of 9 Ponds	10	37.5	60	22.5	439	2	5	1
3817	Creation of 9 Ponds	10	37.5	60	22.5	439	2	10	1
3818	Creation of 9 Ponds	10	37.5	60	22.5	439	2	9	1
3819	Creation of 6 Ponds	10	37.5	60	22.5	439	2	11	1
3820	Creation of 6 Ponds	10	37.5	60	22.5	439	2	8	1
3821	Creation of 6 Ponds	10	37.5	60	22.5	439	2	6	1
3822	Creation of 6 Ponds	10	37.5	60	22.5	439	2	7	1
3823	Creation of 6 Ponds	10	37.5	60	22.5	439	2	5	1
3824	Creation of 6 Ponds	10	37.5	60	22.5	439	2	10	1
3825	Creation of 6 Ponds	10	37.5	60	22.5	439	2	9	1
3826	Creation of 2 Ponds	11	12.5	25	3.125	439	12	11	1
3827	Creation of 2 Ponds	11	12.5	25	3.125	439	12	8	1
3828	Creation of 2 Ponds	11	12.5	25	3.125	439	12	6	1
3829	Creation of 2 Ponds	11	12.5	25	3.125	439	12	7	1
3830	Creation of 2 Ponds	11	12.5	25	3.125	439	12	5	1
3831	Creation of 2 Ponds	11	12.5	25	3.125	439	12	10	1
3832	Creation of 2 Ponds	11	12.5	25	3.125	439	12	9	1
3833	Creation of 9 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	11	1
3834	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	8	1
3835	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	6	1
3836	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	7	1
3837	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	5	1
3838	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	10	1
3839	Creation of 9 Ponds	16	12.5	66.66666666666666	8.333333333333332	439	12	9	1
3840	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	11	1
3841	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	8	1
3842	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	6	1
3843	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	7	1
3844	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	5	1
3845	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	10	1
3846	Creation of 6 Ponds	15	12.5	58.333333333333336	7.291666666666668	439	12	9	1
3847	Creation of 2 Ponds	8	20	20	4	440	2	11	1
3848	Creation of 2 Ponds	8	20	20	4	440	2	8	1
3849	Creation of 2 Ponds	8	20	20	4	440	2	6	1
3850	Creation of 2 Ponds	8	20	20	4	440	2	7	1
3851	Creation of 2 Ponds	8	20	20	4	440	2	5	1
3852	Creation of 2 Ponds	8	20	20	4	440	2	10	1
3853	Creation of 2 Ponds	8	20	20	4	440	2	9	1
3854	Creation of 7 Ponds	10	20	60	12	440	2	11	1
3855	Creation of 7 Ponds	10	20	60	12	440	2	8	1
3856	Creation of 7 Ponds	10	20	60	12	440	2	6	1
3857	Creation of 7 Ponds	10	20	60	12	440	2	7	1
3858	Creation of 7 Ponds	10	20	60	12	440	2	5	1
3859	Creation of 7 Ponds	10	20	60	12	440	2	10	1
3860	Creation of 7 Ponds	10	20	60	12	440	2	9	1
3861	Creation of 4 Ponds	9	20	40	8	440	2	11	1
3862	Creation of 4 Ponds	9	20	40	8	440	2	8	1
3863	Creation of 4 Ponds	9	20	40	8	440	2	6	1
3864	Creation of 4 Ponds	9	20	40	8	440	2	7	1
3865	Creation of 4 Ponds	9	20	40	8	440	2	5	1
3866	Creation of 4 Ponds	9	20	40	8	440	2	10	1
3867	Creation of 4 Ponds	9	20	40	8	440	2	9	1
3868	Creation of 2 Ponds	11	60	25	15	440	12	11	1
3869	Creation of 2 Ponds	11	60	25	15	440	12	8	1
3870	Creation of 2 Ponds	11	60	25	15	440	12	6	1
3871	Creation of 2 Ponds	11	60	25	15	440	12	7	1
3872	Creation of 2 Ponds	11	60	25	15	440	12	5	1
3873	Creation of 2 Ponds	11	60	25	15	440	12	10	1
3874	Creation of 2 Ponds	11	60	25	15	440	12	9	1
3875	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	11	1
3876	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	8	1
3877	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	6	1
3878	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	7	1
3879	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	5	1
3880	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	10	1
3881	Creation of 7 Ponds	15	60	58.333333333333336	35	440	12	9	1
3882	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	11	1
3883	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	8	1
3884	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	6	1
3885	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	7	1
3886	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	5	1
3887	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	10	1
3888	Creation of 4 Ponds	13	60	41.66666666666667	25.000000000000004	440	12	9	1
3889	Creation of 2 Ponds	17	20	16.666666666666664	3.3333333333333326	440	15	11	1
3890	Creation of 2 Ponds	14	20	0	0	440	15	8	1
3891	Creation of 2 Ponds	13	20	0	0	440	15	6	1
3892	Creation of 2 Ponds	13	20	0	0	440	15	7	1
3893	Creation of 2 Ponds	14	20	0	0	440	15	5	1
3894	Creation of 2 Ponds	14	20	0	0	440	15	10	1
3895	Creation of 2 Ponds	13	20	0	0	440	15	9	1
3896	Creation of 7 Ponds	22	20	58.333333333333336	11.666666666666668	440	15	11	1
3897	Creation of 7 Ponds	19	20	33.33333333333333	6.666666666666665	440	15	8	1
3898	Creation of 7 Ponds	18	20	25	5	440	15	6	1
3899	Creation of 7 Ponds	18	20	25	5	440	15	7	1
3900	Creation of 7 Ponds	19	20	33.33333333333333	6.666666666666665	440	15	5	1
3901	Creation of 7 Ponds	18	20	25	5	440	15	10	1
3902	Creation of 7 Ponds	18	20	25	5	440	15	9	1
3903	Creation of 4 Ponds	20	20	41.66666666666667	8.333333333333336	440	15	11	1
3904	Creation of 4 Ponds	17	20	16.666666666666664	3.3333333333333326	440	15	8	1
3905	Creation of 4 Ponds	16	20	8.333333333333332	1.6666666666666663	440	15	6	1
3906	Creation of 4 Ponds	16	20	8.333333333333332	1.6666666666666663	440	15	7	1
3907	Creation of 4 Ponds	17	20	16.666666666666664	3.3333333333333326	440	15	5	1
3908	Creation of 4 Ponds	16	20	8.333333333333332	1.6666666666666663	440	15	10	1
3909	Creation of 4 Ponds	16	20	8.333333333333332	1.6666666666666663	440	15	9	1
3910	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	11	1
3911	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	8	1
3912	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	6	1
3913	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	7	1
3914	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	5	1
3915	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	10	1
3916	Creation of 2 Ponds	8	71.42857142857143	20	14.285714285714286	441	2	9	1
3917	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	11	1
3918	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	8	1
3919	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	6	1
3920	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	7	1
3921	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	5	1
3922	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	10	1
3923	Creation of 16 Ponds	12	71.42857142857143	100	71.42857142857143	441	2	9	1
3924	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	11	1
3925	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	8	1
3926	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	6	1
3927	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	7	1
3928	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	5	1
3929	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	10	1
3930	Creation of 9 Ponds	10	71.42857142857143	60	42.85714285714286	441	2	9	1
3931	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	11	1
3932	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	8	1
3933	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	6	1
3934	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	7	1
3935	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	5	1
3936	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	10	1
3937	Creation of 2 Ponds	11	28.57142857142857	25	7.142857142857142	441	12	9	1
3938	Creation of 16 Ponds	18	28.57142857142857	83.33333333333334	23.80952380952381	441	12	11	1
3939	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	8	1
3940	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	6	1
3941	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	7	1
3942	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	5	1
3943	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	10	1
3944	Creation of 16 Ponds	19	28.57142857142857	91.66666666666666	26.19047619047619	441	12	9	1
3945	Creation of 9 Ponds	15	28.57142857142857	58.333333333333336	16.666666666666664	441	12	11	1
3946	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	8	1
3947	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	6	1
3948	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	7	1
3949	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	5	1
3950	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	10	1
3951	Creation of 9 Ponds	16	28.57142857142857	66.66666666666666	19.047619047619044	441	12	9	1
3952	Creation of 2 Ponds	8	80	12.5	10	442	2	11	1
3953	Creation of 2 Ponds	8	80	12.5	10	442	2	8	1
3954	Creation of 2 Ponds	8	80	12.5	10	442	2	6	1
3955	Creation of 2 Ponds	8	80	12.5	10	442	2	7	1
3956	Creation of 2 Ponds	8	80	12.5	10	442	2	5	1
3957	Creation of 2 Ponds	8	80	12.5	10	442	2	10	1
3958	Creation of 2 Ponds	8	80	12.5	10	442	2	9	1
3959	Creation of 16 Ponds	12	80	62.5	50	442	2	11	1
3960	Creation of 16 Ponds	12	80	62.5	50	442	2	8	1
3961	Creation of 16 Ponds	12	80	62.5	50	442	2	6	1
3962	Creation of 16 Ponds	12	80	62.5	50	442	2	7	1
3963	Creation of 16 Ponds	12	80	62.5	50	442	2	5	1
3964	Creation of 16 Ponds	12	80	62.5	50	442	2	10	1
3965	Creation of 16 Ponds	12	80	62.5	50	442	2	9	1
3966	Creation of 9 Ponds	10	80	37.5	30	442	2	11	1
3967	Creation of 9 Ponds	10	80	37.5	30	442	2	8	1
3968	Creation of 9 Ponds	10	80	37.5	30	442	2	6	1
3969	Creation of 9 Ponds	10	80	37.5	30	442	2	7	1
3970	Creation of 9 Ponds	10	80	37.5	30	442	2	5	1
3971	Creation of 9 Ponds	10	80	37.5	30	442	2	10	1
3972	Creation of 9 Ponds	10	80	37.5	30	442	2	9	1
3973	Creation of 2 Ponds	11	20	25	5	442	12	11	1
3974	Creation of 2 Ponds	11	20	25	5	442	12	8	1
3975	Creation of 2 Ponds	11	20	25	5	442	12	6	1
3976	Creation of 2 Ponds	11	20	25	5	442	12	7	1
3977	Creation of 2 Ponds	11	20	25	5	442	12	5	1
3978	Creation of 2 Ponds	11	20	25	5	442	12	10	1
3979	Creation of 2 Ponds	11	20	25	5	442	12	9	1
3980	Creation of 16 Ponds	18	20	83.33333333333334	16.66666666666667	442	12	11	1
3981	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	8	1
3982	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	6	1
3983	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	7	1
3984	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	5	1
3985	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	10	1
3986	Creation of 16 Ponds	19	20	91.66666666666666	18.33333333333333	442	12	9	1
3987	Creation of 9 Ponds	15	20	58.333333333333336	11.666666666666668	442	12	11	1
3988	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	8	1
3989	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	6	1
3990	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	7	1
3991	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	5	1
3992	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	10	1
3993	Creation of 9 Ponds	16	20	66.66666666666666	13.33333333333333	442	12	9	1
3994	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	11	1
3995	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	8	1
3996	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	6	1
3997	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	7	1
3998	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	5	1
3999	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	10	1
4000	Creation of 2 Ponds	8	48.55491329479769	12.5	6.069364161849711	443	2	9	1
4001	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	11	1
4002	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	8	1
4003	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	6	1
4004	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	7	1
4005	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	5	1
4006	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	10	1
4007	Creation of 14 Ponds	11	48.55491329479769	50	24.277456647398843	443	2	9	1
4008	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	11	1
4009	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	8	1
4010	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	6	1
4011	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	7	1
4012	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	5	1
4013	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	10	1
4014	Creation of 8 Ponds	10	48.55491329479769	37.5	18.208092485549134	443	2	9	1
4015	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	11	1
4016	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	8	1
4017	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	6	1
4018	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	7	1
4019	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	5	1
4020	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	10	1
4021	Creation of 2 Ponds	11	7.22543352601156	25	1.80635838150289	443	12	9	1
4022	Creation of 14 Ponds	17	7.22543352601156	75	5.41907514450867	443	12	11	1
4023	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	8	1
4024	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	6	1
4025	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	7	1
4026	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	5	1
4027	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	10	1
4028	Creation of 14 Ponds	18	7.22543352601156	83.33333333333334	6.021194605009635	443	12	9	1
4029	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	11	1
4030	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	8	1
4031	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	6	1
4032	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	7	1
4033	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	5	1
4034	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	10	1
4035	Creation of 8 Ponds	16	7.22543352601156	66.66666666666666	4.816955684007707	443	12	9	1
4036	Creation of 2 Ponds	17	37.283236994219656	16.666666666666664	6.213872832369942	443	15	11	1
4037	Creation of 2 Ponds	14	37.283236994219656	0	0	443	15	8	1
4038	Creation of 2 Ponds	13	37.283236994219656	0	0	443	15	6	1
4039	Creation of 2 Ponds	13	37.283236994219656	0	0	443	15	7	1
4040	Creation of 2 Ponds	14	37.283236994219656	0	0	443	15	5	1
4041	Creation of 2 Ponds	14	37.283236994219656	0	0	443	15	10	1
4042	Creation of 2 Ponds	13	37.283236994219656	0	0	443	15	9	1
4043	Creation of 14 Ponds	25	37.283236994219656	83.33333333333334	31.069364161849716	443	15	11	1
4044	Creation of 14 Ponds	22	37.283236994219656	58.333333333333336	21.7485549132948	443	15	8	1
4045	Creation of 14 Ponds	21	37.283236994219656	50	18.641618497109828	443	15	6	1
4046	Creation of 14 Ponds	21	37.283236994219656	50	18.641618497109828	443	15	7	1
4047	Creation of 14 Ponds	22	37.283236994219656	58.333333333333336	21.7485549132948	443	15	5	1
4048	Creation of 14 Ponds	21	37.283236994219656	50	18.641618497109828	443	15	10	1
4049	Creation of 14 Ponds	21	37.283236994219656	50	18.641618497109828	443	15	9	1
4050	Creation of 8 Ponds	23	37.283236994219656	66.66666666666666	24.85549132947977	443	15	11	1
4051	Creation of 8 Ponds	20	37.283236994219656	41.66666666666667	15.534682080924858	443	15	8	1
4052	Creation of 8 Ponds	19	37.283236994219656	33.33333333333333	12.427745664739884	443	15	6	1
4053	Creation of 8 Ponds	19	37.283236994219656	33.33333333333333	12.427745664739884	443	15	7	1
4054	Creation of 8 Ponds	20	37.283236994219656	41.66666666666667	15.534682080924858	443	15	5	1
4055	Creation of 8 Ponds	19	37.283236994219656	33.33333333333333	12.427745664739884	443	15	10	1
4056	Creation of 8 Ponds	19	37.283236994219656	33.33333333333333	12.427745664739884	443	15	9	1
4057	Creation of 2 Ponds	5468.950705	6.936416184971099	27.432785611111115	1.902852181117534	443	17	11	1
4058	Creation of 2 Ponds	5877.343785	6.936416184971099	31.9704865	2.2176060000000004	443	17	8	1
4059	Creation of 2 Ponds	5730.314498	6.936416184971099	30.33682775555555	2.10428863044316	443	17	6	1
4060	Creation of 2 Ponds	5730.314498	6.936416184971099	30.33682775555555	2.10428863044316	443	17	7	1
4061	Creation of 2 Ponds	5778.356564	6.936416184971099	30.870628488888883	2.141315270905588	443	17	5	1
4062	Creation of 2 Ponds	5825.54143	6.936416184971099	31.394904777777782	2.177681256262043	443	17	10	1
4063	Creation of 2 Ponds	5825.54143	6.936416184971099	31.394904777777782	2.177681256262043	443	17	9	1
4064	Creation of 14 Ponds	38282.65494	6.936416184971099	100	6.936416184971099	443	17	11	1
4065	Creation of 14 Ponds	41141.4065	6.936416184971099	100	6.936416184971099	443	17	8	1
4066	Creation of 14 Ponds	40112.20149	6.936416184971099	100	6.936416184971099	443	17	6	1
4067	Creation of 14 Ponds	40112.20149	6.936416184971099	100	6.936416184971099	443	17	7	1
4068	Creation of 14 Ponds	40448.49595	6.936416184971099	100	6.936416184971099	443	17	5	1
4069	Creation of 14 Ponds	40778.79001	6.936416184971099	100	6.936416184971099	443	17	10	1
4070	Creation of 14 Ponds	40778.79001	6.936416184971099	100	6.936416184971099	443	17	9	1
4071	Creation of 8 Ponds	21875.80282	6.936416184971099	100	6.936416184971099	443	17	11	1
4072	Creation of 8 Ponds	23509.37514	6.936416184971099	100	6.936416184971099	443	17	8	1
4073	Creation of 8 Ponds	22921.25799	6.936416184971099	100	6.936416184971099	443	17	6	1
4074	Creation of 8 Ponds	22921.25799	6.936416184971099	100	6.936416184971099	443	17	7	1
4075	Creation of 8 Ponds	23113.42626	6.936416184971099	100	6.936416184971099	443	17	5	1
4076	Creation of 8 Ponds	23302.16572	6.936416184971099	100	6.936416184971099	443	17	10	1
4077	Creation of 8 Ponds	23302.16572	6.936416184971099	100	6.936416184971099	443	17	9	1
4078	Creation of 2 Ponds	8	60	12.5	7.5	444	2	11	1
4079	Creation of 2 Ponds	8	60	12.5	7.5	444	2	8	1
4080	Creation of 2 Ponds	8	60	12.5	7.5	444	2	6	1
4081	Creation of 2 Ponds	8	60	12.5	7.5	444	2	7	1
4082	Creation of 2 Ponds	8	60	12.5	7.5	444	2	5	1
4083	Creation of 2 Ponds	8	60	12.5	7.5	444	2	10	1
4084	Creation of 2 Ponds	8	60	12.5	7.5	444	2	9	1
4085	Creation of 8 Ponds	10	60	37.5	22.5	444	2	11	1
4086	Creation of 8 Ponds	10	60	37.5	22.5	444	2	8	1
4087	Creation of 8 Ponds	10	60	37.5	22.5	444	2	6	1
4088	Creation of 8 Ponds	10	60	37.5	22.5	444	2	7	1
4089	Creation of 8 Ponds	10	60	37.5	22.5	444	2	5	1
4090	Creation of 8 Ponds	10	60	37.5	22.5	444	2	10	1
4091	Creation of 8 Ponds	10	60	37.5	22.5	444	2	9	1
4092	Creation of 5 Ponds	9	60	25	15	444	2	11	1
4093	Creation of 5 Ponds	9	60	25	15	444	2	8	1
4094	Creation of 5 Ponds	9	60	25	15	444	2	6	1
4095	Creation of 5 Ponds	9	60	25	15	444	2	7	1
4096	Creation of 5 Ponds	9	60	25	15	444	2	5	1
4097	Creation of 5 Ponds	9	60	25	15	444	2	10	1
4098	Creation of 5 Ponds	9	60	25	15	444	2	9	1
4099	Creation of 2 Ponds	11	40	25	10	444	12	11	1
4100	Creation of 2 Ponds	11	40	25	10	444	12	8	1
4101	Creation of 2 Ponds	11	40	25	10	444	12	6	1
4102	Creation of 2 Ponds	11	40	25	10	444	12	7	1
4103	Creation of 2 Ponds	11	40	25	10	444	12	5	1
4104	Creation of 2 Ponds	11	40	25	10	444	12	10	1
4105	Creation of 2 Ponds	11	40	25	10	444	12	9	1
4106	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	11	1
4107	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	8	1
4108	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	6	1
4109	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	7	1
4110	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	5	1
4111	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	10	1
4112	Creation of 8 Ponds	16	40	66.66666666666666	26.66666666666666	444	12	9	1
4113	Creation of 5 Ponds	14	40	50	20	444	12	11	1
4114	Creation of 5 Ponds	14	40	50	20	444	12	8	1
4115	Creation of 5 Ponds	14	40	50	20	444	12	6	1
4116	Creation of 5 Ponds	14	40	50	20	444	12	7	1
4117	Creation of 5 Ponds	14	40	50	20	444	12	5	1
4118	Creation of 5 Ponds	14	40	50	20	444	12	10	1
4119	Creation of 5 Ponds	14	40	50	20	444	12	9	1
4120	Création de2étangs	8	100	12.5	12.5	446	2	11	1
4121	Création de2étangs	8	100	12.5	12.5	446	2	10	1
4122	Création de2étangs	8	100	12.5	12.5	446	2	9	1
4123	Création de2étangs	8	100	12.5	12.5	446	2	8	1
4124	Création de2étangs	8	100	12.5	12.5	446	2	7	1
4125	Création de2étangs	8	100	12.5	12.5	446	2	6	1
4126	Création de2étangs	8	100	12.5	12.5	446	2	5	1
4127	Création de8étangs	10	100	37.5	37.5	446	2	11	1
4128	Création de8étangs	10	100	37.5	37.5	446	2	10	1
4129	Création de8étangs	10	100	37.5	37.5	446	2	9	1
4130	Création de8étangs	10	100	37.5	37.5	446	2	8	1
4131	Création de8étangs	10	100	37.5	37.5	446	2	7	1
4132	Création de8étangs	10	100	37.5	37.5	446	2	6	1
4133	Création de8étangs	10	100	37.5	37.5	446	2	5	1
4134	Création de5étangs	9	100	25	25	446	2	11	1
4135	Création de5étangs	9	100	25	25	446	2	10	1
4136	Création de5étangs	9	100	25	25	446	2	9	1
4137	Création de5étangs	9	100	25	25	446	2	8	1
4138	Création de5étangs	9	100	25	25	446	2	7	1
4139	Création de5étangs	9	100	25	25	446	2	6	1
4140	Création de5étangs	9	100	25	25	446	2	5	1
4141	Création de2étangs	8	100	12.5	12.5	447	2	11	1
4142	Création de2étangs	8	100	12.5	12.5	447	2	10	1
4143	Création de2étangs	8	100	12.5	12.5	447	2	9	1
4144	Création de2étangs	8	100	12.5	12.5	447	2	8	1
4145	Création de2étangs	8	100	12.5	12.5	447	2	7	1
4146	Création de2étangs	8	100	12.5	12.5	447	2	6	1
4147	Création de2étangs	8	100	12.5	12.5	447	2	5	1
4148	Création de8étangs	10	100	37.5	37.5	447	2	11	1
4149	Création de8étangs	10	100	37.5	37.5	447	2	10	1
4150	Création de8étangs	10	100	37.5	37.5	447	2	9	1
4151	Création de8étangs	10	100	37.5	37.5	447	2	8	1
4152	Création de8étangs	10	100	37.5	37.5	447	2	7	1
4153	Création de8étangs	10	100	37.5	37.5	447	2	6	1
4154	Création de8étangs	10	100	37.5	37.5	447	2	5	1
4155	Création de5étangs	9	100	25	25	447	2	11	1
4156	Création de5étangs	9	100	25	25	447	2	10	1
4157	Création de5étangs	9	100	25	25	447	2	9	1
4158	Création de5étangs	9	100	25	25	447	2	8	1
4159	Création de5étangs	9	100	25	25	447	2	7	1
4160	Création de5étangs	9	100	25	25	447	2	6	1
4161	Création de5étangs	9	100	25	25	447	2	5	1
4186	Création de 2 étangs	8	100	12.5	12.5	481	2	11	1
4187	Création de 2 étangs	8	100	12.5	12.5	481	2	10	1
4188	Création de 2 étangs	8	100	12.5	12.5	481	2	9	1
4189	Création de 2 étangs	8	100	12.5	12.5	481	2	8	1
4190	Création de 2 étangs	8	100	12.5	12.5	481	2	7	1
4191	Création de 2 étangs	8	100	12.5	12.5	481	2	6	1
4192	Création de 2 étangs	8	100	12.5	12.5	481	2	5	1
4193	Création de 8 étangs	10	100	37.5	37.5	481	2	11	1
4194	Création de 8 étangs	10	100	37.5	37.5	481	2	10	1
4195	Création de 8 étangs	10	100	37.5	37.5	481	2	9	1
4196	Création de 8 étangs	10	100	37.5	37.5	481	2	8	1
4197	Création de 8 étangs	10	100	37.5	37.5	481	2	7	1
4198	Création de 8 étangs	10	100	37.5	37.5	481	2	6	1
4199	Création de 8 étangs	10	100	37.5	37.5	481	2	5	1
4200	Création de 5 étangs	9	100	25	25	481	2	11	1
4201	Création de 5 étangs	9	100	25	25	481	2	10	1
4202	Création de 5 étangs	9	100	25	25	481	2	9	1
4203	Création de 5 étangs	9	100	25	25	481	2	8	1
4204	Création de 5 étangs	9	100	25	25	481	2	7	1
4205	Création de 5 étangs	9	100	25	25	481	2	6	1
4206	Création de 5 étangs	9	100	25	25	481	2	5	1
4207	Création de 2 étangs	8	100	12.5	12.5	483	2	5	1
4208	Création de 2 étangs	8	100	12.5	12.5	483	2	6	1
4209	Création de 2 étangs	8	100	12.5	12.5	483	2	7	1
4210	Création de 2 étangs	8	100	12.5	12.5	483	2	11	1
4211	Création de 2 étangs	8	100	12.5	12.5	483	2	10	1
4212	Création de 2 étangs	8	100	12.5	12.5	483	2	9	1
4213	Création de 2 étangs	8	100	12.5	12.5	483	2	8	1
4214	Création de 9 étangs	10	100	37.5	37.5	483	2	5	1
4215	Création de 9 étangs	10	100	37.5	37.5	483	2	6	1
4216	Création de 9 étangs	10	100	37.5	37.5	483	2	7	1
4217	Création de 9 étangs	10	100	37.5	37.5	483	2	11	1
4218	Création de 9 étangs	10	100	37.5	37.5	483	2	10	1
4219	Création de 9 étangs	10	100	37.5	37.5	483	2	9	1
4220	Création de 9 étangs	10	100	37.5	37.5	483	2	8	1
4221	Création de 6 étangs	10	100	37.5	37.5	483	2	5	1
4222	Création de 6 étangs	10	100	37.5	37.5	483	2	6	1
4223	Création de 6 étangs	10	100	37.5	37.5	483	2	7	1
4224	Création de 6 étangs	10	100	37.5	37.5	483	2	11	1
4225	Création de 6 étangs	10	100	37.5	37.5	483	2	10	1
4226	Création de 6 étangs	10	100	37.5	37.5	483	2	9	1
4227	Création de 6 étangs	10	100	37.5	37.5	483	2	8	1
4228	Création de 2 étangs	11	100	25	25	484	12	5	1
4229	Création de 2 étangs	11	100	25	25	484	12	6	1
4230	Création de 2 étangs	11	100	25	25	484	12	7	1
4231	Création de 2 étangs	11	100	25	25	484	12	11	1
4232	Création de 2 étangs	11	100	25	25	484	12	10	1
4233	Création de 2 étangs	11	100	25	25	484	12	9	1
4234	Création de 2 étangs	11	100	25	25	484	12	8	1
4235	Création de 10 étangs	17	100	75	75	484	12	5	1
4236	Création de 10 étangs	17	100	75	75	484	12	6	1
4237	Création de 10 étangs	17	100	75	75	484	12	7	1
4238	Création de 10 étangs	16	100	66.66666666666666	66.66666666666666	484	12	11	1
4239	Création de 10 étangs	17	100	75	75	484	12	10	1
4240	Création de 10 étangs	17	100	75	75	484	12	9	1
4241	Création de 10 étangs	17	100	75	75	484	12	8	1
4242	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	5	1
4243	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	6	1
4244	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	7	1
4245	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	11	1
4246	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	10	1
4247	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	9	1
4248	Création de 6 étangs	15	100	58.333333333333336	58.33333333333334	484	12	8	1
4261	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	5	1
4262	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	6	1
4263	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	7	1
4264	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	11	1
4265	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	10	1
4266	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	9	1
4267	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	518	2	8	1
4268	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	5	1
4269	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	6	1
4270	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	7	1
4271	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	11	1
4272	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	10	1
4273	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	9	1
4274	Création de 8 étangs	10	33.33333333333333	37.5	12.499999999999998	518	2	8	1
4275	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	5	1
4276	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	6	1
4277	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	7	1
4278	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	11	1
4279	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	10	1
4280	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	9	1
4281	Création de 5 étangs	9	33.33333333333333	25	8.333333333333332	518	2	8	1
4282	Création de 2 étangs	11	25	25	6.25	518	12	5	1
4283	Création de 2 étangs	11	25	25	6.25	518	12	6	1
4284	Création de 2 étangs	11	25	25	6.25	518	12	7	1
4285	Création de 2 étangs	11	25	25	6.25	518	12	11	1
4286	Création de 2 étangs	11	25	25	6.25	518	12	10	1
4287	Création de 2 étangs	11	25	25	6.25	518	12	9	1
4288	Création de 2 étangs	11	25	25	6.25	518	12	8	1
4289	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	5	1
4290	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	6	1
4291	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	7	1
4292	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	11	1
4293	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	10	1
4294	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	9	1
4295	Création de 8 étangs	16	25	66.66666666666666	16.666666666666664	518	12	8	1
4296	Création de 5 étangs	14	25	50	12.5	518	12	5	1
4297	Création de 5 étangs	14	25	50	12.5	518	12	6	1
4298	Création de 5 étangs	14	25	50	12.5	518	12	7	1
4299	Création de 5 étangs	14	25	50	12.5	518	12	11	1
4300	Création de 5 étangs	14	25	50	12.5	518	12	10	1
4301	Création de 5 étangs	14	25	50	12.5	518	12	9	1
4302	Création de 5 étangs	14	25	50	12.5	518	12	8	1
4303	Création de 2 étangs	14	4.166666666666666	0	0	518	15	5	1
4304	Création de 2 étangs	13	4.166666666666666	0	0	518	15	6	1
4305	Création de 2 étangs	13	4.166666666666666	0	0	518	15	7	1
4306	Création de 2 étangs	17	4.166666666666666	16.666666666666664	0.6944444444444443	518	15	11	1
4307	Création de 2 étangs	14	4.166666666666666	0	0	518	15	10	1
4308	Création de 2 étangs	13	4.166666666666666	0	0	518	15	9	1
4309	Création de 2 étangs	14	4.166666666666666	0	0	518	15	8	1
4310	Création de 8 étangs	20	4.166666666666666	41.66666666666667	1.7361111111111112	518	15	5	1
4311	Création de 8 étangs	19	4.166666666666666	33.33333333333333	1.3888888888888886	518	15	6	1
4312	Création de 8 étangs	19	4.166666666666666	33.33333333333333	1.3888888888888886	518	15	7	1
4313	Création de 8 étangs	23	4.166666666666666	66.66666666666666	2.7777777777777772	518	15	11	1
4314	Création de 8 étangs	19	4.166666666666666	33.33333333333333	1.3888888888888886	518	15	10	1
4315	Création de 8 étangs	19	4.166666666666666	33.33333333333333	1.3888888888888886	518	15	9	1
4316	Création de 8 étangs	20	4.166666666666666	41.66666666666667	1.7361111111111112	518	15	8	1
4317	Création de 5 étangs	18	4.166666666666666	25	1.0416666666666665	518	15	5	1
4318	Création de 5 étangs	17	4.166666666666666	16.666666666666664	0.6944444444444443	518	15	6	1
4319	Création de 5 étangs	17	4.166666666666666	16.666666666666664	0.6944444444444443	518	15	7	1
4320	Création de 5 étangs	21	4.166666666666666	50	2.083333333333333	518	15	11	1
4321	Création de 5 étangs	17	4.166666666666666	16.666666666666664	0.6944444444444443	518	15	10	1
4322	Création de 5 étangs	17	4.166666666666666	16.666666666666664	0.6944444444444443	518	15	9	1
4323	Création de 5 étangs	18	4.166666666666666	25	1.0416666666666665	518	15	8	1
4324	Création de 2 étangs	5778.356564	12.5	6.244488693333333	0.7805610866666666	518	17	5	1
4325	Création de 2 étangs	5730.314498	12.5	6.152979996190475	0.7691224995238095	518	17	6	1
4326	Création de 2 étangs	5730.314498	12.5	6.152979996190475	0.7691224995238095	518	17	7	1
4327	Création de 2 étangs	5468.950705	12.5	5.6551442	0.706893025	518	17	11	1
4328	Création de 2 étangs	5825.54143	12.5	6.334364628571429	0.7917955785714286	518	17	10	1
4329	Création de 2 étangs	5825.54143	12.5	6.334364628571429	0.7917955785714286	518	17	9	1
4330	Création de 2 étangs	5877.343785	12.5	6.433035780952381	0.8041294726190477	518	17	8	1
4331	Création de 8 étangs	23113.42626	12.5	39.263669066666665	4.907958633333333	518	17	5	1
4332	Création de 8 étangs	22921.25799	12.5	38.897634266666664	4.862204283333333	518	17	6	1
4333	Création de 8 étangs	22921.25799	12.5	38.897634266666664	4.862204283333333	518	17	7	1
4334	Création de 8 étangs	21875.80282	12.5	36.90629108571429	4.613286385714286	518	17	11	1
4335	Création de 8 étangs	23302.16572	12.5	39.6231728	4.9528966	518	17	10	1
4336	Création de 8 étangs	23302.16572	12.5	39.6231728	4.9528966	518	17	9	1
4337	Création de 8 étangs	23509.37514	12.5	40.01785740952381	5.002232176190477	518	17	8	1
4338	Création de 5 étangs	14445.89141	12.5	22.754078876190476	2.84425985952381	518	17	5	1
4339	Création de 5 étangs	14325.78624	12.5	22.525307123809522	2.8156633904761903	518	17	6	1
4340	Création de 5 étangs	14325.78624	12.5	22.525307123809522	2.8156633904761903	518	17	7	1
4341	Création de 5 étangs	13672.37676	12.5	21.280717638095236	2.660089704761904	518	17	11	1
4342	Création de 5 étangs	14563.85358	12.5	22.978768723809527	2.872346090476191	518	17	10	1
4343	Création de 5 étangs	14563.85358	12.5	22.978768723809527	2.872346090476191	518	17	9	1
4344	Création de 5 étangs	14693.35946	12.5	23.22544659047619	2.9031808238095236	518	17	8	1
4345	Création de 2 étangs	-380.6451355	25	100	25	518	18	5	1
4346	Création de 2 étangs	-397.9537383	25	100	25	518	18	6	1
4347	Création de 2 étangs	-398.8532866	25	100	25	518	18	7	1
4348	Création de 2 étangs	-185.0909311	25	100	25	518	18	11	1
4349	Création de 2 étangs	-402.7287926	25	100	25	518	18	10	1
4350	Création de 2 étangs	-401.8292442	25	100	25	518	18	9	1
4351	Création de 2 étangs	-380.4540246	25	100	25	518	18	8	1
4352	Création de 8 étangs	-1522.580542	25	80.67422446846847	20.168556117117117	518	18	5	1
4353	Création de 8 étangs	-1591.814953	25	79.4267576036036	19.8566894009009	518	18	6	1
4354	Création de 8 étangs	-1595.413147	25	79.36192527927928	19.84048131981982	518	18	7	1
4355	Création de 8 étangs	-740.3637246	25	94.76822117837838	23.692055294594596	518	18	11	1
4356	Création de 8 étangs	-1610.91517	25	79.08260954954955	19.770652387387386	518	18	10	1
4357	Création de 8 étangs	-1607.316977	25	79.14744185585585	19.78686046396396	518	18	9	1
4358	Création de 8 étangs	-1521.816099	25	80.68799821621622	20.171999554054054	518	18	8	1
4359	Création de 5 étangs	-951.6128388	25	90.96193083243243	22.740482708108107	518	18	5	1
4360	Création de 5 étangs	-994.8843457	25	90.18226404144144	22.54556601036036	518	18	6	1
4361	Création de 5 étangs	-997.1332166	25	90.14174384504504	22.53543596126126	518	18	7	1
4362	Création de 5 étangs	-462.7273279	25	99.77067877657657	24.942669694144143	518	18	11	1
4363	Création de 5 étangs	-1006.821981	25	89.9671715135135	22.491792878378376	518	18	10	1
4364	Création de 5 étangs	-1004.573111	25	90.0076916936937	22.501922923423425	518	18	9	1
4365	Création de 5 étangs	-951.1350616	25	90.97053943063062	22.742634857657652	518	18	8	1
4366	Création de 2 étangs	5778.356564	66.66666666666666	6.244488693333333	4.162992462222221	519	17	5	1
4367	Création de 2 étangs	5730.314498	66.66666666666666	6.152979996190475	4.101986664126983	519	17	6	1
4368	Création de 2 étangs	5730.314498	66.66666666666666	6.152979996190475	4.101986664126983	519	17	7	1
4369	Création de 2 étangs	5468.950705	66.66666666666666	5.6551442	3.770096133333333	519	17	11	1
4370	Création de 2 étangs	5825.54143	66.66666666666666	6.334364628571429	4.222909752380952	519	17	10	1
4371	Création de 2 étangs	5825.54143	66.66666666666666	6.334364628571429	4.222909752380952	519	17	9	1
4372	Création de 2 étangs	5877.343785	66.66666666666666	6.433035780952381	4.28869052063492	519	17	8	1
4373	Création de 20 étangs	57783.56564	66.66666666666666	100	66.66666666666666	519	17	5	1
4374	Création de 20 étangs	57303.14498	66.66666666666666	100	66.66666666666666	519	17	6	1
4375	Création de 20 étangs	57303.14498	66.66666666666666	100	66.66666666666666	519	17	7	1
4376	Création de 20 étangs	54689.50705	66.66666666666666	99.40858485714286	66.2723899047619	519	17	11	1
4377	Création de 20 étangs	58255.4143	66.66666666666666	100	66.66666666666666	519	17	10	1
4378	Création de 20 étangs	58255.4143	66.66666666666666	100	66.66666666666666	519	17	9	1
4379	Création de 20 étangs	58773.43785	66.66666666666666	100	66.66666666666666	519	17	8	1
4380	Création de 11 étangs	31780.9611	66.66666666666666	55.77325923809524	37.182172825396826	519	17	5	1
4381	Création de 11 étangs	31516.72974	66.66666666666666	55.2699614095238	36.84664093968253	519	17	6	1
4382	Création de 11 étangs	31516.72974	66.66666666666666	55.2699614095238	36.84664093968253	519	17	7	1
4383	Création de 11 étangs	30079.22888	66.66666666666666	52.53186453333333	35.02124302222221	519	17	11	1
4384	Création de 11 étangs	32040.47787	66.66666666666666	56.26757689523809	37.511717930158724	519	17	10	1
4385	Création de 11 étangs	32040.47787	66.66666666666666	56.26757689523809	37.511717930158724	519	17	9	1
4386	Création de 11 étangs	32325.39082	66.66666666666666	56.810268228571424	37.87351215238095	519	17	8	1
4387	Création de 2 étangs	-380.6451355	33.33333333333333	100	33.33333333333333	519	18	5	1
4388	Création de 2 étangs	-397.9537383	33.33333333333333	100	33.33333333333333	519	18	6	1
4389	Création de 2 étangs	-398.8532866	33.33333333333333	100	33.33333333333333	519	18	7	1
4390	Création de 2 étangs	-185.0909311	33.33333333333333	100	33.33333333333333	519	18	11	1
4391	Création de 2 étangs	-402.7287926	33.33333333333333	100	33.33333333333333	519	18	10	1
4392	Création de 2 étangs	-401.8292442	33.33333333333333	100	33.33333333333333	519	18	9	1
4393	Création de 2 étangs	-380.4540246	33.33333333333333	100	33.33333333333333	519	18	8	1
4394	Création de 20 étangs	-3806.451355	33.33333333333333	39.52339900900901	13.174466336336335	519	18	5	1
4395	Création de 20 étangs	-3979.537383	33.33333333333333	36.404731837837836	12.13491061261261	519	18	6	1
4396	Création de 20 étangs	-3988.532866	33.33333333333333	36.242651063063064	12.080883687687685	519	18	7	1
4397	Création de 20 étangs	-1850.909311	33.33333333333333	74.75839079279281	24.919463597597602	519	18	11	1
4398	Création de 20 étangs	-4027.287926	33.33333333333333	35.544361693693695	11.848120564564562	519	18	10	1
4399	Création de 20 étangs	-4018.292442	33.33333333333333	35.70644248648649	11.902147495495495	519	18	9	1
4400	Création de 20 étangs	-3804.540246	33.33333333333333	39.557833405405404	13.185944468468467	519	18	8	1
4401	Création de 11 étangs	-2093.548245	33.33333333333333	70.3865181081081	23.462172702702702	519	18	5	1
4402	Création de 11 étangs	-2188.745561	33.33333333333333	68.67125115315315	22.890417051051045	519	18	6	1
4403	Création de 11 étangs	-2193.693076	33.33333333333333	68.58210673873873	22.86070224624624	519	18	7	1
4404	Création de 11 étangs	-1018.000121	33.33333333333333	89.76576358558559	29.921921195195193	519	18	11	1
4405	Création de 11 étangs	-2215.008359	33.33333333333333	68.19804758558558	22.732682528528525	519	18	10	1
4406	Création de 11 étangs	-2210.060843	33.33333333333333	68.28719201801802	22.762397339339337	519	18	9	1
4407	Création de 11 étangs	-2092.497135	33.33333333333333	70.40545702702703	23.46848567567567	519	18	8	1
4408	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	5	1
4409	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	6	1
4410	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	7	1
4411	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	11	1
4412	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	10	1
4413	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	9	1
4414	Création de 2 étangs	8	31.728045325779036	12.5	3.9660056657223794	524	2	8	1
4415	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	5	1
4416	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	6	1
4417	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	7	1
4418	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	11	1
4419	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	10	1
4420	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	9	1
4421	Création de 20 étangs	12	31.728045325779036	62.5	19.8300283286119	524	2	8	1
4422	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	5	1
4423	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	6	1
4424	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	7	1
4425	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	11	1
4426	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	10	1
4427	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	9	1
4428	Création de 11 étangs	11	31.728045325779036	50	15.864022662889518	524	2	8	1
4429	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	5	1
4430	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	6	1
4431	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	7	1
4432	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	11	1
4433	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	10	1
4434	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	9	1
4435	Création de 2 étangs	11	5.94900849858357	25	1.4872521246458925	524	12	8	1
4436	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	5	1
4437	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	6	1
4438	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	7	1
4439	Création de 20 étangs	19	5.94900849858357	91.66666666666666	5.453257790368272	524	12	11	1
4440	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	10	1
4441	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	9	1
4442	Création de 20 étangs	20	5.94900849858357	100	5.94900849858357	524	12	8	1
4443	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	5	1
4444	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	6	1
4445	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	7	1
4446	Création de 11 étangs	16	5.94900849858357	66.66666666666666	3.9660056657223794	524	12	11	1
4447	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	10	1
4448	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	9	1
4449	Création de 11 étangs	17	5.94900849858357	75	4.4617563739376775	524	12	8	1
4450	Création de 2 étangs	14	31.728045325779036	0	0	524	15	5	1
4451	Création de 2 étangs	13	31.728045325779036	0	0	524	15	6	1
4452	Création de 2 étangs	13	31.728045325779036	0	0	524	15	7	1
4453	Création de 2 étangs	17	31.728045325779036	16.666666666666664	5.288007554296505	524	15	11	1
4454	Création de 2 étangs	14	31.728045325779036	0	0	524	15	10	1
4455	Création de 2 étangs	13	31.728045325779036	0	0	524	15	9	1
4456	Création de 2 étangs	14	31.728045325779036	0	0	524	15	8	1
4457	Création de 20 étangs	24	31.728045325779036	75	23.796033994334277	524	15	5	1
4458	Création de 20 étangs	23	31.728045325779036	66.66666666666666	21.15203021718602	524	15	6	1
4459	Création de 20 étangs	23	31.728045325779036	66.66666666666666	21.15203021718602	524	15	7	1
4460	Création de 20 étangs	27	31.728045325779036	100	31.728045325779036	524	15	11	1
4461	Création de 20 étangs	23	31.728045325779036	66.66666666666666	21.15203021718602	524	15	10	1
4462	Création de 20 étangs	23	31.728045325779036	66.66666666666666	21.15203021718602	524	15	9	1
4463	Création de 20 étangs	24	31.728045325779036	75	23.796033994334277	524	15	8	1
4464	Création de 11 étangs	21	31.728045325779036	50	15.864022662889518	524	15	5	1
4465	Création de 11 étangs	20	31.728045325779036	41.66666666666667	13.220018885741267	524	15	6	1
4466	Création de 11 étangs	20	31.728045325779036	41.66666666666667	13.220018885741267	524	15	7	1
4467	Création de 11 étangs	24	31.728045325779036	75	23.796033994334277	524	15	11	1
4468	Création de 11 étangs	20	31.728045325779036	41.66666666666667	13.220018885741267	524	15	10	1
4469	Création de 11 étangs	20	31.728045325779036	41.66666666666667	13.220018885741267	524	15	9	1
4470	Création de 11 étangs	21	31.728045325779036	50	15.864022662889518	524	15	8	1
4471	Création de 2 étangs	5778.356564	16.997167138810198	6.244488693333333	1.0613861801699715	524	17	5	1
4472	Création de 2 étangs	5730.314498	16.997167138810198	6.152979996190475	1.0458322939700524	524	17	6	1
4473	Création de 2 étangs	5730.314498	16.997167138810198	6.152979996190475	1.0458322939700524	524	17	7	1
4474	Création de 2 étangs	5468.950705	16.997167138810198	5.6551442	0.9612143116147308	524	17	11	1
4475	Création de 2 étangs	5825.54143	16.997167138810198	6.334364628571429	1.0766625430999595	524	17	10	1
4476	Création de 2 étangs	5825.54143	16.997167138810198	6.334364628571429	1.0766625430999595	524	17	9	1
4477	Création de 2 étangs	5877.343785	16.997167138810198	6.433035780952381	1.09343384378794	524	17	8	1
4478	Création de 20 étangs	57783.56564	16.997167138810198	100	16.997167138810198	524	17	5	1
4479	Création de 20 étangs	57303.14498	16.997167138810198	100	16.997167138810198	524	17	6	1
4480	Création de 20 étangs	57303.14498	16.997167138810198	100	16.997167138810198	524	17	7	1
4481	Création de 20 étangs	54689.50705	16.997167138810198	99.40858485714286	16.896643318494537	524	17	11	1
4482	Création de 20 étangs	58255.4143	16.997167138810198	100	16.997167138810198	524	17	10	1
4483	Création de 20 étangs	58255.4143	16.997167138810198	100	16.997167138810198	524	17	9	1
4484	Création de 20 étangs	58773.43785	16.997167138810198	100	16.997167138810198	524	17	8	1
4485	Création de 11 étangs	31780.9611	16.997167138810198	55.77325923809524	9.479874091460948	524	17	5	1
4486	Création de 11 étangs	31516.72974	16.997167138810198	55.2699614095238	9.394327718332658	524	17	6	1
4487	Création de 11 étangs	31516.72974	16.997167138810198	55.2699614095238	9.394327718332658	524	17	7	1
4488	Création de 11 étangs	30079.22888	16.997167138810198	52.53186453333333	8.92892881586402	524	17	11	1
4489	Création de 11 étangs	32040.47787	16.997167138810198	56.26757689523809	9.563894089842169	524	17	10	1
4490	Création de 11 étangs	32040.47787	16.997167138810198	56.26757689523809	9.563894089842169	524	17	9	1
4491	Création de 11 étangs	32325.39082	16.997167138810198	56.810268228571424	9.656136242816673	524	17	8	1
4492	Création de 2 étangs	-380.6451355	13.59773371104816	100	13.59773371104816	524	18	5	1
4493	Création de 2 étangs	-397.9537383	13.59773371104816	100	13.59773371104816	524	18	6	1
4494	Création de 2 étangs	-398.8532866	13.59773371104816	100	13.59773371104816	524	18	7	1
4495	Création de 2 étangs	-185.0909311	13.59773371104816	100	13.59773371104816	524	18	11	1
4496	Création de 2 étangs	-402.7287926	13.59773371104816	100	13.59773371104816	524	18	10	1
4497	Création de 2 étangs	-401.8292442	13.59773371104816	100	13.59773371104816	524	18	9	1
4498	Création de 2 étangs	-380.4540246	13.59773371104816	100	13.59773371104816	524	18	8	1
4499	Création de 20 étangs	-3806.451355	13.59773371104816	39.52339900900901	5.374286550800093	524	18	5	1
4500	Création de 20 étangs	-3979.537383	13.59773371104816	36.404731837837836	4.950218493530358	524	18	6	1
4501	Création de 20 étangs	-3988.532866	13.59773371104816	36.242651063063064	4.928179181379681	524	18	7	1
4502	Création de 20 étangs	-1850.909311	13.59773371104816	74.75839079279281	10.165446906668713	524	18	11	1
4503	Création de 20 étangs	-4027.287926	13.59773371104816	35.544361693693695	4.833227652400277	524	18	10	1
4504	Création de 20 étangs	-4018.292442	13.59773371104816	35.70644248648649	4.855266967000996	524	18	9	1
4505	Création de 20 étangs	-3804.540246	13.59773371104816	39.557833405405404	5.378968848327081	524	18	8	1
4506	Création de 11 étangs	-2093.548245	13.59773371104816	70.3865181081081	9.570971300819235	524	18	5	1
4507	Création de 11 étangs	-2188.745561	13.59773371104816	68.67125115315315	9.337733867850854	524	18	6	1
4508	Création de 11 étangs	-2193.693076	13.59773371104816	68.58210673873873	9.325612247760509	524	18	7	1
4509	Création de 11 étangs	-1018.000121	13.59773371104816	89.76576358558559	12.206109496056966	524	18	11	1
4510	Création de 11 étangs	-2215.008359	13.59773371104816	68.19804758558558	9.273388906821838	524	18	10	1
4511	Création de 11 étangs	-2210.060843	13.59773371104816	68.28719201801802	9.285510529362226	524	18	9	1
4512	Création de 11 étangs	-2092.497135	13.59773371104816	70.40545702702703	9.57354656458158	524	18	8	1
4513	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	5	11
4514	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	6	11
4515	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	7	11
4516	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	11	11
4517	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	10	11
4518	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	9	11
4519	Création de 2 étangs	8	29.411764705882355	12.5	3.6764705882352944	528	2	8	11
4520	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	5	11
4521	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	6	11
4522	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	7	11
4523	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	11	11
4524	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	10	11
4525	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	9	11
4526	Création de 15 étangs	11	29.411764705882355	50	14.705882352941178	528	2	8	11
4527	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	5	11
4528	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	6	11
4529	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	7	11
4530	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	11	11
4531	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	10	11
4532	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	9	11
4533	Création de 8 étangs	10	29.411764705882355	37.5	11.029411764705882	528	2	8	11
4534	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	5	11
4535	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	6	11
4536	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	7	11
4537	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	11	11
4538	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	10	11
4539	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	9	11
4540	Création de 2 étangs	11	70.58823529411765	25	17.647058823529413	528	12	8	11
4541	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	5	11
4542	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	6	11
4543	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	7	11
4544	Création de 15 étangs	18	70.58823529411765	83.33333333333334	58.823529411764724	528	12	11	11
4545	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	10	11
4546	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	9	11
4547	Création de 15 étangs	19	70.58823529411765	91.66666666666666	64.70588235294117	528	12	8	11
4548	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	5	11
4549	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	6	11
4550	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	7	11
4551	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	11	11
4552	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	10	11
4553	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	9	11
4554	Création de 8 étangs	16	70.58823529411765	66.66666666666666	47.05882352941177	528	12	8	11
4555	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	5	15
4556	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	6	15
4557	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	7	15
4558	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	11	15
4559	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	10	15
4560	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	9	15
4561	Création de 5 étangs	9	12.396694214876034	25	3.0991735537190084	529	2	8	15
4562	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	5	15
4563	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	6	15
4564	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	7	15
4565	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	11	15
4566	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	10	15
4567	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	9	15
4568	Création de 15 étangs	11	12.396694214876034	50	6.198347107438017	529	2	8	15
4569	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	5	15
4570	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	6	15
4571	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	7	15
4572	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	11	15
4573	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	10	15
4574	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	9	15
4575	Création de 10 étangs	11	12.396694214876034	50	6.198347107438017	529	2	8	15
4576	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	5	15
4577	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	6	15
4578	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	7	15
4579	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	11	15
4580	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	10	15
4581	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	9	15
4582	Création de 5 étangs	14	17.768595041322314	50	8.884297520661157	529	12	8	15
4583	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	5	15
4584	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	6	15
4585	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	7	15
4586	Création de 15 étangs	18	17.768595041322314	83.33333333333334	14.807162534435262	529	12	11	15
4587	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	10	15
4588	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	9	15
4589	Création de 15 étangs	19	17.768595041322314	91.66666666666666	16.287878787878785	529	12	8	15
4590	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	5	15
4591	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	6	15
4592	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	7	15
4593	Création de 10 étangs	16	17.768595041322314	66.66666666666666	11.845730027548207	529	12	11	15
4594	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	10	15
4595	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	9	15
4596	Création de 10 étangs	17	17.768595041322314	75	13.326446280991735	529	12	8	15
4597	Création de 5 étangs	9	15	25	3.75	529	2	5	15
4598	Création de 5 étangs	9	15	25	3.75	529	2	6	15
4599	Création de 5 étangs	9	15	25	3.75	529	2	7	15
4600	Création de 5 étangs	9	15	25	3.75	529	2	11	15
4601	Création de 5 étangs	9	15	25	3.75	529	2	10	15
4602	Création de 5 étangs	9	15	25	3.75	529	2	9	15
4603	Création de 5 étangs	9	15	25	3.75	529	2	8	15
4604	Création de 15 étangs	11	15	50	7.5	529	2	5	15
4605	Création de 15 étangs	11	15	50	7.5	529	2	6	15
4606	Création de 15 étangs	11	15	50	7.5	529	2	7	15
4607	Création de 15 étangs	11	15	50	7.5	529	2	11	15
4608	Création de 15 étangs	11	15	50	7.5	529	2	10	15
4609	Création de 15 étangs	11	15	50	7.5	529	2	9	15
4610	Création de 15 étangs	11	15	50	7.5	529	2	8	15
4611	Création de 10 étangs	11	15	50	7.5	529	2	5	15
4612	Création de 10 étangs	11	15	50	7.5	529	2	6	15
4613	Création de 10 étangs	11	15	50	7.5	529	2	7	15
4614	Création de 10 étangs	11	15	50	7.5	529	2	11	15
4615	Création de 10 étangs	11	15	50	7.5	529	2	10	15
4616	Création de 10 étangs	11	15	50	7.5	529	2	9	15
4617	Création de 10 étangs	11	15	50	7.5	529	2	8	15
4618	Création de 5 étangs	14	21.5	50	10.75	529	12	5	15
4619	Création de 5 étangs	14	21.5	50	10.75	529	12	6	15
4620	Création de 5 étangs	14	21.5	50	10.75	529	12	7	15
4621	Création de 5 étangs	14	21.5	50	10.75	529	12	11	15
4622	Création de 5 étangs	14	21.5	50	10.75	529	12	10	15
4623	Création de 5 étangs	14	21.5	50	10.75	529	12	9	15
4624	Création de 5 étangs	14	21.5	50	10.75	529	12	8	15
4625	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	5	15
4626	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	6	15
4627	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	7	15
4628	Création de 15 étangs	18	21.5	83.33333333333334	17.91666666666667	529	12	11	15
4629	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	10	15
4630	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	9	15
4631	Création de 15 étangs	19	21.5	91.66666666666666	19.70833333333333	529	12	8	15
4632	Création de 10 étangs	17	21.5	75	16.125	529	12	5	15
4633	Création de 10 étangs	17	21.5	75	16.125	529	12	6	15
4634	Création de 10 étangs	17	21.5	75	16.125	529	12	7	15
4635	Création de 10 étangs	16	21.5	66.66666666666666	14.33333333333333	529	12	11	15
4636	Création de 10 étangs	17	21.5	75	16.125	529	12	10	15
4637	Création de 10 étangs	17	21.5	75	16.125	529	12	9	15
4638	Création de 10 étangs	17	21.5	75	16.125	529	12	8	15
4639	Création de 5 étangs	18	15	25	3.75	529	15	5	15
4640	Création de 5 étangs	17	15	16.666666666666664	2.4999999999999996	529	15	6	15
4641	Création de 5 étangs	17	15	16.666666666666664	2.4999999999999996	529	15	7	15
4642	Création de 5 étangs	21	15	50	7.5	529	15	11	15
4643	Création de 5 étangs	17	15	16.666666666666664	2.4999999999999996	529	15	10	15
4644	Création de 5 étangs	17	15	16.666666666666664	2.4999999999999996	529	15	9	15
4645	Création de 5 étangs	18	15	25	3.75	529	15	8	15
4646	Création de 15 étangs	23	15	66.66666666666666	9.999999999999998	529	15	5	15
4647	Création de 15 étangs	22	15	58.333333333333336	8.75	529	15	6	15
4648	Création de 15 étangs	22	15	58.333333333333336	8.75	529	15	7	15
4649	Création de 15 étangs	26	15	91.66666666666666	13.749999999999998	529	15	11	15
4650	Création de 15 étangs	22	15	58.333333333333336	8.75	529	15	10	15
4651	Création de 15 étangs	22	15	58.333333333333336	8.75	529	15	9	15
4652	Création de 15 étangs	23	15	66.66666666666666	9.999999999999998	529	15	8	15
4653	Création de 10 étangs	21	15	50	7.5	529	15	5	15
4654	Création de 10 étangs	20	15	41.66666666666667	6.250000000000001	529	15	6	15
4655	Création de 10 étangs	20	15	41.66666666666667	6.250000000000001	529	15	7	15
4656	Création de 10 étangs	24	15	75	11.25	529	15	11	15
4657	Création de 10 étangs	20	15	41.66666666666667	6.250000000000001	529	15	10	15
4658	Création de 10 étangs	20	15	41.66666666666667	6.250000000000001	529	15	9	15
4659	Création de 10 étangs	21	15	50	7.5	529	15	8	15
4660	Création de 5 étangs	14445.89141	20	22.754078876190476	4.550815775238095	529	17	5	15
4661	Création de 5 étangs	14325.78624	20	22.525307123809522	4.505061424761904	529	17	6	15
4662	Création de 5 étangs	14325.78624	20	22.525307123809522	4.505061424761904	529	17	7	15
4663	Création de 5 étangs	13672.37676	20	21.280717638095236	4.256143527619048	529	17	11	15
4664	Création de 5 étangs	14563.85358	20	22.978768723809527	4.595753744761905	529	17	10	15
4665	Création de 5 étangs	14563.85358	20	22.978768723809527	4.595753744761905	529	17	9	15
4666	Création de 5 étangs	14693.35946	20	23.22544659047619	4.645089318095238	529	17	8	15
4667	Création de 15 étangs	43337.67423	20	77.78604615238095	15.55720923047619	529	17	5	15
4668	Création de 15 étangs	42977.35873	20	77.09973091428571	15.419946182857142	529	17	6	15
4669	Création de 15 étangs	42977.35873	20	77.09973091428571	15.419946182857142	529	17	7	15
4670	Création de 15 étangs	41017.13029	20	73.36596245714287	14.673192491428575	529	17	11	15
4671	Création de 15 étangs	43691.56073	20	78.46011567619047	15.692023135238093	529	17	10	15
4672	Création de 15 étangs	43691.56073	20	78.46011567619047	15.692023135238093	529	17	9	15
4673	Création de 15 étangs	44080.07839	20	79.20014931428571	15.840029862857142	529	17	8	15
4674	Création de 10 étangs	28891.78282	20	50.27006251428572	10.054012502857143	529	17	5	15
4675	Création de 10 étangs	28651.57249	20	49.81251902857143	9.962503805714286	529	17	6	15
4676	Création de 10 étangs	28651.57249	20	49.81251902857143	9.962503805714286	529	17	7	15
4677	Création de 10 étangs	27344.75353	20	47.32334005714286	9.464668011428572	529	17	11	15
4678	Création de 10 étangs	29127.70715	20	50.71944219047618	10.143888438095235	529	17	10	15
4679	Création de 10 étangs	29127.70715	20	50.71944219047618	10.143888438095235	529	17	9	15
4680	Création de 10 étangs	29386.71893	20	51.212797961904755	10.242559592380951	529	17	8	15
4681	Création de 5 étangs	-951.6128388	20	90.96193083243243	18.192386166486486	529	18	5	15
4682	Création de 5 étangs	-994.8843457	20	90.18226404144144	18.03645280828829	529	18	6	15
4683	Création de 5 étangs	-997.1332166	20	90.14174384504504	18.028348769009007	529	18	7	15
4684	Création de 5 étangs	-462.7273279	20	99.77067877657657	19.954135755315313	529	18	11	15
4685	Création de 5 étangs	-1006.821981	20	89.9671715135135	17.993434302702703	529	18	10	15
4686	Création de 5 étangs	-1004.573111	20	90.0076916936937	18.00153833873874	529	18	9	15
4687	Création de 5 étangs	-951.1350616	20	90.97053943063062	18.194107886126126	529	18	8	15
4688	Création de 15 étangs	-2854.838516	20	56.66957628828829	11.333915257657658	529	18	5	15
4689	Création de 15 étangs	-2984.653037	20	54.3305759099099	10.866115181981982	529	18	6	15
4690	Création de 15 étangs	-2991.39965	20	54.20901531531533	10.841803063063066	529	18	7	15
4691	Création de 15 étangs	-1388.181984	20	83.09582010810811	16.61916402162162	529	18	11	15
4692	Création de 15 étangs	-3020.465944	20	53.68529830630631	10.737059661261263	529	18	10	15
4693	Création de 15 étangs	-3013.719332	20	53.80685888288288	10.761371776576574	529	18	9	15
4694	Création de 15 étangs	-2853.405185	20	56.69540207207206	11.339080414414413	529	18	8	15
4695	Création de 10 étangs	-1903.225678	20	73.81575354954956	14.76315070990991	529	18	5	15
4696	Création de 10 étangs	-1989.768691	20	72.25641998198198	14.451283996396397	529	18	6	15
4697	Création de 10 étangs	-1994.266433	20	72.17537958558559	14.435075917117118	529	18	7	15
4698	Création de 10 étangs	-925.4546557	20	91.43324944684684	18.286649889369368	529	18	11	15
4699	Création de 10 étangs	-2013.643963	20	71.8262349009009	14.36524698018018	529	18	10	15
4700	Création de 10 étangs	-2009.146221	20	71.9072752972973	14.38145505945946	529	18	9	15
4701	Création de 10 étangs	-1902.270123	20	73.83297075675675	14.76659415135135	529	18	8	15
4702	Création de 1 étangs	7	17.3469387755102	0	0	531	2	5	11
4703	Création de 1 étangs	7	17.3469387755102	0	0	531	2	6	11
4704	Création de 1 étangs	7	17.3469387755102	0	0	531	2	7	11
4705	Création de 1 étangs	7	17.3469387755102	0	0	531	2	11	11
4706	Création de 1 étangs	7	17.3469387755102	0	0	531	2	10	11
4707	Création de 1 étangs	7	17.3469387755102	0	0	531	2	9	11
4708	Création de 1 étangs	7	17.3469387755102	0	0	531	2	8	11
4709	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	5	11
4710	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	6	11
4711	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	7	11
4712	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	11	11
4713	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	10	11
4714	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	9	11
4715	Création de 4 étangs	9	17.3469387755102	25	4.33673469387755	531	2	8	11
4716	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	5	11
4717	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	6	11
4718	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	7	11
4719	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	11	11
4720	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	10	11
4721	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	9	11
4722	Création de 2 étangs	8	17.3469387755102	12.5	2.168367346938775	531	2	8	11
4723	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	5	11
4724	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	6	11
4725	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	7	11
4726	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	11	11
4727	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	10	11
4728	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	9	11
4729	Création de 1 étangs	9	36.73469387755102	8.333333333333332	3.0612244897959173	531	12	8	11
4730	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	5	11
4731	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	6	11
4732	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	7	11
4733	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	11	11
4734	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	10	11
4735	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	9	11
4736	Création de 4 étangs	13	36.73469387755102	41.66666666666667	15.306122448979593	531	12	8	11
4737	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	5	11
4738	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	6	11
4739	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	7	11
4740	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	11	11
4741	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	10	11
4742	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	9	11
4743	Création de 2 étangs	11	36.73469387755102	25	9.183673469387754	531	12	8	11
4744	Création de 1 étangs	2889.178282	36.73469387755102	0.7412919657142855	0.2723113343440232	531	17	5	11
4745	Création de 1 étangs	2865.157249	36.73469387755102	0.6955376171428569	0.2555036144606413	531	17	6	11
4746	Création de 1 étangs	2865.157249	36.73469387755102	0.6955376171428569	0.2555036144606413	531	17	7	11
4747	Création de 1 étangs	2734.475353	36.73469387755102	0.44661971999999966	0.16406438693877537	531	17	11	11
4748	Création de 1 étangs	2912.770715	36.73469387755102	0.7862299333333335	0.28881915918367346	531	17	10	11
4749	Création de 1 étangs	2912.770715	36.73469387755102	0.7862299333333335	0.28881915918367346	531	17	9	11
4750	Création de 1 étangs	2938.671893	36.73469387755102	0.8355655104761908	0.30694243241982516	531	17	8	11
4751	Création de 4 étangs	11556.71313	36.73469387755102	17.250882152380953	6.3370587498542275	531	17	5	11
4752	Création de 4 étangs	11460.629	36.73469387755102	17.067864761904765	6.269827871720118	531	17	6	11
4753	Création de 4 étangs	11460.629	36.73469387755102	17.067864761904765	6.269827871720118	531	17	7	11
4754	Création de 4 étangs	10937.90141	36.73469387755102	16.072193161904764	5.904070957434402	531	17	11	11
4755	Création de 4 étangs	11651.08286	36.73469387755102	17.43063401904762	6.403090047813411	531	17	10	11
4756	Création de 4 étangs	11651.08286	36.73469387755102	17.43063401904762	6.403090047813411	531	17	9	11
4757	Création de 4 étangs	11754.68757	36.73469387755102	17.627976323809524	6.4755831393586	531	17	8	11
4758	Création de 2 étangs	5778.356564	36.73469387755102	6.244488693333333	2.2938938057142853	531	17	5	11
4759	Création de 2 étangs	5730.314498	36.73469387755102	6.152979996190475	2.260278365947521	531	17	6	11
4760	Création de 2 étangs	5730.314498	36.73469387755102	6.152979996190475	2.260278365947521	531	17	7	11
4761	Création de 2 étangs	5468.950705	36.73469387755102	5.6551442	2.077399910204081	531	17	11	11
4762	Création de 2 étangs	5825.54143	36.73469387755102	6.334364628571429	2.3269094553935856	531	17	10	11
4763	Création de 2 étangs	5825.54143	36.73469387755102	6.334364628571429	2.3269094553935856	531	17	9	11
4764	Création de 2 étangs	5877.343785	36.73469387755102	6.433035780952381	2.3631560011661805	531	17	8	11
4765	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	5	14
4766	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	6	14
4767	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	7	14
4768	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	11	14
4769	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	10	14
4770	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	9	14
4771	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	530	2	8	14
4772	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	5	14
4773	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	6	14
4774	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	7	14
4775	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	11	14
4776	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	10	14
4777	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	9	14
4778	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	530	2	8	14
4779	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	5	14
4780	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	6	14
4781	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	7	14
4782	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	11	14
4783	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	10	14
4784	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	9	14
4785	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	530	2	8	14
4786	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	5	14
4787	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	6	14
4788	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	7	14
4789	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	11	14
4790	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	10	14
4791	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	9	14
4792	Création de 5 étangs	14	24.59016393442623	50	12.295081967213115	530	12	8	14
4793	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	5	14
4794	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	6	14
4795	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	7	14
4796	Création de 20 étangs	19	24.59016393442623	91.66666666666666	22.540983606557376	530	12	11	14
4797	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	10	14
4798	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	9	14
4799	Création de 20 étangs	20	24.59016393442623	100	24.59016393442623	530	12	8	14
4800	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	5	14
4801	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	6	14
4802	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	7	14
4803	Création de 12 étangs	17	24.59016393442623	75	18.442622950819672	530	12	11	14
4804	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	10	14
4805	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	9	14
4806	Création de 12 étangs	18	24.59016393442623	83.33333333333334	20.491803278688526	530	12	8	14
4807	Création de 5 étangs	18	24.59016393442623	25	6.147540983606557	530	15	5	14
4808	Création de 5 étangs	17	24.59016393442623	16.666666666666664	4.098360655737705	530	15	6	14
4809	Création de 5 étangs	17	24.59016393442623	16.666666666666664	4.098360655737705	530	15	7	14
4810	Création de 5 étangs	21	24.59016393442623	50	12.295081967213115	530	15	11	14
4811	Création de 5 étangs	17	24.59016393442623	16.666666666666664	4.098360655737705	530	15	10	14
4812	Création de 5 étangs	17	24.59016393442623	16.666666666666664	4.098360655737705	530	15	9	14
4813	Création de 5 étangs	18	24.59016393442623	25	6.147540983606557	530	15	8	14
4814	Création de 20 étangs	24	24.59016393442623	75	18.442622950819672	530	15	5	14
4815	Création de 20 étangs	23	24.59016393442623	66.66666666666666	16.39344262295082	530	15	6	14
4816	Création de 20 étangs	23	24.59016393442623	66.66666666666666	16.39344262295082	530	15	7	14
4817	Création de 20 étangs	27	24.59016393442623	100	24.59016393442623	530	15	11	14
4818	Création de 20 étangs	23	24.59016393442623	66.66666666666666	16.39344262295082	530	15	10	14
4819	Création de 20 étangs	23	24.59016393442623	66.66666666666666	16.39344262295082	530	15	9	14
4820	Création de 20 étangs	24	24.59016393442623	75	18.442622950819672	530	15	8	14
4821	Création de 12 étangs	21	24.59016393442623	50	12.295081967213115	530	15	5	14
4822	Création de 12 étangs	20	24.59016393442623	41.66666666666667	10.245901639344263	530	15	6	14
4823	Création de 12 étangs	20	24.59016393442623	41.66666666666667	10.245901639344263	530	15	7	14
4824	Création de 12 étangs	24	24.59016393442623	75	18.442622950819672	530	15	11	14
4825	Création de 12 étangs	20	24.59016393442623	41.66666666666667	10.245901639344263	530	15	10	14
4826	Création de 12 étangs	20	24.59016393442623	41.66666666666667	10.245901639344263	530	15	9	14
4827	Création de 12 étangs	21	24.59016393442623	50	12.295081967213115	530	15	8	14
4828	Création de 5 étangs	14445.89141	13.114754098360656	22.754078876190476	2.984141491959407	530	17	5	14
4829	Création de 5 étangs	14325.78624	13.114754098360656	22.525307123809522	2.9541386391881344	530	17	6	14
4830	Création de 5 étangs	14325.78624	13.114754098360656	22.525307123809522	2.9541386391881344	530	17	7	14
4831	Création de 5 étangs	13672.37676	13.114754098360656	21.280717638095236	2.790913788602654	530	17	11	14
4832	Création de 5 étangs	14563.85358	13.114754098360656	22.978768723809527	3.013609012958627	530	17	10	14
4833	Création de 5 étangs	14563.85358	13.114754098360656	22.978768723809527	3.013609012958627	530	17	9	14
4834	Création de 5 étangs	14693.35946	13.114754098360656	23.22544659047619	3.045960208587041	530	17	8	14
4835	Création de 20 étangs	57783.56564	13.114754098360656	100	13.114754098360656	530	17	5	14
4836	Création de 20 étangs	57303.14498	13.114754098360656	100	13.114754098360656	530	17	6	14
4837	Création de 20 étangs	57303.14498	13.114754098360656	100	13.114754098360656	530	17	7	14
4838	Création de 20 étangs	54689.50705	13.114754098360656	99.40858485714286	13.037191456674472	530	17	11	14
4839	Création de 20 étangs	58255.4143	13.114754098360656	100	13.114754098360656	530	17	10	14
4840	Création de 20 étangs	58255.4143	13.114754098360656	100	13.114754098360656	530	17	9	14
4841	Création de 20 étangs	58773.43785	13.114754098360656	100	13.114754098360656	530	17	8	14
4842	Création de 12 étangs	34670.13939	13.114754098360656	61.27645598095237	8.036256522092115	530	17	5	14
4843	Création de 12 étangs	34381.88699	13.114754098360656	60.72740379047619	7.9642496774395	530	17	6	14
4844	Création de 12 étangs	34381.88699	13.114754098360656	60.72740379047619	7.9642496774395	530	17	7	14
4845	Création de 12 étangs	32813.70423	13.114754098360656	57.74038900952382	7.572510034035911	530	17	11	14
4846	Création de 12 étangs	34953.24858	13.114754098360656	61.81571158095238	8.106978567993755	530	17	10	14
4847	Création de 12 étangs	34953.24858	13.114754098360656	61.81571158095238	8.106978567993755	530	17	9	14
4848	Création de 12 étangs	35264.06271	13.114754098360656	62.4077384952381	8.18462144199844	530	17	8	14
4849	Création de 5 étangs	-951.6128388	13.114754098360656	90.96193083243243	11.929433551794418	530	18	5	14
4850	Création de 5 étangs	-994.8843457	13.114754098360656	90.18226404144144	11.827182169369369	530	18	6	14
4851	Création de 5 étangs	-997.1332166	13.114754098360656	90.14174384504504	11.821868045251808	530	18	7	14
4852	Création de 5 étangs	-462.7273279	13.114754098360656	99.77067877657657	13.084679183813321	530	18	11	14
4853	Création de 5 étangs	-1006.821981	13.114754098360656	89.9671715135135	11.798973313247673	530	18	10	14
4854	Création de 5 étangs	-1004.573111	13.114754098360656	90.0076916936937	11.804287435238518	530	18	9	14
4855	Création de 5 étangs	-951.1350616	13.114754098360656	90.97053943063062	11.930562548279427	530	18	8	14
4856	Création de 20 étangs	-3806.451355	13.114754098360656	39.52339900900901	5.183396591345444	530	18	5	14
4857	Création de 20 étangs	-3979.537383	13.114754098360656	36.404731837837836	4.774391060700044	530	18	6	14
4858	Création de 20 étangs	-3988.532866	13.114754098360656	36.242651063063064	4.753134565647615	530	18	7	14
4859	Création de 20 étangs	-1850.909311	13.114754098360656	74.75839079279281	9.80437912036627	530	18	11	14
4860	Création de 20 étangs	-4027.287926	13.114754098360656	35.544361693693695	4.661555631959829	530	18	10	14
4861	Création de 20 étangs	-4018.292442	13.114754098360656	35.70644248648649	4.682812129375277	530	18	9	14
4862	Création de 20 étangs	-3804.540246	13.114754098360656	39.557833405405404	5.187912577758087	530	18	8	14
4863	Création de 12 étangs	-2283.870813	13.114754098360656	66.95728264864866	8.781282970314578	530	18	5	14
4864	Création de 12 étangs	-2387.72243	13.114754098360656	65.08608234234234	8.535879651454733	530	18	6	14
4865	Création de 12 étangs	-2393.11972	13.114754098360656	64.98883387387387	8.523125753950673	530	18	7	14
4866	Création de 12 étangs	-1110.545587	13.114754098360656	88.0982777117117	11.553872486781863	530	18	11	14
4867	Création de 12 étangs	-2416.372755	13.114754098360656	64.56986027027027	8.468178396101019	530	18	10	14
4868	Création de 12 étangs	-2410.975465	13.114754098360656	64.66710873873875	8.480932293605083	530	18	9	14
4869	Création de 12 étangs	-2282.724148	13.114754098360656	66.97794327927929	8.783992561216955	530	18	8	14
4870	Création de 1 étangs	7	7.854984894259818	0	0	535	2	5	11
4871	Création de 1 étangs	7	7.854984894259818	0	0	535	2	6	11
4872	Création de 1 étangs	7	7.854984894259818	0	0	535	2	7	11
4873	Création de 1 étangs	7	7.854984894259818	0	0	535	2	11	11
4874	Création de 1 étangs	7	7.854984894259818	0	0	535	2	10	11
4875	Création de 1 étangs	7	7.854984894259818	0	0	535	2	9	11
4876	Création de 1 étangs	7	7.854984894259818	0	0	535	2	8	11
4877	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	5	11
4878	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	6	11
4879	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	7	11
4880	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	11	11
4881	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	10	11
4882	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	9	11
4883	Création de 8 étangs	10	7.854984894259818	37.5	2.945619335347432	535	2	8	11
4884	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	5	11
4885	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	6	11
4886	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	7	11
4887	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	11	11
4888	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	10	11
4889	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	9	11
4890	Création de 4 étangs	9	7.854984894259818	25	1.9637462235649545	535	2	8	11
4891	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	5	11
4892	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	6	11
4893	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	7	11
4894	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	11	11
4895	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	10	11
4896	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	9	11
4897	Création de 1 étangs	9	20.84592145015106	8.333333333333332	1.7371601208459213	535	12	8	11
4898	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	5	11
4899	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	6	11
4900	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	7	11
4901	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	11	11
4902	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	10	11
4903	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	9	11
4904	Création de 8 étangs	16	20.84592145015106	66.66666666666666	13.89728096676737	535	12	8	11
4905	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	5	11
4906	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	6	11
4907	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	7	11
4908	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	11	11
4909	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	10	11
4910	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	9	11
4911	Création de 4 étangs	13	20.84592145015106	41.66666666666667	8.685800604229609	535	12	8	11
4912	Création de 1 étangs	12	12.386706948640484	0	0	535	15	5	11
4913	Création de 1 étangs	12	12.386706948640484	0	0	535	15	6	11
4914	Création de 1 étangs	11	12.386706948640484	0	0	535	15	7	11
4915	Création de 1 étangs	15	12.386706948640484	0	0	535	15	11	11
4916	Création de 1 étangs	11	12.386706948640484	0	0	535	15	10	11
4917	Création de 1 étangs	11	12.386706948640484	0	0	535	15	9	11
4918	Création de 1 étangs	12	12.386706948640484	0	0	535	15	8	11
4919	Création de 8 étangs	20	12.386706948640484	41.66666666666667	5.161127895266869	535	15	5	11
4920	Création de 8 étangs	19	12.386706948640484	33.33333333333333	4.128902316213495	535	15	6	11
4921	Création de 8 étangs	19	12.386706948640484	33.33333333333333	4.128902316213495	535	15	7	11
4922	Création de 8 étangs	23	12.386706948640484	66.66666666666666	8.25780463242699	535	15	11	11
4923	Création de 8 étangs	19	12.386706948640484	33.33333333333333	4.128902316213495	535	15	10	11
4924	Création de 8 étangs	19	12.386706948640484	33.33333333333333	4.128902316213495	535	15	9	11
4925	Création de 8 étangs	20	12.386706948640484	41.66666666666667	5.161127895266869	535	15	8	11
4926	Création de 4 étangs	17	12.386706948640484	16.666666666666664	2.0644511581067473	535	15	5	11
4927	Création de 4 étangs	16	12.386706948640484	8.333333333333332	1.0322255790533736	535	15	6	11
4928	Création de 4 étangs	16	12.386706948640484	8.333333333333332	1.0322255790533736	535	15	7	11
4929	Création de 4 étangs	20	12.386706948640484	41.66666666666667	5.161127895266869	535	15	11	11
4930	Création de 4 étangs	16	12.386706948640484	8.333333333333332	1.0322255790533736	535	15	10	11
4931	Création de 4 étangs	16	12.386706948640484	8.333333333333332	1.0322255790533736	535	15	9	11
4932	Création de 4 étangs	17	12.386706948640484	16.666666666666664	2.0644511581067473	535	15	8	11
4933	Création de 1 étangs	2889.178282	58.91238670694865	0.7412919657142855	0.43671278946914105	535	17	5	11
4934	Création de 1 étangs	2865.157249	58.91238670694865	0.6955376171428569	0.4097578107034958	535	17	6	11
4935	Création de 1 étangs	2865.157249	58.91238670694865	0.6955376171428569	0.4097578107034958	535	17	7	11
4936	Création de 1 étangs	2734.475353	58.91238670694865	0.44661971999999966	0.2631143365558911	535	17	11	11
4937	Création de 1 étangs	2912.770715	58.91238670694865	0.7862299333333335	0.463186818731118	535	17	10	11
4938	Création de 1 étangs	2912.770715	58.91238670694865	0.7862299333333335	0.463186818731118	535	17	9	11
4939	Création de 1 étangs	2938.671893	58.91238670694865	0.8355655104761908	0.49225158472162306	535	17	8	11
4940	Création de 8 étangs	23113.42626	58.91238670694865	39.263669066666665	23.131164555891242	535	17	5	11
4941	Création de 8 étangs	22921.25799	58.91238670694865	38.897634266666664	22.915524719033236	535	17	6	11
4942	Création de 8 étangs	22921.25799	58.91238670694865	38.897634266666664	22.915524719033236	535	17	7	11
4943	Création de 8 étangs	21875.80282	58.91238670694865	36.90629108571429	21.742376923608116	535	17	11	11
4944	Création de 8 étangs	23302.16572	58.91238670694865	39.6231728	23.342956785498494	535	17	10	11
4945	Création de 8 étangs	23302.16572	58.91238670694865	39.6231728	23.342956785498494	535	17	9	11
4946	Création de 8 étangs	23509.37514	58.91238670694865	40.01785740952381	23.575474908933973	535	17	8	11
4947	Création de 4 étangs	11556.71313	58.91238670694865	17.250882152380953	10.162906403970654	535	17	5	11
4948	Création de 4 étangs	11460.629	58.91238670694865	17.067864761904765	10.055086491152355	535	17	6	11
4949	Création de 4 étangs	11460.629	58.91238670694865	17.067864761904765	10.055086491152355	535	17	7	11
4950	Création de 4 étangs	10937.90141	58.91238670694865	16.072193161904764	9.468512587829093	535	17	11	11
4951	Création de 4 étangs	11651.08286	58.91238670694865	17.43063401904762	10.26880251877428	535	17	10	11
4952	Création de 4 étangs	11651.08286	58.91238670694865	17.43063401904762	10.26880251877428	535	17	9	11
4953	Création de 4 étangs	11754.68757	58.91238670694865	17.627976323809524	10.385061580492017	535	17	8	11
4954	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	5	12
4955	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	6	12
4956	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	7	12
4957	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	11	12
4958	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	10	12
4959	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	9	12
4960	Création de 5 étangs	9	32.142857142857146	25	8.035714285714286	532	2	8	12
4961	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	5	12
4962	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	6	12
4963	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	7	12
4964	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	11	12
4965	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	10	12
4966	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	9	12
4967	Création de 10 étangs	11	32.142857142857146	50	16.071428571428573	532	2	8	12
4968	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	5	12
4969	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	6	12
4970	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	7	12
4971	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	11	12
4972	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	10	12
4973	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	9	12
4974	Création de 8 étangs	10	32.142857142857146	37.5	12.053571428571429	532	2	8	12
4975	Création de 5 étangs	14445.89141	19.642857142857146	22.754078876190476	4.469551207823129	532	17	5	12
4976	Création de 5 étangs	14325.78624	19.642857142857146	22.525307123809522	4.424613899319728	532	17	6	12
4977	Création de 5 étangs	14325.78624	19.642857142857146	22.525307123809522	4.424613899319728	532	17	7	12
4978	Création de 5 étangs	13672.37676	19.642857142857146	21.280717638095236	4.180140964625851	532	17	11	12
4979	Création de 5 étangs	14563.85358	19.642857142857146	22.978768723809527	4.513686713605443	532	17	10	12
4980	Création de 5 étangs	14563.85358	19.642857142857146	22.978768723809527	4.513686713605443	532	17	9	12
4981	Création de 5 étangs	14693.35946	19.642857142857146	23.22544659047619	4.562141294557824	532	17	8	12
4982	Création de 10 étangs	28891.78282	19.642857142857146	50.27006251428572	9.874476565306125	532	17	5	12
4983	Création de 10 étangs	28651.57249	19.642857142857146	49.81251902857143	9.784601952040818	532	17	6	12
4984	Création de 10 étangs	28651.57249	19.642857142857146	49.81251902857143	9.784601952040818	532	17	7	12
4985	Création de 10 étangs	27344.75353	19.642857142857146	47.32334005714286	9.295656082653062	532	17	11	12
4986	Création de 10 étangs	29127.70715	19.642857142857146	50.71944219047618	9.962747573129251	532	17	10	12
4987	Création de 10 étangs	29127.70715	19.642857142857146	50.71944219047618	9.962747573129251	532	17	9	12
4988	Création de 10 étangs	29386.71893	19.642857142857146	51.212797961904755	10.059656742517006	532	17	8	12
4989	Création de 8 étangs	23113.42626	19.642857142857146	39.263669066666665	7.712506423809526	532	17	5	12
4990	Création de 8 étangs	22921.25799	19.642857142857146	38.897634266666664	7.640606730952381	532	17	6	12
4991	Création de 8 étangs	22921.25799	19.642857142857146	38.897634266666664	7.640606730952381	532	17	7	12
4992	Création de 8 étangs	21875.80282	19.642857142857146	36.90629108571429	7.249450034693878	532	17	11	12
4993	Création de 8 étangs	23302.16572	19.642857142857146	39.6231728	7.783123228571429	532	17	10	12
4994	Création de 8 étangs	23302.16572	19.642857142857146	39.6231728	7.783123228571429	532	17	9	12
4995	Création de 8 étangs	23509.37514	19.642857142857146	40.01785740952381	7.860650562585035	532	17	8	12
4996	Création de 5 étangs	-951.6128388	48.21428571428572	90.96193083243243	43.856645222779925	532	18	5	12
4997	Création de 5 étangs	-994.8843457	48.21428571428572	90.18226404144144	43.48073444855213	532	18	6	12
4998	Création de 5 étangs	-997.1332166	48.21428571428572	90.14174384504504	43.46119792528958	532	18	7	12
4999	Création de 5 étangs	-462.7273279	48.21428571428572	99.77067877657657	48.10372012442085	532	18	11	12
5000	Création de 5 étangs	-1006.821981	48.21428571428572	89.9671715135135	43.377029122586876	532	18	10	12
5001	Création de 5 étangs	-1004.573111	48.21428571428572	90.0076916936937	43.3965656380309	532	18	9	12
5002	Création de 5 étangs	-951.1350616	48.21428571428572	90.97053943063062	43.8607957969112	532	18	8	12
5003	Création de 10 étangs	-1903.225678	48.21428571428572	73.81575354954956	35.589738318532824	532	18	5	12
5004	Création de 10 étangs	-1989.768691	48.21428571428572	72.25641998198198	34.83791677702703	532	18	6	12
5005	Création de 10 étangs	-1994.266433	48.21428571428572	72.17537958558559	34.79884372876449	532	18	7	12
5006	Création de 10 étangs	-925.4546557	48.21428571428572	91.43324944684684	44.08388812615831	532	18	11	12
5007	Création de 10 étangs	-2013.643963	48.21428571428572	71.8262349009009	34.63050611293437	532	18	10	12
5008	Création de 10 étangs	-2009.146221	48.21428571428572	71.9072752972973	34.66957916119692	532	18	9	12
5009	Création de 10 étangs	-1902.270123	48.21428571428572	73.83297075675675	35.59803947200773	532	18	8	12
5010	Création de 8 étangs	-1522.580542	48.21428571428572	80.67422446846847	38.89650108301159	532	18	5	12
5011	Création de 8 étangs	-1591.814953	48.21428571428572	79.4267576036036	38.2950438445946	532	18	6	12
5012	Création de 8 étangs	-1595.413147	48.21428571428572	79.36192527927928	38.263785402509654	532	18	7	12
5013	Création de 8 étangs	-740.3637246	48.21428571428572	94.76822117837838	45.69182092528958	532	18	11	12
5014	Création de 8 étangs	-1610.91517	48.21428571428572	79.08260954954955	38.129115318532826	532	18	10	12
5015	Création de 8 étangs	-1607.316977	48.21428571428572	79.14744185585585	38.1603737519305	532	18	9	12
5016	Création de 8 étangs	-1521.816099	48.21428571428572	80.68799821621622	38.90314199710426	532	18	8	12
5017	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	5	14
5018	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	6	14
5019	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	7	14
5020	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	11	14
5021	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	10	14
5022	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	9	14
5023	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	8	14
5024	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	5	14
5025	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	6	14
5026	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	7	14
5027	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	11	14
5028	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	10	14
5029	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	9	14
5030	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	8	14
5031	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	5	14
5032	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	6	14
5033	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	7	14
5034	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	11	14
5035	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	10	14
5036	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	9	14
5037	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	8	14
5038	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	5	14
5039	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	6	14
5040	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	7	14
5041	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	11	14
5042	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	10	14
5043	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	9	14
5044	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	8	14
5045	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	5	14
5046	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	6	14
5047	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	7	14
5048	Création de 20 étangs	19	14.814814814814813	91.66666666666666	13.580246913580245	536	12	11	14
5049	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	10	14
5050	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	9	14
5051	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	8	14
5052	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	5	14
5053	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	6	14
5054	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	7	14
5055	Création de 12 étangs	17	14.814814814814813	75	11.11111111111111	536	12	11	14
5056	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	10	14
5057	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	9	14
5058	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	8	14
5059	Création de 5 étangs	18	14.814814814814813	25	3.7037037037037033	536	15	5	14
5060	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	6	14
5061	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	7	14
5062	Création de 5 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	11	14
5063	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	10	14
5064	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	9	14
5065	Création de 5 étangs	18	14.814814814814813	25	3.7037037037037033	536	15	8	14
5066	Création de 20 étangs	24	14.814814814814813	75	11.11111111111111	536	15	5	14
5067	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	6	14
5068	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	7	14
5069	Création de 20 étangs	27	14.814814814814813	100	14.814814814814813	536	15	11	14
5070	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	10	14
5071	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	9	14
5072	Création de 20 étangs	24	14.814814814814813	75	11.11111111111111	536	15	8	14
5073	Création de 12 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	5	14
5074	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	6	14
5075	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	7	14
5076	Création de 12 étangs	24	14.814814814814813	75	11.11111111111111	536	15	11	14
5077	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	10	14
5078	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	9	14
5079	Création de 12 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	8	14
5080	Création de 5 étangs	14445.89141	27.77777777777778	22.754078876190476	6.320577465608466	536	17	5	14
5081	Création de 5 étangs	14325.78624	27.77777777777778	22.525307123809522	6.257029756613756	536	17	6	14
5082	Création de 5 étangs	14325.78624	27.77777777777778	22.525307123809522	6.257029756613756	536	17	7	14
5083	Création de 5 étangs	13672.37676	27.77777777777778	21.280717638095236	5.911310455026455	536	17	11	14
5084	Création de 5 étangs	14563.85358	27.77777777777778	22.978768723809527	6.382991312169313	536	17	10	14
5085	Création de 5 étangs	14563.85358	27.77777777777778	22.978768723809527	6.382991312169313	536	17	9	14
5086	Création de 5 étangs	14693.35946	27.77777777777778	23.22544659047619	6.451512941798942	536	17	8	14
5087	Création de 20 étangs	57783.56564	27.77777777777778	100	27.77777777777778	536	17	5	14
5088	Création de 20 étangs	57303.14498	27.77777777777778	100	27.77777777777778	536	17	6	14
5089	Création de 20 étangs	57303.14498	27.77777777777778	100	27.77777777777778	536	17	7	14
5090	Création de 20 étangs	54689.50705	27.77777777777778	99.40858485714286	27.613495793650795	536	17	11	14
5091	Création de 20 étangs	58255.4143	27.77777777777778	100	27.77777777777778	536	17	10	14
5092	Création de 20 étangs	58255.4143	27.77777777777778	100	27.77777777777778	536	17	9	14
5093	Création de 20 étangs	58773.43785	27.77777777777778	100	27.77777777777778	536	17	8	14
5094	Création de 12 étangs	34670.13939	27.77777777777778	61.27645598095237	17.02123777248677	536	17	5	14
5095	Création de 12 étangs	34381.88699	27.77777777777778	60.72740379047619	16.868723275132275	536	17	6	14
5096	Création de 12 étangs	34381.88699	27.77777777777778	60.72740379047619	16.868723275132275	536	17	7	14
5097	Création de 12 étangs	32813.70423	27.77777777777778	57.74038900952382	16.03899694708995	536	17	11	14
5098	Création de 12 étangs	34953.24858	27.77777777777778	61.81571158095238	17.171030994708996	536	17	10	14
5099	Création de 12 étangs	34953.24858	27.77777777777778	61.81571158095238	17.171030994708996	536	17	9	14
5100	Création de 12 étangs	35264.06271	27.77777777777778	62.4077384952381	17.335482915343917	536	17	8	14
5101	Création de 5 étangs	-951.6128388	27.77777777777778	90.96193083243243	25.26720300900901	536	18	5	14
5102	Création de 5 étangs	-994.8843457	27.77777777777778	90.18226404144144	25.0506289004004	536	18	6	14
5103	Création de 5 étangs	-997.1332166	27.77777777777778	90.14174384504504	25.039373290290293	536	18	7	14
5104	Création de 5 étangs	-462.7273279	27.77777777777778	99.77067877657657	27.71407743793794	536	18	11	14
5105	Création de 5 étangs	-1006.821981	27.77777777777778	89.9671715135135	24.990880975975973	536	18	10	14
5106	Création de 5 étangs	-1004.573111	27.77777777777778	90.0076916936937	25.002136581581585	536	18	9	14
5107	Création de 5 étangs	-951.1350616	27.77777777777778	90.97053943063062	25.26959428628628	536	18	8	14
5108	Création de 20 étangs	-3806.451355	27.77777777777778	39.52339900900901	10.978721946946948	536	18	5	14
5109	Création de 20 étangs	-3979.537383	27.77777777777778	36.404731837837836	10.11242551051051	536	18	6	14
5110	Création de 20 étangs	-3988.532866	27.77777777777778	36.242651063063064	10.067403073073073	536	18	7	14
5111	Création de 20 étangs	-1850.909311	27.77777777777778	74.75839079279281	20.766219664664668	536	18	11	14
5112	Création de 20 étangs	-4027.287926	27.77777777777778	35.544361693693695	9.873433803803804	536	18	10	14
5113	Création de 20 étangs	-4018.292442	27.77777777777778	35.70644248648649	9.918456246246246	536	18	9	14
5114	Création de 20 étangs	-3804.540246	27.77777777777778	39.557833405405404	10.988287057057057	536	18	8	14
5115	Création de 12 étangs	-2283.870813	27.77777777777778	66.95728264864866	18.599245180180183	536	18	5	14
5116	Création de 12 étangs	-2387.72243	27.77777777777778	65.08608234234234	18.079467317317317	536	18	6	14
5117	Création de 12 étangs	-2393.11972	27.77777777777778	64.98883387387387	18.052453853853855	536	18	7	14
5118	Création de 12 étangs	-1110.545587	27.77777777777778	88.0982777117117	24.471743808808807	536	18	11	14
5119	Création de 12 étangs	-2416.372755	27.77777777777778	64.56986027027027	17.936072297297297	536	18	10	14
5120	Création de 12 étangs	-2410.975465	27.77777777777778	64.66710873873875	17.963085760760762	536	18	9	14
5121	Création de 12 étangs	-2282.724148	27.77777777777778	66.97794327927929	18.604984244244246	536	18	8	14
5122	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	5	14
5123	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	6	14
5124	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	7	14
5125	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	11	14
5126	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	10	14
5127	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	9	14
5128	Création de 5 étangs	9	27.77777777777778	25	6.944444444444445	536	2	8	14
5129	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	5	14
5130	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	6	14
5131	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	7	14
5132	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	11	14
5133	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	10	14
5134	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	9	14
5135	Création de 20 étangs	12	27.77777777777778	62.5	17.36111111111111	536	2	8	14
5136	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	5	14
5137	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	6	14
5138	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	7	14
5139	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	11	14
5140	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	10	14
5141	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	9	14
5142	Création de 12 étangs	11	27.77777777777778	50	13.88888888888889	536	2	8	14
5143	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	5	14
5144	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	6	14
5145	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	7	14
5146	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	11	14
5147	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	10	14
5148	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	9	14
5149	Création de 5 étangs	14	14.814814814814813	50	7.4074074074074066	536	12	8	14
5150	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	5	14
5151	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	6	14
5152	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	7	14
5153	Création de 20 étangs	19	14.814814814814813	91.66666666666666	13.580246913580245	536	12	11	14
5154	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	10	14
5155	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	9	14
5156	Création de 20 étangs	20	14.814814814814813	100	14.814814814814813	536	12	8	14
5157	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	5	14
5158	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	6	14
5159	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	7	14
5160	Création de 12 étangs	17	14.814814814814813	75	11.11111111111111	536	12	11	14
5161	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	10	14
5162	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	9	14
5163	Création de 12 étangs	18	14.814814814814813	83.33333333333334	12.345679012345679	536	12	8	14
5164	Création de 5 étangs	18	14.814814814814813	25	3.7037037037037033	536	15	5	14
5165	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	6	14
5166	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	7	14
5167	Création de 5 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	11	14
5168	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	10	14
5169	Création de 5 étangs	17	14.814814814814813	16.666666666666664	2.469135802469135	536	15	9	14
5170	Création de 5 étangs	18	14.814814814814813	25	3.7037037037037033	536	15	8	14
5171	Création de 20 étangs	24	14.814814814814813	75	11.11111111111111	536	15	5	14
5172	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	6	14
5173	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	7	14
5174	Création de 20 étangs	27	14.814814814814813	100	14.814814814814813	536	15	11	14
5175	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	10	14
5176	Création de 20 étangs	23	14.814814814814813	66.66666666666666	9.87654320987654	536	15	9	14
5177	Création de 20 étangs	24	14.814814814814813	75	11.11111111111111	536	15	8	14
5178	Création de 12 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	5	14
5179	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	6	14
5180	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	7	14
5181	Création de 12 étangs	24	14.814814814814813	75	11.11111111111111	536	15	11	14
5182	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	10	14
5183	Création de 12 étangs	20	14.814814814814813	41.66666666666667	6.172839506172839	536	15	9	14
5184	Création de 12 étangs	21	14.814814814814813	50	7.4074074074074066	536	15	8	14
5185	Création de 5 étangs	14445.89141	27.77777777777778	22.754078876190476	6.320577465608466	536	17	5	14
5186	Création de 5 étangs	14325.78624	27.77777777777778	22.525307123809522	6.257029756613756	536	17	6	14
5187	Création de 5 étangs	14325.78624	27.77777777777778	22.525307123809522	6.257029756613756	536	17	7	14
5188	Création de 5 étangs	13672.37676	27.77777777777778	21.280717638095236	5.911310455026455	536	17	11	14
5189	Création de 5 étangs	14563.85358	27.77777777777778	22.978768723809527	6.382991312169313	536	17	10	14
5190	Création de 5 étangs	14563.85358	27.77777777777778	22.978768723809527	6.382991312169313	536	17	9	14
5191	Création de 5 étangs	14693.35946	27.77777777777778	23.22544659047619	6.451512941798942	536	17	8	14
5192	Création de 20 étangs	57783.56564	27.77777777777778	100	27.77777777777778	536	17	5	14
5193	Création de 20 étangs	57303.14498	27.77777777777778	100	27.77777777777778	536	17	6	14
5194	Création de 20 étangs	57303.14498	27.77777777777778	100	27.77777777777778	536	17	7	14
5195	Création de 20 étangs	54689.50705	27.77777777777778	99.40858485714286	27.613495793650795	536	17	11	14
5196	Création de 20 étangs	58255.4143	27.77777777777778	100	27.77777777777778	536	17	10	14
5197	Création de 20 étangs	58255.4143	27.77777777777778	100	27.77777777777778	536	17	9	14
5198	Création de 20 étangs	58773.43785	27.77777777777778	100	27.77777777777778	536	17	8	14
5199	Création de 12 étangs	34670.13939	27.77777777777778	61.27645598095237	17.02123777248677	536	17	5	14
5200	Création de 12 étangs	34381.88699	27.77777777777778	60.72740379047619	16.868723275132275	536	17	6	14
5201	Création de 12 étangs	34381.88699	27.77777777777778	60.72740379047619	16.868723275132275	536	17	7	14
5202	Création de 12 étangs	32813.70423	27.77777777777778	57.74038900952382	16.03899694708995	536	17	11	14
5203	Création de 12 étangs	34953.24858	27.77777777777778	61.81571158095238	17.171030994708996	536	17	10	14
5204	Création de 12 étangs	34953.24858	27.77777777777778	61.81571158095238	17.171030994708996	536	17	9	14
5205	Création de 12 étangs	35264.06271	27.77777777777778	62.4077384952381	17.335482915343917	536	17	8	14
5206	Création de 5 étangs	-951.6128388	27.77777777777778	90.96193083243243	25.26720300900901	536	18	5	14
5207	Création de 5 étangs	-994.8843457	27.77777777777778	90.18226404144144	25.0506289004004	536	18	6	14
5208	Création de 5 étangs	-997.1332166	27.77777777777778	90.14174384504504	25.039373290290293	536	18	7	14
5209	Création de 5 étangs	-462.7273279	27.77777777777778	99.77067877657657	27.71407743793794	536	18	11	14
5210	Création de 5 étangs	-1006.821981	27.77777777777778	89.9671715135135	24.990880975975973	536	18	10	14
5211	Création de 5 étangs	-1004.573111	27.77777777777778	90.0076916936937	25.002136581581585	536	18	9	14
5212	Création de 5 étangs	-951.1350616	27.77777777777778	90.97053943063062	25.26959428628628	536	18	8	14
5213	Création de 20 étangs	-3806.451355	27.77777777777778	39.52339900900901	10.978721946946948	536	18	5	14
5214	Création de 20 étangs	-3979.537383	27.77777777777778	36.404731837837836	10.11242551051051	536	18	6	14
5215	Création de 20 étangs	-3988.532866	27.77777777777778	36.242651063063064	10.067403073073073	536	18	7	14
5216	Création de 20 étangs	-1850.909311	27.77777777777778	74.75839079279281	20.766219664664668	536	18	11	14
5217	Création de 20 étangs	-4027.287926	27.77777777777778	35.544361693693695	9.873433803803804	536	18	10	14
5218	Création de 20 étangs	-4018.292442	27.77777777777778	35.70644248648649	9.918456246246246	536	18	9	14
5219	Création de 20 étangs	-3804.540246	27.77777777777778	39.557833405405404	10.988287057057057	536	18	8	14
5220	Création de 12 étangs	-2283.870813	27.77777777777778	66.95728264864866	18.599245180180183	536	18	5	14
5221	Création de 12 étangs	-2387.72243	27.77777777777778	65.08608234234234	18.079467317317317	536	18	6	14
5222	Création de 12 étangs	-2393.11972	27.77777777777778	64.98883387387387	18.052453853853855	536	18	7	14
5223	Création de 12 étangs	-1110.545587	27.77777777777778	88.0982777117117	24.471743808808807	536	18	11	14
5224	Création de 12 étangs	-2416.372755	27.77777777777778	64.56986027027027	17.936072297297297	536	18	10	14
5225	Création de 12 étangs	-2410.975465	27.77777777777778	64.66710873873875	17.963085760760762	536	18	9	14
5226	Création de 12 étangs	-2282.724148	27.77777777777778	66.97794327927929	18.604984244244246	536	18	8	14
5227	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	5	14
5228	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	6	14
5229	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	7	14
5230	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	11	14
5231	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	10	14
5232	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	9	14
5233	Création de 5 étangs	9	24.59016393442623	25	6.147540983606557	536	2	8	14
5234	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	5	14
5235	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	6	14
5236	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	7	14
5237	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	11	14
5238	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	10	14
5239	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	9	14
5240	Création de 20 étangs	12	24.59016393442623	62.5	15.368852459016393	536	2	8	14
5241	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	5	14
5242	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	6	14
5243	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	7	14
5244	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	11	14
5245	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	10	14
5246	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	9	14
5247	Création de 12 étangs	11	24.59016393442623	50	12.295081967213115	536	2	8	14
5248	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	5	14
5249	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	6	14
5250	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	7	14
5251	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	11	14
5252	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	10	14
5253	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	9	14
5254	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	536	12	8	14
5255	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	5	14
5256	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	6	14
5257	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	7	14
5258	Création de 20 étangs	19	13.114754098360656	91.66666666666666	12.021857923497267	536	12	11	14
5259	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	10	14
5260	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	9	14
5261	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	536	12	8	14
5262	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	5	14
5263	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	6	14
5264	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	7	14
5265	Création de 12 étangs	17	13.114754098360656	75	9.836065573770492	536	12	11	14
5266	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	10	14
5267	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	9	14
5268	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	536	12	8	14
5269	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	536	15	5	14
5270	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	536	15	6	14
5271	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	536	15	7	14
5272	Création de 5 étangs	21	13.114754098360656	50	6.557377049180328	536	15	11	14
5273	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	536	15	10	14
5274	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	536	15	9	14
5275	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	536	15	8	14
5276	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	536	15	5	14
5277	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	536	15	6	14
5278	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	536	15	7	14
5279	Création de 20 étangs	27	13.114754098360656	100	13.114754098360656	536	15	11	14
5280	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	536	15	10	14
5281	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	536	15	9	14
5282	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	536	15	8	14
5283	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	536	15	5	14
5284	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	536	15	6	14
5285	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	536	15	7	14
5286	Création de 12 étangs	24	13.114754098360656	75	9.836065573770492	536	15	11	14
5287	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	536	15	10	14
5288	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	536	15	9	14
5289	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	536	15	8	14
5290	Création de 5 étangs	14445.89141	24.59016393442623	22.754078876190476	5.595265297423888	536	17	5	14
5291	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	536	17	6	14
5292	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	536	17	7	14
5293	Création de 5 étangs	13672.37676	24.59016393442623	21.280717638095236	5.232963353629977	536	17	11	14
5294	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	536	17	10	14
5295	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	536	17	9	14
5296	Création de 5 étangs	14693.35946	24.59016393442623	23.22544659047619	5.711175391100702	536	17	8	14
5297	Création de 20 étangs	57783.56564	24.59016393442623	100	24.59016393442623	536	17	5	14
5298	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	536	17	6	14
5299	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	536	17	7	14
5300	Création de 20 étangs	54689.50705	24.59016393442623	99.40858485714286	24.444733981264633	536	17	11	14
5301	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	536	17	10	14
5302	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	536	17	9	14
5303	Création de 20 étangs	58773.43785	24.59016393442623	100	24.59016393442623	536	17	8	14
5304	Création de 12 étangs	34670.13939	24.59016393442623	61.27645598095237	15.067980978922714	536	17	5	14
5305	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	536	17	6	14
5306	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	536	17	7	14
5307	Création de 12 étangs	32813.70423	24.59016393442623	57.74038900952382	14.198456313817333	536	17	11	14
5308	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	536	17	10	14
5309	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	536	17	9	14
5310	Création de 12 étangs	35264.06271	24.59016393442623	62.4077384952381	15.346165203747073	536	17	8	14
5311	Création de 5 étangs	-951.6128388	24.59016393442623	90.96193083243243	22.36768790961453	536	18	5	14
5312	Création de 5 étangs	-994.8843457	24.59016393442623	90.18226404144144	22.175966567567567	536	18	6	14
5313	Création de 5 étangs	-997.1332166	24.59016393442623	90.14174384504504	22.166002584847142	536	18	7	14
5314	Création de 5 étangs	-462.7273279	24.59016393442623	99.77067877657657	24.533773469649976	536	18	11	14
5315	Création de 5 étangs	-1006.821981	24.59016393442623	89.9671715135135	22.123074962339388	536	18	10	14
5316	Création de 5 étangs	-1004.573111	24.59016393442623	90.0076916936937	22.133038941072222	536	18	9	14
5317	Création de 5 étangs	-951.1350616	24.59016393442623	90.97053943063062	22.369804778023923	536	18	8	14
5318	Création de 20 étangs	-3806.451355	24.59016393442623	39.52339900900901	9.718868608772707	536	18	5	14
5319	Création de 20 étangs	-3979.537383	24.59016393442623	36.404731837837836	8.951983238812582	536	18	6	14
5320	Création de 20 étangs	-3988.532866	24.59016393442623	36.242651063063064	8.912127310589279	536	18	7	14
5321	Création de 20 étangs	-1850.909311	24.59016393442623	74.75839079279281	18.383210850686755	536	18	11	14
5322	Création de 20 étangs	-4027.287926	24.59016393442623	35.544361693693695	8.74041680992468	536	18	10	14
5323	Création de 20 étangs	-4018.292442	24.59016393442623	35.70644248648649	8.780272742578644	536	18	9	14
5324	Création de 20 étangs	-3804.540246	24.59016393442623	39.557833405405404	9.72733608329641	536	18	8	14
5325	Création de 12 étangs	-2283.870813	24.59016393442623	66.95728264864866	16.464905569339834	536	18	5	14
5326	Création de 12 étangs	-2387.72243	24.59016393442623	65.08608234234234	16.00477434647762	536	18	6	14
5327	Création de 12 étangs	-2393.11972	24.59016393442623	64.98883387387387	15.98086078865751	536	18	7	14
5328	Création de 12 étangs	-1110.545587	24.59016393442623	88.0982777117117	21.663510912715992	536	18	11	14
5329	Création de 12 étangs	-2416.372755	24.59016393442623	64.56986027027027	15.87783449268941	536	18	10	14
5330	Création de 12 étangs	-2410.975465	24.59016393442623	64.66710873873875	15.901748050509527	536	18	9	14
5331	Création de 12 étangs	-2282.724148	24.59016393442623	66.97794327927929	16.469986052281794	536	18	8	14
5332	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	5	14
5333	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	6	14
5334	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	7	14
5335	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	11	14
5336	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	10	14
5337	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	9	14
5338	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	8	14
5339	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	5	14
5340	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	6	14
5341	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	7	14
5342	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	11	14
5343	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	10	14
5344	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	9	14
5345	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	8	14
5346	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	5	14
5347	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	6	14
5348	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	7	14
5349	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	11	14
5350	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	10	14
5351	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	9	14
5352	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	8	14
5353	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	5	14
5354	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	6	14
5355	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	7	14
5356	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	11	14
5357	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	10	14
5358	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	9	14
5359	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	8	14
5360	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	5	14
5361	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	6	14
5362	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	7	14
5363	Création de 20 étangs	19	13.114754098360656	91.66666666666666	12.021857923497267	538	12	11	14
5364	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	10	14
5365	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	9	14
5366	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	8	14
5367	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	5	14
5368	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	6	14
5369	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	7	14
5370	Création de 12 étangs	17	13.114754098360656	75	9.836065573770492	538	12	11	14
5371	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	10	14
5372	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	9	14
5373	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	8	14
5374	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	538	15	5	14
5375	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	6	14
5376	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	7	14
5377	Création de 5 étangs	21	13.114754098360656	50	6.557377049180328	538	15	11	14
5378	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	10	14
5379	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	9	14
5380	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	538	15	8	14
5381	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	538	15	5	14
5382	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	6	14
5383	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	7	14
5384	Création de 20 étangs	27	13.114754098360656	100	13.114754098360656	538	15	11	14
5385	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	10	14
5386	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	9	14
5387	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	538	15	8	14
5388	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	538	15	5	14
5389	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	6	14
5390	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	7	14
5391	Création de 12 étangs	24	13.114754098360656	75	9.836065573770492	538	15	11	14
5392	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	10	14
5393	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	9	14
5394	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	538	15	8	14
5395	Création de 5 étangs	14445.89141	24.59016393442623	22.754078876190476	5.595265297423888	538	17	5	14
5396	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	538	17	6	14
5397	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	538	17	7	14
5398	Création de 5 étangs	13672.37676	24.59016393442623	21.280717638095236	5.232963353629977	538	17	11	14
5399	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	538	17	10	14
5400	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	538	17	9	14
5401	Création de 5 étangs	14693.35946	24.59016393442623	23.22544659047619	5.711175391100702	538	17	8	14
5402	Création de 20 étangs	57783.56564	24.59016393442623	100	24.59016393442623	538	17	5	14
5403	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	538	17	6	14
5404	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	538	17	7	14
5405	Création de 20 étangs	54689.50705	24.59016393442623	99.40858485714286	24.444733981264633	538	17	11	14
5406	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	538	17	10	14
5407	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	538	17	9	14
5408	Création de 20 étangs	58773.43785	24.59016393442623	100	24.59016393442623	538	17	8	14
5409	Création de 12 étangs	34670.13939	24.59016393442623	61.27645598095237	15.067980978922714	538	17	5	14
5410	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	538	17	6	14
5411	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	538	17	7	14
5412	Création de 12 étangs	32813.70423	24.59016393442623	57.74038900952382	14.198456313817333	538	17	11	14
5413	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	538	17	10	14
5414	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	538	17	9	14
5415	Création de 12 étangs	35264.06271	24.59016393442623	62.4077384952381	15.346165203747073	538	17	8	14
5416	Création de 5 étangs	-951.6128388	24.59016393442623	90.96193083243243	22.36768790961453	538	18	5	14
5417	Création de 5 étangs	-994.8843457	24.59016393442623	90.18226404144144	22.175966567567567	538	18	6	14
5418	Création de 5 étangs	-997.1332166	24.59016393442623	90.14174384504504	22.166002584847142	538	18	7	14
5419	Création de 5 étangs	-462.7273279	24.59016393442623	99.77067877657657	24.533773469649976	538	18	11	14
5420	Création de 5 étangs	-1006.821981	24.59016393442623	89.9671715135135	22.123074962339388	538	18	10	14
5421	Création de 5 étangs	-1004.573111	24.59016393442623	90.0076916936937	22.133038941072222	538	18	9	14
5422	Création de 5 étangs	-951.1350616	24.59016393442623	90.97053943063062	22.369804778023923	538	18	8	14
5423	Création de 20 étangs	-3806.451355	24.59016393442623	39.52339900900901	9.718868608772707	538	18	5	14
5424	Création de 20 étangs	-3979.537383	24.59016393442623	36.404731837837836	8.951983238812582	538	18	6	14
5425	Création de 20 étangs	-3988.532866	24.59016393442623	36.242651063063064	8.912127310589279	538	18	7	14
5426	Création de 20 étangs	-1850.909311	24.59016393442623	74.75839079279281	18.383210850686755	538	18	11	14
5427	Création de 20 étangs	-4027.287926	24.59016393442623	35.544361693693695	8.74041680992468	538	18	10	14
5428	Création de 20 étangs	-4018.292442	24.59016393442623	35.70644248648649	8.780272742578644	538	18	9	14
5429	Création de 20 étangs	-3804.540246	24.59016393442623	39.557833405405404	9.72733608329641	538	18	8	14
5430	Création de 12 étangs	-2283.870813	24.59016393442623	66.95728264864866	16.464905569339834	538	18	5	14
5431	Création de 12 étangs	-2387.72243	24.59016393442623	65.08608234234234	16.00477434647762	538	18	6	14
5432	Création de 12 étangs	-2393.11972	24.59016393442623	64.98883387387387	15.98086078865751	538	18	7	14
5433	Création de 12 étangs	-1110.545587	24.59016393442623	88.0982777117117	21.663510912715992	538	18	11	14
5434	Création de 12 étangs	-2416.372755	24.59016393442623	64.56986027027027	15.87783449268941	538	18	10	14
5435	Création de 12 étangs	-2410.975465	24.59016393442623	64.66710873873875	15.901748050509527	538	18	9	14
5436	Création de 12 étangs	-2282.724148	24.59016393442623	66.97794327927929	16.469986052281794	538	18	8	14
5437	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	5	14
5438	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	6	14
5439	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	7	14
5440	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	11	14
5441	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	10	14
5442	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	9	14
5443	Création de 5 étangs	9	13.114754098360656	25	3.278688524590164	538	2	8	14
5444	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	5	14
5445	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	6	14
5446	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	7	14
5447	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	11	14
5448	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	10	14
5449	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	9	14
5450	Création de 20 étangs	12	13.114754098360656	62.5	8.19672131147541	538	2	8	14
5451	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	5	14
5452	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	6	14
5453	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	7	14
5454	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	11	14
5455	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	10	14
5456	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	9	14
5457	Création de 12 étangs	11	13.114754098360656	50	6.557377049180328	538	2	8	14
5458	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	5	14
5459	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	6	14
5460	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	7	14
5461	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	11	14
5462	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	10	14
5463	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	9	14
5464	Création de 5 étangs	14	13.114754098360656	50	6.557377049180328	538	12	8	14
5465	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	5	14
5466	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	6	14
5467	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	7	14
5468	Création de 20 étangs	19	13.114754098360656	91.66666666666666	12.021857923497267	538	12	11	14
5469	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	10	14
5470	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	9	14
5471	Création de 20 étangs	20	13.114754098360656	100	13.114754098360656	538	12	8	14
5472	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	5	14
5473	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	6	14
5474	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	7	14
5475	Création de 12 étangs	17	13.114754098360656	75	9.836065573770492	538	12	11	14
5476	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	10	14
5477	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	9	14
5478	Création de 12 étangs	18	13.114754098360656	83.33333333333334	10.928961748633881	538	12	8	14
5479	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	538	15	5	14
5480	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	6	14
5481	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	7	14
5482	Création de 5 étangs	21	13.114754098360656	50	6.557377049180328	538	15	11	14
5483	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	10	14
5484	Création de 5 étangs	17	13.114754098360656	16.666666666666664	2.1857923497267757	538	15	9	14
5485	Création de 5 étangs	18	13.114754098360656	25	3.278688524590164	538	15	8	14
5486	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	538	15	5	14
5487	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	6	14
5488	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	7	14
5489	Création de 20 étangs	27	13.114754098360656	100	13.114754098360656	538	15	11	14
5490	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	10	14
5491	Création de 20 étangs	23	13.114754098360656	66.66666666666666	8.743169398907103	538	15	9	14
5492	Création de 20 étangs	24	13.114754098360656	75	9.836065573770492	538	15	8	14
5493	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	538	15	5	14
5494	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	6	14
5495	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	7	14
5496	Création de 12 étangs	24	13.114754098360656	75	9.836065573770492	538	15	11	14
5497	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	10	14
5498	Création de 12 étangs	20	13.114754098360656	41.66666666666667	5.464480874316941	538	15	9	14
5499	Création de 12 étangs	21	13.114754098360656	50	6.557377049180328	538	15	8	14
5500	Création de 5 étangs	14445.89141	24.59016393442623	22.754078876190476	5.595265297423888	538	17	5	14
5501	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	538	17	6	14
5502	Création de 5 étangs	14325.78624	24.59016393442623	22.525307123809522	5.5390099484777515	538	17	7	14
5503	Création de 5 étangs	13672.37676	24.59016393442623	21.280717638095236	5.232963353629977	538	17	11	14
5504	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	538	17	10	14
5505	Création de 5 étangs	14563.85358	24.59016393442623	22.978768723809527	5.650516899297425	538	17	9	14
5506	Création de 5 étangs	14693.35946	24.59016393442623	23.22544659047619	5.711175391100702	538	17	8	14
5507	Création de 20 étangs	57783.56564	24.59016393442623	100	24.59016393442623	538	17	5	14
5508	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	538	17	6	14
5509	Création de 20 étangs	57303.14498	24.59016393442623	100	24.59016393442623	538	17	7	14
5510	Création de 20 étangs	54689.50705	24.59016393442623	99.40858485714286	24.444733981264633	538	17	11	14
5511	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	538	17	10	14
5512	Création de 20 étangs	58255.4143	24.59016393442623	100	24.59016393442623	538	17	9	14
5513	Création de 20 étangs	58773.43785	24.59016393442623	100	24.59016393442623	538	17	8	14
5514	Création de 12 étangs	34670.13939	24.59016393442623	61.27645598095237	15.067980978922714	538	17	5	14
5515	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	538	17	6	14
5516	Création de 12 étangs	34381.88699	24.59016393442623	60.72740379047619	14.932968145199062	538	17	7	14
5517	Création de 12 étangs	32813.70423	24.59016393442623	57.74038900952382	14.198456313817333	538	17	11	14
5518	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	538	17	10	14
5519	Création de 12 étangs	34953.24858	24.59016393442623	61.81571158095238	15.20058481498829	538	17	9	14
5520	Création de 12 étangs	35264.06271	24.59016393442623	62.4077384952381	15.346165203747073	538	17	8	14
5521	Création de 5 étangs	-951.6128388	24.59016393442623	90.96193083243243	22.36768790961453	538	18	5	14
5522	Création de 5 étangs	-994.8843457	24.59016393442623	90.18226404144144	22.175966567567567	538	18	6	14
5523	Création de 5 étangs	-997.1332166	24.59016393442623	90.14174384504504	22.166002584847142	538	18	7	14
5524	Création de 5 étangs	-462.7273279	24.59016393442623	99.77067877657657	24.533773469649976	538	18	11	14
5525	Création de 5 étangs	-1006.821981	24.59016393442623	89.9671715135135	22.123074962339388	538	18	10	14
5526	Création de 5 étangs	-1004.573111	24.59016393442623	90.0076916936937	22.133038941072222	538	18	9	14
5527	Création de 5 étangs	-951.1350616	24.59016393442623	90.97053943063062	22.369804778023923	538	18	8	14
5528	Création de 20 étangs	-3806.451355	24.59016393442623	39.52339900900901	9.718868608772707	538	18	5	14
5529	Création de 20 étangs	-3979.537383	24.59016393442623	36.404731837837836	8.951983238812582	538	18	6	14
5530	Création de 20 étangs	-3988.532866	24.59016393442623	36.242651063063064	8.912127310589279	538	18	7	14
5531	Création de 20 étangs	-1850.909311	24.59016393442623	74.75839079279281	18.383210850686755	538	18	11	14
5532	Création de 20 étangs	-4027.287926	24.59016393442623	35.544361693693695	8.74041680992468	538	18	10	14
5533	Création de 20 étangs	-4018.292442	24.59016393442623	35.70644248648649	8.780272742578644	538	18	9	14
5534	Création de 20 étangs	-3804.540246	24.59016393442623	39.557833405405404	9.72733608329641	538	18	8	14
5535	Création de 12 étangs	-2283.870813	24.59016393442623	66.95728264864866	16.464905569339834	538	18	5	14
5536	Création de 12 étangs	-2387.72243	24.59016393442623	65.08608234234234	16.00477434647762	538	18	6	14
5537	Création de 12 étangs	-2393.11972	24.59016393442623	64.98883387387387	15.98086078865751	538	18	7	14
5538	Création de 12 étangs	-1110.545587	24.59016393442623	88.0982777117117	21.663510912715992	538	18	11	14
5539	Création de 12 étangs	-2416.372755	24.59016393442623	64.56986027027027	15.87783449268941	538	18	10	14
5540	Création de 12 étangs	-2410.975465	24.59016393442623	64.66710873873875	15.901748050509527	538	18	9	14
5541	Création de 12 étangs	-2282.724148	24.59016393442623	66.97794327927929	16.469986052281794	538	18	8	14
5542	Création de 1 étangs	7	100	0	0	539	2	5	11
5543	Création de 1 étangs	7	100	0	0	539	2	6	11
5544	Création de 1 étangs	7	100	0	0	539	2	7	11
5545	Création de 1 étangs	7	100	0	0	539	2	11	11
5546	Création de 1 étangs	7	100	0	0	539	2	10	11
5547	Création de 1 étangs	7	100	0	0	539	2	9	11
5548	Création de 1 étangs	7	100	0	0	539	2	8	11
5549	Création de 20 étangs	12	100	62.5	62.5	539	2	5	11
5550	Création de 20 étangs	12	100	62.5	62.5	539	2	6	11
5551	Création de 20 étangs	12	100	62.5	62.5	539	2	7	11
5552	Création de 20 étangs	12	100	62.5	62.5	539	2	11	11
5553	Création de 20 étangs	12	100	62.5	62.5	539	2	10	11
5554	Création de 20 étangs	12	100	62.5	62.5	539	2	9	11
5555	Création de 20 étangs	12	100	62.5	62.5	539	2	8	11
5556	Création de 10 étangs	11	100	50	50	539	2	5	11
5557	Création de 10 étangs	11	100	50	50	539	2	6	11
5558	Création de 10 étangs	11	100	50	50	539	2	7	11
5559	Création de 10 étangs	11	100	50	50	539	2	11	11
5560	Création de 10 étangs	11	100	50	50	539	2	10	11
5561	Création de 10 étangs	11	100	50	50	539	2	9	11
5562	Création de 10 étangs	11	100	50	50	539	2	8	11
5563	Création de 5 étangs	9	31.25	25	7.8125	537	2	5	15
5564	Création de 5 étangs	9	31.25	25	7.8125	537	2	6	15
5565	Création de 5 étangs	9	31.25	25	7.8125	537	2	7	15
5566	Création de 5 étangs	9	31.25	25	7.8125	537	2	11	15
5567	Création de 5 étangs	9	31.25	25	7.8125	537	2	10	15
5568	Création de 5 étangs	9	31.25	25	7.8125	537	2	9	15
5569	Création de 5 étangs	9	31.25	25	7.8125	537	2	8	15
5570	Création de 10 étangs	11	31.25	50	15.625	537	2	5	15
5571	Création de 10 étangs	11	31.25	50	15.625	537	2	6	15
5572	Création de 10 étangs	11	31.25	50	15.625	537	2	7	15
5573	Création de 10 étangs	11	31.25	50	15.625	537	2	11	15
5574	Création de 10 étangs	11	31.25	50	15.625	537	2	10	15
5575	Création de 10 étangs	11	31.25	50	15.625	537	2	9	15
5576	Création de 10 étangs	11	31.25	50	15.625	537	2	8	15
5577	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	5	15
5578	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	6	15
5579	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	7	15
5580	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	11	15
5581	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	10	15
5582	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	9	15
5583	Création de 8 étangs	10	31.25	37.5	11.71875	537	2	8	15
5584	Création de 5 étangs	14	28.125	50	14.0625	537	12	5	15
5585	Création de 5 étangs	14	28.125	50	14.0625	537	12	6	15
5586	Création de 5 étangs	14	28.125	50	14.0625	537	12	7	15
5587	Création de 5 étangs	14	28.125	50	14.0625	537	12	11	15
5588	Création de 5 étangs	14	28.125	50	14.0625	537	12	10	15
5589	Création de 5 étangs	14	28.125	50	14.0625	537	12	9	15
5590	Création de 5 étangs	14	28.125	50	14.0625	537	12	8	15
5591	Création de 10 étangs	17	28.125	75	21.09375	537	12	5	15
5592	Création de 10 étangs	17	28.125	75	21.09375	537	12	6	15
5593	Création de 10 étangs	17	28.125	75	21.09375	537	12	7	15
5594	Création de 10 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	11	15
5595	Création de 10 étangs	17	28.125	75	21.09375	537	12	10	15
5596	Création de 10 étangs	17	28.125	75	21.09375	537	12	9	15
5597	Création de 10 étangs	17	28.125	75	21.09375	537	12	8	15
5598	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	5	15
5599	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	6	15
5600	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	7	15
5601	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	11	15
5602	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	10	15
5603	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	9	15
5604	Création de 8 étangs	16	28.125	66.66666666666666	18.749999999999996	537	12	8	15
5605	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	5	14
5606	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	6	14
5607	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	7	14
5608	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	11	14
5609	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	10	14
5610	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	9	14
5611	Création de 5 étangs	9	17.02127659574468	25	4.25531914893617	538	2	8	14
5612	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	5	14
5613	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	6	14
5614	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	7	14
5615	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	11	14
5616	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	10	14
5617	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	9	14
5618	Création de 20 étangs	12	17.02127659574468	62.5	10.638297872340424	538	2	8	14
5619	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	5	14
5620	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	6	14
5621	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	7	14
5622	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	11	14
5623	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	10	14
5624	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	9	14
5625	Création de 12 étangs	11	17.02127659574468	50	8.51063829787234	538	2	8	14
5626	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	5	14
5627	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	6	14
5628	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	7	14
5629	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	11	14
5630	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	10	14
5631	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	9	14
5632	Création de 5 étangs	14	17.02127659574468	50	8.51063829787234	538	12	8	14
5633	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	5	14
5634	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	6	14
5635	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	7	14
5636	Création de 20 étangs	19	17.02127659574468	91.66666666666666	15.602836879432623	538	12	11	14
5637	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	10	14
5638	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	9	14
5639	Création de 20 étangs	20	17.02127659574468	100	17.02127659574468	538	12	8	14
5640	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	5	14
5641	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	6	14
5642	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	7	14
5643	Création de 12 étangs	17	17.02127659574468	75	12.76595744680851	538	12	11	14
5644	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	10	14
5645	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	9	14
5646	Création de 12 étangs	18	17.02127659574468	83.33333333333334	14.184397163120568	538	12	8	14
5647	Création de 5 étangs	18	17.02127659574468	25	4.25531914893617	538	15	5	14
5648	Création de 5 étangs	17	17.02127659574468	16.666666666666664	2.836879432624113	538	15	6	14
5649	Création de 5 étangs	17	17.02127659574468	16.666666666666664	2.836879432624113	538	15	7	14
5650	Création de 5 étangs	21	17.02127659574468	50	8.51063829787234	538	15	11	14
5651	Création de 5 étangs	17	17.02127659574468	16.666666666666664	2.836879432624113	538	15	10	14
5652	Création de 5 étangs	17	17.02127659574468	16.666666666666664	2.836879432624113	538	15	9	14
5653	Création de 5 étangs	18	17.02127659574468	25	4.25531914893617	538	15	8	14
5654	Création de 20 étangs	24	17.02127659574468	75	12.76595744680851	538	15	5	14
5655	Création de 20 étangs	23	17.02127659574468	66.66666666666666	11.347517730496453	538	15	6	14
5656	Création de 20 étangs	23	17.02127659574468	66.66666666666666	11.347517730496453	538	15	7	14
5657	Création de 20 étangs	27	17.02127659574468	100	17.02127659574468	538	15	11	14
5658	Création de 20 étangs	23	17.02127659574468	66.66666666666666	11.347517730496453	538	15	10	14
5659	Création de 20 étangs	23	17.02127659574468	66.66666666666666	11.347517730496453	538	15	9	14
5660	Création de 20 étangs	24	17.02127659574468	75	12.76595744680851	538	15	8	14
5661	Création de 12 étangs	21	17.02127659574468	50	8.51063829787234	538	15	5	14
5662	Création de 12 étangs	20	17.02127659574468	41.66666666666667	7.092198581560284	538	15	6	14
5663	Création de 12 étangs	20	17.02127659574468	41.66666666666667	7.092198581560284	538	15	7	14
5664	Création de 12 étangs	24	17.02127659574468	75	12.76595744680851	538	15	11	14
5665	Création de 12 étangs	20	17.02127659574468	41.66666666666667	7.092198581560284	538	15	10	14
5666	Création de 12 étangs	20	17.02127659574468	41.66666666666667	7.092198581560284	538	15	9	14
5667	Création de 12 étangs	21	17.02127659574468	50	8.51063829787234	538	15	8	14
5668	Création de 5 étangs	14445.89141	31.914893617021278	22.754078876190476	7.261940066869301	538	17	5	14
5669	Création de 5 étangs	14325.78624	31.914893617021278	22.525307123809522	7.188927805471125	538	17	6	14
5670	Création de 5 étangs	14325.78624	31.914893617021278	22.525307123809522	7.188927805471125	538	17	7	14
5671	Création de 5 étangs	13672.37676	31.914893617021278	21.280717638095236	6.791718395136778	538	17	11	14
5672	Création de 5 étangs	14563.85358	31.914893617021278	22.978768723809527	7.333649592705168	538	17	10	14
5673	Création de 5 étangs	14563.85358	31.914893617021278	22.978768723809527	7.333649592705168	538	17	9	14
5674	Création de 5 étangs	14693.35946	31.914893617021278	23.22544659047619	7.41237657142857	538	17	8	14
5675	Création de 20 étangs	57783.56564	31.914893617021278	100	31.91489361702128	538	17	5	14
5676	Création de 20 étangs	57303.14498	31.914893617021278	100	31.91489361702128	538	17	6	14
5677	Création de 20 étangs	57303.14498	31.914893617021278	100	31.91489361702128	538	17	7	14
5678	Création de 20 étangs	54689.50705	31.914893617021278	99.40858485714286	31.72614410334347	538	17	11	14
5679	Création de 20 étangs	58255.4143	31.914893617021278	100	31.91489361702128	538	17	10	14
5680	Création de 20 étangs	58255.4143	31.914893617021278	100	31.91489361702128	538	17	9	14
5681	Création de 20 étangs	58773.43785	31.914893617021278	100	31.91489361702128	538	17	8	14
5682	Création de 12 étangs	34670.13939	31.914893617021278	61.27645598095237	19.55631573860182	538	17	5	14
5683	Création de 12 étangs	34381.88699	31.914893617021278	60.72740379047619	19.38108631610942	538	17	6	14
5684	Création de 12 étangs	34381.88699	31.914893617021278	60.72740379047619	19.38108631610942	538	17	7	14
5685	Création de 12 étangs	32813.70423	31.914893617021278	57.74038900952382	18.42778372644377	538	17	11	14
5686	Création de 12 étangs	34953.24858	31.914893617021278	61.81571158095238	19.728418589665655	538	17	10	14
5687	Création de 12 étangs	34953.24858	31.914893617021278	61.81571158095238	19.728418589665655	538	17	9	14
5688	Création de 12 étangs	35264.06271	31.914893617021278	62.4077384952381	19.917363349544075	538	17	8	14
5689	Création de 5 étangs	-951.6128388	31.914893617021278	90.96193083243243	29.030403457159288	538	18	5	14
5690	Création de 5 étangs	-994.8843457	31.914893617021278	90.18226404144144	28.781573630247273	538	18	6	14
5691	Création de 5 étangs	-997.1332166	31.914893617021278	90.14174384504504	28.76864165267395	538	18	7	14
5692	Création de 5 étangs	-462.7273279	31.914893617021278	99.77067877657657	31.84170599252444	538	18	11	14
5693	Création de 5 étangs	-1006.821981	31.914893617021278	89.9671715135135	28.712927078780908	538	18	10	14
5694	Création de 5 étangs	-1004.573111	31.914893617021278	90.0076916936937	28.72585905117884	538	18	9	14
5695	Création de 5 étangs	-951.1350616	31.914893617021278	90.97053943063062	29.033150882116157	538	18	8	14
5696	Création de 20 étangs	-3806.451355	31.914893617021278	39.52339900900901	12.613850747556068	538	18	5	14
5697	Création de 20 étangs	-3979.537383	31.914893617021278	36.404731837837836	11.618531437607821	538	18	6	14
5698	Création de 20 étangs	-3988.532866	31.914893617021278	36.242651063063064	11.566803530764808	538	18	7	14
5699	Création de 20 étangs	-1850.909311	31.914893617021278	74.75839079279281	23.859060891316854	538	18	11	14
5700	Création de 20 étangs	-4027.287926	31.914893617021278	35.544361693693695	11.343945221391605	538	18	10	14
5701	Création de 20 étangs	-4018.292442	31.914893617021278	35.70644248648649	11.39567313398505	538	18	9	14
5702	Création de 20 étangs	-3804.540246	31.914893617021278	39.557833405405404	12.62484044853364	538	18	8	14
5703	Création de 12 étangs	-2283.870813	31.914893617021278	66.95728264864866	21.369345526164466	538	18	5	14
5704	Création de 12 étangs	-2387.72243	31.914893617021278	65.08608234234234	20.772153939045428	538	18	6	14
5705	Création de 12 étangs	-2393.11972	31.914893617021278	64.98883387387387	20.74111719378953	538	18	7	14
5706	Création de 12 étangs	-1110.545587	31.914893617021278	88.0982777117117	28.116471610120758	538	18	11	14
5707	Création de 12 étangs	-2416.372755	31.914893617021278	64.56986027027027	20.607402213916043	538	18	10	14
5708	Création de 12 étangs	-2410.975465	31.914893617021278	64.66710873873875	20.63843895917194	538	18	9	14
5709	Création de 12 étangs	-2282.724148	31.914893617021278	66.97794327927929	21.375939344450835	538	18	8	14
5710	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	5	12
5711	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	6	12
5712	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	7	12
5713	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	11	12
5714	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	10	12
5715	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	9	12
5716	Création de 2 étangs	11	24.324324324324326	25	6.081081081081082	540	12	8	12
5717	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	5	12
5718	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	6	12
5719	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	7	12
5720	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	11	12
5721	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	10	12
5722	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	9	12
5723	Création de 5 étangs	14	24.324324324324326	50	12.162162162162163	540	12	8	12
5724	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	5	12
5725	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	6	12
5726	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	7	12
5727	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	11	12
5728	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	10	12
5729	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	9	12
5730	Création de 4 étangs	13	24.324324324324326	41.66666666666667	10.135135135135137	540	12	8	12
5731	Création de 2 étangs	5778.356564	32.432432432432435	6.244488693333333	2.025239576216216	540	17	5	12
5732	Création de 2 étangs	5730.314498	32.432432432432435	6.152979996190475	1.9955610798455599	540	17	6	12
5733	Création de 2 étangs	5730.314498	32.432432432432435	6.152979996190475	1.9955610798455599	540	17	7	12
5734	Création de 2 étangs	5468.950705	32.432432432432435	5.6551442	1.8341008216216215	540	17	11	12
5735	Création de 2 étangs	5825.54143	32.432432432432435	6.334364628571429	2.0543885281853282	540	17	10	12
5736	Création de 2 étangs	5825.54143	32.432432432432435	6.334364628571429	2.0543885281853282	540	17	9	12
5737	Création de 2 étangs	5877.343785	32.432432432432435	6.433035780952381	2.0863899830115833	540	17	8	12
5738	Création de 5 étangs	14445.89141	32.432432432432435	22.754078876190476	7.379701257142858	540	17	5	12
5739	Création de 5 étangs	14325.78624	32.432432432432435	22.525307123809522	7.305505013127413	540	17	6	12
5740	Création de 5 étangs	14325.78624	32.432432432432435	22.525307123809522	7.305505013127413	540	17	7	12
5741	Création de 5 étangs	13672.37676	32.432432432432435	21.280717638095236	6.90185436911197	540	17	11	12
5742	Création de 5 étangs	14563.85358	32.432432432432435	22.978768723809527	7.452573640154442	540	17	10	12
5743	Création de 5 étangs	14563.85358	32.432432432432435	22.978768723809527	7.452573640154442	540	17	9	12
5744	Création de 5 étangs	14693.35946	32.432432432432435	23.22544659047619	7.532577272586873	540	17	8	12
5745	Création de 4 étangs	11556.71313	32.432432432432435	17.250882152380953	5.594880698069499	540	17	5	12
5746	Création de 4 étangs	11460.629	32.432432432432435	17.067864761904765	5.535523706563708	540	17	6	12
5747	Création de 4 étangs	11460.629	32.432432432432435	17.067864761904765	5.535523706563708	540	17	7	12
5748	Création de 4 étangs	10937.90141	32.432432432432435	16.072193161904764	5.212603187644788	540	17	11	12
5749	Création de 4 étangs	11651.08286	32.432432432432435	17.43063401904762	5.653178600772202	540	17	10	12
5750	Création de 4 étangs	11651.08286	32.432432432432435	17.43063401904762	5.653178600772202	540	17	9	12
5751	Création de 4 étangs	11754.68757	32.432432432432435	17.627976323809524	5.717181510424711	540	17	8	12
5752	Création de 2 étangs	-380.6451355	43.24324324324324	100	43.24324324324324	540	18	5	12
5753	Création de 2 étangs	-397.9537383	43.24324324324324	100	43.24324324324324	540	18	6	12
5754	Création de 2 étangs	-398.8532866	43.24324324324324	100	43.24324324324324	540	18	7	12
5755	Création de 2 étangs	-185.0909311	43.24324324324324	100	43.24324324324324	540	18	11	12
5756	Création de 2 étangs	-402.7287926	43.24324324324324	100	43.24324324324324	540	18	10	12
5757	Création de 2 étangs	-401.8292442	43.24324324324324	100	43.24324324324324	540	18	9	12
5758	Création de 2 étangs	-380.4540246	43.24324324324324	100	43.24324324324324	540	18	8	12
5759	Création de 5 étangs	-951.6128388	43.24324324324324	90.96193083243243	39.33488900861943	540	18	5	12
5760	Création de 5 étangs	-994.8843457	43.24324324324324	90.18226404144144	38.99773580170441	540	18	6	12
5761	Création de 5 étangs	-997.1332166	43.24324324324324	90.14174384504504	38.98021355461407	540	18	7	12
5762	Création de 5 étangs	-462.7273279	43.24324324324324	99.77067877657657	43.14407730878987	540	18	11	12
5763	Création de 5 étangs	-1006.821981	43.24324324324324	89.9671715135135	38.90472281665449	540	18	10	12
5764	Création de 5 étangs	-1004.573111	43.24324324324324	90.0076916936937	38.92224505673241	540	18	9	12
5765	Création de 5 étangs	-951.1350616	43.24324324324324	90.97053943063062	39.33861164567811	540	18	8	12
5766	Création de 4 étangs	-761.2902711	43.24324324324324	94.3911662864865	40.81780163739957	540	18	5	12
5767	Création de 4 étangs	-795.9074766	43.24324324324324	93.76743285405405	40.54807907202337	540	18	6	12
5768	Création de 4 étangs	-797.7065733	43.24324324324324	93.7350166972973	40.53406127450694	540	18	7	12
5769	Création de 4 étangs	-370.1818623	43.24324324324324	100	43.24324324324324	540	18	11	12
5770	Création de 4 étangs	-805.4575852	43.24324324324324	93.59535882522523	40.47366868117848	540	18	10	12
5771	Création de 4 étangs	-803.6584885	43.24324324324324	93.62777498198199	40.48768647869491	540	18	9	12
5772	Création de 4 étangs	-760.9080493	43.24324324324324	94.39805316576576	40.820779747358166	540	18	8	12
5773	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	5	14
5774	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	6	14
5775	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	7	14
5776	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	11	14
5777	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	10	14
5778	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	9	14
5779	Création de 5 étangs	9	24.242424242424242	25	6.06060606060606	538	2	8	14
5780	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	5	14
5781	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	6	14
5782	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	7	14
5783	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	11	14
5784	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	10	14
5785	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	9	14
5786	Création de 20 étangs	12	24.242424242424242	62.5	15.151515151515152	538	2	8	14
5787	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	5	14
5788	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	6	14
5789	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	7	14
5790	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	11	14
5791	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	10	14
5792	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	9	14
5793	Création de 12 étangs	11	24.242424242424242	50	12.12121212121212	538	2	8	14
5794	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	5	14
5795	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	6	14
5796	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	7	14
5797	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	11	14
5798	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	10	14
5799	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	9	14
5800	Création de 5 étangs	14	24.242424242424242	50	12.12121212121212	538	12	8	14
5801	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	5	14
5802	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	6	14
5803	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	7	14
5804	Création de 20 étangs	19	24.242424242424242	91.66666666666666	22.22222222222222	538	12	11	14
5805	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	10	14
5806	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	9	14
5807	Création de 20 étangs	20	24.242424242424242	100	24.24242424242424	538	12	8	14
5808	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	5	14
5809	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	6	14
5810	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	7	14
5811	Création de 12 étangs	17	24.242424242424242	75	18.181818181818183	538	12	11	14
5812	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	10	14
5813	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	9	14
5814	Création de 12 étangs	18	24.242424242424242	83.33333333333334	20.202020202020204	538	12	8	14
5815	Création de 5 étangs	18	24.242424242424242	25	6.06060606060606	538	15	5	14
5816	Création de 5 étangs	17	24.242424242424242	16.666666666666664	4.04040404040404	538	15	6	14
5817	Création de 5 étangs	17	24.242424242424242	16.666666666666664	4.04040404040404	538	15	7	14
5818	Création de 5 étangs	21	24.242424242424242	50	12.12121212121212	538	15	11	14
5819	Création de 5 étangs	17	24.242424242424242	16.666666666666664	4.04040404040404	538	15	10	14
5820	Création de 5 étangs	17	24.242424242424242	16.666666666666664	4.04040404040404	538	15	9	14
5821	Création de 5 étangs	18	24.242424242424242	25	6.06060606060606	538	15	8	14
5822	Création de 20 étangs	24	24.242424242424242	75	18.181818181818183	538	15	5	14
5823	Création de 20 étangs	23	24.242424242424242	66.66666666666666	16.16161616161616	538	15	6	14
5824	Création de 20 étangs	23	24.242424242424242	66.66666666666666	16.16161616161616	538	15	7	14
5825	Création de 20 étangs	27	24.242424242424242	100	24.24242424242424	538	15	11	14
5826	Création de 20 étangs	23	24.242424242424242	66.66666666666666	16.16161616161616	538	15	10	14
5827	Création de 20 étangs	23	24.242424242424242	66.66666666666666	16.16161616161616	538	15	9	14
5828	Création de 20 étangs	24	24.242424242424242	75	18.181818181818183	538	15	8	14
5829	Création de 12 étangs	21	24.242424242424242	50	12.12121212121212	538	15	5	14
5830	Création de 12 étangs	20	24.242424242424242	41.66666666666667	10.101010101010102	538	15	6	14
5831	Création de 12 étangs	20	24.242424242424242	41.66666666666667	10.101010101010102	538	15	7	14
5832	Création de 12 étangs	24	24.242424242424242	75	18.181818181818183	538	15	11	14
5833	Création de 12 étangs	20	24.242424242424242	41.66666666666667	10.101010101010102	538	15	10	14
5834	Création de 12 étangs	20	24.242424242424242	41.66666666666667	10.101010101010102	538	15	9	14
5835	Création de 12 étangs	21	24.242424242424242	50	12.12121212121212	538	15	8	14
5836	Création de 5 étangs	14445.89141	45.45454545454545	22.754078876190476	10.342763125541126	538	17	5	14
5837	Création de 5 étangs	14325.78624	45.45454545454545	22.525307123809522	10.238775965367964	538	17	6	14
5838	Création de 5 étangs	14325.78624	45.45454545454545	22.525307123809522	10.238775965367964	538	17	7	14
5839	Création de 5 étangs	13672.37676	45.45454545454545	21.280717638095236	9.67305347186147	538	17	11	14
5840	Création de 5 étangs	14563.85358	45.45454545454545	22.978768723809527	10.444894874458875	538	17	10	14
5841	Création de 5 étangs	14563.85358	45.45454545454545	22.978768723809527	10.444894874458875	538	17	9	14
5842	Création de 5 étangs	14693.35946	45.45454545454545	23.22544659047619	10.557021177489176	538	17	8	14
5843	Création de 20 étangs	57783.56564	45.45454545454545	100	45.45454545454545	538	17	5	14
5844	Création de 20 étangs	57303.14498	45.45454545454545	100	45.45454545454545	538	17	6	14
5845	Création de 20 étangs	57303.14498	45.45454545454545	100	45.45454545454545	538	17	7	14
5846	Création de 20 étangs	54689.50705	45.45454545454545	99.40858485714286	45.18572038961039	538	17	11	14
5847	Création de 20 étangs	58255.4143	45.45454545454545	100	45.45454545454545	538	17	10	14
5848	Création de 20 étangs	58255.4143	45.45454545454545	100	45.45454545454545	538	17	9	14
5849	Création de 20 étangs	58773.43785	45.45454545454545	100	45.45454545454545	538	17	8	14
5850	Création de 12 étangs	34670.13939	45.45454545454545	61.27645598095237	27.852934536796532	538	17	5	14
5851	Création de 12 étangs	34381.88699	45.45454545454545	60.72740379047619	27.603365359307357	538	17	6	14
5852	Création de 12 étangs	34381.88699	45.45454545454545	60.72740379047619	27.603365359307357	538	17	7	14
5853	Création de 12 étangs	32813.70423	45.45454545454545	57.74038900952382	26.24563136796537	538	17	11	14
5854	Création de 12 étangs	34953.24858	45.45454545454545	61.81571158095238	28.09805071861472	538	17	10	14
5855	Création de 12 étangs	34953.24858	45.45454545454545	61.81571158095238	28.09805071861472	538	17	9	14
5856	Création de 12 étangs	35264.06271	45.45454545454545	62.4077384952381	28.367153861471863	538	17	8	14
5857	Création de 5 étangs	-951.6128388	45.45454545454545	90.96193083243243	41.3463321965602	538	18	5	14
5858	Création de 5 étangs	-994.8843457	45.45454545454545	90.18226404144144	40.991938200655206	538	18	6	14
5859	Création de 5 étangs	-997.1332166	45.45454545454545	90.14174384504504	40.973519929565924	538	18	7	14
5860	Création de 5 étangs	-462.7273279	45.45454545454545	99.77067877657657	45.35030853480754	538	18	11	14
5861	Création de 5 étangs	-1006.821981	45.45454545454545	89.9671715135135	40.894168869778866	538	18	10	14
5862	Création de 5 étangs	-1004.573111	45.45454545454545	90.0076916936937	40.912587133497134	538	18	9	14
5863	Création de 5 étangs	-951.1350616	45.45454545454545	90.97053943063062	41.35024519574119	538	18	8	14
5864	Création de 20 étangs	-3806.451355	45.45454545454545	39.52339900900901	17.96518136773137	538	18	5	14
5865	Création de 20 étangs	-3979.537383	45.45454545454545	36.404731837837836	16.54760538083538	538	18	6	14
5866	Création de 20 étangs	-3988.532866	45.45454545454545	36.242651063063064	16.473932301392303	538	18	7	14
5867	Création de 20 étangs	-1850.909311	45.45454545454545	74.75839079279281	33.98108672399673	538	18	11	14
5868	Création de 20 étangs	-4027.287926	45.45454545454545	35.544361693693695	16.156528042588043	538	18	10	14
5869	Création de 20 étangs	-4018.292442	45.45454545454545	35.70644248648649	16.23020113022113	538	18	9	14
5870	Création de 20 étangs	-3804.540246	45.45454545454545	39.557833405405404	17.980833366093364	538	18	8	14
5871	Création de 12 étangs	-2283.870813	45.45454545454545	66.95728264864866	30.435128476658477	538	18	5	14
5872	Création de 12 étangs	-2387.72243	45.45454545454545	65.08608234234234	29.584582882882877	538	18	6	14
5873	Création de 12 étangs	-2393.11972	45.45454545454545	64.98883387387387	29.540379033579033	538	18	7	14
5874	Création de 12 étangs	-1110.545587	45.45454545454545	88.0982777117117	40.04467168714168	538	18	11	14
5875	Création de 12 étangs	-2416.372755	45.45454545454545	64.56986027027027	29.349936486486484	538	18	10	14
5876	Création de 12 étangs	-2410.975465	45.45454545454545	64.66710873873875	29.39414033579034	538	18	9	14
5877	Création de 12 étangs	-2282.724148	45.45454545454545	66.97794327927929	30.444519672399675	538	18	8	14
5878	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	5	15
5879	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	6	15
5880	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	7	15
5881	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	11	15
5882	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	10	15
5883	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	9	15
5884	Création de 5 étangs	9	33.81642512077295	25	8.454106280193237	537	2	8	15
5885	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	5	15
5886	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	6	15
5887	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	7	15
5888	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	11	15
5889	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	10	15
5890	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	9	15
5891	Création de 10 étangs	11	33.81642512077295	50	16.908212560386474	537	2	8	15
5892	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	5	15
5893	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	6	15
5894	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	7	15
5895	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	11	15
5896	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	10	15
5897	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	9	15
5898	Création de 8 étangs	10	33.81642512077295	37.5	12.681159420289855	537	2	8	15
5899	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	5	15
5900	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	6	15
5901	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	7	15
5902	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	11	15
5903	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	10	15
5904	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	9	15
5905	Création de 5 étangs	14	30.43478260869565	50	15.217391304347824	537	12	8	15
5906	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	5	15
5907	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	6	15
5908	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	7	15
5909	Création de 10 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	11	15
5910	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	10	15
5911	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	9	15
5912	Création de 10 étangs	17	30.43478260869565	75	22.826086956521735	537	12	8	15
5913	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	5	15
5914	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	6	15
5915	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	7	15
5916	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	11	15
5917	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	10	15
5918	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	9	15
5919	Création de 8 étangs	16	30.43478260869565	66.66666666666666	20.289855072463762	537	12	8	15
5920	Création de 5 étangs	14445.89141	43.961352657004824	22.754078876190476	10.003000858615135	537	17	5	15
5921	Création de 5 étangs	14325.78624	43.961352657004824	22.525307123809522	9.902429701771334	537	17	6	15
5922	Création de 5 étangs	14325.78624	43.961352657004824	22.525307123809522	9.902429701771334	537	17	7	15
5923	Création de 5 étangs	13672.37676	43.961352657004824	21.280717638095236	9.355291328824475	537	17	11	15
5924	Création de 5 étangs	14563.85358	43.961352657004824	22.978768723809527	10.101777554911433	537	17	10	15
5925	Création de 5 étangs	14563.85358	43.961352657004824	22.978768723809527	10.101777554911433	537	17	9	15
5926	Création de 5 étangs	14693.35946	43.961352657004824	23.22544659047619	10.210220481803539	537	17	8	15
5927	Création de 10 étangs	28891.78282	43.961352657004824	50.27006251428572	22.09939946280193	537	17	5	15
5928	Création de 10 étangs	28651.57249	43.961352657004824	49.81251902857143	21.89825715748792	537	17	6	15
5929	Création de 10 étangs	28651.57249	43.961352657004824	49.81251902857143	21.89825715748792	537	17	7	15
5930	Création de 10 étangs	27344.75353	43.961352657004824	47.32334005714286	20.803980411594196	537	17	11	15
5931	Création de 10 étangs	29127.70715	43.961352657004824	50.71944219047618	22.296952847020926	537	17	10	15
5932	Création de 10 étangs	29127.70715	43.961352657004824	50.71944219047618	22.296952847020926	537	17	9	15
5933	Création de 10 étangs	29386.71893	43.961352657004824	51.212797961904755	22.513838717552332	537	17	8	15
5934	Création de 8 étangs	23113.42626	43.961352657004824	39.263669066666665	17.260840024476646	537	17	5	15
5935	Création de 8 étangs	22921.25799	43.961352657004824	38.897634266666664	17.099926175201286	537	17	6	15
5936	Création de 8 étangs	22921.25799	43.961352657004824	38.897634266666664	17.099926175201286	537	17	7	15
5937	Création de 8 étangs	21875.80282	43.961352657004824	36.90629108571429	16.224504776811592	537	17	11	15
5938	Création de 8 étangs	23302.16572	43.961352657004824	39.6231728	17.418882728502414	537	17	10	15
5939	Création de 8 étangs	23302.16572	43.961352657004824	39.6231728	17.418882728502414	537	17	9	15
5940	Création de 8 étangs	23509.37514	43.961352657004824	40.01785740952381	17.5923914215781	537	17	8	15
5941	Création de 5 étangs	-951.6128388	20.289855072463766	90.96193083243243	18.456043937015274	537	18	5	15
5942	Création de 5 étangs	-994.8843457	20.289855072463766	90.18226404144144	18.297850675075075	537	18	6	15
5943	Création de 5 étangs	-997.1332166	20.289855072463766	90.14174384504504	18.289629185951167	537	18	7	15
5944	Création de 5 étangs	-462.7273279	20.289855072463766	99.77067877657657	20.24332612858075	537	18	11	15
5945	Création de 5 étangs	-1006.821981	20.289855072463766	89.9671715135135	18.254208712886797	537	18	10	15
5946	Création de 5 étangs	-1004.573111	20.289855072463766	90.0076916936937	18.26243019872046	537	18	9	15
5947	Création de 5 étangs	-951.1350616	20.289855072463766	90.97053943063062	18.45779060911346	537	18	8	15
5948	Création de 10 étangs	-1903.225678	20.289855072463766	73.81575354954956	14.977109415850633	537	18	5	15
5949	Création de 10 étangs	-1989.768691	20.289855072463766	72.25641998198198	14.660722894894894	537	18	6	15
5950	Création de 10 étangs	-1994.266433	20.289855072463766	72.17537958558559	14.644279915915915	537	18	7	15
5951	Création de 10 étangs	-925.4546557	20.289855072463766	91.43324944684684	18.551673800809503	537	18	11	15
5952	Création de 10 étangs	-2013.643963	20.289855072463766	71.8262349009009	14.57343896540018	537	18	10	15
5953	Création de 10 étangs	-2009.146221	20.289855072463766	71.9072752972973	14.58988194437916	537	18	9	15
5954	Création de 10 étangs	-1902.270123	20.289855072463766	73.83297075675675	14.9806027622405	537	18	8	15
5955	Création de 8 étangs	-1522.580542	20.289855072463766	80.67422446846847	16.368683225486354	537	18	5	15
5956	Création de 8 étangs	-1591.814953	20.289855072463766	79.4267576036036	16.115574006528266	537	18	6	15
5957	Création de 8 étangs	-1595.413147	20.289855072463766	79.36192527927928	16.10241962188275	537	18	7	15
5958	Création de 8 étangs	-740.3637246	20.289855072463766	94.76822117837838	19.228334731844885	537	18	11	15
5959	Création de 8 étangs	-1610.91517	20.289855072463766	79.08260954954955	16.04574686512599	537	18	10	15
5960	Création de 8 étangs	-1607.316977	20.289855072463766	79.14744185585585	16.058901246115678	537	18	9	15
5961	Création de 8 étangs	-1521.816099	20.289855072463766	80.68799821621622	16.37147789894242	537	18	8	15
5962	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5963	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5964	Création de 1 étangs	7	12.5	0	0	541	2	7	11
5965	Création de 1 étangs	7	12.5	0	0	541	2	11	11
5966	Création de 1 étangs	7	12.5	0	0	541	2	10	11
5967	Création de 1 étangs	7	12.5	0	0	541	2	9	11
5968	Création de 1 étangs	7	12.5	0	0	541	2	8	11
5969	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5970	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5971	Création de 1 étangs	7	12.5	0	0	541	2	7	11
5972	Création de 1 étangs	7	12.5	0	0	541	2	11	11
5973	Création de 1 étangs	7	12.5	0	0	541	2	10	11
5974	Création de 1 étangs	7	12.5	0	0	541	2	9	11
5975	Création de 1 étangs	7	12.5	0	0	541	2	8	11
5976	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5977	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5978	Création de 1 étangs	7	12.5	0	0	541	2	7	11
5979	Création de 1 étangs	7	12.5	0	0	541	2	11	11
5980	Création de 1 étangs	7	12.5	0	0	541	2	10	11
5981	Création de 1 étangs	7	12.5	0	0	541	2	9	11
5982	Création de 1 étangs	7	12.5	0	0	541	2	8	11
5983	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5984	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5985	Création de 1 étangs	7	12.5	0	0	541	2	7	11
5986	Création de 1 étangs	7	12.5	0	0	541	2	11	11
5987	Création de 1 étangs	7	12.5	0	0	541	2	10	11
5988	Création de 1 étangs	7	12.5	0	0	541	2	9	11
5989	Création de 1 étangs	7	12.5	0	0	541	2	8	11
5990	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5991	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5992	Création de 1 étangs	7	12.5	0	0	541	2	7	11
5993	Création de 1 étangs	7	12.5	0	0	541	2	11	11
5994	Création de 1 étangs	7	12.5	0	0	541	2	10	11
5995	Création de 1 étangs	7	12.5	0	0	541	2	9	11
5996	Création de 1 étangs	7	12.5	0	0	541	2	8	11
5997	Création de 1 étangs	7	12.5	0	0	541	2	5	11
5998	Création de 1 étangs	7	12.5	0	0	541	2	6	11
5999	Création de 1 étangs	7	12.5	0	0	541	2	7	11
6000	Création de 1 étangs	7	12.5	0	0	541	2	11	11
6001	Création de 1 étangs	7	12.5	0	0	541	2	10	11
6002	Création de 1 étangs	7	12.5	0	0	541	2	9	11
6003	Création de 1 étangs	7	12.5	0	0	541	2	8	11
6004	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	5	11
6005	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	6	11
6006	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	7	11
6007	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	11	11
6008	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	10	11
6009	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	9	11
6010	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	8	11
6011	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	5	11
6012	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	6	11
6013	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	7	11
6014	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	11	11
6015	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	10	11
6016	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	9	11
6017	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	8	11
6018	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	5	11
6019	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	6	11
6020	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	7	11
6021	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	11	11
6022	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	10	11
6023	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	9	11
6024	Création de 1 étangs	9	93.75	8.333333333333332	7.812499999999999	541	12	8	11
6025	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	5	15
6026	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	6	15
6027	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	7	15
6028	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	11	15
6029	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	10	15
6030	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	9	15
6031	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	8	15
6032	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	5	15
6033	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	6	15
6034	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	7	15
6035	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	11	15
6036	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	10	15
6037	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	9	15
6038	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	8	15
6039	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	5	15
6040	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	6	15
6041	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	7	15
6042	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	11	15
6043	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	10	15
6044	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	9	15
6045	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	8	15
6046	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	5	15
6047	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	6	15
6048	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	7	15
6049	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	11	15
6050	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	10	15
6051	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	9	15
6052	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	8	15
6053	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	5	15
6054	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	6	15
6055	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	7	15
6056	Création de 10 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6057	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	10	15
6058	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	9	15
6059	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	8	15
6060	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	5	15
6061	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	6	15
6062	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	7	15
6063	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6064	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	10	15
6065	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	9	15
6066	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	8	15
6067	Création de 5 étangs	14445.89141	44.44444444444444	22.754078876190476	10.112923944973545	543	17	5	15
6068	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	6	15
6069	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	7	15
6070	Création de 5 étangs	13672.37676	44.44444444444444	21.280717638095236	9.458096728042328	543	17	11	15
6071	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	10	15
6072	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	9	15
6073	Création de 5 étangs	14693.35946	44.44444444444444	23.22544659047619	10.322420706878306	543	17	8	15
6074	Création de 10 étangs	28891.78282	44.44444444444444	50.27006251428572	22.342250006349207	543	17	5	15
6075	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	6	15
6076	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	7	15
6077	Création de 10 étangs	27344.75353	44.44444444444444	47.32334005714286	21.03259558095238	543	17	11	15
6078	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	10	15
6079	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	9	15
6080	Création de 10 étangs	29386.71893	44.44444444444444	51.212797961904755	22.761243538624335	543	17	8	15
6081	Création de 8 étangs	23113.42626	44.44444444444444	39.263669066666665	17.450519585185184	543	17	5	15
6082	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	6	15
6083	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	7	15
6084	Création de 8 étangs	21875.80282	44.44444444444444	36.90629108571429	16.40279603809524	543	17	11	15
6085	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	10	15
6086	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	9	15
6087	Création de 8 étangs	23509.37514	44.44444444444444	40.01785740952381	17.785714404232806	543	17	8	15
6088	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	5	15
6089	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	6	15
6090	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	7	15
6091	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	11	15
6092	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	10	15
6093	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	9	15
6094	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	8	15
6095	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	5	15
6096	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	6	15
6097	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	7	15
6098	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	11	15
6099	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	10	15
6100	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	9	15
6101	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	8	15
6102	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	5	15
6103	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	6	15
6104	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	7	15
6105	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	11	15
6106	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	10	15
6107	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	9	15
6108	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	8	15
6109	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	5	15
6110	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	6	15
6111	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	7	15
6112	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	11	15
6113	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	10	15
6114	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	9	15
6115	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	8	15
6116	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	5	15
6117	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	6	15
6118	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	7	15
6119	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	11	15
6120	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	10	15
6121	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	9	15
6122	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	8	15
6123	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	5	15
6124	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	6	15
6125	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	7	15
6126	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	11	15
6127	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	10	15
6128	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	9	15
6129	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	8	15
6130	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	5	15
6131	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	6	15
6132	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	7	15
6133	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	11	15
6134	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	10	15
6135	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	9	15
6136	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	8	15
6137	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	5	15
6138	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	6	15
6139	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	7	15
6140	Création de 10 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6141	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	10	15
6142	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	9	15
6143	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	8	15
6144	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	5	15
6145	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	6	15
6146	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	7	15
6147	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6148	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	10	15
6149	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	9	15
6150	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	8	15
6151	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	5	15
6152	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	6	15
6153	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	7	15
6154	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	11	15
6155	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	10	15
6156	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	9	15
6157	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	8	15
6158	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	5	15
6159	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	6	15
6160	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	7	15
6161	Création de 20 étangs	19	31.746031746031743	91.66666666666666	29.100529100529094	543	12	11	15
6162	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	10	15
6163	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	9	15
6164	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	8	15
6165	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	5	15
6166	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	6	15
6167	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	7	15
6168	Création de 12 étangs	17	31.746031746031743	75	23.809523809523807	543	12	11	15
6169	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	10	15
6170	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	9	15
6171	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	8	15
6172	Création de 5 étangs	14445.89141	44.44444444444444	22.754078876190476	10.112923944973545	543	17	5	15
6173	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	6	15
6174	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	7	15
6175	Création de 5 étangs	13672.37676	44.44444444444444	21.280717638095236	9.458096728042328	543	17	11	15
6176	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	10	15
6177	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	9	15
6178	Création de 5 étangs	14693.35946	44.44444444444444	23.22544659047619	10.322420706878306	543	17	8	15
6179	Création de 10 étangs	28891.78282	44.44444444444444	50.27006251428572	22.342250006349207	543	17	5	15
6180	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	6	15
6181	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	7	15
6182	Création de 10 étangs	27344.75353	44.44444444444444	47.32334005714286	21.03259558095238	543	17	11	15
6183	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	10	15
6184	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	9	15
6185	Création de 10 étangs	29386.71893	44.44444444444444	51.212797961904755	22.761243538624335	543	17	8	15
6186	Création de 8 étangs	23113.42626	44.44444444444444	39.263669066666665	17.450519585185184	543	17	5	15
6187	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	6	15
6188	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	7	15
6189	Création de 8 étangs	21875.80282	44.44444444444444	36.90629108571429	16.40279603809524	543	17	11	15
6190	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	10	15
6191	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	9	15
6192	Création de 8 étangs	23509.37514	44.44444444444444	40.01785740952381	17.785714404232806	543	17	8	15
6193	Création de 5 étangs	14445.89141	44.44444444444444	22.754078876190476	10.112923944973545	543	17	5	15
6194	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	6	15
6195	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	7	15
6196	Création de 5 étangs	13672.37676	44.44444444444444	21.280717638095236	9.458096728042328	543	17	11	15
6197	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	10	15
6198	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	9	15
6199	Création de 5 étangs	14693.35946	44.44444444444444	23.22544659047619	10.322420706878306	543	17	8	15
6200	Création de 20 étangs	57783.56564	44.44444444444444	100	44.44444444444444	543	17	5	15
6201	Création de 20 étangs	57303.14498	44.44444444444444	100	44.44444444444444	543	17	6	15
6202	Création de 20 étangs	57303.14498	44.44444444444444	100	44.44444444444444	543	17	7	15
6203	Création de 20 étangs	54689.50705	44.44444444444444	99.40858485714286	44.18159326984127	543	17	11	15
6204	Création de 20 étangs	58255.4143	44.44444444444444	100	44.44444444444444	543	17	10	15
6205	Création de 20 étangs	58255.4143	44.44444444444444	100	44.44444444444444	543	17	9	15
6206	Création de 20 étangs	58773.43785	44.44444444444444	100	44.44444444444444	543	17	8	15
6207	Création de 12 étangs	34670.13939	44.44444444444444	61.27645598095237	27.23398043597883	543	17	5	15
6208	Création de 12 étangs	34381.88699	44.44444444444444	60.72740379047619	26.989957240211638	543	17	6	15
6209	Création de 12 étangs	34381.88699	44.44444444444444	60.72740379047619	26.989957240211638	543	17	7	15
6210	Création de 12 étangs	32813.70423	44.44444444444444	57.74038900952382	25.662395115343916	543	17	11	15
6211	Création de 12 étangs	34953.24858	44.44444444444444	61.81571158095238	27.47364959153439	543	17	10	15
6212	Création de 12 étangs	34953.24858	44.44444444444444	61.81571158095238	27.47364959153439	543	17	9	15
6213	Création de 12 étangs	35264.06271	44.44444444444444	62.4077384952381	27.736772664550266	543	17	8	15
6214	Création de 1 étangs	7	50	0	0	544	2	5	14
6215	Création de 1 étangs	7	50	0	0	544	2	6	14
6216	Création de 1 étangs	7	50	0	0	544	2	7	14
6217	Création de 1 étangs	7	50	0	0	544	2	11	14
6218	Création de 1 étangs	7	50	0	0	544	2	10	14
6219	Création de 1 étangs	7	50	0	0	544	2	9	14
6220	Création de 1 étangs	7	50	0	0	544	2	8	14
6221	Création de 20 étangs	12	50	62.5	31.25	544	2	5	14
6222	Création de 20 étangs	12	50	62.5	31.25	544	2	6	14
6223	Création de 20 étangs	12	50	62.5	31.25	544	2	7	14
6224	Création de 20 étangs	12	50	62.5	31.25	544	2	11	14
6225	Création de 20 étangs	12	50	62.5	31.25	544	2	10	14
6226	Création de 20 étangs	12	50	62.5	31.25	544	2	9	14
6227	Création de 20 étangs	12	50	62.5	31.25	544	2	8	14
6228	Création de 10 étangs	11	50	50	25	544	2	5	14
6229	Création de 10 étangs	11	50	50	25	544	2	6	14
6230	Création de 10 étangs	11	50	50	25	544	2	7	14
6231	Création de 10 étangs	11	50	50	25	544	2	11	14
6232	Création de 10 étangs	11	50	50	25	544	2	10	14
6233	Création de 10 étangs	11	50	50	25	544	2	9	14
6234	Création de 10 étangs	11	50	50	25	544	2	8	14
6235	Création de 1 étangs	2889.178282	50	0.7412919657142855	0.37064598285714273	544	17	5	14
6236	Création de 1 étangs	2865.157249	50	0.6955376171428569	0.34776880857142844	544	17	6	14
6237	Création de 1 étangs	2865.157249	50	0.6955376171428569	0.34776880857142844	544	17	7	14
6238	Création de 1 étangs	2734.475353	50	0.44661971999999966	0.2233098599999998	544	17	11	14
6239	Création de 1 étangs	2912.770715	50	0.7862299333333335	0.3931149666666667	544	17	10	14
6240	Création de 1 étangs	2912.770715	50	0.7862299333333335	0.3931149666666667	544	17	9	14
6241	Création de 1 étangs	2938.671893	50	0.8355655104761908	0.4177827552380954	544	17	8	14
6242	Création de 20 étangs	57783.56564	50	100	50	544	17	5	14
6243	Création de 20 étangs	57303.14498	50	100	50	544	17	6	14
6244	Création de 20 étangs	57303.14498	50	100	50	544	17	7	14
6245	Création de 20 étangs	54689.50705	50	99.40858485714286	49.70429242857143	544	17	11	14
6246	Création de 20 étangs	58255.4143	50	100	50	544	17	10	14
6247	Création de 20 étangs	58255.4143	50	100	50	544	17	9	14
6248	Création de 20 étangs	58773.43785	50	100	50	544	17	8	14
6249	Création de 10 étangs	28891.78282	50	50.27006251428572	25.13503125714286	544	17	5	14
6250	Création de 10 étangs	28651.57249	50	49.81251902857143	24.906259514285715	544	17	6	14
6251	Création de 10 étangs	28651.57249	50	49.81251902857143	24.906259514285715	544	17	7	14
6252	Création de 10 étangs	27344.75353	50	47.32334005714286	23.66167002857143	544	17	11	14
6253	Création de 10 étangs	29127.70715	50	50.71944219047618	25.359721095238093	544	17	10	14
6254	Création de 10 étangs	29127.70715	50	50.71944219047618	25.359721095238093	544	17	9	14
6255	Création de 10 étangs	29386.71893	50	51.212797961904755	25.606398980952378	544	17	8	14
6256	Création de 1 étangs	7	46.875	0	0	544	2	5	14
6257	Création de 1 étangs	7	46.875	0	0	544	2	6	14
6258	Création de 1 étangs	7	46.875	0	0	544	2	7	14
6259	Création de 1 étangs	7	46.875	0	0	544	2	11	14
6260	Création de 1 étangs	7	46.875	0	0	544	2	10	14
6261	Création de 1 étangs	7	46.875	0	0	544	2	9	14
6262	Création de 1 étangs	7	46.875	0	0	544	2	8	14
6263	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	5	14
6264	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	6	14
6265	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	7	14
6266	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	11	14
6267	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	10	14
6268	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	9	14
6269	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	8	14
6270	Création de 10 étangs	11	46.875	50	23.4375	544	2	5	14
6271	Création de 10 étangs	11	46.875	50	23.4375	544	2	6	14
6272	Création de 10 étangs	11	46.875	50	23.4375	544	2	7	14
6273	Création de 10 étangs	11	46.875	50	23.4375	544	2	11	14
6274	Création de 10 étangs	11	46.875	50	23.4375	544	2	10	14
6275	Création de 10 étangs	11	46.875	50	23.4375	544	2	9	14
6276	Création de 10 étangs	11	46.875	50	23.4375	544	2	8	14
6277	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	5	14
6278	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	6	14
6279	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	7	14
6280	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	11	14
6281	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	10	14
6282	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	9	14
6283	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	8	14
6284	Création de 20 étangs	20	25	100	25	544	12	5	14
6285	Création de 20 étangs	20	25	100	25	544	12	6	14
6286	Création de 20 étangs	20	25	100	25	544	12	7	14
6287	Création de 20 étangs	19	25	91.66666666666666	22.916666666666664	544	12	11	14
6288	Création de 20 étangs	20	25	100	25	544	12	10	14
6289	Création de 20 étangs	20	25	100	25	544	12	9	14
6290	Création de 20 étangs	20	25	100	25	544	12	8	14
6291	Création de 10 étangs	17	25	75	18.75	544	12	5	14
6292	Création de 10 étangs	17	25	75	18.75	544	12	6	14
6293	Création de 10 étangs	17	25	75	18.75	544	12	7	14
6294	Création de 10 étangs	16	25	66.66666666666666	16.666666666666664	544	12	11	14
6295	Création de 10 étangs	17	25	75	18.75	544	12	10	14
6296	Création de 10 étangs	17	25	75	18.75	544	12	9	14
6297	Création de 10 étangs	17	25	75	18.75	544	12	8	14
6298	Création de 1 étangs	2889.178282	46.875	0.7412919657142855	0.34748060892857136	544	17	5	14
6299	Création de 1 étangs	2865.157249	46.875	0.6955376171428569	0.32603325803571415	544	17	6	14
6300	Création de 1 étangs	2865.157249	46.875	0.6955376171428569	0.32603325803571415	544	17	7	14
6301	Création de 1 étangs	2734.475353	46.875	0.44661971999999966	0.20935299374999985	544	17	11	14
6302	Création de 1 étangs	2912.770715	46.875	0.7862299333333335	0.3685452812500001	544	17	10	14
6303	Création de 1 étangs	2912.770715	46.875	0.7862299333333335	0.3685452812500001	544	17	9	14
6304	Création de 1 étangs	2938.671893	46.875	0.8355655104761908	0.3916713330357144	544	17	8	14
6305	Création de 20 étangs	57783.56564	46.875	100	46.875	544	17	5	14
6306	Création de 20 étangs	57303.14498	46.875	100	46.875	544	17	6	14
6307	Création de 20 étangs	57303.14498	46.875	100	46.875	544	17	7	14
6308	Création de 20 étangs	54689.50705	46.875	99.40858485714286	46.597774151785714	544	17	11	14
6309	Création de 20 étangs	58255.4143	46.875	100	46.875	544	17	10	14
6310	Création de 20 étangs	58255.4143	46.875	100	46.875	544	17	9	14
6311	Création de 20 étangs	58773.43785	46.875	100	46.875	544	17	8	14
6312	Création de 10 étangs	28891.78282	46.875	50.27006251428572	23.564091803571433	544	17	5	14
6313	Création de 10 étangs	28651.57249	46.875	49.81251902857143	23.34961829464286	544	17	6	14
6314	Création de 10 étangs	28651.57249	46.875	49.81251902857143	23.34961829464286	544	17	7	14
6315	Création de 10 étangs	27344.75353	46.875	47.32334005714286	22.182815651785713	544	17	11	14
6316	Création de 10 étangs	29127.70715	46.875	50.71944219047618	23.774738526785708	544	17	10	14
6317	Création de 10 étangs	29127.70715	46.875	50.71944219047618	23.774738526785708	544	17	9	14
6318	Création de 10 étangs	29386.71893	46.875	51.212797961904755	24.005999044642852	544	17	8	14
6319	Création de 1 étangs	-190.3225678	25	100	25	544	18	5	14
6320	Création de 1 étangs	-198.9768691	25	100	25	544	18	6	14
6321	Création de 1 étangs	-199.4266433	25	100	25	544	18	7	14
6322	Création de 1 étangs	-92.54546557	25	100	25	544	18	11	14
6323	Création de 1 étangs	-201.3643963	25	100	25	544	18	10	14
6324	Création de 1 étangs	-200.9146221	25	100	25	544	18	9	14
6325	Création de 1 étangs	-190.2270123	25	100	25	544	18	8	14
6326	Création de 20 étangs	-3806.451355	25	39.52339900900901	9.880849752252253	544	18	5	14
6327	Création de 20 étangs	-3979.537383	25	36.404731837837836	9.101182959459459	544	18	6	14
6328	Création de 20 étangs	-3988.532866	25	36.242651063063064	9.060662765765766	544	18	7	14
6329	Création de 20 étangs	-1850.909311	25	74.75839079279281	18.689597698198202	544	18	11	14
6330	Création de 20 étangs	-4027.287926	25	35.544361693693695	8.886090423423424	544	18	10	14
6331	Création de 20 étangs	-4018.292442	25	35.70644248648649	8.926610621621622	544	18	9	14
6332	Création de 20 étangs	-3804.540246	25	39.557833405405404	9.889458351351351	544	18	8	14
6333	Création de 10 étangs	-1903.225678	25	73.81575354954956	18.45393838738739	544	18	5	14
6334	Création de 10 étangs	-1989.768691	25	72.25641998198198	18.064104995495494	544	18	6	14
6335	Création de 10 étangs	-1994.266433	25	72.17537958558559	18.043844896396397	544	18	7	14
6336	Création de 10 étangs	-925.4546557	25	91.43324944684684	22.85831236171171	544	18	11	14
6337	Création de 10 étangs	-2013.643963	25	71.8262349009009	17.956558725225225	544	18	10	14
6338	Création de 10 étangs	-2009.146221	25	71.9072752972973	17.976818824324326	544	18	9	14
6339	Création de 10 étangs	-1902.270123	25	73.83297075675675	18.458242689189188	544	18	8	14
6340	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	5	15
6341	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	6	15
6342	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	7	15
6343	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	11	15
6344	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	10	15
6345	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	9	15
6346	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	8	15
6347	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	5	15
6348	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	6	15
6349	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	7	15
6350	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	11	15
6351	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	10	15
6352	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	9	15
6353	Création de 10 étangs	11	23.809523809523807	50	11.904761904761903	543	2	8	15
6354	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	5	15
6355	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	6	15
6356	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	7	15
6357	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	11	15
6358	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	10	15
6359	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	9	15
6360	Création de 8 étangs	10	23.809523809523807	37.5	8.928571428571427	543	2	8	15
6361	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	5	15
6362	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	6	15
6363	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	7	15
6364	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	11	15
6365	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	10	15
6366	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	9	15
6367	Création de 5 étangs	9	23.809523809523807	25	5.952380952380952	543	2	8	15
6368	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	5	15
6369	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	6	15
6370	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	7	15
6371	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	11	15
6372	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	10	15
6373	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	9	15
6374	Création de 20 étangs	12	23.809523809523807	62.5	14.880952380952378	543	2	8	15
6375	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	5	15
6376	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	6	15
6377	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	7	15
6378	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	11	15
6379	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	10	15
6380	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	9	15
6381	Création de 12 étangs	11	23.809523809523807	50	11.904761904761903	543	2	8	15
6382	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	5	15
6383	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	6	15
6384	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	7	15
6385	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	11	15
6386	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	10	15
6387	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	9	15
6388	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	8	15
6389	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	5	15
6390	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	6	15
6391	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	7	15
6392	Création de 10 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6393	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	10	15
6394	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	9	15
6395	Création de 10 étangs	17	31.746031746031743	75	23.809523809523807	543	12	8	15
6396	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	5	15
6397	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	6	15
6398	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	7	15
6399	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	11	15
6400	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	10	15
6401	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	9	15
6402	Création de 8 étangs	16	31.746031746031743	66.66666666666666	21.16402116402116	543	12	8	15
6403	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	5	15
6404	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	6	15
6405	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	7	15
6406	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	11	15
6407	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	10	15
6408	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	9	15
6409	Création de 5 étangs	14	31.746031746031743	50	15.873015873015872	543	12	8	15
6410	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	5	15
6411	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	6	15
6412	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	7	15
6413	Création de 20 étangs	19	31.746031746031743	91.66666666666666	29.100529100529094	543	12	11	15
6414	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	10	15
6415	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	9	15
6416	Création de 20 étangs	20	31.746031746031743	100	31.746031746031743	543	12	8	15
6417	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	5	15
6418	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	6	15
6419	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	7	15
6420	Création de 12 étangs	17	31.746031746031743	75	23.809523809523807	543	12	11	15
6421	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	10	15
6422	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	9	15
6423	Création de 12 étangs	18	31.746031746031743	83.33333333333334	26.455026455026456	543	12	8	15
6424	Création de 5 étangs	14445.89141	44.44444444444444	22.754078876190476	10.112923944973545	543	17	5	15
6425	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	6	15
6426	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	7	15
6427	Création de 5 étangs	13672.37676	44.44444444444444	21.280717638095236	9.458096728042328	543	17	11	15
6428	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	10	15
6429	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	9	15
6430	Création de 5 étangs	14693.35946	44.44444444444444	23.22544659047619	10.322420706878306	543	17	8	15
6431	Création de 10 étangs	28891.78282	44.44444444444444	50.27006251428572	22.342250006349207	543	17	5	15
6432	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	6	15
6433	Création de 10 étangs	28651.57249	44.44444444444444	49.81251902857143	22.138897346031744	543	17	7	15
6434	Création de 10 étangs	27344.75353	44.44444444444444	47.32334005714286	21.03259558095238	543	17	11	15
6435	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	10	15
6436	Création de 10 étangs	29127.70715	44.44444444444444	50.71944219047618	22.541974306878302	543	17	9	15
6437	Création de 10 étangs	29386.71893	44.44444444444444	51.212797961904755	22.761243538624335	543	17	8	15
6438	Création de 8 étangs	23113.42626	44.44444444444444	39.263669066666665	17.450519585185184	543	17	5	15
6439	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	6	15
6440	Création de 8 étangs	22921.25799	44.44444444444444	38.897634266666664	17.28783745185185	543	17	7	15
6441	Création de 8 étangs	21875.80282	44.44444444444444	36.90629108571429	16.40279603809524	543	17	11	15
6442	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	10	15
6443	Création de 8 étangs	23302.16572	44.44444444444444	39.6231728	17.61029902222222	543	17	9	15
6444	Création de 8 étangs	23509.37514	44.44444444444444	40.01785740952381	17.785714404232806	543	17	8	15
6445	Création de 5 étangs	14445.89141	44.44444444444444	22.754078876190476	10.112923944973545	543	17	5	15
6446	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	6	15
6447	Création de 5 étangs	14325.78624	44.44444444444444	22.525307123809522	10.01124761058201	543	17	7	15
6448	Création de 5 étangs	13672.37676	44.44444444444444	21.280717638095236	9.458096728042328	543	17	11	15
6449	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	10	15
6450	Création de 5 étangs	14563.85358	44.44444444444444	22.978768723809527	10.2127860994709	543	17	9	15
6451	Création de 5 étangs	14693.35946	44.44444444444444	23.22544659047619	10.322420706878306	543	17	8	15
6452	Création de 20 étangs	57783.56564	44.44444444444444	100	44.44444444444444	543	17	5	15
6453	Création de 20 étangs	57303.14498	44.44444444444444	100	44.44444444444444	543	17	6	15
6454	Création de 20 étangs	57303.14498	44.44444444444444	100	44.44444444444444	543	17	7	15
6455	Création de 20 étangs	54689.50705	44.44444444444444	99.40858485714286	44.18159326984127	543	17	11	15
6456	Création de 20 étangs	58255.4143	44.44444444444444	100	44.44444444444444	543	17	10	15
6457	Création de 20 étangs	58255.4143	44.44444444444444	100	44.44444444444444	543	17	9	15
6458	Création de 20 étangs	58773.43785	44.44444444444444	100	44.44444444444444	543	17	8	15
6459	Création de 12 étangs	34670.13939	44.44444444444444	61.27645598095237	27.23398043597883	543	17	5	15
6460	Création de 12 étangs	34381.88699	44.44444444444444	60.72740379047619	26.989957240211638	543	17	6	15
6461	Création de 12 étangs	34381.88699	44.44444444444444	60.72740379047619	26.989957240211638	543	17	7	15
6462	Création de 12 étangs	32813.70423	44.44444444444444	57.74038900952382	25.662395115343916	543	17	11	15
6463	Création de 12 étangs	34953.24858	44.44444444444444	61.81571158095238	27.47364959153439	543	17	10	15
6464	Création de 12 étangs	34953.24858	44.44444444444444	61.81571158095238	27.47364959153439	543	17	9	15
6465	Création de 12 étangs	35264.06271	44.44444444444444	62.4077384952381	27.736772664550266	543	17	8	15
6466	Création de 1 étangs	7	46.875	0	0	544	2	5	14
6467	Création de 1 étangs	7	46.875	0	0	544	2	6	14
6468	Création de 1 étangs	7	46.875	0	0	544	2	7	14
6469	Création de 1 étangs	7	46.875	0	0	544	2	11	14
6470	Création de 1 étangs	7	46.875	0	0	544	2	10	14
6471	Création de 1 étangs	7	46.875	0	0	544	2	9	14
6472	Création de 1 étangs	7	46.875	0	0	544	2	8	14
6473	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	5	14
6474	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	6	14
6475	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	7	14
6476	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	11	14
6477	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	10	14
6478	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	9	14
6479	Création de 20 étangs	12	46.875	62.5	29.296875	544	2	8	14
6480	Création de 10 étangs	11	46.875	50	23.4375	544	2	5	14
6481	Création de 10 étangs	11	46.875	50	23.4375	544	2	6	14
6482	Création de 10 étangs	11	46.875	50	23.4375	544	2	7	14
6483	Création de 10 étangs	11	46.875	50	23.4375	544	2	11	14
6484	Création de 10 étangs	11	46.875	50	23.4375	544	2	10	14
6485	Création de 10 étangs	11	46.875	50	23.4375	544	2	9	14
6486	Création de 10 étangs	11	46.875	50	23.4375	544	2	8	14
6487	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	5	14
6488	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	6	14
6489	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	7	14
6490	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	11	14
6491	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	10	14
6492	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	9	14
6493	Création de 1 étangs	9	25	8.333333333333332	2.083333333333333	544	12	8	14
6494	Création de 20 étangs	20	25	100	25	544	12	5	14
6495	Création de 20 étangs	20	25	100	25	544	12	6	14
6496	Création de 20 étangs	20	25	100	25	544	12	7	14
6497	Création de 20 étangs	19	25	91.66666666666666	22.916666666666664	544	12	11	14
6498	Création de 20 étangs	20	25	100	25	544	12	10	14
6499	Création de 20 étangs	20	25	100	25	544	12	9	14
6500	Création de 20 étangs	20	25	100	25	544	12	8	14
6501	Création de 10 étangs	17	25	75	18.75	544	12	5	14
6502	Création de 10 étangs	17	25	75	18.75	544	12	6	14
6503	Création de 10 étangs	17	25	75	18.75	544	12	7	14
6504	Création de 10 étangs	16	25	66.66666666666666	16.666666666666664	544	12	11	14
6505	Création de 10 étangs	17	25	75	18.75	544	12	10	14
6506	Création de 10 étangs	17	25	75	18.75	544	12	9	14
6507	Création de 10 étangs	17	25	75	18.75	544	12	8	14
6508	Création de 1 étangs	2889.178282	46.875	0.7412919657142855	0.34748060892857136	544	17	5	14
6509	Création de 1 étangs	2865.157249	46.875	0.6955376171428569	0.32603325803571415	544	17	6	14
6510	Création de 1 étangs	2865.157249	46.875	0.6955376171428569	0.32603325803571415	544	17	7	14
6511	Création de 1 étangs	2734.475353	46.875	0.44661971999999966	0.20935299374999985	544	17	11	14
6512	Création de 1 étangs	2912.770715	46.875	0.7862299333333335	0.3685452812500001	544	17	10	14
6513	Création de 1 étangs	2912.770715	46.875	0.7862299333333335	0.3685452812500001	544	17	9	14
6514	Création de 1 étangs	2938.671893	46.875	0.8355655104761908	0.3916713330357144	544	17	8	14
6515	Création de 20 étangs	57783.56564	46.875	100	46.875	544	17	5	14
6516	Création de 20 étangs	57303.14498	46.875	100	46.875	544	17	6	14
6517	Création de 20 étangs	57303.14498	46.875	100	46.875	544	17	7	14
6518	Création de 20 étangs	54689.50705	46.875	99.40858485714286	46.597774151785714	544	17	11	14
6519	Création de 20 étangs	58255.4143	46.875	100	46.875	544	17	10	14
6520	Création de 20 étangs	58255.4143	46.875	100	46.875	544	17	9	14
6521	Création de 20 étangs	58773.43785	46.875	100	46.875	544	17	8	14
6522	Création de 10 étangs	28891.78282	46.875	50.27006251428572	23.564091803571433	544	17	5	14
6523	Création de 10 étangs	28651.57249	46.875	49.81251902857143	23.34961829464286	544	17	6	14
6524	Création de 10 étangs	28651.57249	46.875	49.81251902857143	23.34961829464286	544	17	7	14
6525	Création de 10 étangs	27344.75353	46.875	47.32334005714286	22.182815651785713	544	17	11	14
6526	Création de 10 étangs	29127.70715	46.875	50.71944219047618	23.774738526785708	544	17	10	14
6527	Création de 10 étangs	29127.70715	46.875	50.71944219047618	23.774738526785708	544	17	9	14
6528	Création de 10 étangs	29386.71893	46.875	51.212797961904755	24.005999044642852	544	17	8	14
6529	Création de 1 étangs	-190.3225678	25	100	25	544	18	5	14
6530	Création de 1 étangs	-198.9768691	25	100	25	544	18	6	14
6531	Création de 1 étangs	-199.4266433	25	100	25	544	18	7	14
6532	Création de 1 étangs	-92.54546557	25	100	25	544	18	11	14
6533	Création de 1 étangs	-201.3643963	25	100	25	544	18	10	14
6534	Création de 1 étangs	-200.9146221	25	100	25	544	18	9	14
6535	Création de 1 étangs	-190.2270123	25	100	25	544	18	8	14
6536	Création de 20 étangs	-3806.451355	25	39.52339900900901	9.880849752252253	544	18	5	14
6537	Création de 20 étangs	-3979.537383	25	36.404731837837836	9.101182959459459	544	18	6	14
6538	Création de 20 étangs	-3988.532866	25	36.242651063063064	9.060662765765766	544	18	7	14
6539	Création de 20 étangs	-1850.909311	25	74.75839079279281	18.689597698198202	544	18	11	14
6540	Création de 20 étangs	-4027.287926	25	35.544361693693695	8.886090423423424	544	18	10	14
6541	Création de 20 étangs	-4018.292442	25	35.70644248648649	8.926610621621622	544	18	9	14
6542	Création de 20 étangs	-3804.540246	25	39.557833405405404	9.889458351351351	544	18	8	14
6543	Création de 10 étangs	-1903.225678	25	73.81575354954956	18.45393838738739	544	18	5	14
6544	Création de 10 étangs	-1989.768691	25	72.25641998198198	18.064104995495494	544	18	6	14
6545	Création de 10 étangs	-1994.266433	25	72.17537958558559	18.043844896396397	544	18	7	14
6546	Création de 10 étangs	-925.4546557	25	91.43324944684684	22.85831236171171	544	18	11	14
6547	Création de 10 étangs	-2013.643963	25	71.8262349009009	17.956558725225225	544	18	10	14
6548	Création de 10 étangs	-2009.146221	25	71.9072752972973	17.976818824324326	544	18	9	14
6549	Création de 10 étangs	-1902.270123	25	73.83297075675675	18.458242689189188	544	18	8	14
6550	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	5	15
6551	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	6	15
6552	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	7	15
6553	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	11	15
6554	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	10	15
6555	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	9	15
6556	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	8	15
6557	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	5	15
6558	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	6	15
6559	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	7	15
6560	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	11	15
6561	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	10	15
6562	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	9	15
6563	Création de 10 étangs	11	22.388059701492537	50	11.194029850746269	543	2	8	15
6564	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	5	15
6565	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	6	15
6566	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	7	15
6567	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	11	15
6568	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	10	15
6569	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	9	15
6570	Création de 8 étangs	10	22.388059701492537	37.5	8.395522388059701	543	2	8	15
6571	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	5	15
6572	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	6	15
6573	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	7	15
6574	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	11	15
6575	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	10	15
6576	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	9	15
6577	Création de 5 étangs	9	22.388059701492537	25	5.597014925373134	543	2	8	15
6578	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	5	15
6579	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	6	15
6580	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	7	15
6581	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	11	15
6582	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	10	15
6583	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	9	15
6584	Création de 20 étangs	12	22.388059701492537	62.5	13.992537313432836	543	2	8	15
6585	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	5	15
6586	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	6	15
6587	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	7	15
6588	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	11	15
6589	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	10	15
6590	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	9	15
6591	Création de 12 étangs	11	22.388059701492537	50	11.194029850746269	543	2	8	15
6592	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	5	15
6593	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	6	15
6594	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	7	15
6595	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	11	15
6596	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	10	15
6597	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	9	15
6598	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	8	15
6599	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	5	15
6600	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	6	15
6601	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	7	15
6602	Création de 10 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	11	15
6603	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	10	15
6604	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	9	15
6605	Création de 10 étangs	17	29.850746268656714	75	22.388059701492534	543	12	8	15
6606	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	5	15
6607	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	6	15
6608	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	7	15
6609	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	11	15
6610	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	10	15
6611	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	9	15
6612	Création de 8 étangs	16	29.850746268656714	66.66666666666666	19.90049751243781	543	12	8	15
6613	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	5	15
6614	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	6	15
6615	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	7	15
6616	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	11	15
6617	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	10	15
6618	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	9	15
6619	Création de 5 étangs	14	29.850746268656714	50	14.925373134328357	543	12	8	15
6620	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	5	15
6621	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	6	15
6622	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	7	15
6623	Création de 20 étangs	19	29.850746268656714	91.66666666666666	27.363184079601982	543	12	11	15
6624	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	10	15
6625	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	9	15
6626	Création de 20 étangs	20	29.850746268656714	100	29.850746268656714	543	12	8	15
6627	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	5	15
6628	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	6	15
6629	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	7	15
6630	Création de 12 étangs	17	29.850746268656714	75	22.388059701492534	543	12	11	15
6631	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	10	15
6632	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	9	15
6633	Création de 12 étangs	18	29.850746268656714	83.33333333333334	24.875621890547265	543	12	8	15
6634	Création de 5 étangs	14445.89141	41.7910447761194	22.754078876190476	9.509167291542287	543	17	5	15
6635	Création de 5 étangs	14325.78624	41.7910447761194	22.525307123809522	9.41356118606965	543	17	6	15
6636	Création de 5 étangs	14325.78624	41.7910447761194	22.525307123809522	9.41356118606965	543	17	7	15
6637	Création de 5 étangs	13672.37676	41.7910447761194	21.280717638095236	8.893434236815919	543	17	11	15
6638	Création de 5 étangs	14563.85358	41.7910447761194	22.978768723809527	9.603067526368159	543	17	10	15
6639	Création de 5 étangs	14563.85358	41.7910447761194	22.978768723809527	9.603067526368159	543	17	9	15
6640	Création de 5 étangs	14693.35946	41.7910447761194	23.22544659047619	9.7061567840796	543	17	8	15
6641	Création de 10 étangs	28891.78282	41.7910447761194	50.27006251428572	21.00838433432836	543	17	5	15
6642	Création de 10 étangs	28651.57249	41.7910447761194	49.81251902857143	20.81717213134328	543	17	6	15
6643	Création de 10 étangs	28651.57249	41.7910447761194	49.81251902857143	20.81717213134328	543	17	7	15
6644	Création de 10 étangs	27344.75353	41.7910447761194	47.32334005714286	19.77691823283582	543	17	11	15
6645	Création de 10 étangs	29127.70715	41.7910447761194	50.71944219047618	21.196184796019892	543	17	10	15
6646	Création de 10 étangs	29127.70715	41.7910447761194	50.71944219047618	21.196184796019892	543	17	9	15
6647	Création de 10 étangs	29386.71893	41.7910447761194	51.212797961904755	21.402363327363176	543	17	8	15
6648	Création de 8 étangs	23113.42626	41.7910447761194	39.263669066666665	16.408697520398007	543	17	5	15
6649	Création de 8 étangs	22921.25799	41.7910447761194	38.897634266666664	16.255727753233828	543	17	6	15
6650	Création de 8 étangs	22921.25799	41.7910447761194	38.897634266666664	16.255727753233828	543	17	7	15
6651	Création de 8 étangs	21875.80282	41.7910447761194	36.90629108571429	15.42352463283582	543	17	11	15
6652	Création de 8 étangs	23302.16572	41.7910447761194	39.6231728	16.55893788656716	543	17	10	15
6653	Création de 8 étangs	23302.16572	41.7910447761194	39.6231728	16.55893788656716	543	17	9	15
6654	Création de 8 étangs	23509.37514	41.7910447761194	40.01785740952381	16.723880708457713	543	17	8	15
6655	Création de 5 étangs	14445.89141	41.7910447761194	22.754078876190476	9.509167291542287	543	17	5	15
6656	Création de 5 étangs	14325.78624	41.7910447761194	22.525307123809522	9.41356118606965	543	17	6	15
6657	Création de 5 étangs	14325.78624	41.7910447761194	22.525307123809522	9.41356118606965	543	17	7	15
6658	Création de 5 étangs	13672.37676	41.7910447761194	21.280717638095236	8.893434236815919	543	17	11	15
6659	Création de 5 étangs	14563.85358	41.7910447761194	22.978768723809527	9.603067526368159	543	17	10	15
6660	Création de 5 étangs	14563.85358	41.7910447761194	22.978768723809527	9.603067526368159	543	17	9	15
6661	Création de 5 étangs	14693.35946	41.7910447761194	23.22544659047619	9.7061567840796	543	17	8	15
6662	Création de 20 étangs	57783.56564	41.7910447761194	100	41.7910447761194	543	17	5	15
6663	Création de 20 étangs	57303.14498	41.7910447761194	100	41.7910447761194	543	17	6	15
6664	Création de 20 étangs	57303.14498	41.7910447761194	100	41.7910447761194	543	17	7	15
6665	Création de 20 étangs	54689.50705	41.7910447761194	99.40858485714286	41.54388620895522	543	17	11	15
6666	Création de 20 étangs	58255.4143	41.7910447761194	100	41.7910447761194	543	17	10	15
6667	Création de 20 étangs	58255.4143	41.7910447761194	100	41.7910447761194	543	17	9	15
6668	Création de 20 étangs	58773.43785	41.7910447761194	100	41.7910447761194	543	17	8	15
6669	Création de 12 étangs	34670.13939	41.7910447761194	61.27645598095237	25.608071156218898	543	17	5	15
6670	Création de 12 étangs	34381.88699	41.7910447761194	60.72740379047619	25.37861650945273	543	17	6	15
6671	Création de 12 étangs	34381.88699	41.7910447761194	60.72740379047619	25.37861650945273	543	17	7	15
6672	Création de 12 étangs	32813.70423	41.7910447761194	57.74038900952382	24.13031182487562	543	17	11	15
6673	Création de 12 étangs	34953.24858	41.7910447761194	61.81571158095238	25.833431705472634	543	17	10	15
6674	Création de 12 étangs	34953.24858	41.7910447761194	61.81571158095238	25.833431705472634	543	17	9	15
6675	Création de 12 étangs	35264.06271	41.7910447761194	62.4077384952381	26.080845938308457	543	17	8	15
6676	Création de 1 étangs	7	22.330097087378636	0	0	545	2	5	11
6677	Création de 1 étangs	7	22.330097087378636	0	0	545	2	6	11
6678	Création de 1 étangs	7	22.330097087378636	0	0	545	2	7	11
6679	Création de 1 étangs	7	22.330097087378636	0	0	545	2	11	11
6680	Création de 1 étangs	7	22.330097087378636	0	0	545	2	10	11
6681	Création de 1 étangs	7	22.330097087378636	0	0	545	2	9	11
6682	Création de 1 étangs	7	22.330097087378636	0	0	545	2	8	11
6683	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	5	11
6684	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	6	11
6685	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	7	11
6686	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	11	11
6687	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	10	11
6688	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	9	11
6689	Création de 15 étangs	11	22.330097087378636	50	11.165048543689318	545	2	8	11
6690	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	5	11
6691	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	6	11
6692	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	7	11
6693	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	11	11
6694	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	10	11
6695	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	9	11
6696	Création de 8 étangs	10	22.330097087378636	37.5	8.373786407766989	545	2	8	11
6697	Création de 1 étangs	12	14.563106796116504	0	0	545	15	5	11
6698	Création de 1 étangs	12	14.563106796116504	0	0	545	15	6	11
6699	Création de 1 étangs	11	14.563106796116504	0	0	545	15	7	11
6700	Création de 1 étangs	15	14.563106796116504	0	0	545	15	11	11
6701	Création de 1 étangs	11	14.563106796116504	0	0	545	15	10	11
6702	Création de 1 étangs	11	14.563106796116504	0	0	545	15	9	11
6703	Création de 1 étangs	12	14.563106796116504	0	0	545	15	8	11
6704	Création de 15 étangs	23	14.563106796116504	66.66666666666666	9.70873786407767	545	15	5	11
6705	Création de 15 étangs	22	14.563106796116504	58.333333333333336	8.495145631067961	545	15	6	11
6706	Création de 15 étangs	22	14.563106796116504	58.333333333333336	8.495145631067961	545	15	7	11
6707	Création de 15 étangs	26	14.563106796116504	91.66666666666666	13.349514563106792	545	15	11	11
6708	Création de 15 étangs	22	14.563106796116504	58.333333333333336	8.495145631067961	545	15	10	11
6709	Création de 15 étangs	22	14.563106796116504	58.333333333333336	8.495145631067961	545	15	9	11
6710	Création de 15 étangs	23	14.563106796116504	66.66666666666666	9.70873786407767	545	15	8	11
6711	Création de 8 étangs	20	14.563106796116504	41.66666666666667	6.067961165048543	545	15	5	11
6712	Création de 8 étangs	19	14.563106796116504	33.33333333333333	4.854368932038835	545	15	6	11
6713	Création de 8 étangs	19	14.563106796116504	33.33333333333333	4.854368932038835	545	15	7	11
6714	Création de 8 étangs	23	14.563106796116504	66.66666666666666	9.70873786407767	545	15	11	11
6715	Création de 8 étangs	19	14.563106796116504	33.33333333333333	4.854368932038835	545	15	10	11
6716	Création de 8 étangs	19	14.563106796116504	33.33333333333333	4.854368932038835	545	15	9	11
6717	Création de 8 étangs	20	14.563106796116504	41.66666666666667	6.067961165048543	545	15	8	11
6718	Création de 1 étangs	-190.3225678	63.106796116504846	100	63.106796116504846	545	18	5	11
6719	Création de 1 étangs	-198.9768691	63.106796116504846	100	63.106796116504846	545	18	6	11
6720	Création de 1 étangs	-199.4266433	63.106796116504846	100	63.106796116504846	545	18	7	11
6721	Création de 1 étangs	-92.54546557	63.106796116504846	100	63.106796116504846	545	18	11	11
6722	Création de 1 étangs	-201.3643963	63.106796116504846	100	63.106796116504846	545	18	10	11
6723	Création de 1 étangs	-200.9146221	63.106796116504846	100	63.106796116504846	545	18	9	11
6724	Création de 1 étangs	-190.2270123	63.106796116504846	100	63.106796116504846	545	18	8	11
6725	Création de 15 étangs	-2854.838516	63.106796116504846	56.66957628828829	35.762353968337266	545	18	5	11
6726	Création de 15 étangs	-2984.653037	63.106796116504846	54.3305759099099	34.28628576838974	545	18	6	11
6727	Création de 15 étangs	-2991.39965	63.106796116504846	54.20901531531533	34.20957277180093	545	18	7	11
6728	Création de 15 étangs	-1388.181984	63.106796116504846	83.09582010810811	52.43910977696142	545	18	11	11
6729	Création de 15 étangs	-3020.465944	63.106796116504846	53.68529830630631	33.87907174669815	545	18	10	11
6730	Création de 15 étangs	-3013.719332	63.106796116504846	53.80685888288288	33.955784731916374	545	18	9	11
6731	Création de 15 étangs	-2853.405185	63.106796116504846	56.69540207207206	35.77865179305518	545	18	8	11
6732	Création de 8 étangs	-1522.580542	63.106796116504846	80.67422446846847	50.910918353887865	545	18	5	11
6733	Création de 8 étangs	-1591.814953	63.106796116504846	79.4267576036036	50.12368198285663	545	18	6	11
6734	Création de 8 étangs	-1595.413147	63.106796116504846	79.36192527927928	50.08276838012769	545	18	7	11
6735	Création de 8 étangs	-740.3637246	63.106796116504846	94.76822117837838	59.80518812227761	545	18	11	11
6736	Création de 8 étangs	-1610.91517	63.106796116504846	79.08260954954955	49.90650117204582	545	18	10	11
6737	Création de 8 étangs	-1607.316977	63.106796116504846	79.14744185585585	49.94741476340417	545	18	9	11
6738	Création de 8 étangs	-1521.816099	63.106796116504846	80.68799821621622	50.91961052479664	545	18	8	11
6739	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	5	15
6740	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	6	15
6741	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	7	15
6742	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	11	15
6743	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	10	15
6744	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	9	15
6745	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	8	15
6746	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	5	15
6747	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	6	15
6748	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	7	15
6749	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	11	15
6750	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	10	15
6751	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	9	15
6752	Création de 10 étangs	11	15.789473684210526	50	7.894736842105263	543	2	8	15
6753	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	5	15
6754	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	6	15
6755	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	7	15
6756	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	11	15
6757	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	10	15
6758	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	9	15
6759	Création de 8 étangs	10	15.789473684210526	37.5	5.921052631578947	543	2	8	15
6760	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	5	15
6761	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	6	15
6762	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	7	15
6763	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	11	15
6764	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	10	15
6765	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	9	15
6766	Création de 5 étangs	9	15.789473684210526	25	3.9473684210526314	543	2	8	15
6767	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	5	15
6768	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	6	15
6769	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	7	15
6770	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	11	15
6771	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	10	15
6772	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	9	15
6773	Création de 20 étangs	12	15.789473684210526	62.5	9.868421052631579	543	2	8	15
6774	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	5	15
6775	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	6	15
6776	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	7	15
6777	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	11	15
6778	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	10	15
6779	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	9	15
6780	Création de 12 étangs	11	15.789473684210526	50	7.894736842105263	543	2	8	15
6781	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	5	15
6782	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	6	15
6783	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	7	15
6784	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	11	15
6785	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	10	15
6786	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	9	15
6787	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	8	15
6788	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	5	15
6789	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	6	15
6790	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	7	15
6791	Création de 10 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	11	15
6792	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	10	15
6793	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	9	15
6794	Création de 10 étangs	17	21.052631578947366	75	15.789473684210526	543	12	8	15
6795	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	5	15
6796	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	6	15
6797	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	7	15
6798	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	11	15
6799	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	10	15
6800	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	9	15
6801	Création de 8 étangs	16	21.052631578947366	66.66666666666666	14.035087719298241	543	12	8	15
6802	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	5	15
6803	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	6	15
6804	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	7	15
6805	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	11	15
6806	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	10	15
6807	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	9	15
6808	Création de 5 étangs	14	21.052631578947366	50	10.526315789473683	543	12	8	15
6809	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	5	15
6810	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	6	15
6811	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	7	15
6812	Création de 20 étangs	19	21.052631578947366	91.66666666666666	19.298245614035082	543	12	11	15
6813	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	10	15
6814	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	9	15
6815	Création de 20 étangs	20	21.052631578947366	100	21.052631578947366	543	12	8	15
6816	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	5	15
6817	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	6	15
6818	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	7	15
6819	Création de 12 étangs	17	21.052631578947366	75	15.789473684210526	543	12	11	15
6820	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	10	15
6821	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	9	15
6822	Création de 12 étangs	18	21.052631578947366	83.33333333333334	17.54385964912281	543	12	8	15
6823	Création de 5 étangs	14445.89141	29.47368421052631	22.754078876190476	6.706465352982455	543	17	5	15
6824	Création de 5 étangs	14325.78624	29.47368421052631	22.525307123809522	6.639037889122806	543	17	6	15
6825	Création de 5 étangs	14325.78624	29.47368421052631	22.525307123809522	6.639037889122806	543	17	7	15
6826	Création de 5 étangs	13672.37676	29.47368421052631	21.280717638095236	6.272211514385964	543	17	11	15
6827	Création de 5 étangs	14563.85358	29.47368421052631	22.978768723809527	6.772689729122806	543	17	10	15
6828	Création de 5 étangs	14563.85358	29.47368421052631	22.978768723809527	6.772689729122806	543	17	9	15
6829	Création de 5 étangs	14693.35946	29.47368421052631	23.22544659047619	6.845394784561401	543	17	8	15
6830	Création de 10 étangs	28891.78282	29.47368421052631	50.27006251428572	14.816439477894738	543	17	5	15
6831	Création de 10 étangs	28651.57249	29.47368421052631	49.81251902857143	14.681584555789472	543	17	6	15
6832	Création de 10 étangs	28651.57249	29.47368421052631	49.81251902857143	14.681584555789472	543	17	7	15
6833	Création de 10 étangs	27344.75353	29.47368421052631	47.32334005714286	13.947931806315786	543	17	11	15
6834	Création de 10 étangs	29127.70715	29.47368421052631	50.71944219047618	14.948888224561399	543	17	10	15
6835	Création de 10 étangs	29127.70715	29.47368421052631	50.71944219047618	14.948888224561399	543	17	9	15
6836	Création de 10 étangs	29386.71893	29.47368421052631	51.212797961904755	15.094298346666662	543	17	8	15
6837	Création de 8 étangs	23113.42626	29.47368421052631	39.263669066666665	11.572449830175437	543	17	5	15
6838	Création de 8 étangs	22921.25799	29.47368421052631	38.897634266666664	11.464565889122804	543	17	6	15
6839	Création de 8 étangs	22921.25799	29.47368421052631	38.897634266666664	11.464565889122804	543	17	7	15
6840	Création de 8 étangs	21875.80282	29.47368421052631	36.90629108571429	10.87764368842105	543	17	11	15
6841	Création de 8 étangs	23302.16572	29.47368421052631	39.6231728	11.678408825263157	543	17	10	15
6842	Création de 8 étangs	23302.16572	29.47368421052631	39.6231728	11.678408825263157	543	17	9	15
6843	Création de 8 étangs	23509.37514	29.47368421052631	40.01785740952381	11.794736920701753	543	17	8	15
6844	Création de 5 étangs	14445.89141	29.47368421052631	22.754078876190476	6.706465352982455	543	17	5	15
6845	Création de 5 étangs	14325.78624	29.47368421052631	22.525307123809522	6.639037889122806	543	17	6	15
6846	Création de 5 étangs	14325.78624	29.47368421052631	22.525307123809522	6.639037889122806	543	17	7	15
6847	Création de 5 étangs	13672.37676	29.47368421052631	21.280717638095236	6.272211514385964	543	17	11	15
6848	Création de 5 étangs	14563.85358	29.47368421052631	22.978768723809527	6.772689729122806	543	17	10	15
6849	Création de 5 étangs	14563.85358	29.47368421052631	22.978768723809527	6.772689729122806	543	17	9	15
6850	Création de 5 étangs	14693.35946	29.47368421052631	23.22544659047619	6.845394784561401	543	17	8	15
6851	Création de 20 étangs	57783.56564	29.47368421052631	100	29.47368421052631	543	17	5	15
6852	Création de 20 étangs	57303.14498	29.47368421052631	100	29.47368421052631	543	17	6	15
6853	Création de 20 étangs	57303.14498	29.47368421052631	100	29.47368421052631	543	17	7	15
6854	Création de 20 étangs	54689.50705	29.47368421052631	99.40858485714286	29.299372378947364	543	17	11	15
6855	Création de 20 étangs	58255.4143	29.47368421052631	100	29.47368421052631	543	17	10	15
6856	Création de 20 étangs	58255.4143	29.47368421052631	100	29.47368421052631	543	17	9	15
6857	Création de 20 étangs	58773.43785	29.47368421052631	100	29.47368421052631	543	17	8	15
6858	Création de 12 étangs	34670.13939	29.47368421052631	61.27645598095237	18.060429131228062	543	17	5	15
6859	Création de 12 étangs	34381.88699	29.47368421052631	60.72740379047619	17.89860322245614	543	17	6	15
6860	Création de 12 étangs	34381.88699	29.47368421052631	60.72740379047619	17.89860322245614	543	17	7	15
6861	Création de 12 étangs	32813.70423	29.47368421052631	57.74038900952382	17.018219918596493	543	17	11	15
6862	Création de 12 étangs	34953.24858	29.47368421052631	61.81571158095238	18.219367623859647	543	17	10	15
6863	Création de 12 étangs	34953.24858	29.47368421052631	61.81571158095238	18.219367623859647	543	17	9	15
6864	Création de 12 étangs	35264.06271	29.47368421052631	62.4077384952381	18.393859767017542	543	17	8	15
6865	Création de 5 étangs	-951.6128388	29.47368421052631	90.96193083243243	26.809832245348503	543	18	5	15
6866	Création de 5 étangs	-994.8843457	29.47368421052631	90.18226404144144	26.58003571747747	543	18	6	15
6867	Création de 5 étangs	-997.1332166	29.47368421052631	90.14174384504504	26.568092922750115	543	18	7	15
6868	Création de 5 étangs	-462.7273279	29.47368421052631	99.77067877657657	29.406094797306775	543	18	11	15
6869	Création de 5 étangs	-1006.821981	29.47368421052631	89.9671715135135	26.516640025035553	543	18	10	15
6870	Création de 5 étangs	-1004.573111	29.47368421052631	90.0076916936937	26.5285828149834	543	18	9	15
6871	Création de 5 étangs	-951.1350616	29.47368421052631	90.97053943063062	26.812369516396387	543	18	8	15
6872	Création de 10 étangs	-1903.225678	29.47368421052631	73.81575354954956	21.7562220988146	543	18	5	15
6873	Création de 10 étangs	-1989.768691	29.47368421052631	72.25641998198198	21.296629047321	543	18	6	15
6874	Création de 10 étangs	-1994.266433	29.47368421052631	72.17537958558559	21.272743456804168	543	18	7	15
6875	Création de 10 étangs	-925.4546557	29.47368421052631	91.43324944684684	26.948747205386436	543	18	11	15
6876	Création de 10 étangs	-2013.643963	29.47368421052631	71.8262349009009	21.169837655002365	543	18	10	15
6877	Création de 10 étangs	-2009.146221	29.47368421052631	71.9072752972973	21.193723245519205	543	18	9	15
6878	Création de 10 étangs	-1902.270123	29.47368421052631	73.83297075675675	21.761296644096724	543	18	8	15
6879	Création de 8 étangs	-1522.580542	29.47368421052631	80.67422446846847	23.777666159127545	543	18	5	15
6880	Création de 8 étangs	-1591.814953	29.47368421052631	79.4267576036036	23.40999171474632	543	18	6	15
6881	Création de 8 étangs	-1595.413147	29.47368421052631	79.36192527927928	23.390883240208627	543	18	7	15
6882	Création de 8 étangs	-740.3637246	29.47368421052631	94.76822117837838	27.931686242048364	543	18	11	15
6883	Création de 8 étangs	-1610.91517	29.47368421052631	79.08260954954955	23.308558604077756	543	18	10	15
6884	Création de 8 étangs	-1607.316977	29.47368421052631	79.14744185585585	23.32766707330488	543	18	9	15
6885	Création de 8 étangs	-1521.816099	29.47368421052631	80.68799821621622	23.78172579004267	543	18	8	15
6886	Création de 5 étangs	-951.6128388	29.47368421052631	90.96193083243243	26.809832245348503	543	18	5	15
6887	Création de 5 étangs	-994.8843457	29.47368421052631	90.18226404144144	26.58003571747747	543	18	6	15
6888	Création de 5 étangs	-997.1332166	29.47368421052631	90.14174384504504	26.568092922750115	543	18	7	15
6889	Création de 5 étangs	-462.7273279	29.47368421052631	99.77067877657657	29.406094797306775	543	18	11	15
6890	Création de 5 étangs	-1006.821981	29.47368421052631	89.9671715135135	26.516640025035553	543	18	10	15
6891	Création de 5 étangs	-1004.573111	29.47368421052631	90.0076916936937	26.5285828149834	543	18	9	15
6892	Création de 5 étangs	-951.1350616	29.47368421052631	90.97053943063062	26.812369516396387	543	18	8	15
6893	Création de 20 étangs	-3806.451355	29.47368421052631	39.52339900900901	11.6490018131816	543	18	5	15
6894	Création de 20 étangs	-3979.537383	29.47368421052631	36.404731837837836	10.729815699573255	543	18	6	15
6895	Création de 20 étangs	-3988.532866	29.47368421052631	36.242651063063064	10.682044523850166	543	18	7	15
6896	Création de 20 étangs	-1850.909311	29.47368421052631	74.75839079279281	22.03405202313893	543	18	11	15
6897	Création de 20 étangs	-4027.287926	29.47368421052631	35.544361693693695	10.476232920246561	543	18	10	15
6898	Création de 20 étangs	-4018.292442	29.47368421052631	35.70644248648649	10.524004101280227	543	18	9	15
6899	Création de 20 étangs	-3804.540246	29.47368421052631	39.557833405405404	11.659150898435275	543	18	8	15
6900	Création de 12 étangs	-2283.870813	29.47368421052631	66.95728264864866	19.73477804381223	543	18	5	15
6901	Création de 12 étangs	-2387.72243	29.47368421052631	65.08608234234234	19.183266374585106	543	18	6	15
6902	Création de 12 étangs	-2393.11972	29.47368421052631	64.98883387387387	19.154603668089138	543	18	7	15
6903	Création de 12 étangs	-1110.545587	29.47368421052631	88.0982777117117	25.965808167662395	543	18	11	15
6904	Création de 12 étangs	-2416.372755	29.47368421052631	64.56986027027027	19.03111671123755	543	18	10	15
6905	Création de 12 étangs	-2410.975465	29.47368421052631	64.66710873873875	19.059779417733523	543	18	9	15
6906	Création de 12 étangs	-2282.724148	29.47368421052631	66.97794327927929	19.74086749284021	543	18	8	15
6907	Création de 5 étangs	9	12.5	25	3.125	543	2	5	15
6908	Création de 5 étangs	9	12.5	25	3.125	543	2	6	15
6909	Création de 5 étangs	9	12.5	25	3.125	543	2	7	15
6910	Création de 5 étangs	9	12.5	25	3.125	543	2	11	15
6911	Création de 5 étangs	9	12.5	25	3.125	543	2	10	15
6912	Création de 5 étangs	9	12.5	25	3.125	543	2	9	15
6913	Création de 5 étangs	9	12.5	25	3.125	543	2	8	15
6914	Création de 10 étangs	11	12.5	50	6.25	543	2	5	15
6915	Création de 10 étangs	11	12.5	50	6.25	543	2	6	15
6916	Création de 10 étangs	11	12.5	50	6.25	543	2	7	15
6917	Création de 10 étangs	11	12.5	50	6.25	543	2	11	15
6918	Création de 10 étangs	11	12.5	50	6.25	543	2	10	15
6919	Création de 10 étangs	11	12.5	50	6.25	543	2	9	15
6920	Création de 10 étangs	11	12.5	50	6.25	543	2	8	15
6921	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	5	15
6922	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	6	15
6923	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	7	15
6924	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	11	15
6925	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	10	15
6926	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	9	15
6927	Création de 8 étangs	10	12.5	37.5	4.6875	543	2	8	15
6928	Création de 5 étangs	9	12.5	25	3.125	543	2	5	15
6929	Création de 5 étangs	9	12.5	25	3.125	543	2	6	15
6930	Création de 5 étangs	9	12.5	25	3.125	543	2	7	15
6931	Création de 5 étangs	9	12.5	25	3.125	543	2	11	15
6932	Création de 5 étangs	9	12.5	25	3.125	543	2	10	15
6933	Création de 5 étangs	9	12.5	25	3.125	543	2	9	15
6934	Création de 5 étangs	9	12.5	25	3.125	543	2	8	15
6935	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	5	15
6936	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	6	15
6937	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	7	15
6938	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	11	15
6939	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	10	15
6940	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	9	15
6941	Création de 20 étangs	12	12.5	62.5	7.8125	543	2	8	15
6942	Création de 12 étangs	11	12.5	50	6.25	543	2	5	15
6943	Création de 12 étangs	11	12.5	50	6.25	543	2	6	15
6944	Création de 12 étangs	11	12.5	50	6.25	543	2	7	15
6945	Création de 12 étangs	11	12.5	50	6.25	543	2	11	15
6946	Création de 12 étangs	11	12.5	50	6.25	543	2	10	15
6947	Création de 12 étangs	11	12.5	50	6.25	543	2	9	15
6948	Création de 12 étangs	11	12.5	50	6.25	543	2	8	15
6949	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	5	15
6950	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	6	15
6951	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	7	15
6952	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	11	15
6953	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	10	15
6954	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	9	15
6955	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	8	15
6956	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	5	15
6957	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	6	15
6958	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	7	15
6959	Création de 10 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	11	15
6960	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	10	15
6961	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	9	15
6962	Création de 10 étangs	17	16.666666666666664	75	12.499999999999998	543	12	8	15
6963	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	5	15
6964	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	6	15
6965	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	7	15
6966	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	11	15
6967	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	10	15
6968	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	9	15
6969	Création de 8 étangs	16	16.666666666666664	66.66666666666666	11.111111111111109	543	12	8	15
6970	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	5	15
6971	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	6	15
6972	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	7	15
6973	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	11	15
6974	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	10	15
6975	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	9	15
6976	Création de 5 étangs	14	16.666666666666664	50	8.333333333333332	543	12	8	15
6977	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	5	15
6978	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	6	15
6979	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	7	15
6980	Création de 20 étangs	19	16.666666666666664	91.66666666666666	15.277777777777773	543	12	11	15
6981	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	10	15
6982	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	9	15
6983	Création de 20 étangs	20	16.666666666666664	100	16.666666666666664	543	12	8	15
6984	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	5	15
6985	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	6	15
6986	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	7	15
6987	Création de 12 étangs	17	16.666666666666664	75	12.499999999999998	543	12	11	15
6988	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	10	15
6989	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	9	15
6990	Création de 12 étangs	18	16.666666666666664	83.33333333333334	13.88888888888889	543	12	8	15
6991	Création de 5 étangs	14445.89141	23.333333333333332	22.754078876190476	5.309285071111111	543	17	5	15
6992	Création de 5 étangs	14325.78624	23.333333333333332	22.525307123809522	5.2559049955555555	543	17	6	15
6993	Création de 5 étangs	14325.78624	23.333333333333332	22.525307123809522	5.2559049955555555	543	17	7	15
6994	Création de 5 étangs	13672.37676	23.333333333333332	21.280717638095236	4.965500782222222	543	17	11	15
6995	Création de 5 étangs	14563.85358	23.333333333333332	22.978768723809527	5.361712702222222	543	17	10	15
6996	Création de 5 étangs	14563.85358	23.333333333333332	22.978768723809527	5.361712702222222	543	17	9	15
6997	Création de 5 étangs	14693.35946	23.333333333333332	23.22544659047619	5.41927087111111	543	17	8	15
6998	Création de 10 étangs	28891.78282	23.333333333333332	50.27006251428572	11.729681253333332	543	17	5	15
6999	Création de 10 étangs	28651.57249	23.333333333333332	49.81251902857143	11.622921106666665	543	17	6	15
7000	Création de 10 étangs	28651.57249	23.333333333333332	49.81251902857143	11.622921106666665	543	17	7	15
7001	Création de 10 étangs	27344.75353	23.333333333333332	47.32334005714286	11.04211268	543	17	11	15
7002	Création de 10 étangs	29127.70715	23.333333333333332	50.71944219047618	11.834536511111107	543	17	10	15
7003	Création de 10 étangs	29127.70715	23.333333333333332	50.71944219047618	11.834536511111107	543	17	9	15
7004	Création de 10 étangs	29386.71893	23.333333333333332	51.212797961904755	11.949652857777776	543	17	8	15
7005	Création de 8 étangs	23113.42626	23.333333333333332	39.263669066666665	9.161522782222221	543	17	5	15
7006	Création de 8 étangs	22921.25799	23.333333333333332	38.897634266666664	9.07611466222222	543	17	6	15
7007	Création de 8 étangs	22921.25799	23.333333333333332	38.897634266666664	9.07611466222222	543	17	7	15
7008	Création de 8 étangs	21875.80282	23.333333333333332	36.90629108571429	8.61146792	543	17	11	15
7009	Création de 8 étangs	23302.16572	23.333333333333332	39.6231728	9.245406986666666	543	17	10	15
7010	Création de 8 étangs	23302.16572	23.333333333333332	39.6231728	9.245406986666666	543	17	9	15
7011	Création de 8 étangs	23509.37514	23.333333333333332	40.01785740952381	9.337500062222222	543	17	8	15
7012	Création de 5 étangs	14445.89141	23.333333333333332	22.754078876190476	5.309285071111111	543	17	5	15
7013	Création de 5 étangs	14325.78624	23.333333333333332	22.525307123809522	5.2559049955555555	543	17	6	15
7014	Création de 5 étangs	14325.78624	23.333333333333332	22.525307123809522	5.2559049955555555	543	17	7	15
7015	Création de 5 étangs	13672.37676	23.333333333333332	21.280717638095236	4.965500782222222	543	17	11	15
7016	Création de 5 étangs	14563.85358	23.333333333333332	22.978768723809527	5.361712702222222	543	17	10	15
7017	Création de 5 étangs	14563.85358	23.333333333333332	22.978768723809527	5.361712702222222	543	17	9	15
7018	Création de 5 étangs	14693.35946	23.333333333333332	23.22544659047619	5.41927087111111	543	17	8	15
7019	Création de 20 étangs	57783.56564	23.333333333333332	100	23.33333333333333	543	17	5	15
7020	Création de 20 étangs	57303.14498	23.333333333333332	100	23.33333333333333	543	17	6	15
7021	Création de 20 étangs	57303.14498	23.333333333333332	100	23.33333333333333	543	17	7	15
7022	Création de 20 étangs	54689.50705	23.333333333333332	99.40858485714286	23.195336466666664	543	17	11	15
7023	Création de 20 étangs	58255.4143	23.333333333333332	100	23.33333333333333	543	17	10	15
7024	Création de 20 étangs	58255.4143	23.333333333333332	100	23.33333333333333	543	17	9	15
7025	Création de 20 étangs	58773.43785	23.333333333333332	100	23.33333333333333	543	17	8	15
7026	Création de 12 étangs	34670.13939	23.333333333333332	61.27645598095237	14.297839728888885	543	17	5	15
7027	Création de 12 étangs	34381.88699	23.333333333333332	60.72740379047619	14.169727551111109	543	17	6	15
7028	Création de 12 étangs	34381.88699	23.333333333333332	60.72740379047619	14.169727551111109	543	17	7	15
7029	Création de 12 étangs	32813.70423	23.333333333333332	57.74038900952382	13.472757435555557	543	17	11	15
7030	Création de 12 étangs	34953.24858	23.333333333333332	61.81571158095238	14.423666035555554	543	17	10	15
7031	Création de 12 étangs	34953.24858	23.333333333333332	61.81571158095238	14.423666035555554	543	17	9	15
7032	Création de 12 étangs	35264.06271	23.333333333333332	62.4077384952381	14.561805648888889	543	17	8	15
7033	Création de 5 étangs	-951.6128388	23.333333333333332	90.96193083243243	21.224450527567566	543	18	5	15
7034	Création de 5 étangs	-994.8843457	23.333333333333332	90.18226404144144	21.042528276336334	543	18	6	15
7035	Création de 5 étangs	-997.1332166	23.333333333333332	90.14174384504504	21.033073563843843	543	18	7	15
7036	Création de 5 étangs	-462.7273279	23.333333333333332	99.77067877657657	23.279825047867867	543	18	11	15
7037	Création de 5 étangs	-1006.821981	23.333333333333332	89.9671715135135	20.992340019819817	543	18	10	15
7038	Création de 5 étangs	-1004.573111	23.333333333333332	90.0076916936937	21.00179472852853	543	18	9	15
7039	Création de 5 étangs	-951.1350616	23.333333333333332	90.97053943063062	21.226459200480477	543	18	8	15
7040	Création de 10 étangs	-1903.225678	23.333333333333332	73.81575354954956	17.223675828228227	543	18	5	15
7041	Création de 10 étangs	-1989.768691	23.333333333333332	72.25641998198198	16.859831329129126	543	18	6	15
7042	Création de 10 étangs	-1994.266433	23.333333333333332	72.17537958558559	16.840921903303304	543	18	7	15
7043	Création de 10 étangs	-925.4546557	23.333333333333332	91.43324944684684	21.33442487093093	543	18	11	15
7044	Création de 10 étangs	-2013.643963	23.333333333333332	71.8262349009009	16.759454810210208	543	18	10	15
7045	Création de 10 étangs	-2009.146221	23.333333333333332	71.9072752972973	16.778364236036037	543	18	9	15
7046	Création de 10 étangs	-1902.270123	23.333333333333332	73.83297075675675	17.227693176576576	543	18	8	15
7047	Création de 8 étangs	-1522.580542	23.333333333333332	80.67422446846847	18.82398570930931	543	18	5	15
7048	Création de 8 étangs	-1591.814953	23.333333333333332	79.4267576036036	18.532910107507508	543	18	6	15
7049	Création de 8 étangs	-1595.413147	23.333333333333332	79.36192527927928	18.517782565165163	543	18	7	15
7050	Création de 8 étangs	-740.3637246	23.333333333333332	94.76822117837838	22.11258494162162	543	18	11	15
7051	Création de 8 étangs	-1610.91517	23.333333333333332	79.08260954954955	18.452608894894894	543	18	10	15
7052	Création de 8 étangs	-1607.316977	23.333333333333332	79.14744185585585	18.467736433033032	543	18	9	15
7053	Création de 8 étangs	-1521.816099	23.333333333333332	80.68799821621622	18.827199583783784	543	18	8	15
7054	Création de 5 étangs	-951.6128388	23.333333333333332	90.96193083243243	21.224450527567566	543	18	5	15
7055	Création de 5 étangs	-994.8843457	23.333333333333332	90.18226404144144	21.042528276336334	543	18	6	15
7056	Création de 5 étangs	-997.1332166	23.333333333333332	90.14174384504504	21.033073563843843	543	18	7	15
7057	Création de 5 étangs	-462.7273279	23.333333333333332	99.77067877657657	23.279825047867867	543	18	11	15
7058	Création de 5 étangs	-1006.821981	23.333333333333332	89.9671715135135	20.992340019819817	543	18	10	15
7059	Création de 5 étangs	-1004.573111	23.333333333333332	90.0076916936937	21.00179472852853	543	18	9	15
7060	Création de 5 étangs	-951.1350616	23.333333333333332	90.97053943063062	21.226459200480477	543	18	8	15
7061	Création de 20 étangs	-3806.451355	23.333333333333332	39.52339900900901	9.222126435435435	543	18	5	15
7062	Création de 20 étangs	-3979.537383	23.333333333333332	36.404731837837836	8.494437428828828	543	18	6	15
7063	Création de 20 étangs	-3988.532866	23.333333333333332	36.242651063063064	8.456618581381381	543	18	7	15
7064	Création de 20 étangs	-1850.909311	23.333333333333332	74.75839079279281	17.443624518318323	543	18	11	15
7065	Création de 20 étangs	-4027.287926	23.333333333333332	35.544361693693695	8.293684395195195	543	18	10	15
7066	Création de 20 étangs	-4018.292442	23.333333333333332	35.70644248648649	8.331503246846847	543	18	9	15
7067	Création de 20 étangs	-3804.540246	23.333333333333332	39.557833405405404	9.230161127927927	543	18	8	15
7068	Création de 12 étangs	-2283.870813	23.333333333333332	66.95728264864866	15.623365951351353	543	18	5	15
7069	Création de 12 étangs	-2387.72243	23.333333333333332	65.08608234234234	15.186752546546545	543	18	6	15
7070	Création de 12 étangs	-2393.11972	23.333333333333332	64.98883387387387	15.164061237237236	543	18	7	15
7071	Création de 12 étangs	-1110.545587	23.333333333333332	88.0982777117117	20.556264799399397	543	18	11	15
7072	Création de 12 étangs	-2416.372755	23.333333333333332	64.56986027027027	15.066300729729727	543	18	10	15
7073	Création de 12 étangs	-2410.975465	23.333333333333332	64.66710873873875	15.08899203903904	543	18	9	15
7074	Création de 12 étangs	-2282.724148	23.333333333333332	66.97794327927929	15.628186765165166	543	18	8	15
7075	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	5	1
7076	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	6	1
7077	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	7	1
7078	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	11	1
7079	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	10	1
7080	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	9	1
7081	Création de 2 étangs	8	33.33333333333333	12.5	4.166666666666666	549	2	8	1
7082	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	5	1
7083	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	6	1
7084	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	7	1
7085	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	11	1
7086	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	10	1
7087	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	9	1
7088	Création de 20 étangs	12	33.33333333333333	62.5	20.83333333333333	549	2	8	1
7089	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	5	1
7090	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	6	1
7091	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	7	1
7092	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	11	1
7093	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	10	1
7094	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	9	1
7095	Création de 11 étangs	11	33.33333333333333	50	16.666666666666664	549	2	8	1
7096	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	5	1
7097	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	6	1
7098	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	7	1
7099	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	11	1
7100	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	10	1
7101	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	9	1
7102	Création de 2 étangs	11	66.66666666666666	25	16.666666666666664	549	12	8	1
7103	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	5	1
7104	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	6	1
7105	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	7	1
7106	Création de 20 étangs	19	66.66666666666666	91.66666666666666	61.11111111111109	549	12	11	1
7107	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	10	1
7108	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	9	1
7109	Création de 20 étangs	20	66.66666666666666	100	66.66666666666666	549	12	8	1
7110	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	5	1
7111	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	6	1
7112	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	7	1
7113	Création de 11 étangs	16	66.66666666666666	66.66666666666666	44.444444444444436	549	12	11	1
7114	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	10	1
7115	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	9	1
7116	Création de 11 étangs	17	66.66666666666666	75	49.99999999999999	549	12	8	1
7117	Creation of 2 Ponds	8	40	12.5	5	551	2	5	1
7118	Creation of 2 Ponds	8	40	12.5	5	551	2	6	1
7119	Creation of 2 Ponds	8	40	12.5	5	551	2	7	1
7120	Creation of 2 Ponds	8	40	12.5	5	551	2	11	1
7121	Creation of 2 Ponds	8	40	12.5	5	551	2	10	1
7122	Creation of 2 Ponds	8	40	12.5	5	551	2	9	1
7123	Creation of 2 Ponds	8	40	12.5	5	551	2	8	1
7124	Creation of 20 Ponds	12	40	62.5	25	551	2	5	1
7125	Creation of 20 Ponds	12	40	62.5	25	551	2	6	1
7126	Creation of 20 Ponds	12	40	62.5	25	551	2	7	1
7127	Creation of 20 Ponds	12	40	62.5	25	551	2	11	1
7128	Creation of 20 Ponds	12	40	62.5	25	551	2	10	1
7129	Creation of 20 Ponds	12	40	62.5	25	551	2	9	1
7130	Creation of 20 Ponds	12	40	62.5	25	551	2	8	1
7131	Creation of 11 Ponds	11	40	50	20	551	2	5	1
7132	Creation of 11 Ponds	11	40	50	20	551	2	6	1
7133	Creation of 11 Ponds	11	40	50	20	551	2	7	1
7134	Creation of 11 Ponds	11	40	50	20	551	2	11	1
7135	Creation of 11 Ponds	11	40	50	20	551	2	10	1
7136	Creation of 11 Ponds	11	40	50	20	551	2	9	1
7137	Creation of 11 Ponds	11	40	50	20	551	2	8	1
7138	Creation of 2 Ponds	11	60	25	15	551	12	5	1
7139	Creation of 2 Ponds	11	60	25	15	551	12	6	1
7140	Creation of 2 Ponds	11	60	25	15	551	12	7	1
7141	Creation of 2 Ponds	11	60	25	15	551	12	11	1
7142	Creation of 2 Ponds	11	60	25	15	551	12	10	1
7143	Creation of 2 Ponds	11	60	25	15	551	12	9	1
7144	Creation of 2 Ponds	11	60	25	15	551	12	8	1
7145	Creation of 20 Ponds	20	60	100	60	551	12	5	1
7146	Creation of 20 Ponds	20	60	100	60	551	12	6	1
7147	Creation of 20 Ponds	20	60	100	60	551	12	7	1
7148	Creation of 20 Ponds	19	60	91.66666666666666	54.99999999999999	551	12	11	1
7149	Creation of 20 Ponds	20	60	100	60	551	12	10	1
7150	Creation of 20 Ponds	20	60	100	60	551	12	9	1
7151	Creation of 20 Ponds	20	60	100	60	551	12	8	1
7152	Creation of 11 Ponds	17	60	75	45	551	12	5	1
7153	Creation of 11 Ponds	17	60	75	45	551	12	6	1
7154	Creation of 11 Ponds	17	60	75	45	551	12	7	1
7155	Creation of 11 Ponds	16	60	66.66666666666666	39.99999999999999	551	12	11	1
7156	Creation of 11 Ponds	17	60	75	45	551	12	10	1
7157	Creation of 11 Ponds	17	60	75	45	551	12	9	1
7158	Creation of 11 Ponds	17	60	75	45	551	12	8	1
7159	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	5	1
7160	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	6	1
7161	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	7	1
7162	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	11	1
7163	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	10	1
7164	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	9	1
7165	Creation of 6 Ponds	10	55.263157894736835	37.5	20.72368421052631	552	2	8	1
7166	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	5	1
7167	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	6	1
7168	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	7	1
7169	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	11	1
7170	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	10	1
7171	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	9	1
7172	Creation of 15 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	8	1
7173	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	5	1
7174	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	6	1
7175	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	7	1
7176	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	11	1
7177	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	10	1
7178	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	9	1
7179	Creation of 10 Ponds	11	55.263157894736835	50	27.631578947368418	552	2	8	1
7180	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	5	1
7181	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	6	1
7182	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	7	1
7183	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	11	1
7184	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	10	1
7185	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	9	1
7186	Creation of 6 Ponds	15	15.350877192982454	58.333333333333336	8.954678362573098	552	12	8	1
7187	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	5	1
7188	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	6	1
7189	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	7	1
7190	Creation of 15 Ponds	18	15.350877192982454	83.33333333333334	12.792397660818713	552	12	11	1
7191	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	10	1
7192	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	9	1
7193	Creation of 15 Ponds	19	15.350877192982454	91.66666666666666	14.071637426900582	552	12	8	1
7194	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	5	1
7195	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	6	1
7196	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	7	1
7197	Creation of 10 Ponds	16	15.350877192982454	66.66666666666666	10.233918128654967	552	12	11	1
7198	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	10	1
7199	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	9	1
7200	Creation of 10 Ponds	17	15.350877192982454	75	11.513157894736839	552	12	8	1
7201	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	5	1
7202	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	6	1
7203	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	7	1
7204	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	11	1
7205	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	10	1
7206	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	9	1
7207	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	8	1
7208	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	5	1
7209	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	6	1
7210	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	7	1
7211	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	11	1
7212	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	10	1
7213	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	9	1
7214	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	8	1
7215	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	5	1
7216	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	6	1
7217	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	7	1
7218	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	11	1
7219	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	10	1
7220	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	9	1
7221	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	8	1
7222	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	5	1
7223	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	6	1
7224	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	7	1
7225	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	11	1
7226	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	10	1
7227	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	9	1
7228	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	8	1
7229	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	5	1
7230	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	6	1
7231	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	7	1
7232	Creation of 15 Ponds	18	8.018867924528301	83.33333333333334	6.682389937106918	555	12	11	1
7233	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	10	1
7234	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	9	1
7235	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	8	1
7236	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	5	1
7237	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	6	1
7238	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	7	1
7239	Creation of 10 Ponds	16	8.018867924528301	66.66666666666666	5.345911949685533	555	12	11	1
7240	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	10	1
7241	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	9	1
7242	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	8	1
7243	Creation of 6 Ponds	18	26.41509433962264	25	6.60377358490566	555	15	5	1
7244	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	6	1
7245	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	7	1
7246	Creation of 6 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	11	1
7247	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	10	1
7248	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	9	1
7249	Creation of 6 Ponds	18	26.41509433962264	25	6.60377358490566	555	15	8	1
7250	Creation of 15 Ponds	23	26.41509433962264	66.66666666666666	17.610062893081757	555	15	5	1
7251	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	6	1
7252	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	7	1
7253	Creation of 15 Ponds	26	26.41509433962264	91.66666666666666	24.21383647798742	555	15	11	1
7254	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	10	1
7255	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	9	1
7256	Creation of 15 Ponds	23	26.41509433962264	66.66666666666666	17.610062893081757	555	15	8	1
7257	Creation of 10 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	5	1
7258	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	6	1
7259	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	7	1
7260	Creation of 10 Ponds	24	26.41509433962264	75	19.81132075471698	555	15	11	1
7261	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	10	1
7262	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	9	1
7263	Creation of 10 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	8	1
7264	Creation of 6 Ponds	17335.06969	20.28301886792453	28.2572756	5.731428541509434	555	17	5	1
7265	Creation of 6 Ponds	17190.94349	20.28301886792453	27.982749504761905	5.675746361814915	555	17	6	1
7266	Creation of 6 Ponds	17190.94349	20.28301886792453	27.982749504761905	5.675746361814915	555	17	7	1
7267	Creation of 6 Ponds	16406.85212	20.28301886792453	26.489242133333335	5.372817979874214	555	17	11	1
7268	Creation of 6 Ponds	17476.62429	20.28301886792453	28.526903409523808	5.786117200988319	555	17	10	1
7269	Creation of 6 Ponds	17476.62429	20.28301886792453	28.526903409523808	5.786117200988319	555	17	9	1
7270	Creation of 6 Ponds	17632.03136	20.28301886792453	28.82291687619048	5.846157668283918	555	17	8	1
7271	Creation of 15 Ponds	43337.67423	20.28301886792453	77.78604615238095	15.777358417699908	555	17	5	1
7272	Creation of 15 Ponds	42977.35873	20.28301886792453	77.09973091428571	15.638152968463611	555	17	6	1
7273	Creation of 15 Ponds	42977.35873	20.28301886792453	77.09973091428571	15.638152968463611	555	17	7	1
7274	Creation of 15 Ponds	41017.13029	20.28301886792453	73.36596245714287	14.880832007816714	555	17	11	1
7275	Creation of 15 Ponds	43691.56073	20.28301886792453	78.46011567619047	15.914080066397123	555	17	10	1
7276	Creation of 15 Ponds	43691.56073	20.28301886792453	78.46011567619047	15.914080066397123	555	17	9	1
7277	Creation of 15 Ponds	44080.07839	20.28301886792453	79.20014931428571	16.064181228840972	555	17	8	1
7278	Creation of 10 Ponds	28891.78282	20.28301886792453	50.27006251428572	10.196286264690029	555	17	5	1
7279	Creation of 10 Ponds	28651.57249	20.28301886792453	49.81251902857143	10.10348263315364	555	17	6	1
7280	Creation of 10 Ponds	28651.57249	20.28301886792453	49.81251902857143	10.10348263315364	555	17	7	1
7281	Creation of 10 Ponds	27344.75353	20.28301886792453	47.32334005714286	9.598601992722372	555	17	11	1
7282	Creation of 10 Ponds	29127.70715	20.28301886792453	50.71944219047618	10.287434029200359	555	17	10	1
7283	Creation of 10 Ponds	29127.70715	20.28301886792453	50.71944219047618	10.287434029200359	555	17	9	1
7284	Creation of 10 Ponds	29386.71893	20.28301886792453	51.212797961904755	10.387501473405209	555	17	8	1
7285	Creation of 6 Ponds	-1141.935407	18.867924528301888	87.53269536936938	16.515602899881017	555	18	5	1
7286	Creation of 6 Ponds	-1193.861215	18.867924528301888	86.59709522522523	16.339074570797216	555	18	6	1
7287	Creation of 6 Ponds	-1196.55986	18.867924528301888	86.54847099099099	16.329900186979433	555	18	7	1
7288	Creation of 6 Ponds	-555.2727934	18.867924528301888	98.10319291171172	18.510036398436174	555	18	11	1
7289	Creation of 6 Ponds	-1208.186378	18.867924528301888	86.33898418018018	16.290374373618903	555	18	10	1
7290	Creation of 6 Ponds	-1205.487733	18.867924528301888	86.38760841441442	16.299548757436682	555	18	9	1
7291	Creation of 6 Ponds	-1141.362074	18.867924528301888	87.54302569369369	16.517552017678057	555	18	8	1
7292	Creation of 15 Ponds	-2854.838516	18.867924528301888	56.66957628828829	10.692372884582696	555	18	5	1
7293	Creation of 15 Ponds	-2984.653037	18.867924528301888	54.3305759099099	10.251052058473567	555	18	6	1
7294	Creation of 15 Ponds	-2991.39965	18.867924528301888	54.20901531531533	10.228116097229307	555	18	7	1
7295	Creation of 15 Ponds	-1388.181984	18.867924528301888	83.09582010810811	15.678456624171343	555	18	11	1
7296	Creation of 15 Ponds	-3020.465944	18.867924528301888	53.68529830630631	10.129301567227605	555	18	10	1
7297	Creation of 15 Ponds	-3013.719332	18.867924528301888	53.80685888288288	10.152237525072241	555	18	9	1
7298	Creation of 15 Ponds	-2853.405185	18.867924528301888	56.69540207207206	10.697245673975862	555	18	8	1
7299	Creation of 10 Ponds	-1903.225678	18.867924528301888	73.81575354954956	13.927500669726333	555	18	5	1
7300	Creation of 10 Ponds	-1989.768691	18.867924528301888	72.25641998198198	13.633286789053205	555	18	6	1
7301	Creation of 10 Ponds	-1994.266433	18.867924528301888	72.17537958558559	13.617996148223696	555	18	7	1
7302	Creation of 10 Ponds	-925.4546557	18.867924528301888	91.43324944684684	17.251556499405066	555	18	11	1
7303	Creation of 10 Ponds	-2013.643963	18.867924528301888	71.8262349009009	13.552119792622811	555	18	10	1
7304	Creation of 10 Ponds	-2009.146221	18.867924528301888	71.9072752972973	13.567410433452322	555	18	9	1
7305	Creation of 10 Ponds	-1902.270123	18.867924528301888	73.83297075675675	13.930749199388067	555	18	8	1
7306	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	5	1
7307	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	6	1
7308	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	7	1
7309	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	11	1
7310	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	10	1
7311	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	9	1
7312	Creation of 6 Ponds	10	26.41509433962264	37.5	9.90566037735849	555	2	8	1
7313	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	5	1
7314	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	6	1
7315	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	7	1
7316	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	11	1
7317	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	10	1
7318	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	9	1
7319	Creation of 15 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	8	1
7320	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	5	1
7321	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	6	1
7322	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	7	1
7323	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	11	1
7324	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	10	1
7325	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	9	1
7326	Creation of 10 Ponds	11	26.41509433962264	50	13.20754716981132	555	2	8	1
7327	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	5	1
7328	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	6	1
7329	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	7	1
7330	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	11	1
7331	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	10	1
7332	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	9	1
7333	Creation of 6 Ponds	15	8.018867924528301	58.333333333333336	4.677672955974843	555	12	8	1
7334	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	5	1
7335	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	6	1
7336	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	7	1
7337	Creation of 15 Ponds	18	8.018867924528301	83.33333333333334	6.682389937106918	555	12	11	1
7338	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	10	1
7339	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	9	1
7340	Creation of 15 Ponds	19	8.018867924528301	91.66666666666666	7.350628930817609	555	12	8	1
7341	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	5	1
7342	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	6	1
7343	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	7	1
7344	Creation of 10 Ponds	16	8.018867924528301	66.66666666666666	5.345911949685533	555	12	11	1
7345	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	10	1
7346	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	9	1
7347	Creation of 10 Ponds	17	8.018867924528301	75	6.014150943396226	555	12	8	1
7348	Creation of 6 Ponds	18	26.41509433962264	25	6.60377358490566	555	15	5	1
7349	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	6	1
7350	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	7	1
7351	Creation of 6 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	11	1
7352	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	10	1
7353	Creation of 6 Ponds	17	26.41509433962264	16.666666666666664	4.402515723270439	555	15	9	1
7354	Creation of 6 Ponds	18	26.41509433962264	25	6.60377358490566	555	15	8	1
7355	Creation of 15 Ponds	23	26.41509433962264	66.66666666666666	17.610062893081757	555	15	5	1
7356	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	6	1
7357	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	7	1
7358	Creation of 15 Ponds	26	26.41509433962264	91.66666666666666	24.21383647798742	555	15	11	1
7359	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	10	1
7360	Creation of 15 Ponds	22	26.41509433962264	58.333333333333336	15.40880503144654	555	15	9	1
7361	Creation of 15 Ponds	23	26.41509433962264	66.66666666666666	17.610062893081757	555	15	8	1
7362	Creation of 10 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	5	1
7363	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	6	1
7364	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	7	1
7365	Creation of 10 Ponds	24	26.41509433962264	75	19.81132075471698	555	15	11	1
7366	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	10	1
7367	Creation of 10 Ponds	20	26.41509433962264	41.66666666666667	11.0062893081761	555	15	9	1
7368	Creation of 10 Ponds	21	26.41509433962264	50	13.20754716981132	555	15	8	1
7369	Creation of 6 Ponds	17335.06969	20.28301886792453	28.2572756	5.731428541509434	555	17	5	1
7370	Creation of 6 Ponds	17190.94349	20.28301886792453	27.982749504761905	5.675746361814915	555	17	6	1
7371	Creation of 6 Ponds	17190.94349	20.28301886792453	27.982749504761905	5.675746361814915	555	17	7	1
7372	Creation of 6 Ponds	16406.85212	20.28301886792453	26.489242133333335	5.372817979874214	555	17	11	1
7373	Creation of 6 Ponds	17476.62429	20.28301886792453	28.526903409523808	5.786117200988319	555	17	10	1
7374	Creation of 6 Ponds	17476.62429	20.28301886792453	28.526903409523808	5.786117200988319	555	17	9	1
7375	Creation of 6 Ponds	17632.03136	20.28301886792453	28.82291687619048	5.846157668283918	555	17	8	1
7376	Creation of 15 Ponds	43337.67423	20.28301886792453	77.78604615238095	15.777358417699908	555	17	5	1
7377	Creation of 15 Ponds	42977.35873	20.28301886792453	77.09973091428571	15.638152968463611	555	17	6	1
7378	Creation of 15 Ponds	42977.35873	20.28301886792453	77.09973091428571	15.638152968463611	555	17	7	1
7379	Creation of 15 Ponds	41017.13029	20.28301886792453	73.36596245714287	14.880832007816714	555	17	11	1
7380	Creation of 15 Ponds	43691.56073	20.28301886792453	78.46011567619047	15.914080066397123	555	17	10	1
7381	Creation of 15 Ponds	43691.56073	20.28301886792453	78.46011567619047	15.914080066397123	555	17	9	1
7382	Creation of 15 Ponds	44080.07839	20.28301886792453	79.20014931428571	16.064181228840972	555	17	8	1
7383	Creation of 10 Ponds	28891.78282	20.28301886792453	50.27006251428572	10.196286264690029	555	17	5	1
7384	Creation of 10 Ponds	28651.57249	20.28301886792453	49.81251902857143	10.10348263315364	555	17	6	1
7385	Creation of 10 Ponds	28651.57249	20.28301886792453	49.81251902857143	10.10348263315364	555	17	7	1
7386	Creation of 10 Ponds	27344.75353	20.28301886792453	47.32334005714286	9.598601992722372	555	17	11	1
7387	Creation of 10 Ponds	29127.70715	20.28301886792453	50.71944219047618	10.287434029200359	555	17	10	1
7388	Creation of 10 Ponds	29127.70715	20.28301886792453	50.71944219047618	10.287434029200359	555	17	9	1
7389	Creation of 10 Ponds	29386.71893	20.28301886792453	51.212797961904755	10.387501473405209	555	17	8	1
7390	Creation of 6 Ponds	-1141.935407	18.867924528301888	87.53269536936938	16.515602899881017	555	18	5	1
7391	Creation of 6 Ponds	-1193.861215	18.867924528301888	86.59709522522523	16.339074570797216	555	18	6	1
7392	Creation of 6 Ponds	-1196.55986	18.867924528301888	86.54847099099099	16.329900186979433	555	18	7	1
7393	Creation of 6 Ponds	-555.2727934	18.867924528301888	98.10319291171172	18.510036398436174	555	18	11	1
7394	Creation of 6 Ponds	-1208.186378	18.867924528301888	86.33898418018018	16.290374373618903	555	18	10	1
7395	Creation of 6 Ponds	-1205.487733	18.867924528301888	86.38760841441442	16.299548757436682	555	18	9	1
7396	Creation of 6 Ponds	-1141.362074	18.867924528301888	87.54302569369369	16.517552017678057	555	18	8	1
7397	Creation of 15 Ponds	-2854.838516	18.867924528301888	56.66957628828829	10.692372884582696	555	18	5	1
7398	Creation of 15 Ponds	-2984.653037	18.867924528301888	54.3305759099099	10.251052058473567	555	18	6	1
7399	Creation of 15 Ponds	-2991.39965	18.867924528301888	54.20901531531533	10.228116097229307	555	18	7	1
7400	Creation of 15 Ponds	-1388.181984	18.867924528301888	83.09582010810811	15.678456624171343	555	18	11	1
7401	Creation of 15 Ponds	-3020.465944	18.867924528301888	53.68529830630631	10.129301567227605	555	18	10	1
7402	Creation of 15 Ponds	-3013.719332	18.867924528301888	53.80685888288288	10.152237525072241	555	18	9	1
7403	Creation of 15 Ponds	-2853.405185	18.867924528301888	56.69540207207206	10.697245673975862	555	18	8	1
7404	Creation of 10 Ponds	-1903.225678	18.867924528301888	73.81575354954956	13.927500669726333	555	18	5	1
7405	Creation of 10 Ponds	-1989.768691	18.867924528301888	72.25641998198198	13.633286789053205	555	18	6	1
7406	Creation of 10 Ponds	-1994.266433	18.867924528301888	72.17537958558559	13.617996148223696	555	18	7	1
7407	Creation of 10 Ponds	-925.4546557	18.867924528301888	91.43324944684684	17.251556499405066	555	18	11	1
7408	Creation of 10 Ponds	-2013.643963	18.867924528301888	71.8262349009009	13.552119792622811	555	18	10	1
7409	Creation of 10 Ponds	-2009.146221	18.867924528301888	71.9072752972973	13.567410433452322	555	18	9	1
7410	Creation of 10 Ponds	-1902.270123	18.867924528301888	73.83297075675675	13.930749199388067	555	18	8	1
7411	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	5	1
7412	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	6	1
7413	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	7	1
7414	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	11	1
7415	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	10	1
7416	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	9	1
7417	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	8	1
7418	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	5	1
7419	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	6	1
7420	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	7	1
7421	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	11	1
7422	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	10	1
7423	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	9	1
7424	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	8	1
7425	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	5	1
7426	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	6	1
7427	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	7	1
7428	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	11	1
7429	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	10	1
7430	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	9	1
7431	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	8	1
7432	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	5	1
7433	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	6	1
7434	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	7	1
7435	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	11	1
7436	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	10	1
7437	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	9	1
7438	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	8	1
7439	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	5	1
7440	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	6	1
7441	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	7	1
7442	Creation of 15 Ponds	18	10.303030303030305	83.33333333333334	8.585858585858588	556	12	11	1
7443	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	10	1
7444	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	9	1
7445	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	8	1
7446	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	5	1
7447	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	6	1
7448	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	7	1
7449	Creation of 10 Ponds	16	10.303030303030305	66.66666666666666	6.8686868686868685	556	12	11	1
7450	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	10	1
7451	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	9	1
7452	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	8	1
7453	Creation of 6 Ponds	18	18.78787878787879	25	4.696969696969697	556	15	5	1
7454	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	6	1
7455	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	7	1
7456	Creation of 6 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	11	1
7457	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	10	1
7458	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	9	1
7459	Creation of 6 Ponds	18	18.78787878787879	25	4.696969696969697	556	15	8	1
7460	Creation of 15 Ponds	23	18.78787878787879	66.66666666666666	12.525252525252524	556	15	5	1
7461	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	6	1
7462	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	7	1
7463	Creation of 15 Ponds	26	18.78787878787879	91.66666666666666	17.22222222222222	556	15	11	1
7464	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	10	1
7465	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	9	1
7466	Creation of 15 Ponds	23	18.78787878787879	66.66666666666666	12.525252525252524	556	15	8	1
7467	Creation of 10 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	5	1
7468	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	6	1
7469	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	7	1
7470	Creation of 10 Ponds	24	18.78787878787879	75	14.090909090909092	556	15	11	1
7471	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	10	1
7472	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	9	1
7473	Creation of 10 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	8	1
7474	Creation of 6 Ponds	17335.06969	21.818181818181817	28.2572756	6.165223767272726	556	17	5	1
7475	Creation of 6 Ponds	17190.94349	21.818181818181817	27.982749504761905	6.105327164675324	556	17	6	1
7476	Creation of 6 Ponds	17190.94349	21.818181818181817	27.982749504761905	6.105327164675324	556	17	7	1
7477	Creation of 6 Ponds	16406.85212	21.818181818181817	26.489242133333335	5.7794710109090905	556	17	11	1
7478	Creation of 6 Ponds	17476.62429	21.818181818181817	28.526903409523808	6.224051652987012	556	17	10	1
7479	Creation of 6 Ponds	17476.62429	21.818181818181817	28.526903409523808	6.224051652987012	556	17	9	1
7480	Creation of 6 Ponds	17632.03136	21.818181818181817	28.82291687619048	6.28863640935065	556	17	8	1
7481	Creation of 15 Ponds	43337.67423	21.818181818181817	77.78604615238095	16.971500978701297	556	17	5	1
7482	Creation of 15 Ponds	42977.35873	21.818181818181817	77.09973091428571	16.82175947220779	556	17	6	1
7483	Creation of 15 Ponds	42977.35873	21.818181818181817	77.09973091428571	16.82175947220779	556	17	7	1
7484	Creation of 15 Ponds	41017.13029	21.818181818181817	73.36596245714287	16.007119081558443	556	17	11	1
7485	Creation of 15 Ponds	43691.56073	21.818181818181817	78.46011567619047	17.11857069298701	556	17	10	1
7486	Creation of 15 Ponds	43691.56073	21.818181818181817	78.46011567619047	17.11857069298701	556	17	9	1
7487	Creation of 15 Ponds	44080.07839	21.818181818181817	79.20014931428571	17.280032577662336	556	17	8	1
7488	Creation of 10 Ponds	28891.78282	21.818181818181817	50.27006251428572	10.968013639480521	556	17	5	1
7489	Creation of 10 Ponds	28651.57249	21.818181818181817	49.81251902857143	10.868185969870128	556	17	6	1
7490	Creation of 10 Ponds	28651.57249	21.818181818181817	49.81251902857143	10.868185969870128	556	17	7	1
7491	Creation of 10 Ponds	27344.75353	21.818181818181817	47.32334005714286	10.325092376103896	556	17	11	1
7492	Creation of 10 Ponds	29127.70715	21.818181818181817	50.71944219047618	11.06606011428571	556	17	10	1
7493	Creation of 10 Ponds	29127.70715	21.818181818181817	50.71944219047618	11.06606011428571	556	17	9	1
7494	Creation of 10 Ponds	29386.71893	21.818181818181817	51.212797961904755	11.173701373506493	556	17	8	1
7495	Creation of 6 Ponds	-1141.935407	21.818181818181817	87.53269536936938	19.098042626044226	556	18	5	1
7496	Creation of 6 Ponds	-1193.861215	21.818181818181817	86.59709522522523	18.893911685503685	556	18	6	1
7497	Creation of 6 Ponds	-1196.55986	21.818181818181817	86.54847099099099	18.883302761670762	556	18	7	1
7498	Creation of 6 Ponds	-555.2727934	21.818181818181817	98.10319291171172	21.404332998918917	556	18	11	1
7499	Creation of 6 Ponds	-1208.186378	21.818181818181817	86.33898418018018	18.837596548402946	556	18	10	1
7500	Creation of 6 Ponds	-1205.487733	21.818181818181817	86.38760841441442	18.848205472235872	556	18	9	1
7501	Creation of 6 Ponds	-1141.362074	21.818181818181817	87.54302569369369	19.10029651498771	556	18	8	1
7502	Creation of 15 Ponds	-2854.838516	21.818181818181817	56.66957628828829	12.364271190171989	556	18	5	1
7503	Creation of 15 Ponds	-2984.653037	21.818181818181817	54.3305759099099	11.853943834889433	556	18	6	1
7504	Creation of 15 Ponds	-2991.39965	21.818181818181817	54.20901531531533	11.827421523341524	556	18	7	1
7505	Creation of 15 Ponds	-1388.181984	21.818181818181817	83.09582010810811	18.129997114496312	556	18	11	1
7506	Creation of 15 Ponds	-3020.465944	21.818181818181817	53.68529830630631	11.713155994103195	556	18	10	1
7507	Creation of 15 Ponds	-3013.719332	21.818181818181817	53.80685888288288	11.7396783017199	556	18	9	1
7508	Creation of 15 Ponds	-2853.405185	21.818181818181817	56.69540207207206	12.369905906633903	556	18	8	1
7509	Creation of 10 Ponds	-1903.225678	21.818181818181817	73.81575354954956	16.10525531990172	556	18	5	1
7510	Creation of 10 Ponds	-1989.768691	21.818181818181817	72.25641998198198	15.765037086977884	556	18	6	1
7511	Creation of 10 Ponds	-1994.266433	21.818181818181817	72.17537958558559	15.747355545945945	556	18	7	1
7512	Creation of 10 Ponds	-925.4546557	21.818181818181817	91.43324944684684	19.949072606584764	556	18	11	1
7513	Creation of 10 Ponds	-2013.643963	21.818181818181817	71.8262349009009	15.671178523832923	556	18	10	1
7514	Creation of 10 Ponds	-2009.146221	21.818181818181817	71.9072752972973	15.688860064864864	556	18	9	1
7515	Creation of 10 Ponds	-1902.270123	21.818181818181817	73.83297075675675	16.1090118014742	556	18	8	1
7516	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	5	1
7517	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	6	1
7518	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	7	1
7519	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	11	1
7520	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	10	1
7521	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	9	1
7522	Creation of 6 Ponds	10	27.27272727272727	37.5	10.227272727272727	556	2	8	1
7523	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	5	1
7524	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	6	1
7525	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	7	1
7526	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	11	1
7527	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	10	1
7528	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	9	1
7529	Creation of 15 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	8	1
7530	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	5	1
7531	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	6	1
7532	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	7	1
7533	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	11	1
7534	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	10	1
7535	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	9	1
7536	Creation of 10 Ponds	11	27.27272727272727	50	13.636363636363635	556	2	8	1
7537	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	5	1
7538	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	6	1
7539	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	7	1
7540	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	11	1
7541	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	10	1
7542	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	9	1
7543	Creation of 6 Ponds	15	10.303030303030305	58.333333333333336	6.010101010101011	556	12	8	1
7544	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	5	1
7545	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	6	1
7546	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	7	1
7547	Creation of 15 Ponds	18	10.303030303030305	83.33333333333334	8.585858585858588	556	12	11	1
7548	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	10	1
7549	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	9	1
7550	Creation of 15 Ponds	19	10.303030303030305	91.66666666666666	9.444444444444445	556	12	8	1
7551	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	5	1
7552	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	6	1
7553	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	7	1
7554	Creation of 10 Ponds	16	10.303030303030305	66.66666666666666	6.8686868686868685	556	12	11	1
7555	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	10	1
7556	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	9	1
7557	Creation of 10 Ponds	17	10.303030303030305	75	7.727272727272728	556	12	8	1
7558	Creation of 6 Ponds	18	18.78787878787879	25	4.696969696969697	556	15	5	1
7559	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	6	1
7560	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	7	1
7561	Creation of 6 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	11	1
7562	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	10	1
7563	Creation of 6 Ponds	17	18.78787878787879	16.666666666666664	3.131313131313131	556	15	9	1
7564	Creation of 6 Ponds	18	18.78787878787879	25	4.696969696969697	556	15	8	1
7565	Creation of 15 Ponds	23	18.78787878787879	66.66666666666666	12.525252525252524	556	15	5	1
7566	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	6	1
7567	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	7	1
7568	Creation of 15 Ponds	26	18.78787878787879	91.66666666666666	17.22222222222222	556	15	11	1
7569	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	10	1
7570	Creation of 15 Ponds	22	18.78787878787879	58.333333333333336	10.95959595959596	556	15	9	1
7571	Creation of 15 Ponds	23	18.78787878787879	66.66666666666666	12.525252525252524	556	15	8	1
7572	Creation of 10 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	5	1
7573	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	6	1
7574	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	7	1
7575	Creation of 10 Ponds	24	18.78787878787879	75	14.090909090909092	556	15	11	1
7576	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	10	1
7577	Creation of 10 Ponds	20	18.78787878787879	41.66666666666667	7.828282828282829	556	15	9	1
7578	Creation of 10 Ponds	21	18.78787878787879	50	9.393939393939394	556	15	8	1
7579	Creation of 6 Ponds	17335.06969	21.818181818181817	28.2572756	6.165223767272726	556	17	5	1
7580	Creation of 6 Ponds	17190.94349	21.818181818181817	27.982749504761905	6.105327164675324	556	17	6	1
7581	Creation of 6 Ponds	17190.94349	21.818181818181817	27.982749504761905	6.105327164675324	556	17	7	1
7582	Creation of 6 Ponds	16406.85212	21.818181818181817	26.489242133333335	5.7794710109090905	556	17	11	1
7583	Creation of 6 Ponds	17476.62429	21.818181818181817	28.526903409523808	6.224051652987012	556	17	10	1
7584	Creation of 6 Ponds	17476.62429	21.818181818181817	28.526903409523808	6.224051652987012	556	17	9	1
7585	Creation of 6 Ponds	17632.03136	21.818181818181817	28.82291687619048	6.28863640935065	556	17	8	1
7586	Creation of 15 Ponds	43337.67423	21.818181818181817	77.78604615238095	16.971500978701297	556	17	5	1
7587	Creation of 15 Ponds	42977.35873	21.818181818181817	77.09973091428571	16.82175947220779	556	17	6	1
7588	Creation of 15 Ponds	42977.35873	21.818181818181817	77.09973091428571	16.82175947220779	556	17	7	1
7589	Creation of 15 Ponds	41017.13029	21.818181818181817	73.36596245714287	16.007119081558443	556	17	11	1
7590	Creation of 15 Ponds	43691.56073	21.818181818181817	78.46011567619047	17.11857069298701	556	17	10	1
7591	Creation of 15 Ponds	43691.56073	21.818181818181817	78.46011567619047	17.11857069298701	556	17	9	1
7592	Creation of 15 Ponds	44080.07839	21.818181818181817	79.20014931428571	17.280032577662336	556	17	8	1
7593	Creation of 10 Ponds	28891.78282	21.818181818181817	50.27006251428572	10.968013639480521	556	17	5	1
7594	Creation of 10 Ponds	28651.57249	21.818181818181817	49.81251902857143	10.868185969870128	556	17	6	1
7595	Creation of 10 Ponds	28651.57249	21.818181818181817	49.81251902857143	10.868185969870128	556	17	7	1
7596	Creation of 10 Ponds	27344.75353	21.818181818181817	47.32334005714286	10.325092376103896	556	17	11	1
7597	Creation of 10 Ponds	29127.70715	21.818181818181817	50.71944219047618	11.06606011428571	556	17	10	1
7598	Creation of 10 Ponds	29127.70715	21.818181818181817	50.71944219047618	11.06606011428571	556	17	9	1
7599	Creation of 10 Ponds	29386.71893	21.818181818181817	51.212797961904755	11.173701373506493	556	17	8	1
7600	Creation of 6 Ponds	-1141.935407	21.818181818181817	87.53269536936938	19.098042626044226	556	18	5	1
7601	Creation of 6 Ponds	-1193.861215	21.818181818181817	86.59709522522523	18.893911685503685	556	18	6	1
7602	Creation of 6 Ponds	-1196.55986	21.818181818181817	86.54847099099099	18.883302761670762	556	18	7	1
7603	Creation of 6 Ponds	-555.2727934	21.818181818181817	98.10319291171172	21.404332998918917	556	18	11	1
7604	Creation of 6 Ponds	-1208.186378	21.818181818181817	86.33898418018018	18.837596548402946	556	18	10	1
7605	Creation of 6 Ponds	-1205.487733	21.818181818181817	86.38760841441442	18.848205472235872	556	18	9	1
7606	Creation of 6 Ponds	-1141.362074	21.818181818181817	87.54302569369369	19.10029651498771	556	18	8	1
7607	Creation of 15 Ponds	-2854.838516	21.818181818181817	56.66957628828829	12.364271190171989	556	18	5	1
7608	Creation of 15 Ponds	-2984.653037	21.818181818181817	54.3305759099099	11.853943834889433	556	18	6	1
7609	Creation of 15 Ponds	-2991.39965	21.818181818181817	54.20901531531533	11.827421523341524	556	18	7	1
7610	Creation of 15 Ponds	-1388.181984	21.818181818181817	83.09582010810811	18.129997114496312	556	18	11	1
7611	Creation of 15 Ponds	-3020.465944	21.818181818181817	53.68529830630631	11.713155994103195	556	18	10	1
7612	Creation of 15 Ponds	-3013.719332	21.818181818181817	53.80685888288288	11.7396783017199	556	18	9	1
7613	Creation of 15 Ponds	-2853.405185	21.818181818181817	56.69540207207206	12.369905906633903	556	18	8	1
7614	Creation of 10 Ponds	-1903.225678	21.818181818181817	73.81575354954956	16.10525531990172	556	18	5	1
7615	Creation of 10 Ponds	-1989.768691	21.818181818181817	72.25641998198198	15.765037086977884	556	18	6	1
7616	Creation of 10 Ponds	-1994.266433	21.818181818181817	72.17537958558559	15.747355545945945	556	18	7	1
7617	Creation of 10 Ponds	-925.4546557	21.818181818181817	91.43324944684684	19.949072606584764	556	18	11	1
7618	Creation of 10 Ponds	-2013.643963	21.818181818181817	71.8262349009009	15.671178523832923	556	18	10	1
7619	Creation of 10 Ponds	-2009.146221	21.818181818181817	71.9072752972973	15.688860064864864	556	18	9	1
7620	Creation of 10 Ponds	-1902.270123	21.818181818181817	73.83297075675675	16.1090118014742	556	18	8	1
7621	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	5	1
7622	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	6	1
7623	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	7	1
7624	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	11	1
7625	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	10	1
7626	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	9	1
7627	Creation of 2 Ponds	8	31.70731707317073	12.5	3.963414634146341	561	2	8	1
7628	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	5	1
7629	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	6	1
7630	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	7	1
7631	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	11	1
7632	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	10	1
7633	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	9	1
7634	Creation of 20 Ponds	12	31.70731707317073	62.5	19.817073170731707	561	2	8	1
7635	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	5	1
7636	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	6	1
7637	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	7	1
7638	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	11	1
7639	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	10	1
7640	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	9	1
7641	Creation of 11 Ponds	11	31.70731707317073	50	15.853658536585364	561	2	8	1
7642	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	5	1
7643	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	6	1
7644	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	7	1
7645	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	11	1
7646	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	10	1
7647	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	9	1
7648	Creation of 2 Ponds	11	31.70731707317073	25	7.926829268292682	561	12	8	1
7649	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	5	1
7650	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	6	1
7651	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	7	1
7652	Creation of 20 Ponds	19	31.70731707317073	91.66666666666666	29.065040650406498	561	12	11	1
7653	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	10	1
7654	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	9	1
7655	Creation of 20 Ponds	20	31.70731707317073	100	31.707317073170728	561	12	8	1
7656	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	5	1
7657	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	6	1
7658	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	7	1
7659	Creation of 11 Ponds	16	31.70731707317073	66.66666666666666	21.13821138211382	561	12	11	1
7660	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	10	1
7661	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	9	1
7662	Creation of 11 Ponds	17	31.70731707317073	75	23.78048780487805	561	12	8	1
7663	Creation of 2 Ponds	5778.356564	12.195121951219512	6.244488693333333	0.7615230113821138	561	17	5	1
7664	Creation of 2 Ponds	5730.314498	12.195121951219512	6.152979996190475	0.7503634141695702	561	17	6	1
7665	Creation of 2 Ponds	5730.314498	12.195121951219512	6.152979996190475	0.7503634141695702	561	17	7	1
7666	Creation of 2 Ponds	5468.950705	12.195121951219512	5.6551442	0.689651731707317	561	17	11	1
7667	Creation of 2 Ponds	5825.54143	12.195121951219512	6.334364628571429	0.7724834912891986	561	17	10	1
7668	Creation of 2 Ponds	5825.54143	12.195121951219512	6.334364628571429	0.7724834912891986	561	17	9	1
7669	Creation of 2 Ponds	5877.343785	12.195121951219512	6.433035780952381	0.7845165586527294	561	17	8	1
7670	Creation of 20 Ponds	57783.56564	12.195121951219512	100	12.195121951219512	561	17	5	1
7671	Creation of 20 Ponds	57303.14498	12.195121951219512	100	12.195121951219512	561	17	6	1
7672	Creation of 20 Ponds	57303.14498	12.195121951219512	100	12.195121951219512	561	17	7	1
7673	Creation of 20 Ponds	54689.50705	12.195121951219512	99.40858485714286	12.122998153310105	561	17	11	1
7674	Creation of 20 Ponds	58255.4143	12.195121951219512	100	12.195121951219512	561	17	10	1
7675	Creation of 20 Ponds	58255.4143	12.195121951219512	100	12.195121951219512	561	17	9	1
7676	Creation of 20 Ponds	58773.43785	12.195121951219512	100	12.195121951219512	561	17	8	1
7677	Creation of 11 Ponds	31780.9611	12.195121951219512	55.77325923809524	6.801616980255518	561	17	5	1
7678	Creation of 11 Ponds	31516.72974	12.195121951219512	55.2699614095238	6.74023919628339	561	17	6	1
7679	Creation of 11 Ponds	31516.72974	12.195121951219512	55.2699614095238	6.74023919628339	561	17	7	1
7680	Creation of 11 Ponds	30079.22888	12.195121951219512	52.53186453333333	6.40632494308943	561	17	11	1
7681	Creation of 11 Ponds	32040.47787	12.195121951219512	56.26757689523809	6.8618996213705	561	17	10	1
7682	Creation of 11 Ponds	32040.47787	12.195121951219512	56.26757689523809	6.8618996213705	561	17	9	1
7683	Creation of 11 Ponds	32325.39082	12.195121951219512	56.810268228571424	6.928081491289198	561	17	8	1
7684	Creation of 2 Ponds	-380.6451355	24.390243902439025	100	24.390243902439025	561	18	5	1
7685	Creation of 2 Ponds	-397.9537383	24.390243902439025	100	24.390243902439025	561	18	6	1
7686	Creation of 2 Ponds	-398.8532866	24.390243902439025	100	24.390243902439025	561	18	7	1
7687	Creation of 2 Ponds	-185.0909311	24.390243902439025	100	24.390243902439025	561	18	11	1
7688	Creation of 2 Ponds	-402.7287926	24.390243902439025	100	24.390243902439025	561	18	10	1
7689	Creation of 2 Ponds	-401.8292442	24.390243902439025	100	24.390243902439025	561	18	9	1
7690	Creation of 2 Ponds	-380.4540246	24.390243902439025	100	24.390243902439025	561	18	8	1
7691	Creation of 20 Ponds	-3806.451355	24.390243902439025	39.52339900900901	9.639853416831466	561	18	5	1
7692	Creation of 20 Ponds	-3979.537383	24.390243902439025	36.404731837837836	8.879202887277522	561	18	6	1
7693	Creation of 20 Ponds	-3988.532866	24.390243902439025	36.242651063063064	8.839670990990992	561	18	7	1
7694	Creation of 20 Ponds	-1850.909311	24.390243902439025	74.75839079279281	18.233753851900687	561	18	11	1
7695	Creation of 20 Ponds	-4027.287926	24.390243902439025	35.544361693693695	8.669356510656998	561	18	10	1
7696	Creation of 20 Ponds	-4018.292442	24.390243902439025	35.70644248648649	8.708888411338167	561	18	9	1
7697	Creation of 20 Ponds	-3804.540246	24.390243902439025	39.557833405405404	9.648252050098879	561	18	8	1
7698	Creation of 11 Ponds	-2093.548245	24.390243902439025	70.3865181081081	17.167443441001975	561	18	5	1
7699	Creation of 11 Ponds	-2188.745561	24.390243902439025	68.67125115315315	16.749085647110526	561	18	6	1
7700	Creation of 11 Ponds	-2193.693076	24.390243902439025	68.58210673873873	16.727343107009446	561	18	7	1
7701	Creation of 11 Ponds	-1018.000121	24.390243902439025	89.76576358558559	21.89408867941112	561	18	11	1
7702	Creation of 11 Ponds	-2215.008359	24.390243902439025	68.19804758558558	16.63367014282575	561	18	10	1
7703	Creation of 11 Ponds	-2210.060843	24.390243902439025	68.28719201801802	16.65541268732147	561	18	9	1
7704	Creation of 11 Ponds	-2092.497135	24.390243902439025	70.40545702702703	17.172062689518786	561	18	8	1
7705	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	5	1
7706	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	6	1
7707	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	7	1
7708	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	11	1
7709	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	10	1
7710	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	9	1
7711	Creation of 2 Ponds	8	59.78260869565217	12.5	7.4728260869565215	562	2	8	1
7712	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	5	1
7713	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	6	1
7714	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	7	1
7715	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	11	1
7716	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	10	1
7717	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	9	1
7718	Creation of 20 Ponds	12	59.78260869565217	62.5	37.3641304347826	562	2	8	1
7719	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	5	1
7720	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	6	1
7721	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	7	1
7722	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	11	1
7723	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	10	1
7724	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	9	1
7725	Creation of 11 Ponds	11	59.78260869565217	50	29.891304347826086	562	2	8	1
7726	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	5	1
7727	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	6	1
7728	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	7	1
7729	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	11	1
7730	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	10	1
7731	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	9	1
7732	Creation of 2 Ponds	11	24.27536231884058	25	6.068840579710145	562	12	8	1
7733	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	5	1
7734	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	6	1
7735	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	7	1
7736	Creation of 20 Ponds	19	24.27536231884058	91.66666666666666	22.252415458937193	562	12	11	1
7737	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	10	1
7738	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	9	1
7739	Creation of 20 Ponds	20	24.27536231884058	100	24.27536231884058	562	12	8	1
7740	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	5	1
7741	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	6	1
7742	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	7	1
7743	Creation of 11 Ponds	16	24.27536231884058	66.66666666666666	16.18357487922705	562	12	11	1
7744	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	10	1
7745	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	9	1
7746	Creation of 11 Ponds	17	24.27536231884058	75	18.206521739130434	562	12	8	1
7747	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	5	1
7748	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	6	1
7749	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	7	1
7750	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	11	1
7751	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	10	1
7752	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	9	1
7753	Creation of 2 Ponds	8	55.319148936170215	12.5	6.914893617021277	563	2	8	1
7754	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	5	1
7755	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	6	1
7756	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	7	1
7757	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	11	1
7758	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	10	1
7759	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	9	1
7760	Creation of 18 Ponds	12	55.319148936170215	62.5	34.57446808510639	563	2	8	1
7761	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	5	1
7762	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	6	1
7763	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	7	1
7764	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	11	1
7765	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	10	1
7766	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	9	1
7767	Creation of 10 Ponds	11	55.319148936170215	50	27.659574468085108	563	2	8	1
7768	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	5	1
7769	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	6	1
7770	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	7	1
7771	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	11	1
7772	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	10	1
7773	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	9	1
7774	Creation of 2 Ponds	11	23.404255319148938	25	5.851063829787234	563	12	8	1
7775	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	5	1
7776	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	6	1
7777	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	7	1
7778	Creation of 18 Ponds	19	23.404255319148938	91.66666666666666	21.453900709219855	563	12	11	1
7779	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	10	1
7780	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	9	1
7781	Creation of 18 Ponds	20	23.404255319148938	100	23.404255319148938	563	12	8	1
7782	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	5	1
7783	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	6	1
7784	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	7	1
7785	Creation of 10 Ponds	16	23.404255319148938	66.66666666666666	15.602836879432623	563	12	11	1
7786	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	10	1
7787	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	9	1
7788	Creation of 10 Ponds	17	23.404255319148938	75	17.5531914893617	563	12	8	1
7789	Creation of 2 Ponds	14	21.27659574468085	0	0	563	15	5	1
7790	Creation of 2 Ponds	13	21.27659574468085	0	0	563	15	6	1
7791	Creation of 2 Ponds	13	21.27659574468085	0	0	563	15	7	1
7792	Creation of 2 Ponds	17	21.27659574468085	16.666666666666664	3.5460992907801416	563	15	11	1
7793	Creation of 2 Ponds	14	21.27659574468085	0	0	563	15	10	1
7794	Creation of 2 Ponds	13	21.27659574468085	0	0	563	15	9	1
7795	Creation of 2 Ponds	14	21.27659574468085	0	0	563	15	8	1
7796	Creation of 18 Ponds	23	21.27659574468085	66.66666666666666	14.184397163120567	563	15	5	1
7797	Creation of 18 Ponds	22	21.27659574468085	58.333333333333336	12.411347517730496	563	15	6	1
7798	Creation of 18 Ponds	22	21.27659574468085	58.333333333333336	12.411347517730496	563	15	7	1
7799	Creation of 18 Ponds	26	21.27659574468085	91.66666666666666	19.503546099290777	563	15	11	1
7800	Creation of 18 Ponds	22	21.27659574468085	58.333333333333336	12.411347517730496	563	15	10	1
7801	Creation of 18 Ponds	22	21.27659574468085	58.333333333333336	12.411347517730496	563	15	9	1
7802	Creation of 18 Ponds	23	21.27659574468085	66.66666666666666	14.184397163120567	563	15	8	1
7803	Creation of 10 Ponds	21	21.27659574468085	50	10.638297872340424	563	15	5	1
7804	Creation of 10 Ponds	20	21.27659574468085	41.66666666666667	8.865248226950357	563	15	6	1
7805	Creation of 10 Ponds	20	21.27659574468085	41.66666666666667	8.865248226950357	563	15	7	1
7806	Creation of 10 Ponds	24	21.27659574468085	75	15.957446808510637	563	15	11	1
7807	Creation of 10 Ponds	20	21.27659574468085	41.66666666666667	8.865248226950357	563	15	10	1
7808	Creation of 10 Ponds	20	21.27659574468085	41.66666666666667	8.865248226950357	563	15	9	1
7809	Creation of 10 Ponds	21	21.27659574468085	50	10.638297872340424	563	15	8	1
\.


--
-- Data for Name: ponderful_mcda_modeling_result; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_modeling_result (id, pond_num, output, action_id, criteria_id, scenario_id) FROM stdin;
127	1	7	7	2	5
128	1	7	7	2	6
129	1	7	7	2	7
130	1	7	7	2	8
133	1	7	7	2	11
132	1	7	7	2	10
131	1	7	7	2	9
140	2	8	7	2	5
139	2	8	7	2	6
138	2	8	7	2	7
137	2	8	7	2	8
136	2	8	7	2	9
135	2	8	7	2	10
134	2	8	7	2	11
147	3	9	7	2	11
146	3	9	7	2	10
145	3	9	7	2	9
144	3	9	7	2	8
143	3	9	7	2	7
142	3	9	7	2	6
141	3	9	7	2	5
154	4	9	7	2	5
153	4	9	7	2	6
152	4	9	7	2	7
151	4	9	7	2	8
150	4	9	7	2	9
149	4	9	7	2	10
148	4	9	7	2	11
161	5	9	7	2	11
160	5	9	7	2	10
159	5	9	7	2	9
158	5	9	7	2	8
157	5	9	7	2	7
156	5	9	7	2	6
155	5	9	7	2	5
168	6	10	7	2	5
167	6	10	7	2	6
166	6	10	7	2	7
165	6	10	7	2	8
164	6	10	7	2	9
163	6	10	7	2	10
162	6	10	7	2	11
175	7	10	7	2	11
174	7	10	7	2	10
173	7	10	7	2	9
172	7	10	7	2	8
171	7	10	7	2	7
170	7	10	7	2	6
169	7	10	7	2	5
182	8	10	7	2	5
181	8	10	7	2	6
180	8	10	7	2	7
179	8	10	7	2	8
178	8	10	7	2	9
177	8	10	7	2	10
176	8	10	7	2	11
189	9	10	7	2	11
188	9	10	7	2	10
187	9	10	7	2	9
186	9	10	7	2	8
185	9	10	7	2	7
184	9	10	7	2	6
183	9	10	7	2	5
196	10	11	7	2	5
195	10	11	7	2	6
194	10	11	7	2	7
193	10	11	7	2	8
192	10	11	7	2	9
191	10	11	7	2	10
190	10	11	7	2	11
203	11	11	7	2	11
202	11	11	7	2	10
201	11	11	7	2	9
200	11	11	7	2	8
199	11	11	7	2	7
198	11	11	7	2	6
197	11	11	7	2	5
210	12	11	7	2	5
209	12	11	7	2	6
208	12	11	7	2	7
207	12	11	7	2	8
206	12	11	7	2	9
205	12	11	7	2	10
204	12	11	7	2	11
217	13	11	7	2	11
216	13	11	7	2	10
215	13	11	7	2	9
214	13	11	7	2	8
213	13	11	7	2	7
212	13	11	7	2	6
211	13	11	7	2	5
224	14	11	7	2	5
223	14	11	7	2	6
222	14	11	7	2	7
221	14	11	7	2	8
220	14	11	7	2	9
219	14	11	7	2	10
218	14	11	7	2	11
226	16	12	7	2	6
225	16	12	7	2	5
227	16	12	7	2	7
292	3	12	7	12	5
291	3	12	7	12	6
290	3	12	7	12	7
231	16	12	7	2	11
230	16	12	7	2	10
229	16	12	7	2	9
228	16	12	7	2	8
238	17	12	7	2	5
237	17	12	7	2	6
236	17	12	7	2	7
235	17	12	7	2	8
234	17	12	7	2	9
233	17	12	7	2	10
232	17	12	7	2	11
245	18	12	7	2	11
244	18	12	7	2	10
243	18	12	7	2	9
242	18	12	7	2	8
241	18	12	7	2	7
240	18	12	7	2	6
239	18	12	7	2	5
252	19	12	7	2	5
251	19	12	7	2	6
250	19	12	7	2	7
249	19	12	7	2	8
248	19	12	7	2	9
247	19	12	7	2	10
246	19	12	7	2	11
259	20	12	7	2	11
258	20	12	7	2	10
257	20	12	7	2	9
256	20	12	7	2	8
255	20	12	7	2	7
254	20	12	7	2	6
253	20	12	7	2	5
266	15	11	7	2	11
265	15	11	7	2	10
264	15	11	7	2	9
263	15	11	7	2	8
262	15	11	7	2	7
261	15	11	7	2	6
260	15	11	7	2	5
289	3	12	7	12	8
288	3	12	7	12	9
287	3	12	7	12	10
286	3	12	7	12	11
285	4	13	7	12	11
284	4	13	7	12	10
283	4	13	7	12	9
282	4	13	7	12	8
281	4	13	7	12	7
280	4	13	7	12	6
279	4	13	7	12	5
278	5	14	7	12	5
277	5	14	7	12	6
276	5	14	7	12	7
275	5	14	7	12	8
274	5	14	7	12	9
273	5	14	7	12	10
272	5	14	7	12	11
271	6	15	7	12	11
270	6	15	7	12	10
269	6	15	7	12	9
268	6	15	7	12	8
267	6	15	7	12	7
306	1	9	7	12	5
305	1	9	7	12	6
304	1	9	7	12	7
303	1	9	7	12	8
302	1	9	7	12	9
301	1	9	7	12	10
300	1	9	7	12	11
299	2	11	7	12	11
298	2	11	7	12	10
297	2	11	7	12	9
296	2	11	7	12	8
295	2	11	7	12	7
294	2	11	7	12	6
293	2	11	7	12	5
307	6	15	7	12	6
308	6	15	7	12	5
322	8	16	7	12	5
321	8	16	7	12	6
320	8	16	7	12	7
319	8	16	7	12	8
318	8	16	7	12	9
317	8	16	7	12	10
316	8	16	7	12	11
315	7	15	7	12	11
314	7	15	7	12	10
313	7	15	7	12	9
312	7	15	7	12	8
311	7	15	7	12	7
310	7	15	7	12	6
309	7	15	7	12	5
329	9	15	7	12	11
328	9	16	7	12	10
327	9	16	7	12	9
326	9	16	7	12	8
325	9	16	7	12	7
324	9	16	7	12	6
323	9	16	7	12	5
336	10	17	7	12	5
335	10	17	7	12	6
334	10	17	7	12	7
333	10	17	7	12	8
332	10	17	7	12	9
331	10	17	7	12	10
330	10	16	7	12	11
343	11	16	7	12	11
342	11	17	7	12	10
341	11	17	7	12	9
340	11	17	7	12	8
339	11	17	7	12	7
338	11	17	7	12	6
337	11	17	7	12	5
350	12	18	7	12	5
349	12	18	7	12	6
348	12	18	7	12	7
347	12	18	7	12	8
346	12	18	7	12	9
345	12	18	7	12	10
344	12	17	7	12	11
357	13	17	7	12	11
356	13	18	7	12	10
355	13	18	7	12	9
354	13	18	7	12	8
353	13	18	7	12	7
352	13	18	7	12	6
351	13	18	7	12	5
364	14	18	7	12	5
363	14	18	7	12	6
362	14	18	7	12	7
361	14	18	7	12	8
360	14	18	7	12	9
359	14	18	7	12	10
358	14	17	7	12	11
371	15	18	7	12	11
370	15	19	7	12	10
369	15	19	7	12	9
368	15	19	7	12	8
367	15	19	7	12	7
366	15	19	7	12	6
365	15	19	7	12	5
378	16	19	7	12	5
377	16	19	7	12	6
376	16	19	7	12	7
375	16	19	7	12	8
374	16	19	7	12	9
373	16	19	7	12	10
372	16	18	7	12	11
385	17	18	7	12	11
384	17	19	7	12	10
383	17	19	7	12	9
382	17	19	7	12	8
381	17	19	7	12	7
380	17	19	7	12	6
379	17	19	7	12	5
392	18	20	7	12	5
391	18	20	7	12	6
390	18	20	7	12	7
389	18	20	7	12	8
388	18	20	7	12	9
387	18	20	7	12	10
386	18	19	7	12	11
393	19	20	7	12	5
399	19	19	7	12	11
398	19	20	7	12	10
397	19	20	7	12	9
396	19	20	7	12	8
395	19	20	7	12	7
394	19	20	7	12	6
406	20	20	7	12	5
405	20	20	7	12	6
404	20	20	7	12	7
403	20	20	7	12	8
402	20	20	7	12	9
401	20	20	7	12	10
400	20	19	7	12	11
413	20	27	7	15	11
412	20	23	7	15	10
411	20	23	7	15	9
410	20	24	7	15	8
409	20	23	7	15	7
408	20	23	7	15	6
407	20	24	7	15	5
420	19	24	7	15	5
419	19	23	7	15	6
418	19	23	7	15	7
417	19	24	7	15	8
416	19	23	7	15	9
415	19	23	7	15	10
414	19	27	7	15	11
427	18	26	7	15	11
426	18	22	7	15	10
425	18	22	7	15	9
424	18	23	7	15	8
423	18	22	7	15	7
422	18	22	7	15	6
421	18	23	7	15	5
434	17	23	7	15	5
433	17	22	7	15	6
432	17	22	7	15	7
431	17	23	7	15	8
430	17	22	7	15	9
429	17	22	7	15	10
428	17	26	7	15	11
441	16	26	7	15	11
440	16	22	7	15	10
439	16	22	7	15	9
438	16	23	7	15	8
437	16	22	7	15	7
436	16	22	7	15	6
435	16	23	7	15	5
448	15	23	7	15	5
447	15	22	7	15	6
446	15	22	7	15	7
445	15	23	7	15	8
444	15	22	7	15	9
443	15	22	7	15	10
442	15	26	7	15	11
455	14	25	7	15	11
454	14	21	7	15	10
453	14	21	7	15	9
452	14	22	7	15	8
451	14	21	7	15	7
450	14	21	7	15	6
449	14	22	7	15	5
462	13	22	7	15	5
461	13	21	7	15	6
460	13	21	7	15	7
459	13	22	7	15	8
458	13	21	7	15	9
457	13	21	7	15	10
456	13	25	7	15	11
469	12	24	7	15	11
468	12	20	7	15	10
467	12	20	7	15	9
466	12	21	7	15	8
465	12	20	7	15	7
464	12	20	7	15	6
463	12	21	7	15	5
476	11	21	7	15	5
475	11	20	7	15	6
474	11	20	7	15	7
473	11	21	7	15	8
472	11	20	7	15	9
471	11	20	7	15	10
470	11	24	7	15	11
483	10	24	7	15	11
482	10	20	7	15	10
481	10	20	7	15	9
480	10	21	7	15	8
479	10	20	7	15	7
478	10	20	7	15	6
477	10	21	7	15	5
490	9	20	7	15	5
489	9	19	7	15	6
488	9	19	7	15	7
487	9	20	7	15	8
486	9	19	7	15	9
485	9	19	7	15	10
484	9	23	7	15	11
494	8	20	7	15	8
493	8	19	7	15	7
492	8	19	7	15	6
491	8	20	7	15	5
497	8	23	7	15	11
496	8	19	7	15	10
495	8	19	7	15	9
504	7	19	7	15	5
503	7	18	7	15	6
502	7	18	7	15	7
501	7	19	7	15	8
500	7	18	7	15	9
499	7	18	7	15	10
498	7	22	7	15	11
511	6	21	7	15	11
510	6	17	7	15	10
509	6	17	7	15	9
508	6	18	7	15	8
507	6	17	7	15	7
506	6	17	7	15	6
505	6	18	7	15	5
518	5	18	7	15	5
517	5	17	7	15	6
516	5	17	7	15	7
515	5	18	7	15	8
514	5	17	7	15	9
513	5	17	7	15	10
512	5	21	7	15	11
525	4	20	7	15	11
524	4	16	7	15	10
523	4	16	7	15	9
522	4	17	7	15	8
521	4	16	7	15	7
520	4	16	7	15	6
519	4	17	7	15	5
532	3	16	7	15	5
531	3	15	7	15	6
530	3	15	7	15	7
529	3	16	7	15	8
528	3	15	7	15	9
527	3	15	7	15	10
526	3	19	7	15	11
546	1	12	7	15	5
545	1	12	7	15	6
544	1	11	7	15	7
543	1	12	7	15	8
542	1	11	7	15	9
541	1	11	7	15	10
540	1	15	7	15	11
539	2	17	7	15	11
538	2	14	7	15	10
537	2	13	7	15	9
536	2	14	7	15	8
535	2	13	7	15	7
534	2	13	7	15	6
533	2	14	7	15	5
547	1	2734.475353	7	17	11
553	1	2865.157249	7	17	7
552	1	2865.157249	7	17	6
551	1	2889.178282	7	17	5
550	1	2912.770715	7	17	10
549	1	2912.770715	7	17	9
548	1	2938.671893	7	17	8
575	4	10937.90141	7	17	11
574	4	11754.68757	7	17	8
573	4	11651.08286	7	17	9
572	4	11651.08286	7	17	10
571	4	11556.71313	7	17	5
570	4	11460.629	7	17	6
569	4	11460.629	7	17	7
561	2	5468.950705	7	17	11
560	2	5877.343785	7	17	8
559	2	5825.54143	7	17	9
558	2	5825.54143	7	17	10
557	2	5778.356564	7	17	5
556	2	5730.314498	7	17	6
555	2	5730.314498	7	17	7
568	3	8595.471747	7	17	7
567	3	8595.471747	7	17	6
566	3	8667.534847	7	17	5
565	3	8738.312145	7	17	10
564	3	8738.312145	7	17	9
563	3	8816.015678	7	17	8
562	3	8203.426058	7	17	11
582	5	14325.78624	7	17	7
581	5	14325.78624	7	17	6
580	5	14445.89141	7	17	5
579	5	14563.85358	7	17	10
578	5	14563.85358	7	17	9
577	5	14693.35946	7	17	8
576	5	13672.37676	7	17	11
589	6	16406.85212	7	17	11
588	6	17632.03136	7	17	8
587	6	17476.62429	7	17	9
586	6	17476.62429	7	17	10
585	6	17335.06969	7	17	5
584	6	17190.94349	7	17	6
583	6	17190.94349	7	17	7
596	7	20056.10074	7	17	7
595	7	20056.10074	7	17	6
594	7	20224.24798	7	17	5
593	7	20389.39501	7	17	10
592	7	20389.39501	7	17	9
591	7	20570.70325	7	17	8
590	7	19141.32747	7	17	11
603	8	21875.80282	7	17	11
602	8	23509.37514	7	17	8
601	8	23302.16572	7	17	9
600	8	23302.16572	7	17	10
599	8	23113.42626	7	17	5
598	8	22921.25799	7	17	6
597	8	22921.25799	7	17	7
610	9	25786.41524	7	17	7
609	9	25786.41524	7	17	6
608	9	26002.60454	7	17	5
607	9	26214.93644	7	17	10
606	9	26214.93644	7	17	9
605	9	26448.04703	7	17	8
604	9	24610.27817	7	17	11
617	10	27344.75353	7	17	11
616	10	29386.71893	7	17	8
615	10	29127.70715	7	17	9
614	10	29127.70715	7	17	10
613	10	28891.78282	7	17	5
612	10	28651.57249	7	17	6
611	10	28651.57249	7	17	7
624	11	31516.72974	7	17	7
623	11	31516.72974	7	17	6
622	11	31780.9611	7	17	5
621	11	32040.47787	7	17	10
620	11	32040.47787	7	17	9
619	11	32325.39082	7	17	8
618	11	30079.22888	7	17	11
631	12	32813.70423	7	17	11
630	12	35264.06271	7	17	8
629	12	34953.24858	7	17	9
628	12	34953.24858	7	17	10
627	12	34670.13939	7	17	5
626	12	34381.88699	7	17	6
625	12	34381.88699	7	17	7
638	13	37247.04424	7	17	7
637	13	37247.04424	7	17	6
636	13	37559.31767	7	17	5
635	13	37866.0193	7	17	10
634	13	37866.0193	7	17	9
633	13	38202.7346	7	17	8
632	13	35548.17958	7	17	11
645	14	38282.65494	7	17	11
644	14	41141.4065	7	17	8
643	14	40778.79001	7	17	9
642	14	40778.79001	7	17	10
641	14	40448.49595	7	17	5
640	14	40112.20149	7	17	6
639	14	40112.20149	7	17	7
652	15	42977.35873	7	17	7
651	15	42977.35873	7	17	6
650	15	43337.67423	7	17	5
649	15	43691.56073	7	17	10
648	15	43691.56073	7	17	9
647	15	44080.07839	7	17	8
646	15	41017.13029	7	17	11
659	16	43751.60564	7	17	11
658	16	47018.75028	7	17	8
657	16	46604.33144	7	17	9
656	16	46604.33144	7	17	10
655	16	46226.85252	7	17	5
654	16	45842.51598	7	17	6
653	16	45842.51598	7	17	7
666	17	48707.67323	7	17	7
665	17	48707.67323	7	17	6
664	17	49116.0308	7	17	5
663	17	49517.10216	7	17	10
662	17	49517.10216	7	17	9
661	17	49957.42217	7	17	8
660	17	46486.081	7	17	11
673	18	49220.55635	7	17	11
672	18	52896.09407	7	17	8
671	18	52429.87287	7	17	9
670	18	52429.87287	7	17	10
669	18	52005.20908	7	17	5
668	18	51572.83048	7	17	6
667	18	51572.83048	7	17	7
680	19	54437.98773	7	17	7
679	19	54437.98773	7	17	6
678	19	54894.38736	7	17	5
677	19	55342.64359	7	17	10
676	19	55342.64359	7	17	9
675	19	55834.76596	7	17	8
674	19	51955.0317	7	17	11
687	20	54689.50705	7	17	11
686	20	58773.43785	7	17	8
685	20	58255.4143	7	17	9
684	20	58255.4143	7	17	10
683	20	57783.56564	7	17	5
682	20	57303.14498	7	17	6
681	20	57303.14498	7	17	7
694	20	-3988.532866	7	18	7
693	20	-3979.537383	7	18	6
692	20	-3806.451355	7	18	5
691	20	-4027.287926	7	18	10
690	20	-4018.292442	7	18	9
689	20	-3804.540246	7	18	8
688	20	-1850.909311	7	18	11
697	19	-3616.128787	7	18	5
696	19	-3780.560514	7	18	6
695	19	-3789.106223	7	18	7
701	19	-1758.363846	7	18	11
700	19	-3614.313234	7	18	8
699	19	-3817.37782	7	18	9
698	19	-3825.923529	7	18	10
708	18	-3589.67958	7	18	7
707	18	-3581.583645	7	18	6
706	18	-3425.80622	7	18	5
705	18	-3624.559133	7	18	10
704	18	-3616.463198	7	18	9
703	18	-3424.086222	7	18	8
702	18	-1665.81838	7	18	11
715	17	-1573.272915	7	18	11
714	17	-3233.859209	7	18	8
713	17	-3415.548576	7	18	9
712	17	-3423.194737	7	18	10
711	17	-3235.483652	7	18	5
710	17	-3382.606775	7	18	6
709	17	-3390.252936	7	18	7
722	16	-3190.826293	7	18	7
721	16	-3183.629906	7	18	6
720	16	-3045.161084	7	18	5
719	16	-3221.830341	7	18	10
718	16	-3214.633954	7	18	9
717	16	-3043.632197	7	18	8
716	16	-1480.727449	7	18	11
729	15	-1388.181984	7	18	11
728	15	-2853.405185	7	18	8
727	15	-3013.719332	7	18	9
726	15	-3020.465944	7	18	10
725	15	-2854.838516	7	18	5
724	15	-2984.653037	7	18	6
723	15	-2991.39965	7	18	7
736	14	-2791.973006	7	18	7
735	14	-2785.676168	7	18	6
734	14	-2664.515949	7	18	5
733	14	-2819.101548	7	18	10
732	14	-2812.80471	7	18	9
731	14	-2663.178172	7	18	8
730	14	-1295.636518	7	18	11
743	13	-1203.091052	7	18	11
742	13	-2472.95116	7	18	8
741	13	-2611.890088	7	18	9
740	13	-2617.737152	7	18	10
739	13	-2474.193381	7	18	5
738	13	-2586.699299	7	18	6
737	13	-2592.546363	7	18	7
750	12	-2393.11972	7	18	7
749	12	-2387.72243	7	18	6
748	12	-2283.870813	7	18	5
747	12	-2416.372755	7	18	10
746	12	-2410.975465	7	18	9
745	12	-2282.724148	7	18	8
744	12	-1110.545587	7	18	11
757	11	-1018.000121	7	18	11
756	11	-2092.497135	7	18	8
755	11	-2210.060843	7	18	9
754	11	-2215.008359	7	18	10
753	11	-2093.548245	7	18	5
752	11	-2188.745561	7	18	6
751	11	-2193.693076	7	18	7
764	10	-1994.266433	7	18	7
763	10	-1989.768691	7	18	6
762	10	-1903.225678	7	18	5
761	10	-2013.643963	7	18	10
760	10	-2009.146221	7	18	9
759	10	-1902.270123	7	18	8
758	10	-925.4546557	7	18	11
771	9	-832.9091902	7	18	11
770	9	-1712.043111	7	18	8
769	9	-1808.231599	7	18	9
768	9	-1812.279567	7	18	10
767	9	-1712.90311	7	18	5
766	9	-1790.791822	7	18	6
765	9	-1794.83979	7	18	7
778	8	-1595.413147	7	18	7
777	8	-1591.814953	7	18	6
776	8	-1522.580542	7	18	5
775	8	-1610.91517	7	18	10
774	8	-1607.316977	7	18	9
773	8	-1521.816099	7	18	8
772	8	-740.3637246	7	18	11
785	7	-647.818259	7	18	11
784	7	-1331.589086	7	18	8
783	7	-1406.402355	7	18	9
782	7	-1409.550774	7	18	10
781	7	-1332.257974	7	18	5
780	7	-1392.838084	7	18	6
779	7	-1395.986503	7	18	7
792	6	-1196.55986	7	18	7
791	6	-1193.861215	7	18	6
790	6	-1141.935407	7	18	5
789	6	-1208.186378	7	18	10
788	6	-1205.487733	7	18	9
787	6	-1141.362074	7	18	8
786	6	-555.2727934	7	18	11
798	5	-951.1350616	7	18	8
797	5	-1004.573111	7	18	9
796	5	-1006.821981	7	18	10
795	5	-951.6128388	7	18	5
794	5	-994.8843457	7	18	6
793	5	-997.1332166	7	18	7
799	5	-462.7273279	7	18	11
806	4	-797.7065733	7	18	7
805	4	-795.9074766	7	18	6
804	4	-761.2902711	7	18	5
803	4	-805.4575852	7	18	10
802	4	-803.6584885	7	18	9
801	4	-760.9080493	7	18	8
800	4	-370.1818623	7	18	11
813	3	-277.6363967	7	18	11
812	3	-570.6810369	7	18	8
811	3	-602.7438664	7	18	9
810	3	-604.0931889	7	18	10
809	3	-570.9677033	7	18	5
808	3	-596.9306074	7	18	6
807	3	-598.2799299	7	18	7
820	2	-398.8532866	7	18	7
819	2	-397.9537383	7	18	6
818	2	-380.6451355	7	18	5
817	2	-402.7287926	7	18	10
816	2	-401.8292442	7	18	9
815	2	-380.4540246	7	18	8
814	2	-185.0909311	7	18	11
827	1	-92.54546557	7	18	11
826	1	-190.2270123	7	18	8
825	1	-200.9146221	7	18	9
824	1	-201.3643963	7	18	10
823	1	-190.3225678	7	18	5
822	1	-198.9768691	7	18	6
821	1	-199.4266433	7	18	7
\.


--
-- Data for Name: ponderful_mcda_satisfaction_threshold; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_satisfaction_threshold (id, threshold_min, threshold_max, criteria_id_id, study_area_id, user_id) FROM stdin;
4	15	27	15	13	1
3	8	20	12	13	1
2	7	15	2	13	1
5	2500	55000	17	13	1
6	-6000	-450	18	13	1
\.


--
-- Data for Name: ponderful_mcda_scenario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_scenario (id, name, description) FROM stdin;
5	Utilisation des sols : SSP1, Changement climatique : SSP1	Un faible changement d'occupation des sols et de changement climatique
6	Utilisation des sols : SSP3, Changement climatique : SSP3	Un changement modéré d'occupation des sols et de changement climatique
7	Utilisation des sols : SSP5, Changement climatique : SSP5	Un fort changement d'occupation des sols et changement climatique
11	Utilisation des sols : Pas de changement, changement climatique : Pas de changement	L'utilisation des sols et le climat ne changeront pas
10	Utilisation des sols : Pas de changement, changement climatique : SSP5	L'utilisation des sols restera la même et un fort changement climatique
9	Utilisation des sols : Pas de changement, changement climatique : SSP3	L'utilisation des sols restera la même et un changement climatique modéré
8	Utilisation des sols : Pas de changement, changement climatique : SSP1	L'utilisation des sols restera inchangée et un faible changement climatique
\.


--
-- Data for Name: ponderful_mcda_scenario_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_scenario_user (id, analysis_run_id, scenario_type_id) FROM stdin;
37	52	8
38	54	10
39	56	8
40	57	8
41	58	8
42	59	8
43	60	8
44	61	11
45	62	5
46	63	5
47	64	11
48	65	6
49	66	11
50	72	5
51	73	6
52	74	5
53	75	7
54	76	6
55	77	5
56	79	9
57	80	5
58	81	5
59	91	5
60	93	5
61	94	11
62	99	6
63	100	8
64	101	11
65	102	8
66	104	10
67	106	6
68	107	7
69	110	8
70	110	8
71	112	8
72	113	7
73	114	8
74	115	5
75	118	11
76	119	11
77	120	11
78	121	11
79	122	11
80	123	11
81	124	9
82	125	11
83	126	10
84	127	8
85	127	11
86	128	11
87	130	8
88	131	11
89	132	9
90	132	11
91	132	11
92	132	10
93	133	9
94	134	11
95	135	11
96	136	11
97	137	11
98	138	11
99	139	10
100	140	11
101	141	11
102	142	11
103	143	11
104	144	11
105	145	11
106	145	11
107	146	11
108	147	11
109	147	11
110	153	10
111	155	5
112	161	11
113	165	10
114	166	11
115	173	11
116	174	10
117	176	11
118	180	11
119	183	11
120	185	11
121	186	11
122	237	9
123	240	11
124	284	10
157	317	10
158	318	8
159	319	8
160	320	7
161	321	9
162	324	9
163	325	5
164	327	7
165	329	11
166	331	9
167	332	11
168	335	11
169	345	10
170	347	10
171	348	10
172	349	9
205	384	7
206	386	10
207	430	11
208	431	11
209	432	11
210	433	8
211	434	10
212	436	11
213	439	11
214	440	11
215	441	11
216	442	11
217	443	8
218	444	11
219	445	11
252	445	8
253	446	5
254	447	9
287	481	11
288	481	5
289	483	9
290	484	11
323	518	11
324	519	11
325	524	11
326	528	11
327	529	6
328	531	9
329	529	6
330	530	9
331	531	9
332	532	10
333	535	9
334	536	9
335	536	9
336	538	9
337	538	9
338	537	11
339	539	5
340	538	9
341	540	11
342	538	9
343	537	11
344	541	10
345	541	5
346	543	9
347	544	9
348	544	9
349	544	9
350	543	10
351	545	10
352	543	11
353	543	11
354	548	8
355	549	9
356	551	11
357	552	10
358	552	11
359	552	11
360	555	11
361	556	11
362	561	11
363	562	11
364	563	11
\.


--
-- Data for Name: ponderful_mcda_studyarea; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ponderful_mcda_studyarea (id, landuseintensity, num_small_pond, num_avg_pond, num_big_pond, geom, user_id, name) FROM stdin;
13	low	30	0	0	0103000020E6100000010000000E000000C45A7C0A80A11A4066F9BA0CFF4747404AB3791C06A31A40AE9CBD33DA484740FBEB1516DC9F1A4074CE4F711C4A47401EE1B4E0459F1A405B41D3122B4B47408505F7031EB81A40A417B5FB554C4740295AB91798C51A40BC202235ED4A47403C4B901150D11A4028999CDA194A474002F4FBFECDCB1A40AB4198DBBD484740BFB67EFACFBA1A40FE63213A044847406CCF2C0950B31A40ACC77DAB75484740317898F6CDAD1A40C0EB33677D484740B30A9B012EA81A4001BF469220484740DDEA39E97DA31A40B3B45373B9474740C45A7C0A80A11A4066F9BA0CFF474740	1	Parc Jorat
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 72, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 2173, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 18, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 52, true);


--
-- Name: ponderful_mcda_action_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_action_types_id_seq', 11, true);


--
-- Name: ponderful_mcda_alternatives_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_alternatives_params_id_seq', 420, true);


--
-- Name: ponderful_mcda_analysisrun_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_analysisrun_id_seq', 564, true);


--
-- Name: ponderful_mcda_criteria_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_criteria_id_seq', 53, true);


--
-- Name: ponderful_mcda_criteria_params_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_criteria_params_id_seq', 1008, true);


--
-- Name: ponderful_mcda_customuser_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_customuser_groups_id_seq', 1, false);


--
-- Name: ponderful_mcda_customuser_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_customuser_id_seq', 16, true);


--
-- Name: ponderful_mcda_customuser_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_customuser_user_permissions_id_seq', 83, true);


--
-- Name: ponderful_mcda_mcda_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_mcda_result_id_seq', 7809, true);


--
-- Name: ponderful_mcda_modeling_result_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_modeling_result_id_seq', 827, true);


--
-- Name: ponderful_mcda_satisfaction_threshold_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_satisfaction_threshold_id_seq', 6, true);


--
-- Name: ponderful_mcda_scenario_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_scenario_id_seq', 11, true);


--
-- Name: ponderful_mcda_scenario_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_scenario_user_id_seq', 364, true);


--
-- Name: ponderful_mcda_studyarea_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ponderful_mcda_studyarea_id_seq', 17, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: ponderful_mcda_action_types ponderful_mcda_action_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_action_types
    ADD CONSTRAINT ponderful_mcda_action_types_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_alternatives_params ponderful_mcda_alternatives_params_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_alternatives_params
    ADD CONSTRAINT ponderful_mcda_alternatives_params_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_analysisrun ponderful_mcda_analysisrun_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_analysisrun
    ADD CONSTRAINT ponderful_mcda_analysisrun_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_criteria_params ponderful_mcda_criteria_params_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params
    ADD CONSTRAINT ponderful_mcda_criteria_params_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_criteria ponderful_mcda_criteria_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria
    ADD CONSTRAINT ponderful_mcda_criteria_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_customuser_groups ponderful_mcda_customuse_customuser_id_group_id_dbd16246_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_groups
    ADD CONSTRAINT ponderful_mcda_customuse_customuser_id_group_id_dbd16246_uniq UNIQUE (customuser_id, group_id);


--
-- Name: ponderful_mcda_customuser_user_permissions ponderful_mcda_customuse_customuser_id_permission_2e7a71b9_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_user_permissions
    ADD CONSTRAINT ponderful_mcda_customuse_customuser_id_permission_2e7a71b9_uniq UNIQUE (customuser_id, permission_id);


--
-- Name: ponderful_mcda_customuser_groups ponderful_mcda_customuser_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_groups
    ADD CONSTRAINT ponderful_mcda_customuser_groups_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_customuser ponderful_mcda_customuser_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser
    ADD CONSTRAINT ponderful_mcda_customuser_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_customuser_user_permissions ponderful_mcda_customuser_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_user_permissions
    ADD CONSTRAINT ponderful_mcda_customuser_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_customuser ponderful_mcda_customuser_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser
    ADD CONSTRAINT ponderful_mcda_customuser_username_key UNIQUE (username);


--
-- Name: ponderful_mcda_mcda_result ponderful_mcda_mcda_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result
    ADD CONSTRAINT ponderful_mcda_mcda_result_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_modeling_result ponderful_mcda_modeling_result_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_modeling_result
    ADD CONSTRAINT ponderful_mcda_modeling_result_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_satisfaction_threshold ponderful_mcda_satisfaction_threshold_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_satisfaction_threshold
    ADD CONSTRAINT ponderful_mcda_satisfaction_threshold_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_scenario ponderful_mcda_scenario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario
    ADD CONSTRAINT ponderful_mcda_scenario_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_scenario_user ponderful_mcda_scenario_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario_user
    ADD CONSTRAINT ponderful_mcda_scenario_user_pkey PRIMARY KEY (id);


--
-- Name: ponderful_mcda_studyarea ponderful_mcda_studyarea_name_26a49951_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_studyarea
    ADD CONSTRAINT ponderful_mcda_studyarea_name_26a49951_uniq UNIQUE (name);


--
-- Name: ponderful_mcda_studyarea ponderful_mcda_studyarea_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_studyarea
    ADD CONSTRAINT ponderful_mcda_studyarea_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: ponderful_mcda_alternatives_params_action_id_fd61a3c5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_alternatives_params_action_id_fd61a3c5 ON public.ponderful_mcda_alternatives_params USING btree (action_id);


--
-- Name: ponderful_mcda_alternatives_params_analysis_run_id_4df0f749; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_alternatives_params_analysis_run_id_4df0f749 ON public.ponderful_mcda_alternatives_params USING btree (analysis_run_id);


--
-- Name: ponderful_mcda_alternatives_params_user_id_03b6156c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_alternatives_params_user_id_03b6156c ON public.ponderful_mcda_alternatives_params USING btree (user_id);


--
-- Name: ponderful_mcda_analysisrun_user_id_9be24bf3; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_analysisrun_user_id_9be24bf3 ON public.ponderful_mcda_analysisrun USING btree (user_id);


--
-- Name: ponderful_mcda_criteria_params_analysis_run_id_a043a265; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_criteria_params_analysis_run_id_a043a265 ON public.ponderful_mcda_criteria_params USING btree (analysis_run_id);


--
-- Name: ponderful_mcda_criteria_params_criteria_id_id_0f3b1978; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_criteria_params_criteria_id_id_0f3b1978 ON public.ponderful_mcda_criteria_params USING btree (criteria_id);


--
-- Name: ponderful_mcda_criteria_params_study_area_id_7105138a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_criteria_params_study_area_id_7105138a ON public.ponderful_mcda_criteria_params USING btree (study_area_id);


--
-- Name: ponderful_mcda_criteria_params_user_id_e60a5e8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_criteria_params_user_id_e60a5e8f ON public.ponderful_mcda_criteria_params USING btree (user_id);


--
-- Name: ponderful_mcda_customuser__customuser_id_5d9dc6f6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_customuser__customuser_id_5d9dc6f6 ON public.ponderful_mcda_customuser_user_permissions USING btree (customuser_id);


--
-- Name: ponderful_mcda_customuser__permission_id_eac5ef51; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_customuser__permission_id_eac5ef51 ON public.ponderful_mcda_customuser_user_permissions USING btree (permission_id);


--
-- Name: ponderful_mcda_customuser_groups_customuser_id_f0f62490; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_customuser_groups_customuser_id_f0f62490 ON public.ponderful_mcda_customuser_groups USING btree (customuser_id);


--
-- Name: ponderful_mcda_customuser_groups_group_id_b88b0135; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_customuser_groups_group_id_b88b0135 ON public.ponderful_mcda_customuser_groups USING btree (group_id);


--
-- Name: ponderful_mcda_customuser_username_a8ddd675_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_customuser_username_a8ddd675_like ON public.ponderful_mcda_customuser USING btree (username varchar_pattern_ops);


--
-- Name: ponderful_mcda_mcda_result_analysis_run_id_9f623f43; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_mcda_result_analysis_run_id_9f623f43 ON public.ponderful_mcda_mcda_result USING btree (analysis_run_id);


--
-- Name: ponderful_mcda_mcda_result_criteria_id_d8819e44; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_mcda_result_criteria_id_d8819e44 ON public.ponderful_mcda_mcda_result USING btree (criteria_id);


--
-- Name: ponderful_mcda_mcda_result_scenario_id_8d2f866c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_mcda_result_scenario_id_8d2f866c ON public.ponderful_mcda_mcda_result USING btree (scenario_id);


--
-- Name: ponderful_mcda_mcda_result_user_id_99582e8f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_mcda_result_user_id_99582e8f ON public.ponderful_mcda_mcda_result USING btree (user_id);


--
-- Name: ponderful_mcda_modeling_result_action_id_326dc618; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_modeling_result_action_id_326dc618 ON public.ponderful_mcda_modeling_result USING btree (action_id);


--
-- Name: ponderful_mcda_modeling_result_criteria_id_5de3ea05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_modeling_result_criteria_id_5de3ea05 ON public.ponderful_mcda_modeling_result USING btree (criteria_id);


--
-- Name: ponderful_mcda_modeling_result_scenario_id_e24dbd96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_modeling_result_scenario_id_e24dbd96 ON public.ponderful_mcda_modeling_result USING btree (scenario_id);


--
-- Name: ponderful_mcda_satisfaction_threshold_criteria_id_id_6c5b8b2e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_satisfaction_threshold_criteria_id_id_6c5b8b2e ON public.ponderful_mcda_satisfaction_threshold USING btree (criteria_id_id);


--
-- Name: ponderful_mcda_satisfaction_threshold_study_area_id_79ab463f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_satisfaction_threshold_study_area_id_79ab463f ON public.ponderful_mcda_satisfaction_threshold USING btree (study_area_id);


--
-- Name: ponderful_mcda_satisfaction_threshold_user_id_327d0e05; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_satisfaction_threshold_user_id_327d0e05 ON public.ponderful_mcda_satisfaction_threshold USING btree (user_id);


--
-- Name: ponderful_mcda_scenario_user_analysis_run_id_038949c0; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_scenario_user_analysis_run_id_038949c0 ON public.ponderful_mcda_scenario_user USING btree (analysis_run_id);


--
-- Name: ponderful_mcda_scenario_user_scenario_id_66bc86da; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_scenario_user_scenario_id_66bc86da ON public.ponderful_mcda_scenario_user USING btree (scenario_type_id);


--
-- Name: ponderful_mcda_studyarea_geom_852d832d_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_studyarea_geom_852d832d_id ON public.ponderful_mcda_studyarea USING gist (geom);


--
-- Name: ponderful_mcda_studyarea_name_26a49951_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_studyarea_name_26a49951_like ON public.ponderful_mcda_studyarea USING btree (name varchar_pattern_ops);


--
-- Name: ponderful_mcda_studyarea_user_id_7ff18436; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ponderful_mcda_studyarea_user_id_7ff18436 ON public.ponderful_mcda_studyarea USING btree (user_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_alternatives_params ponderful_mcda_alter_action_id_fd61a3c5_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_alternatives_params
    ADD CONSTRAINT ponderful_mcda_alter_action_id_fd61a3c5_fk_ponderful FOREIGN KEY (action_id) REFERENCES public.ponderful_mcda_action_types(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_alternatives_params ponderful_mcda_alter_analysis_run_id_4df0f749_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_alternatives_params
    ADD CONSTRAINT ponderful_mcda_alter_analysis_run_id_4df0f749_fk_ponderful FOREIGN KEY (analysis_run_id) REFERENCES public.ponderful_mcda_analysisrun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_alternatives_params ponderful_mcda_alter_user_id_03b6156c_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_alternatives_params
    ADD CONSTRAINT ponderful_mcda_alter_user_id_03b6156c_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_analysisrun ponderful_mcda_analy_user_id_9be24bf3_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_analysisrun
    ADD CONSTRAINT ponderful_mcda_analy_user_id_9be24bf3_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_criteria_params ponderful_mcda_crite_analysis_run_id_a043a265_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params
    ADD CONSTRAINT ponderful_mcda_crite_analysis_run_id_a043a265_fk_ponderful FOREIGN KEY (analysis_run_id) REFERENCES public.ponderful_mcda_analysisrun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_criteria_params ponderful_mcda_crite_criteria_id_f51cd367_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params
    ADD CONSTRAINT ponderful_mcda_crite_criteria_id_f51cd367_fk_ponderful FOREIGN KEY (criteria_id) REFERENCES public.ponderful_mcda_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_criteria_params ponderful_mcda_crite_study_area_id_7105138a_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params
    ADD CONSTRAINT ponderful_mcda_crite_study_area_id_7105138a_fk_ponderful FOREIGN KEY (study_area_id) REFERENCES public.ponderful_mcda_studyarea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_criteria_params ponderful_mcda_crite_user_id_e60a5e8f_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_criteria_params
    ADD CONSTRAINT ponderful_mcda_crite_user_id_e60a5e8f_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_customuser_user_permissions ponderful_mcda_custo_customuser_id_5d9dc6f6_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_user_permissions
    ADD CONSTRAINT ponderful_mcda_custo_customuser_id_5d9dc6f6_fk_ponderful FOREIGN KEY (customuser_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_customuser_groups ponderful_mcda_custo_customuser_id_f0f62490_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_groups
    ADD CONSTRAINT ponderful_mcda_custo_customuser_id_f0f62490_fk_ponderful FOREIGN KEY (customuser_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_customuser_groups ponderful_mcda_custo_group_id_b88b0135_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_groups
    ADD CONSTRAINT ponderful_mcda_custo_group_id_b88b0135_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_customuser_user_permissions ponderful_mcda_custo_permission_id_eac5ef51_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_customuser_user_permissions
    ADD CONSTRAINT ponderful_mcda_custo_permission_id_eac5ef51_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_mcda_result ponderful_mcda_mcda__analysis_run_id_9f623f43_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result
    ADD CONSTRAINT ponderful_mcda_mcda__analysis_run_id_9f623f43_fk_ponderful FOREIGN KEY (analysis_run_id) REFERENCES public.ponderful_mcda_analysisrun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_mcda_result ponderful_mcda_mcda__criteria_id_d8819e44_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result
    ADD CONSTRAINT ponderful_mcda_mcda__criteria_id_d8819e44_fk_ponderful FOREIGN KEY (criteria_id) REFERENCES public.ponderful_mcda_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_mcda_result ponderful_mcda_mcda__scenario_id_8d2f866c_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result
    ADD CONSTRAINT ponderful_mcda_mcda__scenario_id_8d2f866c_fk_ponderful FOREIGN KEY (scenario_id) REFERENCES public.ponderful_mcda_scenario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_mcda_result ponderful_mcda_mcda__user_id_99582e8f_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_mcda_result
    ADD CONSTRAINT ponderful_mcda_mcda__user_id_99582e8f_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_modeling_result ponderful_mcda_model_action_id_326dc618_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_modeling_result
    ADD CONSTRAINT ponderful_mcda_model_action_id_326dc618_fk_ponderful FOREIGN KEY (action_id) REFERENCES public.ponderful_mcda_action_types(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_modeling_result ponderful_mcda_model_criteria_id_5de3ea05_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_modeling_result
    ADD CONSTRAINT ponderful_mcda_model_criteria_id_5de3ea05_fk_ponderful FOREIGN KEY (criteria_id) REFERENCES public.ponderful_mcda_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_modeling_result ponderful_mcda_model_scenario_id_e24dbd96_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_modeling_result
    ADD CONSTRAINT ponderful_mcda_model_scenario_id_e24dbd96_fk_ponderful FOREIGN KEY (scenario_id) REFERENCES public.ponderful_mcda_scenario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_satisfaction_threshold ponderful_mcda_satis_criteria_id_id_6c5b8b2e_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_satisfaction_threshold
    ADD CONSTRAINT ponderful_mcda_satis_criteria_id_id_6c5b8b2e_fk_ponderful FOREIGN KEY (criteria_id_id) REFERENCES public.ponderful_mcda_criteria(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_satisfaction_threshold ponderful_mcda_satis_study_area_id_79ab463f_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_satisfaction_threshold
    ADD CONSTRAINT ponderful_mcda_satis_study_area_id_79ab463f_fk_ponderful FOREIGN KEY (study_area_id) REFERENCES public.ponderful_mcda_studyarea(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_satisfaction_threshold ponderful_mcda_satis_user_id_327d0e05_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_satisfaction_threshold
    ADD CONSTRAINT ponderful_mcda_satis_user_id_327d0e05_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_scenario_user ponderful_mcda_scena_analysis_run_id_038949c0_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario_user
    ADD CONSTRAINT ponderful_mcda_scena_analysis_run_id_038949c0_fk_ponderful FOREIGN KEY (analysis_run_id) REFERENCES public.ponderful_mcda_analysisrun(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_scenario_user ponderful_mcda_scena_scenario_type_id_379555d6_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_scenario_user
    ADD CONSTRAINT ponderful_mcda_scena_scenario_type_id_379555d6_fk_ponderful FOREIGN KEY (scenario_type_id) REFERENCES public.ponderful_mcda_scenario(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: ponderful_mcda_studyarea ponderful_mcda_study_user_id_7ff18436_fk_ponderful; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ponderful_mcda_studyarea
    ADD CONSTRAINT ponderful_mcda_study_user_id_7ff18436_fk_ponderful FOREIGN KEY (user_id) REFERENCES public.ponderful_mcda_customuser(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

