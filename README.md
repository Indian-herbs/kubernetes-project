# kubernetes-project
This project deploys a basic web application using an NGINX web server on a Kubernetes cluster. It serves static content from a ConfigMap and demonstrates the fundamental components required to run a containerized application in a cloud-native environment.

🌐 Key Components:
Application: An NGINX container running a simple web page.

Static Content: The web page content (e.g., the index.html) is managed outside the container image using a ConfigMap (nginx-html) and mounted as a volume. This allows for quick content updates without rebuilding the Docker image.

Deployment (deployment.yaml): Defines the desired state of the application, ensuring one replica of the NGINX Pod is always running.

Service (service.yaml): Exposes the NGINX Pods to the outside world using a NodePort type, allowing access from a web browser via the Minikube IP address and a high port.