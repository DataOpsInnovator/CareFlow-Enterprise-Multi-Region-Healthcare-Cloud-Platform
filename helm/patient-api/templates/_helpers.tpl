{{- define "patient-api.fullname" -}}
{{- printf "%s-patient-api" .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
