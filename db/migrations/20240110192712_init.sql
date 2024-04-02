-- migrate:up

create extension if not exists postgis;
create extension if not exists btree_gist;

create table elvedata(
    id integer primary key generated always as identity,
    dato daterange not null,
    elv text not null,
    baattype text not null,
    posisjon geometry(point, 4326) not null,
    vannfoering integer,
    skipper text not null,
    mannskap text[],
    prosjektnavn text,
    prosjektnummer text,
    kommentar text
);

alter table elvedata add exclude using gist (
    dato with &&,
    id with =
);

create table stasjonsdata(
    id integer primary key generated always as identity,
    elvedata integer references elvedata(id) not null,
    stasjonnummer integer not null,
    klokkeslett_start timestamp not null,
    posisjon_start geometry(point, 4326) not null,
    posisjon_stopp geometry(point, 4326) not null,
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
    kommentar text
);

create table individdata(
    id integer primary key generated always as identity,
    stasjon integer references stasjonsdata(id) not null,
    omgang integer,
    art text not null,
    lengde integer,
    antall integer,
    kjoenn text,
    alder integer,
    gjenutsatt bool,
    proevetype text,
    kommentar text
);

-- migrate:down
