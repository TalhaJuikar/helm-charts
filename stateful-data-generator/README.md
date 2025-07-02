# Stateful Data Generator Helm Chart

This Helm chart deploys the Stateful Data Generator application along with MongoDB on a Kubernetes cluster.

## Prerequisites

- Kubernetes 1.16+
- Helm 3.0+
- A default storage class configured in your Kubernetes cluster

## Installing the Chart

To install the chart with the release name `my-stateful-app`:

```bash
helm repo add my-charts https://talhajuikar.github.io/helm-charts/
helm repo update
```

## Uninstalling the Chart

To uninstall/delete the `my-stateful-app` deployment:

```bash
helm uninstall my-stateful-app
```

## Configuration

The following table lists the configurable parameters and their default values:

### Global Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `global.namespace` | Target namespace (if empty, uses release namespace) | `""` |
| `namespaceCreate` | Create namespace if it doesn't exist | `false` |

### Application Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `app.name` | Application name | `stateful-app` |
| `app.replicaCount` | Number of application replicas | `2` |
| `app.image.repository` | Application image repository | `ghcr.io/talhajuikar/stateful-data-generator` |
| `app.image.tag` | Application image tag | `v1.1.1` |
| `app.image.pullPolicy` | Image pull policy | `IfNotPresent` |
| `app.service.type` | Service type | `NodePort` |
| `app.service.port` | Service port | `80` |
| `app.service.targetPort` | Target port | `3000` |

### MongoDB Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `mongodb.enabled` | Enable MongoDB deployment | `true` |
| `mongodb.image.repository` | MongoDB image repository | `mongo` |
| `mongodb.image.tag` | MongoDB image tag | `4.4` |
| `mongodb.persistence.enabled` | Enable persistence | `true` |
| `mongodb.persistence.size` | Storage size | `1Gi` |
| `mongodb.persistence.storageClass` | Storage class | `""` |

### Other Configuration

| Parameter | Description | Default |
|-----------|-------------|---------|
| `ingress.enabled` | Enable ingress | `false` |
| `serviceAccount.create` | Create service account | `true` |

## Examples

### Install with custom values

```bash
helm install my-app ./helm-chart \
  --set app.replicaCount=3 \
  --set mongodb.persistence.size=5Gi
```

### Install in a specific namespace

```bash
# Install in existing namespace
helm install my-app ./helm-chart --namespace production

# Install with custom namespace and create it
helm install my-app ./helm-chart \
  --set global.namespace=my-custom-namespace \
  --set namespaceCreate=true
```

### Install with values file

```bash
helm install my-app ./helm-chart -f custom-values.yaml
```
