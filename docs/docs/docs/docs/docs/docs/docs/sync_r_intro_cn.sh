# build gitbook and push to remote
# gitbook published on my space

gitbook build

cp _book/* ./docs/

git add .

git commit -m "add by script"

# remote repo branch
git push origin master
