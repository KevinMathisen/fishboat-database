-- migrate:up

create extension if not exists postgis;

create table elvedata(
    id integer primary key generated always as identity,
    dato date not null,
    elv text not null,
    baattype text not null,
    posisjon geometry(point, 4326) not null,
    vannfoering integer,
    skipper text not null,
    mannskap text[],
    prosjekt text,
    prosjektnummer text,
    kommentar text,
    unique (dato, elv)
);

create table stasjonsdata(
    id integer primary key generated always as identity,
    elvedata integer references elvedata(id) not null,
    klokkeslett_start time,
    posisjon_start geometry(point, 4326) not null,
    posisjon_stop geometry(point, 4326) not null,
    dominerende_elvetype text,
    vaer text,
    vanntemp decimal,
    lufttemperatur integer,
    ledningsevne integer,
    transektlengde integer,
    sekunder_fisket integer not null,
    volt integer not null,
    puls integer not null,
    display decimal,
    gpx_file bool,
    stasjonsbeskrivelse text,
    kommentarer text
);

create table individdata(
    id integer primary key generated always as identity,
    stasjon integer references stasjonsdata(id) not null,
    omgang integer,
    art text,
    lengde integer,
    antall integer,
    kjoenn text,
    alder integer,
    gjenutsatt bool,
    proevetatt bool,
    kommentar text
);

-- migrate:down
