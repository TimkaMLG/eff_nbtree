/* contrib/eff_nbtree/eff_nbtree--1.0.sql */

-- complain if script is sourced in psql, rather than via CREATE EXTENSION
\echo Use "CREATE EXTENSION eff_nbtree" to load this file. \quit


CREATE FUNCTION eff_nbtreehandler(internal)
RETURNS index_am_handler
AS 'MODULE_PATHNAME'
LANGUAGE C;

-- Access method
CREATE ACCESS METHOD eff_nbtree TYPE INDEX HANDLER eff_nbtreehandler;
COMMENT ON ACCESS METHOD eff_nbtree IS 'eff_nbtree index access method';


CREATE OPERATOR CLASS cube_ops
    DEFAULT FOR TYPE cube USING eff_nbtree AS
        OPERATOR        1       < ,
        OPERATOR        2       <= ,
        OPERATOR        3       = ,
        OPERATOR        4       >= ,
        OPERATOR        5       > ,
        FUNCTION        1       cube_cmp(cube, cube);
   