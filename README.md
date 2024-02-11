# EM-Template
EM-Template is a ... module that is compatible with EuroMeasure system.
This repository contains [hardware](/hw), [software](/soft), and [documentation](/docs) as well as a CI flow used to generate fabrication and documentation outputs.


## Usage
To use the template run following commands. REMEMBER TO REPLACE "NEW_NAME" AND TO UPDATE README.
```bash
export NEW_NAME_VAR=NEW_NAME
git clone https://github.com/PWr-M3/EM-Template.git $NEW_NAME_VAR
cd ./$NEW_NAME_VAR

find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/EM-Template/${NEW_NAME_VAR}/g"

find . -name '*EM-Template*' -type f -exec sh -c '
for f; do
    mv "$f" "${f/EM-Template/$NEW_NAME_VAR}"
done' sh {} +

git remote rename origin ci-fork
git add .
git commit -m "Rename project to ${NEW_NAME_VAR}"
```
After running you need to add the origin remote using:
```bash
git remote add origin GIT_URL_TO_ORIGIN
git push --set-upstream origin main
```
