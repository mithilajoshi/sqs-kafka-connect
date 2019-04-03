#!/bin/bash

# Prepare a credentials file so we can publish to artifactory.  Call this from
# an SBT task.  Moving the logic here to avoid the arcane SBT approach and avoid
# having things done out of order!

CREDS_TEMPLATE=$(cat <<EOF
realm=Artifactory Realm
host=artifactory.vertigo.stitchfix.com
user=flotilla
password=dummy
EOF
)

echo "$CREDS_TEMPLATE" > credentials_tmp
CURRENT_RESULT=$(curl http://vault.vertigo.stitchfix.com/secure/flotilla-auto)
sed "s/dummy/$CURRENT_RESULT/" credentials_tmp > .credentials
rm credentials_tmp
echo "Credentials file saved"
