# contrib/eff_nbtree/Makefile

MODULE_big = eff_nbtree

OBJS = \
	$(WIN32RES) \
	src/eff_nbtcompare.o \
	src/eff_nbtdedup.o \
	src/eff_nbtinsert.o \
	src/eff_nbtpage.o \
	src/eff_nbtree.o \
	src/eff_nbtsearch.o \
	src/eff_nbtsort.o \
	src/eff_nbtsplitloc.o \
	src/eff_nbtutils.o \
	src/eff_nbtvalidate.o \
	src/eff_nbtxlog.o \
	src/eff_tuplesort.o \
	src/eff_sortsupport.o


EXTENSION = eff_nbtree
DATA = eff_nbtree--1.0.sql
PGFILEDESC = "eff_nbtree - efficient nbtree equivalent"

REGRESS = eff_nbtree

TAP_TESTS = 1

SHLIB_LINK += $(filter -lm, $(LIBS))

ifdef USE_PGXS
PG_CONFIG = pg_config
PGXS := $(shell $(PG_CONFIG) --pgxs)
include $(PGXS)
else
subdir = contrib/eff_nbtree
top_builddir = ../..
include $(top_builddir)/src/Makefile.global
include $(top_srcdir)/contrib/contrib-global.mk
endif
