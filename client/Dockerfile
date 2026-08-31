# ---------------------------------------------------------------------------
# Stage 1: Build the Vue application
# ---------------------------------------------------------------------------

# Use Node only for building the frontend.
FROM node:22-alpine AS builder

# Set the build directory.
WORKDIR /app

# Copy package files first for better Docker caching.
COPY package*.json ./

# Install frontend dependencies.
RUN npm ci

# Copy the frontend source code.
COPY . .

# Build the production bundle.
RUN npm run build


# ---------------------------------------------------------------------------
# Stage 2: Serve the application
# ---------------------------------------------------------------------------

# Use Nginx as the production web server.
# Node is NOT included in this final image.
FROM nginx:alpine

# Remove the default Nginx website.
RUN rm -rf /usr/share/nginx/html/*

# Copy the Vue production build from the Node stage.
COPY --from=builder /app/dist /usr/share/nginx/html

# Expose HTTP.
EXPOSE 80

# Start Nginx in the foreground.
CMD ["nginx", "-g", "daemon off;"]
