# Use a secure distroless image from Chainguard (less attack surface)
#FROM cgr.dev/chainguard/nginx:latest

FROM nginx:alpine

# Copy static custom devops web app to the Nginx root directory
COPY src/index.html /usr/share/nginx/html/index.html

# listen on port 80 for localhost
EXPOSE 80

# Configure a health check to ensure the container is healthy
HEALTHCHECK --interval=30s --timeout=10s --retries=3 CMD curl -f http://localhost/ || exit 1

# Start the NGINX server
CMD ["nginx", "-g", "daemon off;"]

