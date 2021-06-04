
#!/usr/bin/env sh
##
# Create some example content for extension BDD tests.
#
set -e

CKAN_ACTION_URL=http://ckan:3000/api/action

. $APP_DIR/bin/activate \
    && cd $SRC_DIR/ckan

# We know the "admin" sysadmin account exists, so we'll use her API KEY to create further data
API_KEY=$(paster --plugin=ckan user admin -c ${CKAN_INI} | tr -d '\n' | sed -r 's/^(.*)apikey=(\S*)(.*)/\2/')

# Creating test data hierarchy which creates organisations assigend to datasets
paster create-test-data hierarchy -c ${CKAN_INI}

# Creating basic test data which has datasets with resources
paster create-test-data -c ${CKAN_INI}

echo "Updating annakarenina to use department-of-health Organisation:"
package_owner_org_update=$( \
    curl -L -s --header "Authorization: ${API_KEY}" \
    --data "id=annakarenina&organization_id=department-of-health" \
    ${CKAN_ACTION_URL}/package_owner_org_update
)
echo ${package_owner_org_update}

deactivate
