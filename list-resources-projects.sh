 #!/bin/bash

for PROJECT_ID in $(gcloud projects list --format="value(projectId)")
do
    echo projectId= $PROJECT_ID # informação adicionada para teste

    if [ -z $PROJECT_ID ]
        then
            echo "Variable PROJECT_ID is NULL"
        else
            gcloud asset export \
            --content-type resource \
            --project ${PROJECT_ID} \
            --asset-types compute.googleapis.com.* \
            --output-path "gs://controle-inventario/resources-4"
    fi
done
