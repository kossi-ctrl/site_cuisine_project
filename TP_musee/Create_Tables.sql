

DROP TABLE IF EXISTS public.derouler CASCADE;
DROP TABLE IF EXISTS public.regroupe CASCADE;
DROP TABLE IF EXISTS public.correspondre CASCADE;
DROP TABLE IF EXISTS public.avoir CASCADE;
DROP TABLE IF EXISTS public.lien CASCADE;

DROP TABLE IF EXISTS public.lieu CASCADE;
DROP TABLE IF EXISTS public.territoire CASCADE;

DROP TABLE IF EXISTS public.evenement CASCADE;
DROP TABLE IF EXISTS public.categorie CASCADE;
DROP TABLE IF EXISTS public.agenda CASCADE;
DROP TABLE IF EXISTS public.accessibilite CASCADE;



CREATE TABLE public.accessibilite
(
    id_accessibilite INTEGER NOT NULL PRIMARY KEY,
    acces_en_ligne   TEXT,
    acces_itineraire TEXT
);

CREATE TABLE public.agenda
(
    id_agenda            INTEGER NOT NULL PRIMARY KEY,
    agenda_origine_titre TEXT,
    agenda_origine_uid   TEXT
);

CREATE TABLE public.categorie
(
    id_categorie INTEGER NOT NULL PRIMARY KEY,
    libelle      TEXT
);

CREATE TABLE public.evenement
(
    id_evenement        INTEGER NOT NULL PRIMARY KEY,
    titre               TEXT,
    description         TEXT,
    description_longue  TEXT,
    url_canonique       TEXT,
    details_conditions  TEXT,
    mots_cles           TEXT,
    mise_a_jour         TIMESTAMP,
    resume_horaires     TEXT,
    premiere_date_debut TIMESTAMP,
    premiere_date_fin   TIMESTAMP,
    derniere_date_debut TIMESTAMP,
    derniere_date_fin   TIMESTAMP
);

CREATE TABLE public.territoire
(
    id_territoire INTEGER NOT NULL PRIMARY KEY,
    insee_code    TEXT,
    code_postal   TEXT,
    ville         TEXT,
    region        TEXT,
    departement   TEXT,
    pays          TEXT
);

CREATE TABLE public.lieu
(
    id_lieu          INTEGER NOT NULL PRIMARY KEY,
    latitude         NUMERIC(9, 6),
    longitude        NUMERIC(9, 6),
    nom_lieu         TEXT,
    adresse_lieu     TEXT,
    arrondissement  TEXT,
    tags_lieu        TEXT,
    description_lieu TEXT,
    telephone_lieu   TEXT,
    lien_lieu        TEXT,
    site_web_lieu    TEXT,
    id_territoire    INTEGER REFERENCES public.territoire(id_territoire)
);



CREATE TABLE public.avoir
(
    id_evenement     INTEGER NOT NULL REFERENCES public.evenement(id_evenement),
    id_accessibilite INTEGER NOT NULL REFERENCES public.accessibilite(id_accessibilite),
    PRIMARY KEY (id_evenement, id_accessibilite)
);

CREATE TABLE public.correspondre
(
    id_evenement INTEGER NOT NULL REFERENCES public.evenement(id_evenement),
    id_agenda    INTEGER NOT NULL REFERENCES public.agenda(id_agenda),
    PRIMARY KEY (id_evenement, id_agenda)
);

CREATE TABLE public.regroupe
(
    id_categorie INTEGER NOT NULL REFERENCES public.categorie(id_categorie),
    id_evenement INTEGER NOT NULL REFERENCES public.evenement(id_evenement),
    PRIMARY KEY (id_categorie, id_evenement)
);

CREATE TABLE public.derouler
(
    id_lieu      INTEGER NOT NULL REFERENCES public.lieu(id_lieu),
    id_evenement INTEGER NOT NULL REFERENCES public.evenement(id_evenement),
    PRIMARY KEY (id_lieu, id_evenement)
);

CREATE TABLE public.lien
(
    id_lien            INTEGER NOT NULL PRIMARY KEY,
    liens_additionnels TEXT,
    id_evenement       INTEGER REFERENCES public.evenement(id_evenement)
);


