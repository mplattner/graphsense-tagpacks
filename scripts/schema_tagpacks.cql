DROP KEYSPACE IF EXISTS tagpacks;

CREATE KEYSPACE tagpacks WITH replication = {'class': 'SimpleStrategy', 'replication_factor': 3 };

USE tagpacks;


CREATE TABLE tagpack_by_uri (
    uri             text PRIMARY KEY,
    title           text,
    description     text,
    creator         text
);

CREATE TABLE tag_by_address (
    address         text,
    label           text,
    source          text,
    tagpack_uri     text,
    currency        text,
    lastmod         int,
    category        text,
    abuse           text,
    PRIMARY KEY (address, currency, label, source, tagpack_uri)
);

CREATE TABLE tag_by_label (
    label_norm_prefix           text,
    label_norm           text,
    label           text,
    address         text,
    source          text,
    tagpack_uri     text,
    currency        text,
    lastmod         int,
    category        text,
    abuse           text,
    PRIMARY KEY (label_norm_prefix, label_norm, label, address, currency, source, tagpack_uri)
);

CREATE TABLE tag_by_category (
    category        text,
    abuse           text,
    label_norm      text,
    label           text,
    address         text,
    source          text,
    tagpack_uri     text,
    currency        text,
    lastmod         int,
    PRIMARY KEY (category, currency, source, tagpack_uri)
);

CREATE TABLE categories (
    category        text,
    ID              int,
    PRIMARY KEY (category)
);