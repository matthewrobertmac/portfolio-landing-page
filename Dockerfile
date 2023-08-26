# Use Node.js version 14
FROM node:14

# Set working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy other files
COPY server/ ./server/
COPY prettier.config.js ./
COPY public/ ./public/
COPY src/ ./src/
COPY LICENSE ./
COPY README.md ./
COPY Procfile ./

# Build the frontend (assuming you have a build script in package.json)
RUN npm run build

# Set the environment variable for the port (you can overwrite this when running the container)
ENV PORT 3000

# Command to run the server
CMD [ "node", "server/server.js" ]

