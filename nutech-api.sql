--
-- PostgreSQL database dump
--

\restrict 1WoQUQteKksSN2s8Jbm0ZodJuUDCyn4lqNGiFcgxEhRPUfjgRyUFb3gRPcMlIGl

-- Dumped from database version 17.6
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-04 20:36:17

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

--
-- TOC entry 5241 (class 1262 OID 37989)
-- Name: nutech; Type: DATABASE; Schema: -; Owner: syahla
--

CREATE DATABASE nutech WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Indonesia.1252';


ALTER DATABASE nutech OWNER TO syahla;

\unrestrict 1WoQUQteKksSN2s8Jbm0ZodJuUDCyn4lqNGiFcgxEhRPUfjgRyUFb3gRPcMlIGl
\connect nutech
\restrict 1WoQUQteKksSN2s8Jbm0ZodJuUDCyn4lqNGiFcgxEhRPUfjgRyUFb3gRPcMlIGl

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
-- TOC entry 220 (class 1259 OID 39725)
-- Name: banners; Type: TABLE; Schema: public; Owner: syahla
--

CREATE TABLE public.banners (
    id integer NOT NULL,
    banner_name character varying(255) NOT NULL,
    banner_image character varying(255) NOT NULL,
    description text
);


ALTER TABLE public.banners OWNER TO syahla;

--
-- TOC entry 219 (class 1259 OID 39724)
-- Name: banners_id_seq; Type: SEQUENCE; Schema: public; Owner: syahla
--

CREATE SEQUENCE public.banners_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banners_id_seq OWNER TO syahla;

--
-- TOC entry 5242 (class 0 OID 0)
-- Dependencies: 219
-- Name: banners_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: syahla
--

ALTER SEQUENCE public.banners_id_seq OWNED BY public.banners.id;


--
-- TOC entry 222 (class 1259 OID 40379)
-- Name: services; Type: TABLE; Schema: public; Owner: syahla
--

CREATE TABLE public.services (
    id integer NOT NULL,
    service_code character varying(255) NOT NULL,
    service_name character varying(255) NOT NULL,
    service_icon character varying(255) NOT NULL,
    service_tariff integer NOT NULL
);


ALTER TABLE public.services OWNER TO syahla;

--
-- TOC entry 221 (class 1259 OID 40378)
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: syahla
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO syahla;

--
-- TOC entry 5243 (class 0 OID 0)
-- Dependencies: 221
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: syahla
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- TOC entry 223 (class 1259 OID 45400)
-- Name: transactions; Type: TABLE; Schema: public; Owner: syahla
--

CREATE TABLE public.transactions (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    transaction_type character varying(255) NOT NULL,
    invoice_number character varying(255),
    service_code character varying(255),
    service_name character varying(255),
    total_amount numeric(18,2),
    description character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.transactions OWNER TO syahla;

--
-- TOC entry 217 (class 1259 OID 37990)
-- Name: users; Type: TABLE; Schema: public; Owner: syahla
--

CREATE TABLE public.users (
    id uuid NOT NULL,
    name character varying(255),
    email character varying(255) NOT NULL,
    password_hash character varying(255) NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO syahla;

--
-- TOC entry 218 (class 1259 OID 37999)
-- Name: wallets; Type: TABLE; Schema: public; Owner: syahla
--

CREATE TABLE public.wallets (
    id uuid NOT NULL,
    user_id uuid NOT NULL,
    balance numeric(18,2) DEFAULT 0,
    currency character varying(255) DEFAULT 'IDR'::character varying,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


ALTER TABLE public.wallets OWNER TO syahla;

--
-- TOC entry 4761 (class 2604 OID 39728)
-- Name: banners id; Type: DEFAULT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.banners ALTER COLUMN id SET DEFAULT nextval('public.banners_id_seq'::regclass);


--
-- TOC entry 4762 (class 2604 OID 40382)
-- Name: services id; Type: DEFAULT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- TOC entry 4966 (class 2606 OID 39732)
-- Name: banners banners_pkey; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.banners
    ADD CONSTRAINT banners_pkey PRIMARY KEY (id);


--
-- TOC entry 4968 (class 2606 OID 40386)
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- TOC entry 4970 (class 2606 OID 53298)
-- Name: services services_service_code_key; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key UNIQUE (service_code);


--
-- TOC entry 4972 (class 2606 OID 53300)
-- Name: services services_service_code_key1; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key1 UNIQUE (service_code);


--
-- TOC entry 4974 (class 2606 OID 53270)
-- Name: services services_service_code_key10; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key10 UNIQUE (service_code);


--
-- TOC entry 4976 (class 2606 OID 53272)
-- Name: services services_service_code_key11; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key11 UNIQUE (service_code);


--
-- TOC entry 4978 (class 2606 OID 53292)
-- Name: services services_service_code_key12; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key12 UNIQUE (service_code);


--
-- TOC entry 4980 (class 2606 OID 53274)
-- Name: services services_service_code_key13; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key13 UNIQUE (service_code);


--
-- TOC entry 4982 (class 2606 OID 53276)
-- Name: services services_service_code_key14; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key14 UNIQUE (service_code);


--
-- TOC entry 4984 (class 2606 OID 53288)
-- Name: services services_service_code_key15; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key15 UNIQUE (service_code);


--
-- TOC entry 4986 (class 2606 OID 53286)
-- Name: services services_service_code_key16; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key16 UNIQUE (service_code);


--
-- TOC entry 4988 (class 2606 OID 53278)
-- Name: services services_service_code_key17; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key17 UNIQUE (service_code);


--
-- TOC entry 4990 (class 2606 OID 53280)
-- Name: services services_service_code_key18; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key18 UNIQUE (service_code);


--
-- TOC entry 4992 (class 2606 OID 53282)
-- Name: services services_service_code_key19; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key19 UNIQUE (service_code);


--
-- TOC entry 4994 (class 2606 OID 53302)
-- Name: services services_service_code_key2; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key2 UNIQUE (service_code);


--
-- TOC entry 4996 (class 2606 OID 53284)
-- Name: services services_service_code_key20; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key20 UNIQUE (service_code);


--
-- TOC entry 4998 (class 2606 OID 53226)
-- Name: services services_service_code_key21; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key21 UNIQUE (service_code);


--
-- TOC entry 5000 (class 2606 OID 53228)
-- Name: services services_service_code_key22; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key22 UNIQUE (service_code);


--
-- TOC entry 5002 (class 2606 OID 53252)
-- Name: services services_service_code_key23; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key23 UNIQUE (service_code);


--
-- TOC entry 5004 (class 2606 OID 53250)
-- Name: services services_service_code_key24; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key24 UNIQUE (service_code);


--
-- TOC entry 5006 (class 2606 OID 53230)
-- Name: services services_service_code_key25; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key25 UNIQUE (service_code);


--
-- TOC entry 5008 (class 2606 OID 53232)
-- Name: services services_service_code_key26; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key26 UNIQUE (service_code);


--
-- TOC entry 5010 (class 2606 OID 53248)
-- Name: services services_service_code_key27; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key27 UNIQUE (service_code);


--
-- TOC entry 5012 (class 2606 OID 53246)
-- Name: services services_service_code_key28; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key28 UNIQUE (service_code);


--
-- TOC entry 5014 (class 2606 OID 53234)
-- Name: services services_service_code_key29; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key29 UNIQUE (service_code);


--
-- TOC entry 5016 (class 2606 OID 53220)
-- Name: services services_service_code_key3; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key3 UNIQUE (service_code);


--
-- TOC entry 5018 (class 2606 OID 53244)
-- Name: services services_service_code_key30; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key30 UNIQUE (service_code);


--
-- TOC entry 5020 (class 2606 OID 53236)
-- Name: services services_service_code_key31; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key31 UNIQUE (service_code);


--
-- TOC entry 5022 (class 2606 OID 53242)
-- Name: services services_service_code_key32; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key32 UNIQUE (service_code);


--
-- TOC entry 5024 (class 2606 OID 53238)
-- Name: services services_service_code_key33; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key33 UNIQUE (service_code);


--
-- TOC entry 5026 (class 2606 OID 53240)
-- Name: services services_service_code_key34; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key34 UNIQUE (service_code);


--
-- TOC entry 5028 (class 2606 OID 53290)
-- Name: services services_service_code_key35; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key35 UNIQUE (service_code);


--
-- TOC entry 5030 (class 2606 OID 53254)
-- Name: services services_service_code_key36; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key36 UNIQUE (service_code);


--
-- TOC entry 5032 (class 2606 OID 53256)
-- Name: services services_service_code_key37; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key37 UNIQUE (service_code);


--
-- TOC entry 5034 (class 2606 OID 53264)
-- Name: services services_service_code_key38; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key38 UNIQUE (service_code);


--
-- TOC entry 5036 (class 2606 OID 53258)
-- Name: services services_service_code_key39; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key39 UNIQUE (service_code);


--
-- TOC entry 5038 (class 2606 OID 53222)
-- Name: services services_service_code_key4; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key4 UNIQUE (service_code);


--
-- TOC entry 5040 (class 2606 OID 53260)
-- Name: services services_service_code_key40; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key40 UNIQUE (service_code);


--
-- TOC entry 5042 (class 2606 OID 53262)
-- Name: services services_service_code_key41; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key41 UNIQUE (service_code);


--
-- TOC entry 5044 (class 2606 OID 53304)
-- Name: services services_service_code_key42; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key42 UNIQUE (service_code);


--
-- TOC entry 5046 (class 2606 OID 53306)
-- Name: services services_service_code_key43; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key43 UNIQUE (service_code);


--
-- TOC entry 5048 (class 2606 OID 53308)
-- Name: services services_service_code_key44; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key44 UNIQUE (service_code);


--
-- TOC entry 5050 (class 2606 OID 53218)
-- Name: services services_service_code_key45; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key45 UNIQUE (service_code);


--
-- TOC entry 5052 (class 2606 OID 53310)
-- Name: services services_service_code_key46; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key46 UNIQUE (service_code);


--
-- TOC entry 5054 (class 2606 OID 53312)
-- Name: services services_service_code_key47; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key47 UNIQUE (service_code);


--
-- TOC entry 5056 (class 2606 OID 53314)
-- Name: services services_service_code_key48; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key48 UNIQUE (service_code);


--
-- TOC entry 5058 (class 2606 OID 53216)
-- Name: services services_service_code_key49; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key49 UNIQUE (service_code);


--
-- TOC entry 5060 (class 2606 OID 53224)
-- Name: services services_service_code_key5; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key5 UNIQUE (service_code);


--
-- TOC entry 5062 (class 2606 OID 53214)
-- Name: services services_service_code_key50; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key50 UNIQUE (service_code);


--
-- TOC entry 5064 (class 2606 OID 53316)
-- Name: services services_service_code_key51; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key51 UNIQUE (service_code);


--
-- TOC entry 5066 (class 2606 OID 53318)
-- Name: services services_service_code_key52; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key52 UNIQUE (service_code);


--
-- TOC entry 5068 (class 2606 OID 53208)
-- Name: services services_service_code_key53; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key53 UNIQUE (service_code);


--
-- TOC entry 5070 (class 2606 OID 53212)
-- Name: services services_service_code_key54; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key54 UNIQUE (service_code);


--
-- TOC entry 5072 (class 2606 OID 53210)
-- Name: services services_service_code_key55; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key55 UNIQUE (service_code);


--
-- TOC entry 5074 (class 2606 OID 53206)
-- Name: services services_service_code_key56; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key56 UNIQUE (service_code);


--
-- TOC entry 5076 (class 2606 OID 53320)
-- Name: services services_service_code_key57; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key57 UNIQUE (service_code);


--
-- TOC entry 5078 (class 2606 OID 53322)
-- Name: services services_service_code_key58; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key58 UNIQUE (service_code);


--
-- TOC entry 5080 (class 2606 OID 53296)
-- Name: services services_service_code_key6; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key6 UNIQUE (service_code);


--
-- TOC entry 5082 (class 2606 OID 53266)
-- Name: services services_service_code_key7; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key7 UNIQUE (service_code);


--
-- TOC entry 5084 (class 2606 OID 53268)
-- Name: services services_service_code_key8; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key8 UNIQUE (service_code);


--
-- TOC entry 5086 (class 2606 OID 53294)
-- Name: services services_service_code_key9; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_service_code_key9 UNIQUE (service_code);


--
-- TOC entry 5088 (class 2606 OID 45406)
-- Name: transactions transactions_pkey; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_pkey PRIMARY KEY (id);


--
-- TOC entry 4764 (class 2606 OID 52993)
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- TOC entry 4766 (class 2606 OID 52995)
-- Name: users users_email_key1; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key1 UNIQUE (email);


--
-- TOC entry 4768 (class 2606 OID 53013)
-- Name: users users_email_key10; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key10 UNIQUE (email);


--
-- TOC entry 4770 (class 2606 OID 53015)
-- Name: users users_email_key11; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key11 UNIQUE (email);


--
-- TOC entry 4772 (class 2606 OID 53017)
-- Name: users users_email_key12; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key12 UNIQUE (email);


--
-- TOC entry 4774 (class 2606 OID 53045)
-- Name: users users_email_key13; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key13 UNIQUE (email);


--
-- TOC entry 4776 (class 2606 OID 53047)
-- Name: users users_email_key14; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key14 UNIQUE (email);


--
-- TOC entry 4778 (class 2606 OID 53183)
-- Name: users users_email_key15; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key15 UNIQUE (email);


--
-- TOC entry 4780 (class 2606 OID 53049)
-- Name: users users_email_key16; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key16 UNIQUE (email);


--
-- TOC entry 4782 (class 2606 OID 53181)
-- Name: users users_email_key17; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key17 UNIQUE (email);


--
-- TOC entry 4784 (class 2606 OID 53179)
-- Name: users users_email_key18; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key18 UNIQUE (email);


--
-- TOC entry 4786 (class 2606 OID 53051)
-- Name: users users_email_key19; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key19 UNIQUE (email);


--
-- TOC entry 4788 (class 2606 OID 52997)
-- Name: users users_email_key2; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key2 UNIQUE (email);


--
-- TOC entry 4790 (class 2606 OID 53053)
-- Name: users users_email_key20; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key20 UNIQUE (email);


--
-- TOC entry 4792 (class 2606 OID 53055)
-- Name: users users_email_key21; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key21 UNIQUE (email);


--
-- TOC entry 4794 (class 2606 OID 53057)
-- Name: users users_email_key22; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key22 UNIQUE (email);


--
-- TOC entry 4796 (class 2606 OID 53141)
-- Name: users users_email_key23; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key23 UNIQUE (email);


--
-- TOC entry 4798 (class 2606 OID 53177)
-- Name: users users_email_key24; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key24 UNIQUE (email);


--
-- TOC entry 4800 (class 2606 OID 53143)
-- Name: users users_email_key25; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key25 UNIQUE (email);


--
-- TOC entry 4802 (class 2606 OID 53145)
-- Name: users users_email_key26; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key26 UNIQUE (email);


--
-- TOC entry 4804 (class 2606 OID 53147)
-- Name: users users_email_key27; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key27 UNIQUE (email);


--
-- TOC entry 4806 (class 2606 OID 53167)
-- Name: users users_email_key28; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key28 UNIQUE (email);


--
-- TOC entry 4808 (class 2606 OID 53169)
-- Name: users users_email_key29; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key29 UNIQUE (email);


--
-- TOC entry 4810 (class 2606 OID 52999)
-- Name: users users_email_key3; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key3 UNIQUE (email);


--
-- TOC entry 4812 (class 2606 OID 53175)
-- Name: users users_email_key30; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key30 UNIQUE (email);


--
-- TOC entry 4814 (class 2606 OID 53171)
-- Name: users users_email_key31; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key31 UNIQUE (email);


--
-- TOC entry 4816 (class 2606 OID 53173)
-- Name: users users_email_key32; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key32 UNIQUE (email);


--
-- TOC entry 4818 (class 2606 OID 53149)
-- Name: users users_email_key33; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key33 UNIQUE (email);


--
-- TOC entry 4820 (class 2606 OID 53151)
-- Name: users users_email_key34; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key34 UNIQUE (email);


--
-- TOC entry 4822 (class 2606 OID 53165)
-- Name: users users_email_key35; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key35 UNIQUE (email);


--
-- TOC entry 4824 (class 2606 OID 53153)
-- Name: users users_email_key36; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key36 UNIQUE (email);


--
-- TOC entry 4826 (class 2606 OID 53163)
-- Name: users users_email_key37; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key37 UNIQUE (email);


--
-- TOC entry 4828 (class 2606 OID 53155)
-- Name: users users_email_key38; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key38 UNIQUE (email);


--
-- TOC entry 4830 (class 2606 OID 53161)
-- Name: users users_email_key39; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key39 UNIQUE (email);


--
-- TOC entry 4832 (class 2606 OID 53001)
-- Name: users users_email_key4; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key4 UNIQUE (email);


--
-- TOC entry 4834 (class 2606 OID 53157)
-- Name: users users_email_key40; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key40 UNIQUE (email);


--
-- TOC entry 4836 (class 2606 OID 53159)
-- Name: users users_email_key41; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key41 UNIQUE (email);


--
-- TOC entry 4838 (class 2606 OID 53059)
-- Name: users users_email_key42; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key42 UNIQUE (email);


--
-- TOC entry 4840 (class 2606 OID 53061)
-- Name: users users_email_key43; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key43 UNIQUE (email);


--
-- TOC entry 4842 (class 2606 OID 53099)
-- Name: users users_email_key44; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key44 UNIQUE (email);


--
-- TOC entry 4844 (class 2606 OID 53139)
-- Name: users users_email_key45; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key45 UNIQUE (email);


--
-- TOC entry 4846 (class 2606 OID 53101)
-- Name: users users_email_key46; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key46 UNIQUE (email);


--
-- TOC entry 4848 (class 2606 OID 53103)
-- Name: users users_email_key47; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key47 UNIQUE (email);


--
-- TOC entry 4850 (class 2606 OID 53105)
-- Name: users users_email_key48; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key48 UNIQUE (email);


--
-- TOC entry 4852 (class 2606 OID 53137)
-- Name: users users_email_key49; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key49 UNIQUE (email);


--
-- TOC entry 4854 (class 2606 OID 53003)
-- Name: users users_email_key5; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key5 UNIQUE (email);


--
-- TOC entry 4856 (class 2606 OID 53107)
-- Name: users users_email_key50; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key50 UNIQUE (email);


--
-- TOC entry 4858 (class 2606 OID 53115)
-- Name: users users_email_key51; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key51 UNIQUE (email);


--
-- TOC entry 4860 (class 2606 OID 53109)
-- Name: users users_email_key52; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key52 UNIQUE (email);


--
-- TOC entry 4862 (class 2606 OID 53111)
-- Name: users users_email_key53; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key53 UNIQUE (email);


--
-- TOC entry 4864 (class 2606 OID 53113)
-- Name: users users_email_key54; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key54 UNIQUE (email);


--
-- TOC entry 4866 (class 2606 OID 53097)
-- Name: users users_email_key55; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key55 UNIQUE (email);


--
-- TOC entry 4868 (class 2606 OID 53083)
-- Name: users users_email_key56; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key56 UNIQUE (email);


--
-- TOC entry 4870 (class 2606 OID 53085)
-- Name: users users_email_key57; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key57 UNIQUE (email);


--
-- TOC entry 4872 (class 2606 OID 53087)
-- Name: users users_email_key58; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key58 UNIQUE (email);


--
-- TOC entry 4874 (class 2606 OID 53095)
-- Name: users users_email_key59; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key59 UNIQUE (email);


--
-- TOC entry 4876 (class 2606 OID 53005)
-- Name: users users_email_key6; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key6 UNIQUE (email);


--
-- TOC entry 4878 (class 2606 OID 53089)
-- Name: users users_email_key60; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key60 UNIQUE (email);


--
-- TOC entry 4880 (class 2606 OID 53091)
-- Name: users users_email_key61; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key61 UNIQUE (email);


--
-- TOC entry 4882 (class 2606 OID 53093)
-- Name: users users_email_key62; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key62 UNIQUE (email);


--
-- TOC entry 4884 (class 2606 OID 53081)
-- Name: users users_email_key63; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key63 UNIQUE (email);


--
-- TOC entry 4886 (class 2606 OID 53075)
-- Name: users users_email_key64; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key64 UNIQUE (email);


--
-- TOC entry 4888 (class 2606 OID 53077)
-- Name: users users_email_key65; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key65 UNIQUE (email);


--
-- TOC entry 4890 (class 2606 OID 53079)
-- Name: users users_email_key66; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key66 UNIQUE (email);


--
-- TOC entry 4892 (class 2606 OID 53135)
-- Name: users users_email_key67; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key67 UNIQUE (email);


--
-- TOC entry 4894 (class 2606 OID 53117)
-- Name: users users_email_key68; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key68 UNIQUE (email);


--
-- TOC entry 4896 (class 2606 OID 53119)
-- Name: users users_email_key69; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key69 UNIQUE (email);


--
-- TOC entry 4898 (class 2606 OID 53007)
-- Name: users users_email_key7; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key7 UNIQUE (email);


--
-- TOC entry 4900 (class 2606 OID 53133)
-- Name: users users_email_key70; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key70 UNIQUE (email);


--
-- TOC entry 4902 (class 2606 OID 53121)
-- Name: users users_email_key71; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key71 UNIQUE (email);


--
-- TOC entry 4904 (class 2606 OID 53131)
-- Name: users users_email_key72; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key72 UNIQUE (email);


--
-- TOC entry 4906 (class 2606 OID 53123)
-- Name: users users_email_key73; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key73 UNIQUE (email);


--
-- TOC entry 4908 (class 2606 OID 53129)
-- Name: users users_email_key74; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key74 UNIQUE (email);


--
-- TOC entry 4910 (class 2606 OID 53125)
-- Name: users users_email_key75; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key75 UNIQUE (email);


--
-- TOC entry 4912 (class 2606 OID 53127)
-- Name: users users_email_key76; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key76 UNIQUE (email);


--
-- TOC entry 4914 (class 2606 OID 53019)
-- Name: users users_email_key77; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key77 UNIQUE (email);


--
-- TOC entry 4916 (class 2606 OID 53043)
-- Name: users users_email_key78; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key78 UNIQUE (email);


--
-- TOC entry 4918 (class 2606 OID 53021)
-- Name: users users_email_key79; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key79 UNIQUE (email);


--
-- TOC entry 4920 (class 2606 OID 53009)
-- Name: users users_email_key8; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key8 UNIQUE (email);


--
-- TOC entry 4922 (class 2606 OID 53023)
-- Name: users users_email_key80; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key80 UNIQUE (email);


--
-- TOC entry 4924 (class 2606 OID 53041)
-- Name: users users_email_key81; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key81 UNIQUE (email);


--
-- TOC entry 4926 (class 2606 OID 53025)
-- Name: users users_email_key82; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key82 UNIQUE (email);


--
-- TOC entry 4928 (class 2606 OID 53027)
-- Name: users users_email_key83; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key83 UNIQUE (email);


--
-- TOC entry 4930 (class 2606 OID 53029)
-- Name: users users_email_key84; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key84 UNIQUE (email);


--
-- TOC entry 4932 (class 2606 OID 53039)
-- Name: users users_email_key85; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key85 UNIQUE (email);


--
-- TOC entry 4934 (class 2606 OID 53031)
-- Name: users users_email_key86; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key86 UNIQUE (email);


--
-- TOC entry 4936 (class 2606 OID 53033)
-- Name: users users_email_key87; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key87 UNIQUE (email);


--
-- TOC entry 4938 (class 2606 OID 53035)
-- Name: users users_email_key88; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key88 UNIQUE (email);


--
-- TOC entry 4940 (class 2606 OID 53037)
-- Name: users users_email_key89; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key89 UNIQUE (email);


--
-- TOC entry 4942 (class 2606 OID 53011)
-- Name: users users_email_key9; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key9 UNIQUE (email);


--
-- TOC entry 4944 (class 2606 OID 53073)
-- Name: users users_email_key90; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key90 UNIQUE (email);


--
-- TOC entry 4946 (class 2606 OID 53063)
-- Name: users users_email_key91; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key91 UNIQUE (email);


--
-- TOC entry 4948 (class 2606 OID 53065)
-- Name: users users_email_key92; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key92 UNIQUE (email);


--
-- TOC entry 4950 (class 2606 OID 53067)
-- Name: users users_email_key93; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key93 UNIQUE (email);


--
-- TOC entry 4952 (class 2606 OID 53069)
-- Name: users users_email_key94; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key94 UNIQUE (email);


--
-- TOC entry 4954 (class 2606 OID 53071)
-- Name: users users_email_key95; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key95 UNIQUE (email);


--
-- TOC entry 4956 (class 2606 OID 52991)
-- Name: users users_email_key96; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key96 UNIQUE (email);


--
-- TOC entry 4958 (class 2606 OID 53185)
-- Name: users users_email_key97; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key97 UNIQUE (email);


--
-- TOC entry 4960 (class 2606 OID 53187)
-- Name: users users_email_key98; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key98 UNIQUE (email);


--
-- TOC entry 4962 (class 2606 OID 37996)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 4964 (class 2606 OID 38005)
-- Name: wallets wallets_pkey; Type: CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_pkey PRIMARY KEY (id);


--
-- TOC entry 5090 (class 2606 OID 53198)
-- Name: transactions transactions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.transactions
    ADD CONSTRAINT transactions_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- TOC entry 5089 (class 2606 OID 53188)
-- Name: wallets wallets_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: syahla
--

ALTER TABLE ONLY public.wallets
    ADD CONSTRAINT wallets_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2025-11-04 20:36:17

--
-- PostgreSQL database dump complete
--

\unrestrict 1WoQUQteKksSN2s8Jbm0ZodJuUDCyn4lqNGiFcgxEhRPUfjgRyUFb3gRPcMlIGl

