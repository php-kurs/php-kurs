mkdocs build
rm -rf ./site 
rsync -avze 'ssh' --delete ./site/  efik@syntax-shell.me:~/web/
