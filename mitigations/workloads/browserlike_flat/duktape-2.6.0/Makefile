#
#  Example Makefile for building a program with embedded Duktape.
#  The example program here is the Duktape command line tool.
#

DUKTAPE_SOURCES = src/duktape.c

CMDLINE_SOURCES = \
	examples/cmdline/duk_cmdline.c

CC = gcc
CCOPTS = -Os -pedantic -std=c99 -Wall -fstrict-aliasing -fomit-frame-pointer
CCOPTS += -I./examples/cmdline -I./src   # duktape.h and duk_config.h must be in include path
CCOPTS += -I/usr/lib/debug/usr/lib64/
CCLIBS = -lm

# Enable print() and alert() for command line using an optional extra module.
CCOPTS += -DDUK_CMDLINE_PRINTALERT_SUPPORT -I./extras/print-alert
CMDLINE_SOURCES += extras/print-alert/duk_print_alert.c

# Enable console object (console.log() etc) for command line.
CCOPTS += -DDUK_CMDLINE_CONSOLE_SUPPORT -I./extras/console
CMDLINE_SOURCES += extras/console/duk_console.c

# Enable Duktape.Logger for command line.
CCOPTS += -DDUK_CMDLINE_LOGGING_SUPPORT -I./extras/logging
CMDLINE_SOURCES += extras/logging/duk_logging.c

# Enable Duktape 1.x module loading for command line.
CCOPTS += -DDUK_CMDLINE_MODULE_SUPPORT -I./extras/module-duktape
CMDLINE_SOURCES += extras/module-duktape/duk_module_duktape.c

# If you want linenoise, you can enable these.  At the moment linenoise
# will cause some harmless compilation warnings.
#CCOPTS += -DDUK_CMDLINE_FANCY -I./linenoise
#CMDLINE_SOURCES += linenoise/linenoise.c
#duk: linenoise

# Use the tools/configure.py utility to modify Duktape default configuration:
# http://duktape.org/guide.html#compiling
# http://wiki.duktape.org/Configuring.html
CCOPTS += -static

duk: $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES)
	$(CC) -o $@ $(DEFINES) $(CCOPTS) $(DUKTAPE_SOURCES) $(CMDLINE_SOURCES) $(CCLIBS)

linenoise/linenoise.c: linenoise
linenoise:
	git clone https://github.com/antirez/linenoise.git
