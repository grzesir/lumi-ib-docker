#!/bin/bash
echo "Setting up XVFB environment..."
mkdir -p /home/ibgateway/.X11-unix || echo "Failed to create /home/ibgateway/.X11-unix"
chmod 1777 /home/ibgateway/.X11-unix || echo "Failed to set permissions for /home/ibgateway/.X11-unix"

echo "Starting XVFB..."
Xvfb :99 -screen 0 1024x768x24 -nolisten tcp -nolisten unix -noreset &
export DISPLAY=:99

echo "Starting IB Gateway with IBC..."
java -cp "/home/ibgateway/Jts/ibgateway/${TWS_VERSION}/jars/*:/home/ibgateway/ibc/IBC.jar" ibcalpha.ibc.IbcGateway "/home/ibgateway/ibc/config.ini" "$TWS_USERID" "$TWS_PASSWORD" "$TRADING_MODE"

if [ $? -ne 0 ]; then
    echo "Failed to start IB Gateway with IBC. Exiting..."
    exit 1
fi

echo "IB Gateway started successfully."
