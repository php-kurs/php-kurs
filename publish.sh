rm -rf ./site 
PUBUSER=$1
mkdocs build
rsync -avze 'ssh' --delete ./site/ $PUBUSER@syntax-shell.me:/var/www/$PUBUSER
