#!/bin/bash 
# This script will be created the user account in *ix system.
echo "This is an AdminID:${UID}"
if [[ "${UID} != 0 ]]; then 
echo 'LOGIN as Root or Switch user,do.'
exit 1
fi 
if [[ "${#}" - lt 1 ]]; then 
echo "This is a first argument:${0}.USER_NAME is required.'
exit 1
fi 
USER_NAME="${1}"
shift 
COMMENT="${@}"
read -sp ' Enter the password for the user: 'PASSWORD
# create the user_name.
useradd -c "${COMMENT}"- m ${USER_NAME}
# Create the password for the user.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}
if [[ "${?}" - ne 0 ]]; then 
echo 'Stop the script.'
else 
 echo 'Continue the script.'
fi 
# Change the password at the next login.
passwd -e ${USER_NAME}
if [[ "${?}" == 0 ]]; then 
echo 'Password has successfully changed.'
else
echo 'Password Policy incorrect.'
fi 
# Diplay the server hostname.
echo 
echo "${HOSTNAME}"
echo 
echo 'Job well done....' 