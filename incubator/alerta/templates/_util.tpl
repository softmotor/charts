{{- /*
alerta.util.merge will merge two YAML templates and output the result.

This takes an array of three values:
- the top context
- the template name of the overrides (destination)
- the template name of the base (source)

*/ -}}
{{- define "alerta.util.merge" -}}
{{- $top := first . -}}
{{- $overrides := fromYaml (include (index . 1) $top) -}}
{{- $tpl := fromYaml (include (index . 2) $top) -}}
{{- toYaml (merge $overrides $tpl) -}}
{{- end -}}
