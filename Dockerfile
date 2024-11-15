# Use an official Node.js image as the base image
FROM node:20.18.0

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (if available)
COPY package*.json ./

# Install Node.js dependencies
RUN npm install

# Install required packages
RUN apt-get update && \
    apt-get install -y ffmpeg libwebp-dev imagemagick && \
    rm -rf /var/lib/apt/lists/*

# Copy application code
COPY . .

# Expose the application port (optional, adjust based on your app's requirements)
EXPOSE 3000

# Run the application
CMD ["npm", "start"]
