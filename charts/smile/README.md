## SMILE (Social Media Intelligence and Learning Environment)

### For users or potential users:
- Contact us the SMM DEV Team if you have any question: <a href="mailto:smm@lists.illinois.edu">smm@lists.illinois.edu</a>
- Try out our [SMILE Playground](https://smile.smm.ncsa.illinois.edu/)

```bash
$ helm repo add ncsa https://opensource.ncsa.illinois.edu/charts/
$ helm install smile ncsa/smile
```

## Introduction

This chart bootstraps the SMILE  deployment on a [Kubernetes](http://kubernetes.io) cluster using the
[Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.16+
- helm 3
- PV provisioner support in the underlying infrastructure

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release ncsa/smile
```

The command deploys SMILE  on the Kubernetes cluster in the default configuration. The [configuration](#configuration) section lists the parameters that can be configured during installation. This will also install MinIO, RabbitMQ, redis as well as some extractors.

> **Tip**: List all releases using `helm list`

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.

## Configuration

The following table lists the configurable parameters of the SMILE chart and their default values.

| Parameter                                          | Description                                             | Default                                |
|----------------------------------------------------|---------------------------------------------------------|----------------------------------------|
| ingress.hosts[0].host                              | Ingress rule for smile                                  | smile.example.com                      |
| ingress.hosts[1].host                              | Ingress rule for clowder                                | clowder.exmaple.com                    |
| ingress.traefik                                    | Use Traefik V2 middleware                               | false                                  |
| image.pullPolicy                                   | Image pull policy                                       | IfNotPresent                           |
| image.project                                      | Image repository                                        | socialmediamacroscope                  |
| image.PullSecrets.name                             | Secret for pulling images                               | regcred                                |
| externalSecrets                                    | Use external secrets                                    | smile-server                           |
| autoscaling.enabled                                | Enable autoscaling                                      | false                                  |
| autoscaling.minReplicas                            | Minimum number of replicas                              | 1                                      |
| autoscaling.maxReplicas                            | Maximum number of replicas                              | 100                                    |
| smile_server.replicas                              | Replica count for smile_server                          | 1                                      |     
| smile_server.image.repository                      | Image repository for smile_server                       | smile_server                           |
| smile_server.image.tag                             | Image tag for smile_server                              | latest                                 |
| smile_server.app_env                               | Environment for smile_server                            | production                             |
| smile_server.persistence.size                      | Size for smile_servers persistence volume               | 1GB                                    |
| smile_graphql.replicas                             | Replica count for smile_graphql                         | 1                                      |
| smile_graphql.image.repository                     | Image repository for smile_graphql                      | smile_graphql                          |
| smile_graphql.image.tag                            | Image tag for smile_graphql                             | latest                                 |
| algorithm_autophrase.replicas                      | Replica count for algorithm_autophrase                  | 1                                      |
| algorithm_autophrase.image.repository              | Image repository for algorithm_autophrase               | algorithm_autophrase                   |
| algorithm_autophrase.image.tag                     | Image tag for algorithm_autophrase                      | latest                                 |
| algorithm_classification_predict.replicas          | Replica count for algorithm_classification_predict      | 1                                      |
| algorithm_classification_predict.image.repository  | Image repository for algorithm_classification_predict   | algorithm_classification_predict       |
| algorithm_classification_predict.image.tag         | Image tag for algorithm_classification_predict          | latest                                 |
| algorithm_classification_split.replicas            | Replica count for algorithm_classification_split        | 1                                      |
| algorithm_classification_split.image.repository    | Image repository for algorithm_classification_split     | algorithm_classification_split         |
| algorithm_classification_split.image.tag           | Image tag for algorithm_classification_split            | latest                                 |
| algorithm_classification_train.replicas            | Replica count for algorithm_classification_train        | 1                                      |
| algorithm_classification_train.image.repository    | Image repository for algorithm_classification_train     | algorithm_classification_train         |
| algorithm_classification_train.image.tag           | Image tag for algorithm_classification_train            | latest                                 |
| algorithm_histogram.replicas                       | Replica count for algorithm_histogram                   | 1                                      |
| algorithm_histogram.image.repository               | Image repository for algorithm_histogram                | algorithm_histogram                    |
| algorithm_histogram.image.tag                      | Image tag for algorithm_histogram                       | latest                                 |
| algorithm_network_analysis.replicas                | Replica count for algorithm_network_analysis            | 1                                      |
| algorithm_network_analysis.image.repository        | Image repository for algorithm_network_analysis         | algorithm_network_analysis             |
| algorithm_network_analysis.image.tag               | Image tag for algorithm_network_analysis                | latest                                 |
| algorithm_preprocessing.replicas                   | Replica count for algorithm_preprocessing               | 1                                      |
| algorithm_preprocessing.image.repository           | Image repository for algorithm_preprocessing            | algorithm_preprocessing                |
| algorithm_preprocessing.image.tag                  | Image tag for algorithm_preprocessing                   | latest                                 |
| algorithm_sentiment_analysis.replicas              | Replica count for algorithm_sentiment_analysis          | 1                                      |
| algorithm_sentiment_analysis.image.repository      | Image repository for algorithm_sentiment_analysis       | algorithm_sentiment_analysis           |
| algorithm_sentiment_analysis.image.tag             | Image tag for algorithm_sentiment_analysis              | latest                                 |
| algorithm_screen_name_prompt.replicas              | Replica count for algorithm_screen_name_prompts         | 1                                      |
| algorithm_screen_name_prompt.image.repository      | Image repository for algorithm_screen_name_prompts      | algorithm_screen_name_prompts          |
| algorithm_screen_name_prompt.image.tag             | Image tag for algorithm_screen_name_prompts             | latest                                 |
| algorithm_topic_modeling.replicas                  | Replica count for algorithm_topic_modeling              | 1                                      |
| algorithm_topic_modeling.image.repository          | Image repository for algorithm_topic_modeling           | algorithm_topic_modeling               |
| algorithm_topic_modeling.image.tag                 | Image tag for algorithm_topic_modeling                  | latest                                 |
| algorithm_name_entity.recognition.replicas         | Replica count for algorithm_name_entity_recognition     | 1                                      |
| algorithm_name_entity.recognition.image.repository | Image repository for algorithm_name_entity_recognition  | algorithm_name_entity_recognition      |
| algorithm_name_entity.recognition.image.tag        | Image tag for algorithm_name_entity_recognition         | latest                                 |
| image_crawler.replicas                             | Replica count for image_crawler                         | 1                                      |
| image_crawler.image.repository                     | Image repository for image_crawler                      | image_crawler                          |
| image_crawler.image.tag                            | Image tag for image_crawler                             | latest                                 |
| collect_reddit_comments.replicas                   | Replica count for collect_reddit_comments               | 1                                      |
| collect_reddit_comments.image.repository           | Image repository for collect_reddit_comments            | collect_reddit_comments                |
| collect_reddit_comments.image.tag                  | Image tag for collect_reddit_comments                   | latest                                 |
| clowder_create_collection.replicas                 | Replica count for clowder_create_collection             | 1                                      |
| clowder_create_collection.image.repository         | Image repository for clowder_create_collection          | clowder_create_collection              |
| clowder_create_collection.image.tag                | Image tag for clowder_create_collection                 | latest                                 |
| clowder_create_dataset.replicas                    | Replica count for clowder_create_dataset                | 1                                      |
| clowder_create_dataset.image.repository            | Image repository for clowder_create_dataset             | clowder_create_dataset                 |
| clowder_create_dataset.image.tag                   | Image tag for clowder_create_dataset                    | latest                                 |
| clowder_create_space.replicas                      | Replica count for clowder_create_space                  | 1                                      |
| clowder_create_space.image.repository              | Image repository for clowder_create_space               | clowder_create_space                   |
| clowder_create_space.image.tag                     | Image tag for clowder_create_space                      | latest                                 |
| clowder_list.replicas                              | Replica count for clowder_create_list                   | 1                                      |
| clowder_list.image.repository                      | Image repository for clowder_create_list                | clowder_create_list                    |
| clowder_list.image.tag                             | Image tag for clowder_create_list                       | latest                                 |
| clowder_upload_file.replicas                       | Replica count for clowder_upload_file                   | 1                                      |
| clowder_upload_file.image.repository               | Image repository for clowder_upload_file                | clowder_upload_file                    |
| clowder_upload_file.image.tag                      | Image tag for clowder_upload_file                       | latest                                 |



Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`. Or more convenient
use a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

```bash
$ helm install --name my-release -f values.yaml ncsa/smile
```

> **Tip**: You can use the default [values.yaml](values.yaml) to find the names of all options

## Persistence

SMILE will use a persistent storage to store all data that is uploaded as well as is generated.

### Existing PersistentVolumeClaims

1. Create the PersistentVolume
1. Create the PersistentVolumeClaim
1. Install the chart

For an example of using existing PVC, see the file [smile-pvc.yaml](smile-pvc.yaml.template).


## Changelog

### 0.1.0
- helm chart files. [#1](https://github.com/ncsa/smm-deployment/issues/1)
