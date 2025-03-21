--
-- PostgreSQL database dump
--

-- Dumped from database version 14.15 (Homebrew)
-- Dumped by pg_dump version 14.15 (Homebrew)

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
-- Name: available_pizza; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.available_pizza (
    id integer NOT NULL,
    name character varying(255),
    cost integer
);


ALTER TABLE public.available_pizza OWNER TO rokusho;

--
-- Name: available_pizza_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.available_pizza_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.available_pizza_id_seq OWNER TO rokusho;

--
-- Name: available_pizza_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.available_pizza_id_seq OWNED BY public.available_pizza.id;


--
-- Name: available_topping; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.available_topping (
    id integer NOT NULL,
    name character varying(255),
    cost_per_pizza character varying(255)
);


ALTER TABLE public.available_topping OWNER TO rokusho;

--
-- Name: available_topping_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.available_topping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.available_topping_id_seq OWNER TO rokusho;

--
-- Name: available_topping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.available_topping_id_seq OWNED BY public.available_topping.id;


--
-- Name: customer; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.customer (
    id integer NOT NULL,
    street character varying(255),
    city character varying(255),
    zip character varying(255),
    country character varying(255)
);


ALTER TABLE public.customer OWNER TO rokusho;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customer_id_seq OWNER TO rokusho;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.customer_id_seq OWNED BY public.customer.id;


--
-- Name: delivery; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.delivery (
    driver_id integer,
    order_id integer,
    started_delivery time without time zone,
    completed_delivery time without time zone
);


ALTER TABLE public.delivery OWNER TO rokusho;

--
-- Name: driver; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.driver (
    id integer NOT NULL,
    store_id integer,
    full_name character varying(255)
);


ALTER TABLE public.driver OWNER TO rokusho;

--
-- Name: driver_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.driver_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.driver_id_seq OWNER TO rokusho;

--
-- Name: driver_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.driver_id_seq OWNED BY public.driver.id;


--
-- Name: pizza_order; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.pizza_order (
    id integer NOT NULL,
    customer_id integer,
    date date,
    pizza_type character varying(255),
    store_id integer,
    toppings text[]
);


ALTER TABLE public.pizza_order OWNER TO rokusho;

--
-- Name: pizza_order_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.pizza_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pizza_order_id_seq OWNER TO rokusho;

--
-- Name: pizza_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.pizza_order_id_seq OWNED BY public.pizza_order.id;


--
-- Name: store; Type: TABLE; Schema: public; Owner: rokusho
--

CREATE TABLE public.store (
    id integer NOT NULL,
    location character varying(255)
);


ALTER TABLE public.store OWNER TO rokusho;

--
-- Name: store_id_seq; Type: SEQUENCE; Schema: public; Owner: rokusho
--

CREATE SEQUENCE public.store_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.store_id_seq OWNER TO rokusho;

--
-- Name: store_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rokusho
--

ALTER SEQUENCE public.store_id_seq OWNED BY public.store.id;


--
-- Name: available_pizza id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.available_pizza ALTER COLUMN id SET DEFAULT nextval('public.available_pizza_id_seq'::regclass);


--
-- Name: available_topping id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.available_topping ALTER COLUMN id SET DEFAULT nextval('public.available_topping_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.customer ALTER COLUMN id SET DEFAULT nextval('public.customer_id_seq'::regclass);


--
-- Name: driver id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.driver ALTER COLUMN id SET DEFAULT nextval('public.driver_id_seq'::regclass);


--
-- Name: pizza_order id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.pizza_order ALTER COLUMN id SET DEFAULT nextval('public.pizza_order_id_seq'::regclass);


--
-- Name: store id; Type: DEFAULT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.store ALTER COLUMN id SET DEFAULT nextval('public.store_id_seq'::regclass);


--
-- Data for Name: available_pizza; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.available_pizza (id, name, cost) FROM stdin;
1	 small	16
2	 medium	32
3	 large	64
\.


--
-- Data for Name: available_topping; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.available_topping (id, name, cost_per_pizza) FROM stdin;
1	 dogweed	 4
2	 bell peppers	 2
3	 sausage	 4
4	 magic marinated moonlit mushrooms	 8
5	 pineapple chunks	 4
6	 dragon-fire roasted red onions	  2
7	 basil leaves	 2
8	 fresh garlic	 2
9	 enchanted artichoke hearts	 8
10	 spinach	 2
11	 phoenix feathered ham	 4
12	 jalapeño peppers	 2
13	 sliced black olives	 2
14	 mermaid seaweed seashells	 8
15	 fiery phoenix pepper flakes	 4
16	 onion	 2
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.customer (id, street, city, zip, country) FROM stdin;
1	 42 mystical lane moonlit gardens	 london	 w1x 7hp	 gb
2	 17 spellbound street arcane district	 porto	 4050-123	 pt
3	 123 wizards haven ave celestial heights	 chicago	 60601	 us
4	 789 enchanted path magic meadows	 orlando	 32801	 us
5	 555 enigma drive mystic hills	 los angeles	 90001	 us
\.


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.delivery (driver_id, order_id, started_delivery, completed_delivery) FROM stdin;
1	1	08:15:00	09:30:00
1	6	10:00:00	10:45:00
1	11	13:20:00	14:50:00
1	16	15:30:00	16:45:00
1	21	17:10:00	17:40:00
1	26	19:05:00	19:50:00
1	31	08:45:00	09:20:00
1	36	11:30:00	12:45:00
1	41	14:10:00	14:55:00
1	46	16:00:00	17:30:00
1	51	18:20:00	19:00:00
1	56	20:05:00	20:40:00
1	61	21:30:00	21:55:00
2	2	08:25:00	09:15:00
2	7	10:15:00	10:55:00
2	12	13:45:00	14:20:00
2	17	15:05:00	16:30:00
2	22	17:20:00	17:55:00
2	27	19:40:00	20:25:00
2	32	08:50:00	09:40:00
2	37	11:10:00	11:55:00
2	42	14:30:00	15:05:00
2	47	16:45:00	17:20:00
2	52	18:10:00	19:45:00
2	57	20:30:00	21:00:00
2	62	21:45:00	22:10:00
3	3	08:40:00	09:15:00
3	8	10:20:00	10:50:00
3	13	13:00:00	13:45:00
3	18	15:15:00	16:10:00
3	23	17:30:00	17:55:00
3	28	19:15:00	19:40:00
3	33	08:15:00	09:00:00
3	38	11:30:00	12:15:00
3	43	14:20:00	15:05:00
3	48	16:10:00	16:55:00
3	53	18:00:00	18:45:00
3	58	20:05:00	21:10:00
3	63	21:15:00	21:45:00
4	4	08:30:00	09:20:00
4	9	10:00:00	10:30:00
4	14	13:10:00	13:40:00
4	19	15:45:00	16:10:00
4	24	17:00:00	17:45:00
4	29	19:20:00	19:50:00
4	34	08:45:00	09:35:00
4	39	11:45:00	12:15:00
4	44	14:40:00	15:30:00
4	49	16:20:00	16:55:00
4	54	18:30:00	19:15:00
4	59	20:50:00	21:30:00
5	5	08:00:00	08:45:00
5	10	10:30:00	11:00:00
5	15	13:05:00	13:45:00
5	20	15:20:00	16:00:00
5	25	17:40:00	18:20:00
5	30	19:55:00	20:25:00
5	35	08:20:00	09:00:00
5	40	11:00:00	11:35:00
5	45	14:15:00	14:45:00
5	50	16:40:00	17:10:00
5	55	18:55:00	19:40:00
5	60	21:05:00	21:45:00
\.


--
-- Data for Name: driver; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.driver (id, store_id, full_name) FROM stdin;
1	1	 Amara Pendergast
2	2	 Thaddeus Quillshank
3	3	 Elowen Thistlewood
4	4	 Percival Grimblewix
5	5	 Seraphina Mistlebrook
6	1	 Orion Blackthorn
7	2	 Isolde Ravenshadow
8	3	 Barnabas Quicksilver
9	4	 Evangeline Stormrider
10	5	 Magnus Nightshade
\.


--
-- Data for Name: pizza_order; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.pizza_order (id, customer_id, date, pizza_type, store_id, toppings) FROM stdin;
1	1	2023-09-02	small	1	{1,3,6,7,8}
2	2	2023-09-05	medium	2	{4,5,11,13}
3	3	2023-09-07	large	3	{2,6,9,11,12,15}
4	4	2023-09-10	small	4	{3,7,8,11}
5	5	2023-09-12	medium	5	{1,4,6,8}
6	1	2023-09-15	large	1	{2,5,7,9,11,12,14}
7	2	2023-09-18	small	2	{1,6,7}
8	3	2023-09-21	medium	3	{2,4,9,13}
9	4	2023-09-24	large	4	{3,5,7,8,15}
10	5	2023-09-27	small	5	{1,3,6,11}
11	1	2023-09-30	medium	1	{2,4,7,9,13}
12	2	2023-10-03	large	2	{3,5,6,8,11,12,14}
13	3	2023-10-06	small	3	{1,4,9}
14	4	2023-10-09	medium	4	{2,5,7,11,13}
15	5	2023-10-12	large	5	{3,6,8,15}
16	1	2023-10-15	small	1	{2,4,11}
17	2	2023-10-18	medium	2	{3,6,7,8,12}
18	3	2023-10-21	large	3	{1,2,5,9,13,14}
19	4	2023-10-24	small	4	{3,4,7,11}
20	5	2023-10-27	medium	5	{1,6,8,15}
21	1	2023-10-30	large	1	{2,3,5,9,12}
22	2	2023-11-02	small	2	{1,4,6,13}
23	3	2023-11-05	medium	3	{2,5,7,8,15}
24	4	2023-11-08	large	4	{3,6,11,12,14}
25	5	2023-11-11	small	5	{1,2,7}
26	1	2023-11-14	medium	1	{2,4,5,9,13}
27	2	2023-11-17	large	2	{3,6,7,8,15}
28	3	2023-11-20	small	3	{1,5,11}
29	4	2023-11-23	medium	4	{2,4,6,12}
30	5	2023-11-26	large	5	{3,2,7,8,13}
31	1	2023-09-02	small	1	{4,5,6}
32	2	2023-09-05	medium	2	{3,7,8,11}
33	3	2023-09-07	large	3	{1,2,4,9,13,14}
34	4	2023-09-10	small	4	{5,6,7,11}
35	5	2023-09-12	medium	5	{4,8,12,15}
36	1	2023-09-15	large	1	{3,5,6,9,13,14}
37	2	2023-09-18	small	2	{2,4,7}
38	3	2023-09-21	medium	3	{1,6,8,15}
39	4	2023-09-24	large	4	{3,5,9,11,12,14}
40	5	2023-09-27	small	5	{2,7,8}
41	1	2023-09-30	medium	1	{4,6,11,13}
42	2	2023-10-03	large	2	{3,5,7,9,12,15}
43	3	2023-10-06	small	3	{1,2,4}
44	4	2023-10-09	medium	4	{5,6,8,11,13}
45	5	2023-10-12	large	5	{2,3,7,9,15}
46	1	2023-10-15	small	1	{4,6,9,12,14}
47	2	2023-10-18	medium	2	{3,5,8,11}
48	3	2023-10-21	large	3	{1,2,4,7,13,15}
49	4	2023-10-24	small	4	{2,6,9}
50	5	2023-10-27	medium	5	{1,3,7,11,12,14}
51	1	2023-10-30	large	1	{4,5,8,15}
52	2	2023-11-02	small	2	{3,6,9}
53	3	2023-11-05	medium	3	{1,2,7,11}
54	4	2023-11-08	large	4	{5,8,12,13}
55	5	2023-11-11	small	5	{2,4,6}
56	1	2023-11-14	medium	1	{3,5,9,15}
57	2	2023-11-17	large	2	{4,7,11,12}
58	3	2023-11-20	small	3	{1,2,8}
59	4	2023-11-23	medium	4	{5,6,9,13}
60	5	2023-11-26	large	5	{3,4,7,12,14}
61	1	2023-09-02	small	1	{2,6,8}
62	2	2023-09-05	medium	2	{3,5,7,9,12}
63	3	2023-09-07	large	3	{1,2,4,6,8,11,13}
64	4	2023-09-10	small	4	{5,6,7,9,12,15}
\.


--
-- Data for Name: store; Type: TABLE DATA; Schema: public; Owner: rokusho
--

COPY public.store (id, location) FROM stdin;
1	 king's cross station, london
2	 livraria lello, portugal
3	 magic mountain, usa
4	 miracle mile, usa
5	 magic kindgom, usa
\.


--
-- Name: available_pizza_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.available_pizza_id_seq', 1, false);


--
-- Name: available_topping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.available_topping_id_seq', 1, false);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.customer_id_seq', 1, false);


--
-- Name: driver_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.driver_id_seq', 1, false);


--
-- Name: pizza_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.pizza_order_id_seq', 1, false);


--
-- Name: store_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rokusho
--

SELECT pg_catalog.setval('public.store_id_seq', 1, false);


--
-- Name: available_pizza available_pizza_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.available_pizza
    ADD CONSTRAINT available_pizza_pkey PRIMARY KEY (id);


--
-- Name: available_topping available_topping_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.available_topping
    ADD CONSTRAINT available_topping_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: driver driver_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_pkey PRIMARY KEY (id);


--
-- Name: pizza_order pizza_order_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizza_order_pkey PRIMARY KEY (id);


--
-- Name: store store_pkey; Type: CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.store
    ADD CONSTRAINT store_pkey PRIMARY KEY (id);


--
-- Name: delivery delivery_driver_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_driver_id_fkey FOREIGN KEY (driver_id) REFERENCES public.driver(id) ON DELETE CASCADE;


--
-- Name: delivery delivery_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.delivery
    ADD CONSTRAINT delivery_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.pizza_order(id) ON DELETE CASCADE;


--
-- Name: driver driver_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.driver
    ADD CONSTRAINT driver_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(id) ON DELETE CASCADE;


--
-- Name: pizza_order pizza_order_customer_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizza_order_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES public.customer(id) ON DELETE CASCADE;


--
-- Name: pizza_order pizza_order_store_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rokusho
--

ALTER TABLE ONLY public.pizza_order
    ADD CONSTRAINT pizza_order_store_id_fkey FOREIGN KEY (store_id) REFERENCES public.store(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

