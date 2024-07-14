FROM ghcr.io/gnzsnz/ib-gateway:stable

# Set environment variables
ENV TWS_USERID=rgrze4067
ENV TWS_PASSWORD=6TV9nuY8
ENV TWS_SETTINGS_PATH=/home/ibgateway/Jts
ENV TRADING_MODE=paper
ENV VNC_SERVER_PASSWORD=myVncPassword
ENV TIME_ZONE=America/New_York
ENV READ_ONLY_API=no
ENV MASTER_CLIENT_ID=1

# Expose necessary ports
EXPOSE 4003
EXPOSE 4004
EXPOSE 5900

# Use the same command as the original image
CMD ["/home/ibgateway/scripts/run.sh"]



# FROM ghcr.io/gnzsnz/ib-gateway:stable

# # Set static environment variables
# ENV VNC_SERVER_PASSWORD=myVncPassword
# ENV TWOFA_TIMEOUT_ACTION=exit
# ENV RELOGIN_AFTER_2FA_TIMEOUT=yes
# ENV TIME_ZONE=America/New_York
# ENV READ_ONLY_API=no
# ENV TWS_SETTINGS_PATH=/home/ibgateway/Jts
# ENV TWS_ACCEPT_INCOMING=accept

# # Expose necessary ports
# EXPOSE 4003
# EXPOSE 4004
# EXPOSE 5900

# # Use the same command as the original image
# CMD ["/home/ibgateway/scripts/run.sh"]
