# Use the official Nginx image as the base image for stability and security.
FROM nginx:stable-alpine

# MAINTAINER: It's good practice to label who maintains the image.
LABEL maintainer="Your Name/Team"

# 1. REMOVE DEFAULT CONFIGURATION
# Nginx's default config often conflicts with custom setups.
RUN rm /etc/nginx/conf.d/default.conf

# 2. COPY CUSTOM CONFIGURATION
# Copy your custom Nginx configuration files into the container.
# Assuming your custom config is 'default.conf' or 'nginx.conf'
# This is crucial for defining how Nginx handles traffic for your application.
COPY default.conf /etc/nginx/conf.d/
COPY nginx.conf /etc/nginx/nginx.conf

# 3. COPY APPLICATION CODE (if static content exists)
# If your application is a static site (HTML, CSS, JS), copy it here.
# Assuming your content is in a 'dist' or 'build' folder, or in the root.
# Adjust the source path (first argument) if your app code is inside a subfolder.
# Example assumes your static files are in a folder called 'app_files':
# COPY app_files /usr/share/nginx/html

# If your app files are in the root and include the Nginx config in the root,
# you would just copy them all. For now, we focus on the Nginx setup.

# 4. EXPOSE PORT 80
# The standard port Nginx runs on.
EXPOSE 80

# 5. START NGINX
# The default command runs Nginx in the foreground.
CMD ["nginx", "-g", "daemon off;"]