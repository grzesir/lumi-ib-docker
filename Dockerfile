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
COPY config.ini /home/ibgateway/ibc/config.ini

# Set the correct permissions for the config.ini file
RUN chown ibgateway:ibgateway /home/ibgateway/ibc/config.ini \
    && chmod 644 /home/ibgateway/ibc/config.ini

# Expose necessary ports
EXPOSE 4001
EXPOSE 4002
EXPOSE 4003
EXPOSE 4004
EXPOSE 5900

# Use the same command as the original image
CMD ["/home/ibgateway/scripts/run.sh"]
