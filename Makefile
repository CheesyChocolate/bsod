VERSION=0.1

DEBUG=-g -pedantic #-pg #-fprofile-arcs
LDFLAGS=-lncurses $(DEBUG)
CFLAGS+=-O2 -Wall -DVERSION=\"$(VERSION)\" $(DEBUG)

OBJS=bsod.o

all: bsod

bsod: $(OBJS)
	$(CC) -Wall $(OBJS) $(LDFLAGS) -o bsod

install: bsod
	cp bsod $(DESTDIR)/usr/local/bin

uninstall: clean
	rm -f $(DESTDIR)/usr/local/bin/bsod

clean:
	rm -f $(OBJS) bsod core gmon.out *.da

package: clean
	# source package
	rm -rf bsod-$(VERSION)*
	mkdir bsod-$(VERSION)
	cp *.c Makefile Changes license.txt readme.txt bsod-$(VERSION)
	tar czf bsod-$(VERSION).tgz bsod-$(VERSION)
	rm -rf bsod-$(VERSION)
