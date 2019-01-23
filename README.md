# Build

    docker build --no-cache --tag testingmaven .

# Run 

    docker run -p 8080:8080 testingmaven

Visit http://127.0.0.1:8080/hello

## See also

- https://docs.docker.com/develop/develop-images/multistage-build/ 
- https://www.eclipse.org/jetty/documentation/9.4.x/maven-and-jetty.html
