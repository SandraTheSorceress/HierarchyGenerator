# Build the React app using Node.js
FROM node:22 AS build

# Set the working directory inside the container
WORKDIR /app

# Copy the package.json and package-lock.json to install dependencies first
COPY package*.json ./

# Install the project dependencies
RUN npm install

# Copy the rest of the app's files into the container
COPY . .

# Build the app
RUN npm run build

# Set up a minimal server to serve the built app using Nginx
FROM nginx:alpine

# Copy the custom nginx.conf to the appropriate location in the Nginx container
COPY nginx.conf /etc/nginx/nginx.conf

# Copy the built app from the previous stage into the Nginx container
COPY --from=build /app/dist /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE 80

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
