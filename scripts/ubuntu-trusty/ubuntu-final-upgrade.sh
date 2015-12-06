#!/bin/bash

# This script runs after all else to upgrade any out of date packages on the Ubuntu 14.04.03 install
echo -e "\n--- Doing final upgrade of any out of date software with apt-get... ---\n"
sudo apt-get upgrade

echo -e "\n--- All done! Now that is one sexy server! ---\n"
