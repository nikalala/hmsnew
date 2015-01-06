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
select st into x from roomst where roomid = $1 and statusdate::date <=
to_timestamp($2,'DD/MM/YYYY HH24:MI')::date order by statusdate::date desc, regdate desc limit
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
-- Name: ordermain; Type: TABLE; Schema: public; Owner: hms; Tablespace:
--

CREATE TABLE ordermain (
    ordermainid bigint NOT NULL,
    hallname text NOT NULL,
    tablename text NOT NULL,
    opendate timestamp without time zone NOT NULL,
    closedate timestamp without time zone NOT NULL,
    waitername text NOT NULL,
    amount double precision NOT NULL,
    discount double precision NOT NULL,
    price double precision NOT NULL,
    cash double precision NOT NULL,
    paid double precision NOT NULL,
    regname text NOT NULL,
    regdate timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE public.ordermain OWNER TO hms;

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
-- Name: personnelid_seq; Type: SEQUENCE; Schema: public; Owner: hms
--

CREATE SEQUENCE personnelid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personnelid_seq OWNER TO hms;

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
    SELECT r.reservationid, m.reservationroomid, m.roomid, COALESCE(t.roomtypeid, o.roomtypeid) AS roomtypeid, r.arraivaldate, r.departuredate, r.regbyid, r.reservationtypeid, g.guestid, ((g.fname || ' '::text) || g.lname) AS guest, o.roomcode, CASE WHEN (o.roomid IS NOT NULL) THEN o.roomtypecode ELSE t.code END AS roomtypecode, b.name AS bsourcename, b.bsourceid, c.name AS companyname, m.adult, m.child, v.name AS reservtype, r.status AS roomstatus FROM ((reservationroom m LEFT JOIN (SELECT oo.roomid, oo.code AS roomcode, tt.code AS roomtypecode, tt.roomtypeid FROM room oo, roomtype tt WHERE (oo.roomtypeid = tt.roomtypeid)) o ON ((o.roomid = m.roomid))) LEFT JOIN roomtype t ON ((t.roomtypeid = m.roomtypeid))), (reservation r LEFT JOIN bsource b ON ((b.bsourceid = r.bsourceid))), (guest g LEFT JOIN contragent c ON (((c.contragentid = g.contragentid) AND (c.type = 1)))), personnel l, reservationtype v WHERE (((((m.reservationid = r.reservationid) AND (g.guestid = m.guestid)) AND (l.personnelid = r.regbyid)) AND (r.status >= 0)) AND (v.reservationtypeid = r.reservationtypeid));


ALTER TABLE public.v_arrivallist OWNER TO hms;

--
-- Name: v_contragentlist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_contragentlist AS
    SELECT c.contragentid, c.type, c.salutationid, c.fname, c.lname, c.name, c.address, c.countryid, c.city, c.zip, c.phone, c.fax, c.mobile, c.email, c.commissionplan, c.val, c.rate, c.openbalance, c.roominventory, c.createuser, c.bsource, c.ccblock, c.idn, c.creditterm, c.creditlimit, c.regbyid, c.regdate, c.deleted, ((c.fname || ' '::text) || c.lname) AS contragent, c.name AS company, cc.name AS country FROM (contragent c LEFT JOIN country cc ON ((cc.countryid = c.countryid)));


ALTER TABLE public.v_contragentlist OWNER TO hms;

--
-- Name: v_deplist; Type: VIEW; Schema: public; Owner: hms
--

CREATE VIEW v_deplist AS
    SELECT r.reservationid, m.reservationroomid, m.roomid, COALESCE(t.roomtypeid, o.roomtypeid) AS roomtypeid, r.arraivaldate, r.departuredate, r.regdate, r.regbyid, r.reservationtypeid, r.status, g.guestid, ((g.fname || ' '::text) || g.lname) AS guest, o.roomcode, CASE WHEN (o.roomid IS NOT NULL) THEN o.roomtypecode ELSE t.code END AS roomtypecode, COALESCE(b.name, (' '::bpchar)::text) AS bsourcename, b.bsourceid, COALESCE(c.name, (' '::bpchar)::text) AS companyname, COALESCE(a.price, (0)::double precision) AS price, COALESCE(d.paid, (0)::double precision) AS paid, d.vouchernum, l.loginid AS "user", v.name AS reservationtype FROM ((((reservationroom m LEFT JOIN (SELECT oo.roomid, oo.code AS roomcode, tt.code AS roomtypecode, tt.roomtypeid FROM room oo, roomtype tt WHERE (oo.roomtypeid = tt.roomtypeid)) o ON ((o.roomid = m.roomid))) LEFT JOIN roomtype t ON ((t.roomtypeid = m.roomtypeid))) LEFT JOIN (SELECT sum(pm.amount) AS paid, fl.reservationroomid, string_agg(pm.voucherno, ','::text) AS vouchernum FROM payment pm, folio fl WHERE (pm.folioid = fl.folioid) GROUP BY fl.reservationroomid) d ON ((d.reservationroomid = m.reservationroomid))) LEFT JOIN (SELECT sum(fi.amount) AS price, fl.reservationroomid FROM folioitem fi, folio fl WHERE (fi.folioid = fl.folioid) GROUP BY fl.reservationroomid) a ON ((a.reservationroomid = m.reservationroomid))), (reservation r LEFT JOIN bsource b ON ((b.bsourceid = r.bsourceid))), (guest g LEFT JOIN contragent c ON (((c.contragentid = g.contragentid) AND (c.type = 1)))), personnel l, reservationtype v WHERE (((((m.reservationid = r.reservationid) AND (g.guestid = m.guestid)) AND (l.personnelid = r.regbyid)) AND (r.status = ANY (ARRAY[(-1), 0]))) AND (v.reservationtypeid = r.reservationtypeid));


ALTER TABLE public.v_deplist OWNER TO hms;

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

INSERT INTO amenity VALUES (1, 'Air Conditioning System', 0, 1, 1, '2014-12-16 13:16:26.569', true, false);
INSERT INTO amenity VALUES (4, 'Flat Screen', 0, 2, 1, '2014-12-16 13:16:51.826', true, false);
INSERT INTO amenity VALUES (2, 'Cable Television', 0, 3, 1, '2014-12-16 13:17:51.446', true, false);
INSERT INTO amenity VALUES (5, 'Mini Bar', 0, 5, 1, '2014-12-16 13:18:39.081', true, false);
INSERT INTO amenity VALUES (3, 'Smoke Alarm / Detector', 2, 4, 1, '2014-12-16 13:19:18.812', true, false);
INSERT INTO amenity VALUES (6, 'Bathroom', 0, 6, 1, '2014-12-16 13:20:40.965', true, false);
INSERT INTO amenity VALUES (7, 'Hair Dryer', 0, 7, 1, '2014-12-16 13:20:57.414', true, false);
INSERT INTO amenity VALUES (8, 'Balcony', 0, 8, 1, '2014-12-16 13:21:38.098', true, false);
INSERT INTO amenity VALUES (9, 'Telephone', 0, 9, 1, '2014-12-16 13:21:58.36', true, false);
INSERT INTO amenity VALUES (10, 'Safe Boxes', 0, 10, 1, '2014-12-16 13:22:17.121', true, false);
INSERT INTO amenity VALUES (11, 'Toileteries', 0, 11, 1, '2014-12-16 13:22:41.482', true, false);
INSERT INTO amenity VALUES (12, 'Tea / Coffee making facilities', 0, 12, 1, '2014-12-16 13:23:01.952', true, false);
INSERT INTO amenity VALUES (13, 'Deep Pile Carpet', 0, 13, 1, '2014-12-16 13:23:19.963', true, false);
INSERT INTO amenity VALUES (14, 'Free Wireless Internet Access', 0, 14, 1, '2014-12-16 13:23:39.502', true, false);
INSERT INTO amenity VALUES (15, 'Non-smoking rooms', 0, 15, 1, '2014-12-16 13:23:59.961', true, false);
INSERT INTO amenity VALUES (16, 'Room Service', 0, 16, 1, '2014-12-16 13:24:42.397', true, false);
INSERT INTO amenity VALUES (17, 'View', 2, 17, 1, '2014-12-16 13:25:25.123', true, false);
INSERT INTO amenity VALUES (18, '24 Hours Reception', 2, 18, 1, '2014-12-16 13:25:51.805', true, false);
INSERT INTO amenity VALUES (19, 'Free Breakfast', 2, 19, 1, '2014-12-16 13:26:11.245', true, false);
INSERT INTO amenity VALUES (20, 'Hotel porters / doormen', 2, 20, 1, '2014-12-16 13:26:48.655', true, false);
INSERT INTO amenity VALUES (21, '24 hours security', 2, 21, 1, '2014-12-16 13:27:09.195', true, false);
INSERT INTO amenity VALUES (22, 'Multi-language staff', 2, 22, 1, '2014-12-16 13:27:28.789', true, false);
INSERT INTO amenity VALUES (23, 'Wake up Call service', 2, 23, 1, '2014-12-16 13:27:47.17', true, false);
INSERT INTO amenity VALUES (24, 'Lobby Bar', 1, 24, 1, '2014-12-16 13:28:24.452', true, false);
INSERT INTO amenity VALUES (25, 'Banqueting Halls', 1, 25, 1, '2014-12-16 13:28:47.684', true, false);
INSERT INTO amenity VALUES (26, 'City-view Restaurant & Terraces', 1, 26, 1, '2014-12-16 13:29:18.343', true, false);
INSERT INTO amenity VALUES (27, 'Rooftop Banqueting Reception Area', 1, 27, 1, '2014-12-16 13:29:59.481', true, false);
INSERT INTO amenity VALUES (28, 'Conference Hall', 1, 28, 1, '2014-12-16 13:30:24.429', true, false);
INSERT INTO amenity VALUES (29, 'Free land-line phone calls (within Tbilisi)', 1, 29, 1, '2014-12-16 13:30:55.463', true, false);
INSERT INTO amenity VALUES (30, 'Airport Shuttle and car hire', 1, 30, 1, '2014-12-16 13:31:31.886', true, false);
INSERT INTO amenity VALUES (31, 'Interpreter Service', 1, 31, 1, '2014-12-16 13:31:58.054', true, false);
INSERT INTO amenity VALUES (32, 'Laundry Service', 1, 32, 1, '2014-12-16 13:32:55.202', true, false);
INSERT INTO amenity VALUES (33, 'Ticket booking Service', 1, 33, 1, '2014-12-16 13:33:18.066', true, false);
INSERT INTO amenity VALUES (34, 'Parking', 1, 34, 1, '2014-12-16 13:33:45.491', true, false);
INSERT INTO amenity VALUES (35, 'First medical aid facilities', 1, 35, 1, '2014-12-16 13:34:06.056', true, false);
INSERT INTO amenity VALUES (36, 'Newspapers', 1, 36, 1, '2014-12-16 13:34:27.033', true, false);
INSERT INTO amenity VALUES (37, 'Business Centre', 1, 37, 1, '2014-12-16 13:34:55.736', true, false);


--
-- Name: amenityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('amenityid_seq', 37, true);


--
-- Data for Name: bedtype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO bedtype VALUES (6, 'KSD', 'King Size Double', 1, '2014-12-17 20:19:15.085', true, false);


--
-- Name: bedtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('bedtypeid_seq', 7, true);


--
-- Data for Name: bsource; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO bsource VALUES (1, 'qeti', 'qeti', 1, '2014-12-10 13:58:05.615', true, false);


--
-- Name: bsourceid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('bsourceid_seq', 1, true);


--
-- Data for Name: checkinreservationsettings; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO checkinreservationsettings VALUES (2, false, '14:00:00', '12:12:00', true, 3, 20, true, 2, 10, true, 1, 5, 2, 15, false, NULL, 3, 1, 1, false, 1, 0, 31, 11, true, true, true, true, false, false, true, true, false, false, false, false, false, false, false, false, true, true, true, true, false, true, 1, '2014-08-18 11:52:51.463821', true, true);


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



--
-- Name: cityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('cityid_seq', 1, false);


--
-- Data for Name: closedate; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO closedate VALUES (2, '2014-10-23', 1, '2014-11-21 20:23:08.211');
INSERT INTO closedate VALUES (3, '2014-10-24', 1, '2014-12-29 22:00:12.503756');
INSERT INTO closedate VALUES (4, '2014-10-25', 1, '2015-01-05 13:58:40.188351');
INSERT INTO closedate VALUES (5, '2014-10-26', 1, '2015-01-06 15:13:39.947061');
INSERT INTO closedate VALUES (6, '2014-10-27', 1, '2015-01-06 15:17:51.683396');
INSERT INTO closedate VALUES (7, '2014-10-28', 1, '2015-01-06 16:07:58.593088');
INSERT INTO closedate VALUES (8, '2014-10-29', 1, '2015-01-06 17:09:42.107037');
INSERT INTO closedate VALUES (9, '2014-10-30', 1, '2015-01-06 17:14:54.869146');


--
-- Name: closedateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('closedateid_seq', 9, true);


--
-- Data for Name: confmail; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO confmail VALUES (2, 'smtp.googlemail.com', 465, 'ims@mysoft.ge', 'Ims32145', 'ims@mysoft.ge');


--
-- Name: confmailid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('confmailid_seq', 2, true);


--
-- Data for Name: connectedroom; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: contragent; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO contragent VALUES (0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-08-13 17:55:22.519101', false);


--
-- Name: contragentid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('contragentid_seq', 43, true);


--
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO country VALUES (1, 'ა.შ.შ.', NULL, NULL, NULL);
INSERT INTO country VALUES (2, 'ავსტრალია', NULL, NULL, NULL);
INSERT INTO country VALUES (3, 'ავსტრია', NULL, NULL, NULL);
INSERT INTO country VALUES (4, 'ავღანეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (5, 'აზერბაიჯანი', NULL, NULL, NULL);
INSERT INTO country VALUES (6, 'ალბანეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (7, 'ალჟირი', NULL, NULL, NULL);
INSERT INTO country VALUES (8, 'ანგილია', NULL, NULL, NULL);
INSERT INTO country VALUES (9, 'ანგოლა', NULL, NULL, NULL);
INSERT INTO country VALUES (10, 'ანდორა', NULL, NULL, NULL);
INSERT INTO country VALUES (11, 'ანტიგუა და ბარბუდა', NULL, NULL, NULL);
INSERT INTO country VALUES (12, 'არაბეთის გ/ემირატები', NULL, NULL, NULL);
INSERT INTO country VALUES (13, 'არგენტინა', NULL, NULL, NULL);
INSERT INTO country VALUES (14, 'ახალი ზელანდია', NULL, NULL, NULL);
INSERT INTO country VALUES (15, 'ახალი კალედონია', NULL, NULL, NULL);
INSERT INTO country VALUES (16, 'ბანგლადეში', NULL, NULL, NULL);
INSERT INTO country VALUES (17, 'ბარბადოსი', NULL, NULL, NULL);
INSERT INTO country VALUES (18, 'ბაჰამის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (19, 'ბაჰრეინი', NULL, NULL, NULL);
INSERT INTO country VALUES (20, 'ბელგია', NULL, NULL, NULL);
INSERT INTO country VALUES (21, 'ბელიზი', NULL, NULL, NULL);
INSERT INTO country VALUES (22, 'ბელორუსია', NULL, NULL, NULL);
INSERT INTO country VALUES (23, 'ბენინი', NULL, NULL, NULL);
INSERT INTO country VALUES (24, 'ბერმუდის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (25, 'ბოლივია', NULL, NULL, NULL);
INSERT INTO country VALUES (26, 'ბოსნია-ჰერცოგოვინა', NULL, NULL, NULL);
INSERT INTO country VALUES (27, 'ბოტსვანა', NULL, NULL, NULL);
INSERT INTO country VALUES (28, 'ბრაზილია', NULL, NULL, NULL);
INSERT INTO country VALUES (29, 'ბრუნეი', NULL, NULL, NULL);
INSERT INTO country VALUES (30, 'ბულგარეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (31, 'ბურკინა ფასო', NULL, NULL, NULL);
INSERT INTO country VALUES (32, 'ბურუნდი', NULL, NULL, NULL);
INSERT INTO country VALUES (33, 'ბუტანი', NULL, NULL, NULL);
INSERT INTO country VALUES (34, 'გაბონი', NULL, NULL, NULL);
INSERT INTO country VALUES (35, 'გაიანა', NULL, NULL, NULL);
INSERT INTO country VALUES (36, 'გამბია', NULL, NULL, NULL);
INSERT INTO country VALUES (37, 'განა', NULL, NULL, NULL);
INSERT INTO country VALUES (38, 'გერმანია', NULL, NULL, NULL);
INSERT INTO country VALUES (39, 'გვადელუპე', NULL, NULL, NULL);
INSERT INTO country VALUES (40, 'გვატემალა', NULL, NULL, NULL);
INSERT INTO country VALUES (41, 'გვიანა', NULL, NULL, NULL);
INSERT INTO country VALUES (42, 'გვინეა', NULL, NULL, NULL);
INSERT INTO country VALUES (43, 'გვინეა-ბისაუ', NULL, NULL, NULL);
INSERT INTO country VALUES (44, 'გიბრალტარი', NULL, NULL, NULL);
INSERT INTO country VALUES (45, 'გრენადა', NULL, NULL, NULL);
INSERT INTO country VALUES (46, 'გრენლანდია', NULL, NULL, NULL);
INSERT INTO country VALUES (47, 'დანია', NULL, NULL, NULL);
INSERT INTO country VALUES (48, 'დიდი ბრიტანეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (49, 'დომინიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (50, 'დომინიკის რესპუბლიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (51, 'ეგვიპტე', NULL, NULL, NULL);
INSERT INTO country VALUES (52, 'ეთიოპია', NULL, NULL, NULL);
INSERT INTO country VALUES (53, 'ეკვადორი', NULL, NULL, NULL);
INSERT INTO country VALUES (54, 'ეკვატორიალური გვინეა', NULL, NULL, NULL);
INSERT INTO country VALUES (55, 'ერაყი', NULL, NULL, NULL);
INSERT INTO country VALUES (56, 'ერითრეა', NULL, NULL, NULL);
INSERT INTO country VALUES (57, 'ესპანეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (58, 'ესტონეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (59, 'ვანუატუ', NULL, NULL, NULL);
INSERT INTO country VALUES (60, 'ვატიკანი', NULL, NULL, NULL);
INSERT INTO country VALUES (61, 'ვენესუელა', NULL, NULL, NULL);
INSERT INTO country VALUES (62, 'ვიეტნამი', NULL, NULL, NULL);
INSERT INTO country VALUES (63, 'ზამბია', NULL, NULL, NULL);
INSERT INTO country VALUES (64, 'ზიმბაბვე', NULL, NULL, NULL);
INSERT INTO country VALUES (65, 'თურქეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (66, 'თურქმენეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (67, 'იამაიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (68, 'იაპონია', NULL, NULL, NULL);
INSERT INTO country VALUES (69, 'იემენი', NULL, NULL, NULL);
INSERT INTO country VALUES (70, 'ინდოეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (71, 'ინდონეზია', NULL, NULL, NULL);
INSERT INTO country VALUES (72, 'იორდანია', NULL, NULL, NULL);
INSERT INTO country VALUES (73, 'ირანი', NULL, NULL, NULL);
INSERT INTO country VALUES (74, 'ირლანდია', NULL, NULL, NULL);
INSERT INTO country VALUES (75, 'ისლანდია', NULL, NULL, NULL);
INSERT INTO country VALUES (76, 'ისრაელი', NULL, NULL, NULL);
INSERT INTO country VALUES (77, 'იტალია', NULL, NULL, NULL);
INSERT INTO country VALUES (78, 'კაბო-ვერდის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (79, 'კაიმანის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (80, 'კამბოჯა', NULL, NULL, NULL);
INSERT INTO country VALUES (81, 'კამერუნი', NULL, NULL, NULL);
INSERT INTO country VALUES (82, 'კამორის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (83, 'კანადა', NULL, NULL, NULL);
INSERT INTO country VALUES (84, 'კატარი', NULL, NULL, NULL);
INSERT INTO country VALUES (85, 'კენია', NULL, NULL, NULL);
INSERT INTO country VALUES (86, 'კვიპროსი', NULL, NULL, NULL);
INSERT INTO country VALUES (87, 'კირიბატი', NULL, NULL, NULL);
INSERT INTO country VALUES (88, 'კოლუმბია', NULL, NULL, NULL);
INSERT INTO country VALUES (89, 'კონგო', NULL, NULL, NULL);
INSERT INTO country VALUES (90, 'კორეა', NULL, NULL, NULL);
INSERT INTO country VALUES (91, 'კორეის სახ. რესპუბ.', NULL, NULL, NULL);
INSERT INTO country VALUES (92, 'კოსტა-რიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (93, 'კოტ-დივუარი', NULL, NULL, NULL);
INSERT INTO country VALUES (94, 'კუბა', NULL, NULL, NULL);
INSERT INTO country VALUES (95, 'კუვეიტი', NULL, NULL, NULL);
INSERT INTO country VALUES (96, 'ლაოსი', NULL, NULL, NULL);
INSERT INTO country VALUES (97, 'ლატვია', NULL, NULL, NULL);
INSERT INTO country VALUES (98, 'ლესოტო', NULL, NULL, NULL);
INSERT INTO country VALUES (99, 'ლიბანი', NULL, NULL, NULL);
INSERT INTO country VALUES (100, 'ლიბერია', NULL, NULL, NULL);
INSERT INTO country VALUES (101, 'ლიბია', NULL, NULL, NULL);
INSERT INTO country VALUES (102, 'ლიტვა', NULL, NULL, NULL);
INSERT INTO country VALUES (103, 'ლიხტენშტეინი', NULL, NULL, NULL);
INSERT INTO country VALUES (104, 'ლუქსემბურგი', NULL, NULL, NULL);
INSERT INTO country VALUES (105, 'მადაგასკარი', NULL, NULL, NULL);
INSERT INTO country VALUES (106, 'მავრიკია', NULL, NULL, NULL);
INSERT INTO country VALUES (107, 'მავრიტანია', NULL, NULL, NULL);
INSERT INTO country VALUES (108, 'მაკაო', NULL, NULL, NULL);
INSERT INTO country VALUES (109, 'მაკედონია', NULL, NULL, NULL);
INSERT INTO country VALUES (110, 'მალავი', NULL, NULL, NULL);
INSERT INTO country VALUES (111, 'მალაიზია', NULL, NULL, NULL);
INSERT INTO country VALUES (112, 'მალდივი', NULL, NULL, NULL);
INSERT INTO country VALUES (113, 'მალი', NULL, NULL, NULL);
INSERT INTO country VALUES (114, 'მალტა', NULL, NULL, NULL);
INSERT INTO country VALUES (115, 'მაროკო', NULL, NULL, NULL);
INSERT INTO country VALUES (116, 'მარტინიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (117, 'მექსიკა', NULL, NULL, NULL);
INSERT INTO country VALUES (118, 'მიანმა', NULL, NULL, NULL);
INSERT INTO country VALUES (119, 'მოზამბიკი', NULL, NULL, NULL);
INSERT INTO country VALUES (120, 'მოლდოვა', NULL, NULL, NULL);
INSERT INTO country VALUES (121, 'მონაკო', NULL, NULL, NULL);
INSERT INTO country VALUES (122, 'მონსერატი', NULL, NULL, NULL);
INSERT INTO country VALUES (123, 'მონღოლეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (124, 'ნამიბია', NULL, NULL, NULL);
INSERT INTO country VALUES (125, 'ნაურუ', NULL, NULL, NULL);
INSERT INTO country VALUES (126, 'ნეპალი', NULL, NULL, NULL);
INSERT INTO country VALUES (127, 'ნიგერი', NULL, NULL, NULL);
INSERT INTO country VALUES (128, 'ნიგერია', NULL, NULL, NULL);
INSERT INTO country VALUES (129, 'ნიდერლანდები', NULL, NULL, NULL);
INSERT INTO country VALUES (130, 'ნიკარაგუა', NULL, NULL, NULL);
INSERT INTO country VALUES (131, 'ნორვეგია', NULL, NULL, NULL);
INSERT INTO country VALUES (132, 'ომანი', NULL, NULL, NULL);
INSERT INTO country VALUES (133, 'პაკისტანი', NULL, NULL, NULL);
INSERT INTO country VALUES (134, 'პანამა', NULL, NULL, NULL);
INSERT INTO country VALUES (135, 'პაპუა-ახალი გვინეა', NULL, NULL, NULL);
INSERT INTO country VALUES (136, 'პარაგვაი', NULL, NULL, NULL);
INSERT INTO country VALUES (137, 'პერუ', NULL, NULL, NULL);
INSERT INTO country VALUES (138, 'პოლონეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (139, 'პორტუგალია', NULL, NULL, NULL);
INSERT INTO country VALUES (140, 'რეუნიონი', NULL, NULL, NULL);
INSERT INTO country VALUES (141, 'რუანდა', NULL, NULL, NULL);
INSERT INTO country VALUES (142, 'რუმინეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (143, 'რუსეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (144, 'საბერძნეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (145, 'სალვადორი', NULL, NULL, NULL);
INSERT INTO country VALUES (146, 'სამოა', NULL, NULL, NULL);
INSERT INTO country VALUES (147, 'სამხრ. აფრიკის. რესპ.', NULL, NULL, NULL);
INSERT INTO country VALUES (148, 'სან-მარინო', NULL, NULL, NULL);
INSERT INTO country VALUES (149, 'სან-ტომე და პრინსიპი', NULL, NULL, NULL);
INSERT INTO country VALUES (150, 'საუდის არაბეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (151, 'საფრანგეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (153, 'სეიშელი', NULL, NULL, NULL);
INSERT INTO country VALUES (154, 'სენეგალი', NULL, NULL, NULL);
INSERT INTO country VALUES (155, 'სენტ-ვინსენტი', NULL, NULL, NULL);
INSERT INTO country VALUES (156, 'სენტ-კრისტოფი', NULL, NULL, NULL);
INSERT INTO country VALUES (157, 'სენტ-ლუსია', NULL, NULL, NULL);
INSERT INTO country VALUES (158, 'სერბია-ჩერნოგორია', NULL, NULL, NULL);
INSERT INTO country VALUES (159, 'სვაზილენდი', NULL, NULL, NULL);
INSERT INTO country VALUES (160, 'სიერა-ლეონე', NULL, NULL, NULL);
INSERT INTO country VALUES (161, 'სინგაპური', NULL, NULL, NULL);
INSERT INTO country VALUES (162, 'სირია', NULL, NULL, NULL);
INSERT INTO country VALUES (163, 'სლოვაკეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (164, 'სლოვენია', NULL, NULL, NULL);
INSERT INTO country VALUES (165, 'სოლომონის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (166, 'სომალი', NULL, NULL, NULL);
INSERT INTO country VALUES (167, 'სომხეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (168, 'სუდანი', NULL, NULL, NULL);
INSERT INTO country VALUES (169, 'სურინამი', NULL, NULL, NULL);
INSERT INTO country VALUES (170, 'ტაილანდი', NULL, NULL, NULL);
INSERT INTO country VALUES (171, 'ტანზანია', NULL, NULL, NULL);
INSERT INTO country VALUES (172, 'ტაჯიკეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (173, 'ტიმორი', NULL, NULL, NULL);
INSERT INTO country VALUES (174, 'ტოგო', NULL, NULL, NULL);
INSERT INTO country VALUES (175, 'ტონგა', NULL, NULL, NULL);
INSERT INTO country VALUES (176, 'ტრინიდადი და ტობაგო', NULL, NULL, NULL);
INSERT INTO country VALUES (177, 'ტუნისი', NULL, NULL, NULL);
INSERT INTO country VALUES (178, 'უგანდა', NULL, NULL, NULL);
INSERT INTO country VALUES (179, 'უზბეკეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (180, 'უილისის კუნძულები', NULL, NULL, NULL);
INSERT INTO country VALUES (181, 'უკრაინა', NULL, NULL, NULL);
INSERT INTO country VALUES (182, 'უნგრეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (183, 'ურუგვაი', NULL, NULL, NULL);
INSERT INTO country VALUES (184, 'ფილიპინები', NULL, NULL, NULL);
INSERT INTO country VALUES (185, 'ფინეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (186, 'ფიჯი', NULL, NULL, NULL);
INSERT INTO country VALUES (187, 'ყაზახეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (188, 'ყირგიზეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (189, 'შვედეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (190, 'შვეიცარია', NULL, NULL, NULL);
INSERT INTO country VALUES (191, 'შრი-ლანკა', NULL, NULL, NULL);
INSERT INTO country VALUES (192, 'ჩადი', NULL, NULL, NULL);
INSERT INTO country VALUES (193, 'ჩეხეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (194, 'ჩილე', NULL, NULL, NULL);
INSERT INTO country VALUES (195, 'ჩინეთი', NULL, NULL, NULL);
INSERT INTO country VALUES (196, 'ცენტრ.აფრიკის.რესპუბ.', NULL, NULL, NULL);
INSERT INTO country VALUES (197, 'წმინდა ელენეს კუნძული', NULL, NULL, NULL);
INSERT INTO country VALUES (198, 'ხორვატია', NULL, NULL, NULL);
INSERT INTO country VALUES (199, 'ჯიბუტი', NULL, NULL, NULL);
INSERT INTO country VALUES (200, 'ჰაიტი', NULL, NULL, NULL);
INSERT INTO country VALUES (201, 'ჰონდურასი', NULL, NULL, NULL);
INSERT INTO country VALUES (202, 'ჰონკონგი', NULL, NULL, NULL);
INSERT INTO country VALUES (152, 'საქართველო', NULL, NULL, NULL);


--
-- Name: countryid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('countryid_seq', 202, true);


--
-- Data for Name: currency; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO currency VALUES (1, 'ლარი', 'GEL', true, '', 152, true);
INSERT INTO currency VALUES (2, 'US Dollar', 'USD', true, '$', 1, false);


--
-- Name: currencyid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('currencyid_seq', 2, true);


--
-- Data for Name: currencyrate; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO currencyrate VALUES (2, 2, '2014-08-13', 1.77000000000000002);
INSERT INTO currencyrate VALUES (3, 2, '2014-08-06', 2);


--
-- Name: currencyrateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('currencyrateid_seq', 3, true);


--
-- Data for Name: discount; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO discount VALUES (1, 'Dis C', 'ფასდაკლების ბარათი', true, true, NULL, true, true, 1, '2014-07-31 22:12:30.76196', true, false);
INSERT INTO discount VALUES (2, 'Zeb', 'კლუბის წევრი', true, false, 20, true, false, 1, '2014-08-14 19:49:01.654', true, false);
INSERT INTO discount VALUES (3, 'comp', 'Complementary', true, false, 100, true, false, 1, '2014-12-10 13:50:19.706', true, false);


--
-- Name: discountid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('discountid_seq', 3, true);


--
-- Data for Name: displaysettings; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO displaysettings VALUES (8, 1, 0, 0, 443, 2, 2, 0, 4, 2, 0, 1, 0, 0, '', 1, '2014-12-16 14:12:19.713', 'ინდექსი');


--
-- Name: displaysettingsid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('displaysettingsid_seq', 8, true);


--
-- Data for Name: district; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: districtid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('districtid_seq', 1, false);


--
-- Data for Name: extracharge; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO extracharge VALUES (1, 'რესტორანი', 'რესტორანი', 10, false, 1, 0, false, NULL, NULL, NULL, NULL, NULL, 1, '2014-08-14 16:41:41.867', true, false);
INSERT INTO extracharge VALUES (2, 'Ext.bad', 'დამატებითი საწოლი', 20, true, 2, 0, false, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-03 17:11:49.577', true, false);
INSERT INTO extracharge VALUES (3, 'MB', 'მინი ბარი', 0, false, 2, 0, false, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-03 17:14:10.558', true, false);
INSERT INTO extracharge VALUES (4, 'Misc', 'Miscellaneous', 0, false, 1, 0, false, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-10 14:01:56.212', true, false);
INSERT INTO extracharge VALUES (5, 'ტრანსპორტირება', 'ტრანსპორტირება', 0, false, 0, 0, false, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-15 12:53:52.006', false, false);


--
-- Data for Name: extrachargefolio; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO extrachargefolio VALUES (612, 2, 20, -1, 4, 1, 0, 1);
INSERT INTO extrachargefolio VALUES (613, 2, 20, -1, 4, 1, 0, 1);
INSERT INTO extrachargefolio VALUES (617, 2, 20, 1, 3, 1, 1, 0);
INSERT INTO extrachargefolio VALUES (631, 3, 20, -1, 4, 1, 0, 0);
INSERT INTO extrachargefolio VALUES (632, 3, 10, -1, 4, 1, 0, 5);
INSERT INTO extrachargefolio VALUES (633, 2, 10, -1, 4, 1, 0, 0);
INSERT INTO extrachargefolio VALUES (634, 1, 10, -1, 4, 1, 0, 0);


--
-- Name: extrachargeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('extrachargeid_seq', 5, true);


--
-- Data for Name: extrachargetax; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO extrachargetax VALUES (1, 1);


--
-- Data for Name: folio; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO folio VALUES (73, '73', 51, NULL, 93, 0, 1, '2015-01-05 14:57:12.802281');
INSERT INTO folio VALUES (74, '74', 52, NULL, 94, 0, 1, '2015-01-06 13:26:03.012421');
INSERT INTO folio VALUES (75, '75', 53, NULL, 95, 0, 1, '2015-01-06 15:28:22.533136');
INSERT INTO folio VALUES (76, '76', 54, NULL, 96, 0, 1, '2015-01-06 16:04:38.089131');
INSERT INTO folio VALUES (77, '77', 55, NULL, 97, 0, 1, '2015-01-06 17:07:07.892243');
INSERT INTO folio VALUES (78, '78', 56, NULL, 98, 0, 1, '2015-01-06 17:12:25.627054');


--
-- Name: folioid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('folioid_seq', 78, true);


--
-- Data for Name: folioitem; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO folioitem VALUES (833, 77, NULL, '2014-10-28', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (834, 77, NULL, '2014-10-28', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (835, 77, NULL, '2014-10-29', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (836, 77, NULL, '2014-10-29', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (837, 77, NULL, '2014-10-29', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (840, 77, NULL, '2014-10-30', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (853, 73, 11, '2014-10-25', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (768, 74, NULL, '2014-10-25', NULL, 2, 100, NULL, NULL, NULL, NULL, 34, false, true, 1, '2015-01-06 14:07:43.048469', '', true, NULL);
INSERT INTO folioitem VALUES (854, 73, NULL, '2014-10-25', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (855, 73, NULL, '2014-10-25', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (762, 74, 7, '2014-10-25', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 13:26:03.012421', '', false, NULL);
INSERT INTO folioitem VALUES (753, 73, 11, '2014-10-25', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-05 14:57:12.802281', '', false, NULL);
INSERT INTO folioitem VALUES (856, 73, 11, '2014-10-26', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (857, 73, NULL, '2014-10-26', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (858, 73, NULL, '2014-10-26', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (756, 73, 11, '2014-10-26', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-05 14:57:12.802281', '', false, NULL);
INSERT INTO folioitem VALUES (765, 74, 8, '2014-10-26', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 13:26:03.012421', '', false, NULL);
INSERT INTO folioitem VALUES (859, 73, 11, '2014-10-27', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (770, 75, NULL, '2014-10-27', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 15:28:22.533136', '', false, NULL);
INSERT INTO folioitem VALUES (771, 75, NULL, '2014-10-27', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 15:28:22.533136', '', false, NULL);
INSERT INTO folioitem VALUES (860, 73, NULL, '2014-10-27', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (861, 73, NULL, '2014-10-27', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (863, 73, NULL, '2014-10-28', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (864, 73, NULL, '2014-10-28', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (866, 73, NULL, '2014-10-29', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (867, 73, NULL, '2014-10-29', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (832, 77, 31, '2014-10-28', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (862, 73, 11, '2014-10-28', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (838, 77, 2, '2014-10-30', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (839, 77, NULL, '2014-10-30', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:07:07.892243', '', false, NULL);
INSERT INTO folioitem VALUES (759, 73, 11, '2014-10-27', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-05 14:57:12.802281', '', false, NULL);
INSERT INTO folioitem VALUES (772, 76, 28, '2014-10-27', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 16:04:38.089131', '', false, NULL);
INSERT INTO folioitem VALUES (769, 75, 30, '2014-10-27', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 15:28:22.533136', '', false, NULL);
INSERT INTO folioitem VALUES (872, 78, NULL, '2014-10-29', NULL, -1, 38.1355932203389827, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (873, 78, NULL, '2014-10-29', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (876, 78, NULL, '2014-10-30', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (879, 78, NULL, '2014-10-31', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (882, 78, NULL, '2014-11-01', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (865, 73, 11, '2014-10-29', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:09:00.284497', '', false, NULL);
INSERT INTO folioitem VALUES (871, 78, 19, '2014-10-29', NULL, 6, 211.86440677966101, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (874, 78, 18, '2014-10-30', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (875, 78, NULL, '2014-10-30', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (877, 78, 18, '2014-10-31', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (878, 78, NULL, '2014-10-31', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (880, 78, 18, '2014-11-01', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (881, 78, NULL, '2014-11-01', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:13:23.37221', '', false, NULL);
INSERT INTO folioitem VALUES (817, 76, 6, '2014-10-27', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (818, 76, NULL, '2014-10-27', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (819, 76, NULL, '2014-10-27', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (821, 76, NULL, '2014-10-28', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (822, 76, NULL, '2014-10-28', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (824, 76, NULL, '2014-10-29', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (825, 76, NULL, '2014-10-29', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (826, 76, 6, '2014-10-30', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (827, 76, NULL, '2014-10-30', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (828, 76, NULL, '2014-10-30', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (829, 76, 6, '2014-10-31', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (830, 76, NULL, '2014-10-31', NULL, -1, 28.2203389830508478, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (831, 76, NULL, '2014-10-31', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (820, 76, 6, '2014-10-28', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (850, 74, 8, '2014-10-28', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:08:52.927124', '', false, NULL);
INSERT INTO folioitem VALUES (883, 74, 8, '2014-10-25', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (884, 74, NULL, '2014-10-25', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (885, 74, NULL, '2014-10-25', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (886, 74, 8, '2014-10-26', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (887, 74, NULL, '2014-10-26', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (888, 74, NULL, '2014-10-26', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (889, 74, 8, '2014-10-27', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (890, 74, NULL, '2014-10-27', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (891, 74, NULL, '2014-10-27', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (892, 74, 8, '2014-10-28', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (893, 74, NULL, '2014-10-28', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (894, 74, NULL, '2014-10-28', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (896, 74, NULL, '2014-10-29', NULL, -1, 23.6440677966101696, NULL, NULL, NULL, 1, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (897, 74, NULL, '2014-10-29', NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, false, false, 1, '2015-01-06 17:14:01.476562', '', false, NULL);
INSERT INTO folioitem VALUES (823, 76, 6, '2014-10-29', NULL, 6, 156.779661016949149, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:02:29.734932', '', false, NULL);
INSERT INTO folioitem VALUES (895, 74, 8, '2014-10-29', NULL, 6, 131.355932203389841, NULL, NULL, NULL, NULL, NULL, false, true, 1, '2015-01-06 17:14:01.476562', '', false, NULL);


--
-- Name: folioitemid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('folioitemid_seq', 897, true);


--
-- Data for Name: guest; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO guest VALUES (10, 4, 'გიორგი', 'გიორგაძე', 0, NULL, '', 1, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-08-23 16:58:41.149579', false);
INSERT INTO guest VALUES (11, 4, 'გიორგაძე', 'გიორგი', 0, NULL, '', 1, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-11 13:50:57.880184', false);
INSERT INTO guest VALUES (12, 4, 'ბაბაიანცი', 'ელდარ', 0, NULL, '', 167, 'ყვარელი', '', 1, '33123413', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-16 13:33:16.858016', false);
INSERT INTO guest VALUES (13, 4, 'სიკრეტი', 'ვიკტორია', 0, NULL, '', 4, '', '', 1, '52345234', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-16 13:34:56.09775', false);
INSERT INTO guest VALUES (14, 4, 'უშანგი', 'გაბადაძე', 0, NULL, '', 9, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, 2, NULL, NULL, 1, '2014-09-16 13:50:46.167625', false);
INSERT INTO guest VALUES (15, 4, 'epremidze', 'giorgi', 0, NULL, '', 2, '', '', 1, '32412341', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-24 11:53:31.968186', false);
INSERT INTO guest VALUES (16, 4, 'anjafaridze', 'keti', 0, NULL, '', 2, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-24 11:57:08.406222', false);
INSERT INTO guest VALUES (17, 4, 'gulbani', 'zura', 0, NULL, '', 2, '', '', NULL, '334123413', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-29 15:02:20.417954', false);
INSERT INTO guest VALUES (18, 4, 'bolo', 'es', 0, NULL, '', 3, '', '', 1, '34134', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-29 16:52:22.74388', false);
INSERT INTO guest VALUES (19, 4, 'venaxi', 'vnaxot', 0, NULL, '', 8, '', '', 2, '432412', NULL, '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2014-09-29 17:41:50.318577', false);
INSERT INTO guest VALUES (20, 4, 'venaxi', 'axali', 0, NULL, '', 6, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, '2014-09-29 17:55:10.539561', false);
INSERT INTO guest VALUES (21, 4, '1', 'venaxi', 0, NULL, '', 4, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-29 18:10:06.938857', false);
INSERT INTO guest VALUES (22, 4, '3', 'venaxi', 0, NULL, '', 7, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-29 18:19:44.209193', false);
INSERT INTO guest VALUES (23, 4, '4', 'venaxi', 0, NULL, '', 10, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-09-29 18:20:47.908045', false);
INSERT INTO guest VALUES (24, 4, 'da', 'qeto', 0, NULL, '', 4, '', '', 1, '3241234123', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-10-16 17:30:28.041368', false);
INSERT INTO guest VALUES (25, 4, 'bal', 'bla', 0, NULL, '', 7, '', '', 2, '435243523', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-10-16 17:52:09.607856', false);
INSERT INTO guest VALUES (26, 4, 'gena', 'matrosovi', 0, NULL, '', 4, '', '', 1, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-10-25 16:51:57.139244', false);
INSERT INTO guest VALUES (27, 4, 'stumari1', 'axali', 0, NULL, '', 47, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-11-17 18:48:26.225', false);
INSERT INTO guest VALUES (28, 4, 'rezervacia', 'axali', 0, NULL, '', 2, '', '', 1, '31231231', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-11-26 19:17:24.579', false);
INSERT INTO guest VALUES (30, 4, 'erti', 'daudasturebeli', 0, NULL, '', 1, '', '', 1, '3214123423', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-11-26 19:29:26.993', false);
INSERT INTO guest VALUES (31, 4, 'rfsd', 'rgdsfgsdfg', 0, NULL, '', 5, '', '', 1, '32412341', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-11-26 19:30:44.126', false);
INSERT INTO guest VALUES (32, 4, 'asdasdasdasdasdasda', 'dasd', 0, 0, 'dasdasdasdaá¡áá®ááá  ááá¡ááás', 6, 'dasda', '12312', 1, 'dasda', 1, '31231321', '312312', 'eqweqw', 'aa@sdasda.ge', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2014-11-26 19:45:51.856', false);
INSERT INTO guest VALUES (33, 4, 'dasdas', 'asd', 0, 0, 'dasdas', 7, 'edas', '123', 1, '31231', 2, '', '', '', '', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2014-11-26 19:47:58.405', false);
INSERT INTO guest VALUES (34, 4, 'vai', 'vai', 0, NULL, '', 2, '', '', 1, '2312342314213', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-11-26 20:56:20.499', false);
INSERT INTO guest VALUES (29, 4, 'res', 'daudasturebeli', 0, 0, '', 2, '', '', 1, '4231432141', 2, '', '', '', '', NULL, NULL, NULL, 1, NULL, NULL, NULL, 201, '2014-11-26 19:23:05.653', false);
INSERT INTO guest VALUES (35, 4, 'dsafsa', 'sdfcaxd', 0, NULL, '', 6, '', '', 1, '342324323423', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-10 12:13:49.956202', false);
INSERT INTO guest VALUES (36, 4, 'fgsfdg', 'sdgf', 0, NULL, '', 4, '', '', 1, '45234523', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-10 13:36:58.230457', false);
INSERT INTO guest VALUES (37, 4, 'ggggg', 'gggggg', 0, NULL, '', 5, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-14 15:37:46.302674', false);
INSERT INTO guest VALUES (38, 4, 'fffffff', 'ffff', 0, NULL, '', 9, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-14 17:27:10.398219', false);
INSERT INTO guest VALUES (39, 4, 'hhhhh', 'hhhhh', 0, NULL, '', 3, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-15 11:32:58.000239', false);
INSERT INTO guest VALUES (40, 4, 'jkjkjk', 'mmmm', 0, NULL, '', 6, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-15 12:32:48.859038', false);
INSERT INTO guest VALUES (41, 4, 'bunturi', 'Tamo', 0, 1, '', 2, '', '', 1, '232565655', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-15 15:30:35.682852', false);
INSERT INTO guest VALUES (42, 4, 'bunturi', 'tamo', 0, 1, '', 2, '', '', 1, '23256898', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-15 15:53:15.602086', false);
INSERT INTO guest VALUES (44, 4, 'metreveli', 'aleqs', 0, 0, '', 2, '', '', 1, '235689', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-15 16:35:53.356757', false);
INSERT INTO guest VALUES (45, 4, 'fffff', 'fffff', 0, NULL, '', 6, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-19 10:29:16.5794', false);
INSERT INTO guest VALUES (46, 4, 'hhhhh', 'hhhh', 0, NULL, '', 5, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-25 13:55:16.791329', false);
INSERT INTO guest VALUES (47, 4, 'new', 'new', 0, NULL, '', 4, '', '', 1, '312321312', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2014-12-29 17:09:21.963571', false);
INSERT INTO guest VALUES (48, 4, 'Elman', 'Ad', 0, NULL, '', 5, '', '', NULL, '', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 201, '2014-12-31 12:51:31.342227', false);
INSERT INTO guest VALUES (49, 4, 'vigaca', 'ragaca', 0, 0, '', 3, '', '', 2, '4231413412', 1, '', '', '', '', NULL, NULL, NULL, 1, NULL, NULL, NULL, 1, '2015-01-05 13:48:29.107166', false);
INSERT INTO guest VALUES (50, 4, 'გიორგი', 'ალხანიშვილი', 0, NULL, '', 6, '', '', 1, '34123412341', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-05 13:57:00.162796', false);
INSERT INTO guest VALUES (51, 4, 'indigo', 'tordia', 0, NULL, '', 5, '', '', 1, '34242342', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-05 14:57:12.802281', false);
INSERT INTO guest VALUES (52, 4, 'santa', 'klausi', 0, NULL, '', 2, '', '', 1, '3412341', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-06 13:26:03.012421', false);
INSERT INTO guest VALUES (53, 4, 'axali', 'pingvini', 0, NULL, '', 2, '', '', 1, '43523452', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-06 15:28:22.533136', false);
INSERT INTO guest VALUES (54, 4, 'aba', 'venaxi', 0, NULL, '', 2, '', '', 1, '412341234', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-06 16:04:38.089131', false);
INSERT INTO guest VALUES (55, 4, 'baba', 'anci', 0, NULL, '', 5, '', '', 1, '41234123', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-06 17:07:07.892243', false);
INSERT INTO guest VALUES (56, 4, 'dafsd', 'dfdsa', 0, NULL, '', 4, '', '', 2, '341231', NULL, '', '', '', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '2015-01-06 17:12:25.627054', false);


--
-- Name: guestid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('guestid_seq', 56, true);


--
-- Data for Name: hotel; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO hotel VALUES (1, 'თბილისი ლაერტონი', 'ელიკო ქურხულის ქ. #14', '', 152, 'თბილისი', '0102', '+99532', '+99532', '', 'info@laerton-hotel.com', 'სასტუმრო', '', 'laerton-hotel.com', 4, '205267584', '', '', '', NULL);


--
-- Name: hotelid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('hotelid_seq', 1, true);


--
-- Data for Name: housekeepingstatus; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: housekeepingstatusid_; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('housekeepingstatusid_', 1, false);


--
-- Data for Name: houseunit; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: houseunitid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('houseunitid_seq', 1, false);


--
-- Data for Name: idtype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO idtype VALUES (1, 'პასპორტი', true, false);
INSERT INTO idtype VALUES (2, 'პირადობის მოწმობა', true, false);


--
-- Name: idtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('idtypeid_seq', 2, true);


--
-- Data for Name: market; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: marketid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('marketid_seq', 1, false);


--
-- Data for Name: menu; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO menu VALUES (2, 'მენიუ', 'menu', 1, 2);
INSERT INTO menu VALUES (4, 'ოთახები', '', NULL, 1);
INSERT INTO menu VALUES (5, 'ტარიფები', '', NULL, 2);
INSERT INTO menu VALUES (6, 'დალაგება', '', NULL, 3);
INSERT INTO menu VALUES (7, 'პარამეტრები', '', NULL, 5);
INSERT INTO menu VALUES (1, 'ადმინისტრირება', '', NULL, 4);
INSERT INTO menu VALUES (8, 'ვები', '', NULL, 6);
INSERT INTO menu VALUES (16, 'სეზონები', 'seasonview', 5, 2);
INSERT INTO menu VALUES (19, 'დასალაგებელი ადგილები', 'units', 6, 1);
INSERT INTO menu VALUES (20, 'სტატუსები', 'hstatus', 6, 2);
INSERT INTO menu VALUES (21, 'მომხმარებლის ტიპები', 'personneltype', 1, 3);
INSERT INTO menu VALUES (22, 'თანამშრომლები', 'personnel', 1, 4);
INSERT INTO menu VALUES (23, 'მთავარი', '', 1, 5);
INSERT INTO menu VALUES (24, 'ელფოსტის შაბლონები', '', 1, 6);
INSERT INTO menu VALUES (25, 'უპირატესობები', '', 1, 7);
INSERT INTO menu VALUES (26, 'მიზეზები', 'reazons', 1, 8);
INSERT INTO menu VALUES (27, 'მარკეტინგი', 'marketing', 1, 9);
INSERT INTO menu VALUES (28, 'სხვა', 'adminother', 1, 10);
INSERT INTO menu VALUES (3, 'ფუნქციები', 'level', 1, 1);
INSERT INTO menu VALUES (9, 'კეთილმოწყობები', 'amenityview', 4, 1);
INSERT INTO menu VALUES (10, 'ოთახის ტიპები', 'roomtypeview', 4, 2);
INSERT INTO menu VALUES (55, 'ეკრანის პარამეტრები', 'displaysettings', 48, 1);
INSERT INTO menu VALUES (47, 'ზოგადი ინფორმაცია', '', 7, 1);
INSERT INTO menu VALUES (48, 'მთავარი', '', 7, 2);
INSERT INTO menu VALUES (13, 'სტატუსის ფერი', 'statuscolorview', 4, 5);
INSERT INTO menu VALUES (51, 'სხვა', 'othersettings', 7, 5);
INSERT INTO menu VALUES (17, 'ოთახის ფასები', 'roomrateview', 5, 3);
INSERT INTO menu VALUES (34, 'ტრანსპორტის სახეობა', 'transportationmodeview', 23, 6);
INSERT INTO menu VALUES (35, 'გასავლის ტიპები', 'payoutview', 23, 7);
INSERT INTO menu VALUES (38, 'ელ-ფოსტის კატეგორიები', 'templatecategoryview', 24, 1);
INSERT INTO menu VALUES (39, 'შაბლონები', 'templateview', 24, 2);
INSERT INTO menu VALUES (45, 'ბიზნეს წყაროები', 'bsourceview', 27, 2);
INSERT INTO menu VALUES (11, 'საწოლის ტიპები', 'bedtypeview', 4, 3);
INSERT INTO menu VALUES (14, 'ოთახის მფლობელი', 'contragentview', 4, 6);
INSERT INTO menu VALUES (12, 'ოთახები', 'roomview', 4, 4);
INSERT INTO menu VALUES (15, 'ტარიფის ტიპი', 'ratetypeview', 5, 1);
INSERT INTO menu VALUES (18, 'გადასახადები', 'taxview', 5, 4);
INSERT INTO menu VALUES (29, 'ვალუტა', 'currencyview', 23, 1);
INSERT INTO menu VALUES (30, 'გადახდის მეთოდები', 'paymentmethodview', 23, 2);
INSERT INTO menu VALUES (31, 'დამატებითი სერვისები', 'extrachargeview', 23, 3);
INSERT INTO menu VALUES (32, 'ფასდაკლება', 'discountview', 23, 4);
INSERT INTO menu VALUES (33, 'საბუთის ტიპი', 'idtypeview', 23, 5);
INSERT INTO menu VALUES (36, 'რეზერვაციის ტიპები', 'reservationtypeview', 23, 8);
INSERT INTO menu VALUES (37, 'Vip სტატუსები', 'vipstatusview', 23, 9);
INSERT INTO menu VALUES (44, 'სეგმენტები', 'marketview', 27, 1);
INSERT INTO menu VALUES (52, 'სასტუმროს ინფორმაცია', 'hotelview', 47, 1);
INSERT INTO menu VALUES (43, 'შაცი სიის მიზეზები', 'blacklistreasonview', 26, 2);
INSERT INTO menu VALUES (46, 'არდადეგები', 'holidaysview', 28, 1);
INSERT INTO menu VALUES (40, 'უპირატესობების ტიპები', 'preferencetypeview', 25, 1);
INSERT INTO menu VALUES (54, 'დაბეგვრის პარამეტრები', 'taxaccountconfigview', 47, 3);
INSERT INTO menu VALUES (41, 'უპირატესობები', 'preferenceview', 25, 2);
INSERT INTO menu VALUES (58, 'ცხრილების ნუმერაცია', 'paiginationsettingsview', 48, 4);
INSERT INTO menu VALUES (59, 'საბუთების ნუმერაცია', 'documentnumberingview', 48, 5);
INSERT INTO menu VALUES (49, 'ფორმულა', 'formulaview', 7, 3);
INSERT INTO menu VALUES (50, 'შენიშვნები', 'noticeview', 7, 4);
INSERT INTO menu VALUES (60, 'თარგმანი', 'translationview', 51, 1);
INSERT INTO menu VALUES (42, 'მიზეზები', 'reasonview', 26, 1);
INSERT INTO menu VALUES (56, 'ბეჭდვის და ელ-ფოსტის პარამეტრები', 'checkinemailparams', 48, 2);
INSERT INTO menu VALUES (53, 'ელ ფოსტა', 'params_mail', 47, 2);
INSERT INTO menu VALUES (57, 'მიღების და რეზერვაციის პარამეტრები', 'checkinreservationsettings', 48, 3);


--
-- Name: menuid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('menuid_seq', 60, true);


--
-- Data for Name: nationality; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO nationality VALUES (1, 'სომეხი');


--
-- Name: nationalityid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('nationalityid_seq', 1, true);


--
-- Data for Name: ordermain; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: payment; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO payment VALUES (34, 1, 1, 100, '2014-10-25', 74, '', NULL, false, 1, '2015-01-06 14:07:43.048469');


--
-- Name: paymentid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('paymentid_seq', 34, true);


--
-- Data for Name: paymentmethod; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO paymentmethod VALUES (1, 'Cash', 'Cash', 0, false, 0, NULL, NULL, NULL, 1, '2014-08-14 14:07:34.243', true, false);
INSERT INTO paymentmethod VALUES (3, 'TBC ბანკი POS', 'TBCpos', 1, true, 1, NULL, NULL, NULL, 1, '2014-12-03 17:45:05.693', true, false);
INSERT INTO paymentmethod VALUES (4, 'BOG POS', 'BOGPos', 1, false, 0, NULL, NULL, NULL, 1, '2014-12-03 17:45:52.563', true, false);


--
-- Name: paymentmethodid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('paymentmethodid_seq', 4, true);


--
-- Data for Name: payout; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO payout VALUES (1, 'აგენტის საკომისიო', 1, '2014-08-14 16:36:47.53', true, false);


--
-- Name: payoutid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('payoutid_seq', 1, true);


--
-- Name: personelltypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personelltypeid_seq', 4, true);


--
-- Data for Name: personnel; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO personnel VALUES (1, 'ადმინისტრატორი', 'სისტემის', NULL, 1, 'admin', '123', NULL, NULL, '2012-06-04 09:34:04.846837', false, NULL, '2013-08-26 16:23:53.573921');
INSERT INTO personnel VALUES (201, 'ინგა', 'ბაგალიშვილი', '', 1, 'i.bagalishvili', 'frontdesk', NULL, '', '2014-12-02 17:26:13.59851', false, NULL, '2014-12-02 17:26:13.59851');
INSERT INTO personnel VALUES (202, 'მელინდა', 'როლდან', '555429232', 4, 'm.roldan', '1234', NULL, '', '2014-12-15 13:31:38.630457', false, NULL, '2014-12-15 13:31:38.630457');
INSERT INTO personnel VALUES (203, 'მარია', 'ჯმაჯიანი', '571440614', 4, 'm.jmajyan', '1234', NULL, '', '2014-12-15 13:32:58.040826', false, NULL, '2014-12-15 13:32:58.040826');
INSERT INTO personnel VALUES (204, 'თამარ', 'ბუნტური', '596061188', 4, 't.bunturi', '1234', NULL, '', '2014-12-15 13:37:19.75881', false, NULL, '2014-12-15 13:37:19.75881');
INSERT INTO personnel VALUES (205, 'დიანა', 'გელაშვილი', '551001051', 4, 'd.gelashvili', '1234', NULL, '', '2014-12-15 13:37:59.723241', false, NULL, '2014-12-15 13:37:59.723241');


--
-- Name: personnelid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personnelid_seq', 205, true);


--
-- Data for Name: personneltype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO personneltype VALUES (1, 'მთავარი ადმინისტრატორი', '', '00', false);
INSERT INTO personneltype VALUES (2, 'დამლაგებელი', '', '01', false);
INSERT INTO personneltype VALUES (3, 'მენეჯერი', '', '02', false);
INSERT INTO personneltype VALUES (4, 'ადმინისტრატორი', '', '01', false);


--
-- Name: personneltypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('personneltypeid_seq', 1, true);


--
-- Data for Name: plevel; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO plevel VALUES (2, 1, 3, true, true);
INSERT INTO plevel VALUES (3, 1, 9, true, true);
INSERT INTO plevel VALUES (4, 1, 10, true, true);
INSERT INTO plevel VALUES (5, 1, 11, true, true);
INSERT INTO plevel VALUES (6, 1, 12, true, true);
INSERT INTO plevel VALUES (7, 1, 13, true, true);
INSERT INTO plevel VALUES (8, 1, 15, true, true);
INSERT INTO plevel VALUES (9, 1, 14, true, true);
INSERT INTO plevel VALUES (10, 1, 16, true, true);
INSERT INTO plevel VALUES (11, 1, 17, true, true);
INSERT INTO plevel VALUES (12, 1, 18, true, true);
INSERT INTO plevel VALUES (13, 1, 19, true, true);
INSERT INTO plevel VALUES (14, 1, 20, true, true);
INSERT INTO plevel VALUES (15, 1, 21, true, true);
INSERT INTO plevel VALUES (16, 1, 22, true, true);
INSERT INTO plevel VALUES (17, 1, 23, true, true);
INSERT INTO plevel VALUES (18, 1, 24, true, true);
INSERT INTO plevel VALUES (19, 1, 25, true, true);
INSERT INTO plevel VALUES (20, 1, 26, true, true);
INSERT INTO plevel VALUES (21, 1, 27, true, true);
INSERT INTO plevel VALUES (22, 1, 31, true, true);
INSERT INTO plevel VALUES (23, 1, 30, true, true);
INSERT INTO plevel VALUES (24, 1, 29, true, true);
INSERT INTO plevel VALUES (25, 1, 28, true, true);
INSERT INTO plevel VALUES (26, 1, 32, true, true);
INSERT INTO plevel VALUES (27, 1, 33, true, true);
INSERT INTO plevel VALUES (28, 1, 34, true, true);
INSERT INTO plevel VALUES (29, 1, 35, true, true);
INSERT INTO plevel VALUES (30, 1, 36, true, true);
INSERT INTO plevel VALUES (31, 1, 37, true, true);
INSERT INTO plevel VALUES (32, 1, 38, true, true);
INSERT INTO plevel VALUES (33, 1, 39, true, true);
INSERT INTO plevel VALUES (34, 1, 40, true, true);
INSERT INTO plevel VALUES (35, 1, 41, true, true);
INSERT INTO plevel VALUES (36, 1, 42, true, true);
INSERT INTO plevel VALUES (37, 1, 43, true, true);
INSERT INTO plevel VALUES (38, 1, 44, true, true);
INSERT INTO plevel VALUES (39, 1, 45, true, true);
INSERT INTO plevel VALUES (40, 1, 46, true, true);
INSERT INTO plevel VALUES (41, 1, 47, true, true);
INSERT INTO plevel VALUES (42, 1, 48, true, true);
INSERT INTO plevel VALUES (43, 1, 49, true, true);
INSERT INTO plevel VALUES (44, 1, 50, true, true);
INSERT INTO plevel VALUES (45, 1, 51, true, true);
INSERT INTO plevel VALUES (46, 1, 54, true, true);
INSERT INTO plevel VALUES (47, 1, 52, true, true);
INSERT INTO plevel VALUES (48, 1, 53, true, true);
INSERT INTO plevel VALUES (49, 1, 55, true, true);
INSERT INTO plevel VALUES (50, 1, 56, true, true);
INSERT INTO plevel VALUES (51, 1, 57, true, true);
INSERT INTO plevel VALUES (52, 1, 58, true, true);
INSERT INTO plevel VALUES (53, 1, 59, true, true);
INSERT INTO plevel VALUES (54, 1, 60, true, true);
INSERT INTO plevel VALUES (56, 1, 2, true, true);
INSERT INTO plevel VALUES (75, 4, 2, true, true);
INSERT INTO plevel VALUES (76, 4, 21, true, true);
INSERT INTO plevel VALUES (80, 4, 13, true, true);


--
-- Name: plevelid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('plevelid_seq', 80, true);


--
-- Data for Name: preference; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO preference VALUES (1, 'ხედი ოკიანეზე', 2, 1, '2014-08-14 19:57:15.054', true, false);
INSERT INTO preference VALUES (2, 'აივანი', 2, 1, '2014-08-14 19:57:30.074', true, false);


--
-- Name: preferenceid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('preferenceid_seq', 2, true);


--
-- Data for Name: preferencetype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO preferencetype VALUES (1, 'სასტუმროს უპირატესობები', 1, '2014-08-14 19:54:43.941', true, false);
INSERT INTO preferencetype VALUES (2, 'ოთახის უპირატესობები', 1, '2014-08-14 19:55:06.709', true, false);


--
-- Name: preferencetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('preferencetypeid_seq', 3, true);


--
-- Data for Name: ratetype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO ratetype VALUES (1, 'Gn', 'General', 1, '2014-12-16 13:11:08.487', true, 1, false);
INSERT INTO ratetype VALUES (2, 'Db.Ocp', 'ორადგილიანი ტარიფი', 1, '2014-12-16 13:12:20.696', false, 2, false);
INSERT INTO ratetype VALUES (4, 'Quadruple', 'ოთხადგილიანი', 1, '2014-12-16 13:12:55.76', false, 4, false);
INSERT INTO ratetype VALUES (3, 'Triple', 'სამადგილიანი ტარიფი', 1, '2014-12-16 13:13:00.799', false, 3, false);


--
-- Name: ratetypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('ratetypeid_seq', 4, true);


--
-- Data for Name: ratetyperoomtype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO ratetyperoomtype VALUES (1, 1);
INSERT INTO ratetyperoomtype VALUES (1, 4);
INSERT INTO ratetyperoomtype VALUES (1, 3);
INSERT INTO ratetyperoomtype VALUES (1, 2);
INSERT INTO ratetyperoomtype VALUES (1, 6);
INSERT INTO ratetyperoomtype VALUES (1, 5);
INSERT INTO ratetyperoomtype VALUES (1, 8);
INSERT INTO ratetyperoomtype VALUES (1, 7);


--
-- Data for Name: reason; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO reason VALUES (5, 'shetyobineba', 3, 1, '2014-12-29 16:52:10.417036', true, false);
INSERT INTO reason VALUES (6, 'djhgchjc', 2, 1, '2014-12-29 17:07:48.163704', true, false);
INSERT INTO reason VALUES (7, 'asdasda', 3, 1, '2014-12-29 17:08:42.285459', true, false);
INSERT INTO reason VALUES (8, 'dafsdfa', 2, 1, '2014-12-29 21:34:11.188251', true, false);
INSERT INTO reason VALUES (9, 'sdafasd', 2, 1, '2014-12-29 21:34:56.656888', true, false);


--
-- Name: reasonid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reasonid_seq', 9, true);


--
-- Data for Name: region; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: regionid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('regionid_seq', 1, false);


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO reservation VALUES (122, '2014-10-27 15:27:00', '2014-11-01 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-06 15:28:22.533136', NULL, '1', false, false, NULL, -1);
INSERT INTO reservation VALUES (123, '2014-10-27 16:03:00', '2014-11-01 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-06 16:04:38.089131', NULL, '1', false, false, NULL, -1);
INSERT INTO reservation VALUES (124, '2014-10-28 17:06:00', '2014-10-31 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-06 17:07:07.892243', NULL, '1', false, false, NULL, -1);
INSERT INTO reservation VALUES (120, '2014-10-25 14:56:00', '2014-10-30 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-05 14:57:12.802281', NULL, '1', false, false, NULL, -1);
INSERT INTO reservation VALUES (125, '2014-10-29 17:12:00', '2014-11-02 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 1, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-06 17:12:25.627054', NULL, '1', false, false, NULL, -1);
INSERT INTO reservation VALUES (121, '2014-10-25 13:24:00', '2014-10-30 12:12:00', 1, 0, NULL, NULL, 2, '', 0, 4, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, '', NULL, NULL, 1, '2015-01-06 13:26:03.012421', NULL, '1', false, false, NULL, -1);


--
-- Name: reservationid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationid_seq', 125, true);


--
-- Data for Name: reservationreason; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: reservationroom; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO reservationroom VALUES (93, 120, 11, true, 1, 0, 1, 51, 1, '2015-01-05 14:57:12.802281', 1);
INSERT INTO reservationroom VALUES (94, 121, 8, true, 1, 0, 1, 52, 1, '2015-01-06 13:26:03.012421', 4);
INSERT INTO reservationroom VALUES (95, 122, 30, true, 1, 0, 1, 53, 1, '2015-01-06 15:28:22.533136', 3);
INSERT INTO reservationroom VALUES (96, 123, 6, true, 1, 0, 1, 54, 1, '2015-01-06 16:04:38.089131', 1);
INSERT INTO reservationroom VALUES (97, 124, 2, true, 1, 0, 1, 55, 1, '2015-01-06 17:07:07.892243', 1);
INSERT INTO reservationroom VALUES (98, 125, 18, true, 1, 0, 1, 56, 1, '2015-01-06 17:12:25.627054', 4);


--
-- Name: reservationroomid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationroomid_seq', 98, true);


--
-- Data for Name: reservationtype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO reservationtype VALUES (3, 'ჯავშნის მოთხოვნა', false, NULL, 1, '2014-08-14 16:56:00.634', true);
INSERT INTO reservationtype VALUES (1, 'დადასტურებული რეზერვაცია', true, '#34c0c7', 1, '2014-08-02 16:47:12.94876', true);
INSERT INTO reservationtype VALUES (2, 'დაუდასტურებელი რეზერვაცია', false, '#c72020', 1, '2014-08-14 20:05:40.024', true);


--
-- Name: reservationtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('reservationtypeid_seq', 3, true);


--
-- Data for Name: room; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO room VALUES (15, '401', '401', 8, 6, '401', '401', 14, true, 1, '2014-12-17 20:11:02.079', true, false);
INSERT INTO room VALUES (16, '402', '402', 1, 6, '402', '402', 15, true, 1, '2014-12-17 20:11:08.606', true, false);
INSERT INTO room VALUES (17, '403', '403', 1, 6, '403', '403', 16, true, 1, '2014-12-17 20:11:16.014', true, false);
INSERT INTO room VALUES (18, '404', '404', 4, 6, '404', '404', 17, true, 1, '2014-12-17 20:11:30.807', true, false);
INSERT INTO room VALUES (19, '405', '405', 5, 6, '405', '405', 18, true, 1, '2014-12-17 20:11:42.327', true, false);
INSERT INTO room VALUES (20, '406', '406', 1, 6, '406', '406', 19, true, 1, '2014-12-17 20:11:49.747', true, false);
INSERT INTO room VALUES (21, '407', '407', 1, 6, '407', '407', 20, true, 1, '2014-12-17 20:11:57.439', true, false);
INSERT INTO room VALUES (22, '408', '408', 1, 6, '408', '408', 21, true, 1, '2014-12-17 20:12:10.685', true, false);
INSERT INTO room VALUES (23, '409', '409', 1, 6, '409', '409', 22, true, 1, '2014-12-17 20:12:19.013', true, false);
INSERT INTO room VALUES (24, '410', '410', 7, 6, '410', '410', 23, true, 1, '2014-12-17 20:12:26.551', true, false);
INSERT INTO room VALUES (25, '501', '501', 1, 6, '501', '501', 24, true, 1, '2014-12-17 20:12:37.235', true, false);
INSERT INTO room VALUES (26, '502', '502', 1, 6, '502', '502', 25, true, 1, '2014-12-17 20:12:45.052', true, false);
INSERT INTO room VALUES (27, '503', '503', 1, 6, '503', '503', 26, true, 1, '2014-12-17 20:12:51.718', true, false);
INSERT INTO room VALUES (28, '504', '504', 3, 6, '504', '504', 27, true, 1, '2014-12-17 20:12:59.461', true, false);
INSERT INTO room VALUES (29, '505', '505', 2, 6, '505', '505', 28, true, 1, '2014-12-17 20:13:06.072', true, false);
INSERT INTO room VALUES (30, '506', '506', 3, 6, '506', '506', 29, true, 1, '2014-12-17 20:13:12.693', true, false);
INSERT INTO room VALUES (31, '507', '507', 3, 6, '507', '507', 30, true, 1, '2014-12-17 20:13:20.379', true, false);
INSERT INTO room VALUES (32, '508', '508', 3, 6, '508', '508', 31, true, 1, '2014-12-17 20:13:27.775', true, false);
INSERT INTO room VALUES (33, '509', '509', 1, 6, '509', '509', 32, true, 1, '2014-12-17 20:13:34.868', true, false);
INSERT INTO room VALUES (34, '601', '601', 7, 6, '601', '601', 33, true, 1, '2014-12-17 20:13:41.242', true, false);
INSERT INTO room VALUES (35, '602', '602', 7, 6, '602', '602', 34, true, 1, '2014-12-17 20:13:49.031', true, false);
INSERT INTO room VALUES (36, '201', '201', 1, 6, '201', '201', 1, true, 1, '2014-12-16 15:03:45.65', true, false);
INSERT INTO room VALUES (1, '202', '202', 1, 6, '202', '202', 2, true, 1, '2014-12-16 15:04:11.306', true, false);
INSERT INTO room VALUES (2, '203', '203', 1, 6, '203', '203', 3, true, 1, '2014-12-16 15:04:41.317', true, false);
INSERT INTO room VALUES (5, '301', '301', 6, 6, '301', '301', 4, true, 1, '2014-12-16 15:29:39.414', true, false);
INSERT INTO room VALUES (6, '302', '302', 1, 6, '302', '302', 5, true, 1, '2014-12-16 15:30:03.013', true, false);
INSERT INTO room VALUES (7, '303', '303', 1, 6, '303', '303', 6, true, 1, '2014-12-16 15:30:22.799', true, false);
INSERT INTO room VALUES (8, '304', '304', 4, 6, '304', '304', 7, true, 1, '2014-12-16 15:30:33.331', true, false);
INSERT INTO room VALUES (9, '305', '305', 5, 6, '305', '305', 8, true, 1, '2014-12-17 20:09:57.765', true, false);
INSERT INTO room VALUES (10, '306', '306', 1, 6, '306', '306', 9, true, 1, '2014-12-17 20:10:14.254', true, false);
INSERT INTO room VALUES (11, '307', '307', 1, 6, '307', '307', 10, true, 1, '2014-12-17 20:10:30.715', true, false);
INSERT INTO room VALUES (12, '308', '308', 1, 6, '308', '308', 11, true, 1, '2014-12-17 20:10:41.139', true, false);
INSERT INTO room VALUES (13, '309', '309', 1, 6, '309', '309', 12, true, 1, '2014-12-17 20:10:47.687', true, false);
INSERT INTO room VALUES (14, '310', '310', 7, 6, '310', '310', 13, true, 1, '2014-12-17 20:10:54.279', true, false);


--
-- Name: roomid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomid_seq', 36, true);


--
-- Data for Name: roomimage; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO roomimage VALUES (2, 2, 'gallery/1407578981669_1__family-hotel-room-hotel-rooms-arrowwood-resort-hotel-in1200-x-817-924-kb-jpeg-x.jpg', 1, '2014-08-09 14:09:41.775519', true);
INSERT INTO roomimage VALUES (3, 1, 'gallery/1407579023581_1__family-hotel-room-hotel-rooms-arrowwood-resort-hotel-in1200-x-817-924-kb-jpeg-x.jpg', 1, '2014-08-09 14:10:23.666848', true);


--
-- Name: roomimageid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomimageid_seq', 3, true);


--
-- Data for Name: roomownerroom; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: roomrate; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO roomrate VALUES (19, 1, 1, 0, true, 60, 30, 15, 1, 0);
INSERT INTO roomrate VALUES (23, 5, 1, 0, true, 50, 0, 0, 1, 0);
INSERT INTO roomrate VALUES (24, 5, 2, 0, false, 20, 0, 0, 1, 0);
INSERT INTO roomrate VALUES (25, 5, 2, 0, false, 15, 0, 0, 4, 0);
INSERT INTO roomrate VALUES (27, 5, 1, 0, false, 5, 0, 0, 4, 0);
INSERT INTO roomrate VALUES (52, 1, 2, 0, false, 40, 10, 5, 1, 0);
INSERT INTO roomrate VALUES (59, 4, 0, 0, true, 85, 20, 20, 2, 0);
INSERT INTO roomrate VALUES (60, 4, 0, 0, true, 85, 20, 20, 3, 0);
INSERT INTO roomrate VALUES (61, 3, 0, 0, true, 85, 20, 20, 4, 0);
INSERT INTO roomrate VALUES (63, 3, 0, 0, true, 85, 20, 20, 3, 0);
INSERT INTO roomrate VALUES (67, 1, 0, 0, true, 100, 25, 25, 4, 0);
INSERT INTO roomrate VALUES (68, 1, 0, 0, true, 100, 25, 25, 3, 0);
INSERT INTO roomrate VALUES (70, 1, 0, 0, true, 100, 25, 25, 2, 0);
INSERT INTO roomrate VALUES (71, 5, 0, 0, true, 135, 30, 30, 4, 0);
INSERT INTO roomrate VALUES (72, 5, 0, 0, true, 135, 30, 30, 3, 0);
INSERT INTO roomrate VALUES (74, 5, 0, 0, true, 135, 30, 30, 2, 0);
INSERT INTO roomrate VALUES (75, 2, 0, 0, true, 135, 30, 30, 2, 0);
INSERT INTO roomrate VALUES (78, 2, 0, 0, true, 135, 30, 30, 3, 0);
INSERT INTO roomrate VALUES (79, 2, 0, 0, true, 135, 30, 30, 4, 0);
INSERT INTO roomrate VALUES (80, 3, 0, 0, true, 85, 20, 20, 2, 0);
INSERT INTO roomrate VALUES (81, 4, 0, 0, true, 85, 20, 20, 4, 0);
INSERT INTO roomrate VALUES (83, 4, 0, 0, true, 155, 40, 0, 1, 0);
INSERT INTO roomrate VALUES (96, 3, 0, 0, true, 155, 40, 0, 1, 0);
INSERT INTO roomrate VALUES (98, 7, 0, 0, true, 205, 40, 0, 1, 0);
INSERT INTO roomrate VALUES (99, 8, 0, 0, true, 250, 55, 0, 1, 0);
INSERT INTO roomrate VALUES (100, 6, 0, 0, true, 250, 55, 0, 1, 0);
INSERT INTO roomrate VALUES (101, 5, 0, 0, true, 250, 55, 0, 1, 0);
INSERT INTO roomrate VALUES (103, 2, 0, 0, true, 250, 55, 0, 1, 0);
INSERT INTO roomrate VALUES (104, 1, 0, 0, true, 185, 40, 0, 1, 0);


--
-- Name: roomrateid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomrateid_seq', 104, true);


--
-- Data for Name: roomst; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO roomst VALUES (91, 29, '2014-10-25 00:00:00', 0, 1, '2015-01-05 15:08:38.779134');
INSERT INTO roomst VALUES (92, 36, '2014-10-25 00:00:00', 0, 1, '2015-01-05 15:18:37.702121');
INSERT INTO roomst VALUES (93, 9, '2014-10-25 00:00:00', 0, 1, '2015-01-05 15:20:44.636316');
INSERT INTO roomst VALUES (94, 1, '2014-10-25 00:00:00', 0, 1, '2015-01-05 15:22:50.278154');
INSERT INTO roomst VALUES (98, 1, '2014-10-25 00:00:00', 1, 1, '2015-01-05 15:32:52.857243');
INSERT INTO roomst VALUES (99, 14, '2014-10-25 00:00:00', 8, 1, '2015-01-05 15:32:52.857243');
INSERT INTO roomst VALUES (100, 14, '2014-10-25 00:00:00', 8, 1, '2015-01-05 15:33:44.185198');
INSERT INTO roomst VALUES (101, 8, '2014-10-25 00:00:00', 1, 1, '2015-01-05 15:33:44.185198');
INSERT INTO roomst VALUES (102, 18, '2014-10-25 00:00:00', 0, 1, '2015-01-06 13:26:50.903442');
INSERT INTO roomst VALUES (103, 18, '2014-10-25 00:00:00', 8, 1, '2015-01-06 13:27:51.337953');
INSERT INTO roomst VALUES (104, 5, '2014-10-25 00:00:00', 0, 1, '2015-01-06 13:27:51.337953');
INSERT INTO roomst VALUES (105, 5, '2014-10-25 00:00:00', 8, 1, '2015-01-06 13:28:22.024466');
INSERT INTO roomst VALUES (106, 18, '2014-10-25 00:00:00', 0, 1, '2015-01-06 13:28:22.024466');
INSERT INTO roomst VALUES (107, 18, '2014-10-25 00:00:00', 1, 1, '2015-01-06 13:29:01.03664');
INSERT INTO roomst VALUES (108, 8, '2014-10-25 00:00:00', 1, 1, '2015-01-06 13:29:11.09067');
INSERT INTO roomst VALUES (109, 18, '2014-10-25 00:00:00', 8, 1, '2015-01-06 15:11:36.201573');
INSERT INTO roomst VALUES (110, 7, '2014-10-25 00:00:00', 1, 1, '2015-01-06 15:11:36.201573');
INSERT INTO roomst VALUES (111, 8, '2014-10-25 00:00:00', 8, 1, '2015-01-06 15:12:18.878318');
INSERT INTO roomst VALUES (112, 11, '2014-10-25 00:00:00', 1, 1, '2015-01-06 15:12:18.878318');
INSERT INTO roomst VALUES (113, 7, '2014-10-26 00:00:00', 8, 1, '2015-01-06 15:14:08.864925');
INSERT INTO roomst VALUES (114, 6, '2014-10-26 00:00:00', 1, 1, '2015-01-06 15:14:08.864925');
INSERT INTO roomst VALUES (115, 6, '2014-10-26 00:00:00', 8, 1, '2015-01-06 15:15:13.229953');
INSERT INTO roomst VALUES (116, 2, '2014-10-26 00:00:00', 1, 1, '2015-01-06 15:15:13.229953');
INSERT INTO roomst VALUES (117, 2, '2014-10-26 00:00:00', 8, 1, '2015-01-06 15:17:33.278452');
INSERT INTO roomst VALUES (118, 8, '2014-10-26 00:00:00', 1, 1, '2015-01-06 15:17:33.278452');
INSERT INTO roomst VALUES (119, 28, '2014-10-27 00:00:00', 0, 1, '2015-01-06 16:06:29.215008');
INSERT INTO roomst VALUES (120, 28, '2014-10-27 00:00:00', 1, 1, '2015-01-06 16:06:41.031635');
INSERT INTO roomst VALUES (121, 30, '2014-10-27 00:00:00', 0, 1, '2015-01-06 16:07:10.983167');
INSERT INTO roomst VALUES (122, 30, '2014-10-27 00:00:00', 1, 1, '2015-01-06 16:07:16.250811');
INSERT INTO roomst VALUES (123, 28, '2014-10-28 00:00:00', 8, 1, '2015-01-06 16:09:15.675342');
INSERT INTO roomst VALUES (124, 6, '2014-10-28 00:00:00', 1, 1, '2015-01-06 16:09:15.675342');
INSERT INTO roomst VALUES (125, 31, '2014-10-28 00:00:00', 0, 1, '2015-01-06 17:08:17.243829');
INSERT INTO roomst VALUES (126, 31, '2014-10-28 00:00:00', 1, 1, '2015-01-06 17:08:24.861198');
INSERT INTO roomst VALUES (127, 31, '2014-10-29 00:00:00', 8, 1, '2015-01-06 17:10:38.343302');
INSERT INTO roomst VALUES (128, 2, '2014-10-29 00:00:00', 1, 1, '2015-01-06 17:10:38.343302');
INSERT INTO roomst VALUES (129, 19, '2014-10-29 17:12:00', 0, 1, '2015-01-06 17:12:25.627054');
INSERT INTO roomst VALUES (130, 19, '2014-10-29 00:00:00', 1, 1, '2015-01-06 17:13:36.220492');
INSERT INTO roomst VALUES (131, 19, '2014-10-30 00:00:00', 8, 1, '2015-01-06 17:15:39.635509');
INSERT INTO roomst VALUES (132, 18, '2014-10-30 00:00:00', 1, 1, '2015-01-06 17:15:39.635509');


--
-- Name: roomstid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomstid_seq', 132, true);


--
-- Data for Name: roomtype; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO roomtype VALUES (8, 'LDS', 'Laerton Deluxe Suite', 1, 0, 6, 6, true, '54', 12, 1, '2014-12-03 17:03:13.27', true, 8, false);
INSERT INTO roomtype VALUES (6, 'TKS', 'Tbilisi King Suite', 2, 0, 6, 6, true, '45', 1, 1, '2014-12-16 15:12:27.05', true, 7, false);
INSERT INTO roomtype VALUES (4, 'JKR', 'Junior King', 1, 0, 2, 2, false, '12', 1, 1, '2014-12-17 20:04:24.083', true, 2, false);
INSERT INTO roomtype VALUES (3, 'JTR', 'Junior Terrace', 1, 0, 2, 2, true, '#fafafa', 0, 1, '2014-12-17 20:04:29.631', true, 6, false);
INSERT INTO roomtype VALUES (1, 'KSR', 'King Standart', 1, 0, 3, 3, true, '#fff', 0, 1, '2014-12-17 20:04:41.951', true, 1, false);
INSERT INTO roomtype VALUES (2, 'LTR', 'Laerton Terrace', 1, 0, 2, 2, true, '#bbb', 0, 1, '2014-12-17 20:04:49.832', true, 4, false);
INSERT INTO roomtype VALUES (7, 'SKR', 'Superior King', 1, 0, 4, 4, true, '#ffff', 23, 1, '2014-12-17 20:04:54.895', true, 3, false);
INSERT INTO roomtype VALUES (5, 'TTR', 'Tbilisi Terrace', 1, 0, 3, 3, true, '23', 1, 1, '2014-12-17 20:05:00.957', true, 5, false);


--
-- Data for Name: roomtypeamenity; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO roomtypeamenity VALUES (1, 2);
INSERT INTO roomtypeamenity VALUES (4, 1);
INSERT INTO roomtypeamenity VALUES (2, 3);


--
-- Name: roomtypeid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('roomtypeid_seq', 8, true);


--
-- Data for Name: salutation; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO salutation VALUES (1, 'Mr.');
INSERT INTO salutation VALUES (3, 'Mam.');
INSERT INTO salutation VALUES (2, 'Mrs.');
INSERT INTO salutation VALUES (4, 'Dr.');
INSERT INTO salutation VALUES (5, 'Ms.');
INSERT INTO salutation VALUES (6, 'Jn.');
INSERT INTO salutation VALUES (7, 'Sir.');


--
-- Name: salutationid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('salutationid_seq', 7, true);


--
-- Data for Name: season; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO season VALUES (0, 'NONE', 'NONE', 0, 0, 0, 0, '2010-01-01', '2030-01-01', 1, '2014-08-13 17:54:02.305994', true, false);
INSERT INTO season VALUES (2, 'Nად', 'ნადირობა', 30, 2, 8, 9, '2014-09-15', '2017-09-15', 1, '2014-09-29 14:12:20.135', true, false);
INSERT INTO season VALUES (1, 'სექ', 'სექტემბრობა', 5, 7, 9, 9, '2014-09-17', '2017-08-19', 1, '2014-10-16 17:28:22.96', true, false);


--
-- Name: seasonid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('seasonid_seq', 2, true);


--
-- Data for Name: stcolor; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO stcolor VALUES (1, 0, '#19bf3d', 1, '2014-08-09 16:54:36.884', true, false);
INSERT INTO stcolor VALUES (7, 6, '#fcda00', 1, '2014-08-09 16:55:13.531', true, false);
INSERT INTO stcolor VALUES (3, 2, '#f25f48', 1, '2014-08-09 16:54:29.267', true, false);
INSERT INTO stcolor VALUES (4, 3, '#a8814d', 1, '2014-08-09 16:54:45.677', true, false);
INSERT INTO stcolor VALUES (5, 4, '#4381c4', 1, '2014-08-09 16:54:59.94', true, false);
INSERT INTO stcolor VALUES (6, 5, '#715dab', 1, '2014-08-09 16:55:07.409', true, false);
INSERT INTO stcolor VALUES (2, 1, '#ff0000', 1, '2014-08-09 16:54:33.809', true, false);


--
-- Name: stcolorid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('stcolorid_seq', 7, true);


--
-- Data for Name: tax; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO tax VALUES (1, 'დღგ', 'Vat', '2004-01-01', 0, 0, 18, true, false, 1, '2014-09-29 16:46:01.609', true, false);


--
-- Data for Name: taxaccount; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Name: taxid_seq; Type: SEQUENCE SET; Schema: public; Owner: hms
--

SELECT pg_catalog.setval('taxid_seq', 5, true);


--
-- Data for Name: taxsequence; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: template; Type: TABLE DATA; Schema: public; Owner: hms
--



--
-- Data for Name: templatecategory; Type: TABLE DATA; Schema: public; Owner: hms
--

INSERT INTO templatecategory VALUES (1, 'მიმოხილვის დამატება', 1, '2014-08-14 17:02:07.621', true, false);
INSERT INTO templatecategory VALUES (2, 'მადლობის წერილი გაწერისას', 1, '2014-08-14 17:02:14.935', true, false);
INSERT INTO templatecategory VALUES (3, 'მადლობის წერილი მიმოხილვის დამატებისას', 1, '2014-08-14 17:02:33.725', true, false);
INSERT INTO templatecategory VALUES (5, 'წერილი გაუქმებული რეზერვაციისას', 1, '2014-08-14 17:03:43.077', true, false);
INSERT INTO templatecategory VALUES (4, 'წერილი შემდგარი რეზერვაციისათვის', 1, '2014-08-14 17:04:29.166', true, false);


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

INSERT INTO transportationmode VALUES (1, 'თვითმფრინავი', 1, true, false, '2014-08-14 16:32:16.254');
INSERT INTO transportationmode VALUES (2, 'მატარებელი', 1, true, false, '2014-08-14 16:32:24.356');


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

INSERT INTO vipstatus VALUES (1, 'ნუგზარის ბიძაშვილები', true, false);
INSERT INTO vipstatus VALUES (2, 'ფუდბალისტები', true, false);


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
-- Name: ordermain_pkey; Type: CONSTRAINT; Schema: public; Owner: hms; Tablespace:
--

ALTER TABLE ONLY ordermain
    ADD CONSTRAINT ordermain_pkey PRIMARY KEY (ordermainid);


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
-- Name: folioitem_ordermainid_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hms
--

ALTER TABLE ONLY folioitem
    ADD CONSTRAINT folioitem_ordermainid_fkey FOREIGN KEY (ordermainid) REFERENCES ordermain(ordermainid);


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

