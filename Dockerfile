# Use an official Node runtime as a parent image
FROM node:18-alpine

# Set the working directory in the container
WORKDIR /usr/src/app

# Install app dependencies by copying
# package.json and package-lock.json (or yarn.lock if using Yarn)
COPY package*.json ./

# If using a `.env` file to manage environment variables, uncomment the next line to copy it
# COPY .env .

# Install any needed packages
RUN npm install
RUN npm install express-session
RUN npm install express
RUN npm install mongoose
RUN npm install bcrypt
RUN npm install ejs
RUN npm install nodemailer

# Bundle app source inside Docker image
COPY . .

# Make port 3002 available to the world outside this container
EXPOSE 3002

# Define environment variable
# Note: Do not hardcode sensitive information like DB connection strings here for production!
ENV NODE_ENV=production

# You can also set default MongoDB connection string here if it's not sensitive
ENV DB_CONN_STRING="mongodb+srv://rgangineni:ravalihema@practicecluster.b6bg5cq.mongodb.net/Node-API?retryWrites=true&w=majority&appName=PracticeCluster"

# Command to run the app
CMD ["node", "src/index.js"]
