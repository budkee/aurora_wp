FROM wordpress:latest

# Instala dependências necessárias e WP-CLI
RUN apt-get update && \
    apt-get install -y less mariadb-client curl unzip less sudo && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    chmod +x wp-cli.phar && \
    mv wp-cli.phar /usr/local/bin/wp && \
    wp --info

# Cria usuário sirius
RUN adduser --disabled-password --gecos '' sirius && \
    adduser sirius www-data && \
    echo "sirius ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

<<<<<<< HEAD
# Setando o Server
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf

=======
>>>>>>> 63bbd7e7e2b0de31c64d46b33ddb1e834fa73a83
# Define usuário padrão
USER sirius

WORKDIR /var/www/html
