#!/bin/bash
set -euo pipefail

psql <<-EOSQL
CREATE TEXT SEARCH CONFIGURATION bulgarian (parser = default);

CREATE TEXT SEARCH DICTIONARY bulgarian_ispell (
    Template = ispell,
    DictFile = bulgarian,
    AffFile = bulgarian,
    StopWords = bulgarian
);

ALTER TEXT SEARCH CONFIGURATION bulgarian
    ALTER MAPPING FOR asciiword, asciihword, hword_asciipart, word, hword, hword_part
    WITH bulgarian_ispell;
EOSQL
