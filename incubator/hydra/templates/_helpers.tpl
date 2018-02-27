{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "hydra.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "hydra.fullname" -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Return the database URL (base64 encoded and quoted).
If the postgresql dependency is enabled, it will return the URL for the postgres database.
Otherwise, it will return the set value.
*/}}
{{- define "hydra.databaseURL" -}}
{{- if .Values.postgresql.enabled -}}
{{ $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{ $pgHost := printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- printf "postgres://%s:%s@%s/%s?sslmode=disable" .Values.postgresql.postgresUser .Values.postgresql.postgresPassword $pgHost .Values.postgresql.postgresDatabase | b64enc -}}
{{- else -}}
{{- .Values.config.hydra.databaseURL | b64enc -}}
{{- end -}}
{{- end -}}

{{/*
Create a default fully qualified postgresql name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "hydra.postgresql.fullname" -}}
{{- $name := default "postgresql" .Values.postgresql.nameOverride -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
