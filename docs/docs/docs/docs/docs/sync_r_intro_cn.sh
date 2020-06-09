# build gitbook and push to remote
# gitbook published 

# generate gitbook
gitbook build

# copy htmls to docs, then github pages use docs/ as its web resource
cp -R _book/* ./docs/

# add changes to stage
git add .

# commit
git commit -m "add by script"

# remote repo branch
git push origin master
