# Base image
FROM nginx:1.15
# Install dependencies
RUN apt-get update && apt-get install -y \
    g++ \
    zip \
    vim \
    curl \
    openssl \
    libssl-dev \
    --no-install-recommends apt-utils \
    && rm -r /var/lib/apt/lists/*

# establish where Nginx should look for files
ENV RAILS_ROOT /var/www/app
# Set our working directory inside the image
WORKDIR $RAILS_ROOT
# create log directory
RUN mkdir log
# copy over static assets
COPY public public/
# Copy Nginx config template
COPY docker/web/nginx.conf /tmp/docker.nginx

COPY /etc/letsencrypt/live/daipham.xyz/fullchain.pem /etc/ssl/fullchain.pem
COPY /etc/letsencrypt/live/daipham.xyz/privkey.pem /etc/ssl/privkey.pem
# substitute variable references in the Nginx config template for real values from the environment 
# put the final config in its place
RUN envsubst '$RAILS_ROOT' < /tmp/docker.nginx > /etc/nginx/conf.d/default.conf

EXPOSE 80
EXPOSE 443

# Use the "exec" form of CMD so Nginx shuts down gracefully on SIGTERM (i.e. `docker stop`)
CMD [ "nginx", "-g", "daemon off;" ]