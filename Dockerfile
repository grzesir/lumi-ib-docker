FROM ghcr.io/gnzsnz/ib-gateway:10.30.1g

# Set working directory
WORKDIR /home/ibgateway

# Install necessary packages
USER root
RUN apt-get update && apt-get install -y xvfb openjdk-8-jdk nano vim

# Set environment variable
ENV TWS_VERSION=10.30.1g

# Copy configuration files into the container
COPY config.ini /home/ibgateway/ibc/config.ini
COPY entrypoint.sh /home/ibgateway/entrypoint.sh
COPY jts.ini /home/ibgateway/Jts/jts.ini

# Ensure the entrypoint script and directories are executable and writable
RUN chmod +x /home/ibgateway/entrypoint.sh && \
    mkdir -p /tmp/.X11-unix && \
    chmod 1777 /tmp/.X11-unix && \
    chown -R ibgateway:ibgateway /home/ibgateway/ibc /home/ibgateway/Jts

# Switch back to the non-root user
USER ibgateway

# Start the IB Gateway with xvfb
CMD ["/home/ibgateway/entrypoint.sh"]
