# before you run the docker build set the following environment variables
#set http-proxy=http://proxy-mwg-http.ca.sunlife:8080
#set https-proxy=http://proxy-mwg-http.ca.sunlife:8080
# To create image run
# docker build -f Dockerfile.dev . -t nginx
#To start container run
# docker run -t nginx 


# Specify base image
FROM nginx

# Download and install a dependency
COPY ./default.conf /etc/nginx/conf.d/default.conf
