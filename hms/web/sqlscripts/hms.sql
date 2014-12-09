--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: getroomstatus(integer, text); Type: FUNCTION; Schema: public; Owner: hms
--

CREATE FUNCTION getroomstatus(integer, text) RETURNS integer
    LANGUAGE plpgsql
    AS $_$DECLARE
x INTEGER;
BEGIN
select st into x from roomst where roomid = $1 and statusdate <=
to_timestamp($2,'DD/MM/YYYY HH24:MI') order by statusdate desc limit
1;
IF x is null THEN
x = 8;
END IF;
return x;
END;$_$;


ALTER FUNCTION public.getroomstatus(integer, text) OWNER TO hms;

--
-- Name: ratedate(integer, integer, date); Type: FUNCTION; Schema: public; Owner: hms
--

CREATE FUNCTION ratedate(integer, integer, date) RETURNS double precision
    LANGUAGE plpgsql
    AS $_$DECLARE
 x1 DOUBLE PRECISION;
 x2 DOUBLE PRECISION;
BEGIN
 select value into x1 from currencyrate where value > 0 and currencyid = $1 and ratedate <= $3 order by ratedate desc limit 1;
 select value into x2 from currencyrate where value > 0 and currencyid = $2 and ratedate <= $3 order by ratedate desc limit 1;
 IF x1 is null THEN
  x1 = 1;
 END IF;
 IF x2 is null THEN
  x2 = 1;
 END IF;
 return x2/x1;
END;$_$;


ALTER FUNCTION public.ratedate(integer, integer, date) OWNER TO hms;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: amenity; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE amenity (
    amenityid integer NOT NULL,
    name text NOT NULL,
    type integer NOT NULL,
    ord integer DEFAULT 0 NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.amenity OWNER TO hms;

--
-- Name: TABLE amenity; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE amenity IS 'კეთილმოწყობები';


--
-- Name: COLUMN amenity.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.name IS 'დასახელება';


--
-- Name: COLUMN amenity.type; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.type IS 'ტიპიCODEamenitytype';


--
-- Name: COLUMN amenity.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.ord IS 'სორტირება';


--
-- Name: COLUMN amenity.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.regbyid IS 'ავტორი';


--
-- Name: COLUMN amenity.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN amenity.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.active IS 'აქტიური';


--
-- Name: COLUMN amenity.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN amenity.deleted IS 'წაშლილი';


--
-- Name: amenityid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE amenityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.amenityid_seq OWNER TO hms;

--
-- Name: bedtype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE bedtype (
    bedtypeid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.bedtype OWNER TO hms;

--
-- Name: TABLE bedtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE bedtype IS 'საწოლის ტიპები';


--
-- Name: COLUMN bedtype.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.code IS 'მოკლე დასახელება';


--
-- Name: COLUMN bedtype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.name IS 'დასახელება';


--
-- Name: COLUMN bedtype.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.regbyid IS 'ავტორი';


--
-- Name: COLUMN bedtype.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN bedtype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.active IS 'აქტიური';


--
-- Name: COLUMN bedtype.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bedtype.deleted IS 'წაშლილი';


--
-- Name: bedtypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE bedtypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bedtypeid_seq OWNER TO hms;

--
-- Name: bsource; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE bsource (
    bsourceid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.bsource OWNER TO hms;

--
-- Name: TABLE bsource; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE bsource IS 'ბიზნეს წყარო';


--
-- Name: COLUMN bsource.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.code IS 'მოკლე დასახელება';


--
-- Name: COLUMN bsource.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.name IS 'დასახელება';


--
-- Name: COLUMN bsource.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.regbyid IS 'ავტორი';


--
-- Name: COLUMN bsource.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN bsource.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.active IS 'აქტიური';


--
-- Name: COLUMN bsource.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN bsource.deleted IS 'წაშლილი';


--
-- Name: bsourceid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE bsourceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bsourceid_seq OWNER TO hms;

--
-- Name: checkinreservationsettings; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE checkinreservationsettings (
    checkinreservationsettingsid integer NOT NULL,
    hours24 boolean DEFAULT false NOT NULL,
    checkintime time without time zone NOT NULL,
    checkouttime time without time zone NOT NULL,
    autopostdayuse boolean DEFAULT false NOT NULL,
    graceperioddayuse double precision,
    dayusecharge double precision,
    autopostforlatecheckout boolean DEFAULT false NOT NULL,
    graceperiodlate double precision,
    latecheckoutcharge double precision,
    autopostearly boolean DEFAULT false NOT NULL,
    graceperiodearly double precision,
    earlycheckoutcahrge double precision,
    postcancellationfee integer DEFAULT 0 NOT NULL,
    amountcancell double precision,
    totalchargecancell boolean,
    beyond integer,
    within integer,
    postnoshowfee integer DEFAULT 0 NOT NULL,
    amountnoshow double precision,
    totalchargenoshow boolean,
    finstartmonth integer NOT NULL,
    finstartday integer NOT NULL,
    finendmonth integer NOT NULL,
    finendday integer NOT NULL,
    guestnamereserv boolean DEFAULT true NOT NULL,
    guestnamewalkin boolean DEFAULT true NOT NULL,
    guestidnreserv boolean DEFAULT true NOT NULL,
    guestidnwalkin boolean DEFAULT true NOT NULL,
    marketcodereserv boolean DEFAULT false NOT NULL,
    marketcodewalkin boolean DEFAULT false NOT NULL,
    paymenttypereserv boolean DEFAULT true NOT NULL,
    paymenttypewalkin boolean DEFAULT false NOT NULL,
    tareserv boolean DEFAULT false NOT NULL,
    tawalkin boolean DEFAULT false NOT NULL,
    companyreserv boolean DEFAULT false NOT NULL,
    companywalkin boolean DEFAULT false NOT NULL,
    bsourcereserv boolean DEFAULT false NOT NULL,
    bsourcewalkin boolean DEFAULT false NOT NULL,
    nationalityreserv boolean DEFAULT false NOT NULL,
    nationalitywalkin boolean DEFAULT false NOT NULL,
    emailreservationvoucher boolean DEFAULT true NOT NULL,
    nightauditdirty boolean DEFAULT true NOT NULL,
    overbooking boolean DEFAULT false NOT NULL,
    baseoccupancy boolean DEFAULT true NOT NULL,
    frontratemoderegular boolean DEFAULT true NOT NULL,
    sendreviewtoall boolean DEFAULT true NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    addressreserv boolean DEFAULT true NOT NULL,
    addresswalkin boolean DEFAULT true NOT NULL
);


ALTER TABLE public.checkinreservationsettings OWNER TO hms;

--
-- Name: COLUMN checkinreservationsettings.postcancellationfee; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN checkinreservationsettings.postcancellationfee IS '1 %, 2 fixed, 3 flat';


--
-- Name: COLUMN checkinreservationsettings.postnoshowfee; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN checkinreservationsettings.postnoshowfee IS '1 %, 2 fixed, 3 flat';


--
-- Name: checkinreservationsettings_ss_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE checkinreservationsettings_ss_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkinreservationsettings_ss_seq OWNER TO hms;

--
-- Name: checkinreservationsettings_ss_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hms
--

ALTER SEQUENCE checkinreservationsettings_ss_seq OWNED BY checkinreservationsettings.regbyid;


--
-- Name: checkinreservationsettingsid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE checkinreservationsettingsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.checkinreservationsettingsid_seq OWNER TO hms;

--
-- Name: city; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE city (
    cityid integer NOT NULL,
    regionid integer NOT NULL,
    name text NOT NULL,
    code text,
    ext character varying
);


ALTER TABLE public.city OWNER TO hms;

--
-- Name: TABLE city; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE city IS 'ქალაქი';


--
-- Name: COLUMN city.regionid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN city.regionid IS 'რეგიონი';


--
-- Name: COLUMN city.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN city.name IS 'სახელი';


--
-- Name: COLUMN city.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN city.code IS 'მოკლე სახელი';


--
-- Name: COLUMN city.ext; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN city.ext IS 'სატელეფონი კოდი';


--
-- Name: cityid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE cityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cityid_seq OWNER TO hms;

--
-- Name: closedate; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE closedate (
    closedateid bigint NOT NULL,
    cldate date NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.closedate OWNER TO hms;

--
-- Name: closedateid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE closedateid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.closedateid_seq OWNER TO hms;

--
-- Name: confmail; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE confmail (
    confmailid integer NOT NULL,
    smtp character varying NOT NULL,
    port integer NOT NULL,
    username character varying(255) NOT NULL,
    pass character varying(255) NOT NULL,
    frommail character varying(255) NOT NULL
);


ALTER TABLE public.confmail OWNER TO hms;

--
-- Name: confmailid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE confmailid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.confmailid_seq OWNER TO hms;

--
-- Name: connectedroom; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE connectedroom (
    roomid integer NOT NULL,
    connectedid integer NOT NULL
);


ALTER TABLE public.connectedroom OWNER TO hms;

--
-- Name: contragent; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE contragent (
    contragentid bigint NOT NULL,
    type integer NOT NULL,
    salutationid integer,
    fname text,
    lname text,
    name text,
    address text,
    countryid integer,
    city text,
    zip character varying(100),
    phone character varying(100),
    fax character varying(100),
    mobile character varying(100),
    email character varying(255),
    commissionplan integer,
    val double precision,
    rate integer NOT NULL,
    openbalance double precision,
    roominventory integer,
    createuser boolean,
    bsource boolean,
    ccblock boolean,
    idn character varying(255),
    creditterm integer,
    creditlimit double precision,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.contragent OWNER TO hms;

--
-- Name: TABLE contragent; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE contragent IS 'კონტრაგენტი';


--
-- Name: COLUMN contragent.type; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.type IS 'ტიპიCODEcontragenttype';


--
-- Name: COLUMN contragent.salutationid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.salutationid IS 'მიმართვის ფორმა';


--
-- Name: COLUMN contragent.fname; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.fname IS 'სახელი';


--
-- Name: COLUMN contragent.lname; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.lname IS 'გვარი';


--
-- Name: COLUMN contragent.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.name IS 'დასახელება';


--
-- Name: COLUMN contragent.address; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.address IS 'მისამართი';


--
-- Name: COLUMN contragent.countryid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.countryid IS 'ქვეყანა';


--
-- Name: COLUMN contragent.city; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.city IS 'ქალაქი';


--
-- Name: COLUMN contragent.zip; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.zip IS 'ინდექსი';


--
-- Name: COLUMN contragent.phone; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.phone IS 'ტელეფონი';


--
-- Name: COLUMN contragent.fax; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.fax IS 'ფაქსი';


--
-- Name: COLUMN contragent.mobile; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.mobile IS 'მობილური';


--
-- Name: COLUMN contragent.email; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.email IS 'ელფოსტა';


--
-- Name: COLUMN contragent.commissionplan; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.commissionplan IS 'საკომისიოს გეგმაCODEcommissionplan';


--
-- Name: COLUMN contragent.val; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.val IS 'თანხა';


--
-- Name: COLUMN contragent.rate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.rate IS 'ტარიფიCODErate';


--
-- Name: COLUMN contragent.openbalance; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.openbalance IS 'საწყისი ბალანსი';


--
-- Name: COLUMN contragent.roominventory; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.roominventory IS 'ოთხის ფონდიCODEroominventory';


--
-- Name: COLUMN contragent.createuser; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.createuser IS 'შეეძლოს მომხმარებლის დამატება';


--
-- Name: COLUMN contragent.bsource; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.bsource IS 'ბიზნესის წყარო';


--
-- Name: COLUMN contragent.ccblock; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.ccblock IS 'CC Block';


--
-- Name: COLUMN contragent.idn; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.idn IS 'საიდ. ნომერი';


--
-- Name: COLUMN contragent.creditterm; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.creditterm IS 'კრედიტის პირობა';


--
-- Name: COLUMN contragent.creditlimit; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.creditlimit IS 'კრედიტის ლიმიტი';


--
-- Name: COLUMN contragent.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.regbyid IS 'ავტორი';


--
-- Name: COLUMN contragent.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN contragent.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN contragent.deleted IS 'წაშლილი';


--
-- Name: contragentid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE contragentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.contragentid_seq OWNER TO hms;

--
-- Name: countryid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE countryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.countryid_seq OWNER TO hms;

--
-- Name: country; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE country (
    countryid integer DEFAULT nextval('countryid_seq'::regclass) NOT NULL,
    name character varying(255),
    code character varying(5),
    ext character varying(10),
    flag character varying(255)
);


ALTER TABLE public.country OWNER TO hms;

--
-- Name: TABLE country; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE country IS 'ქვეყანა';


--
-- Name: COLUMN country.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN country.name IS 'დასახელება';


--
-- Name: COLUMN country.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN country.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN country.ext; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN country.ext IS 'სატელეფონო კოდი';


--
-- Name: COLUMN country.flag; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN country.flag IS ' დროშა';


--
-- Name: currency; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE currency (
    currencyid integer NOT NULL,
    name text NOT NULL,
    code character varying(10) NOT NULL,
    basic boolean DEFAULT false NOT NULL,
    icon text,
    countryid integer,
    fixedexrate boolean DEFAULT true NOT NULL
);


ALTER TABLE public.currency OWNER TO hms;

--
-- Name: TABLE currency; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE currency IS 'ვალუტა';


--
-- Name: COLUMN currency.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.name IS 'დასახელება';


--
-- Name: COLUMN currency.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN currency.basic; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.basic IS 'ძირითადი ვალუტა';


--
-- Name: COLUMN currency.icon; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.icon IS 'ნიშანი';


--
-- Name: COLUMN currency.countryid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.countryid IS 'ქვეყანა';


--
-- Name: COLUMN currency.fixedexrate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currency.fixedexrate IS 'ფიქსირებული გადაცვლის კურსი';


--
-- Name: currencyid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE currencyid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencyid_seq OWNER TO hms;

--
-- Name: currencyrate; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE currencyrate (
    currencyrateid bigint NOT NULL,
    currencyid integer NOT NULL,
    ratedate date NOT NULL,
    value double precision NOT NULL
);


ALTER TABLE public.currencyrate OWNER TO hms;

--
-- Name: TABLE currencyrate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE currencyrate IS 'ვალუტის კურსი';


--
-- Name: COLUMN currencyrate.currencyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currencyrate.currencyid IS 'ვალუტა';


--
-- Name: COLUMN currencyrate.ratedate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currencyrate.ratedate IS 'თარიღი';


--
-- Name: COLUMN currencyrate.value; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN currencyrate.value IS 'ოდენობა';


--
-- Name: currencyrateid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE currencyrateid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.currencyrateid_seq OWNER TO hms;

--
-- Name: discount; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE discount (
    discountid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    perctype boolean DEFAULT true NOT NULL,
    open boolean DEFAULT false NOT NULL,
    val double precision,
    roomrate boolean DEFAULT true NOT NULL,
    extracharge boolean DEFAULT true NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.discount OWNER TO hms;

--
-- Name: TABLE discount; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE discount IS 'ფასდაკლება';


--
-- Name: COLUMN discount.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN discount.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.name IS 'დასახელება';


--
-- Name: COLUMN discount.perctype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.perctype IS 'ფასდაკლების ტიპი';


--
-- Name: COLUMN discount.open; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.open IS 'ღია ფასდაკლება';


--
-- Name: COLUMN discount.val; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.val IS 'ოდენობა';


--
-- Name: COLUMN discount.roomrate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.roomrate IS 'ოთახის გადასახადებზე';


--
-- Name: COLUMN discount.extracharge; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.extracharge IS 'დამატებით სერვისებზე';


--
-- Name: COLUMN discount.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.regbyid IS 'ავტორი';


--
-- Name: COLUMN discount.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN discount.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.active IS 'აქტიური';


--
-- Name: COLUMN discount.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN discount.deleted IS 'წაშლილი';


--
-- Name: discountid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE discountid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.discountid_seq OWNER TO hms;

--
-- Name: displaysettings; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE displaysettings (
    displaysettingsid integer NOT NULL,
    timeformat integer NOT NULL,
    dateformat integer NOT NULL,
    arrdepformat integer NOT NULL,
    timezome integer NOT NULL,
    idtypeid integer,
    reservationtypeid integer NOT NULL,
    roundtype integer NOT NULL,
    salutationid integer NOT NULL,
    billto integer NOT NULL,
    paymentmode integer,
    paymentmethodid integer,
    webrate integer NOT NULL,
    webroominvmode integer,
    paymentgateway text DEFAULT ''::text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    zip text DEFAULT 'ინდექსი'::text NOT NULL
);


ALTER TABLE public.displaysettings OWNER TO hms;

--
-- Name: displaysettingsid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE displaysettingsid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.displaysettingsid_seq OWNER TO hms;

--
-- Name: district; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE district (
    districtid integer NOT NULL,
    cityid integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.district OWNER TO hms;

--
-- Name: TABLE district; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE district IS 'რაიონი';


--
-- Name: COLUMN district.cityid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN district.cityid IS 'ქალაქი';


--
-- Name: COLUMN district.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN district.name IS 'დასახელება';


--
-- Name: districtid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE districtid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.districtid_seq OWNER TO hms;

--
-- Name: extracharge; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE extracharge (
    extrachargeid integer NOT NULL,
    code character varying(100) NOT NULL,
    name text NOT NULL,
    rate double precision NOT NULL,
    fixedprice boolean DEFAULT false NOT NULL,
    ord integer DEFAULT 0 NOT NULL,
    voucherno integer NOT NULL,
    web boolean DEFAULT false NOT NULL,
    webdescription text,
    chargeapplieson integer,
    extrapostingtype integer,
    applychargealways boolean,
    webord integer,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.extracharge OWNER TO hms;

--
-- Name: TABLE extracharge; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE extracharge IS 'დამატებითი სერვისები';


--
-- Name: COLUMN extracharge.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN extracharge.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.name IS 'დასახელება';


--
-- Name: COLUMN extracharge.rate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.rate IS 'ფასი';


--
-- Name: COLUMN extracharge.fixedprice; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.fixedprice IS 'ფიქსირებული ფასი';


--
-- Name: COLUMN extracharge.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.ord IS 'სორტირება';


--
-- Name: COLUMN extracharge.voucherno; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.voucherno IS 'ქვითრის ნუმერაციის წესიCODEdocumentnumbering';


--
-- Name: COLUMN extracharge.web; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.web IS 'პუბლიკაცია ვებზე';


--
-- Name: COLUMN extracharge.webdescription; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.webdescription IS 'აღწერილობა ვებისთვის';


--
-- Name: COLUMN extracharge.chargeapplieson; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.chargeapplieson IS 'სერვისი ვრცელდებაCODEchargeapplieson';


--
-- Name: COLUMN extracharge.extrapostingtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.extrapostingtype IS 'დაბეგვრის დაკისრების წესიCODEextrachargepostingtype';


--
-- Name: COLUMN extracharge.applychargealways; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.applychargealways IS 'დააკისრე სერვისის საფასური ყოველთვის';


--
-- Name: COLUMN extracharge.webord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.webord IS 'ვებ სორტირება';


--
-- Name: COLUMN extracharge.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.regbyid IS 'ავტორი';


--
-- Name: COLUMN extracharge.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN extracharge.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.active IS 'აქტიური';


--
-- Name: COLUMN extracharge.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN extracharge.deleted IS 'წაშლილი';


--
-- Name: extrachargefolio; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE extrachargefolio (
    folioitemid bigint NOT NULL,
    extrachargeid integer NOT NULL,
    rate double precision NOT NULL,
    postingtype integer NOT NULL,
    chargeapplyrieson integer NOT NULL,
    adult integer DEFAULT 0 NOT NULL,
    child integer DEFAULT 0 NOT NULL,
    qty integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.extrachargefolio OWNER TO hms;

--
-- Name: extrachargeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE extrachargeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extrachargeid_seq OWNER TO hms;

--
-- Name: extrachargetax; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE extrachargetax (
    extrachargeid integer NOT NULL,
    taxid integer NOT NULL
);


ALTER TABLE public.extrachargetax OWNER TO hms;

--
-- Name: folio; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE folio (
    folioid bigint NOT NULL,
    num text NOT NULL,
    guestid bigint,
    contragentid bigint,
    reservationroomid bigint,
    status integer NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.folio OWNER TO hms;

--
-- Name: COLUMN folio.status; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN folio.status IS '0 - Reserved, 1 - Cancelled, 2 - No Show, 3 - Checked In, 4 - Checked Out, 5 - Void';


--
-- Name: folioid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE folioid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.folioid_seq OWNER TO hms;

--
-- Name: folioitem; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE folioitem (
    folioitemid bigint NOT NULL,
    folioid bigint NOT NULL,
    roomid integer,
    itemdate date NOT NULL,
    refno text,
    particular integer DEFAULT 0 NOT NULL,
    amount double precision NOT NULL,
    extrachargeid integer,
    ordermainid bigint,
    discountid integer,
    taxid integer,
    paymentid bigint,
    zvoid boolean DEFAULT false NOT NULL,
    done boolean DEFAULT false NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    note text DEFAULT ''::text NOT NULL,
    manual boolean DEFAULT false NOT NULL,
    roomoper integer
);


ALTER TABLE public.folioitem OWNER TO hms;

--
-- Name: COLUMN folioitem.roomoper; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN folioitem.roomoper IS 'accounts';


--
-- Name: folioitemid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE folioitemid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.folioitemid_seq OWNER TO hms;

--
-- Name: guest; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE guest (
    guestid bigint NOT NULL,
    salutationid integer NOT NULL,
    fname text NOT NULL,
    lname text NOT NULL,
    type integer DEFAULT 0 NOT NULL,
    gender integer,
    address text,
    countryid integer,
    city text,
    zip character varying(100),
    idtypeid integer,
    idn character varying(100),
    vipstatusid integer,
    phone character varying(100),
    mobile character varying(100),
    fax character varying(100),
    email character varying(255),
    dob date,
    sdob date,
    weddingdate date,
    nationalityid integer,
    contragentid bigint,
    paymentmethodid integer,
    cardnum character varying(255),
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.guest OWNER TO hms;

--
-- Name: COLUMN guest.type; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN guest.type IS '0 - Adult, 1 - Child';


--
-- Name: COLUMN guest.gender; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN guest.gender IS '0 - Male, 1 - Female';


--
-- Name: COLUMN guest.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN guest.deleted IS 'წაშლილი';


--
-- Name: guestid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE guestid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guestid_seq OWNER TO hms;

--
-- Name: hotel; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE hotel (
    hotelid integer NOT NULL,
    name text NOT NULL,
    address1 text NOT NULL,
    address2 text NOT NULL,
    countryid integer NOT NULL,
    city text NOT NULL,
    zip character varying(100) NOT NULL,
    phone character varying(100) NOT NULL,
    rphone character varying(100) NOT NULL,
    fax character varying(100),
    email character varying(255),
    propertytype text,
    logo character varying(255),
    url character varying(255),
    grade integer,
    idn character varying(255) NOT NULL,
    regno1 character varying(255),
    regno2 character varying(255),
    regno3 character varying(255),
    districtid integer
);


ALTER TABLE public.hotel OWNER TO hms;

--
-- Name: TABLE hotel; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE hotel IS 'სასტუმროს ინფორმაცია';


--
-- Name: COLUMN hotel.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.name IS 'დასახელება';


--
-- Name: COLUMN hotel.address1; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.address1 IS 'მისამართი';


--
-- Name: COLUMN hotel.address2; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.address2 IS 'მისამართი 2';


--
-- Name: COLUMN hotel.countryid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.countryid IS 'ქვეყანა';


--
-- Name: COLUMN hotel.city; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.city IS 'ქალაქი';


--
-- Name: COLUMN hotel.zip; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.zip IS 'საფოსტო ინდექსი';


--
-- Name: COLUMN hotel.phone; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.phone IS 'ტელეფონი';


--
-- Name: COLUMN hotel.rphone; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.rphone IS 'რეგისტრაციის ტელეფონი';


--
-- Name: COLUMN hotel.fax; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.fax IS 'ფაქსი';


--
-- Name: COLUMN hotel.email; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.email IS 'ელ-ფოსტა';


--
-- Name: COLUMN hotel.propertytype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.propertytype IS 'უზრავი ქონების ტიპი';


--
-- Name: COLUMN hotel.logo; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.logo IS 'ლოგო';


--
-- Name: COLUMN hotel.url; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.url IS 'ინტერნეტ გვერდი';


--
-- Name: COLUMN hotel.grade; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.grade IS 'ვარსკვლავიCODEhotelstar';


--
-- Name: COLUMN hotel.idn; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.idn IS 'საიდენთიფიკაციო ნომერი';


--
-- Name: COLUMN hotel.regno1; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.regno1 IS 'რეგისტრაციის ნომერი 1';


--
-- Name: COLUMN hotel.regno2; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.regno2 IS 'რეგისტრაციის ნომერი 2';


--
-- Name: COLUMN hotel.regno3; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.regno3 IS 'რეგისტრაციის ნომერი 3';


--
-- Name: COLUMN hotel.districtid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN hotel.districtid IS 'რაიონი';


--
-- Name: hotelid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE hotelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hotelid_seq OWNER TO hms;

--
-- Name: housekeepingstatus; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE housekeepingstatus (
    housekeepingstatusid integer NOT NULL,
    name text NOT NULL,
    color character varying(100) DEFAULT '#ffffff'::character varying NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.housekeepingstatus OWNER TO hms;

--
-- Name: TABLE housekeepingstatus; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE housekeepingstatus IS 'დალაგების სტატუსი';


--
-- Name: COLUMN housekeepingstatus.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.name IS 'დასახელება';


--
-- Name: COLUMN housekeepingstatus.color; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.color IS 'ფერი';


--
-- Name: COLUMN housekeepingstatus.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.regbyid IS 'ავტორი';


--
-- Name: COLUMN housekeepingstatus.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN housekeepingstatus.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.active IS 'აქტიური';


--
-- Name: COLUMN housekeepingstatus.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN housekeepingstatus.deleted IS 'წაშლილი';


--
-- Name: housekeepingstatusid_; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE housekeepingstatusid_
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.housekeepingstatusid_ OWNER TO hms;

--
-- Name: houseunit; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE houseunit (
    houseunitid integer NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deteted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.houseunit OWNER TO hms;

--
-- Name: TABLE houseunit; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE houseunit IS 'დასალაგებელი ადგილები';


--
-- Name: COLUMN houseunit.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN houseunit.name IS 'დასახელება';


--
-- Name: COLUMN houseunit.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN houseunit.regbyid IS 'ავტორი';


--
-- Name: COLUMN houseunit.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN houseunit.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN houseunit.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN houseunit.active IS 'აქტიური';


--
-- Name: COLUMN houseunit.deteted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN houseunit.deteted IS 'წაშლილი';


--
-- Name: houseunitid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE houseunitid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.houseunitid_seq OWNER TO hms;

--
-- Name: idtype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE idtype (
    idtypeid integer NOT NULL,
    name text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.idtype OWNER TO hms;

--
-- Name: TABLE idtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE idtype IS 'საბუთის ტიპი';


--
-- Name: COLUMN idtype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN idtype.name IS 'დასახელება';


--
-- Name: COLUMN idtype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN idtype.active IS 'აქტიური';


--
-- Name: COLUMN idtype.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN idtype.deleted IS 'წაშლილი';


--
-- Name: idtypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE idtypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.idtypeid_seq OWNER TO hms;

--
-- Name: market; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE market (
    marketid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.market OWNER TO hms;

--
-- Name: TABLE market; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE market IS 'სეგმენტი';


--
-- Name: COLUMN market.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN market.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.name IS 'დასახელება';


--
-- Name: COLUMN market.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.regbyid IS 'ავტორი';


--
-- Name: COLUMN market.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN market.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.active IS 'აქტიური';


--
-- Name: COLUMN market.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN market.deleted IS 'წაშლილი';


--
-- Name: marketid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE marketid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.marketid_seq OWNER TO hms;

--
-- Name: menu; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE menu (
    menuid integer NOT NULL,
    name text NOT NULL,
    file character varying(50) NOT NULL,
    parentid integer,
    ord integer NOT NULL
);


ALTER TABLE public.menu OWNER TO hms;

--
-- Name: menuid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE menuid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menuid_seq OWNER TO hms;

--
-- Name: nationality; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE nationality (
    nationalityid integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.nationality OWNER TO hms;

--
-- Name: nationalityid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE nationalityid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.nationalityid_seq OWNER TO hms;

--
-- Name: payment; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE payment (
    paymentid bigint NOT NULL,
    paymentmethodid integer NOT NULL,
    currencyid integer NOT NULL,
    amount double precision NOT NULL,
    paydate date NOT NULL,
    folioid bigint,
    voucherno text,
    note text,
    deleted boolean DEFAULT false NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.payment OWNER TO hms;

--
-- Name: paymentid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE paymentid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paymentid_seq OWNER TO hms;

--
-- Name: paymentmethod; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE paymentmethod (
    paymentmethodid integer NOT NULL,
    name text NOT NULL,
    code character varying(100) NOT NULL,
    paymentmode integer NOT NULL,
    cardprocessing boolean DEFAULT false NOT NULL,
    receiptno integer DEFAULT 0 NOT NULL,
    extrachargeid integer,
    amount double precision,
    perc double precision,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.paymentmethod OWNER TO hms;

--
-- Name: TABLE paymentmethod; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE paymentmethod IS 'გადახდის მეთოდი';


--
-- Name: COLUMN paymentmethod.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.name IS 'დასახელება';


--
-- Name: COLUMN paymentmethod.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN paymentmethod.paymentmode; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.paymentmode IS 'ანგარიშსწორების ტიპიCODEpaymentmode';


--
-- Name: COLUMN paymentmethod.cardprocessing; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.cardprocessing IS 'ბარათის პროცესინგი';


--
-- Name: COLUMN paymentmethod.receiptno; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.receiptno IS 'ქვითრის ნუმერაციაCODEdocumentnumbering';


--
-- Name: COLUMN paymentmethod.extrachargeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.extrachargeid IS 'დამატებით გადასახადი სერვისზე';


--
-- Name: COLUMN paymentmethod.amount; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.amount IS 'ოდენობა';


--
-- Name: COLUMN paymentmethod.perc; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.perc IS 'პროცენტი / თანხა';


--
-- Name: COLUMN paymentmethod.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.regbyid IS 'ავტორი';


--
-- Name: COLUMN paymentmethod.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN paymentmethod.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.active IS 'აქტიური';


--
-- Name: COLUMN paymentmethod.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN paymentmethod.deleted IS 'წაშლილი';


--
-- Name: paymentmethodid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE paymentmethodid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.paymentmethodid_seq OWNER TO hms;

--
-- Name: payout; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE payout (
    payoutid integer NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deteted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.payout OWNER TO hms;

--
-- Name: TABLE payout; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE payout IS 'გასავალი';


--
-- Name: COLUMN payout.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN payout.name IS 'დასახელება';


--
-- Name: COLUMN payout.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN payout.regbyid IS 'ავტორი';


--
-- Name: COLUMN payout.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN payout.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN payout.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN payout.active IS 'აქტიური';


--
-- Name: COLUMN payout.deteted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN payout.deteted IS 'წაშლილი';


--
-- Name: payoutid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE payoutid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.payoutid_seq OWNER TO hms;

--
-- Name: personellid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE personellid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personellid_seq OWNER TO hms;

--
-- Name: personelltypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE personelltypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personelltypeid_seq OWNER TO hms;

--
-- Name: personnel; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE personnel (
    personnelid integer NOT NULL,
    fname text NOT NULL,
    lname text NOT NULL,
    phone character varying(50),
    personneltypeid integer,
    loginid character varying(15),
    password character varying(15),
    email character varying(255),
    address text,
    regdate timestamp without time zone DEFAULT now(),
    deleted boolean DEFAULT false,
    changebyid integer,
    changedate timestamp without time zone DEFAULT now()
);


ALTER TABLE public.personnel OWNER TO hms;

--
-- Name: personneltype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE personneltype (
    personneltypeid integer NOT NULL,
    name text NOT NULL,
    description text,
    code character varying(2),
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.personneltype OWNER TO hms;

--
-- Name: COLUMN personneltype.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN personneltype.deleted IS 'წაშლილი';


--
-- Name: personneltypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE personneltypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personneltypeid_seq OWNER TO hms;

--
-- Name: plevel; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE plevel (
    plevelid integer NOT NULL,
    personneltypeid integer NOT NULL,
    menuid integer NOT NULL,
    read boolean NOT NULL,
    write boolean NOT NULL
);


ALTER TABLE public.plevel OWNER TO hms;

--
-- Name: plevelid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE plevelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.plevelid_seq OWNER TO hms;

--
-- Name: preference; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE preference (
    preferenceid integer NOT NULL,
    name text NOT NULL,
    preferencetypeid integer NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.preference OWNER TO hms;

--
-- Name: TABLE preference; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE preference IS 'სტუმრის უპირატესობა';


--
-- Name: COLUMN preference.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.name IS 'დასახელება';


--
-- Name: COLUMN preference.preferencetypeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.preferencetypeid IS 'ტიპი';


--
-- Name: COLUMN preference.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.regbyid IS 'ავტორი';


--
-- Name: COLUMN preference.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN preference.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.active IS 'აქტიური';


--
-- Name: COLUMN preference.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preference.deleted IS 'წაშლილი';


--
-- Name: preferenceid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE preferenceid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preferenceid_seq OWNER TO hms;

--
-- Name: preferencetype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE preferencetype (
    preferencetypeid integer NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deteted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.preferencetype OWNER TO hms;

--
-- Name: TABLE preferencetype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE preferencetype IS 'სტუმრის უპირატესობის ტიპი';


--
-- Name: COLUMN preferencetype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preferencetype.name IS 'დასახელება';


--
-- Name: COLUMN preferencetype.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preferencetype.regbyid IS 'ავტორი';


--
-- Name: COLUMN preferencetype.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preferencetype.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN preferencetype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preferencetype.active IS 'აქტიური';


--
-- Name: COLUMN preferencetype.deteted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN preferencetype.deteted IS 'წაშლილი';


--
-- Name: preferencetypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE preferencetypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.preferencetypeid_seq OWNER TO hms;

--
-- Name: ratetype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE ratetype (
    ratetypeid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    ord integer DEFAULT 0 NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.ratetype OWNER TO hms;

--
-- Name: TABLE ratetype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE ratetype IS 'ტარიფის ტიპი';


--
-- Name: COLUMN ratetype.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN ratetype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.name IS 'დასახელება';


--
-- Name: COLUMN ratetype.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.regbyid IS 'ავტორი';


--
-- Name: COLUMN ratetype.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN ratetype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.active IS 'აქტიური';


--
-- Name: COLUMN ratetype.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.ord IS 'სორტირება';


--
-- Name: COLUMN ratetype.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN ratetype.deleted IS 'წაშლილი';


--
-- Name: ratetypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE ratetypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ratetypeid_seq OWNER TO hms;

--
-- Name: ratetyperoomtype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE ratetyperoomtype (
    ratetypeid integer NOT NULL,
    roomtypeid integer NOT NULL
);


ALTER TABLE public.ratetyperoomtype OWNER TO hms;

--
-- Name: reason; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE reason (
    reasonid integer NOT NULL,
    name text NOT NULL,
    reasoncategory integer NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.reason OWNER TO hms;

--
-- Name: TABLE reason; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE reason IS 'მიზეზები';


--
-- Name: COLUMN reason.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.name IS 'დასახელება';


--
-- Name: COLUMN reason.reasoncategory; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.reasoncategory IS 'კატეგორიაCODEreasoncategory';


--
-- Name: COLUMN reason.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.regbyid IS 'ავტორი';


--
-- Name: COLUMN reason.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN reason.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.active IS 'აქტიური';


--
-- Name: COLUMN reason.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reason.deleted IS 'წაშლილი';


--
-- Name: reasonid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE reasonid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reasonid_seq OWNER TO hms;

--
-- Name: region; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE region (
    regionid integer NOT NULL,
    countryid integer NOT NULL,
    name text,
    code text
);


ALTER TABLE public.region OWNER TO hms;

--
-- Name: TABLE region; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE region IS 'რეგიონი';


--
-- Name: COLUMN region.countryid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN region.countryid IS 'ქვეყანა';


--
-- Name: COLUMN region.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN region.name IS 'სახელი';


--
-- Name: COLUMN region.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN region.code IS 'მოკლე სახელი';


--
-- Name: regionid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE regionid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.regionid_seq OWNER TO hms;

--
-- Name: reservation; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE reservation (
    reservationid bigint NOT NULL,
    arraivaldate timestamp without time zone NOT NULL,
    departuredate timestamp without time zone NOT NULL,
    reservationtypeid integer NOT NULL,
    ratetype integer NOT NULL,
    manualrate double precision,
    contractcontragentid bigint,
    billto integer,
    taxexemptionreason text,
    paymentmode integer NOT NULL,
    paymentmethodid integer,
    paymentcontragentid bigint,
    advancepaymentdate date,
    advancepaymentamount double precision,
    companyid bigint,
    marketid integer,
    bsourceid integer,
    taid bigint,
    commissionplan integer,
    commissionvalue double precision,
    voucher text,
    discountid integer,
    postingtype integer,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    postingvalueevery double precision,
    num text NOT NULL,
    nomanualtax boolean DEFAULT false NOT NULL,
    notax boolean DEFAULT false NOT NULL,
    discountnights integer,
    status integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.reservation OWNER TO hms;

--
-- Name: COLUMN reservation.ratetype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.ratetype IS '0 - normal, 1 - contrac, 2 - tmanual';


--
-- Name: COLUMN reservation.billto; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.billto IS '0 - Company, 1 - Group Owner, 2 - Guest, 3 - Room and tx to company, extras to guest';


--
-- Name: COLUMN reservation.paymentmode; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.paymentmode IS '0 - Cash, 1 - Credit';


--
-- Name: COLUMN reservation.commissionplan; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.commissionplan IS '0 - % on All nights, 1 - Fixed per night, 2 - Fixed per stay';


--
-- Name: COLUMN reservation.postingtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.postingtype IS '0 - After every, 1 - On all nights, 2 - On last night';


--
-- Name: COLUMN reservation.status; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservation.status IS '-1 - finished, 0 - active, 1 - canceled, 2 - no show, 3 - voided';


--
-- Name: reservationid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE reservationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservationid_seq OWNER TO hms;

--
-- Name: reservationreason; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE reservationreason (
    reservationid bigint NOT NULL,
    reasonid integer NOT NULL
);


ALTER TABLE public.reservationreason OWNER TO hms;

--
-- Name: reservationroom; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE reservationroom (
    reservationroomid bigint NOT NULL,
    reservationid bigint NOT NULL,
    roomid integer,
    leader boolean DEFAULT false NOT NULL,
    adult integer NOT NULL,
    child integer NOT NULL,
    ratetypeid integer NOT NULL,
    guestid bigint NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    roomtypeid integer
);


ALTER TABLE public.reservationroom OWNER TO hms;

--
-- Name: reservationroomid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE reservationroomid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservationroomid_seq OWNER TO hms;

--
-- Name: reservationtype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE reservationtype (
    reservationtypeid integer NOT NULL,
    name text NOT NULL,
    confirmed boolean DEFAULT false NOT NULL,
    color character varying(7),
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.reservationtype OWNER TO hms;

--
-- Name: TABLE reservationtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE reservationtype IS 'რეზერვაციის ტიპი';


--
-- Name: COLUMN reservationtype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.name IS 'დასახელება';


--
-- Name: COLUMN reservationtype.confirmed; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.confirmed IS 'დადასტურებული';


--
-- Name: COLUMN reservationtype.color; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.color IS 'ფერი';


--
-- Name: COLUMN reservationtype.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.regbyid IS 'ავტორი';


--
-- Name: COLUMN reservationtype.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN reservationtype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN reservationtype.active IS 'აქტიური';


--
-- Name: reservationtypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE reservationtypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservationtypeid_seq OWNER TO hms;

--
-- Name: room; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE room (
    roomid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    roomtypeid integer NOT NULL,
    bedtypeid integer NOT NULL,
    phoneext character varying(50) NOT NULL,
    keycard character varying(255) NOT NULL,
    ord integer NOT NULL,
    nonsmoke boolean DEFAULT true NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.room OWNER TO hms;

--
-- Name: TABLE room; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE room IS 'ოთახი';


--
-- Name: COLUMN room.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.code IS 'მოკლე სახელწოდება';


--
-- Name: COLUMN room.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.name IS 'სახელი';


--
-- Name: COLUMN room.roomtypeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.roomtypeid IS 'ოთახის ტიპი';


--
-- Name: COLUMN room.bedtypeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.bedtypeid IS 'საწოლის ტიპი';


--
-- Name: COLUMN room.phoneext; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.phoneext IS 'შიდა სატელეფონო ნომერი';


--
-- Name: COLUMN room.keycard; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.keycard IS 'ელ - ბოქლომის კოდი';


--
-- Name: COLUMN room.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.ord IS 'სორტირება';


--
-- Name: COLUMN room.nonsmoke; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.nonsmoke IS 'არამწეველი';


--
-- Name: COLUMN room.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.regbyid IS 'ავტორი';


--
-- Name: COLUMN room.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN room.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.active IS 'აქტიური';


--
-- Name: COLUMN room.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN room.deleted IS 'წაშლილი';


--
-- Name: roomid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE roomid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomid_seq OWNER TO hms;

--
-- Name: roomimage; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomimage (
    roomimageid integer NOT NULL,
    roomid integer NOT NULL,
    path character varying(255) NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL
);


ALTER TABLE public.roomimage OWNER TO hms;

--
-- Name: roomimageid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE roomimageid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomimageid_seq OWNER TO hms;

--
-- Name: roomownerroom; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomownerroom (
    roomownerid bigint NOT NULL,
    roomid integer NOT NULL
);


ALTER TABLE public.roomownerroom OWNER TO hms;

--
-- Name: roomrate; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomrate (
    roomrateid integer NOT NULL,
    roomtypeid integer NOT NULL,
    seasonid integer,
    contragentid bigint,
    tax boolean DEFAULT false NOT NULL,
    rate double precision DEFAULT 0 NOT NULL,
    rateadult double precision DEFAULT 0 NOT NULL,
    ratechild double precision DEFAULT 0 NOT NULL,
    ratetypeid integer NOT NULL,
    ord integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.roomrate OWNER TO hms;

--
-- Name: TABLE roomrate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE roomrate IS 'ოთახის ტარიფები';


--
-- Name: COLUMN roomrate.roomtypeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.roomtypeid IS 'ოთახის ტიპი';


--
-- Name: COLUMN roomrate.seasonid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.seasonid IS 'სეზონი';


--
-- Name: COLUMN roomrate.contragentid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.contragentid IS 'კონტრაგენტი';


--
-- Name: COLUMN roomrate.tax; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.tax IS 'გადასახადების ჩათვლით';


--
-- Name: COLUMN roomrate.rate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.rate IS 'ტარიფი';


--
-- Name: COLUMN roomrate.rateadult; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.rateadult IS 'ტარიფი უფროსისთვის';


--
-- Name: COLUMN roomrate.ratechild; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.ratechild IS 'ტარიფი ბავშვისთვის';


--
-- Name: COLUMN roomrate.ratetypeid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.ratetypeid IS 'ტარიფის ტიპი';


--
-- Name: COLUMN roomrate.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomrate.ord IS 'სორტირება';


--
-- Name: roomrateid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE roomrateid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomrateid_seq OWNER TO hms;

--
-- Name: roomtype; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomtype (
    roomtypeid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    badult integer NOT NULL,
    bchild integer NOT NULL,
    madult integer NOT NULL,
    mchild integer NOT NULL,
    web boolean DEFAULT true NOT NULL,
    color character varying(7) NOT NULL,
    webinventory integer DEFAULT 0 NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    ord integer DEFAULT 0 NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.roomtype OWNER TO hms;

--
-- Name: TABLE roomtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE roomtype IS 'ოთახის ტიპები';


--
-- Name: COLUMN roomtype.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.code IS 'მოკლე დასახელება';


--
-- Name: COLUMN roomtype.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.name IS 'დასახელება';


--
-- Name: COLUMN roomtype.badult; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.badult IS 'ძირითადი უფროსი';


--
-- Name: COLUMN roomtype.bchild; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.bchild IS 'ძირითადი ბავშვი';


--
-- Name: COLUMN roomtype.madult; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.madult IS 'მაქსიმუმ უფროსი';


--
-- Name: COLUMN roomtype.mchild; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.mchild IS 'მაქსიმუმ ბავშვი';


--
-- Name: COLUMN roomtype.web; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.web IS 'ინტერნეტი';


--
-- Name: COLUMN roomtype.color; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.color IS 'ფერი';


--
-- Name: COLUMN roomtype.webinventory; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.webinventory IS 'Web Inventory';


--
-- Name: COLUMN roomtype.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.regbyid IS 'ავტორი';


--
-- Name: COLUMN roomtype.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN roomtype.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.active IS 'აქტიური';


--
-- Name: COLUMN roomtype.ord; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.ord IS 'სორტირება';


--
-- Name: COLUMN roomtype.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomtype.deleted IS 'წაშლილი';


--
-- Name: season; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE season (
    seasonid integer NOT NULL,
    code text NOT NULL,
    name text NOT NULL,
    fday integer NOT NULL,
    tday integer NOT NULL,
    fmonth integer NOT NULL,
    tmonth integer NOT NULL,
    startdate date NOT NULL,
    enddate date NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.season OWNER TO hms;

--
-- Name: TABLE season; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE season IS 'სეზონები';


--
-- Name: COLUMN season.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.code IS 'მოკლე დასახელება';


--
-- Name: COLUMN season.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.name IS 'დასახელება';


--
-- Name: COLUMN season.fday; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.fday IS 'დღიდან';


--
-- Name: COLUMN season.tday; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.tday IS 'დღემდე';


--
-- Name: COLUMN season.fmonth; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.fmonth IS 'თვიდან';


--
-- Name: COLUMN season.tmonth; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.tmonth IS 'თვემდე';


--
-- Name: COLUMN season.startdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.startdate IS 'თარიღიდან';


--
-- Name: COLUMN season.enddate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.enddate IS 'თარიღამდე';


--
-- Name: COLUMN season.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.regbyid IS 'ავტორი';


--
-- Name: COLUMN season.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN season.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.active IS 'აქტიური';


--
-- Name: COLUMN season.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN season.deleted IS 'წაშლილი';


--
-- Name: roomrates; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW roomrates AS
    SELECT roomtype.roomtypeid, ratetype.ratetypeid, season.seasonid, contragent.contragentid FROM contragent, ratetype, roomtype, season WHERE (((((((contragent.rate = 1) AND (roomtype.deleted = false)) AND (ratetype.deleted = false)) AND (season.deleted = false)) AND (roomtype.active = true)) AND (ratetype.active = true)) AND (season.active = true));


ALTER TABLE public.roomrates OWNER TO hms;

--
-- Name: roomst; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomst (
    roomstsid bigint NOT NULL,
    roomid integer NOT NULL,
    statusdate timestamp without time zone NOT NULL,
    st integer NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.roomst OWNER TO hms;

--
-- Name: COLUMN roomst.roomid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomst.roomid IS 'ოთახი';


--
-- Name: COLUMN roomst.statusdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomst.statusdate IS 'თარიღი';


--
-- Name: COLUMN roomst.st; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomst.st IS 'სტატუსი';


--
-- Name: COLUMN roomst.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomst.regbyid IS 'ავტორი';


--
-- Name: COLUMN roomst.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN roomst.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: roomstid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE roomstid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomstid_seq OWNER TO hms;

--
-- Name: roomtypeamenity; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE roomtypeamenity (
    roomtypeid integer NOT NULL,
    amenityid integer NOT NULL
);


ALTER TABLE public.roomtypeamenity OWNER TO hms;

--
-- Name: roomtypeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE roomtypeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roomtypeid_seq OWNER TO hms;

--
-- Name: salutation; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE salutation (
    salutationid integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.salutation OWNER TO hms;

--
-- Name: TABLE salutation; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE salutation IS 'მიმართვის ფორმა';


--
-- Name: COLUMN salutation.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN salutation.name IS 'დასახელება';


--
-- Name: salutationid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE salutationid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.salutationid_seq OWNER TO hms;

--
-- Name: seasonid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE seasonid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seasonid_seq OWNER TO hms;

--
-- Name: stcolor; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE stcolor (
    stcolorid integer NOT NULL,
    roomstatus integer NOT NULL,
    color character varying DEFAULT '#FFFFFF'::character varying NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.stcolor OWNER TO hms;

--
-- Name: TABLE stcolor; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE stcolor IS 'სტატუსის ფერი';


--
-- Name: COLUMN stcolor.roomstatus; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.roomstatus IS 'სტატუსიCODEroomstatus';


--
-- Name: COLUMN stcolor.color; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.color IS 'ფერი';


--
-- Name: COLUMN stcolor.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.regbyid IS 'ავტორი';


--
-- Name: COLUMN stcolor.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN stcolor.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.active IS 'აქტიური';


--
-- Name: COLUMN stcolor.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN stcolor.deleted IS 'წაშლილი';


--
-- Name: stcolorid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE stcolorid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stcolorid_seq OWNER TO hms;

--
-- Name: tax; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE tax (
    taxid integer NOT NULL,
    name text NOT NULL,
    code text NOT NULL,
    startfrom date NOT NULL,
    exemptafter integer DEFAULT 0 NOT NULL,
    postingtype integer NOT NULL,
    amount double precision NOT NULL,
    applybefore boolean DEFAULT false NOT NULL,
    applyonrate boolean DEFAULT false NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.tax OWNER TO hms;

--
-- Name: TABLE tax; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE tax IS 'გადასახადები';


--
-- Name: COLUMN tax.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.name IS 'დასახელება';


--
-- Name: COLUMN tax.code; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.code IS 'მოკლე დასახელება';


--
-- Name: COLUMN tax.startfrom; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.startfrom IS 'საწყისი მნიშვნელობა';


--
-- Name: COLUMN tax.exemptafter; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.exemptafter IS 'საბოლოო მნიშვნელობა';


--
-- Name: COLUMN tax.postingtype; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.postingtype IS 'დაბეგვრის წესიCODEtaxpostingtype';


--
-- Name: COLUMN tax.amount; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.amount IS 'ოდენობა';


--
-- Name: COLUMN tax.applybefore; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.applybefore IS 'დაბეგვრა გადახდამდე';


--
-- Name: COLUMN tax.applyonrate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.applyonrate IS 'სუფთა დაბეგვრა';


--
-- Name: COLUMN tax.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.regbyid IS 'ავტორი';


--
-- Name: COLUMN tax.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN tax.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.active IS 'აქტიური';


--
-- Name: COLUMN tax.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN tax.deleted IS 'წაშლილი';


--
-- Name: taxaccount; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE taxaccount (
    taxaccount integer NOT NULL,
    account integer,
    payoutid integer,
    taxid integer,
    tax boolean
);


ALTER TABLE public.taxaccount OWNER TO hms;

--
-- Name: taxid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE taxid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.taxid_seq OWNER TO hms;

--
-- Name: taxsequence; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE taxsequence (
    taxid integer NOT NULL,
    afterid integer NOT NULL
);


ALTER TABLE public.taxsequence OWNER TO hms;

--
-- Name: template; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE template (
    templateid integer NOT NULL,
    name text NOT NULL,
    templatecategoryid integer NOT NULL,
    subject text NOT NULL,
    personnelid integer NOT NULL,
    cc character varying(255),
    bcc character varying(255),
    content text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.template OWNER TO hms;

--
-- Name: TABLE template; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE template IS 'შაბლონი';


--
-- Name: COLUMN template.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.name IS 'დასახელება';


--
-- Name: COLUMN template.templatecategoryid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.templatecategoryid IS 'შაბლონის კატეგორია';


--
-- Name: COLUMN template.subject; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.subject IS 'თემა';


--
-- Name: COLUMN template.personnelid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.personnelid IS 'გამგზავნი ელ ფოსტის მისამართი';


--
-- Name: COLUMN template.cc; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.cc IS 'CC';


--
-- Name: COLUMN template.bcc; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.bcc IS 'BCC';


--
-- Name: COLUMN template.content; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.content IS 'შინაარსი';


--
-- Name: COLUMN template.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.regbyid IS 'ავტორი';


--
-- Name: COLUMN template.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN template.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.active IS 'აქტიური';


--
-- Name: COLUMN template.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN template.deleted IS 'წაშლილი';


--
-- Name: templatecategory; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE templatecategory (
    templatecategoryid integer NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deteted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.templatecategory OWNER TO hms;

--
-- Name: TABLE templatecategory; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE templatecategory IS 'შაბლობების კატეგორიები';


--
-- Name: COLUMN templatecategory.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN templatecategory.name IS 'დასახელება';


--
-- Name: COLUMN templatecategory.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN templatecategory.regbyid IS 'ავტორი';


--
-- Name: COLUMN templatecategory.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN templatecategory.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: COLUMN templatecategory.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN templatecategory.active IS 'აქტიური';


--
-- Name: COLUMN templatecategory.deteted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN templatecategory.deteted IS 'წაშლილი';


--
-- Name: templatecategoryid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE templatecategoryid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.templatecategoryid_seq OWNER TO hms;

--
-- Name: templateid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE templateid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.templateid_seq OWNER TO hms;

--
-- Name: transportationmode; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE transportationmode (
    transportationmodeid integer NOT NULL,
    name text NOT NULL,
    regbyid integer NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deteted boolean DEFAULT false NOT NULL,
    regdate timestamp without time zone DEFAULT now()
);


ALTER TABLE public.transportationmode OWNER TO hms;

--
-- Name: TABLE transportationmode; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE transportationmode IS 'ტრანსპორტირების ტიპი';


--
-- Name: COLUMN transportationmode.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN transportationmode.name IS 'დასახელება';


--
-- Name: COLUMN transportationmode.regbyid; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN transportationmode.regbyid IS 'ავტორი';


--
-- Name: COLUMN transportationmode.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN transportationmode.active IS 'აქტიური';


--
-- Name: COLUMN transportationmode.deteted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN transportationmode.deteted IS 'წაშლილი';


--
-- Name: COLUMN transportationmode.regdate; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN transportationmode.regdate IS 'რეგისტრაციის თარიღი';


--
-- Name: transportationmodeid_sec; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE transportationmodeid_sec
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportationmodeid_sec OWNER TO hms;

--
-- Name: transportationmodeid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE transportationmodeid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transportationmodeid_seq OWNER TO hms;

--
-- Name: v_arrivallist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_arrivallist AS
    SELECT r.reservationid, m.reservationroomid, m.roomid, COALESCE(t.roomtypeid, o.roomtypeid) AS roomtypeid, r.arraivaldate, r.departuredate, r.regbyid, r.reservationtypeid, g.guestid, ((g.fname || ' '::text) || g.lname) AS guest, o.roomcode, CASE WHEN (o.roomid IS NOT NULL) THEN o.roomtypecode ELSE t.code END AS roomtypecode, b.name AS bsourcename, b.bsourceid, c.name AS companyname, m.adult, m.child, v.name AS reservtype FROM ((reservationroom m LEFT JOIN (SELECT oo.roomid, oo.code AS roomcode, tt.code AS roomtypecode, tt.roomtypeid FROM room oo, roomtype tt WHERE (oo.roomtypeid = tt.roomtypeid)) o ON ((o.roomid = m.roomid))) LEFT JOIN roomtype t ON ((t.roomtypeid = m.roomtypeid))), (reservation r LEFT JOIN bsource b ON ((b.bsourceid = r.bsourceid))), (guest g LEFT JOIN contragent c ON (((c.contragentid = g.contragentid) AND (c.type = 1)))), personnel l, reservationtype v WHERE (((((m.reservationid = r.reservationid) AND (g.guestid = m.guestid)) AND (l.personnelid = r.regbyid)) AND (r.status >= 0)) AND (v.reservationtypeid = r.reservationtypeid));


ALTER TABLE public.v_arrivallist OWNER TO hms;

--
-- Name: v_contragentlist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_contragentlist AS
    SELECT c.contragentid, c.type, c.salutationid, c.fname, c.lname, c.name, c.address, c.countryid, c.city, c.zip, c.phone, c.fax, c.mobile, c.email, c.commissionplan, c.val, c.rate, c.openbalance, c.roominventory, c.createuser, c.bsource, c.ccblock, c.idn, c.creditterm, c.creditlimit, c.regbyid, c.regdate, c.deleted, ((c.fname || ' '::text) || c.lname) AS contragent, c.name AS company, cc.name AS country FROM (contragent c LEFT JOIN country cc ON ((cc.countryid = c.countryid)));


ALTER TABLE public.v_contragentlist OWNER TO hms;

--
-- Name: vipstatus; Type: TABLE; Schema: public; Owner: hms; Tablespace: 
--

CREATE TABLE vipstatus (
    vipstatusid integer NOT NULL,
    name text NOT NULL,
    active boolean DEFAULT true NOT NULL,
    deleted boolean DEFAULT false NOT NULL
);


ALTER TABLE public.vipstatus OWNER TO hms;

--
-- Name: TABLE vipstatus; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON TABLE vipstatus IS 'VIP სტატუსი';


--
-- Name: COLUMN vipstatus.name; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN vipstatus.name IS 'დასახელება';


--
-- Name: COLUMN vipstatus.active; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN vipstatus.active IS 'აქტიური';


--
-- Name: COLUMN vipstatus.deleted; Type: COMMENT; Schema: public; Owner: hms
--

COMMENT ON COLUMN vipstatus.deleted IS 'წაშლილი';


--
-- Name: v_guestdblist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_guestdblist AS
    SELECT (((s.name || ' '::text) || (g.fname || ' '::text)) || g.lname) AS guest, g.guestid, g.city, g.phone, g.mobile, g.email, c.name AS country, v.name AS vipstatus, g.salutationid, g.countryid, g.vipstatusid FROM (((guest g JOIN salutation s ON ((s.salutationid = g.salutationid))) LEFT JOIN country c ON ((c.countryid = g.countryid))) LEFT JOIN vipstatus v ON ((v.vipstatusid = g.vipstatusid)));


ALTER TABLE public.v_guestdblist OWNER TO hms;

--
-- Name: v_reservationlist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_reservationlist AS
    SELECT r.reservationid, m.reservationroomid, m.roomid, COALESCE(t.roomtypeid, o.roomtypeid) AS roomtypeid, r.arraivaldate, r.departuredate, r.regdate, r.regbyid, r.reservationtypeid, r.status, g.guestid, ((g.fname || ' '::text) || g.lname) AS guest, o.roomcode, CASE WHEN (o.roomid IS NOT NULL) THEN o.roomtypecode ELSE t.code END AS roomtypecode, COALESCE(b.name, (' '::bpchar)::text) AS bsourcename, b.bsourceid, COALESCE(c.name, (' '::bpchar)::text) AS companyname, COALESCE(a.price, (0)::double precision) AS price, COALESCE(d.paid, (0)::double precision) AS paid, d.vouchernum, l.loginid AS "user", v.name AS reservationtype FROM ((((reservationroom m LEFT JOIN (SELECT oo.roomid, oo.code AS roomcode, tt.code AS roomtypecode, tt.roomtypeid FROM room oo, roomtype tt WHERE (oo.roomtypeid = tt.roomtypeid)) o ON ((o.roomid = m.roomid))) LEFT JOIN roomtype t ON ((t.roomtypeid = m.roomtypeid))) LEFT JOIN (SELECT sum(pm.amount) AS paid, fl.reservationroomid, string_agg(pm.voucherno, ','::text) AS vouchernum FROM payment pm, folio fl WHERE (pm.folioid = fl.folioid) GROUP BY fl.reservationroomid) d ON ((d.reservationroomid = m.reservationroomid))) LEFT JOIN (SELECT sum(fi.amount) AS price, fl.reservationroomid FROM folioitem fi, folio fl WHERE (fi.folioid = fl.folioid) GROUP BY fl.reservationroomid) a ON ((a.reservationroomid = m.reservationroomid))), (reservation r LEFT JOIN bsource b ON ((b.bsourceid = r.bsourceid))), (guest g LEFT JOIN contragent c ON (((c.contragentid = g.contragentid) AND (c.type = 1)))), personnel l, reservationtype v WHERE (((((m.reservationid = r.reservationid) AND (g.guestid = m.guestid)) AND (l.personnelid = r.regbyid)) AND (r.status >= 0)) AND (v.reservationtypeid = r.reservationtypeid));


ALTER TABLE public.v_reservationlist OWNER TO hms;

--
-- Name: vipstatusid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE vipstatusid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vipstatusid_seq OWNER TO hms;

--
-- Data for Name: amenity; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY amenity (amenityid, name, type, ord, regbyid, regdate, active, deleted) FROM stdin;
2	კონდიციონერი	2	2	1	2014-08-09 16:35:44.422	f	f
3	ტელევიზორი	0	1	1	2014-08-09 16:35:54.151	t	f
1	აუზი	1	1	1	2014-08-09 16:35:59.018	t	f
4	თხევადკრისტალური TV	0	1	1	2014-08-20 16:44:20.069	t	f
\.


--
-- Name: amenityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('amenityid_seq', 4, true);


--
-- Data for Name: bedtype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY bedtype (bedtypeid, code, name, regbyid, regdate, active, deleted) FROM stdin;
4	1 Kng, 1 Sf	1 King size bed	1	2014-08-20 16:59:20.158	t	f
2	2 Sng.b.	2 Single Beds	1	2014-08-20 16:59:40.457	t	f
3	2 Sng.b. & 1 kng.s.b	2 King size beds	1	2014-08-20 16:59:54.637	t	f
1	Kng.s.b.	2 Single Beds & 1 King size bad	1	2014-08-20 17:00:16.342	t	f
5	4SB	4 Single beds	1	2014-08-20 17:00:45.353	t	f
6	1	1 King size bad & 1 Sofa bed	1	2014-08-20 17:03:38.929	t	f
7	Sng/sofa	2 Single bed & 1 Sofa Bed	1	2014-08-20 17:04:42.285	t	f
\.


--
-- Name: bedtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('bedtypeid_seq', 7, true);


--
-- Data for Name: bsource; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY bsource (bsourceid, code, name, regbyid, regdate, active, deleted) FROM stdin;
\.


--
-- Name: bsourceid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('bsourceid_seq', 1, false);


--
-- Data for Name: checkinreservationsettings; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY checkinreservationsettings (checkinreservationsettingsid, hours24, checkintime, checkouttime, autopostdayuse, graceperioddayuse, dayusecharge, autopostforlatecheckout, graceperiodlate, latecheckoutcharge, autopostearly, graceperiodearly, earlycheckoutcahrge, postcancellationfee, amountcancell, totalchargecancell, beyond, within, postnoshowfee, amountnoshow, totalchargenoshow, finstartmonth, finstartday, finendmonth, finendday, guestnamereserv, guestnamewalkin, guestidnreserv, guestidnwalkin, marketcodereserv, marketcodewalkin, paymenttypereserv, paymenttypewalkin, tareserv, tawalkin, companyreserv, companywalkin, bsourcereserv, bsourcewalkin, nationalityreserv, nationalitywalkin, emailreservationvoucher, nightauditdirty, overbooking, baseoccupancy, frontratemoderegular, sendreviewtoall, regbyid, regdate, addressreserv, addresswalkin) FROM stdin;
2	f	12:02:00	11:11:00	t	3	20	t	2	10	t	1	5	2	15	f	\N	3	1	10	f	1	0	31	11	t	t	t	t	f	f	t	t	f	f	f	f	f	f	f	f	t	t	t	t	f	t	1	2014-08-18 11:52:51.463821	t	t
\.


--
-- Name: checkinreservationsettings_ss_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('checkinreservationsettings_ss_seq', 1, false);


--
-- Name: checkinreservationsettingsid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('checkinreservationsettingsid_seq', 2, true);


--
-- Data for Name: city; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY city (cityid, regionid, name, code, ext) FROM stdin;
\.


--
-- Name: cityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('cityid_seq', 1, false);


--
-- Data for Name: closedate; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY closedate (closedateid, cldate, regbyid, regdate) FROM stdin;
2	2014-10-23	1	2014-11-21 20:23:08.211
\.


--
-- Name: closedateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('closedateid_seq', 2, true);


--
-- Data for Name: confmail; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY confmail (confmailid, smtp, port, username, pass, frommail) FROM stdin;
2	smtp.googlemail.com	465	ims@mysoft.ge	Ims32145	ims@mysoft.ge
\.


--
-- Name: confmailid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('confmailid_seq', 2, true);


--
-- Data for Name: connectedroom; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY connectedroom (roomid, connectedid) FROM stdin;
\.


--
-- Data for Name: contragent; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY contragent (contragentid, type, salutationid, fname, lname, name, address, countryid, city, zip, phone, fax, mobile, email, commissionplan, val, rate, openbalance, roominventory, createuser, bsource, ccblock, idn, creditterm, creditlimit, regbyid, regdate, deleted) FROM stdin;
0	0	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	0	0	1	\N	\N	\N	\N	\N	\N	\N	\N	1	2014-08-13 17:55:22.519101	f
8	1	4	\N	ccccc	aaaaaaaa		9			\N				0	0	0	\N	\N	\N	f	\N	\N	\N	\N	1	2014-09-09 15:06:57.68486	f
2	2	1	სასტუმრო	ჩემია	მაგარი კომპანია	დვასდფა	144	ფასდფას	12341	3რ13412	421341	34123413	3412341	1	10	1	100	0	t	f	f	ე321234	\N	\N	1	2014-08-09 14:26:19.576	f
9	2	6	\N	asd	asd		7			\N				0	0	0	\N	\N	\N	f	\N	\N	\N	\N	1	2014-09-17 15:56:36.073667	f
1	1	1	გიზუნა	კალანდაძე	სუპერ თრეველი		152	თბილისი						0	10	1	\N	0	f	f	f	\N	\N	\N	1	2014-07-31 18:23:47.320787	t
12	2	\N	giorgi	vashakidze	\N	dasda	2	dsadas	\N	123	12312312	3213	111	2	12321	0	312312	0	t	t	t	\N	\N	\N	1	2014-11-30 13:56:03.882	f
13	2	\N	giorgi	vashakidze	\N	dasda	2	dsadas	\N	123	12312312	3213	111	2	12321	0	312312	0	t	t	t	\N	\N	\N	1	2014-11-30 13:56:17.787	f
14	2	\N	giorgi	vashakidze	Selfin	Address	1	dasdasdas	\N	123	123	123	dasda	1	123	0	123	1	t	t	t	\N	\N	\N	1	2014-11-30 15:10:07.308	f
15	2	\N	giorgi	vashakidze			1		\N				dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:12.672	f
16	2	\N	giorgi	vashakidze			1		\N		113		dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:26.587	f
17	2	\N	giorgi	vashakidze			1		\N		113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:30.447	f
18	2	\N	giorgi	vashakidze			1		\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:35.485	f
19	2	\N	giorgi	vashakidze	123		1		\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:39.613	f
20	2	\N	giorgi	vashakidze	123		1	123	\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:44.551	f
21	2	\N	giorgi	vashakidze	123	14654	1	123	\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:49.022	f
22	2	\N	giorgi	vashakidze	123	14654	1	123	\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:19:57.815	f
23	2	\N	giorgi	vashakidze	123	14654	1	123	\N	132	113	123	dasdasdas	1	123	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 15:20:43.726	f
28	2	\N	vasho	áááá ááá«á	hi	hello            	2	Tbilisi	\N	123	123	123	gio@avoe.ge	1	123456	0	123	0	t	t	t	\N	\N	\N	1	2014-11-30 16:15:03.436	f
29	2	\N	ááá¡á°á	ááá¡	áá	            	1		\N				ds@dsadas.ge	1	123	0	3123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:14:35.701	f
30	2	\N	ááá¡á°á	ááá¡	áá	            	1		\N				ds@dsadas.ge	1	123	0	3123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:17:29.917	f
31	2	\N	გიორგი	ვაშაკიძე	გიორგი ვაშაკიძე	გიორგი ვაშაკიძე	1	გიორგი ვაშაკიძე	\N				dasd@dasda.ge	2	123	0	123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:19:50.94	f
32	2	\N	გიორგი	ვაშაკიძე	გიორგი ვაშაკიძე	            	1		\N				დსადასდას	0	123	0	123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:20:49.873	f
33	2	\N	გიორგი	ვაშაკიძე	გიორგი ვაშაკიძე	            	1		\N				გიორგი ვაშაკიძე	2	123	0	123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:24:54.716	f
34	2	\N	გიორგი	ვაშაკიძე	გიორგი ვაშაკიძე	            	1		\N				გიორგი ვაშაკიძე	2	123	0	123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:25:57.674	f
35	2	\N	fu	daas	dasda	            	1		\N				dasda@dsada.ge	1	1312	0	31231	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:36:08.033	f
36	2	\N	giorgi	vashakidze	dasdas	            	1		\N				dasdas@dsad.ge	1	123	0	123	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 19:38:13.27	f
39	1	\N	das	dasdas	dasdas	                	1		\N				dasd@dasdas.ge	\N	\N	0	\N	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 20:53:27.236	f
40	1	\N	ნიკოლოზ	ბარბაქაძე	შპს ნიკე	                	1		\N				nika@selfin.ge	\N	\N	0	\N	0	\N	\N	\N	\N	\N	\N	1	2014-12-01 20:54:28.183	f
41	2	\N	giorgi	vashakidze	vashli	            	1		\N	132	113	123	dasdasdas@dfaadf.com	0	123	0	123	0	t	t	t	\N	\N	\N	1	2014-12-01 22:06:25.024229	f
\.


--
-- Name: contragentid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('contragentid_seq', 41, true);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY country (countryid, name, code, ext, flag) FROM stdin;
1	ა.შ.შ.	\N	\N	\N
2	ავსტრალია	\N	\N	\N
3	ავსტრია	\N	\N	\N
4	ავღანეთი	\N	\N	\N
5	აზერბაიჯანი	\N	\N	\N
6	ალბანეთი	\N	\N	\N
7	ალჟირი	\N	\N	\N
8	ანგილია	\N	\N	\N
9	ანგოლა	\N	\N	\N
10	ანდორა	\N	\N	\N
11	ანტიგუა და ბარბუდა	\N	\N	\N
12	არაბეთის გ/ემირატები	\N	\N	\N
13	არგენტინა	\N	\N	\N
14	ახალი ზელანდია	\N	\N	\N
15	ახალი კალედონია	\N	\N	\N
16	ბანგლადეში	\N	\N	\N
17	ბარბადოსი	\N	\N	\N
18	ბაჰამის კუნძულები	\N	\N	\N
19	ბაჰრეინი	\N	\N	\N
20	ბელგია	\N	\N	\N
21	ბელიზი	\N	\N	\N
22	ბელორუსია	\N	\N	\N
23	ბენინი	\N	\N	\N
24	ბერმუდის კუნძულები	\N	\N	\N
25	ბოლივია	\N	\N	\N
26	ბოსნია-ჰერცოგოვინა	\N	\N	\N
27	ბოტსვანა	\N	\N	\N
28	ბრაზილია	\N	\N	\N
29	ბრუნეი	\N	\N	\N
30	ბულგარეთი	\N	\N	\N
31	ბურკინა ფასო	\N	\N	\N
32	ბურუნდი	\N	\N	\N
33	ბუტანი	\N	\N	\N
34	გაბონი	\N	\N	\N
35	გაიანა	\N	\N	\N
36	გამბია	\N	\N	\N
37	განა	\N	\N	\N
38	გერმანია	\N	\N	\N
39	გვადელუპე	\N	\N	\N
40	გვატემალა	\N	\N	\N
41	გვიანა	\N	\N	\N
42	გვინეა	\N	\N	\N
43	გვინეა-ბისაუ	\N	\N	\N
44	გიბრალტარი	\N	\N	\N
45	გრენადა	\N	\N	\N
46	გრენლანდია	\N	\N	\N
47	დანია	\N	\N	\N
48	დიდი ბრიტანეთი	\N	\N	\N
49	დომინიკა	\N	\N	\N
50	დომინიკის რესპუბლიკა	\N	\N	\N
51	ეგვიპტე	\N	\N	\N
52	ეთიოპია	\N	\N	\N
53	ეკვადორი	\N	\N	\N
54	ეკვატორიალური გვინეა	\N	\N	\N
55	ერაყი	\N	\N	\N
56	ერითრეა	\N	\N	\N
57	ესპანეთი	\N	\N	\N
58	ესტონეთი	\N	\N	\N
59	ვანუატუ	\N	\N	\N
60	ვატიკანი	\N	\N	\N
61	ვენესუელა	\N	\N	\N
62	ვიეტნამი	\N	\N	\N
63	ზამბია	\N	\N	\N
64	ზიმბაბვე	\N	\N	\N
65	თურქეთი	\N	\N	\N
66	თურქმენეთი	\N	\N	\N
67	იამაიკა	\N	\N	\N
68	იაპონია	\N	\N	\N
69	იემენი	\N	\N	\N
70	ინდოეთი	\N	\N	\N
71	ინდონეზია	\N	\N	\N
72	იორდანია	\N	\N	\N
73	ირანი	\N	\N	\N
74	ირლანდია	\N	\N	\N
75	ისლანდია	\N	\N	\N
76	ისრაელი	\N	\N	\N
77	იტალია	\N	\N	\N
78	კაბო-ვერდის კუნძულები	\N	\N	\N
79	კაიმანის კუნძულები	\N	\N	\N
80	კამბოჯა	\N	\N	\N
81	კამერუნი	\N	\N	\N
82	კამორის კუნძულები	\N	\N	\N
83	კანადა	\N	\N	\N
84	კატარი	\N	\N	\N
85	კენია	\N	\N	\N
86	კვიპროსი	\N	\N	\N
87	კირიბატი	\N	\N	\N
88	კოლუმბია	\N	\N	\N
89	კონგო	\N	\N	\N
90	კორეა	\N	\N	\N
91	კორეის სახ. რესპუბ.	\N	\N	\N
92	კოსტა-რიკა	\N	\N	\N
93	კოტ-დივუარი	\N	\N	\N
94	კუბა	\N	\N	\N
95	კუვეიტი	\N	\N	\N
96	ლაოსი	\N	\N	\N
97	ლატვია	\N	\N	\N
98	ლესოტო	\N	\N	\N
99	ლიბანი	\N	\N	\N
100	ლიბერია	\N	\N	\N
101	ლიბია	\N	\N	\N
102	ლიტვა	\N	\N	\N
103	ლიხტენშტეინი	\N	\N	\N
104	ლუქსემბურგი	\N	\N	\N
105	მადაგასკარი	\N	\N	\N
106	მავრიკია	\N	\N	\N
107	მავრიტანია	\N	\N	\N
108	მაკაო	\N	\N	\N
109	მაკედონია	\N	\N	\N
110	მალავი	\N	\N	\N
111	მალაიზია	\N	\N	\N
112	მალდივი	\N	\N	\N
113	მალი	\N	\N	\N
114	მალტა	\N	\N	\N
115	მაროკო	\N	\N	\N
116	მარტინიკა	\N	\N	\N
117	მექსიკა	\N	\N	\N
118	მიანმა	\N	\N	\N
119	მოზამბიკი	\N	\N	\N
120	მოლდოვა	\N	\N	\N
121	მონაკო	\N	\N	\N
122	მონსერატი	\N	\N	\N
123	მონღოლეთი	\N	\N	\N
124	ნამიბია	\N	\N	\N
125	ნაურუ	\N	\N	\N
126	ნეპალი	\N	\N	\N
127	ნიგერი	\N	\N	\N
128	ნიგერია	\N	\N	\N
129	ნიდერლანდები	\N	\N	\N
130	ნიკარაგუა	\N	\N	\N
131	ნორვეგია	\N	\N	\N
132	ომანი	\N	\N	\N
133	პაკისტანი	\N	\N	\N
134	პანამა	\N	\N	\N
135	პაპუა-ახალი გვინეა	\N	\N	\N
136	პარაგვაი	\N	\N	\N
137	პერუ	\N	\N	\N
138	პოლონეთი	\N	\N	\N
139	პორტუგალია	\N	\N	\N
140	რეუნიონი	\N	\N	\N
141	რუანდა	\N	\N	\N
142	რუმინეთი	\N	\N	\N
143	რუსეთი	\N	\N	\N
144	საბერძნეთი	\N	\N	\N
145	სალვადორი	\N	\N	\N
146	სამოა	\N	\N	\N
147	სამხრ. აფრიკის. რესპ.	\N	\N	\N
148	სან-მარინო	\N	\N	\N
149	სან-ტომე და პრინსიპი	\N	\N	\N
150	საუდის არაბეთი	\N	\N	\N
151	საფრანგეთი	\N	\N	\N
153	სეიშელი	\N	\N	\N
154	სენეგალი	\N	\N	\N
155	სენტ-ვინსენტი	\N	\N	\N
156	სენტ-კრისტოფი	\N	\N	\N
157	სენტ-ლუსია	\N	\N	\N
158	სერბია-ჩერნოგორია	\N	\N	\N
159	სვაზილენდი	\N	\N	\N
160	სიერა-ლეონე	\N	\N	\N
161	სინგაპური	\N	\N	\N
162	სირია	\N	\N	\N
163	სლოვაკეთი	\N	\N	\N
164	სლოვენია	\N	\N	\N
165	სოლომონის კუნძულები	\N	\N	\N
166	სომალი	\N	\N	\N
167	სომხეთი	\N	\N	\N
168	სუდანი	\N	\N	\N
169	სურინამი	\N	\N	\N
170	ტაილანდი	\N	\N	\N
171	ტანზანია	\N	\N	\N
172	ტაჯიკეთი	\N	\N	\N
173	ტიმორი	\N	\N	\N
174	ტოგო	\N	\N	\N
175	ტონგა	\N	\N	\N
176	ტრინიდადი და ტობაგო	\N	\N	\N
177	ტუნისი	\N	\N	\N
178	უგანდა	\N	\N	\N
179	უზბეკეთი	\N	\N	\N
180	უილისის კუნძულები	\N	\N	\N
181	უკრაინა	\N	\N	\N
182	უნგრეთი	\N	\N	\N
183	ურუგვაი	\N	\N	\N
184	ფილიპინები	\N	\N	\N
185	ფინეთი	\N	\N	\N
186	ფიჯი	\N	\N	\N
187	ყაზახეთი	\N	\N	\N
188	ყირგიზეთი	\N	\N	\N
189	შვედეთი	\N	\N	\N
190	შვეიცარია	\N	\N	\N
191	შრი-ლანკა	\N	\N	\N
192	ჩადი	\N	\N	\N
193	ჩეხეთი	\N	\N	\N
194	ჩილე	\N	\N	\N
195	ჩინეთი	\N	\N	\N
196	ცენტრ.აფრიკის.რესპუბ.	\N	\N	\N
197	წმინდა ელენეს კუნძული	\N	\N	\N
198	ხორვატია	\N	\N	\N
199	ჯიბუტი	\N	\N	\N
200	ჰაიტი	\N	\N	\N
201	ჰონდურასი	\N	\N	\N
202	ჰონკონგი	\N	\N	\N
152	საქართველო	\N	\N	\N
\.


--
-- Name: countryid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('countryid_seq', 202, true);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY currency (currencyid, name, code, basic, icon, countryid, fixedexrate) FROM stdin;
1	ლარი	GEL	t		152	t
2	US Dollar	USD	t	$	1	f
\.


--
-- Name: currencyid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('currencyid_seq', 2, true);


--
-- Data for Name: currencyrate; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY currencyrate (currencyrateid, currencyid, ratedate, value) FROM stdin;
2	2	2014-08-13	1.77000000000000002
3	2	2014-08-06	2
\.


--
-- Name: currencyrateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('currencyrateid_seq', 3, true);


--
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY discount (discountid, code, name, perctype, open, val, roomrate, extracharge, regbyid, regdate, active, deleted) FROM stdin;
1	Dis C	ფასდაკლების ბარათი	t	t	\N	t	t	1	2014-07-31 22:12:30.76196	t	f
2	Zeb	კლუბის წევრი	t	f	20	t	f	1	2014-08-14 19:49:01.654	t	f
\.


--
-- Name: discountid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('discountid_seq', 2, true);


--
-- Data for Name: displaysettings; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY displaysettings (displaysettingsid, timeformat, dateformat, arrdepformat, timezome, idtypeid, reservationtypeid, roundtype, salutationid, billto, paymentmode, paymentmethodid, webrate, webroominvmode, paymentgateway, regbyid, regdate, zip) FROM stdin;
8	1	0	0	444	2	2	2	4	0	0	1	0	0		1	2014-09-29 16:41:29.756	ინდექსი
\.


--
-- Name: displaysettingsid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('displaysettingsid_seq', 8, true);


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY district (districtid, cityid, name) FROM stdin;
\.


--
-- Name: districtid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('districtid_seq', 1, false);


--
-- Data for Name: extracharge; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY extracharge (extrachargeid, code, name, rate, fixedprice, ord, voucherno, web, webdescription, chargeapplieson, extrapostingtype, applychargealways, webord, regbyid, regdate, active, deleted) FROM stdin;
1	რესტორანი	რესტორანი	10	f	1	0	f	\N	\N	\N	\N	\N	1	2014-08-14 16:41:41.867	t	f
\.


--
-- Data for Name: extrachargefolio; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY extrachargefolio (folioitemid, extrachargeid, rate, postingtype, chargeapplyrieson, adult, child, qty) FROM stdin;
621	1	10	1	1	0	2	0
\.


--
-- Name: extrachargeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('extrachargeid_seq', 1, true);


--
-- Data for Name: extrachargetax; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY extrachargetax (extrachargeid, taxid) FROM stdin;
1	1
\.


--
-- Data for Name: folio; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY folio (folioid, num, guestid, contragentid, reservationroomid, status, regbyid, regdate) FROM stdin;
56	56	35	\N	75	0	1	2014-12-04 21:20:21.237069
57	57	36	\N	76	0	1	2014-12-09 15:05:24.378929
58	58	37	\N	77	0	1	2014-12-09 15:10:37.790006
\.


--
-- Name: folioid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('folioid_seq', 58, true);


--
-- Data for Name: folioitem; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY folioitem (folioitemid, folioid, roomid, itemdate, refno, particular, amount, extrachargeid, ordermainid, discountid, taxid, paymentid, zvoid, done, regbyid, regdate, note, manual, roomoper) FROM stdin;
604	56	\N	2014-10-23	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
605	56	\N	2014-10-23	\N	-1	18	\N	\N	\N	1	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
606	56	\N	2014-10-23	\N	0	0	\N	\N	\N	\N	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
607	56	\N	2014-10-24	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
608	56	\N	2014-10-24	\N	-1	18	\N	\N	\N	1	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
609	56	\N	2014-10-24	\N	0	0	\N	\N	\N	\N	\N	f	f	1	2014-12-04 21:20:21.237069		f	\N
610	56	\N	2014-10-23	\N	2	20	\N	\N	\N	\N	18	f	f	1	2014-12-04 23:44:18.8344		t	\N
611	56	\N	2014-10-23	\N	1	30	\N	\N	\N	\N	19	f	f	1	2014-12-05 00:10:10.160357		t	\N
612	57	10	2014-10-23	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
613	57	\N	2014-10-23	\N	-1	18	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
614	57	\N	2014-10-23	\N	0	0	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
615	57	10	2014-10-24	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
616	57	\N	2014-10-24	\N	-1	18	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
617	57	\N	2014-10-24	\N	0	0	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:05:24.378929		f	\N
618	58	21	2014-10-23	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
619	58	\N	2014-10-23	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
620	58	\N	2014-10-23	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
621	58	\N	2014-10-23	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
622	58	\N	2014-10-23	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
623	58	21	2014-10-24	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
624	58	\N	2014-10-24	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
625	58	\N	2014-10-24	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
626	58	\N	2014-10-24	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
627	58	\N	2014-10-24	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
628	58	21	2014-10-25	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
629	58	\N	2014-10-25	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
630	58	\N	2014-10-25	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
631	58	\N	2014-10-25	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
632	58	\N	2014-10-25	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
633	58	21	2014-10-26	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
634	58	\N	2014-10-26	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
635	58	\N	2014-10-26	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
636	58	\N	2014-10-26	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
637	58	\N	2014-10-26	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
638	58	21	2014-10-27	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
639	58	\N	2014-10-27	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
640	58	\N	2014-10-27	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
641	58	\N	2014-10-27	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
642	58	\N	2014-10-27	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
643	58	21	2014-10-28	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
644	58	\N	2014-10-28	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
645	58	\N	2014-10-28	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
646	58	\N	2014-10-28	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
647	58	\N	2014-10-28	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
648	58	21	2014-10-29	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
649	58	\N	2014-10-29	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
650	58	\N	2014-10-29	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
651	58	\N	2014-10-29	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
652	58	\N	2014-10-29	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
653	58	21	2014-10-30	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
654	58	\N	2014-10-30	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
655	58	\N	2014-10-30	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
656	58	\N	2014-10-30	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
657	58	\N	2014-10-30	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
658	58	21	2014-10-31	\N	6	100	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
659	58	\N	2014-10-31	\N	4	-20	\N	\N	2	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
660	58	\N	2014-10-31	\N	-1	14.4000000000000004	\N	\N	\N	1	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
661	58	\N	2014-10-31	\N	5	20	1	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
662	58	\N	2014-10-31	\N	0	-0.400000000000005684	\N	\N	\N	\N	\N	f	f	1	2014-12-09 15:10:37.790006		f	\N
663	57	\N	2014-10-23	\N	2	100	\N	\N	\N	\N	21	f	f	1	2014-12-09 17:15:10.644138		t	\N
\.


--
-- Name: folioitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('folioitemid_seq', 663, true);


--
-- Data for Name: guest; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY guest (guestid, salutationid, fname, lname, type, gender, address, countryid, city, zip, idtypeid, idn, vipstatusid, phone, mobile, fax, email, dob, sdob, weddingdate, nationalityid, contragentid, paymentmethodid, cardnum, regbyid, regdate, deleted) FROM stdin;
10	4	გიორგი	გიორგაძე	0	\N		1			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-08-23 16:58:41.149579	f
11	4	გიორგაძე	გიორგი	0	\N		1			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-11 13:50:57.880184	f
12	4	ბაბაიანცი	ელდარ	0	\N		167	ყვარელი		1	33123413	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-16 13:33:16.858016	f
13	4	სიკრეტი	ვიკტორია	0	\N		4			1	52345234	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-16 13:34:56.09775	f
14	4	უშანგი	გაბადაძე	0	\N		9			\N		\N					\N	\N	\N	\N	2	\N	\N	1	2014-09-16 13:50:46.167625	f
15	4	epremidze	giorgi	0	\N		2			1	32412341	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-24 11:53:31.968186	f
16	4	anjafaridze	keti	0	\N		2			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-24 11:57:08.406222	f
17	4	gulbani	zura	0	\N		2			\N	334123413	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-29 15:02:20.417954	f
18	4	bolo	es	0	\N		3			1	34134	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-29 16:52:22.74388	f
19	4	venaxi	vnaxot	0	\N		8			2	432412	\N					\N	\N	\N	\N	1	\N	\N	1	2014-09-29 17:41:50.318577	f
20	4	venaxi	axali	0	\N		6			\N		\N					\N	\N	\N	\N	1	\N	\N	1	2014-09-29 17:55:10.539561	f
21	4	1	venaxi	0	\N		4			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-29 18:10:06.938857	f
22	4	3	venaxi	0	\N		7			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-29 18:19:44.209193	f
23	4	4	venaxi	0	\N		10			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-09-29 18:20:47.908045	f
24	4	da	qeto	0	\N		4			1	3241234123	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-10-16 17:30:28.041368	f
25	4	bal	bla	0	\N		7			2	435243523	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-10-16 17:52:09.607856	f
26	4	gena	matrosovi	0	\N		4			1		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-10-25 16:51:57.139244	f
27	4	stumari1	axali	0	\N		47			\N		\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-17 18:48:26.225	f
28	4	rezervacia	axali	0	\N		2			1	31231231	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-26 19:17:24.579	f
29	4	res	daudasturebeli	0	\N		1			1	4231432141	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-26 19:23:05.653	f
30	4	erti	daudasturebeli	0	\N		1			1	3214123423	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-26 19:29:26.993	f
31	4	rfsd	rgdsfgsdfg	0	\N		5			1	32412341	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-26 19:30:44.126	f
32	4	asdasdasdasdasdasda	dasd	0	0	dasdasdasdaá¡áá®ááá  ááá¡ááás	6	dasda	12312	1	dasda	1	31231321	312312	eqweqw	aa@sdasda.ge	\N	\N	\N	1	\N	\N	\N	1	2014-11-26 19:45:51.856	f
33	4	dasdas	asd	0	0	dasdas	7	edas	123	1	31231	2					\N	\N	\N	1	\N	\N	\N	1	2014-11-26 19:47:58.405	f
34	4	vai	vai	0	\N		2			1	2312342314213	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-11-26 20:56:20.499	f
35	4	1	bla	0	\N		2			1	43124312	\N					\N	\N	\N	\N	\N	\N	\N	1	2014-12-04 21:20:21.237069	f
36	4	dads	dasd	0	0		7			1	64616	1					\N	\N	\N	1	\N	\N	\N	1	2014-12-09 15:05:24.378929	f
37	4	azer	azer	0	\N		5			1	626261	1					\N	\N	\N	\N	\N	\N	\N	1	2014-12-09 15:10:37.790006	f
\.


--
-- Name: guestid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('guestid_seq', 37, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY hotel (hotelid, name, address1, address2, countryid, city, zip, phone, rphone, fax, email, propertytype, logo, url, grade, idn, regno1, regno2, regno3, districtid) FROM stdin;
1	თბილისი ლაერტონი	ელიკო ქურხულის ქ. #14		152	თბილისი	0102	+99532	+99532		info@laerton-hotel.com	სასტუმრო		laerton-hotel.com	4	205267584				\N
\.


--
-- Name: hotelid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('hotelid_seq', 1, true);


--
-- Data for Name: housekeepingstatus; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY housekeepingstatus (housekeepingstatusid, name, color, regbyid, regdate, active, deleted) FROM stdin;
\.


--
-- Name: housekeepingstatusid_; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('housekeepingstatusid_', 1, false);


--
-- Data for Name: houseunit; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY houseunit (houseunitid, name, regbyid, regdate, active, deteted) FROM stdin;
\.


--
-- Name: houseunitid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('houseunitid_seq', 1, false);


--
-- Data for Name: idtype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY idtype (idtypeid, name, active, deleted) FROM stdin;
1	პასპორტი	t	f
2	პირადობის მოწმობა	t	f
\.


--
-- Name: idtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('idtypeid_seq', 2, true);


--
-- Data for Name: market; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY market (marketid, code, name, regbyid, regdate, active, deleted) FROM stdin;
\.


--
-- Name: marketid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('marketid_seq', 1, false);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY menu (menuid, name, file, parentid, ord) FROM stdin;
2	მენიუ	menu	1	2
4	ოთახები		\N	1
5	ტარიფები		\N	2
6	დალაგება		\N	3
7	პარამეტრები		\N	5
1	ადმინისტრირება		\N	4
8	ვები		\N	6
16	სეზონები	seasonview	5	2
19	დასალაგებელი ადგილები	units	6	1
20	სტატუსები	hstatus	6	2
21	მომხმარებლის ტიპები	personneltype	1	3
22	თანამშრომლები	personnel	1	4
23	მთავარი		1	5
24	ელფოსტის შაბლონები		1	6
25	უპირატესობები		1	7
26	მიზეზები	reazons	1	8
27	მარკეტინგი	marketing	1	9
28	სხვა	adminother	1	10
3	ფუნქციები	level	1	1
9	კეთილმოწყობები	amenityview	4	1
10	ოთახის ტიპები	roomtypeview	4	2
55	ეკრანის პარამეტრები	displaysettings	48	1
47	ზოგადი ინფორმაცია		7	1
48	მთავარი		7	2
13	სტატუსის ფერი	statuscolorview	4	5
51	სხვა	othersettings	7	5
17	ოთახის ფასები	roomrateview	5	3
34	ტრანსპორტის სახეობა	transportationmodeview	23	6
35	გასავლის ტიპები	payoutview	23	7
38	ელ-ფოსტის კატეგორიები	templatecategoryview	24	1
39	შაბლონები	templateview	24	2
45	ბიზნეს წყაროები	bsourceview	27	2
11	საწოლის ტიპები	bedtypeview	4	3
14	ოთახის მფლობელი	contragentview	4	6
12	ოთახები	roomview	4	4
15	ტარიფის ტიპი	ratetypeview	5	1
18	გადასახადები	taxview	5	4
29	ვალუტა	currencyview	23	1
30	გადახდის მეთოდები	paymentmethodview	23	2
31	დამატებითი სერვისები	extrachargeview	23	3
32	ფასდაკლება	discountview	23	4
33	საბუთის ტიპი	idtypeview	23	5
36	რეზერვაციის ტიპები	reservationtypeview	23	8
37	Vip სტატუსები	vipstatusview	23	9
44	სეგმენტები	marketview	27	1
52	სასტუმროს ინფორმაცია	hotelview	47	1
43	შაცი სიის მიზეზები	blacklistreasonview	26	2
46	არდადეგები	holidaysview	28	1
40	უპირატესობების ტიპები	preferencetypeview	25	1
54	დაბეგვრის პარამეტრები	taxaccountconfigview	47	3
41	უპირატესობები	preferenceview	25	2
58	ცხრილების ნუმერაცია	paiginationsettingsview	48	4
59	საბუთების ნუმერაცია	documentnumberingview	48	5
49	ფორმულა	formulaview	7	3
50	შენიშვნები	noticeview	7	4
60	თარგმანი	translationview	51	1
42	მიზეზები	reasonview	26	1
56	ბეჭდვის და ელ-ფოსტის პარამეტრები	checkinemailparams	48	2
53	ელ ფოსტა	params_mail	47	2
57	მიღების და რეზერვაციის პარამეტრები	checkinreservationsettings	48	3
\.


--
-- Name: menuid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('menuid_seq', 60, true);


--
-- Data for Name: nationality; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY nationality (nationalityid, name) FROM stdin;
1	სომეხი
\.


--
-- Name: nationalityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('nationalityid_seq', 1, true);


--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY payment (paymentid, paymentmethodid, currencyid, amount, paydate, folioid, voucherno, note, deleted, regbyid, regdate) FROM stdin;
17	1	1	11.8000000000000007	2014-12-04	56		\N	f	1	2014-12-04 21:20:21.237069
18	1	1	20	2014-10-23	56		\N	f	1	2014-12-04 23:44:18.8344
19	3	1	30	2014-10-23	56		\N	f	1	2014-12-05 00:10:10.160357
20	1	1	100	2014-12-09	58		\N	f	1	2014-12-09 15:10:37.790006
21	1	1	100	2014-10-23	57		\N	f	1	2014-12-09 17:15:10.644138
\.


--
-- Name: paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('paymentid_seq', 21, true);


--
-- Data for Name: paymentmethod; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY paymentmethod (paymentmethodid, name, code, paymentmode, cardprocessing, receiptno, extrachargeid, amount, perc, regbyid, regdate, active, deleted) FROM stdin;
1	Cash	Cash	0	f	0	\N	\N	\N	1	2014-08-14 14:07:34.243	t	f
3	tbc ბანკი	tbc	1	t	1	1	\N	3	1	2014-10-23 16:54:56.382	t	f
\.


--
-- Name: paymentmethodid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('paymentmethodid_seq', 3, true);


--
-- Data for Name: payout; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY payout (payoutid, name, regbyid, regdate, active, deteted) FROM stdin;
1	აგენტის საკომისიო	1	2014-08-14 16:36:47.53	t	f
\.


--
-- Name: payoutid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('payoutid_seq', 1, true);


--
-- Name: personellid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personellid_seq', 2, true);


--
-- Name: personelltypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personelltypeid_seq', 4, true);


--
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY personnel (personnelid, fname, lname, phone, personneltypeid, loginid, password, email, address, regdate, deleted, changebyid, changedate) FROM stdin;
1	ადმინისტრატორი	სისტემის	\N	1	admin	123	\N	\N	2012-06-04 09:34:04.846837	f	\N	2013-08-26 16:23:53.573921
\.


--
-- Data for Name: personneltype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY personneltype (personneltypeid, name, description, code, deleted) FROM stdin;
1	მთავარი ადმინისტრატორი		00	f
2	დამლაგებელი		01	f
3	მენეჯერი		02	f
4	ადმინისტრატორი		01	f
\.


--
-- Name: personneltypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personneltypeid_seq', 1, true);


--
-- Data for Name: plevel; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY plevel (plevelid, personneltypeid, menuid, read, write) FROM stdin;
2	1	3	t	t
3	1	9	t	t
4	1	10	t	t
5	1	11	t	t
6	1	12	t	t
7	1	13	t	t
8	1	15	t	t
9	1	14	t	t
10	1	16	t	t
11	1	17	t	t
12	1	18	t	t
13	1	19	t	t
14	1	20	t	t
15	1	21	t	t
16	1	22	t	t
17	1	23	t	t
18	1	24	t	t
19	1	25	t	t
20	1	26	t	t
21	1	27	t	t
22	1	31	t	t
23	1	30	t	t
24	1	29	t	t
25	1	28	t	t
26	1	32	t	t
27	1	33	t	t
28	1	34	t	t
29	1	35	t	t
30	1	36	t	t
31	1	37	t	t
32	1	38	t	t
33	1	39	t	t
34	1	40	t	t
35	1	41	t	t
36	1	42	t	t
37	1	43	t	t
38	1	44	t	t
39	1	45	t	t
40	1	46	t	t
41	1	47	t	t
42	1	48	t	t
43	1	49	t	t
44	1	50	t	t
45	1	51	t	t
46	1	54	t	t
47	1	52	t	t
48	1	53	t	t
49	1	55	t	t
50	1	56	t	t
51	1	57	t	t
52	1	58	t	t
53	1	59	t	t
54	1	60	t	t
56	1	2	t	t
75	4	2	t	t
76	4	21	t	t
80	4	13	t	t
\.


--
-- Name: plevelid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('plevelid_seq', 80, true);


--
-- Data for Name: preference; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY preference (preferenceid, name, preferencetypeid, regbyid, regdate, active, deleted) FROM stdin;
1	ხედი ოკიანეზე	2	1	2014-08-14 19:57:15.054	t	f
2	აივანი	2	1	2014-08-14 19:57:30.074	t	f
\.


--
-- Name: preferenceid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('preferenceid_seq', 2, true);


--
-- Data for Name: preferencetype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY preferencetype (preferencetypeid, name, regbyid, regdate, active, deteted) FROM stdin;
1	სასტუმროს უპირატესობები	1	2014-08-14 19:54:43.941	t	f
2	ოთახის უპირატესობები	1	2014-08-14 19:55:06.709	t	f
\.


--
-- Name: preferencetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('preferencetypeid_seq', 3, true);


--
-- Data for Name: ratetype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY ratetype (ratetypeid, code, name, regbyid, regdate, active, ord, deleted) FROM stdin;
4	Quadruple	ოთხადგილიანი	1	2014-09-01 17:47:24.72	t	4	f
3	Triple	სამადგილიანი ტარიფი	1	2014-09-01 17:47:32.583	t	3	f
1	Sng.Ocp	ერთადგილიანი	1	2014-09-01 17:47:44.265	t	1	f
2	Db.Ocp	ორადგილიანი ტარიფი	1	2014-09-01 17:47:50.586	t	2	f
\.


--
-- Name: ratetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('ratetypeid_seq', 4, true);


--
-- Data for Name: ratetyperoomtype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY ratetyperoomtype (ratetypeid, roomtypeid) FROM stdin;
1	1
2	2
2	3
2	4
1	4
1	3
1	2
1	6
4	5
1	5
2	5
3	5
3	6
3	2
4	1
\.


--
-- Data for Name: reason; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY reason (reasonid, name, reasoncategory, regbyid, regdate, active, deleted) FROM stdin;
\.


--
-- Name: reasonid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reasonid_seq', 1, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY region (regionid, countryid, name, code) FROM stdin;
\.


--
-- Name: regionid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('regionid_seq', 1, false);


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY reservation (reservationid, arraivaldate, departuredate, reservationtypeid, ratetype, manualrate, contractcontragentid, billto, taxexemptionreason, paymentmode, paymentmethodid, paymentcontragentid, advancepaymentdate, advancepaymentamount, companyid, marketid, bsourceid, taid, commissionplan, commissionvalue, voucher, discountid, postingtype, regbyid, regdate, postingvalueevery, num, nomanualtax, notax, discountnights, status) FROM stdin;
102	2014-10-23 00:00:00	2014-10-24 11:11:00	1	0	\N	\N	2		0	1	\N	2014-10-23	10	0	\N	\N	\N	\N	\N		\N	\N	1	2014-12-04 21:20:21.237069	\N	1	f	f	\N	0
103	2014-10-23 00:00:00	2014-10-24 11:11:00	1	0	\N	\N	2		0	1	\N	2014-10-24	20	0	\N	\N	\N	\N	\N		\N	\N	1	2014-12-09 15:05:24.378929	\N	1	f	f	\N	-1
104	2014-10-23 00:00:00	2014-10-31 11:11:00	1	0	\N	\N	2		0	1	\N	\N	\N	1	\N	\N	34	2	123		2	1	1	2014-12-09 15:10:37.790006	20	1	f	f	\N	-1
\.


--
-- Name: reservationid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationid_seq', 104, true);


--
-- Data for Name: reservationreason; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY reservationreason (reservationid, reasonid) FROM stdin;
\.


--
-- Data for Name: reservationroom; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY reservationroom (reservationroomid, reservationid, roomid, leader, adult, child, ratetypeid, guestid, regbyid, regdate, roomtypeid) FROM stdin;
75	102	\N	t	1	1	1	35	1	2014-12-04 21:20:21.237069	1
76	103	10	t	1	1	1	36	1	2014-12-09 15:05:24.378929	1
77	104	21	t	1	1	1	37	1	2014-12-09 15:10:37.790006	1
\.


--
-- Name: reservationroomid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationroomid_seq', 77, true);


--
-- Data for Name: reservationtype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY reservationtype (reservationtypeid, name, confirmed, color, regbyid, regdate, active) FROM stdin;
3	ჯავშნის მოთხოვნა	f	\N	1	2014-08-14 16:56:00.634	t
1	დადასტურებული რეზერვაცია	t	#34c0c7	1	2014-08-02 16:47:12.94876	t
2	დაუდასტურებელი რეზერვაცია	f	#c72020	1	2014-08-14 20:05:40.024	t
\.


--
-- Name: reservationtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationtypeid_seq', 3, true);


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY room (roomid, code, name, roomtypeid, bedtypeid, phoneext, keycard, ord, nonsmoke, regbyid, regdate, active, deleted) FROM stdin;
1	202	202	1	1	202	123	1	t	1	2014-08-20 17:07:44.18	t	f
2	203	203	1	2	203	123	2	t	1	2014-08-20 17:08:21.989	t	f
3	204	204	1	3	204	123	3	t	1	2014-08-20 17:08:44.885	t	f
5	301	301	3	3	301	123	1	t	1	2014-08-20 17:09:17.572	t	f
6	302	302	1	6	302	123	2	t	1	2014-08-20 17:09:54.253	t	f
7	303	303	1	6	303	123	3	t	1	2014-08-20 17:10:16.03	t	f
8	304	304	4	6	304	123	1	t	1	2014-08-20 17:11:21.777	t	f
9	305	305	1	6	305	123	6	t	1	2014-08-20 17:12:16.265	t	f
10	306	306	1	6	306	123	7	t	1	2014-08-20 17:12:38.863	t	f
11	307	307	1	6	307	123	8	t	1	2014-08-20 17:13:07.845	t	f
12	308	308	1	6	308	123	9	t	1	2014-08-20 17:13:50.766	t	f
13	309	309	1	6	309	123	10	t	1	2014-08-20 17:14:28.879	t	f
14	310	310	2	6	310	123	1	t	1	2014-08-20 17:15:06.019	t	f
15	401	401	5	6	401	123	1	t	1	2014-08-20 17:16:56.95	t	f
16	402	402	1	6	402	123	11	t	1	2014-08-20 17:17:46.013	t	f
17	403	403	1	6	403	123	12	t	1	2014-08-20 17:18:17.013	t	f
18	404	404	4	6	404	123	2	t	1	2014-08-20 17:18:51.178	t	f
19	405	405	1	6	405	123	13	t	1	2014-08-20 17:19:21.739	t	f
20	406	406	1	6	406	123	14	t	1	2014-08-20 17:19:48.602	t	f
21	407	407	1	6	407	123	15	t	1	2014-08-20 17:20:12.493	t	f
22	408	408	1	6	408	123	16	t	1	2014-08-20 17:20:36.035	t	f
23	409	409	1	6	409	123	17	t	1	2014-08-20 17:21:01.741	t	f
24	410	410	2	6	410	123	2	t	1	2014-08-20 17:21:43.273	t	f
25	501	501	1	6	501	123	18	t	1	2014-08-20 17:22:16.22	t	f
26	502	502	4	1	502	123	3	t	1	2014-08-20 17:23:19.425	t	f
27	503	503	4	6	503	123	4	t	1	2014-08-20 17:23:46.495	t	f
28	504	504	4	6	504	123	5	t	1	2014-08-20 17:25:05.848	t	f
29	505	505	6	6	505	123	1	t	1	2014-08-20 17:25:47.007	t	f
30	506	506	4	6	506	123	6	t	1	2014-08-20 17:26:24.987	t	f
31	507	507	4	6	507	123	7	t	1	2014-08-20 17:26:52.831	t	f
32	508	508	4	6	508	123	8	t	1	2014-08-20 17:27:20.817	t	f
33	509	509	1	6	509	123	21	t	1	2014-08-20 17:28:07.044	t	f
34	601	601	1	6	601	123	22	t	1	2014-08-20 17:28:44.484	t	f
35	602	602	1	6	602	123	23	t	1	2014-08-20 17:29:16.123	t	f
\.


--
-- Name: roomid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomid_seq', 35, true);


--
-- Data for Name: roomimage; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomimage (roomimageid, roomid, path, regbyid, regdate, active) FROM stdin;
2	2	gallery/1407578981669_1__family-hotel-room-hotel-rooms-arrowwood-resort-hotel-in1200-x-817-924-kb-jpeg-x.jpg	1	2014-08-09 14:09:41.775519	t
3	1	gallery/1407579023581_1__family-hotel-room-hotel-rooms-arrowwood-resort-hotel-in1200-x-817-924-kb-jpeg-x.jpg	1	2014-08-09 14:10:23.666848	t
\.


--
-- Name: roomimageid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomimageid_seq', 3, true);


--
-- Data for Name: roomownerroom; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomownerroom (roomownerid, roomid) FROM stdin;
1	1
1	2
1	3
\.


--
-- Data for Name: roomrate; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomrate (roomrateid, roomtypeid, seasonid, contragentid, tax, rate, rateadult, ratechild, ratetypeid, ord) FROM stdin;
1	1	1	1	t	20	20	20	2	0
2	1	1	2	f	100	30	15	1	0
3	1	1	2	f	120	0	0	2	0
4	1	1	2	f	120	0	0	2	0
6	2	0	0	t	0	0	0	1	0
7	2	0	0	t	0	0	0	2	0
8	3	0	0	t	0	0	0	2	0
9	3	0	0	t	0	0	0	1	0
10	4	0	0	t	0	0	0	1	0
11	4	0	0	t	0	0	0	2	0
15	1	0	0	t	100	0	0	2	0
16	1	0	0	f	50	0	5	4	0
19	1	1	0	t	60	30	15	1	0
22	5	0	0	t	120	0	0	1	0
23	5	1	0	t	50	0	0	1	0
24	5	2	0	f	20	0	0	1	0
25	5	2	0	f	15	0	0	4	0
26	5	0	0	f	25	0	0	4	0
27	5	1	0	f	5	0	0	4	0
28	5	0	0	f	25	0	0	2	0
30	5	1	2	f	35	0	0	1	0
31	5	2	2	f	25	0	0	1	0
34	5	0	2	f	23	0	0	1	0
44	1	0	0	f	100	0	0	1	0
52	1	2	0	f	40	10	5	1	0
53	1	1	1	t	67	14	6	1	0
54	1	0	1	t	100	15	7	1	0
55	1	2	1	f	35	10	5	1	0
56	5	1	1	t	120	10	15	1	0
\.


--
-- Name: roomrateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomrateid_seq', 56, true);


--
-- Data for Name: roomst; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomst (roomstsid, roomid, statusdate, st, regbyid, regdate) FROM stdin;
1	21	2014-09-13 16:31:00	1	1	2014-09-13 16:32:31.797442
2	2	2014-09-16 13:31:00	1	1	2014-09-16 13:33:16.858016
3	6	2014-09-16 13:34:00	1	1	2014-09-16 13:34:56.09775
4	15	2014-09-19 12:02:00	0	1	2014-09-16 13:50:46.167625
5	2	2014-09-24 11:52:00	1	1	2014-09-24 11:53:31.968186
6	6	2014-09-24 11:55:00	1	1	2014-09-24 11:57:08.406222
13	1	2014-09-24 12:00:00	1	1	2014-09-24 12:19:57.808669
14	10	2014-09-29 14:55:00	1	1	2014-09-29 15:02:20.417954
15	10	2014-09-29 16:34:00	1	1	2014-09-29 16:52:22.74388
16	33	2014-09-29 17:36:00	1	1	2014-09-29 17:41:50.318577
17	12	2014-09-29 17:49:00	1	1	2014-09-29 17:55:10.539561
18	7	2014-09-29 18:05:00	1	1	2014-09-29 18:10:06.938857
19	6	2014-09-29 18:18:00	1	1	2014-09-29 18:19:44.209193
20	6	2014-09-29 18:20:00	1	1	2014-09-29 18:20:47.908045
21	11	2014-10-18 12:02:00	0	1	2014-10-16 17:30:28.041368
22	33	2014-10-19 12:02:00	0	1	2014-10-16 17:52:09.607856
36	21	2014-10-21 17:54:00	1	1	2014-10-21 17:55:35.400575
37	20	2014-10-21 18:12:00	1	1	2014-10-21 18:13:02.80607
38	34	2014-10-21 19:43:00	1	1	2014-10-21 19:44:40.825195
39	33	2014-10-21 19:45:00	1	1	2014-10-21 19:46:09.106369
40	35	2014-10-23 15:05:00	1	1	2014-10-23 15:06:33.733128
41	5	2014-10-23 15:08:00	1	1	2014-10-23 15:13:21.606684
43	1	2014-10-23 15:24:00	1	1	2014-10-23 15:25:00.518917
48	7	2014-10-23 17:01:00	1	1	2014-10-23 17:04:05.226138
49	6	2014-10-28 12:02:00	0	1	2014-10-25 16:51:57.139244
50	15	2014-10-23 00:00:00	0	1	2014-11-26 19:17:24.579
51	18	2014-10-23 00:00:00	7	1	2014-11-26 19:45:51.856
52	3	2014-10-23 00:00:00	7	1	2014-11-26 19:47:58.405
53	10	2014-10-23 00:00:00	1	1	2014-12-09 15:05:24.378929
54	21	2014-10-23 00:00:00	1	1	2014-12-09 15:10:37.790006
\.


--
-- Name: roomstid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomstid_seq', 54, true);


--
-- Data for Name: roomtype; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomtype (roomtypeid, code, name, badult, bchild, madult, mchild, web, color, webinventory, regbyid, regdate, active, ord, deleted) FROM stdin;
4	JKR	Junior King Room	1	0	2	2	f	12	1	1	2014-08-20 16:53:59.328	t	1	f
2	KSR	King Superior Room	1	0	4	4	t	#bbb	0	1	2014-08-20 16:54:39.177	t	2	f
5	DXR	Deluxe Room	1	0	6	6	t	23	1	1	2014-08-20 16:55:59.772	t	3	f
6	TKR	Terrace King Room	1	0	3	3	t	45	1	1	2014-08-20 16:56:59.832	t	23	f
1	KNR	King Room	1	0	3	3	t	#fff	0	1	2014-08-20 17:15:47.131	t	1	f
3	KGS	King Suite	1	0	6	6	t	#fafafa	0	1	2014-08-20 17:16:06.576	t	3	f
\.


--
-- Data for Name: roomtypeamenity; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY roomtypeamenity (roomtypeid, amenityid) FROM stdin;
1	2
4	1
4	3
2	3
\.


--
-- Name: roomtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomtypeid_seq', 6, true);


--
-- Data for Name: salutation; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY salutation (salutationid, name) FROM stdin;
1	Mr.
3	Mam.
2	Mrs.
4	Dr.
5	Ms.
6	Jn.
7	Sir.
\.


--
-- Name: salutationid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('salutationid_seq', 7, true);


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY season (seasonid, code, name, fday, tday, fmonth, tmonth, startdate, enddate, regbyid, regdate, active, deleted) FROM stdin;
0	NONE	NONE	0	0	0	0	2010-01-01	2030-01-01	1	2014-08-13 17:54:02.305994	t	f
2	Nად	ნადირობა	30	2	8	9	2014-09-15	2017-09-15	1	2014-09-29 14:12:20.135	t	f
1	სექ	სექტემბრობა	5	7	9	9	2014-09-17	2017-08-19	1	2014-10-16 17:28:22.96	t	f
\.


--
-- Name: seasonid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('seasonid_seq', 2, true);


--
-- Data for Name: stcolor; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY stcolor (stcolorid, roomstatus, color, regbyid, regdate, active, deleted) FROM stdin;
1	0	#19bf3d	1	2014-08-09 16:54:36.884	t	f
7	6	#fcda00	1	2014-08-09 16:55:13.531	t	f
3	2	#f25f48	1	2014-08-09 16:54:29.267	t	f
4	3	#a8814d	1	2014-08-09 16:54:45.677	t	f
5	4	#4381c4	1	2014-08-09 16:54:59.94	t	f
6	5	#715dab	1	2014-08-09 16:55:07.409	t	f
2	1	#ff0000	1	2014-08-09 16:54:33.809	t	f
\.


--
-- Name: stcolorid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('stcolorid_seq', 7, true);


--
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY tax (taxid, name, code, startfrom, exemptafter, postingtype, amount, applybefore, applyonrate, regbyid, regdate, active, deleted) FROM stdin;
1	დღგ	Vat	2004-01-01	0	0	18	t	f	1	2014-09-29 16:46:01.609	t	f
\.


--
-- Data for Name: taxaccount; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY taxaccount (taxaccount, account, payoutid, taxid, tax) FROM stdin;
\.


--
-- Name: taxid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('taxid_seq', 5, true);


--
-- Data for Name: taxsequence; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY taxsequence (taxid, afterid) FROM stdin;
\.


--
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY template (templateid, name, templatecategoryid, subject, personnelid, cc, bcc, content, regbyid, regdate, active, deleted) FROM stdin;
\.


--
-- Data for Name: templatecategory; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY templatecategory (templatecategoryid, name, regbyid, regdate, active, deteted) FROM stdin;
1	მიმოხილვის დამატება	1	2014-08-14 17:02:07.621	t	f
2	მადლობის წერილი გაწერისას	1	2014-08-14 17:02:14.935	t	f
3	მადლობის წერილი მიმოხილვის დამატებისას	1	2014-08-14 17:02:33.725	t	f
5	წერილი გაუქმებული რეზერვაციისას	1	2014-08-14 17:03:43.077	t	f
4	წერილი შემდგარი რეზერვაციისათვის	1	2014-08-14 17:04:29.166	t	f
\.


--
-- Name: templatecategoryid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('templatecategoryid_seq', 5, true);


--
-- Name: templateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('templateid_seq', 1, false);


--
-- Data for Name: transportationmode; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY transportationmode (transportationmodeid, name, regbyid, active, deteted, regdate) FROM stdin;
1	თვითმფრინავი	1	t	f	2014-08-14 16:32:16.254
2	მატარებელი	1	t	f	2014-08-14 16:32:24.356
\.


--
-- Name: transportationmodeid_sec; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('transportationmodeid_sec', 1, false);


--
-- Name: transportationmodeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('transportationmodeid_seq', 2, true);


--
-- Data for Name: vipstatus; Type: TABLE DATA; Schema: public; Owner: hms
--

COPY vipstatus (vipstatusid, name, active, deleted) FROM stdin;
1	ნუგზარის ბიძაშვილები	t	f
2	ფუდბალისტები	t	f
\.


--
-- Name: vipstatusid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('vipstatusid_seq', 2, true);


--
-- Name: amenity_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY amenity
    ADD CONSTRAINT amenity_pkey PRIMARY KEY (amenityid);


--
-- Name: bedtype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY bedtype
    ADD CONSTRAINT bedtype_pkey PRIMARY KEY (bedtypeid);


--
-- Name: bsource_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY bsource
    ADD CONSTRAINT bsource_pkey PRIMARY KEY (bsourceid);


--
-- Name: checkinreservationsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY checkinreservationsettings
    ADD CONSTRAINT checkinreservationsettings_pkey PRIMARY KEY (checkinreservationsettingsid);


--
-- Name: city_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_pkey PRIMARY KEY (cityid);


--
-- Name: closedate_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY closedate
    ADD CONSTRAINT closedate_pkey PRIMARY KEY (closedateid);


--
-- Name: confmail_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY confmail
    ADD CONSTRAINT confmail_pkey PRIMARY KEY (confmailid);


--
-- Name: connectedroom_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY connectedroom
    ADD CONSTRAINT connectedroom_pkey PRIMARY KEY (roomid, connectedid);


--
-- Name: contragent_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY contragent
    ADD CONSTRAINT contragent_pkey PRIMARY KEY (contragentid);


--
-- Name: country_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY country
    ADD CONSTRAINT country_pkey PRIMARY KEY (countryid);


--
-- Name: currency_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_pkey PRIMARY KEY (currencyid);


--
-- Name: currencyrate_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY currencyrate
    ADD CONSTRAINT currencyrate_pkey PRIMARY KEY (currencyrateid);


--
-- Name: discount_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY discount
    ADD CONSTRAINT discount_pkey PRIMARY KEY (discountid);


--
-- Name: displaysettings_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_pkey PRIMARY KEY (displaysettingsid);


--
-- Name: district_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_pkey PRIMARY KEY (districtid);


--
-- Name: extracharge_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY extracharge
    ADD CONSTRAINT extracharge_pkey PRIMARY KEY (extrachargeid);


--
-- Name: extrachargefolio_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY extrachargefolio
    ADD CONSTRAINT extrachargefolio_pkey PRIMARY KEY (folioitemid, extrachargeid);


--
-- Name: extrachargetax_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY extrachargetax
    ADD CONSTRAINT extrachargetax_pkey PRIMARY KEY (extrachargeid, taxid);


--
-- Name: folio_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY folio
    ADD CONSTRAINT folio_pkey PRIMARY KEY (folioid);


--
-- Name: folioitem_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_pkey PRIMARY KEY (folioitemid);


--
-- Name: guest_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_pkey PRIMARY KEY (guestid);


--
-- Name: hotel_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_pkey PRIMARY KEY (hotelid);


--
-- Name: housekeepingstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY housekeepingstatus
    ADD CONSTRAINT housekeepingstatus_pkey PRIMARY KEY (housekeepingstatusid);


--
-- Name: houseunit_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY houseunit
    ADD CONSTRAINT houseunit_pkey PRIMARY KEY (houseunitid);


--
-- Name: idtype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY idtype
    ADD CONSTRAINT idtype_pkey PRIMARY KEY (idtypeid);


--
-- Name: market_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY market
    ADD CONSTRAINT market_pkey PRIMARY KEY (marketid);


--
-- Name: menu_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_pkey PRIMARY KEY (menuid);


--
-- Name: nationality_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY nationality
    ADD CONSTRAINT nationality_pkey PRIMARY KEY (nationalityid);


--
-- Name: payment_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_pkey PRIMARY KEY (paymentid);


--
-- Name: paymentmethod_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY paymentmethod
    ADD CONSTRAINT paymentmethod_pkey PRIMARY KEY (paymentmethodid);


--
-- Name: payout_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY payout
    ADD CONSTRAINT payout_pkey PRIMARY KEY (payoutid);


--
-- Name: personnel_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY personnel
    ADD CONSTRAINT personnel_pkey PRIMARY KEY (personnelid);


--
-- Name: personneltype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY personneltype
    ADD CONSTRAINT personneltype_pkey PRIMARY KEY (personneltypeid);


--
-- Name: plevel_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY plevel
    ADD CONSTRAINT plevel_pkey PRIMARY KEY (plevelid);


--
-- Name: preference_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_pkey PRIMARY KEY (preferenceid);


--
-- Name: preferencetype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY preferencetype
    ADD CONSTRAINT preferencetype_pkey PRIMARY KEY (preferencetypeid);


--
-- Name: ratetype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY ratetype
    ADD CONSTRAINT ratetype_pkey PRIMARY KEY (ratetypeid);


--
-- Name: ratetyperoomtype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY ratetyperoomtype
    ADD CONSTRAINT ratetyperoomtype_pkey PRIMARY KEY (ratetypeid, roomtypeid);


--
-- Name: reason_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY reason
    ADD CONSTRAINT reason_pkey PRIMARY KEY (reasonid);


--
-- Name: region_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_pkey PRIMARY KEY (regionid);


--
-- Name: reservation_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_pkey PRIMARY KEY (reservationid);


--
-- Name: reservationreason_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY reservationreason
    ADD CONSTRAINT reservationreason_pkey PRIMARY KEY (reservationid, reasonid);


--
-- Name: reservationroom_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_pkey PRIMARY KEY (reservationroomid);


--
-- Name: reservationtype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY reservationtype
    ADD CONSTRAINT reservationtype_pkey PRIMARY KEY (reservationtypeid);


--
-- Name: room_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_pkey PRIMARY KEY (roomid);


--
-- Name: roomimage_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomimage
    ADD CONSTRAINT roomimage_pkey PRIMARY KEY (roomimageid);


--
-- Name: roomownerroom_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomownerroom
    ADD CONSTRAINT roomownerroom_pkey PRIMARY KEY (roomownerid, roomid);


--
-- Name: roomrate_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomrate
    ADD CONSTRAINT roomrate_pkey PRIMARY KEY (roomrateid);


--
-- Name: roomstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomst
    ADD CONSTRAINT roomstatus_pkey PRIMARY KEY (roomstsid);


--
-- Name: roomtype_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomtype
    ADD CONSTRAINT roomtype_pkey PRIMARY KEY (roomtypeid);


--
-- Name: roomtypeamenity_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY roomtypeamenity
    ADD CONSTRAINT roomtypeamenity_pkey PRIMARY KEY (roomtypeid, amenityid);


--
-- Name: salutation_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY salutation
    ADD CONSTRAINT salutation_pkey PRIMARY KEY (salutationid);


--
-- Name: season_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season_pkey PRIMARY KEY (seasonid);


--
-- Name: statuscolor_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY stcolor
    ADD CONSTRAINT statuscolor_pkey PRIMARY KEY (stcolorid);


--
-- Name: tax_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY tax
    ADD CONSTRAINT tax_pkey PRIMARY KEY (taxid);


--
-- Name: taxsequence_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY taxsequence
    ADD CONSTRAINT taxsequence_pkey PRIMARY KEY (taxid, afterid);


--
-- Name: template_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY template
    ADD CONSTRAINT template_pkey PRIMARY KEY (templateid);


--
-- Name: templatecategory_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY templatecategory
    ADD CONSTRAINT templatecategory_pkey PRIMARY KEY (templatecategoryid);


--
-- Name: transportationmode_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY transportationmode
    ADD CONSTRAINT transportationmode_pkey PRIMARY KEY (transportationmodeid);


--
-- Name: vipstatus_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace: 
--

ALTER TABLE ONLY vipstatus
    ADD CONSTRAINT vipstatus_pkey PRIMARY KEY (vipstatusid);


--
-- Name: amenity_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX amenity_name_idx ON amenity USING btree (name);


--
-- Name: amenity_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX amenity_regbyid_idx ON amenity USING btree (regbyid);


--
-- Name: bedtype_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX bedtype_code_idx ON bedtype USING btree (code);


--
-- Name: bedtype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX bedtype_name_idx ON bedtype USING btree (name);


--
-- Name: bedtype_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX bedtype_regbyid_idx ON bedtype USING btree (regbyid);


--
-- Name: bsource_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX bsource_code_idx ON bsource USING btree (code);


--
-- Name: bsource_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX bsource_name_idx ON bsource USING btree (name);


--
-- Name: bsource_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX bsource_regbyid_idx ON bsource USING btree (regbyid);


--
-- Name: checkinreservationsettings_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX checkinreservationsettings_regbyid_idx ON checkinreservationsettings USING btree (regbyid);


--
-- Name: city_regionid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX city_regionid_idx ON city USING btree (regionid);


--
-- Name: contragent_countryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX contragent_countryid_idx ON contragent USING btree (countryid);


--
-- Name: contragent_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX contragent_regbyid_idx ON contragent USING btree (regbyid);


--
-- Name: contragent_salutationid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX contragent_salutationid_idx ON contragent USING btree (salutationid);


--
-- Name: country_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX country_code_idx ON country USING btree (code);


--
-- Name: country_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX country_name_idx ON country USING btree (name);


--
-- Name: currency_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX currency_code_idx ON currency USING btree (code);


--
-- Name: currency_countryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX currency_countryid_idx ON currency USING btree (countryid);


--
-- Name: currency_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX currency_name_idx ON currency USING btree (name);


--
-- Name: currencyrate_currencyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX currencyrate_currencyid_idx ON currencyrate USING btree (currencyid);


--
-- Name: discount_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX discount_code_idx ON discount USING btree (code);


--
-- Name: discount_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX discount_name_idx ON discount USING btree (name);


--
-- Name: discount_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX discount_regbyid_idx ON discount USING btree (regbyid);


--
-- Name: district_city_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX district_city_idx ON district USING btree (cityid);


--
-- Name: extracharge_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX extracharge_regbyid_idx ON extracharge USING btree (regbyid);


--
-- Name: extrracharge_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX extrracharge_code_idx ON extracharge USING btree (code);


--
-- Name: extrracharge_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX extrracharge_name_idx ON extracharge USING btree (name);


--
-- Name: folio_contragentid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folio_contragentid_idx ON folio USING btree (contragentid);


--
-- Name: folio_guestid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folio_guestid_idx ON folio USING btree (guestid);


--
-- Name: folio_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folio_regbyid_idx ON folio USING btree (regbyid);


--
-- Name: folioitem_discountid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_discountid_idx ON folioitem USING btree (discountid);


--
-- Name: folioitem_extrachagreid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_extrachagreid_idx ON folioitem USING btree (extrachargeid);


--
-- Name: folioitem_folioid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_folioid_idx ON folioitem USING btree (folioid);


--
-- Name: folioitem_otrdermainid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_otrdermainid_idx ON folioitem USING btree (ordermainid);


--
-- Name: folioitem_paymentid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_paymentid_idx ON folioitem USING btree (paymentid);


--
-- Name: folioitem_regbyif_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_regbyif_idx ON folioitem USING btree (regbyid);


--
-- Name: folioitem_roomid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_roomid_idx ON folioitem USING btree (roomid);


--
-- Name: folioitem_taxid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX folioitem_taxid_idx ON folioitem USING btree (taxid);


--
-- Name: guest_countryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_countryid_idx ON guest USING btree (countryid);


--
-- Name: guest_idtypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_idtypeid_idx ON guest USING btree (idtypeid);


--
-- Name: guest_nationalityid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_nationalityid_idx ON guest USING btree (nationalityid);


--
-- Name: guest_paymentmethodid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_paymentmethodid_idx ON guest USING btree (paymentmethodid);


--
-- Name: guest_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_regbyid_idx ON guest USING btree (regbyid);


--
-- Name: guest_salutationid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_salutationid_idx ON guest USING btree (salutationid);


--
-- Name: guest_vipstatusid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX guest_vipstatusid_idx ON guest USING btree (vipstatusid);


--
-- Name: hotel_countryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX hotel_countryid_idx ON hotel USING btree (countryid);


--
-- Name: hotel_districtid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX hotel_districtid_idx ON hotel USING btree (districtid);


--
-- Name: housekeepingstatus_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX housekeepingstatus_name_idx ON housekeepingstatus USING btree (name);


--
-- Name: houseunit_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX houseunit_name_idx ON houseunit USING btree (name);


--
-- Name: houseunit_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX houseunit_regbyid_idx ON houseunit USING btree (regbyid);


--
-- Name: idtype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX idtype_name_idx ON idtype USING btree (name);


--
-- Name: market_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX market_code_idx ON market USING btree (code);


--
-- Name: market_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX market_name_idx ON market USING btree (name);


--
-- Name: market_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX market_regbyid_idx ON market USING btree (regbyid);


--
-- Name: nationality_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX nationality_name_idx ON nationality USING btree (name);


--
-- Name: payment_currencyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX payment_currencyid_idx ON payment USING btree (currencyid);


--
-- Name: payment_folioid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX payment_folioid_idx ON payment USING btree (folioid);


--
-- Name: payment_paymentmethodid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX payment_paymentmethodid_idx ON payment USING btree (paymentmethodid);


--
-- Name: payment_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX payment_regbyid_idx ON payment USING btree (regbyid);


--
-- Name: payment_uq_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX payment_uq_idx ON payment USING btree (paymentmethodid, paydate, folioid);


--
-- Name: paymentmethod_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX paymentmethod_code_idx ON paymentmethod USING btree (code);


--
-- Name: paymentmethod_extrachargeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX paymentmethod_extrachargeid_idx ON paymentmethod USING btree (extrachargeid);


--
-- Name: paymentmethod_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX paymentmethod_name_idx ON paymentmethod USING btree (name);


--
-- Name: paymentmethod_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX paymentmethod_regbyid_idx ON paymentmethod USING btree (regbyid);


--
-- Name: payout_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX payout_name_idx ON payout USING btree (name);


--
-- Name: payout_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX payout_regbyid_idx ON payout USING btree (regbyid);


--
-- Name: plevel_menuid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX plevel_menuid_idx ON plevel USING btree (menuid);


--
-- Name: plevel_personelltypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX plevel_personelltypeid_idx ON plevel USING btree (personneltypeid);


--
-- Name: preference_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX preference_name_idx ON preference USING btree (name);


--
-- Name: preference_preferencetypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX preference_preferencetypeid_idx ON preference USING btree (preferencetypeid);


--
-- Name: preference_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX preference_regbyid_idx ON preference USING btree (regbyid);


--
-- Name: preferencetype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX preferencetype_name_idx ON preferencetype USING btree (name);


--
-- Name: preferencetype_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX preferencetype_regbyid_idx ON preferencetype USING btree (regbyid);


--
-- Name: ratetype_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX ratetype_code_idx ON ratetype USING btree (code);


--
-- Name: ratetype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX ratetype_name_idx ON ratetype USING btree (name);


--
-- Name: ratetype_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX ratetype_regbyid_idx ON ratetype USING btree (regbyid);


--
-- Name: reason_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX reason_name_idx ON reason USING btree (name);


--
-- Name: reason_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reason_regbyid_idx ON reason USING btree (regbyid);


--
-- Name: region_countryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX region_countryid_idx ON region USING btree (countryid);


--
-- Name: reservation_bsourceid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_bsourceid_idx ON reservation USING btree (bsourceid);


--
-- Name: reservation_companyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_companyid_idx ON reservation USING btree (companyid);


--
-- Name: reservation_contractcontragentid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_contractcontragentid_idx ON reservation USING btree (contractcontragentid);


--
-- Name: reservation_discountid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_discountid_idx ON reservation USING btree (discountid);


--
-- Name: reservation_marketid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_marketid_idx ON reservation USING btree (marketid);


--
-- Name: reservation_paymentcontragentid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_paymentcontragentid_idx ON reservation USING btree (paymentcontragentid);


--
-- Name: reservation_paymentmethodid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_paymentmethodid_idx ON reservation USING btree (paymentmethodid);


--
-- Name: reservation_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_regbyid_idx ON reservation USING btree (regbyid);


--
-- Name: reservation_reservationtypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_reservationtypeid_idx ON reservation USING btree (reservationtypeid);


--
-- Name: reservation_taid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservation_taid_idx ON reservation USING btree (taid);


--
-- Name: reservationroom_guestid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationroom_guestid_idx ON reservationroom USING btree (guestid);


--
-- Name: reservationroom_ratetypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationroom_ratetypeid_idx ON reservationroom USING btree (ratetypeid);


--
-- Name: reservationroom_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationroom_regbyid_idx ON reservationroom USING btree (regbyid);


--
-- Name: reservationroom_reservationid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationroom_reservationid_idx ON reservationroom USING btree (reservationid);


--
-- Name: reservationroom_roomid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationroom_roomid_idx ON reservationroom USING btree (roomid);


--
-- Name: reservationtype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX reservationtype_name_idx ON reservationtype USING btree (name);


--
-- Name: reservationtype_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX reservationtype_regbyid_idx ON reservationtype USING btree (regbyid);


--
-- Name: resevationroom_roomtypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX resevationroom_roomtypeid_idx ON reservationroom USING btree (roomtypeid);


--
-- Name: room_bedtypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX room_bedtypeid_idx ON room USING btree (bedtypeid);


--
-- Name: room_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX room_code_idx ON room USING btree (code);


--
-- Name: room_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX room_name_idx ON room USING btree (name);


--
-- Name: room_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX room_regbyid_idx ON room USING btree (regbyid);


--
-- Name: room_roomtypeid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX room_roomtypeid_idx ON room USING btree (roomtypeid);


--
-- Name: roomimage_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX roomimage_regbyid_idx ON roomimage USING btree (regbyid);


--
-- Name: roomimage_roomid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX roomimage_roomid_idx ON roomimage USING btree (roomid);


--
-- Name: roomstatus_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX roomstatus_regbyid_idx ON roomst USING btree (regbyid);


--
-- Name: roomstatus_roomid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX roomstatus_roomid_idx ON roomst USING btree (roomid);


--
-- Name: roomtype_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX roomtype_code_idx ON roomtype USING btree (code);


--
-- Name: roomtype_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX roomtype_name_idx ON roomtype USING btree (name);


--
-- Name: roomtypeid_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX roomtypeid_regbyid_idx ON roomtype USING btree (regbyid);


--
-- Name: season_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX season_code_idx ON season USING btree (code);


--
-- Name: season_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX season_name_idx ON season USING btree (name);


--
-- Name: season_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX season_regbyid_idx ON season USING btree (regbyid);


--
-- Name: statuscolor_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX statuscolor_regbyid_idx ON stcolor USING btree (regbyid);


--
-- Name: tax_code_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX tax_code_idx ON tax USING btree (code);


--
-- Name: tax_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX tax_name_idx ON tax USING btree (name);


--
-- Name: tax_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX tax_regbyid_idx ON tax USING btree (regbyid);


--
-- Name: taxaccount_payoutid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX taxaccount_payoutid_idx ON taxaccount USING btree (payoutid);


--
-- Name: taxaccount_taxid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX taxaccount_taxid_idx ON taxaccount USING btree (taxid);


--
-- Name: template_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX template_name_idx ON template USING btree (name);


--
-- Name: template_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX template_regbyid_idx ON template USING btree (personnelid);


--
-- Name: template_templatecategoryid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX template_templatecategoryid_idx ON template USING btree (templatecategoryid);


--
-- Name: templatecategory_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX templatecategory_name_idx ON templatecategory USING btree (name);


--
-- Name: templatecategory_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX templatecategory_regbyid_idx ON templatecategory USING btree (regbyid);


--
-- Name: transportationmode_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX transportationmode_name_idx ON transportationmode USING btree (name);


--
-- Name: transportationmode_regbyid_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE INDEX transportationmode_regbyid_idx ON transportationmode USING btree (regbyid);


--
-- Name: vipstatus_name_idx; Type: INDEX; Schema: public; Owner: hms; Tablespace: 
--

CREATE UNIQUE INDEX vipstatus_name_idx ON vipstatus USING btree (name);


--
-- Name: amenity_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY amenity
    ADD CONSTRAINT amenity_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: bedtype_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY bedtype
    ADD CONSTRAINT bedtype_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: bsource_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY bsource
    ADD CONSTRAINT bsource_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: checkinreservationsettings_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY checkinreservationsettings
    ADD CONSTRAINT checkinreservationsettings_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: city_regionid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY city
    ADD CONSTRAINT city_regionid_fkey FOREIGN KEY (regionid) REFERENCES region(regionid);


--
-- Name: connectedroom_connectedid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY connectedroom
    ADD CONSTRAINT connectedroom_connectedid_fkey FOREIGN KEY (connectedid) REFERENCES room(roomid);


--
-- Name: connectedroom_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY connectedroom
    ADD CONSTRAINT connectedroom_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: contragent_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY contragent
    ADD CONSTRAINT contragent_countryid_fkey FOREIGN KEY (countryid) REFERENCES country(countryid);


--
-- Name: contragent_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY contragent
    ADD CONSTRAINT contragent_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: contragent_salutationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY contragent
    ADD CONSTRAINT contragent_salutationid_fkey FOREIGN KEY (salutationid) REFERENCES salutation(salutationid);


--
-- Name: currency_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY currency
    ADD CONSTRAINT currency_countryid_fkey FOREIGN KEY (countryid) REFERENCES country(countryid);


--
-- Name: currencyrate_currencyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY currencyrate
    ADD CONSTRAINT currencyrate_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES currency(currencyid);


--
-- Name: discount_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY discount
    ADD CONSTRAINT discount_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: displaysettings_idtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_idtypeid_fkey FOREIGN KEY (idtypeid) REFERENCES idtype(idtypeid);


--
-- Name: displaysettings_paymentmethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_paymentmethodid_fkey FOREIGN KEY (paymentmethodid) REFERENCES paymentmethod(paymentmethodid);


--
-- Name: displaysettings_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: displaysettings_reservationtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_reservationtypeid_fkey FOREIGN KEY (reservationtypeid) REFERENCES reservationtype(reservationtypeid);


--
-- Name: displaysettings_salutationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY displaysettings
    ADD CONSTRAINT displaysettings_salutationid_fkey FOREIGN KEY (salutationid) REFERENCES salutation(salutationid);


--
-- Name: district_cityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY district
    ADD CONSTRAINT district_cityid_fkey FOREIGN KEY (cityid) REFERENCES city(cityid);


--
-- Name: extracharge_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY extracharge
    ADD CONSTRAINT extracharge_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: extrachargetax_extrachargeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY extrachargetax
    ADD CONSTRAINT extrachargetax_extrachargeid_fkey FOREIGN KEY (extrachargeid) REFERENCES extracharge(extrachargeid);


--
-- Name: extrachargetax_taxid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY extrachargetax
    ADD CONSTRAINT extrachargetax_taxid_fkey FOREIGN KEY (taxid) REFERENCES tax(taxid);


--
-- Name: folio_contragentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folio
    ADD CONSTRAINT folio_contragentid_fkey FOREIGN KEY (contragentid) REFERENCES contragent(contragentid);


--
-- Name: folio_guestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folio
    ADD CONSTRAINT folio_guestid_fkey FOREIGN KEY (guestid) REFERENCES guest(guestid);


--
-- Name: folio_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folio
    ADD CONSTRAINT folio_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: folio_reservationroomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folio
    ADD CONSTRAINT folio_reservationroomid_fkey FOREIGN KEY (reservationroomid) REFERENCES reservationroom(reservationroomid);


--
-- Name: folioitem_discountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_discountid_fkey FOREIGN KEY (discountid) REFERENCES discount(discountid);


--
-- Name: folioitem_extrachargeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_extrachargeid_fkey FOREIGN KEY (extrachargeid) REFERENCES extracharge(extrachargeid);


--
-- Name: folioitem_folioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_folioid_fkey FOREIGN KEY (folioid) REFERENCES folio(folioid);


--
-- Name: folioitem_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: folioitem_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: folioitem_taxid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_taxid_fkey FOREIGN KEY (taxid) REFERENCES tax(taxid);


--
-- Name: guest_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_countryid_fkey FOREIGN KEY (countryid) REFERENCES country(countryid);


--
-- Name: guest_idtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_idtypeid_fkey FOREIGN KEY (idtypeid) REFERENCES idtype(idtypeid);


--
-- Name: guest_nationalityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_nationalityid_fkey FOREIGN KEY (nationalityid) REFERENCES nationality(nationalityid);


--
-- Name: guest_paymentmethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_paymentmethodid_fkey FOREIGN KEY (paymentmethodid) REFERENCES paymentmethod(paymentmethodid);


--
-- Name: guest_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: guest_salutationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_salutationid_fkey FOREIGN KEY (salutationid) REFERENCES salutation(salutationid);


--
-- Name: guest_vipstatusid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY guest
    ADD CONSTRAINT guest_vipstatusid_fkey FOREIGN KEY (vipstatusid) REFERENCES vipstatus(vipstatusid);


--
-- Name: hotel_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_countryid_fkey FOREIGN KEY (countryid) REFERENCES country(countryid);


--
-- Name: hotel_districtid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY hotel
    ADD CONSTRAINT hotel_districtid_fkey FOREIGN KEY (districtid) REFERENCES district(districtid);


--
-- Name: houseunit_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY houseunit
    ADD CONSTRAINT houseunit_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: market_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY market
    ADD CONSTRAINT market_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: menu_parentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY menu
    ADD CONSTRAINT menu_parentid_fkey FOREIGN KEY (parentid) REFERENCES menu(menuid);


--
-- Name: payment_currencyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_currencyid_fkey FOREIGN KEY (currencyid) REFERENCES currency(currencyid);


--
-- Name: payment_folioid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_folioid_fkey FOREIGN KEY (folioid) REFERENCES folio(folioid);


--
-- Name: payment_paymentmethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_paymentmethodid_fkey FOREIGN KEY (paymentmethodid) REFERENCES paymentmethod(paymentmethodid);


--
-- Name: payment_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY payment
    ADD CONSTRAINT payment_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: paymentmethod_extrachargeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY paymentmethod
    ADD CONSTRAINT paymentmethod_extrachargeid_fkey FOREIGN KEY (extrachargeid) REFERENCES extracharge(extrachargeid);


--
-- Name: paymentmethod_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY paymentmethod
    ADD CONSTRAINT paymentmethod_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: payout_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY payout
    ADD CONSTRAINT payout_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: personnel_changebyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY personnel
    ADD CONSTRAINT personnel_changebyid_fkey FOREIGN KEY (changebyid) REFERENCES personnel(personnelid);


--
-- Name: personnel_personneltypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY personnel
    ADD CONSTRAINT personnel_personneltypeid_fkey FOREIGN KEY (personneltypeid) REFERENCES personneltype(personneltypeid);


--
-- Name: plevel_menuid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY plevel
    ADD CONSTRAINT plevel_menuid_fkey FOREIGN KEY (menuid) REFERENCES menu(menuid);


--
-- Name: plevel_personelltypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY plevel
    ADD CONSTRAINT plevel_personelltypeid_fkey FOREIGN KEY (personneltypeid) REFERENCES personneltype(personneltypeid);


--
-- Name: preference_preferencetypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_preferencetypeid_fkey FOREIGN KEY (preferencetypeid) REFERENCES preferencetype(preferencetypeid);


--
-- Name: preference_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY preference
    ADD CONSTRAINT preference_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: preferencetype_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY preferencetype
    ADD CONSTRAINT preferencetype_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: ratetype_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY ratetype
    ADD CONSTRAINT ratetype_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: ratetyperoomtype_ratetypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY ratetyperoomtype
    ADD CONSTRAINT ratetyperoomtype_ratetypeid_fkey FOREIGN KEY (ratetypeid) REFERENCES ratetype(ratetypeid);


--
-- Name: ratetyperoomtype_roomtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY ratetyperoomtype
    ADD CONSTRAINT ratetyperoomtype_roomtypeid_fkey FOREIGN KEY (roomtypeid) REFERENCES roomtype(roomtypeid);


--
-- Name: reason_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reason
    ADD CONSTRAINT reason_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: region_countryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY region
    ADD CONSTRAINT region_countryid_fkey FOREIGN KEY (countryid) REFERENCES country(countryid);


--
-- Name: reservation_bsourceid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_bsourceid_fkey FOREIGN KEY (bsourceid) REFERENCES bsource(bsourceid);


--
-- Name: reservation_companyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_companyid_fkey FOREIGN KEY (companyid) REFERENCES contragent(contragentid);


--
-- Name: reservation_contractcontragentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_contractcontragentid_fkey FOREIGN KEY (contractcontragentid) REFERENCES contragent(contragentid);


--
-- Name: reservation_discountid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_discountid_fkey FOREIGN KEY (discountid) REFERENCES discount(discountid);


--
-- Name: reservation_marketid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_marketid_fkey FOREIGN KEY (marketid) REFERENCES market(marketid);


--
-- Name: reservation_paymentcontragentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_paymentcontragentid_fkey FOREIGN KEY (paymentcontragentid) REFERENCES contragent(contragentid);


--
-- Name: reservation_paymentmethodid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_paymentmethodid_fkey FOREIGN KEY (paymentmethodid) REFERENCES paymentmethod(paymentmethodid);


--
-- Name: reservation_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: reservation_reservationtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_reservationtypeid_fkey FOREIGN KEY (reservationtypeid) REFERENCES reservationtype(reservationtypeid);


--
-- Name: reservation_taid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_taid_fkey FOREIGN KEY (taid) REFERENCES contragent(contragentid);


--
-- Name: reservationreason_reasonid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationreason
    ADD CONSTRAINT reservationreason_reasonid_fkey FOREIGN KEY (reasonid) REFERENCES reason(reasonid);


--
-- Name: reservationreason_reservationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationreason
    ADD CONSTRAINT reservationreason_reservationid_fkey FOREIGN KEY (reservationid) REFERENCES reservation(reservationid);


--
-- Name: reservationroom_guestid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_guestid_fkey FOREIGN KEY (guestid) REFERENCES guest(guestid);


--
-- Name: reservationroom_ratetypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_ratetypeid_fkey FOREIGN KEY (ratetypeid) REFERENCES ratetype(ratetypeid);


--
-- Name: reservationroom_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: reservationroom_reservationid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_reservationid_fkey FOREIGN KEY (reservationid) REFERENCES reservation(reservationid);


--
-- Name: reservationroom_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: reservationroom_roomtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationroom
    ADD CONSTRAINT reservationroom_roomtypeid_fkey FOREIGN KEY (roomtypeid) REFERENCES roomtype(roomtypeid);


--
-- Name: reservationtype_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY reservationtype
    ADD CONSTRAINT reservationtype_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: room_bedtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_bedtypeid_fkey FOREIGN KEY (bedtypeid) REFERENCES bedtype(bedtypeid);


--
-- Name: room_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: room_roomtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY room
    ADD CONSTRAINT room_roomtypeid_fkey FOREIGN KEY (roomtypeid) REFERENCES roomtype(roomtypeid);


--
-- Name: roomimage_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomimage
    ADD CONSTRAINT roomimage_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: roomimage_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomimage
    ADD CONSTRAINT roomimage_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: roomownerroom_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomownerroom
    ADD CONSTRAINT roomownerroom_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: roomownerroom_roomownerid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomownerroom
    ADD CONSTRAINT roomownerroom_roomownerid_fkey FOREIGN KEY (roomownerid) REFERENCES contragent(contragentid);


--
-- Name: roomrate_contragentid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomrate
    ADD CONSTRAINT roomrate_contragentid_fkey FOREIGN KEY (contragentid) REFERENCES contragent(contragentid);


--
-- Name: roomrate_roomratetypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomrate
    ADD CONSTRAINT roomrate_roomratetypeid_fkey FOREIGN KEY (ratetypeid) REFERENCES ratetype(ratetypeid);


--
-- Name: roomrate_roomtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomrate
    ADD CONSTRAINT roomrate_roomtypeid_fkey FOREIGN KEY (roomtypeid) REFERENCES roomtype(roomtypeid);


--
-- Name: roomrate_seasonid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomrate
    ADD CONSTRAINT roomrate_seasonid_fkey FOREIGN KEY (seasonid) REFERENCES season(seasonid);


--
-- Name: roomstatus_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomst
    ADD CONSTRAINT roomstatus_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: roomstatus_roomid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomst
    ADD CONSTRAINT roomstatus_roomid_fkey FOREIGN KEY (roomid) REFERENCES room(roomid);


--
-- Name: roomtype_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomtype
    ADD CONSTRAINT roomtype_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: roomtypeamenity_amenityid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomtypeamenity
    ADD CONSTRAINT roomtypeamenity_amenityid_fkey FOREIGN KEY (amenityid) REFERENCES amenity(amenityid);


--
-- Name: roomtypeamenity_roomtypeid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY roomtypeamenity
    ADD CONSTRAINT roomtypeamenity_roomtypeid_fkey FOREIGN KEY (roomtypeid) REFERENCES roomtype(roomtypeid);


--
-- Name: season_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY season
    ADD CONSTRAINT season_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: statuscolor_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY stcolor
    ADD CONSTRAINT statuscolor_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: tax_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY tax
    ADD CONSTRAINT tax_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: taxaccount_payoutid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY taxaccount
    ADD CONSTRAINT taxaccount_payoutid_fkey FOREIGN KEY (payoutid) REFERENCES payout(payoutid);


--
-- Name: taxaccount_taxid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY taxaccount
    ADD CONSTRAINT taxaccount_taxid_fkey FOREIGN KEY (taxid) REFERENCES tax(taxid);


--
-- Name: taxsequence_afterid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY taxsequence
    ADD CONSTRAINT taxsequence_afterid_fkey FOREIGN KEY (afterid) REFERENCES tax(taxid);


--
-- Name: taxsequence_taxid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY taxsequence
    ADD CONSTRAINT taxsequence_taxid_fkey FOREIGN KEY (taxid) REFERENCES tax(taxid);


--
-- Name: template_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY template
    ADD CONSTRAINT template_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: template_templatecategoryid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY template
    ADD CONSTRAINT template_templatecategoryid_fkey FOREIGN KEY (templatecategoryid) REFERENCES templatecategory(templatecategoryid);


--
-- Name: templatecategory_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY templatecategory
    ADD CONSTRAINT templatecategory_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: transportationmode_regbyid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY transportationmode
    ADD CONSTRAINT transportationmode_regbyid_fkey FOREIGN KEY (regbyid) REFERENCES personnel(personnelid);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

