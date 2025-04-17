# Trump Clock Countdown

A web-based countdown timer displaying the days, hours, minutes, and seconds until the end of Trump's presidential term on January 20, 2029.

![Trump Clock Screenshot](https://via.placeholder.com/800x400?text=Trump+Clock+Countdown)

## Overview

This application displays a visually striking countdown timer with a 7-segment LED-style display showing the exact time remaining until the end of Trump's presidential term. The countdown includes days, hours, minutes, and seconds, updating in real-time.

### Features

- Real-time countdown to January 20, 2029, 12:00:00 PM
- Stylish 7-segment LED display with glowing effect
- Responsive design that works on desktop and mobile devices
- Clear separation between time units with glowing dot separators
- Lightweight static HTML application with no backend dependencies

## Requirements

### Local Development
- Any modern web browser
- Python 3.x (for local development server, optional)

### Docker Deployment
- Docker 19.03.0 or later

### Kubernetes Deployment
- Kubernetes 1.19 or later
- kubectl command-line tool
- Container registry for storing the image (optional if using local images)

## Installation & Deployment

### Local Development

The simplest way to run the application locally:

1. Clone the repository:
   ```
   git clone https://github.com/yourusername/trump-clock.git
   cd trump-clock
   ```

2. Open the `index.html` file directly in your web browser:
   ```
   open index.html
   ```

3. Alternatively, start a local development server:
   ```
   python3 -m http.server 8000
   ```

4. Visit `http://localhost:8000` in your web browser

### Docker Deployment

Build and run the application using Docker:

1. Build the Docker image:
   ```
   docker build -t trump-clock:latest .
   ```

2. Run the container:
   ```
   docker run -d -p 8080:80 --name trump-clock trump-clock:latest
   ```

3. Access the application at `http://localhost:8080`

### Kubernetes Deployment

Deploy the application to a Kubernetes cluster:

1. Build and push the Docker image (if using a remote registry):
   ```
   docker build -t your-registry/trump-clock:latest .
   docker push your-registry/trump-clock:latest
   ```

2. Update the image reference in `kubernetes.yaml` if necessary:
   ```yaml
   image: your-registry/trump-clock:latest
   ```

3. Apply the Kubernetes configuration:
   ```
   kubectl apply -f kubernetes.yaml
   ```

4. Check the deployment status:
   ```
   kubectl get deployments
   kubectl get pods
   kubectl get services
   ```

5. Access the application:
   - If using the included Ingress, the application will be available at your cluster's ingress address
   - For local testing, you can port-forward:
     ```
     kubectl port-forward service/trump-clock-service 8080:80
     ```
     Then access at `http://localhost:8080`

## Configuration and Customization

### Changing the End Date

To modify the countdown target date, edit the `startCountdown` function in `index.html`:

```javascript
function startCountdown() {
    // Set the end date to your desired target
    const endDate = new Date('January 20, 2029 12:00:00');
    
    // ... rest of the function
}
```

### Styling Customizations

The visual appearance is controlled through CSS. Some common customizations:

- Change the display color: Modify the `background-color` and `box-shadow` properties for `.segment.on` and `.colon-dot`
- Adjust display size: Modify the dimensions in the `.digit` and related CSS classes
- Change background: Update the `body` background color or add a background image

### Adding Additional Features

- To add background music or sound effects when the countdown reaches zero, add audio elements and JavaScript event handlers
- For social media integration, add sharing buttons using standard social media widgets
- For analytics, add your preferred analytics tracking code to the HTML

## Resource Requirements and Scaling

This is a lightweight static application with minimal resource requirements:

- **CPU**: The Kubernetes configuration requests 0.1 CPU cores and limits to 0.2 cores, which is more than sufficient
- **Memory**: 64Mi requested, 128Mi limit - also very conservative
- **Storage**: Negligible (a few KB for the HTML file)
- **Network**: Minimal bandwidth requirements

### Scaling Considerations

- The application is stateless and can be scaled horizontally if needed
- The Kubernetes deployment is configured for 2 replicas by default for high availability
- For high-traffic scenarios, consider:
  - Increasing the number of replicas
  - Using a Content Delivery Network (CDN)
  - Implementing caching at the Ingress level

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the LICENSE file for details.

