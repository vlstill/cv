
all : cv.pdf

cv.pdf : cv.tex papers.bib
	-biber cv
	lualatex cv < /dev/null

watch :
	while true; do inotifywait -e close_write,moved_to,create .; sleep 1; make; done
