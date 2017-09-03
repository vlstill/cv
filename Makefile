
all : cv.pdf

%.pdf : %.tex papers.bib
	-biber $(<:.tex=)
	lualatex $(<:.tex=) < /dev/null

watch :
	while true; do inotifywait -e close_write,moved_to,create .; sleep 1; make; done
