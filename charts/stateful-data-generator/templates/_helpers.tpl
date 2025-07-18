{{/*
Expand the name of the chart.
*/}}
{{- define "stateful-data-generator.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "stateful-data-generator.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "stateful-data-generator.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "stateful-data-generator.labels" -}}
helm.sh/chart: {{ include "stateful-data-generator.chart" . }}
{{ include "stateful-data-generator.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "stateful-data-generator.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stateful-data-generator.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "stateful-data-generator.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "stateful-data-generator.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
MongoDB labels
*/}}
{{- define "stateful-data-generator.mongodb.labels" -}}
helm.sh/chart: {{ include "stateful-data-generator.chart" . }}
{{ include "stateful-data-generator.mongodb.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
app.kubernetes.io/component: database
{{- end }}

{{/*
MongoDB selector labels
*/}}
{{- define "stateful-data-generator.mongodb.selectorLabels" -}}
app.kubernetes.io/name: {{ include "stateful-data-generator.name" . }}-mongodb
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
MongoDB service name
*/}}
{{- define "stateful-data-generator.mongodb.serviceName" -}}
{{- printf "%s-mongodb-service" (include "stateful-data-generator.fullname" .) }}
{{- end }}

{{/*
Namespace helper - uses global namespace or release namespace
*/}}
{{- define "stateful-data-generator.namespace" -}}
{{- if .Values.global.namespace }}
{{- .Values.global.namespace }}
{{- else }}
{{- .Release.Namespace }}
{{- end }}
{{- end }}
