FROM ghcr.io/gnzsnz/ib-gateway:stable

# Set static environment variables
ENV VNC_SERVER_PASSWORD=myVncPassword
ENV TWOFA_TIMEOUT_ACTION=exit
ENV RELOGIN_AFTER_2FA_TIMEOUT=yes
ENV TIME_ZONE=America/New_York
ENV READ_ONLY_API=no
ENV TWS_SETTINGS_PATH=/home/ibgateway/Jts
ENV TWS_ACCEPT_INCOMING=accept

# Expose necessary ports
EXPOSE 4003
EXPOSE 4004
EXPOSE 5900

# Print environment variables for debugging
RUN printenv > /home/ibgateway/env_vars.txt

# Use the same command as the original image
CMD ["/home/ibgateway/scripts/run.sh"]
