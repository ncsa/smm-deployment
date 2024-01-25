# system setting
export DOCKERIZED=true

# if use AWS algorithm, then you must use a static IP address
export LOCAL_ALGORITHM=true

# single user version vs multiple users
export SINGLE_USER=false

#set up home directory
export HOME=/your/home/directory

#set server info
export SERVER=smm.server.com

# set each component's tag
export SMILE_SERVER_TAG=0.3.2
export SMILE_GRAPHQL_TAG=0.3.0
export CLASSIFICATION_PREDICT_TAG=0.1.2
export CLASSIFICATION_SPLIT_TAG=0.1.2
export CLASSIFICATION_TRAIN_TAG=0.1.2
export HISTOGRAM_TAG=0.1.1
export NETWORK_ANALYSIS_TAG=0.1.4
export PREPROCESSING_TAG=0.1.4
export SENTIMENT_ANALYSIS_TAG=0.1.6
export SCREEN_NAME_PROMPT_TAG=0.1.2
export TOPIC_MODELING_TAG=0.1.4
export NAME_ENTITY_RECOGNITION_TAG=0.1.3
export AUTOPHRASE_TAG=0.1.6
export IMAGE_CRAWLER_TAG=0.1.3
export COLLECT_REDDIT_COMMENT_TAG=0.1.2

# set component's tag for clowder
export CLOWDER_UPLOAD_FILE_TAG=0.1.2
export CLOWDER_LIST_TAG=0.1.0
export CLOWDER_CREATE_SPACE_TAG=0.1.0
export CLOWDER_CREATE_DATASET_TAG=0.1.0
export CLOWDER_CREATE_COLLECTION_TAG=0.1.1

# settings for CILOGON
export CILOGON_CLIENT_ID=<<cilogon id>>
export CILOGON_CLIENT_SECRET=<<cilogon client secret>>
export CILOGON_CALLBACK_URL=<<ci logon callback url>>

# setting for google analytics 4 key
export GA_KEY=

# if the minio-api.server doesn't work, it should be ip address and port
# export MINIO_URL=http://xxx.xxx.xxx.xxx:9000
# export MINIO_PUBLIC_ACCESS_URL=http://xxx.xxx.xxx.xxx:9000
export MINIO_URL=https://minio-api.${SERVER}
export MINIO_PUBLIC_ACCESS_URL=https://minio-api.${SERVER}
export BUCKET_NAME=macroscope-smile
export SHARE_EXPIRE_IN=1

# if the graphql.server doesn't work, it should use ip address and port
#export SMILE_GRAPHQL_URL=http://xxx.xxx.xxx.xxx:5050/graphql
export SMILE_GRAPHQL_URL=https://graphql.${SERVER}/graphql

# create mounted volumes on host machine
mkdir -p ${HOME}/smile_data/${BUCKET_NAME}
mkdir -p ${HOME}/smile_user
mkdir -p ${HOME}/smile

export RABBITMQ_HOST=${SERVER}
export RABBITMQ_URL=amqp://${SERVER}
export REDIS_URL=redis://redis

# the frontend will not ask the prompt window for asking the email
# to send when some process is done and ready
# if the following email related variables are setting
# email notification prompt will show up if the following variables are set
#export EMAIL_HOST=<<email host>>
#export EMAIL_PORT=465
#export EMAIL_FROM_ADDRESS=<<email from address>>
#export EMAIL_PASSWORD=<<email password>>

# align with AWS
export AWS_ACCESSKEY=<<aws_accesskey>>
export AWS_ACCESSKEYSECRET=<<aws_accesskeysecret>>

# social media platforms
export REDDIT_ON=true
export REDDIT_CLIENT_ID=<<reddit client id>>
export REDDIT_CLIENT_SECRET=<<reddit client secret>>
export REDDIT_CALLBACK_URL=<<reddit callback url>>
export TWITTER_ON=true
#export TWITTER_CONSUMER_KEY=<<twitter consumer key>>
#export TWITTER_CONSUMER_SECRET=<<twitter consumer secret>>
export TWITTER_V2_CLIENT_ID=<<twitter v2 client id>>
export TWITTER_V2_CLIENT_SECRET=<<twitter v2 client secret>>
export TWITTER_V2_CALLBACK_URL=<<twitter v2 callback url>>

# export
export BOX_CLIENT_ID=<box client id>
export BOX_CLIENT_SECRET=<<box client secret>>
export DROPBOX_CLIENT_ID=<<dropbox client id>>
export DROPBOX_CLIENT_SECRET=<<dropbox client secret>>
export GOOGLE_CLIENT_ID=<<google client id>>
export GOOGLE_CLIENT_SECRET=<<google client secret>>

export CLOWDER_BASE_URL=https://clowder.server.com/
export CLOWDER_GLOBAL_KEY=<<clowder global key>>
export CLOWDER_ON=false

# start
docker-compose -f docker-compose-smile-traefik.yml -d up

# start with clowder add-on
# docker-compose -f docker-compose-smile-traefik.yml -f docker-compose-smile-clowder.yml -d up

# stop
# docker-compose -f docker-compose-smile.yml down -v

# update latest image from docker hub
# docker-compose -f docker-compose-smile.yml pull
