
all : cv.pdf

%.pdf : %.tex %.bbl
	lualatex $(<:.tex=) < /dev/null

%.bbl : %.bcf papers.bib
	biber $(<:.tex=)

%.bcf : %.tex
	lualatex $(<:.tex=) < /dev/null

watch :
	while true; do inotifywait -e close_write,moved_to,create .; sleep 1; make; done

.PRECIOUS: %.bcf %.bbl
.PHONY: all watch
