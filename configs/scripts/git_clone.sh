#Script usage 
#git_clone.sh $branchname
rm -rf /var/www/html
mkdir -p /var/www/html 
git clone -b $1 git@github.com:darwinbox/infrastructure.git /var/www/html
