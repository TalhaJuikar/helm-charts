# Helm Charts Repository

[![Artifact Hub](https://img.shields.io/endpoint?url=https://artifacthub.io/badge/repository/talhajuikar-helm-charts)](https://artifacthub.io/packages/search?repo=talhajuikar-helm-charts)

This repository contains Helm charts for various applications.

## Available Charts

### stateful-data-generator

A Helm chart for the stateful data generator application with MongoDB.

**Version:** 0.1.0  
**App Version:** 1.1.1

## Usage

Add this Helm repository:

```bash
helm repo add my-charts https://talhajuikar.github.io/helm-charts/
helm repo update
```

Install a chart:

```bash
helm install my-release my-charts/stateful-data-generator
```

## Charts

| Chart | Description | Version |
|-------|-------------|---------|
| [stateful-data-generator](./stateful-data-generator/) | A Helm chart for the stateful data generator application with MongoDB | 0.1.0 |

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
