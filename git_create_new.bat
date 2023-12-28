echo "# TOOLS" > README.md
git init

rem git add README.md
git add --all
git commit -m "commit on new"

git branch -M main
git remote add origin git@github.com:lisitsinyr/TOOLS.git

git push -u origin main