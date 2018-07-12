{{- /*
alerta.hook defines a hook.

This is to be used in a 'metadata.annotations' section.

This should be called as 'template "alerta.metadata.hook" "post-install"'

Any valid hook may be passed in. Separate multiple hooks with a ",".
*/ -}}
{{- define "alerta.hook" -}}
"helm.sh/hook": {{printf "%s" . | quote}}
{{- end -}}

{{- define "alerta.annote" -}}
{{- range $k, $v := . }}
{{ $k | quote }}: {{ $v | quote }}
{{- end -}}
{{- end -}}
