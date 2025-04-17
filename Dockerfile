FROM nginx:alpine

# Copy the HTML file to the nginx html directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80

# Use the default nginx command
CMD ["nginx", "-g", "daemon off;"]

