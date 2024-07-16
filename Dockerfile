#### WORKING VERSION ####

FROM ghcr.io/gnzsnz/ib-gateway:stable

# Set static environment variables
ENV VNC_SERVER_PASSWORD=myVncPassword
ENV TWOFA_TIMEOUT_ACTION=restart
ENV RELOGIN_AFTER_2FA_TIMEOUT=yes
ENV TIME_ZONE=America/New_York
ENV READ_ONLY_API=no
# ib-gateway
ENV TWS_SETTINGS_PATH=/home/ibgateway/Jts
# tws
# ENV TWS_SETTINGS_PATH=/config/tws_settings
ENV TWS_ACCEPT_INCOMING=accept
ENV AUTO_RESTART_TIME="11:59 PM"

# Expose necessary ports
EXPOSE 4003
EXPOSE 4004
EXPOSE 5900

# Use the same command as the original image
CMD ["/home/ibgateway/scripts/run.sh"]