echo "# TOOLS" > README.md
git init

git add --all
git commit -m "Git Bash commit update"

git branch -M main
git remote add origin git@github.com:lisitsinyr/TOOLS.git

git push -u origin main
