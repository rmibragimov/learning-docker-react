# Set base image
FROM node:16-alpine as builder
WORKDIR '/app'

# Install dependencies
COPY package.json .
RUN npm install
COPY . .

# Build application
RUN npm run build

# Set new image
FROM nginx as starter

# Copy builded application source code to the new image
COPY --from=builder /app/build /usr/share/nginx/html

# Run nginx server
# No run command, since nginx do it for us automatically

