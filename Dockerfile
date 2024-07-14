FROM ghcr.io/gnzsnz/ib-gateway:stable

# Set static environment variables
ENV VNC_SERVER_PASSWORD=myVncPassword
ENV TWOFA_TIMEOUT_ACTION=exit
ENV RELOGIN_AFTER_2FA_TIMEOUT=yes
ENV TIME_ZONE=America/New_York
ENV READ_ONLY_API=no
ENV TWS_SETTINGS_PATH=/home/ibgateway/Jts
ENV TWS_ACCEPT_INCOMING=accept

# Copy IBC configuration file
USER root
COPY config.ini /home/ibgateway/ibc/config.ini

# Set the correct permissions for the config.ini file
RUN chown ibgateway:ibgateway /home/ibgateway/ibc/config.ini \
    && chmod 644 /home/ibgateway/ibc/config.ini

# Switch back to the ibgateway user
USER ibgateway

# Expose necessary ports
EXPOSE 80
EXPOSE 443
EXPOSE 5900

# Use the same command as the original image
CMD ["/home/ibgateway/scripts/run.sh"]
