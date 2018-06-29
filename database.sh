

# SQLite
sudo apt-get install libsqlite3-dev -y

# MySQL
# https://www.digitalocean.com/community/tutorials/how-to-install-mysql-on-ubuntu-16-04
sudo apt install mysql-server -y
    # set root password
mysql_secure_installation


# PostgreSQL
# https://www.postgresql.org/download/linux/ubuntu/
# https://www.digitalocean.com/community/tutorials/how-to-install-and-use-postgresql-on-ubuntu-16-04
cat "deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main<Paste>" >> /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update -y
sudo apt install postgresql-10 -y
sudo apt install postgresql-contrib -y




