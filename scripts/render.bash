for item in `find ~+ -wholename "*/sources/*"`
do
	INPUT_PATH="${item}"
	OUTPUT_DIRECTORY="${item/sources/renders}"
	OUTPUT_DIRECTORY="${OUTPUT_DIRECTORY%/*}"
	cd "${OUTPUT_DIRECTORY}"
	pdflatex -synctex=1 -interaction=nonstopmode --shell-escape --output-directory="${OUTPUT_DIRECTORY}" "${INPUT_PATH}"
	pdflatex -synctex=1 -interaction=nonstopmode --shell-escape --output-directory="${OUTPUT_DIRECTORY}" "${INPUT_PATH}"
done
