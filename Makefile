
base:	draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.txt

LIBDIR := lib
include $(LIBDIR)/main.mk

$(LIBDIR)/main.mk:
ifneq (,$(shell grep "path *= *$(LIBDIR)" .gitmodules 2>/dev/null))
	git submodule sync
	git submodule update $(CLONE_ARGS) --init
else
	git clone -q --depth 10 $(CLONE_ARGS) \
	    -b master https://github.com/martinthomson/i-d-template $(LIBDIR)
endif

cleantrash:
	rm -f *~

jaricompile:	draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.txt Makefile
	scp draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.txt \
		jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/dns

#		draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.diff.html \
#	rfcdiff draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations-00.txt draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.txt
#	cp draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations-from--00.diff.html draft-arkko-arch-infrastructure-centralisation-and-encryption-recommendations.diff.html
