FROM node:15-alpine

# Create a working directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install

# Bundle app source
COPY . .

# Expose port 80
EXPOSE 80

## Step 5:
# Run app.py at container launch
CMD ["node", "index.js"]