# before you run the docker build set the following environment variables
#set http-proxy=http://proxy-mwg-http.ca.sunlife:8080
#set https-proxy=http://proxy-mwg-http.ca.sunlife:8080
# To create image run
# docker build -f Dockerfile.dev . -t complex_client
#To start container run
# docker run -p 3000:3000 -v /app/node_modules -v C:\Projects\2020\ContainerService\Training\frontend:/app -it frontend sh
# docker run -t complex_client
# To test http://localhost:3000/

# Specify base image
FROM node:alpine as builder

# Define target working directory
WORKDIR '/app'

# Download and install a dependency
COPY ./package*.json ./
RUN npm config set strict-ssl false
RUN npm config set registry "http://registry.npmjs.org/"
RUN npm install
COPY . .
RUN npm run build

FROM nginx
EXPOSE 3000
COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY --from=builder /app/build /usr/share/nginx/html