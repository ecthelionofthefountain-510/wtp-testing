--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 17.4 (Homebrew)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- Name: chat_messages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_messages (
    id integer NOT NULL,
    sender character varying(100) NOT NULL,
    message text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    chat_token text
);


ALTER TABLE public.chat_messages OWNER TO postgres;

--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ChatMessages_Id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ChatMessages_Id_seq" OWNER TO postgres;

--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ChatMessages_Id_seq" OWNED BY public.chat_messages.id;


--
-- Name: fordon_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fordon_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    reg_nummer text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.fordon_forms OWNER TO postgres;

--
-- Name: FordonForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FordonForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."FordonForms_Id_seq" OWNER TO postgres;

--
-- Name: FordonForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FordonForms_Id_seq" OWNED BY public.fordon_forms."Id";


--
-- Name: forsakrings_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.forsakrings_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    insurance_type text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.forsakrings_forms OWNER TO postgres;

--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ForsakringsForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."ForsakringsForms_Id_seq" OWNER TO postgres;

--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ForsakringsForms_Id_seq" OWNED BY public.forsakrings_forms."Id";


--
-- Name: role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role (
    id bigint NOT NULL,
    company_role character varying NOT NULL
);


ALTER TABLE public.role OWNER TO postgres;

--
-- Name: Role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Role_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Role_id_seq" OWNER TO postgres;

--
-- Name: Role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Role_id_seq" OWNED BY public.role.id;


--
-- Name: tele_forms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tele_forms (
    "Id" integer NOT NULL,
    first_name text NOT NULL,
    email text NOT NULL,
    service_type text NOT NULL,
    issue_type text NOT NULL,
    message text NOT NULL,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone NOT NULL,
    is_chat_active boolean NOT NULL,
    company_type text DEFAULT ''::text NOT NULL
);


ALTER TABLE public.tele_forms OWNER TO postgres;

--
-- Name: TeleForms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."TeleForms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."TeleForms_Id_seq" OWNER TO postgres;

--
-- Name: TeleForms_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."TeleForms_Id_seq" OWNED BY public.tele_forms."Id";


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    "Id" integer NOT NULL,
    first_name character varying(50) NOT NULL,
    password character varying(100) NOT NULL,
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    company character varying(50) DEFAULT ''::character varying NOT NULL,
    role_id smallint,
    email character varying(255) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: Users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Users_Id_seq" OWNER TO postgres;

--
-- Name: Users_Id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Users_Id_seq" OWNED BY public.users."Id";


--
-- Name: chat_ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.chat_ratings (
    id integer NOT NULL,
    chat_token text NOT NULL,
    rating integer,
    feedback text,
    submitted_at timestamp without time zone DEFAULT now(),
    CONSTRAINT chat_ratings_rating_check CHECK (((rating >= 1) AND (rating <= 5)))
);


ALTER TABLE public.chat_ratings OWNER TO postgres;

--
-- Name: dynamicforms; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dynamicforms (
    id integer NOT NULL,
    formtype character varying(50) NOT NULL,
    firstname character varying(100) NOT NULL,
    companytype character varying(100) NOT NULL,
    email character varying(255) NOT NULL,
    fields jsonb NOT NULL,
    message text,
    chattoken character varying(100) NOT NULL,
    submittedat timestamp without time zone NOT NULL,
    ischatactive boolean DEFAULT true NOT NULL
);


ALTER TABLE public.dynamicforms OWNER TO postgres;

--
-- Name: admin_tickets; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.admin_tickets AS
 SELECT cr.chat_token,
    cr.rating,
    cr.feedback,
    u.first_name
   FROM (public.chat_ratings cr
     JOIN public.users u ON (((u.email)::text = ( SELECT all_forms.email
           FROM ( SELECT fordon_forms.email,
                    fordon_forms.chat_token
                   FROM public.fordon_forms
                UNION ALL
                 SELECT forsakrings_forms.email,
                    forsakrings_forms.chat_token
                   FROM public.forsakrings_forms
                UNION ALL
                 SELECT tele_forms.email,
                    tele_forms.chat_token
                   FROM public.tele_forms
                UNION ALL
                 SELECT dynamicforms.email,
                    cr.chat_token
                   FROM public.dynamicforms) all_forms
          WHERE (all_forms.chat_token = cr.chat_token)
         LIMIT 1))));


ALTER VIEW public.admin_tickets OWNER TO postgres;

--
-- Name: archived_tickets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.archived_tickets (
    id integer NOT NULL,
    original_id integer,
    original_table text,
    form_type text NOT NULL,
    first_name text,
    email text,
    issue_type text,
    message text,
    chat_token text NOT NULL,
    submitted_at timestamp with time zone,
    resolved_at timestamp with time zone,
    company_type text,
    resolution_notes text,
    service_type text,
    reg_nummer text,
    insurance_type text
);


ALTER TABLE public.archived_tickets OWNER TO postgres;

--
-- Name: archived_tickets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.archived_tickets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.archived_tickets_id_seq OWNER TO postgres;

--
-- Name: archived_tickets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.archived_tickets_id_seq OWNED BY public.archived_tickets.id;


--
-- Name: chat_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.chat_ratings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.chat_ratings_id_seq OWNER TO postgres;

--
-- Name: chat_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.chat_ratings_id_seq OWNED BY public.chat_ratings.id;


--
-- Name: dynamicforms_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dynamicforms_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dynamicforms_id_seq OWNER TO postgres;

--
-- Name: dynamicforms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dynamicforms_id_seq OWNED BY public.dynamicforms.id;


--
-- Name: fordon_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.fordon_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."fordon_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: forsakrings_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.forsakrings_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."forsakrings_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: initial_form_messages; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.initial_form_messages AS
 SELECT ff.chat_token,
    ff.first_name AS sender,
    ff.message,
    ff.submitted_at,
    ff.issue_type,
    ff.email,
    'Fordonsservice'::text AS form_type
   FROM public.fordon_forms ff
  WHERE (ff.is_chat_active = true)
UNION ALL
 SELECT tf.chat_token,
    tf.first_name AS sender,
    tf.message,
    tf.submitted_at,
    tf.issue_type,
    tf.email,
    'Tele/Bredband'::text AS form_type
   FROM public.tele_forms tf
  WHERE (tf.is_chat_active = true)
UNION ALL
 SELECT f.chat_token,
    f.first_name AS sender,
    f.message,
    f.submitted_at,
    f.issue_type,
    f.email,
    'Försäkringsärenden'::text AS form_type
   FROM public.forsakrings_forms f
  WHERE (f.is_chat_active = true);


ALTER VIEW public.initial_form_messages OWNER TO postgres;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.role ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tele_forms_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.tele_forms ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."tele_forms_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users_Id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.users ALTER COLUMN "Id" ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public."users_Id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: archived_tickets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archived_tickets ALTER COLUMN id SET DEFAULT nextval('public.archived_tickets_id_seq'::regclass);


--
-- Name: chat_messages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages ALTER COLUMN id SET DEFAULT nextval('public."ChatMessages_Id_seq"'::regclass);


--
-- Name: chat_ratings id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_ratings ALTER COLUMN id SET DEFAULT nextval('public.chat_ratings_id_seq'::regclass);


--
-- Name: dynamicforms id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms ALTER COLUMN id SET DEFAULT nextval('public.dynamicforms_id_seq'::regclass);


--
-- Data for Name: archived_tickets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.archived_tickets (id, original_id, original_table, form_type, first_name, email, issue_type, message, chat_token, submitted_at, resolved_at, company_type, resolution_notes, service_type, reg_nummer, insurance_type) FROM stdin;
15	\N	\N	Fordonsservice	Ville	ville.eliasson99@gmail.com	Ville - Fordonsservice	test2	51cedfa1-83b4-46ab-9a61-32671be6d84d	2025-03-11 14:59:41.056198+01	2025-03-13 10:37:35.250546+01		\N		\N	\N
16	\N	\N	Fordonsservice	Kajsa	shaabaan_@hotmail.com	Kajsa - Fordonsservice	Min motor har lagt av	8f18cf90-57c1-4e4c-bd85-370bc07428e1	2025-03-12 11:08:49.417935+01	2025-03-13 11:08:49.417938+01		Closed from dashboard		\N	\N
17	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	26f10f19-4da8-444d-adb5-7f92249dd78f	2025-03-12 12:26:17.919047+01	2025-03-13 12:26:17.91905+01		Closed from dashboard		\N	\N
18	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	qwerty	9ef97352-21fb-471c-b84a-d1a2c33630b2	2025-03-12 12:30:33.300514+01	2025-03-13 12:30:33.300517+01		Closed from dashboard		\N	\N
19	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	26f10f19-4da8-444d-adb5-7f92249dd78f	2025-03-12 12:43:14.838161+01	2025-03-13 12:43:14.838167+01		Closed from dashboard		\N	\N
20	1	initial_form_messages	Tele/Bredband	Sebbe	sebbe_97@outlook.com	Sebbe - Tele/Bredband	test	f3d71325-de6f-4e14-ace9-4eec711d2cc2	2025-03-12 12:46:12.125167+01	2025-03-13 12:46:12.12517+01		Closed from dashboard		\N	\N
21	1	initial_form_messages	Fordonsservice	test3	shaabaan_@hotmail.com	test3 - Fordonsservice	test	2a9924d3-fb94-4fcc-ac75-86740a259673	2025-03-12 13:05:14.263141+01	2025-03-13 13:05:14.263144+01		Closed from dashboard		\N	\N
22	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	hjälp mig 	269a695d-2b24-4ce2-afab-8f6cb7b370fc	2025-03-12 14:11:44.950864+01	2025-03-13 14:11:44.950867+01		Closed from dashboard		\N	\N
23	1	initial_form_messages	Tele/Bredband	Sebastian	sebbe_97@outlook.com	Sebastian - Tele/Bredband	hjälp mig	be3f79da-4e76-495a-a0c1-e913e850214f	2025-03-12 14:13:31.777068+01	2025-03-13 14:13:31.77707+01		Closed from dashboard		\N	\N
24	1	initial_form_messages	Tele/Bredband	Kevin	maadridista@gmail.com	Kevin - Tele/Bredband	testing ...	8d5adaa4-1eed-47ac-8530-775d163db4b7	2025-03-12 14:19:57.987995+01	2025-03-13 14:19:57.988008+01		Closed from dashboard		\N	\N
27	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	hjälp mig 	269a695d-2b24-4ce2-afab-8f6cb7b370fc	2025-03-13 13:38:39.277333+01	2025-03-14 13:38:39.277341+01		Closed from dashboard		\N	\N
28	1	initial_form_messages	Fordonsservice	testing	testing8@gmail.com	testing - Fordonsservice	321	fe177498-183d-4391-9c80-c62e9afeffdf	2025-03-13 15:13:14.317201+01	2025-03-14 15:13:14.317204+01		Closed from dashboard		\N	\N
29	1	initial_form_messages	Tele/Bredband	Kalle	shaabaan_@hotmail.com	Kalle - Tele/Bredband	hjälp mig!!	126897f3-92e7-410f-b04c-114f70ca6bc9	2025-03-16 11:23:39.501063+01	2025-03-17 11:23:39.501066+01		Closed from dashboard		\N	\N
30	1	initial_form_messages	Tele/Bredband	Pontus	shaabaan_@hotmail.com	Pontus - Tele/Bredband	Min faktura är för dyr	b93c9d1f-8043-4541-92e0-f01f64436928	2025-03-17 14:38:11.287765+01	2025-03-18 14:38:11.287774+01		Closed from dashboard		\N	\N
31	1	initial_form_messages	Tele/Bredband	Putte	shaabaan_@hotmail.com	Putte - Tele/Bredband	Hej min faktura är för dyr	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022	2025-03-23 20:23:13.100143+01	2025-03-24 20:23:13.100149+01		Closed from dashboard		\N	\N
32	1	initial_form_messages	Fordonsservice	Löken	löken.test@gmail.com	Garantiärende	Bilen låter konstigt när jag startar den.	5cc2b330-9b56-4fe9-8872-6da640a91bfa	2025-04-06 10:47:45.467994+02	2025-04-07 10:47:45.46814+02	Fordonsservice	Closed from dashboard		\N	\N
34	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-08 13:03:38.644746+02	2025-04-09 13:03:38.644754+02		Closed from dashboard		\N	\N
35	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 10:48:05.653944+02	2025-04-11 10:48:05.653958+02		Closed from dashboard		\N	\N
36	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 10:50:47.755217+02	2025-04-11 10:50:47.755242+02		Closed from dashboard		\N	\N
37	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 10:55:23.50415+02	2025-04-11 10:55:23.504161+02		Closed from dashboard		\N	\N
38	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 10:56:44.814102+02	2025-04-11 10:56:44.814103+02		Closed from dashboard		\N	\N
39	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 11:03:01.391887+02	2025-04-11 11:03:01.391899+02		Closed from dashboard		\N	\N
40	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 11:04:56.455181+02	2025-04-11 11:04:56.455185+02		Closed from dashboard		\N	\N
41	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 11:07:50.771073+02	2025-04-11 11:07:50.771089+02		Closed from dashboard		\N	\N
42	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 12:49:06.549122+02	2025-04-11 12:49:06.549138+02		Closed from dashboard		\N	\N
43	1	initial_form_messages	Tele/Bredband	Oskar	shaabaan_@hotmail.com	Oskar - Tele/Bredband	test	093c334e-2973-4218-b663-40689b07452e	2025-04-10 12:55:27.658918+02	2025-04-11 12:55:27.658935+02		Closed from dashboard		\N	\N
44	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 13:02:48.576446+02	2025-04-11 13:02:48.576467+02		Closed from dashboard		\N	\N
45	1	initial_form_messages	Tele/Bredband	Shaban	shaabaan_@hotmail.com	Shaban - Tele/Bredband	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-04-10 13:05:20.335385+02	2025-04-11 13:05:20.335412+02		Closed from dashboard		\N	\N
46	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:11:26.09128+02	2025-04-11 13:11:26.091312+02		Closed from dashboard		\N	\N
47	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:12:53.397968+02	2025-04-11 13:12:53.398008+02		Closed from dashboard		\N	\N
48	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:13:17.401695+02	2025-04-11 13:13:17.401698+02		Closed from dashboard		\N	\N
49	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:34:26.148076+02	2025-04-11 13:34:26.148085+02		Closed from dashboard		\N	\N
50	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:37:17.349982+02	2025-04-11 13:37:17.349985+02		Closed from dashboard		\N	\N
51	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 13:38:28.863475+02	2025-04-11 13:38:28.863477+02		Closed from dashboard		\N	\N
52	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 14:16:44.914225+02	2025-04-11 14:16:44.91424+02		Closed from dashboard		\N	\N
53	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 16:14:25.127554+02	2025-04-11 16:14:25.127558+02		Closed from dashboard		\N	\N
54	1	initial_form_messages	Tele/Bredband	Ville	ville.eliasson99@gmail.com	Ville - Tele/Bredband	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-04-10 16:15:40.822847+02	2025-04-11 16:15:40.822849+02		Closed from dashboard		\N	\N
\.


--
-- Data for Name: chat_messages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_messages (id, sender, message, submitted_at, chat_token) FROM stdin;
1	Max	jag vill inte betala pengar.	2025-03-06 16:40:42.125928+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
2	Support	Skit i det då	2025-03-06 16:42:17.949626+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
3	Support	Nä ja vill inte skita i det	2025-03-06 16:42:29.61804+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
4	Support	gör inte det då	2025-03-06 16:42:38.252898+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
5	Support	jo	2025-03-06 16:42:45.663309+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
6	Sebbe	test	2025-03-07 09:24:16.326936+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
7	Support	tjena mister	2025-03-07 09:25:23.203778+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
8	Support	test1	2025-03-07 09:25:42.816498+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
9	Support	2	2025-03-07 09:25:43.934082+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
10	Support	3	2025-03-07 09:25:44.553525+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
11	Support	4	2025-03-07 09:25:45.250256+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
12	Support	5	2025-03-07 09:25:46.000529+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
13	Support	6	2025-03-07 09:25:46.6961+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
14	Support	7	2025-03-07 09:25:47.326373+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
15	Support	8	2025-03-07 09:25:47.922348+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
16	Support	9	2025-03-07 09:25:48.541107+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
17	Support	10	2025-03-07 09:25:50.439403+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
18	Support	11	2025-03-07 09:25:51.306309+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
19	Support	12	2025-03-07 09:25:51.947903+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
20	Support	13	2025-03-07 09:25:52.632071+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
21	Sebbe	test	2025-03-07 09:40:43.432123+01	26f10f19-4da8-444d-adb5-7f92249dd78f
22	Support	1	2025-03-07 10:33:37.378636+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
23	Support	2	2025-03-07 10:33:48.776901+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
24	Support	3	2025-03-07 10:33:53.610332+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
25	Support	4	2025-03-07 10:33:53.997311+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
26	Support	5	2025-03-07 10:33:54.436103+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
27	Support	6	2025-03-07 10:33:54.749892+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
28	Support	7	2025-03-07 10:33:55.588238+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
29	Support	8	2025-03-07 10:33:55.946663+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
30	Support	9	2025-03-07 10:33:56.54285+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
31	Support	10	2025-03-07 10:33:57.486123+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
32	Support	11	2025-03-07 10:34:03.593701+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
33	Support	12	2025-03-07 10:34:04.402294+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
34	Support	13	2025-03-07 10:34:04.928572+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
35	Support	14	2025-03-07 10:34:05.349283+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
36	Support	15	2025-03-07 10:34:05.843289+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
37	Ville	test	2025-03-07 10:36:11.376561+01	0131b2dc-29f7-418e-9064-c490463f48e2
38	Support	1	2025-03-07 10:36:27.674681+01	0131b2dc-29f7-418e-9064-c490463f48e2
39	Ville	qwerty	2025-03-07 11:19:45.83401+01	9ef97352-21fb-471c-b84a-d1a2c33630b2
40	Support	123	2025-03-07 11:19:59.713521+01	9ef97352-21fb-471c-b84a-d1a2c33630b2
41	Ville	hjälp mig 	2025-03-07 13:16:55.206413+01	269a695d-2b24-4ce2-afab-8f6cb7b370fc
42	Ville	hjälp mig 2	2025-03-07 13:18:13.752398+01	fbda28b2-db2d-4606-aed7-6637c085332c
43	Sebastian	hjälp mig	2025-03-07 13:20:02.985099+01	be3f79da-4e76-495a-a0c1-e913e850214f
44	Ville	12345	2025-03-07 13:23:56.53387+01	be47881c-cd53-4e25-96dd-20cd223f2420
45	testshaban	test test test	2025-03-07 13:24:14.871478+01	a6bb745c-9a15-475a-87f0-801434651f0f
46	Support	1	2025-03-07 13:24:25.996039+01	fbda28b2-db2d-4606-aed7-6637c085332c
47	Support	2	2025-03-07 13:24:26.273911+01	fbda28b2-db2d-4606-aed7-6637c085332c
48	Support	3	2025-03-07 13:24:26.557096+01	fbda28b2-db2d-4606-aed7-6637c085332c
49	Support	4	2025-03-07 13:24:26.902601+01	fbda28b2-db2d-4606-aed7-6637c085332c
50	Support	56	2025-03-07 13:24:27.462203+01	fbda28b2-db2d-4606-aed7-6637c085332c
51	Support	7	2025-03-07 13:24:28.030888+01	fbda28b2-db2d-4606-aed7-6637c085332c
52	Support	8	2025-03-07 13:24:28.67972+01	fbda28b2-db2d-4606-aed7-6637c085332c
53	Support	9	2025-03-07 13:24:29.063967+01	fbda28b2-db2d-4606-aed7-6637c085332c
54	Support	0	2025-03-07 13:24:29.612647+01	fbda28b2-db2d-4606-aed7-6637c085332c
55	Support	10	2025-03-07 13:24:31.002317+01	fbda28b2-db2d-4606-aed7-6637c085332c
56	Support	12	2025-03-07 13:24:31.48331+01	fbda28b2-db2d-4606-aed7-6637c085332c
57	Support	1	2025-03-07 13:24:32.122649+01	a6bb745c-9a15-475a-87f0-801434651f0f
58	Support	1	2025-03-07 13:24:32.179288+01	fbda28b2-db2d-4606-aed7-6637c085332c
59	Support	2	2025-03-07 13:24:32.826942+01	a6bb745c-9a15-475a-87f0-801434651f0f
60	Support	12	2025-03-07 13:24:32.618334+01	fbda28b2-db2d-4606-aed7-6637c085332c
61	Support	3	2025-03-07 13:24:33.4505+01	a6bb745c-9a15-475a-87f0-801434651f0f
62	Support	14	2025-03-07 13:24:33.261827+01	fbda28b2-db2d-4606-aed7-6637c085332c
63	Support	4	2025-03-07 13:24:34.174086+01	a6bb745c-9a15-475a-87f0-801434651f0f
64	Support	51	2025-03-07 13:24:34.149816+01	fbda28b2-db2d-4606-aed7-6637c085332c
65	Support	5	2025-03-07 13:24:34.757745+01	a6bb745c-9a15-475a-87f0-801434651f0f
66	Support	6	2025-03-07 13:24:35.126503+01	fbda28b2-db2d-4606-aed7-6637c085332c
67	Support	26	2025-03-07 13:24:35.506807+01	fbda28b2-db2d-4606-aed7-6637c085332c
68	Support	6	2025-03-07 13:24:36.049854+01	a6bb745c-9a15-475a-87f0-801434651f0f
69	Support	7	2025-03-07 13:24:36.686376+01	a6bb745c-9a15-475a-87f0-801434651f0f
70	Support	8	2025-03-07 13:24:37.421993+01	a6bb745c-9a15-475a-87f0-801434651f0f
71	Support	9	2025-03-07 13:24:38.118582+01	a6bb745c-9a15-475a-87f0-801434651f0f
72	Support	10	2025-03-07 13:24:38.886606+01	a6bb745c-9a15-475a-87f0-801434651f0f
73	Support	11	2025-03-07 13:24:39.669483+01	a6bb745c-9a15-475a-87f0-801434651f0f
74	Support	12	2025-03-07 13:24:40.397694+01	a6bb745c-9a15-475a-87f0-801434651f0f
75	Support	13	2025-03-07 13:24:41.015186+01	a6bb745c-9a15-475a-87f0-801434651f0f
76	Support	45	2025-03-07 13:24:41.925325+01	a6bb745c-9a15-475a-87f0-801434651f0f
77	Support	14	2025-03-07 13:24:43.982163+01	a6bb745c-9a15-475a-87f0-801434651f0f
78	Support	15	2025-03-07 13:24:44.790791+01	a6bb745c-9a15-475a-87f0-801434651f0f
79	Support	16	2025-03-07 13:24:45.46607+01	a6bb745c-9a15-475a-87f0-801434651f0f
80	Support	17	2025-03-07 13:24:46.577675+01	a6bb745c-9a15-475a-87f0-801434651f0f
81	Support	18	2025-03-07 13:24:47.657357+01	a6bb745c-9a15-475a-87f0-801434651f0f
82	Support	19	2025-03-07 13:24:48.503029+01	a6bb745c-9a15-475a-87f0-801434651f0f
83	Support	20	2025-03-07 13:24:49.194004+01	a6bb745c-9a15-475a-87f0-801434651f0f
84	Support	test1	2025-03-07 13:34:03.638696+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
85	Support	test2	2025-03-07 13:34:09.755129+01	f3d71325-de6f-4e14-ace9-4eec711d2cc2
86	Support	test3	2025-03-07 13:34:15.571387+01	0131b2dc-29f7-418e-9064-c490463f48e2
87	Kajsa	Min motor har lagt av	2025-03-07 13:39:55.027154+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
88	Support	När gjorde den det?	2025-03-07 13:40:20.905492+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
89	Support	1	2025-03-07 13:45:39.939328+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
90	Support	2	2025-03-07 13:45:40.350028+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
91	Support	3	2025-03-07 13:45:40.73439+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
92	Support	4	2025-03-07 13:45:41.454788+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
93	Support	5	2025-03-07 13:45:41.887103+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
94	Support	6	2025-03-07 13:45:42.28817+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
95	Support	74	2025-03-07 13:45:42.860435+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
96	Support	8	2025-03-07 13:45:43.740766+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
97	Support	9	2025-03-07 13:45:44.238359+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
98	Support	10	2025-03-07 13:45:44.794861+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
99	Support	11	2025-03-07 13:45:45.321475+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
100	Support	12	2025-03-07 13:45:45.872736+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
101	Support	13	2025-03-07 13:45:46.55964+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
102	Support	14	2025-03-07 13:45:47.374519+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
103	Support	15	2025-03-07 13:45:47.964267+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
104	Support	16	2025-03-07 13:45:48.652422+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
105	Support	17	2025-03-07 13:45:49.406981+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
106	Support	18	2025-03-07 13:45:49.941757+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
107	Support	19	2025-03-07 13:45:52.165674+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
108	Support	20	2025-03-07 13:45:52.935123+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
109	Support	1	2025-03-10 10:00:24.987159+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
110	Support	2	2025-03-10 10:00:25.533781+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
111	Support	3	2025-03-10 10:00:26.342048+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
112	Support	4	2025-03-10 10:00:27.085817+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
113	Support	5	2025-03-10 10:00:27.62788+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
114	Support	6	2025-03-10 10:00:28.207417+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
115	Support	7	2025-03-10 10:00:28.936772+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
116	Support	8	2025-03-10 10:00:29.639403+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
117	Support	9	2025-03-10 10:00:30.243614+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
118	Support	10	2025-03-10 10:00:31.315772+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
119	Support	11	2025-03-10 10:00:32.413011+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
120	Support	12	2025-03-10 10:00:33.539993+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
121	Support	13	2025-03-10 10:00:35.078776+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
122	Kevin	testing ...	2025-03-10 10:52:05.416422+01	8d5adaa4-1eed-47ac-8530-775d163db4b7
123	Support	hej	2025-03-10 10:53:50.93432+01	8d5adaa4-1eed-47ac-8530-775d163db4b7
124	Support	🙂	2025-03-10 11:07:41.936189+01	8d5adaa4-1eed-47ac-8530-775d163db4b7
125	Support	ads	2025-03-10 11:38:11.341444+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
126	test	test	2025-03-10 15:27:00.865745+01	5c2350a8-c839-44a6-933d-2a76dfdc8823
127	SHABAN	test	2025-03-11 10:25:54.590619+01	af993dea-60f8-44a6-b00f-995a459c83b3
128	testesttest	test	2025-03-11 10:38:39.070898+01	7b36d71b-6ba4-4bbc-bdb1-3d86aa4225bd
129	test3	test	2025-03-11 10:38:59.915701+01	2a9924d3-fb94-4fcc-ac75-86740a259673
130	test4	test	2025-03-11 10:40:27.806688+01	6a61e316-feb1-45fb-8940-bcbf3a3e2590
131	Martin	test	2025-03-11 11:35:19.429965+01	f7b5b7ba-1375-4d89-abcc-ddda172b9c53
132	Ville	test	2025-03-11 13:43:05.282214+01	80ed8c7f-7ad1-4322-a6ef-c2b6f356b623
133	Ville	test2	2025-03-11 13:59:41.056198+01	51cedfa1-83b4-46ab-9a61-32671be6d84d
134	Ville	123	2025-03-11 14:02:44.478051+01	6b582888-6d5a-47ee-b7dd-a9fc7829956a
135	Ville	12345	2025-03-11 14:20:34.887069+01	cb9b72c0-8086-4360-9ca6-1e9269273c85
136	Ville	321	2025-03-11 14:23:15.607046+01	becd306d-4a72-4e4e-9a69-77a3357b8e7a
137	Ville	test100	2025-03-11 14:36:25.799714+01	1a936b00-0ac4-4073-b824-63f99d6cf614
138	Support	hej där	2025-03-11 14:37:27.725109+01	1a936b00-0ac4-4073-b824-63f99d6cf614
139	Support	1	2025-03-11 14:37:45.511101+01	1a936b00-0ac4-4073-b824-63f99d6cf614
140	Support	2	2025-03-11 14:37:58.805415+01	1a936b00-0ac4-4073-b824-63f99d6cf614
141	Support	3	2025-03-11 14:38:02.651214+01	1a936b00-0ac4-4073-b824-63f99d6cf614
142	Support	4	2025-03-11 14:43:11.629121+01	1a936b00-0ac4-4073-b824-63f99d6cf614
143	Support	5	2025-03-11 14:43:17.768383+01	1a936b00-0ac4-4073-b824-63f99d6cf614
144	Support	6	2025-03-11 14:44:47.65512+01	1a936b00-0ac4-4073-b824-63f99d6cf614
145	Shaban	test test test	2025-03-11 14:45:51.501656+01	77409ef6-b2a9-45a1-b71f-08c1c868597e
146	Support	Hej	2025-03-11 14:46:45.889375+01	77409ef6-b2a9-45a1-b71f-08c1c868597e
147	Ville	123	2025-03-11 15:01:40.027985+01	9cd1cdb3-5f55-4a4a-83e3-e2dcd94ab27f
148	Support	hejsan	2025-03-11 15:02:50.257945+01	9cd1cdb3-5f55-4a4a-83e3-e2dcd94ab27f
149	Ville	test1000	2025-03-11 15:26:55.115993+01	54b8124e-c3f2-4087-b668-949b24a2921d
150	Support	2	2025-03-11 15:27:17.368776+01	54b8124e-c3f2-4087-b668-949b24a2921d
151	Ville	321	2025-03-11 15:34:24.605894+01	5dd5d40f-dc41-493e-ac40-4263c47b91b1
152	Support	123	2025-03-11 15:34:39.670285+01	5dd5d40f-dc41-493e-ac40-4263c47b91b1
153	Support	1	2025-03-11 15:36:38.718478+01	5dd5d40f-dc41-493e-ac40-4263c47b91b1
154	Support	2	2025-03-11 15:36:38.932631+01	5dd5d40f-dc41-493e-ac40-4263c47b91b1
155	Shaban	test	2025-03-11 15:48:18.968432+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
156	Shaban	test1	2025-03-11 15:48:51.455131+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
157	Shaban	test3	2025-03-11 15:49:47.245931+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
158	villetest	test 4	2025-03-11 16:06:47.048202+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
159	villetest	test 6	2025-03-11 16:07:22.473899+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
160	villetest	test7	2025-03-11 16:07:55.953446+01	8d6317f1-6a63-49c7-a4f4-8472cba90f10
161	shabantest	test1	2025-03-11 16:08:31.901442+01	4b481480-f82a-47d3-a5f1-f65f022b1f77
162	villetest	test2	2025-03-11 16:08:47.922231+01	4b481480-f82a-47d3-a5f1-f65f022b1f77
163	villetest	test3	2025-03-11 16:08:49.379536+01	4b481480-f82a-47d3-a5f1-f65f022b1f77
164	villetest	test4	2025-03-11 16:08:50.697114+01	4b481480-f82a-47d3-a5f1-f65f022b1f77
165	villetest	test5	2025-03-11 16:09:47.481395+01	4b481480-f82a-47d3-a5f1-f65f022b1f77
166	shaban	test	2025-03-11 16:11:37.67317+01	27545849-b72b-4249-8a9e-ddedd9670209
167	shaban2	testtest	2025-03-11 16:14:36.276464+01	75090666-ff27-4ee7-9dfc-83f07371813d
168	shaban2	test2	2025-03-11 16:14:58.142414+01	75090666-ff27-4ee7-9dfc-83f07371813d
169	shaban2	test4	2025-03-11 16:15:12.397601+01	75090666-ff27-4ee7-9dfc-83f07371813d
170	villetest	test5	2025-03-11 16:15:34.995156+01	75090666-ff27-4ee7-9dfc-83f07371813d
171	villetest	test6	2025-03-11 16:15:51.71184+01	75090666-ff27-4ee7-9dfc-83f07371813d
172	shaban2	hej	2025-03-11 18:02:26.389685+01	75090666-ff27-4ee7-9dfc-83f07371813d
173	Shaban	test	2025-03-11 18:04:20.251729+01	a594a67a-6222-4370-bb37-b27cce77bab2
174	Shaban	test	2025-03-11 18:04:32.399663+01	a594a67a-6222-4370-bb37-b27cce77bab2
175	Shaban	test	2025-03-11 18:04:34.572717+01	a594a67a-6222-4370-bb37-b27cce77bab2
176	Shaban	test 3	2025-03-11 18:04:44.459956+01	a594a67a-6222-4370-bb37-b27cce77bab2
177	villetest	test4	2025-03-11 18:05:16.775747+01	a594a67a-6222-4370-bb37-b27cce77bab2
178	villetest	test5	2025-03-11 18:05:47.318569+01	a594a67a-6222-4370-bb37-b27cce77bab2
179	villetest	test 6	2025-03-11 18:05:56.666739+01	a594a67a-6222-4370-bb37-b27cce77bab2
180	testson	test	2025-03-11 18:07:49.931543+01	e1a1b422-817a-44b4-8431-d75957431a8f
181	testson	test 1	2025-03-11 18:08:03.293393+01	e1a1b422-817a-44b4-8431-d75957431a8f
182	testson	test 2	2025-03-11 18:08:04.553222+01	e1a1b422-817a-44b4-8431-d75957431a8f
183	testson	test 3	2025-03-11 18:08:05.747484+01	e1a1b422-817a-44b4-8431-d75957431a8f
184	villetest	test 4	2025-03-11 18:08:28.505424+01	e1a1b422-817a-44b4-8431-d75957431a8f
185	villetest	tett 5	2025-03-11 18:08:31.240882+01	e1a1b422-817a-44b4-8431-d75957431a8f
186	villetest	test 6	2025-03-11 18:08:32.912916+01	e1a1b422-817a-44b4-8431-d75957431a8f
187	testson	test 7	2025-03-11 18:09:08.050502+01	e1a1b422-817a-44b4-8431-d75957431a8f
188	testson	test 8	2025-03-11 18:09:10.33416+01	e1a1b422-817a-44b4-8431-d75957431a8f
189	testson	test 9	2025-03-11 18:09:14.622139+01	e1a1b422-817a-44b4-8431-d75957431a8f
190	test10	test	2025-03-11 18:19:33.28041+01	146e4e27-a58f-48a5-9ed3-854365675e4b
191	test10	test 2	2025-03-11 18:20:05.040987+01	146e4e27-a58f-48a5-9ed3-854365675e4b
192	test10	test 3	2025-03-11 18:20:06.464355+01	146e4e27-a58f-48a5-9ed3-854365675e4b
193	villetest	test 4	2025-03-11 18:20:47.12625+01	146e4e27-a58f-48a5-9ed3-854365675e4b
194	villetest	test 5	2025-03-11 18:20:50.208381+01	146e4e27-a58f-48a5-9ed3-854365675e4b
195	test10	test 6	2025-03-11 18:21:04.951786+01	146e4e27-a58f-48a5-9ed3-854365675e4b
196	test10	test 7	2025-03-11 18:21:06.840047+01	146e4e27-a58f-48a5-9ed3-854365675e4b
197	test10	test 8	2025-03-11 18:21:11.795983+01	146e4e27-a58f-48a5-9ed3-854365675e4b
198	villetest	test	2025-03-11 18:26:12.694188+01	146e4e27-a58f-48a5-9ed3-854365675e4b
199	villetest	test	2025-03-11 18:26:19.556342+01	146e4e27-a58f-48a5-9ed3-854365675e4b
200	Kevin	Funkar?	2025-03-12 08:52:49.505591+01	3091eeed-9f48-4585-abbd-93377b06fe05
201	KevinAdmin	Yes!	2025-03-12 08:53:14.215149+01	3091eeed-9f48-4585-abbd-93377b06fe05
202	KevinAdmin	Wohoo!	2025-03-12 08:54:07.922334+01	3091eeed-9f48-4585-abbd-93377b06fe05
203	Martin	inget uttag\n	2025-03-12 09:10:05.646993+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
204	Martin	jag hittar inte uttaget?	2025-03-12 09:11:12.166558+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
205	Martin	försöker koppla min mobil in i väggen... det går inte	2025-03-12 09:11:35.056313+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
206	villetest	TJENAAA	2025-03-12 09:12:10.090436+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
207	Martin	hallå!	2025-03-12 09:12:20.677812+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
208	Martin	det va en jävla tid det tog!	2025-03-12 09:12:28.632077+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
209	villetest	Hur är lägeeet o sååånt	2025-03-12 09:12:32.965632+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
210	Martin	hur löser vi detta då?	2025-03-12 09:12:36.385331+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
211	Martin	jojo.. det är bra	2025-03-12 09:12:44.53002+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
212	Martin	nu brinner min telefon..	2025-03-12 09:12:50.201528+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
213	Martin	HJÄÄÄÄÄÄÄÄLP	2025-03-12 09:12:57.658898+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
214	villetest	har du testat med att slänga den i sjön?	2025-03-12 09:13:01.196182+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
215	villetest	test	2025-03-12 09:15:34.484343+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
216	TEST	hej	2025-03-12 09:16:53.518126+01	6156a8ec-3098-4da3-ae93-22a3e28d3daa
217	Ville	fgh	2025-03-12 09:35:43.688462+01	dfe4d43e-19a8-4605-83e0-35294b79e31d
218	Ville	sdf	2025-03-12 09:51:14.293023+01	a2b3603d-a110-432d-ae24-21c1923f6a1a
219	Saban	test	2025-03-12 10:02:02.93447+01	17cf34e5-da9c-4418-ab54-6a6965055d77
220	TEST	what seems to be the problem officer?	2025-03-12 10:15:46.634426+01	17cf34e5-da9c-4418-ab54-6a6965055d77
221	Saban	fix my merge plz	2025-03-12 10:16:08.010487+01	17cf34e5-da9c-4418-ab54-6a6965055d77
222	TEST	I did	2025-03-12 10:16:14.241367+01	17cf34e5-da9c-4418-ab54-6a6965055d77
223	TEST	its ok now	2025-03-12 10:16:21.233257+01	17cf34e5-da9c-4418-ab54-6a6965055d77
224	Saban	yeaaaaaaah	2025-03-12 10:16:29.206022+01	17cf34e5-da9c-4418-ab54-6a6965055d77
225	TEST	🤩	2025-03-12 10:16:32.807444+01	17cf34e5-da9c-4418-ab54-6a6965055d77
226	TEST	🍆	2025-03-12 10:16:47.007541+01	17cf34e5-da9c-4418-ab54-6a6965055d77
227	Saban	🍑	2025-03-12 10:17:11.67094+01	17cf34e5-da9c-4418-ab54-6a6965055d77
228	TEST	👉	2025-03-12 10:17:36.558439+01	17cf34e5-da9c-4418-ab54-6a6965055d77
229	TEST	👌	2025-03-12 10:17:46.794602+01	17cf34e5-da9c-4418-ab54-6a6965055d77
230	TEST	👉👌	2025-03-12 10:17:58.007945+01	17cf34e5-da9c-4418-ab54-6a6965055d77
231	Saban	😲	2025-03-12 10:18:12.22946+01	17cf34e5-da9c-4418-ab54-6a6965055d77
232	Sebastian	test	2025-03-12 11:26:19.612936+01	4fcc165e-4092-448b-a18f-f615f53021f2
233	KevinAdmin	Din dator e redo för upphämtning. Haha skojja bara 😆	2025-03-12 14:00:12.363016+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
234	Ville	test	2025-03-12 14:03:02.950496+01	8f76fb7b-2027-4754-90ba-b6d5da1ce0b9
235	Admino5	🤢	2025-03-12 14:36:00.468723+01	8f18cf90-57c1-4e4c-bd85-370bc07428e1
236	Hampus	Min telefon är sönder	2025-03-12 15:06:29.40353+01	98f8b254-efb5-4260-9851-e29f461f141a
237	Hampus	Kan ni hjälpa mig?	2025-03-12 15:06:59.739052+01	98f8b254-efb5-4260-9851-e29f461f141a
238	villetest	Ge mig din faktura nummer?	2025-03-12 15:07:50.634521+01	98f8b254-efb5-4260-9851-e29f461f141a
239	villetest	0993214	2025-03-12 15:08:14.649909+01	98f8b254-efb5-4260-9851-e29f461f141a
240	Ville	hjk	2025-03-13 09:35:41.297643+01	e57a238a-3df1-40bb-be02-91e4914e460e
241	Ville	fd	2025-03-13 09:36:26.274553+01	e57a238a-3df1-40bb-be02-91e4914e460e
242	Ville	qwe	2025-03-13 10:14:15.632009+01	449e6de1-17ed-4dd4-a11e-5c0789eaa53e
243	villetest	d	2025-03-13 10:32:10.978781+01	b64b0908-2854-4a2f-ac53-dc0aa5fe160f
244	Ville	test1	2025-03-13 11:38:30.820555+01	1e126622-8e2c-4bd4-a662-f3483ca8fb07
245	Ville	hejsan	2025-03-13 11:38:45.064093+01	1e126622-8e2c-4bd4-a662-f3483ca8fb07
246	Ville	1	2025-03-13 11:38:45.958306+01	1e126622-8e2c-4bd4-a662-f3483ca8fb07
247	Ville2	qwe321	2025-03-13 11:56:08.133724+01	62c481ab-04e3-4290-9455-81bb208c36fa
248	Ville2	ds	2025-03-13 11:56:27.841747+01	62c481ab-04e3-4290-9455-81bb208c36fa
249	Ville	ljk	2025-03-13 13:14:11.274572+01	89f99fed-04b9-4c2c-ae30-b181e7f0cf80
250	villetest	lk	2025-03-13 13:14:28.871229+01	89f99fed-04b9-4c2c-ae30-b181e7f0cf80
251	Ville	hejhej	2025-03-13 14:11:55.533611+01	be47881c-cd53-4e25-96dd-20cd223f2420
252	Test	test	2025-03-13 14:20:28.488193+01	f2bc2a55-18b3-499e-bdd5-f79e5e246115
253	test2	test	2025-03-13 14:20:53.078736+01	402b0388-fa1e-4c09-95ba-ebca8e53f43d
254	test3	test	2025-03-13 14:21:11.394601+01	652a398f-29b8-45aa-9253-8f8d00d9d31d
255	test4	test	2025-03-13 14:21:31.421709+01	cb5ffbee-c4d9-419b-a5fa-95d2fca72f49
256	villetest	hej	2025-03-13 14:31:17.400426+01	269a695d-2b24-4ce2-afab-8f6cb7b370fc
257	Ville	test100000	2025-03-13 14:32:11.459291+01	e4191a14-a25f-4a92-bdff-c29a3957c8c4
258	villetest	testigen	2025-03-13 14:32:39.00125+01	e4191a14-a25f-4a92-bdff-c29a3957c8c4
259	Villeapa	hjälp mig!!1	2025-03-13 14:35:17.453798+01	fd04e15b-eead-4468-a664-cfa94a07d445
260	villetest	Hej tjena	2025-03-13 14:35:57.952745+01	fd04e15b-eead-4468-a664-cfa94a07d445
261	villetest	hejsan	2025-03-13 14:36:09.401478+01	fd04e15b-eead-4468-a664-cfa94a07d445
262	villetest	123	2025-03-13 14:37:09.873454+01	fd04e15b-eead-4468-a664-cfa94a07d445
263	Ville100	321	2025-03-13 14:38:39.476047+01	9736d3bd-75b2-4d48-a940-14e439a633a3
264	villetest	hej hej hej	2025-03-13 14:39:19.743406+01	9736d3bd-75b2-4d48-a940-14e439a633a3
265	Ville100	hejsan	2025-03-13 14:39:25.251296+01	9736d3bd-75b2-4d48-a940-14e439a633a3
266	villetest	123234	2025-03-13 14:39:44.799269+01	9736d3bd-75b2-4d48-a940-14e439a633a3
267	Ville100	56789	2025-03-13 14:39:50.882386+01	9736d3bd-75b2-4d48-a940-14e439a633a3
268	Ville100	1	2025-03-13 14:40:02.528347+01	9736d3bd-75b2-4d48-a940-14e439a633a3
269	Ville100	🫠	2025-03-13 14:40:19.29096+01	9736d3bd-75b2-4d48-a940-14e439a633a3
270	Ville100	🫵💩	2025-03-13 14:40:53.580908+01	9736d3bd-75b2-4d48-a940-14e439a633a3
271	testing	123	2025-03-13 15:07:19.675215+01	4578ad10-3f90-45e5-83be-e6dab9468710
272	testing	321	2025-03-13 15:23:21.867761+01	fe177498-183d-4391-9c80-c62e9afeffdf
273	Admino	hjälp	2025-03-13 15:28:28.165661+01	04e093b4-9721-480d-b68b-c877a9034a36
274	test	test inital message	2025-03-14 09:47:57.437214+01	94046ae9-1cdf-4ad2-9284-0185d528a025
275	test2	test inital messeage	2025-03-14 09:51:01.635269+01	e477a435-fef1-44cd-a693-b8849f368993
276	testchat.jsx	test chat.jsx	2025-03-14 13:31:11.200837+01	a0be9179-3fd7-4a3c-a51f-11317e7669cc
277	testchat	test chat	2025-03-14 13:33:17.171427+01	73a321dd-e9e8-4733-a863-6ce1c893224c
278	TEST	hej	2025-03-14 13:33:48.852011+01	73a321dd-e9e8-4733-a863-6ce1c893224c
279	testchat	TEST	2025-03-14 13:34:01.197429+01	73a321dd-e9e8-4733-a863-6ce1c893224c
280	TEST	hej igen	2025-03-14 13:34:23.638592+01	73a321dd-e9e8-4733-a863-6ce1c893224c
281	testchat	HEJ HEJ HEJ	2025-03-14 13:34:33.958513+01	73a321dd-e9e8-4733-a863-6ce1c893224c
282	TEST	ta bort chat.jsx	2025-03-14 13:34:53.35509+01	73a321dd-e9e8-4733-a863-6ce1c893224c
283	test utan chat.jsx	test utan chat	2025-03-14 13:55:10.743541+01	1cbf2368-d879-413f-aed4-286955f8a03e
284	villetest	hejsan	2025-03-14 13:55:28.67652+01	1cbf2368-d879-413f-aed4-286955f8a03e
285	test utan chat.jsx	hej hej hej	2025-03-14 13:55:36.270532+01	1cbf2368-d879-413f-aed4-286955f8a03e
286	villetest	🫵💩	2025-03-14 13:55:45.036282+01	1cbf2368-d879-413f-aed4-286955f8a03e
287	test utan chat.jsx	sista test	2025-03-14 13:55:55.52814+01	1cbf2368-d879-413f-aed4-286955f8a03e
288	Kevin	asas	2025-03-14 14:11:06.683747+01	7dddc3ba-b548-44f0-84a9-e9f1ba585651
289	Admino	hej	2025-03-14 15:42:17.769007+01	04e093b4-9721-480d-b68b-c877a9034a36
290	KevinAdmin	hej	2025-03-14 15:42:40.921315+01	af993dea-60f8-44a6-b00f-995a459c83b3
291	villetest	hejsan	2025-03-14 15:45:10.817331+01	269a695d-2b24-4ce2-afab-8f6cb7b370fc
292	last check	last last	2025-03-14 15:46:56.030782+01	ec93425e-6d66-4623-bda0-6ef7f947822f
293	villetest	godafton	2025-03-14 15:47:21.151817+01	ec93425e-6d66-4623-bda0-6ef7f947822f
294	last check	faaaaan	2025-03-14 15:48:04.125489+01	ec93425e-6d66-4623-bda0-6ef7f947822f
295	villetest	🫵🐭	2025-03-14 15:48:15.979321+01	ec93425e-6d66-4623-bda0-6ef7f947822f
296	lastlast	test test test	2025-03-14 15:49:59.646171+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
297	last check	hej igen	2025-03-14 15:50:22.257361+01	ec93425e-6d66-4623-bda0-6ef7f947822f
298	villetest	hej igen	2025-03-14 15:51:11.490893+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
299	villetest	2	2025-03-14 15:51:34.654387+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
300	villetest	3	2025-03-14 15:51:40.711192+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
301	lastlast	hej hej hej	2025-03-14 15:52:39.80432+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
302	villetest	e	2025-03-14 15:53:05.825643+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
303	villetest	hej kevin	2025-03-14 15:53:47.335687+01	7dddc3ba-b548-44f0-84a9-e9f1ba585651
304	Oskar	hej 	2025-03-14 15:56:11.810157+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
305	Ville	hej	2025-03-14 15:56:37.670398+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
306	Oskar	1	2025-03-14 15:56:54.394989+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
307	Ville	2	2025-03-14 15:57:04.512954+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
308	Oskar	3	2025-03-14 15:57:09.270276+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
309	Ville	4	2025-03-14 15:57:20.477901+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
310	Ville	hej	2025-03-14 15:57:39.030332+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
311	lastlast	test	2025-03-14 15:58:11.272741+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
312	Ville	2	2025-03-14 15:58:16.958029+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
313	KevinSuper	hej	2025-03-14 16:05:52.203323+01	fe177498-183d-4391-9c80-c62e9afeffdf
314	Ville	1	2025-03-14 16:16:32.214793+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
315	Ville	3	2025-03-14 16:16:48.359171+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
316	Ville	4	2025-03-14 16:16:50.444097+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
317	Ville	5	2025-03-14 16:16:50.881977+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
318	Ville	6	2025-03-14 16:16:51.152103+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
319	Ville	k	2025-03-14 16:17:04.309716+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
320	Ville	j	2025-03-14 16:17:10.021982+01	735c801f-73bd-4f8d-9fbc-7be5df2603e8
321	Oskar	supaabase	2025-03-14 16:17:26.337361+01	ac5a4cc4-fe87-4d53-8f19-a9cd40b9f113
328	Ville	123	2025-03-17 10:40:26.646817+01	764c78db-de5f-40c9-8e62-53a472e5373a
329	Ville	hej	2025-03-17 10:41:08.013859+01	764c78db-de5f-40c9-8e62-53a472e5373a
330	Ville	wh	2025-03-17 10:41:29.09573+01	764c78db-de5f-40c9-8e62-53a472e5373a
331	Ville	fkfk	2025-03-17 10:41:34.046097+01	764c78db-de5f-40c9-8e62-53a472e5373a
332	Shaban	test	2025-03-17 10:41:59.911811+01	c53f9af1-59ef-4446-b92f-ab2f69ab799c
333	Ville	test	2025-03-17 10:43:09.04997+01	c53f9af1-59ef-4446-b92f-ab2f69ab799c
334	Shaban	hej d	2025-03-17 10:43:16.080045+01	c53f9af1-59ef-4446-b92f-ab2f69ab799c
335	Ville	test2	2025-03-17 10:43:29.538884+01	c53f9af1-59ef-4446-b92f-ab2f69ab799c
336	Shaban	hej hej hej	2025-03-17 10:43:38.416201+01	c53f9af1-59ef-4446-b92f-ab2f69ab799c
337	Oskar	test	2025-03-17 11:09:40.573162+01	093c334e-2973-4218-b663-40689b07452e
338	Kalle	hjälp mig!!	2025-03-17 11:20:56.63672+01	126897f3-92e7-410f-b04c-114f70ca6bc9
339	Ville	Vad vill du ha hjälp med?	2025-03-17 11:22:51.448835+01	126897f3-92e7-410f-b04c-114f70ca6bc9
340	Ville	jhg😀	2025-03-18 11:33:31.025046+01	764c78db-de5f-40c9-8e62-53a472e5373a
341	Pontus	Min faktura är för dyr	2025-03-18 14:35:52.89517+01	b93c9d1f-8043-4541-92e0-f01f64436928
342	Ville	Hej pontus vilken faktura gäller det?	2025-03-18 14:37:41.409101+01	b93c9d1f-8043-4541-92e0-f01f64436928
343	Putte	Hej min faktura är för dyr	2025-03-24 20:20:51.359099+01	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
344	Ville	Hej Putte , kan du ge mig din faktura nummer	2025-03-24 20:22:34.829522+01	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
345	Putte	Hej Ville , mitt faktura nummer är 4155	2025-03-24 20:22:58.124515+01	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
346	Ville	Okej har löst det	2025-03-24 20:23:10.893277+01	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
347	Martin	Tejena	2025-04-03 15:49:05.530155+02	
348	Putte	Tjena tjena	2025-04-03 16:02:55.328971+02	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022
349	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 10:30:52.877901+02	83aa8278-897a-4e9d-ae37-d2bc824130b5
350	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 10:31:03.2023+02	732038c4-7238-465b-8519-ef108df59080
351	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-04 10:31:09.766236+02	9a97700f-86e0-42db-b81f-696069b81f91
352	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:39:39.077465+02	e704bd17-941b-4560-a8e4-f6146f91b28c
353	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:39:50.365101+02	9d858bed-d66f-498a-9dc8-106fdee169da
354	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:39:56.461446+02	48f781c8-9522-45d3-b595-db21ac86ceb8
355	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:46:15.870457+02	abf231a6-326a-4664-9531-8bce471973b2
356	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:46:26.447453+02	8f9ba308-0e77-4d5e-970b-07422ace6946
357	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:46:32.180228+02	4fd6aea6-a808-485e-aa39-a44eeb816b7f
358	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:48:19.237983+02	b612a8ab-43be-45ad-89a3-05f1673810dd
359	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:48:29.1923+02	f924af61-ded1-40d0-909c-8db14d680842
360	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:48:37.612535+02	1692f76f-d7f8-4aaa-bebf-0e14e2764557
361	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:54:24.062139+02	403681da-e3b4-482c-884e-a26147f2ff96
362	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:54:36.695774+02	fa9c7493-7171-4ef7-9d48-cfdb01b357a5
363	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 22:54:44.827413+02	a5c9a8b4-d9fe-4990-8bcb-96d69ae93380
364	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:06.766112+02	74ecc0e5-e8b2-41e5-8815-ff9a2d6aed5c
365	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:14.517366+02	4e913ca0-0c55-4b1e-bd47-e2a56fbdcbfb
366	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:07:20.58267+02	7bd90d73-84c9-45e7-ad8c-777ad1981fb8
367	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:10:48.6669+02	d83e7323-5e4c-479d-bd6e-9ff4391a1cbe
368	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:10:54.906135+02	f58866fb-d7d9-469c-baf6-759552c0ad97
369	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-05 23:11:02.773225+02	ca6e1315-ecd5-4d6b-acf7-f20dd4dbfeaa
370	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:07:08.901329+02	7f371c84-951c-4d61-890f-2f8433ee7d91
371	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:07:20.259053+02	b35efc1c-f756-4aad-904a-f49867674c8f
372	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:07:27.054219+02	d746f089-c5aa-4cb0-9585-2783dc852a88
373	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:27:37.503845+02	258058f9-abb9-4e17-8b95-01549b29a088
374	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:27:47.683319+02	49abd3cb-0481-4adc-87a0-96ba3afbcf41
375	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:27:53.377642+02	c8f213c6-5ebb-401e-b307-c5268b1c3fe9
376	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:29:30.178527+02	48bc5380-3657-4c90-a33a-e93f88d2a351
377	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:43:03.698546+02	1a316d7b-8421-400b-8dfd-70707657c0b4
378	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:43:16.243301+02	345936b7-368d-4ecc-8780-1da1522b7b2e
379	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:43:21.894812+02	a4256dde-d989-4340-a8bc-c74822fe6130
380	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:55:39.864092+02	a7703890-ec75-4c7f-b349-e866ee653565
381	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:55:51.042389+02	d8cdd1bf-82d4-42ad-80fe-8502b93c3faf
382	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:55:59.323113+02	6f7b8da6-3460-4389-a6e0-518eb524e355
383	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:58:08.088544+02	34a802e3-b63a-4b28-8cc9-cb9f8519983b
384	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:58:17.611266+02	411b0fdc-729f-4cc1-a4d6-fce63213f4e1
385	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 01:58:22.945213+02	454f4780-b2e2-4f21-8582-d9a2e6b5b09a
386	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:11:44.560046+02	47cff9dd-d2e2-43f6-b7c6-d49a05a0c53d
387	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:11:56.026668+02	4abcb647-2001-4e8b-ac8f-235d7e0bc1c5
388	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:12:01.176466+02	e9d78982-b97e-4b10-967f-319e646f3eb6
389	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:24:38.14248+02	3906e146-7d23-40e6-a9de-458ce5c09a8f
390	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:24:48.394336+02	55f143d3-fcdd-4287-a0b7-8c938a519681
391	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:24:54.041446+02	a144f288-90cc-4239-85cc-0fe6f9a30b5c
392	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:32:30.833963+02	db450373-20f3-4d2f-b6ce-3f7e168d6553
393	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:32:40.483316+02	57164468-4c45-4a89-8cc4-d40a892f393a
394	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:32:47.085156+02	e444d31b-30fe-4703-96a3-07f04b61b2ac
395	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:38:07.047096+02	0ec12ad7-ad21-4073-89d3-5ee4acc051d4
396	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:38:18.224035+02	eed9eba9-0a3f-4989-9cfc-9c40447d6402
397	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:38:24.956877+02	63a6de7e-5824-4d06-a69a-9f6e4c75b82f
398	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:42:11.865088+02	9c9ac440-ad0b-44a9-a4f0-a9e64b995669
399	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:42:21.858926+02	7c66481e-3ba7-4c08-a74d-1ef204667093
400	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-06 02:42:27.54959+02	44152e81-3afa-4cef-b7c3-3b0b7a1a757c
401	Ville	Hej	2025-04-07 09:04:21.068521+02	abc123
402	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:21:06.19594+02	1c870de7-d3c4-48a9-b6c2-621b5e95c5bc
403	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:22:32.875531+02	e910419e-961d-460f-ae76-311051e0c94a
404	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:23:25.029323+02	869fcd64-7ed9-46fa-ae17-435b7395706d
405	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:24:13.463372+02	b48f594e-6bb7-42a0-be4f-663ca2269a39
406	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:24:39.237714+02	a611bb74-5a8d-4e13-b20b-a942d4f0a790
407	Löken	inget fungerar.	2025-04-07 10:30:23.509119+02	162979b2-a9ff-4756-a630-49a67aae4a18
408	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:31:34.034389+02	75a2e98c-cfcb-4e53-b6d3-c0305626cb4b
409	Löken	hjälp mig	2025-04-07 10:34:19.304266+02	cb001359-6042-4c6c-bb58-2cd4a4e939b6
410	Löken	Bilen låter konstigt när jag startar den.	2025-04-07 10:49:19.845247+02	f2f6e662-133b-40f6-8fe7-16b7c285ffca
411	Löken	inget fungerar.	2025-04-07 11:39:28.434902+02	f44a26e8-118c-47d3-a31c-9790ef3ae766
412	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:57:09.68085+02	59ab7dbf-86ba-4f01-9c75-c8f079616aa0
413	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:57:23.127798+02	a186a64a-0119-478b-9f62-8a877a02021b
414	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 11:57:30.463886+02	124b2899-d539-47a6-bc33-9f273ac82c21
415	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:06:26.970292+02	f45a837e-0417-44f9-a4c6-5b2a73c56ab2
416	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:06:38.619671+02	bede35f2-abc1-4ab6-be99-9fd8eef4a092
417	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:06:45.136775+02	2a90ee55-09f6-4285-b9f1-5e410bdf7856
418	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:07:23.077492+02	853fdf23-a8fb-4e33-92bf-c85ee0c0dee0
419	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:07:34.365027+02	f1a4999b-bd0c-4434-8f75-c5ed8c0c2958
420	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:07:41.081518+02	301d59a9-6ae8-4b77-8fe2-76bd94a75840
421	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:50:17.585236+02	9525c3d5-51c4-4464-a9df-90eaab676fbc
422	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:50:34.714116+02	24788fb7-3b58-4253-acbf-ce1e7521b870
423	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 12:50:43.620187+02	18d87b72-b9a2-4b03-a576-55c714877da2
424	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:07:22.833712+02	3d036f69-7e59-432c-b278-a26a971b885d
425	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:07:37.472407+02	fccc7f71-76a2-45d7-9f5b-31bf1fb01ee8
426	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:07:44.715542+02	64b2fdce-f047-433d-86c5-c53a1f9ec430
427	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:09:41.352674+02	e2893f39-9ef7-45b3-a005-6ca927dc6037
428	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:09:54.017135+02	0016109b-b0a7-48a1-8263-0dc08fe80b05
429	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:10:00.377901+02	771e1415-fbb6-446e-ae75-2a6f2ff470a6
430	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:16:16.656164+02	17aee66e-9ad1-4a7e-a9da-8770f68583d4
431	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:16:29.760917+02	68472100-e45a-4b2b-bda5-25ff47668297
432	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:16:37.109721+02	70b60853-d9b6-4a67-8497-71d04bf21a91
433	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:22:08.639067+02	c5c1c55d-98bf-4695-a3d6-113cbb671044
434	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:22:16.008185+02	ff1fd07c-d783-4383-b628-3e2bd29924b0
435	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:43:22.225453+02	461d6488-2e95-4859-ab9c-cb47c6b5d0a8
436	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:43:31.224401+02	4ca3d7c4-294a-401a-a2ad-868027e0b1b7
437	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:43:36.793347+02	b324f4be-3d4f-4ce1-9f96-ab36f4ea1f3d
438	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 13:52:07.53454+02	af35aead-a759-45f7-b5dd-30f8f4d3b80e
439	John Doe	Hej, jag har en fråga om min beställning.	2025-04-07 14:36:58.433738+02	04d0792f-b2f4-43e3-a5bb-7296b66f793f
440	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:21:26.450312+02	270965de-1b9a-4c09-a7a1-4a34d078697a
441	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:21:40.772488+02	0e2b0dcd-b05c-40d0-9b87-6aceb18e2414
442	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:21:48.01088+02	2f4ff827-90e6-4ebf-8593-2e0486cf0933
443	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:34:39.41387+02	8d1f2d78-c400-438f-8491-3aabf0fe2d2e
444	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:34:55.65753+02	8ff5bd33-3083-4c7a-8b9b-016a7cae7dc7
445	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:35:04.168483+02	ba648216-b8e3-4478-a827-df7ed2d51093
446	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:41:18.447664+02	08450420-21c2-4334-94a8-e72cdc03ea63
447	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:41:27.841803+02	f59d7443-37ca-45cf-8012-2250fbfa1bc5
448	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:41:34.14127+02	1ee9bf5e-bdf6-4813-932f-1f9fffa8a1e5
449	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:41:59.991435+02	995b1222-98fa-486f-9b05-f70436dc0b2d
450	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:42:09.190676+02	16bc12c0-5e7a-4613-96a0-d2fc1e8e4364
451	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:42:15.280065+02	2c399e98-1142-436e-a002-d8ee50f4b268
452	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:47:20.894275+02	558397e8-e435-4fa1-adcc-dc5c6c92e5df
453	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:47:33.830117+02	c33ee079-7650-4320-9ed9-d086b7676edd
454	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:47:40.963935+02	fbd8cafd-de55-465e-8539-5f168c13e951
455	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:52:24.291661+02	287c20af-a17b-4764-8f7e-b1010bc0c89c
456	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:52:35.780365+02	73e756c7-be34-481a-988d-ed112b835bac
457	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:52:42.267287+02	2b8150cd-7c62-4e7d-9047-967b58c6d335
458	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:55:40.131273+02	8cd4886d-bb04-426c-bd31-faba1f86e60a
459	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:55:51.875807+02	10a660e6-205b-4459-8fb6-a073a8ca09ac
460	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 16:55:58.216298+02	226f6c21-5093-43c8-b51a-81a62935be37
461	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:02:35.522223+02	b5b0b469-b33c-4d7f-aa1e-6498a67c2998
462	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:02:49.107903+02	df0befb8-bf6a-4c38-ba0a-d41e61672761
463	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:02:57.216374+02	42c05906-da90-4e70-9043-345692187b72
464	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:11:11.022446+02	7a56d9cf-2e2b-450f-b07f-ff6d6cf159b8
465	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:11:23.170842+02	acffe46f-01fb-46b1-b36f-cac678d216df
466	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:11:30.553892+02	39420a89-2106-47a2-85da-f346366b4f9a
467	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:17:52.651277+02	61569cc3-9257-4dd3-8627-83e07180ee0e
468	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:18:06.287221+02	fbbed657-05d9-4597-9cc0-4326beba03c5
469	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:18:20.380817+02	ccaf59ee-0a19-4177-8576-e42feb943b94
470	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:21:51.837757+02	7e5436c0-8841-4903-a057-b9d74438d812
471	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:22:03.813368+02	6b5744d9-c4d9-4190-b3a0-42d510c49ad3
472	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:22:11.331868+02	585d8457-53b1-4393-b38f-3fc978e5c9e9
473	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:35:56.84292+02	f3fad663-7a3e-4355-b5e1-8f9cb8400130
474	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:36:09.129057+02	1cd6abb5-642a-4f64-a005-e816bd1e15bc
475	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:36:15.69698+02	227191f9-63d9-4ed4-b9fe-930a08f2b3d6
476	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:45:53.520505+02	6fc38d52-61e2-421f-ac07-4e15488de57f
613	Kevin	Jag har problem!	2025-04-09 10:38:08.637283+02	8abd6be1-35e0-42a9-98af-0033caa9e126
477	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:46:08.364243+02	74af9cbb-6168-4e4a-8945-9286a0647e4d
478	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:46:23.37923+02	b076ce81-7307-4da2-adec-ed1fddef0ceb
479	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:51:09.486517+02	2eb2eb84-6f65-4f67-a1cd-99d06f9ffa9f
480	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:51:22.577692+02	b2049186-d1ef-4b8e-96a1-b895391db0bf
481	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:51:32.427232+02	5e00f611-51d0-45a8-a90b-63ead565677c
482	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:56:19.113496+02	949ff994-93e9-4c46-98b8-667f7df59306
483	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:56:32.494789+02	1f4608fb-b9e1-4d91-b14f-2401e702d42d
484	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 17:56:42.196867+02	2b0998dc-cac5-4d86-b1db-7f61c378e6c2
485	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:09:36.079474+02	13d7af85-3ef6-45f7-93e6-6799094648d5
486	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:09:49.330645+02	1eacb40f-7c94-459a-ab1a-a7d429b3c8fa
487	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:09:56.782169+02	f2a11e61-4b2b-43c2-a8aa-77135728094d
488	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:10:47.581436+02	5809d7e4-802c-41d2-947c-dc01367218a3
489	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:10:59.876875+02	215dbee8-2b14-4732-9933-60c5db2e59d0
490	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:11:07.010926+02	ef99b72c-de78-4b3f-aaa4-05ec719633d0
491	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:25.315672+02	042a6496-c66a-4121-b61c-852ba62c8f65
492	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:39.466676+02	9ad2782c-85c3-4c5b-bfdc-bdb0c6227dd4
493	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:15:48.28282+02	857937ff-0004-4b1a-95cf-787c8ab7fce9
494	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:16:44.889315+02	d4c45255-ef65-42cc-9cd5-a3fe85ef0aab
495	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:16:57.864471+02	982f0026-d9c1-4ed5-83b1-2aeba4048df1
496	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 18:29:11.419178+02	e6b5e924-3fe5-47c6-8afb-935f566060d9
497	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:15:08.914329+02	a152c114-e060-41f4-baf2-c836f29bae8b
498	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:15:16.198642+02	865a34a4-7fb9-4992-9e23-acd3a88dcc01
499	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:15:21.046681+02	de12b8aa-9dac-4797-b650-30cfac46cf9f
500	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:38:07.364588+02	26d3a624-2064-455f-9c9a-5ee11220f030
501	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:38:16.652479+02	8927d432-16db-45e2-981b-07adb2106f29
502	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:38:22.270132+02	1d7b2e85-451e-4051-97d1-bcfc1cdc2756
503	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:43:32.551412+02	d79c00e6-796e-496d-a773-1a1b65d6850f
504	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:43:38.905721+02	96224af7-7ddc-462e-be1b-1858b511d628
505	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:43:43.940726+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
506	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:44:28.211672+02	5defbf27-29c5-4956-abbb-30e16c488591
507	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:44:34.469431+02	2d4ad722-800e-4233-8fc8-736500c6191e
508	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 20:44:38.742689+02	c0ca282d-cbcb-4f31-8d82-64c2b83f9663
509	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:11:49.567314+02	ebe6fa8f-c397-4f0e-8ccb-e64cd35419cf
510	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:11:56.404993+02	62989950-5937-48ae-9f2d-61391f549040
511	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:12:00.620675+02	8df38a04-1830-4564-96c6-fbfdf0563a21
512	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:14:22.301937+02	39e9e0d6-8607-4938-b26e-0d1804bc8da1
513	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:14:29.815536+02	2ebfcba3-e4db-41ea-9310-71042424479c
514	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:14:34.031691+02	82c92e3e-e740-48c3-a570-3373bb63f2d8
515	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:16:26.395933+02	ccea9553-06ec-4a81-8f11-2108c92f6ff9
516	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:16:33.777926+02	db458145-aae5-4aac-a91e-3c5fa12d2145
517	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:16:38.262987+02	5de6f5e5-7e0c-49b8-9f08-bab3361368fc
518	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:29:26.267649+02	f405b0c7-0ab1-4d2e-b428-3207fa7ae2da
519	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:29:35.129762+02	cd73806a-a158-4510-b86c-9df8b1607ceb
520	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:29:40.148504+02	34a14dd1-e74b-447b-a20a-7fccb561c80a
521	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:35:27.663914+02	3e753a56-f719-48fc-ada1-69b13dc2be63
522	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:35:35.876331+02	1bf5268a-b6f6-42ae-9e0d-7401e13dc86b
523	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:35:41.183095+02	0a217d1d-8f76-41eb-9eac-118cd822c50f
524	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:37:02.896546+02	f2e253ba-bda4-4542-94b5-10ad94cce98f
525	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:37:12.132629+02	749bd642-2d42-4676-a003-c1c1acda7e30
526	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:37:17.881114+02	0e00fcae-3500-4e41-832b-22856e93f3a0
527	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:38:27.952269+02	9cefdeed-6f27-4aff-a28f-7da9ceb86869
528	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:38:36.642417+02	b10483fc-04a1-4ce0-93a4-7e598caac020
529	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:38:40.842455+02	0e53794b-28aa-4f4f-b05b-fafff5efab2e
530	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:42:24.578575+02	0d28c7d6-02c8-4049-9877-1817d239312e
531	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:42:31.971067+02	f00f1105-a656-410d-8631-9c405e3ecd37
532	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:42:36.320618+02	f4c93a08-c061-4ab2-a41a-2274fb23031e
533	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:27.276237+02	f8c20aeb-c891-47d2-89e0-70420c48a1b4
534	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:34.020605+02	367f92d9-9277-4287-af52-08038ee0a5fb
535	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:46:39.940639+02	e4821600-bc28-4be1-8739-4ad227afa1e5
536	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:55:33.844418+02	987e1d6c-3fef-48c0-b477-27a9607628b6
537	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:55:46.364907+02	96aaf00b-21f0-49a4-b9f6-8789f82d3046
538	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 21:55:52.083744+02	82b24062-1391-4efd-9852-bf23ef64775e
539	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:02:43.52658+02	5ce2cf0b-53a0-46d0-9a19-b6ea00d22e05
540	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:02:53.731017+02	3aa78d66-c516-4f4b-b394-792364063bb5
541	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:03:00.176273+02	de037df6-cca8-432f-9ef4-78349f850355
542	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:07:08.562199+02	e7bc95a9-74d3-486f-8505-1fcc24131580
543	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:07:22.295805+02	7215df27-cc55-4cc1-9eb6-dc0eea9b76b4
544	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:07:36.677931+02	49db9673-6e8c-4e19-8c84-8b839daf100d
545	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:16:36.091654+02	d34e8266-b57d-47fd-934a-fe63813294cf
546	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:16:55.097294+02	a981b7fc-8fb7-4a44-a94a-5c1b9ca239f0
547	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:17:05.47052+02	ae1070ba-0139-4992-8910-ec2dd1bb63e2
548	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:19:38.314452+02	c4ba1f51-915b-4d47-a590-b63bcea94946
549	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:19:51.497929+02	fdaa042d-707e-438a-920c-63f8e06d5895
550	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:19:58.592597+02	c55394d1-983b-4c95-b4e8-6847fe087e6e
551	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:31:25.308083+02	caeffaa9-28c9-464c-b281-fa76c6b5e25b
552	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:31:40.130467+02	1850ac06-fd04-4a5d-8337-76be6f0648ef
553	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:31:47.355326+02	6277102d-3db4-4929-bdfc-7df2d7bab9e7
554	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:37:37.598803+02	06f649c1-7df7-48de-9758-35e8f4263c28
555	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:37:50.739012+02	0f8fa7a8-277b-44e6-8c41-5a525a252a15
556	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:38:01.516332+02	97d0ad59-c581-46bc-9b7a-06b6500c3e3c
557	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:44:44.599433+02	352ab12e-ee5c-4f53-9d5f-01682413688d
558	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:44:58.845647+02	acf856bd-8dd9-4960-864d-bbc95975540b
559	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:45:11.089904+02	3950e967-20b2-4aa7-9f96-8f1e97763fb4
560	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:48:41.672928+02	8066ee2b-c9fb-460d-9b68-15c2dbc33671
561	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:51:49.126819+02	5371fa27-0db1-45ec-aad9-34ab221f528f
562	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:52:04.994769+02	bb8b7123-4cc0-419c-93dd-3b7e42584a99
563	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 22:52:13.165568+02	a2b9482d-85e9-4e36-9514-65ed6fcc7765
564	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:07:21.259485+02	b0da324b-ed7e-4fc9-ac93-51d8d2dde4d8
565	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:07:36.725235+02	b510a0e7-35cd-48e1-b83d-a6cfbc2d8948
566	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:07:43.494025+02	dcd24067-9281-4802-96f0-e0e4390a6ea2
567	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:13:06.986825+02	49edb2ce-2139-4f90-802f-e97271d62119
568	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:13:18.656004+02	a43b76f8-9769-447a-aac3-402b7403ae2d
569	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:13:25.630821+02	9fe7f6e6-8604-4bab-b66c-9474715494da
570	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:17:27.550708+02	709248b6-f063-4920-b0bb-4ebf7bf1359b
571	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:17:39.50234+02	4155f9e3-fea0-4856-b7e8-12ee9fee6df8
572	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:23:21.959118+02	76761119-fd08-492b-8ad4-3c0badaf3f4c
573	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:23:35.949013+02	5a766125-2527-4a85-937d-872f6457b76c
574	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:23:42.648414+02	09e639d4-9d07-452d-8388-7eefba507eb3
575	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:28:14.199977+02	010ae747-05a4-4125-8040-bdcb37e0eadd
576	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:28:27.488568+02	3fada5ab-12f7-4e1b-82a3-a9cfc1685adb
577	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:28:41.863398+02	8631cc61-6ff5-4283-80df-ebfb24417d13
578	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:31:53.64162+02	dc15016b-37f0-482e-a568-f20746cd93af
579	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:32:03.36801+02	31bb6ef5-794f-4528-be8c-cb85062cacfe
580	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:32:08.860324+02	5c397c7e-efbf-4f88-b35e-07ac5e0e234d
581	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:43:18.705039+02	82365dbd-bef0-458d-8cd1-4b8c43fbada3
582	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:43:34.943578+02	4e084e23-d04c-42b2-8f9f-345232ab4c71
583	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:43:43.158902+02	825b896e-80e4-4e01-86ff-3469992a2e4e
584	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:46:25.420818+02	33fe2f5d-1b7a-4988-9f21-c71d684c9904
585	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:46:35.754151+02	27337888-6229-4ee4-9c5d-d7722f14e044
586	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:46:41.148289+02	6b5ee55e-9fab-4fdb-a55a-61e74595ab09
587	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:47:54.810133+02	6258e691-e621-4376-a51b-6b205c7ca5d3
588	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:48:04.864224+02	b820254b-0cb1-4ea2-be47-dea9b506b0ea
589	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:48:10.47891+02	2a1a1bca-6ae6-491a-9bb0-a2007959943e
590	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:50:58.713145+02	b39407eb-775e-49ce-917c-2727ba8c3188
591	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:51:10.742563+02	dd639829-9b82-4c0c-a5b5-3d45bc2060cf
592	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:51:17.423646+02	2ab1e161-f14c-43e5-b0e6-67f958292ac0
593	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:53:43.454113+02	eb13e6b3-c80d-471e-ac92-43cfab5fc3c0
594	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:53:54.13474+02	edce9f58-5622-4302-85ed-2dd9981a68b4
595	Test Person	This is a test message describing my issue in detail. Please contact me as soon as possible.	2025-04-07 23:54:00.619931+02	3c2a3c61-0b9c-4bd9-9b0a-28095323a790
596	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 08:50:39.071087+02	73093e76-2993-412e-a5d6-d583e29faeb0
597	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 09:23:03.103203+02	cceb13a2-3efc-40b3-a5c3-e33dc781ba08
598	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 09:34:02.614867+02	b10af301-81f7-416b-b667-66a25dd85e6d
599	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 11:37:18.358263+02	c911b916-4b91-48c5-8c8f-ff791bdfa9c1
600	John Doe	Hej, jag har en fråga om min beställning.	2025-04-08 11:44:09.037606+02	4506b0b0-cb05-4388-a6d8-67eb7d73304c
601	Kevin	as	2025-04-08 13:58:03.19151+02	9707e05f-9e27-423e-a9f8-5f2fdbd6b349
602	Kevin	a	2025-04-08 14:09:51.56102+02	a5979119-6ff2-42ed-b338-f57e1029f969
603	Kevin	Jag har problem!	2025-04-08 14:23:50.026945+02	184b5d54-a458-4165-9a2a-d93a0ecc6ef9
604	Kevin	Jag har problem!	2025-04-08 17:47:18.082292+02	27efd174-5a04-4434-af18-2259e999c6c8
605	Kevin	Jag har problem!	2025-04-08 17:49:19.143586+02	a6ed8e8d-b35b-4bea-a161-0cf229af6491
606	Kevin	Hej!	2025-04-08 17:54:05.830256+02	7b876bd9-046f-48ba-8dfa-dfd0a3e48f80
607	Kevin	Jag har problem!	2025-04-08 17:55:49.615529+02	605ca6de-f064-4b6c-9f8d-c54351c38ad3
608	Kevin	Jag har problem!	2025-04-08 18:09:25.62516+02	1333a2f6-b30e-4f9d-a692-edb7b158063f
609	Kevin	Jag har problem!	2025-04-08 18:10:06.30907+02	704dfbba-5224-42c2-b6a8-2121c7b5e44d
610	Kevin	Jag har problem!	2025-04-08 18:18:37.046273+02	8735f944-a7e7-4860-accf-901a0b9d9caa
611	Kevin	Jag har problem!	2025-04-09 10:16:31.945196+02	f9bac75b-96f3-4b9d-bd73-ccdeea8be13e
612	Kevin	Jag har problem!	2025-04-09 10:17:42.051379+02	545b2a0a-1943-4f6d-bbae-b64cc0fc37f3
614	Kevin	Jag har problem!	2025-04-09 12:21:12.719793+02	1f198760-c81c-4ee5-b9ec-cb23061062ef
615	Kevin	Jag har problem!	2025-04-09 12:22:10.824888+02	3789ac15-6e20-4b94-b578-37c300399ce9
616	Kevin	Jag har problem!	2025-04-09 13:05:20.114176+02	495d4ba5-50c2-4e4f-86cb-d152eee5317e
617	Kevin	Jag har problem!	2025-04-09 13:06:19.436857+02	0dbff38d-d24c-4d9c-8955-19536364e166
618	KevinAdmin	vad för problem?	2025-04-09 13:18:05.291391+02	f9bac75b-96f3-4b9d-bd73-ccdeea8be13e
619	KevinAdmin	Vadå för problem?	2025-04-09 13:21:31.05723+02	0dbff38d-d24c-4d9c-8955-19536364e166
620	Kevin	Jag har problem!	2025-04-09 13:38:23.930409+02	7b55928b-c03a-42a7-b9ff-f79bae8614c5
621	Kevin	Jag har problem!	2025-04-09 13:43:07.677123+02	37c31aa0-cd4b-417d-a2bb-94dc81a94b00
622	Kevin	Jag har problem!	2025-04-09 13:44:11.340935+02	170da7c8-288f-406b-b498-248168694d0d
623	Kevin	Jag har problem!	2025-04-09 13:44:33.238876+02	3ba963f8-6d86-4dc7-8ed9-affea527eaf6
624	Kevin	Jag har problem!	2025-04-09 14:59:59.113539+02	1395f88a-e384-4f97-b6eb-7a243d93991f
625	Kevin	Jag har problem!	2025-04-09 15:00:39.437809+02	355260c7-9cd6-40be-a38b-deab90446b56
626	Kevin	Jag har problem!	2025-04-09 15:03:19.182348+02	0d3f6216-451d-48a7-8a82-3bb5a02901af
627	Kevin	Jag har problem!	2025-04-09 15:04:45.820505+02	ff1ba4f6-d953-4f47-ae6f-bda9d2319163
628	Kevin	Jag har problem!	2025-04-09 15:11:21.557234+02	cc6bc1c1-6b99-4a33-a6a4-7ac8543b9fcc
629	Kevin	Jag har problem!	2025-04-09 15:12:19.386637+02	ed37cae5-5487-4618-b753-91fb7cb1998d
630	Testare	Jag har problem!	2025-04-09 15:21:55.930071+02	f6059d31-139f-4cb7-a759-e969a53d6312
631	Testare	Jag har problem!	2025-04-09 15:26:30.516119+02	9d485369-029e-47a6-8703-cdc70efa6542
632	Testkund	Jag har problem!	2025-04-09 16:01:07.473685+02	60dcefc9-47d7-4fa7-a1e7-146ae7da30d2
633	Kevin	Jag har problem!	2025-04-10 14:17:13.979242+02	7665d1bb-8ae3-475d-bd5a-0dd8149c4bd0
634	Testkund	Jag har problem!	2025-04-10 14:17:55.916868+02	3f12bbdb-7d77-4dd7-968e-2a237b98fa55
635	Kevin	Jag har problem!	2025-04-10 14:47:10.117931+02	8d27cdb0-680b-4f35-a3b8-bb49e5bdd579
636	Kevin	Jag har problem!	2025-04-10 15:13:27.598674+02	cf65df03-871c-463d-9e6f-f991927e8d09
637	Kevin	Jag har problem!	2025-04-10 15:45:44.994036+02	e1df0377-b90b-471b-a06b-718aae9dbbc2
638	Kevin	Jag har problem!	2025-04-10 15:50:44.311771+02	8a002455-5b84-4b73-9e10-66ef965c6608
639	Kevin	Jag har problem!	2025-04-10 15:55:18.847984+02	9b62c046-9a12-4cee-a259-a5a388d5f02e
640	Kevin	Jag har problem!	2025-04-11 13:33:45.964489+02	24b65201-2d90-44c9-ac8a-eb3aa226496f
641	Kevin	Jag har problem!	2025-04-11 13:34:22.114052+02	2d0d47f6-b5a2-40c1-b959-d25272efe556
642	Kevin	Jag har problem!	2025-04-11 13:37:13.187765+02	97333aa1-7103-4def-85b7-cd9bd4c81eca
643	Kevin	Jag har problem!	2025-04-11 13:38:24.631957+02	0c29d7bd-8fa0-45a2-a356-d4956a447bcb
644	Testkund	Hej, jag behöver hjälp!	2025-04-11 13:58:03.099596+02	0a6d081f-e235-4584-85a5-8ed84c5de0a6
645	Testkund	Hej, jag behöver hjälp!	2025-04-11 13:59:48.351858+02	0bdd7913-d688-43cd-9c3c-45633a34e83e
646	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:04:20.497328+02	86a2a90c-f615-4a44-a3d5-7863b58012f8
647	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:11:01.685049+02	cca62a9a-f490-4bea-90dd-7972d39c7faa
648	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:13:08.820553+02	56e5bfb1-7c13-422f-919b-09c220b7c25b
649	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:15:50.365886+02	69ac2f98-5b0b-4ec6-a2d6-bb9586eccf7a
650	Kevin	Jag har problem!	2025-04-11 14:16:40.66832+02	135b90de-d95d-4d27-b924-d1c4f602702d
651	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:16:40.820425+02	8b0e59ab-bec1-4ff2-a6f3-4007e6438687
652	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:24:27.28237+02	30eafe28-36a3-415f-8c58-1c5b0def6859
653	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:27:29.552321+02	2485655f-a4b4-491e-b88b-814e417935d8
654	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:32:41.355012+02	b164d920-7a1c-4194-a769-7d6267d259c1
655	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:34:57.947476+02	75eb40c5-68c3-48af-a521-fe03b2092a00
656	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:36:16.446138+02	7f42d7ee-04ae-4316-b305-9b2eae1573b1
657	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:37:56.290365+02	13f275e3-aa5a-496d-a9ed-4c98b107e6c3
658	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:39:20.413448+02	c0a657cd-365f-48b6-8b48-3756878b9265
659	Testkund	Hej, jag behöver hjälp!	2025-04-11 14:40:03.464484+02	00cfc52f-abf5-4004-ac0f-576f0b069396
660	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:07:34.855915+02	b8c481f3-b4b0-4d86-8668-929d61c9606c
661	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:09:47.032335+02	daa7d369-1412-4c0f-a815-c9a18f819cc5
662	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:13:28.886078+02	8d1d061c-ed61-428f-b0f4-70cf26ce764d
663	Kevin	Jag har problem!	2025-04-11 16:14:20.944412+02	81829966-163a-4a88-bdbb-fe503156fa70
664	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:14:21.00862+02	b947f9c0-f221-463a-aee4-21901f5eb3fa
665	Kevin	Jag har problem!	2025-04-11 16:15:36.657408+02	fe6d8977-cc45-439c-aad1-b7ea3ad9eb4b
666	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:15:36.705177+02	f23f72ac-f9c9-4278-b736-0d1a5537b40b
667	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:19:14.683476+02	5e9d02a9-f71d-40e7-9492-400b9054453a
668	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:22:40.974819+02	fa5ab917-076d-474a-9e31-c603c33f9289
669	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:23:36.73625+02	552a10bf-1cdf-403d-b9f0-706fb24fe748
670	Testkund	Hej, jag behöver hjälp!	2025-04-11 16:26:20.440599+02	93db9449-9ce6-4d8f-b004-816d3d85e9dc
671	Postman Test	Modemet blinkar rött.	2025-04-11 17:27:30.71876+02	6b306538-cfa1-4297-9c16-a231c34836f2
672	Postman Test	Modemet blinkar rött.	2025-04-11 17:28:33.713637+02	ee9b1468-5e71-4971-8725-faff63cd4b1e
673	Postman Test	Modemet blinkar rött.	2025-04-11 17:29:02.932844+02	ff984e0b-38ca-4c0d-a074-b1727e843414
674	Test Person	Han shot first, right?	2025-04-12 09:12:06.01291+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
675	Test Person	Han shot first, right?	2025-04-12 09:23:16.527022+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
676	Test Person	Han shot first, right?	2025-04-12 09:23:25.094855+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
677	Test Person	Han shot first, right?	2025-04-12 09:24:16.722919+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
678	Test Person	Han shot first, right?	2025-04-12 09:24:19.402977+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
679	Test Person	Han shot first, right?	2025-04-12 09:24:36.476984+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
680	Test Person	Han shot first, right?	2025-04-12 09:25:14.547172+02	8e92d748-ccbe-4b4b-976e-17ce25a0674b
681	Kevin	Han shot first, right?	2025-04-12 09:26:31.187181+02	8abd6be1-35e0-42a9-98af-0033caa9e126
682	KevinTest	Modemet kopllar ner varje gång någon lyfter på hemtelefonen ... 	2025-04-12 09:34:07.40296+02	1b16a072-869f-47f6-b90d-e4a02d91c6d3
683	KevinTest	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	2025-04-12 09:34:20.317782+02	2d1be687-7378-49a2-aeae-175fe52dae5d
684	KevinTest	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	2025-04-12 09:35:10.658352+02	45f9f64a-0fb8-4152-a469-c5125218fdc6
685	KevinTest	Säger du deet	2025-04-12 09:35:43.957991+02	45f9f64a-0fb8-4152-a469-c5125218fdc6
686	KevinAdmin	Säger du det?	2025-04-12 09:36:21.182507+02	45f9f64a-0fb8-4152-a469-c5125218fdc6
687	KevinTest	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	2025-04-12 09:36:49.069118+02	ad664e9e-9c36-4a38-938b-6ec775306e54
688	TestKund	Testar ett formulär för teleärenden	2025-04-15 14:32:26.585413+02	9ae76287-f301-443c-a13e-38622195fc76
\.


--
-- Data for Name: chat_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.chat_ratings (id, chat_token, rating, feedback, submitted_at) FROM stdin;
7	04e093b4-9721-480d-b68b-c877a9034a36	4		2025-03-17 10:32:00.321506
\.


--
-- Data for Name: dynamicforms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dynamicforms (id, formtype, firstname, companytype, email, fields, message, chattoken, submittedat, ischatactive) FROM stdin;
\.


--
-- Data for Name: fordon_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fordon_forms ("Id", first_name, email, reg_nummer, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
29	Löken	löken.test@gmail.com	ABC123	Garantiärende	Bilen låter konstigt när jag startar den.	a611bb74-5a8d-4e13-b20b-a942d4f0a790	2025-04-07 10:24:39.237714+02	t	Fordonsservice
2	test3	shaabaan_@hotmail.com	152	Problem efter reparation	test	2a9924d3-fb94-4fcc-ac75-86740a259673	2025-03-11 10:38:59.915701+01	f	Fordonsservice
1	Kajsa	shaabaan_@hotmail.com	ges125	Garantiärende	Min motor har lagt av	8f18cf90-57c1-4e4c-bd85-370bc07428e1	2025-03-07 13:39:55.027154+01	f	Fordonsservice
4	Ville	ville.eliasson99@gmail.com	asd123	Problem efter reparation	sdf	a2b3603d-a110-432d-ae24-21c1923f6a1a	2025-03-12 09:51:14.293023+01	f	Fordonsservice
3	Ville	ville.eliasson99@gmail.com	asd123	Garantiärende	test2	51cedfa1-83b4-46ab-9a61-32671be6d84d	2025-03-11 13:59:41.056198+01	f	Fordonsservice
5	testing	staff@mail.com	abc123	Problem efter reparation	123	4578ad10-3f90-45e5-83be-e6dab9468710	2025-03-13 15:07:19.675215+01	f	Fordonsservice
6	testing	testing8@gmail.com	abc123	Problem efter reparation	321	fe177498-183d-4391-9c80-c62e9afeffdf	2025-03-13 15:23:21.867761+01	f	Fordonsservice
7	Admino	nystrom.sigge1@gmail.com	kkk888	Reklamation	hjälp	04e093b4-9721-480d-b68b-c877a9034a36	2025-03-13 15:28:28.165661+01	f	Fordonsservice
8	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	732038c4-7238-465b-8519-ef108df59080	2025-04-04 10:31:03.2023+02	t	Fordonsservice
36	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	fccc7f71-76a2-45d7-9f5b-31bf1fb01ee8	2025-04-07 13:07:37.472407+02	t	Fordonsservice
31	Löken	löken.test@gmail.com	ABC123	Garantiärende	Bilen låter konstigt när jag startar den.	f2f6e662-133b-40f6-8fe7-16b7c285ffca	2025-04-07 10:49:19.845247+02	t	Fordonsservice
32	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	a186a64a-0119-478b-9f62-8a877a02021b	2025-04-07 11:57:23.127798+02	t	Fordonsservice
33	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	bede35f2-abc1-4ab6-be99-9fd8eef4a092	2025-04-07 12:06:38.619671+02	t	Fordonsservice
34	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	f1a4999b-bd0c-4434-8f75-c5ed8c0c2958	2025-04-07 12:07:34.365027+02	t	Fordonsservice
35	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	24788fb7-3b58-4253-acbf-ce1e7521b870	2025-04-07 12:50:34.714116+02	t	Fordonsservice
37	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	0016109b-b0a7-48a1-8263-0dc08fe80b05	2025-04-07 13:09:54.017135+02	t	Fordonsservice
38	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	68472100-e45a-4b2b-bda5-25ff47668297	2025-04-07 13:16:29.760917+02	t	Fordonsservice
39	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	c5c1c55d-98bf-4695-a3d6-113cbb671044	2025-04-07 13:22:08.639067+02	t	Fordonsservice
40	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	4ca3d7c4-294a-401a-a2ad-868027e0b1b7	2025-04-07 13:43:31.224401+02	t	Fordonsservice
41	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	04d0792f-b2f4-43e3-a5bb-7296b66f793f	2025-04-07 14:36:58.433738+02	t	Fordonsservice
42	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	0e2b0dcd-b05c-40d0-9b87-6aceb18e2414	2025-04-07 16:21:40.772488+02	t	Fordonsservice
43	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	8ff5bd33-3083-4c7a-8b9b-016a7cae7dc7	2025-04-07 16:34:55.65753+02	t	Fordonsservice
44	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	f59d7443-37ca-45cf-8012-2250fbfa1bc5	2025-04-07 16:41:27.841803+02	t	Fordonsservice
45	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	16bc12c0-5e7a-4613-96a0-d2fc1e8e4364	2025-04-07 16:42:09.190676+02	t	Fordonsservice
46	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	c33ee079-7650-4320-9ed9-d086b7676edd	2025-04-07 16:47:33.830117+02	t	Fordonsservice
47	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	73e756c7-be34-481a-988d-ed112b835bac	2025-04-07 16:52:35.780365+02	t	Fordonsservice
48	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	10a660e6-205b-4459-8fb6-a073a8ca09ac	2025-04-07 16:55:51.875807+02	t	Fordonsservice
49	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	df0befb8-bf6a-4c38-ba0a-d41e61672761	2025-04-07 17:02:49.107903+02	t	Fordonsservice
50	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	acffe46f-01fb-46b1-b36f-cac678d216df	2025-04-07 17:11:23.170842+02	t	Fordonsservice
51	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	fbbed657-05d9-4597-9cc0-4326beba03c5	2025-04-07 17:18:06.287221+02	t	Fordonsservice
52	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	6b5744d9-c4d9-4190-b3a0-42d510c49ad3	2025-04-07 17:22:03.813368+02	t	Fordonsservice
53	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	1cd6abb5-642a-4f64-a005-e816bd1e15bc	2025-04-07 17:36:09.129057+02	t	Fordonsservice
54	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	74af9cbb-6168-4e4a-8945-9286a0647e4d	2025-04-07 17:46:08.364243+02	t	Fordonsservice
55	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	b2049186-d1ef-4b8e-96a1-b895391db0bf	2025-04-07 17:51:22.577692+02	t	Fordonsservice
56	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	1f4608fb-b9e1-4d91-b14f-2401e702d42d	2025-04-07 17:56:32.494789+02	t	Fordonsservice
57	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	1eacb40f-7c94-459a-ab1a-a7d429b3c8fa	2025-04-07 18:09:49.330645+02	t	Fordonsservice
58	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	215dbee8-2b14-4732-9933-60c5db2e59d0	2025-04-07 18:10:59.876875+02	t	Fordonsservice
59	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	9ad2782c-85c3-4c5b-bfdc-bdb0c6227dd4	2025-04-07 18:15:39.466676+02	t	Fordonsservice
60	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	982f0026-d9c1-4ed5-83b1-2aeba4048df1	2025-04-07 18:16:57.864471+02	t	Fordonsservice
61	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	865a34a4-7fb9-4992-9e23-acd3a88dcc01	2025-04-07 20:15:16.198642+02	t	Fordonsservice
62	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	8927d432-16db-45e2-981b-07adb2106f29	2025-04-07 20:38:16.652479+02	t	Fordonsservice
63	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	96224af7-7ddc-462e-be1b-1858b511d628	2025-04-07 20:43:38.905721+02	t	Fordonsservice
64	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	2d4ad722-800e-4233-8fc8-736500c6191e	2025-04-07 20:44:34.469431+02	t	Fordonsservice
65	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	62989950-5937-48ae-9f2d-61391f549040	2025-04-07 21:11:56.404993+02	t	Fordonsservice
66	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	2ebfcba3-e4db-41ea-9310-71042424479c	2025-04-07 21:14:29.815536+02	t	Fordonsservice
67	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	db458145-aae5-4aac-a91e-3c5fa12d2145	2025-04-07 21:16:33.777926+02	t	Fordonsservice
68	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	cd73806a-a158-4510-b86c-9df8b1607ceb	2025-04-07 21:29:35.129762+02	t	Fordonsservice
69	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	1bf5268a-b6f6-42ae-9e0d-7401e13dc86b	2025-04-07 21:35:35.876331+02	t	Fordonsservice
70	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	749bd642-2d42-4676-a003-c1c1acda7e30	2025-04-07 21:37:12.132629+02	t	Fordonsservice
71	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	b10483fc-04a1-4ce0-93a4-7e598caac020	2025-04-07 21:38:36.642417+02	t	Fordonsservice
72	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	f00f1105-a656-410d-8631-9c405e3ecd37	2025-04-07 21:42:31.971067+02	t	Fordonsservice
73	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	367f92d9-9277-4287-af52-08038ee0a5fb	2025-04-07 21:46:34.020605+02	t	Fordonsservice
74	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	96aaf00b-21f0-49a4-b9f6-8789f82d3046	2025-04-07 21:55:46.364907+02	t	Fordonsservice
75	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	3aa78d66-c516-4f4b-b394-792364063bb5	2025-04-07 22:02:53.731017+02	t	Fordonsservice
76	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	7215df27-cc55-4cc1-9eb6-dc0eea9b76b4	2025-04-07 22:07:22.295805+02	t	Fordonsservice
77	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	a981b7fc-8fb7-4a44-a94a-5c1b9ca239f0	2025-04-07 22:16:55.097294+02	t	Fordonsservice
78	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	fdaa042d-707e-438a-920c-63f8e06d5895	2025-04-07 22:19:51.497929+02	t	Fordonsservice
79	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	1850ac06-fd04-4a5d-8337-76be6f0648ef	2025-04-07 22:31:40.130467+02	t	Fordonsservice
80	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	0f8fa7a8-277b-44e6-8c41-5a525a252a15	2025-04-07 22:37:50.739012+02	t	Fordonsservice
81	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	acf856bd-8dd9-4960-864d-bbc95975540b	2025-04-07 22:44:58.845647+02	t	Fordonsservice
82	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	bb8b7123-4cc0-419c-93dd-3b7e42584a99	2025-04-07 22:52:04.994769+02	t	Fordonsservice
83	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	b510a0e7-35cd-48e1-b83d-a6cfbc2d8948	2025-04-07 23:07:36.725235+02	t	Fordonsservice
84	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	a43b76f8-9769-447a-aac3-402b7403ae2d	2025-04-07 23:13:18.656004+02	t	Fordonsservice
85	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	4155f9e3-fea0-4856-b7e8-12ee9fee6df8	2025-04-07 23:17:39.50234+02	t	Fordonsservice
86	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	5a766125-2527-4a85-937d-872f6457b76c	2025-04-07 23:23:35.949013+02	t	Fordonsservice
87	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	3fada5ab-12f7-4e1b-82a3-a9cfc1685adb	2025-04-07 23:28:27.488568+02	t	Fordonsservice
88	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	31bb6ef5-794f-4528-be8c-cb85062cacfe	2025-04-07 23:32:03.36801+02	t	Fordonsservice
89	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	4e084e23-d04c-42b2-8f9f-345232ab4c71	2025-04-07 23:43:34.943578+02	t	Fordonsservice
90	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	27337888-6229-4ee4-9c5d-d7722f14e044	2025-04-07 23:46:35.754151+02	t	Fordonsservice
91	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	b820254b-0cb1-4ea2-be47-dea9b506b0ea	2025-04-07 23:48:04.864224+02	t	Fordonsservice
92	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	dd639829-9b82-4c0c-a5b5-3d45bc2060cf	2025-04-07 23:51:10.742563+02	t	Fordonsservice
93	Test Person	test@example.com	ABC123	Garantiärende	This is a test message describing my issue in detail. Please contact me as soon as possible.	edce9f58-5622-4302-85ed-2dd9981a68b4	2025-04-07 23:53:54.13474+02	t	Fordonsservice
94	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	73093e76-2993-412e-a5d6-d583e29faeb0	2025-04-08 08:50:39.071087+02	t	Fordonsservice
95	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	cceb13a2-3efc-40b3-a5c3-e33dc781ba08	2025-04-08 09:23:03.103203+02	t	Fordonsservice
96	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	b10af301-81f7-416b-b667-66a25dd85e6d	2025-04-08 09:34:02.614867+02	t	Fordonsservice
97	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	c911b916-4b91-48c5-8c8f-ff791bdfa9c1	2025-04-08 11:37:18.358263+02	t	Fordonsservice
98	John Doe	hultberg.80@gmail.com	ABC123	Övrigt	Hej, jag har en fråga om min beställning.	4506b0b0-cb05-4388-a6d8-67eb7d73304c	2025-04-08 11:44:09.037606+02	t	Fordonsservice
\.


--
-- Data for Name: forsakrings_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.forsakrings_forms ("Id", first_name, email, insurance_type, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
1	Ville	ville.eliasson99@gmail.com	life	coverage	hjälp mig 2	fbda28b2-db2d-4606-aed7-6637c085332c	2025-03-07 13:18:13.752398+01	t	Försäkringsärenden
2	Martin	hultberg80@gmail.com	home	coverage	test	f7b5b7ba-1375-4d89-abcc-ddda172b9c53	2025-03-11 11:35:19.429965+01	t	Försäkringsärenden
3	Ville	ville.eliasson99@gmail.com	Hemförsäkring	Pågående skadeärende	test	8f76fb7b-2027-4754-90ba-b6d5da1ce0b9	2025-03-12 14:03:02.950496+01	t	Försäkringsärenden
4	test	shaabaan_@hotmail.com	Hemförsäkring	Pågående skadeärende	test inital message	94046ae9-1cdf-4ad2-9284-0185d528a025	2025-03-14 09:47:57.437214+01	t	Försäkringsärenden
5	test2	shaabaan_@hotmail.com	Hemförsäkring	Pågående skadeärende	test inital messeage	e477a435-fef1-44cd-a693-b8849f368993	2025-03-14 09:51:01.635269+01	t	Försäkringsärenden
6	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	83aa8278-897a-4e9d-ae37-d2bc824130b5	2025-04-04 10:30:52.877901+02	t	Försäkringsärenden
7	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e704bd17-941b-4560-a8e4-f6146f91b28c	2025-04-05 22:39:39.077465+02	t	Försäkringsärenden
8	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	abf231a6-326a-4664-9531-8bce471973b2	2025-04-05 22:46:15.870457+02	t	Försäkringsärenden
9	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b612a8ab-43be-45ad-89a3-05f1673810dd	2025-04-05 22:48:19.237983+02	t	Försäkringsärenden
10	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	403681da-e3b4-482c-884e-a26147f2ff96	2025-04-05 22:54:24.062139+02	t	Försäkringsärenden
11	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	74ecc0e5-e8b2-41e5-8815-ff9a2d6aed5c	2025-04-05 23:07:06.766112+02	t	Försäkringsärenden
12	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d83e7323-5e4c-479d-bd6e-9ff4391a1cbe	2025-04-05 23:10:48.6669+02	t	Försäkringsärenden
13	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7f371c84-951c-4d61-890f-2f8433ee7d91	2025-04-06 01:07:08.901329+02	t	Försäkringsärenden
14	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	258058f9-abb9-4e17-8b95-01549b29a088	2025-04-06 01:27:37.503845+02	t	Försäkringsärenden
15	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	48bc5380-3657-4c90-a33a-e93f88d2a351	2025-04-06 01:29:30.178527+02	t	Försäkringsärenden
16	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	1a316d7b-8421-400b-8dfd-70707657c0b4	2025-04-06 01:43:03.698546+02	t	Försäkringsärenden
17	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a7703890-ec75-4c7f-b349-e866ee653565	2025-04-06 01:55:39.864092+02	t	Försäkringsärenden
18	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	34a802e3-b63a-4b28-8cc9-cb9f8519983b	2025-04-06 01:58:08.088544+02	t	Försäkringsärenden
19	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	47cff9dd-d2e2-43f6-b7c6-d49a05a0c53d	2025-04-06 02:11:44.560046+02	t	Försäkringsärenden
20	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3906e146-7d23-40e6-a9de-458ce5c09a8f	2025-04-06 02:24:38.14248+02	t	Försäkringsärenden
21	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	db450373-20f3-4d2f-b6ce-3f7e168d6553	2025-04-06 02:32:30.833963+02	t	Försäkringsärenden
22	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0ec12ad7-ad21-4073-89d3-5ee4acc051d4	2025-04-06 02:38:07.047096+02	t	Försäkringsärenden
23	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9c9ac440-ad0b-44a9-a4f0-a9e64b995669	2025-04-06 02:42:11.865088+02	t	Försäkringsärenden
24	Löken	löken.test@gmail.com		Fakturafrågor	hjälp mig	cb001359-6042-4c6c-bb58-2cd4a4e939b6	2025-04-07 10:34:19.304266+02	t	Försäkringsärenden
25	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	59ab7dbf-86ba-4f01-9c75-c8f079616aa0	2025-04-07 11:57:09.68085+02	t	Försäkringsärenden
26	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f45a837e-0417-44f9-a4c6-5b2a73c56ab2	2025-04-07 12:06:26.970292+02	t	Försäkringsärenden
27	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	853fdf23-a8fb-4e33-92bf-c85ee0c0dee0	2025-04-07 12:07:23.077492+02	t	Försäkringsärenden
28	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9525c3d5-51c4-4464-a9df-90eaab676fbc	2025-04-07 12:50:17.585236+02	t	Försäkringsärenden
29	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3d036f69-7e59-432c-b278-a26a971b885d	2025-04-07 13:07:22.833712+02	t	Försäkringsärenden
30	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e2893f39-9ef7-45b3-a005-6ca927dc6037	2025-04-07 13:09:41.352674+02	t	Försäkringsärenden
31	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	17aee66e-9ad1-4a7e-a9da-8770f68583d4	2025-04-07 13:16:16.656164+02	t	Försäkringsärenden
32	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	461d6488-2e95-4859-ab9c-cb47c6b5d0a8	2025-04-07 13:43:22.225453+02	t	Försäkringsärenden
33	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	af35aead-a759-45f7-b5dd-30f8f4d3b80e	2025-04-07 13:52:07.53454+02	t	Försäkringsärenden
34	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	270965de-1b9a-4c09-a7a1-4a34d078697a	2025-04-07 16:21:26.450312+02	t	Försäkringsärenden
35	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8d1f2d78-c400-438f-8491-3aabf0fe2d2e	2025-04-07 16:34:39.41387+02	t	Försäkringsärenden
36	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	08450420-21c2-4334-94a8-e72cdc03ea63	2025-04-07 16:41:18.447664+02	t	Försäkringsärenden
37	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	995b1222-98fa-486f-9b05-f70436dc0b2d	2025-04-07 16:41:59.991435+02	t	Försäkringsärenden
38	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	558397e8-e435-4fa1-adcc-dc5c6c92e5df	2025-04-07 16:47:20.894275+02	t	Försäkringsärenden
39	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	287c20af-a17b-4764-8f7e-b1010bc0c89c	2025-04-07 16:52:24.291661+02	t	Försäkringsärenden
40	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8cd4886d-bb04-426c-bd31-faba1f86e60a	2025-04-07 16:55:40.131273+02	t	Försäkringsärenden
41	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b5b0b469-b33c-4d7f-aa1e-6498a67c2998	2025-04-07 17:02:35.522223+02	t	Försäkringsärenden
42	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7a56d9cf-2e2b-450f-b07f-ff6d6cf159b8	2025-04-07 17:11:11.022446+02	t	Försäkringsärenden
43	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	61569cc3-9257-4dd3-8627-83e07180ee0e	2025-04-07 17:17:52.651277+02	t	Försäkringsärenden
44	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	7e5436c0-8841-4903-a057-b9d74438d812	2025-04-07 17:21:51.837757+02	t	Försäkringsärenden
45	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f3fad663-7a3e-4355-b5e1-8f9cb8400130	2025-04-07 17:35:56.84292+02	t	Försäkringsärenden
46	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	6fc38d52-61e2-421f-ac07-4e15488de57f	2025-04-07 17:45:53.520505+02	t	Försäkringsärenden
47	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	2eb2eb84-6f65-4f67-a1cd-99d06f9ffa9f	2025-04-07 17:51:09.486517+02	t	Försäkringsärenden
48	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	949ff994-93e9-4c46-98b8-667f7df59306	2025-04-07 17:56:19.113496+02	t	Försäkringsärenden
49	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	13d7af85-3ef6-45f7-93e6-6799094648d5	2025-04-07 18:09:36.079474+02	t	Försäkringsärenden
50	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5809d7e4-802c-41d2-947c-dc01367218a3	2025-04-07 18:10:47.581436+02	t	Försäkringsärenden
51	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	042a6496-c66a-4121-b61c-852ba62c8f65	2025-04-07 18:15:25.315672+02	t	Försäkringsärenden
52	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d4c45255-ef65-42cc-9cd5-a3fe85ef0aab	2025-04-07 18:16:44.889315+02	t	Försäkringsärenden
53	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e6b5e924-3fe5-47c6-8afb-935f566060d9	2025-04-07 18:29:11.419178+02	t	Försäkringsärenden
54	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	a152c114-e060-41f4-baf2-c836f29bae8b	2025-04-07 20:15:08.914329+02	t	Försäkringsärenden
55	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	26d3a624-2064-455f-9c9a-5ee11220f030	2025-04-07 20:38:07.364588+02	t	Försäkringsärenden
56	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d79c00e6-796e-496d-a773-1a1b65d6850f	2025-04-07 20:43:32.551412+02	t	Försäkringsärenden
57	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5defbf27-29c5-4956-abbb-30e16c488591	2025-04-07 20:44:28.211672+02	t	Försäkringsärenden
58	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	ebe6fa8f-c397-4f0e-8ccb-e64cd35419cf	2025-04-07 21:11:49.567314+02	t	Försäkringsärenden
59	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	39e9e0d6-8607-4938-b26e-0d1804bc8da1	2025-04-07 21:14:22.301937+02	t	Försäkringsärenden
60	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	ccea9553-06ec-4a81-8f11-2108c92f6ff9	2025-04-07 21:16:26.395933+02	t	Försäkringsärenden
61	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f405b0c7-0ab1-4d2e-b428-3207fa7ae2da	2025-04-07 21:29:26.267649+02	t	Försäkringsärenden
62	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	3e753a56-f719-48fc-ada1-69b13dc2be63	2025-04-07 21:35:27.663914+02	t	Försäkringsärenden
63	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f2e253ba-bda4-4542-94b5-10ad94cce98f	2025-04-07 21:37:02.896546+02	t	Försäkringsärenden
64	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	9cefdeed-6f27-4aff-a28f-7da9ceb86869	2025-04-07 21:38:27.952269+02	t	Försäkringsärenden
65	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	0d28c7d6-02c8-4049-9877-1817d239312e	2025-04-07 21:42:24.578575+02	t	Försäkringsärenden
66	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	f8c20aeb-c891-47d2-89e0-70420c48a1b4	2025-04-07 21:46:27.276237+02	t	Försäkringsärenden
67	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	987e1d6c-3fef-48c0-b477-27a9607628b6	2025-04-07 21:55:33.844418+02	t	Försäkringsärenden
68	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5ce2cf0b-53a0-46d0-9a19-b6ea00d22e05	2025-04-07 22:02:43.52658+02	t	Försäkringsärenden
69	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	e7bc95a9-74d3-486f-8505-1fcc24131580	2025-04-07 22:07:08.562199+02	t	Försäkringsärenden
70	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	d34e8266-b57d-47fd-934a-fe63813294cf	2025-04-07 22:16:36.091654+02	t	Försäkringsärenden
71	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	c4ba1f51-915b-4d47-a590-b63bcea94946	2025-04-07 22:19:38.314452+02	t	Försäkringsärenden
72	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	caeffaa9-28c9-464c-b281-fa76c6b5e25b	2025-04-07 22:31:25.308083+02	t	Försäkringsärenden
73	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	06f649c1-7df7-48de-9758-35e8f4263c28	2025-04-07 22:37:37.598803+02	t	Försäkringsärenden
74	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	352ab12e-ee5c-4f53-9d5f-01682413688d	2025-04-07 22:44:44.599433+02	t	Försäkringsärenden
75	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	8066ee2b-c9fb-460d-9b68-15c2dbc33671	2025-04-07 22:48:41.672928+02	t	Försäkringsärenden
76	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	5371fa27-0db1-45ec-aad9-34ab221f528f	2025-04-07 22:51:49.126819+02	t	Försäkringsärenden
77	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b0da324b-ed7e-4fc9-ac93-51d8d2dde4d8	2025-04-07 23:07:21.259485+02	t	Försäkringsärenden
78	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	49edb2ce-2139-4f90-802f-e97271d62119	2025-04-07 23:13:06.986825+02	t	Försäkringsärenden
79	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	709248b6-f063-4920-b0bb-4ebf7bf1359b	2025-04-07 23:17:27.550708+02	t	Försäkringsärenden
80	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	76761119-fd08-492b-8ad4-3c0badaf3f4c	2025-04-07 23:23:21.959118+02	t	Försäkringsärenden
81	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	010ae747-05a4-4125-8040-bdcb37e0eadd	2025-04-07 23:28:14.199977+02	t	Försäkringsärenden
82	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	dc15016b-37f0-482e-a568-f20746cd93af	2025-04-07 23:31:53.64162+02	t	Försäkringsärenden
83	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	82365dbd-bef0-458d-8cd1-4b8c43fbada3	2025-04-07 23:43:18.705039+02	t	Försäkringsärenden
84	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	33fe2f5d-1b7a-4988-9f21-c71d684c9904	2025-04-07 23:46:25.420818+02	t	Försäkringsärenden
85	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	6258e691-e621-4376-a51b-6b205c7ca5d3	2025-04-07 23:47:54.810133+02	t	Försäkringsärenden
86	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	b39407eb-775e-49ce-917c-2727ba8c3188	2025-04-07 23:50:58.713145+02	t	Försäkringsärenden
87	Test Person	test@example.com	Hemförsäkring	Fakturafrågor	This is a test message describing my issue in detail. Please contact me as soon as possible.	eb13e6b3-c80d-471e-ac92-43cfab5fc3c0	2025-04-07 23:53:43.454113+02	t	Försäkringsärenden
\.


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role (id, company_role) FROM stdin;
1	Staff
2	Admin
3	Super-Admin
\.


--
-- Data for Name: tele_forms; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tele_forms ("Id", first_name, email, service_type, issue_type, message, chat_token, submitted_at, is_chat_active, company_type) FROM stdin;
58	Ville	ville.eliasson99@gmail.com	Bredband	Tekniskt problem	123	764c78db-de5f-40c9-8e62-53a472e5373a	2025-03-17 10:40:26.646817+01	t	Tele/Bredband
59	Shaban	shaabaan_@hotmail.com	Bredband	Uppsägning	test	c53f9af1-59ef-4446-b92f-ab2f69ab799c	2025-03-17 10:41:59.911811+01	t	Tele/Bredband
60	Oskar	shaabaan_@hotmail.com	Bredband	Ändring av tjänst	test	093c334e-2973-4218-b663-40689b07452e	2025-03-17 11:09:40.573162+01	t	Tele/Bredband
61	Kalle	shaabaan_@hotmail.com	Bredband	Fakturafrågor	hjälp mig!!	126897f3-92e7-410f-b04c-114f70ca6bc9	2025-03-17 11:20:56.63672+01	t	Tele/Bredband
62	Pontus	shaabaan_@hotmail.com	Bredband	Fakturafrågor	Min faktura är för dyr	b93c9d1f-8043-4541-92e0-f01f64436928	2025-03-18 14:35:52.89517+01	t	Tele/Bredband
63	Putte	shaabaan_@hotmail.com	Bredband	Fakturafrågor	Hej min faktura är för dyr	3c207fcb-0c30-4e3f-b8ae-fd2aff3b8022	2025-03-24 20:20:51.359099+01	t	Tele/Bredband
64	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	9a97700f-86e0-42db-b81f-696069b81f91	2025-04-04 10:31:09.766236+02	t	Tele/Bredband
65	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	48f781c8-9522-45d3-b595-db21ac86ceb8	2025-04-05 22:39:56.461446+02	t	Tele/Bredband
66	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	4fd6aea6-a808-485e-aa39-a44eeb816b7f	2025-04-05 22:46:32.180228+02	t	Tele/Bredband
67	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1692f76f-d7f8-4aaa-bebf-0e14e2764557	2025-04-05 22:48:37.612535+02	t	Tele/Bredband
68	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a5c9a8b4-d9fe-4990-8bcb-96d69ae93380	2025-04-05 22:54:44.827413+02	t	Tele/Bredband
69	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	7bd90d73-84c9-45e7-ad8c-777ad1981fb8	2025-04-05 23:07:20.58267+02	t	Tele/Bredband
70	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ca6e1315-ecd5-4d6b-acf7-f20dd4dbfeaa	2025-04-05 23:11:02.773225+02	t	Tele/Bredband
71	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	d746f089-c5aa-4cb0-9585-2783dc852a88	2025-04-06 01:07:27.054219+02	t	Tele/Bredband
72	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c8f213c6-5ebb-401e-b307-c5268b1c3fe9	2025-04-06 01:27:53.377642+02	t	Tele/Bredband
73	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a4256dde-d989-4340-a8bc-c74822fe6130	2025-04-06 01:43:21.894812+02	t	Tele/Bredband
74	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6f7b8da6-3460-4389-a6e0-518eb524e355	2025-04-06 01:55:59.323113+02	t	Tele/Bredband
75	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	454f4780-b2e2-4f21-8582-d9a2e6b5b09a	2025-04-06 01:58:22.945213+02	t	Tele/Bredband
76	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e9d78982-b97e-4b10-967f-319e646f3eb6	2025-04-06 02:12:01.176466+02	t	Tele/Bredband
77	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a144f288-90cc-4239-85cc-0fe6f9a30b5c	2025-04-06 02:24:54.041446+02	t	Tele/Bredband
78	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e444d31b-30fe-4703-96a3-07f04b61b2ac	2025-04-06 02:32:47.085156+02	t	Tele/Bredband
79	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	63a6de7e-5824-4d06-a69a-9f6e4c75b82f	2025-04-06 02:38:24.956877+02	t	Tele/Bredband
80	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	44152e81-3afa-4cef-b7c3-3b0b7a1a757c	2025-04-06 02:42:27.54959+02	t	Tele/Bredband
81	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	162979b2-a9ff-4756-a630-49a67aae4a18	2025-04-07 10:30:23.509119+02	t	Tele/Bredband
82	Löken	löken.test@gmail.com	Bredband	Tekniskt problem	inget fungerar.	f44a26e8-118c-47d3-a31c-9790ef3ae766	2025-04-07 11:39:28.434902+02	t	Tele/Bredband
83	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	124b2899-d539-47a6-bc33-9f273ac82c21	2025-04-07 11:57:30.463886+02	t	Tele/Bredband
84	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2a90ee55-09f6-4285-b9f1-5e410bdf7856	2025-04-07 12:06:45.136775+02	t	Tele/Bredband
85	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	301d59a9-6ae8-4b77-8fe2-76bd94a75840	2025-04-07 12:07:41.081518+02	t	Tele/Bredband
86	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	18d87b72-b9a2-4b03-a576-55c714877da2	2025-04-07 12:50:43.620187+02	t	Tele/Bredband
87	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	64b2fdce-f047-433d-86c5-c53a1f9ec430	2025-04-07 13:07:44.715542+02	t	Tele/Bredband
88	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	771e1415-fbb6-446e-ae75-2a6f2ff470a6	2025-04-07 13:10:00.377901+02	t	Tele/Bredband
89	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	70b60853-d9b6-4a67-8497-71d04bf21a91	2025-04-07 13:16:37.109721+02	t	Tele/Bredband
90	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ff1fd07c-d783-4383-b628-3e2bd29924b0	2025-04-07 13:22:16.008185+02	t	Tele/Bredband
91	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b324f4be-3d4f-4ce1-9f96-ab36f4ea1f3d	2025-04-07 13:43:36.793347+02	t	Tele/Bredband
92	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2f4ff827-90e6-4ebf-8593-2e0486cf0933	2025-04-07 16:21:48.01088+02	t	Tele/Bredband
93	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ba648216-b8e3-4478-a827-df7ed2d51093	2025-04-07 16:35:04.168483+02	t	Tele/Bredband
94	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1ee9bf5e-bdf6-4813-932f-1f9fffa8a1e5	2025-04-07 16:41:34.14127+02	t	Tele/Bredband
95	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2c399e98-1142-436e-a002-d8ee50f4b268	2025-04-07 16:42:15.280065+02	t	Tele/Bredband
96	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	fbd8cafd-de55-465e-8539-5f168c13e951	2025-04-07 16:47:40.963935+02	t	Tele/Bredband
97	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2b8150cd-7c62-4e7d-9047-967b58c6d335	2025-04-07 16:52:42.267287+02	t	Tele/Bredband
98	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	226f6c21-5093-43c8-b51a-81a62935be37	2025-04-07 16:55:58.216298+02	t	Tele/Bredband
99	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	42c05906-da90-4e70-9043-345692187b72	2025-04-07 17:02:57.216374+02	t	Tele/Bredband
100	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	39420a89-2106-47a2-85da-f346366b4f9a	2025-04-07 17:11:30.553892+02	t	Tele/Bredband
101	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ccaf59ee-0a19-4177-8576-e42feb943b94	2025-04-07 17:18:20.380817+02	t	Tele/Bredband
102	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	585d8457-53b1-4393-b38f-3fc978e5c9e9	2025-04-07 17:22:11.331868+02	t	Tele/Bredband
103	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	227191f9-63d9-4ed4-b9fe-930a08f2b3d6	2025-04-07 17:36:15.69698+02	t	Tele/Bredband
104	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	b076ce81-7307-4da2-adec-ed1fddef0ceb	2025-04-07 17:46:23.37923+02	t	Tele/Bredband
105	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5e00f611-51d0-45a8-a90b-63ead565677c	2025-04-07 17:51:32.427232+02	t	Tele/Bredband
106	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2b0998dc-cac5-4d86-b1db-7f61c378e6c2	2025-04-07 17:56:42.196867+02	t	Tele/Bredband
107	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f2a11e61-4b2b-43c2-a8aa-77135728094d	2025-04-07 18:09:56.782169+02	t	Tele/Bredband
108	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ef99b72c-de78-4b3f-aaa4-05ec719633d0	2025-04-07 18:11:07.010926+02	t	Tele/Bredband
109	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	857937ff-0004-4b1a-95cf-787c8ab7fce9	2025-04-07 18:15:48.28282+02	t	Tele/Bredband
110	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	de12b8aa-9dac-4797-b650-30cfac46cf9f	2025-04-07 20:15:21.046681+02	t	Tele/Bredband
111	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	1d7b2e85-451e-4051-97d1-bcfc1cdc2756	2025-04-07 20:38:22.270132+02	t	Tele/Bredband
112	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8e92d748-ccbe-4b4b-976e-17ce25a0674b	2025-04-07 20:43:43.940726+02	t	Tele/Bredband
113	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c0ca282d-cbcb-4f31-8d82-64c2b83f9663	2025-04-07 20:44:38.742689+02	t	Tele/Bredband
114	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8df38a04-1830-4564-96c6-fbfdf0563a21	2025-04-07 21:12:00.620675+02	t	Tele/Bredband
115	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	82c92e3e-e740-48c3-a570-3373bb63f2d8	2025-04-07 21:14:34.031691+02	t	Tele/Bredband
116	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5de6f5e5-7e0c-49b8-9f08-bab3361368fc	2025-04-07 21:16:38.262987+02	t	Tele/Bredband
117	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	34a14dd1-e74b-447b-a20a-7fccb561c80a	2025-04-07 21:29:40.148504+02	t	Tele/Bredband
118	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0a217d1d-8f76-41eb-9eac-118cd822c50f	2025-04-07 21:35:41.183095+02	t	Tele/Bredband
119	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0e00fcae-3500-4e41-832b-22856e93f3a0	2025-04-07 21:37:17.881114+02	t	Tele/Bredband
120	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	0e53794b-28aa-4f4f-b05b-fafff5efab2e	2025-04-07 21:38:40.842455+02	t	Tele/Bredband
121	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	f4c93a08-c061-4ab2-a41a-2274fb23031e	2025-04-07 21:42:36.320618+02	t	Tele/Bredband
122	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	e4821600-bc28-4be1-8739-4ad227afa1e5	2025-04-07 21:46:39.940639+02	t	Tele/Bredband
123	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	82b24062-1391-4efd-9852-bf23ef64775e	2025-04-07 21:55:52.083744+02	t	Tele/Bredband
124	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	de037df6-cca8-432f-9ef4-78349f850355	2025-04-07 22:03:00.176273+02	t	Tele/Bredband
125	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	49db9673-6e8c-4e19-8c84-8b839daf100d	2025-04-07 22:07:36.677931+02	t	Tele/Bredband
126	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	ae1070ba-0139-4992-8910-ec2dd1bb63e2	2025-04-07 22:17:05.47052+02	t	Tele/Bredband
127	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	c55394d1-983b-4c95-b4e8-6847fe087e6e	2025-04-07 22:19:58.592597+02	t	Tele/Bredband
128	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6277102d-3db4-4929-bdfc-7df2d7bab9e7	2025-04-07 22:31:47.355326+02	t	Tele/Bredband
129	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	97d0ad59-c581-46bc-9b7a-06b6500c3e3c	2025-04-07 22:38:01.516332+02	t	Tele/Bredband
130	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	3950e967-20b2-4aa7-9f96-8f1e97763fb4	2025-04-07 22:45:11.089904+02	t	Tele/Bredband
131	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	a2b9482d-85e9-4e36-9514-65ed6fcc7765	2025-04-07 22:52:13.165568+02	t	Tele/Bredband
132	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	dcd24067-9281-4802-96f0-e0e4390a6ea2	2025-04-07 23:07:43.494025+02	t	Tele/Bredband
133	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	9fe7f6e6-8604-4bab-b66c-9474715494da	2025-04-07 23:13:25.630821+02	t	Tele/Bredband
134	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	09e639d4-9d07-452d-8388-7eefba507eb3	2025-04-07 23:23:42.648414+02	t	Tele/Bredband
135	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	8631cc61-6ff5-4283-80df-ebfb24417d13	2025-04-07 23:28:41.863398+02	t	Tele/Bredband
136	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	5c397c7e-efbf-4f88-b35e-07ac5e0e234d	2025-04-07 23:32:08.860324+02	t	Tele/Bredband
137	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	825b896e-80e4-4e01-86ff-3469992a2e4e	2025-04-07 23:43:43.158902+02	t	Tele/Bredband
138	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	6b5ee55e-9fab-4fdb-a55a-61e74595ab09	2025-04-07 23:46:41.148289+02	t	Tele/Bredband
139	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2a1a1bca-6ae6-491a-9bb0-a2007959943e	2025-04-07 23:48:10.47891+02	t	Tele/Bredband
140	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	2ab1e161-f14c-43e5-b0e6-67f958292ac0	2025-04-07 23:51:17.423646+02	t	Tele/Bredband
141	Test Person	test@example.com	Bredband	Tekniskt problem	This is a test message describing my issue in detail. Please contact me as soon as possible.	3c2a3c61-0b9c-4bd9-9b0a-28095323a790	2025-04-07 23:54:00.619931+02	t	Tele/Bredband
142	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	as	9707e05f-9e27-423e-a9f8-5f2fdbd6b349	2025-04-08 13:58:03.19151+02	t	Tele/Bredband
143	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	a	a5979119-6ff2-42ed-b338-f57e1029f969	2025-04-08 14:09:51.56102+02	t	Tele/Bredband
144	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	184b5d54-a458-4165-9a2a-d93a0ecc6ef9	2025-04-08 14:23:50.026945+02	t	Tele/Bredband
145	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	27efd174-5a04-4434-af18-2259e999c6c8	2025-04-08 17:47:18.082292+02	t	Tele/Bredband
146	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	a6ed8e8d-b35b-4bea-a161-0cf229af6491	2025-04-08 17:49:19.143586+02	t	Tele/Bredband
147	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Hej!	7b876bd9-046f-48ba-8dfa-dfd0a3e48f80	2025-04-08 17:54:05.830256+02	t	Tele/Bredband
148	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	605ca6de-f064-4b6c-9f8d-c54351c38ad3	2025-04-08 17:55:49.615529+02	t	Tele/Bredband
149	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	1333a2f6-b30e-4f9d-a692-edb7b158063f	2025-04-08 18:09:25.62516+02	t	Tele/Bredband
150	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	704dfbba-5224-42c2-b6a8-2121c7b5e44d	2025-04-08 18:10:06.30907+02	t	Tele/Bredband
151	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	8735f944-a7e7-4860-accf-901a0b9d9caa	2025-04-08 18:18:37.046273+02	t	Tele/Bredband
152	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	f9bac75b-96f3-4b9d-bd73-ccdeea8be13e	2025-04-09 10:16:31.945196+02	t	Tele/Bredband
153	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	545b2a0a-1943-4f6d-bbae-b64cc0fc37f3	2025-04-09 10:17:42.051379+02	t	Tele/Bredband
154	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	8abd6be1-35e0-42a9-98af-0033caa9e126	2025-04-09 10:38:08.637283+02	t	Tele/Bredband
155	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	1f198760-c81c-4ee5-b9ec-cb23061062ef	2025-04-09 12:21:12.719793+02	t	Tele/Bredband
156	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	3789ac15-6e20-4b94-b578-37c300399ce9	2025-04-09 12:22:10.824888+02	t	Tele/Bredband
157	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	495d4ba5-50c2-4e4f-86cb-d152eee5317e	2025-04-09 13:05:20.114176+02	t	Tele/Bredband
158	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	0dbff38d-d24c-4d9c-8955-19536364e166	2025-04-09 13:06:19.436857+02	t	Tele/Bredband
159	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	7b55928b-c03a-42a7-b9ff-f79bae8614c5	2025-04-09 13:38:23.930409+02	t	Tele/Bredband
160	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	37c31aa0-cd4b-417d-a2bb-94dc81a94b00	2025-04-09 13:43:07.677123+02	t	Tele/Bredband
161	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	170da7c8-288f-406b-b498-248168694d0d	2025-04-09 13:44:11.340935+02	t	Tele/Bredband
162	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	3ba963f8-6d86-4dc7-8ed9-affea527eaf6	2025-04-09 13:44:33.238876+02	t	Tele/Bredband
163	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	1395f88a-e384-4f97-b6eb-7a243d93991f	2025-04-09 14:59:59.113539+02	t	Tele/Bredband
164	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	355260c7-9cd6-40be-a38b-deab90446b56	2025-04-09 15:00:39.437809+02	t	Tele/Bredband
165	Kevin	kevin@example.com	Bredband	Tekniskt problem	Jag har problem!	0d3f6216-451d-48a7-8a82-3bb5a02901af	2025-04-09 15:03:19.182348+02	t	Tele/Bredband
166	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	ff1ba4f6-d953-4f47-ae6f-bda9d2319163	2025-04-09 15:04:45.820505+02	t	Tele/Bredband
167	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	cc6bc1c1-6b99-4a33-a6a4-7ac8543b9fcc	2025-04-09 15:11:21.557234+02	t	Tele/Bredband
168	Kevin	kevin@example.com	Bredband	Tekniskt problem	Jag har problem!	ed37cae5-5487-4618-b753-91fb7cb1998d	2025-04-09 15:12:19.386637+02	t	Tele/Bredband
169	Testare	testare@example.com	Bredband	Tekniskt problem	Jag har problem!	f6059d31-139f-4cb7-a759-e969a53d6312	2025-04-09 15:21:55.930071+02	t	Tele/Bredband
170	Testare	testare@example.com	Bredband	Tekniskt problem	Jag har problem!	9d485369-029e-47a6-8703-cdc70efa6542	2025-04-09 15:26:30.516119+02	t	Tele/Bredband
171	Testkund	testkund@example.com	Bredband	Tekniskt problem	Jag har problem!	60dcefc9-47d7-4fa7-a1e7-146ae7da30d2	2025-04-09 16:01:07.473685+02	t	Tele/Bredband
172	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	7665d1bb-8ae3-475d-bd5a-0dd8149c4bd0	2025-04-10 14:17:13.979242+02	t	Tele/Bredband
173	Testkund	testkund@example.com	Bredband	Tekniskt problem	Jag har problem!	3f12bbdb-7d77-4dd7-968e-2a237b98fa55	2025-04-10 14:17:55.916868+02	t	Tele/Bredband
174	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	8d27cdb0-680b-4f35-a3b8-bb49e5bdd579	2025-04-10 14:47:10.117931+02	t	Tele/Bredband
175	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	cf65df03-871c-463d-9e6f-f991927e8d09	2025-04-10 15:13:27.598674+02	t	Tele/Bredband
176	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	e1df0377-b90b-471b-a06b-718aae9dbbc2	2025-04-10 15:45:44.994036+02	t	Tele/Bredband
177	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	8a002455-5b84-4b73-9e10-66ef965c6608	2025-04-10 15:50:44.311771+02	t	Tele/Bredband
178	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	9b62c046-9a12-4cee-a259-a5a388d5f02e	2025-04-10 15:55:18.847984+02	t	Tele/Bredband
179	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	24b65201-2d90-44c9-ac8a-eb3aa226496f	2025-04-11 13:33:45.964489+02	t	Tele/Bredband
180	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	2d0d47f6-b5a2-40c1-b959-d25272efe556	2025-04-11 13:34:22.114052+02	t	Tele/Bredband
181	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	97333aa1-7103-4def-85b7-cd9bd4c81eca	2025-04-11 13:37:13.187765+02	t	Tele/Bredband
182	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	0c29d7bd-8fa0-45a2-a356-d4956a447bcb	2025-04-11 13:38:24.631957+02	t	Tele/Bredband
183	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	0a6d081f-e235-4584-85a5-8ed84c5de0a6	2025-04-11 13:58:03.099596+02	t	Tele/Bredband
184	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	0bdd7913-d688-43cd-9c3c-45633a34e83e	2025-04-11 13:59:48.351858+02	t	Tele/Bredband
185	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	86a2a90c-f615-4a44-a3d5-7863b58012f8	2025-04-11 14:04:20.497328+02	t	Tele/Bredband
186	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	cca62a9a-f490-4bea-90dd-7972d39c7faa	2025-04-11 14:11:01.685049+02	t	Tele/Bredband
187	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	56e5bfb1-7c13-422f-919b-09c220b7c25b	2025-04-11 14:13:08.820553+02	t	Tele/Bredband
188	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	69ac2f98-5b0b-4ec6-a2d6-bb9586eccf7a	2025-04-11 14:15:50.365886+02	t	Tele/Bredband
189	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	135b90de-d95d-4d27-b924-d1c4f602702d	2025-04-11 14:16:40.66832+02	t	Tele/Bredband
190	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	8b0e59ab-bec1-4ff2-a6f3-4007e6438687	2025-04-11 14:16:40.820425+02	t	Tele/Bredband
191	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	30eafe28-36a3-415f-8c58-1c5b0def6859	2025-04-11 14:24:27.28237+02	t	Tele/Bredband
192	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	2485655f-a4b4-491e-b88b-814e417935d8	2025-04-11 14:27:29.552321+02	t	Tele/Bredband
193	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	b164d920-7a1c-4194-a769-7d6267d259c1	2025-04-11 14:32:41.355012+02	t	Tele/Bredband
194	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	75eb40c5-68c3-48af-a521-fe03b2092a00	2025-04-11 14:34:57.947476+02	t	Tele/Bredband
195	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	7f42d7ee-04ae-4316-b305-9b2eae1573b1	2025-04-11 14:36:16.446138+02	t	Tele/Bredband
196	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	13f275e3-aa5a-496d-a9ed-4c98b107e6c3	2025-04-11 14:37:56.290365+02	t	Tele/Bredband
197	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	c0a657cd-365f-48b6-8b48-3756878b9265	2025-04-11 14:39:20.413448+02	t	Tele/Bredband
198	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	00cfc52f-abf5-4004-ac0f-576f0b069396	2025-04-11 14:40:03.464484+02	t	Tele/Bredband
199	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	b8c481f3-b4b0-4d86-8668-929d61c9606c	2025-04-11 16:07:34.855915+02	t	Tele/Bredband
200	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	daa7d369-1412-4c0f-a815-c9a18f819cc5	2025-04-11 16:09:47.032335+02	t	Tele/Bredband
201	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	8d1d061c-ed61-428f-b0f4-70cf26ce764d	2025-04-11 16:13:28.886078+02	t	Tele/Bredband
202	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	81829966-163a-4a88-bdbb-fe503156fa70	2025-04-11 16:14:20.944412+02	t	Tele/Bredband
203	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	b947f9c0-f221-463a-aee4-21901f5eb3fa	2025-04-11 16:14:21.00862+02	t	Tele/Bredband
204	Kevin	maadridista@gmail.com	Bredband	Tekniskt problem	Jag har problem!	fe6d8977-cc45-439c-aad1-b7ea3ad9eb4b	2025-04-11 16:15:36.657408+02	t	Tele/Bredband
205	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	f23f72ac-f9c9-4278-b736-0d1a5537b40b	2025-04-11 16:15:36.705177+02	t	Tele/Bredband
206	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	5e9d02a9-f71d-40e7-9492-400b9054453a	2025-04-11 16:19:14.683476+02	t	Tele/Bredband
207	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	fa5ab917-076d-474a-9e31-c603c33f9289	2025-04-11 16:22:40.974819+02	t	Tele/Bredband
208	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	552a10bf-1cdf-403d-b9f0-706fb24fe748	2025-04-11 16:23:36.73625+02	t	Tele/Bredband
209	Testkund	kund@example.com	Bredband	Tekniskt problem	Hej, jag behöver hjälp!	93db9449-9ce6-4d8f-b004-816d3d85e9dc	2025-04-11 16:26:20.440599+02	t	Tele/Bredband
210	Postman Test	postman@demo.se	Bredband	Ingen signal	Modemet blinkar rött.	6b306538-cfa1-4297-9c16-a231c34836f2	2025-04-11 17:27:30.71876+02	t	tele
211	Postman Test	postman@demo.se	Bredband	Ingen signal	Modemet blinkar rött.	ee9b1468-5e71-4971-8725-faff63cd4b1e	2025-04-11 17:28:33.713637+02	t	tele
212	Postman Test	postman@demo.se	Bredband	Ingen signal	Modemet blinkar rött.	ff984e0b-38ca-4c0d-a074-b1727e843414	2025-04-11 17:29:02.932844+02	t	tele
213	KevinTest	testare@example.com	Bredband	Tekniskt problem	Modemet kopllar ner varje gång någon lyfter på hemtelefonen ... 	1b16a072-869f-47f6-b90d-e4a02d91c6d3	2025-04-12 09:34:07.40296+02	t	tele
214	KevinTest	testare@example.com	Bredband	Tekniskt problem	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	2d1be687-7378-49a2-aeae-175fe52dae5d	2025-04-12 09:34:20.317782+02	t	tele
215	KevinTest	maadridista@gmail.com	Bredband	Tekniskt problem	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	45f9f64a-0fb8-4152-a469-c5125218fdc6	2025-04-12 09:35:10.658352+02	t	tele
216	KevinTest	lundstedtkevin@gmail.com	Bredband	Tekniskt problem	Modemet kopplar ner varje gång någon lyfter på hemtelefonen ... 	ad664e9e-9c36-4a38-938b-6ec775306e54	2025-04-12 09:36:49.069118+02	t	tele
217	TestKund	testkund@example.com	Bredband	Tekniskt problem	Testar ett formulär för teleärenden	9ae76287-f301-443c-a13e-38622195fc76	2025-04-15 14:32:26.585413+02	t	Tele/Bredband
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users ("Id", first_name, password, created_at, company, role_id, email) FROM stdin;
129	KevinStaff	abc123	2025-04-11 13:53:32.241078+02	tele	1	kevin.staff@gmail.com
136	"Staff Test"	"StaffPass123"	2025-04-11 16:15:38.803144+02	fordon	1	"staff.test@example.com"
137	Test User	SecurePass123	2025-04-11 16:15:46.970134+02	fordon	1	test.user@example.com
138	"Admin Test"	"AdminPass123"	2025-04-11 16:15:55.117512+02	tele	2	"admin.test@example.com"
139	KevinTele	test123	2025-04-12 09:42:19.359905+02	tele	1	kevin.l@gmail.com
142	KevinTele2	test123	2025-04-12 09:46:21.141923+02	tele	1	kevin2.l@gmail.com
148	Kevinaaa	abc123	2025-04-12 10:12:58.052581+02	fordon	1	maadridista@gmail.com
152	KevinTele5	test123	2025-04-15 10:27:49.594274+02	tele	1	kevin3.l@gmail.com
153	KevinTele5	test123	2025-04-15 10:28:23.094483+02	tele	1	kevin4.l@gmail.com
161	KevinTelex	test123	2025-04-15 13:06:02.1693+02	tele	1	kevin7.l@gmail.com
162	TestAnvändare	Lösenord123	2025-04-15 14:32:45.730971+02	tele	1	testuser@example.com
151	UppdateradAnvändare	NyttLösenord123	2025-04-14 13:58:24.304785+02	tele	2	kevin.admin@gmail.com
\.


--
-- Name: ChatMessages_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ChatMessages_Id_seq"', 688, true);


--
-- Name: FordonForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FordonForms_Id_seq"', 1, false);


--
-- Name: ForsakringsForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ForsakringsForms_Id_seq"', 1, false);


--
-- Name: Role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Role_id_seq"', 1, false);


--
-- Name: TeleForms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."TeleForms_Id_seq"', 1, false);


--
-- Name: Users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Users_Id_seq"', 1, false);


--
-- Name: archived_tickets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.archived_tickets_id_seq', 54, true);


--
-- Name: chat_ratings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.chat_ratings_id_seq', 7, true);


--
-- Name: dynamicforms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dynamicforms_id_seq', 1, false);


--
-- Name: fordon_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."fordon_forms_Id_seq"', 98, true);


--
-- Name: forsakrings_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."forsakrings_forms_Id_seq"', 87, true);


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.role_id_seq', 3, true);


--
-- Name: tele_forms_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."tele_forms_Id_seq"', 217, true);


--
-- Name: users_Id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."users_Id_seq"', 162, true);


--
-- Name: chat_messages ChatMessages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_messages
    ADD CONSTRAINT "ChatMessages_pkey" PRIMARY KEY (id);


--
-- Name: fordon_forms PK_FordonForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fordon_forms
    ADD CONSTRAINT "PK_FordonForms" PRIMARY KEY ("Id");


--
-- Name: forsakrings_forms PK_ForsakringsForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forsakrings_forms
    ADD CONSTRAINT "PK_ForsakringsForms" PRIMARY KEY ("Id");


--
-- Name: tele_forms PK_TeleForms; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tele_forms
    ADD CONSTRAINT "PK_TeleForms" PRIMARY KEY ("Id");


--
-- Name: users PK_Users; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "PK_Users" PRIMARY KEY ("Id");


--
-- Name: role Role_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role
    ADD CONSTRAINT "Role_pkey" PRIMARY KEY (id);


--
-- Name: fordon_forms UQ_FordonForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fordon_forms
    ADD CONSTRAINT "UQ_FordonForms_ChatToken" UNIQUE (chat_token);


--
-- Name: forsakrings_forms UQ_ForsakringsForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.forsakrings_forms
    ADD CONSTRAINT "UQ_ForsakringsForms_ChatToken" UNIQUE (chat_token);


--
-- Name: tele_forms UQ_TeleForms_ChatToken; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tele_forms
    ADD CONSTRAINT "UQ_TeleForms_ChatToken" UNIQUE (chat_token);


--
-- Name: archived_tickets archived_tickets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.archived_tickets
    ADD CONSTRAINT archived_tickets_pkey PRIMARY KEY (id);


--
-- Name: chat_ratings chat_ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.chat_ratings
    ADD CONSTRAINT chat_ratings_pkey PRIMARY KEY (id);


--
-- Name: dynamicforms dynamicforms_chattoken_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms
    ADD CONSTRAINT dynamicforms_chattoken_key UNIQUE (chattoken);


--
-- Name: dynamicforms dynamicforms_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dynamicforms
    ADD CONSTRAINT dynamicforms_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: IX_FordonForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_FordonForms_ChatToken" ON public.fordon_forms USING btree (chat_token);


--
-- Name: IX_ForsakringsForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_ForsakringsForms_ChatToken" ON public.forsakrings_forms USING btree (chat_token);


--
-- Name: IX_TeleForms_ChatToken; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "IX_TeleForms_ChatToken" ON public.tele_forms USING btree (chat_token);


--
-- Name: idx_archived_chat_token; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_chat_token ON public.archived_tickets USING btree (chat_token);


--
-- Name: idx_archived_form_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_form_type ON public.archived_tickets USING btree (form_type);


--
-- Name: idx_archived_resolved_at; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_archived_resolved_at ON public.archived_tickets USING btree (resolved_at);


--
-- Name: users Users_Role_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT "Users_Role_id_fk" FOREIGN KEY (role_id) REFERENCES public.role(id);


--
-- PostgreSQL database dump complete
--

