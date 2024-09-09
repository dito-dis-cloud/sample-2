#FROM registry.access.redhat.com/ubi8/python-36
FROM registry.access.redhat.com/ubi9/python-311:1-72.1724040033

# By default, listen on port 8081
EXPOSE 8081/tcp
ENV FLASK_PORT=8081

# Set the working directory in the container
WORKDIR /app-src

# Copy the content of the local src directory to the working directory
COPY . .

# Add application sources with correct permissions for OpenShift
#USER 0
#COPY . .
#RUN chown -R 1001:0 ./
#USER 1001

# Install the dependencies
RUN pip install Flask


# Run the application
CMD [ "python", "app.py" ]