export NEW_NAME_VAR=EM-HVPSU
read -p 'Repository name: ' NEW_NAME_VAR
cd ..
git clone https://github.com/PWr-M3/EM-Template.git $NEW_NAME_VAR
cd ./$NEW_NAME_VAR

find . \( -type d -name .git -prune \) -o -type f -print0 | xargs -0 sed -i "s/EM-Template/${NEW_NAME_VAR}/g"

find . -name '*EM-Template*' -type f -exec sh -c '
for f; do
    mv "$f" "${f/EM-Template/$NEW_NAME_VAR}"
done' sh {} +

git remote rename origin ci-fork

rm ./README.md
rm ./clone.sh

git add .
git commit -m "Rename project to ${NEW_NAME_VAR}"
git remote add origin git@github.com:PWr-M3/${NEW_NAME_VAR}.git
