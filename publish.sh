mkdocs build
rsync -avze 'ssh' --delete ./site/  efik@syntax-shell.me:~/web/
