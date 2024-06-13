# Use an official Node runtime as a parent image
FROM node:18

# Set the working directory in the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install app dependencies
RUN npm install

# If using bcrypt or other packages that require native builds, rebuild them
RUN npm rebuild bcrypt --build-from-source

# Bundle app source inside Docker image
COPY . .

# Make port 3002 available to the world outside this container
EXPOSE 3002

# Define environment variable
ENV NODE_ENV=production

# Command to run the app
CMD ["node", "src/index.js"]
