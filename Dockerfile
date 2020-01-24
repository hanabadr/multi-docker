# before you run the docker build set the following environment variables
#set http-proxy=http://proxy-mwg-http.ca.sunlife:8080
#set https-proxy=http://proxy-mwg-http.ca.sunlife:8080
# To create image run
# docker build -f Dockerfile . -t frontendprod
#To start container run
# docker run -p 8090:80 -t frontendprod
# To test http://localhost:8090/


# Specify base image
FROM node:alpine as builder

# Define target working directory
WORKDIR '/app'

# Download and install a dependency
COPY package.json .
RUN npm config set strict-ssl false
RUN npm config set registry "http://registry.npmjs.org/"
RUN npm install
COPY . .

#Tell the image what to do when it starts  as a container
CMD ["npm", "run", "build"]

# Create new nginx image
FROM nginx 
COPY --from=builder /app/build /usr/share/nginx/html
