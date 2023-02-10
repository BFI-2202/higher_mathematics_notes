LAST_COMMIT_ID=$(git log --format="%H" -n 1)
FILES_CHANGED=$(git diff-tree --no-commit-id --name-only ${LAST_COMMIT_ID} -r)
ROOT=$(pwd)
for item in $FILES_CHANGED; do
  if [[ "$item" != *.tex ]]
  then
    continue
  fi
  INPUT_PATH="${item}"
  OUTPUT_DIRECTORY="${item/sources/renders}"
  OUTPUT_DIRECTORY="${OUTPUT_DIRECTORY%/*}"
  mkdir -p "${ROOT}/${OUTPUT_DIRECTORY}"
  cd "${ROOT}/${OUTPUT_DIRECTORY}"
  pdflatex -synctex=1 -interaction=nonstopmode --shell-escape "${ROOT}/${INPUT_PATH}"
  pdflatex -synctex=1 -interaction=nonstopmode --shell-escape "${ROOT}/${INPUT_PATH}"
done
