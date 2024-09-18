--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.4

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
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Actor" (
    id integer NOT NULL,
    "first name" character varying(20) NOT NULL,
    "last name" character varying(25) NOT NULL
);


ALTER TABLE public."Actor" OWNER TO postgres;

--
-- Name: Actor_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Actor_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Actor_id_seq" OWNER TO postgres;

--
-- Name: Actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Actor_id_seq" OWNED BY public."Actor".id;


--
-- Name: Categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Categories" (
    "CategoryID" integer NOT NULL,
    "CategoryName" character varying(50),
    "Description" character varying(255)
);


ALTER TABLE public."Categories" OWNER TO postgres;

--
-- Name: Categories_CategoryID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Categories_CategoryID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Categories_CategoryID_seq" OWNER TO postgres;

--
-- Name: Categories_CategoryID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Categories_CategoryID_seq" OWNED BY public."Categories"."CategoryID";


--
-- Name: Customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Customers" (
    "CustomerID" integer NOT NULL,
    "FirstName" character varying(50),
    "LastName" character varying(50),
    "DateOfBirth" date,
    "Email" character varying(100),
    "PhoneNumber" character varying(20),
    "Address" character varying(100),
    "WishlistID" integer
);


ALTER TABLE public."Customers" OWNER TO postgres;

--
-- Name: Customers_CustomerID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Customers_CustomerID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Customers_CustomerID_seq" OWNER TO postgres;

--
-- Name: Customers_CustomerID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Customers_CustomerID_seq" OWNED BY public."Customers"."CustomerID";


--
-- Name: OrderDescription; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."OrderDescription" (
    "OrderDescriptionID" integer NOT NULL,
    "OrderID" integer,
    "ProductID" integer,
    "Quantity" integer,
    "UnitPrice" numeric(10,2)
);


ALTER TABLE public."OrderDescription" OWNER TO postgres;

--
-- Name: OrderDescription_OrderDescriptionID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."OrderDescription_OrderDescriptionID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."OrderDescription_OrderDescriptionID_seq" OWNER TO postgres;

--
-- Name: OrderDescription_OrderDescriptionID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."OrderDescription_OrderDescriptionID_seq" OWNED BY public."OrderDescription"."OrderDescriptionID";


--
-- Name: Orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Orders" (
    "OrderID" integer NOT NULL,
    "OrderDate" date,
    "OrderStatus" character varying(20),
    "ShippingAddress" character varying(255),
    "BillingAddress" character varying(255),
    "TotalPrice" numeric(10,2),
    "CustomerID" integer
);


ALTER TABLE public."Orders" OWNER TO postgres;

--
-- Name: Orders_OrderID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Orders_OrderID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Orders_OrderID_seq" OWNER TO postgres;

--
-- Name: Orders_OrderID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Orders_OrderID_seq" OWNED BY public."Orders"."OrderID";


--
-- Name: Payments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Payments" (
    "PaymentID" integer NOT NULL,
    "OrderID" integer,
    "Date" date,
    "Method" character varying(50),
    "Amount" numeric(10,2)
);


ALTER TABLE public."Payments" OWNER TO postgres;

--
-- Name: Payments_PaymentID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Payments_PaymentID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Payments_PaymentID_seq" OWNER TO postgres;

--
-- Name: Payments_PaymentID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Payments_PaymentID_seq" OWNED BY public."Payments"."PaymentID";


--
-- Name: Products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Products" (
    "ProductID" integer NOT NULL,
    "ProductName" character varying(100),
    "Description" character varying(255),
    "Price" numeric(10,2),
    "StockQuantity" integer,
    "Category" character varying(50),
    "Size" character varying(10),
    "Color" character varying(20),
    "ImageUrl" character varying(255)
);


ALTER TABLE public."Products" OWNER TO postgres;

--
-- Name: Products_ProductID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Products_ProductID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Products_ProductID_seq" OWNER TO postgres;

--
-- Name: Products_ProductID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Products_ProductID_seq" OWNED BY public."Products"."ProductID";


--
-- Name: Wishlist; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Wishlist" (
    "WishlistID" integer NOT NULL,
    "CustomerID" integer
);


ALTER TABLE public."Wishlist" OWNER TO postgres;

--
-- Name: WishlistItems; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."WishlistItems" (
    "WishlistItemID" integer NOT NULL,
    "WishlistID" integer,
    "ProductID" integer
);


ALTER TABLE public."WishlistItems" OWNER TO postgres;

--
-- Name: WishlistItems_WishlistItemID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."WishlistItems_WishlistItemID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."WishlistItems_WishlistItemID_seq" OWNER TO postgres;

--
-- Name: WishlistItems_WishlistItemID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."WishlistItems_WishlistItemID_seq" OWNED BY public."WishlistItems"."WishlistItemID";


--
-- Name: Wishlist_WishlistID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Wishlist_WishlistID_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."Wishlist_WishlistID_seq" OWNER TO postgres;

--
-- Name: Wishlist_WishlistID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Wishlist_WishlistID_seq" OWNED BY public."Wishlist"."WishlistID";


--
-- Name: Actor id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actor" ALTER COLUMN id SET DEFAULT nextval('public."Actor_id_seq"'::regclass);


--
-- Name: Categories CategoryID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories" ALTER COLUMN "CategoryID" SET DEFAULT nextval('public."Categories_CategoryID_seq"'::regclass);


--
-- Name: Customers CustomerID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customers" ALTER COLUMN "CustomerID" SET DEFAULT nextval('public."Customers_CustomerID_seq"'::regclass);


--
-- Name: OrderDescription OrderDescriptionID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription" ALTER COLUMN "OrderDescriptionID" SET DEFAULT nextval('public."OrderDescription_OrderDescriptionID_seq"'::regclass);


--
-- Name: Orders OrderID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders" ALTER COLUMN "OrderID" SET DEFAULT nextval('public."Orders_OrderID_seq"'::regclass);


--
-- Name: Payments PaymentID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments" ALTER COLUMN "PaymentID" SET DEFAULT nextval('public."Payments_PaymentID_seq"'::regclass);


--
-- Name: Products ProductID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products" ALTER COLUMN "ProductID" SET DEFAULT nextval('public."Products_ProductID_seq"'::regclass);


--
-- Name: Wishlist WishlistID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wishlist" ALTER COLUMN "WishlistID" SET DEFAULT nextval('public."Wishlist_WishlistID_seq"'::regclass);


--
-- Name: WishlistItems WishlistItemID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WishlistItems" ALTER COLUMN "WishlistItemID" SET DEFAULT nextval('public."WishlistItems_WishlistItemID_seq"'::regclass);


--
-- Data for Name: Actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Actor" (id, "first name", "last name") FROM stdin;
\.


--
-- Data for Name: Categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Categories" ("CategoryID", "CategoryName", "Description") FROM stdin;
1	Tops	Upper body clothing
2	Bottoms	Lower body clothing
\.


--
-- Data for Name: Customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Customers" ("CustomerID", "FirstName", "LastName", "DateOfBirth", "Email", "PhoneNumber", "Address", "WishlistID") FROM stdin;
3	Alice	Johnson	1985-11-30	alice.johnson@example.com	555-8765	789 Pine Road, Springfield	3
4	John	Doe	2000-05-15	john.doe@gmail.com	06152223	123 Elm Street, Springfield	1
5	Jane	Smith	2000-05-15	jane.smith@gmail.com	06153222	456 Oak Avenue, Springfield	2
6	Alice	Johnson	2000-05-15	alice.johnson@gmail.com	06152222	789 Pine Road, Springfield	3
8	Jane	Smith	2000-05-15	jane.smith@gmail.com	06153222	456 Oak Avenue, Springfield	2
9	Alice	Johnson	2000-05-15	alice.johnson@gmail.com	06152222	789 Pine Road, Springfield	3
10	John	Doe	2000-05-15	john.doe@gmail.com	06152223	123 Elm Street, Springfield	1
11	Jane	Smith	2000-05-15	jane.smith@gmail.com	06153222	456 Oak Avenue, Springfield	2
12	Alice	Johnson	2000-05-15	alice.johnson@gmail.com	06152222	789 Pine Road, Springfield	3
13	John	Doe	2000-05-15	john.doe@gmail.com	06152223	123 Elm Street, Springfield	1
14	Jane	Smith	2000-05-15	jane.smith@gmail.com	06153222	456 Oak Avenue, Springfield	2
15	Alice	Johnson	2000-05-15	alice.johnson@gmail.com	06152222	789 Pine Road, Springfield	3
16	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
17	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
18	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
7	John	Doe	\N	john.doe@gmail.com	06152223	123 Elm Street, Springfield	1
19	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
20	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
21	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
22	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
23	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
24	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
25	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
26	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
27	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
28	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
29	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
30	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
31	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
32	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
33	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
34	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
35	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
36	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
37	John	Doe	2000-05-16	john.doe@gmail.com	0641909499	123 Elm Street, Springfield	1
38	Jane	Smith	1992-07-22	jane.smith@gmail.com	0641909999	456 Oak Avenue, Springfield	2
39	Alice	Johnson	1985-11-30	alice.johnson@gmail.com	0651909499	789 Pine Road, Springfield	3
\.


--
-- Data for Name: OrderDescription; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."OrderDescription" ("OrderDescriptionID", "OrderID", "ProductID", "Quantity", "UnitPrice") FROM stdin;
23	5	1	2	19.99
24	6	2	1	49.99
25	5	1	2	19.99
26	6	2	1	49.99
\.


--
-- Data for Name: Orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Orders" ("OrderID", "OrderDate", "OrderStatus", "ShippingAddress", "BillingAddress", "TotalPrice", "CustomerID") FROM stdin;
5	2004-02-26	Shipped	123 Street, City	123 rue neuille, City	78.00	5
6	2004-02-02	Shipped	123 Street, yayfa	321 Street, City	78.00	6
7	2004-02-26	Shipped	123 Street, City	123 rue neuille, City	78.00	5
8	2004-02-02	Shipped	123 Street, yayfa	321 Street, City	78.00	6
9	2004-02-26	Shipped	123 Street, City	123 rue neuille, City	78.00	5
10	2004-02-02	Shipped	123 Street, yayfa	321 Street, City	78.00	6
\.


--
-- Data for Name: Payments; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Payments" ("PaymentID", "OrderID", "Date", "Method", "Amount") FROM stdin;
1	5	2024-09-01	Credit Card	69.98
2	5	2024-09-01	Credit Card	69.98
\.


--
-- Data for Name: Products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Products" ("ProductID", "ProductName", "Description", "Price", "StockQuantity", "Category", "Size", "Color", "ImageUrl") FROM stdin;
1	T-Shirt	Cotton T-Shirt	19.99	50	Tops	M	Blue	https://image.com/tshirt.jpg
2	Jeans	Denim Jeans	49.99	30	Bottoms	L	Black	https://image.com/jeans.jpg
3	T-Shirt	Cotton T-Shirt	19.99	50	Tops	M	Blue	https://image.com/tshirt.jpg
4	Jeans	Denim Jeans	49.99	30	Bottoms	L	Black	https://image.com/jeans.jpg
\.


--
-- Data for Name: Wishlist; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Wishlist" ("WishlistID", "CustomerID") FROM stdin;
1	6
2	10
\.


--
-- Data for Name: WishlistItems; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."WishlistItems" ("WishlistItemID", "WishlistID", "ProductID") FROM stdin;
1	1	1
2	1	2
\.


--
-- Name: Actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Actor_id_seq"', 1, false);


--
-- Name: Categories_CategoryID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Categories_CategoryID_seq"', 2, true);


--
-- Name: Customers_CustomerID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Customers_CustomerID_seq"', 39, true);


--
-- Name: OrderDescription_OrderDescriptionID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."OrderDescription_OrderDescriptionID_seq"', 26, true);


--
-- Name: Orders_OrderID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Orders_OrderID_seq"', 10, true);


--
-- Name: Payments_PaymentID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Payments_PaymentID_seq"', 2, true);


--
-- Name: Products_ProductID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Products_ProductID_seq"', 4, true);


--
-- Name: WishlistItems_WishlistItemID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."WishlistItems_WishlistItemID_seq"', 2, true);


--
-- Name: Wishlist_WishlistID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Wishlist_WishlistID_seq"', 2, true);


--
-- Name: Actor Actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actor"
    ADD CONSTRAINT "Actor_pkey" PRIMARY KEY (id);


--
-- Name: Categories Categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Categories"
    ADD CONSTRAINT "Categories_pkey" PRIMARY KEY ("CategoryID");


--
-- Name: Customers Customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Customers"
    ADD CONSTRAINT "Customers_pkey" PRIMARY KEY ("CustomerID");


--
-- Name: OrderDescription OrderDescription_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT "OrderDescription_pkey" PRIMARY KEY ("OrderDescriptionID");


--
-- Name: Orders Orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_pkey" PRIMARY KEY ("OrderID");


--
-- Name: Payments Payments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_pkey" PRIMARY KEY ("PaymentID");


--
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY ("ProductID");


--
-- Name: WishlistItems WishlistItems_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WishlistItems"
    ADD CONSTRAINT "WishlistItems_pkey" PRIMARY KEY ("WishlistItemID");


--
-- Name: Wishlist Wishlist_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wishlist"
    ADD CONSTRAINT "Wishlist_pkey" PRIMARY KEY ("WishlistID");


--
-- Name: OrderDescription OrderDescription_OrderID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT "OrderDescription_OrderID_fkey" FOREIGN KEY ("OrderID") REFERENCES public."Orders"("OrderID");


--
-- Name: OrderDescription OrderDescription_ProductID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."OrderDescription"
    ADD CONSTRAINT "OrderDescription_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Products"("ProductID");


--
-- Name: Orders Orders_CustomerID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Orders"
    ADD CONSTRAINT "Orders_CustomerID_fkey" FOREIGN KEY ("CustomerID") REFERENCES public."Customers"("CustomerID");


--
-- Name: Payments Payments_OrderID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Payments"
    ADD CONSTRAINT "Payments_OrderID_fkey" FOREIGN KEY ("OrderID") REFERENCES public."Orders"("OrderID");


--
-- Name: WishlistItems WishlistItems_ProductID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WishlistItems"
    ADD CONSTRAINT "WishlistItems_ProductID_fkey" FOREIGN KEY ("ProductID") REFERENCES public."Products"("ProductID");


--
-- Name: WishlistItems WishlistItems_WishlistID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."WishlistItems"
    ADD CONSTRAINT "WishlistItems_WishlistID_fkey" FOREIGN KEY ("WishlistID") REFERENCES public."Wishlist"("WishlistID");


--
-- Name: Wishlist Wishlist_CustomerID_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Wishlist"
    ADD CONSTRAINT "Wishlist_CustomerID_fkey" FOREIGN KEY ("CustomerID") REFERENCES public."Customers"("CustomerID");


--
-- PostgreSQL database dump complete
--

