{{- define "ibm-common-elastic-curator.sizeData" -}}
hpa:
  size0:
    enabled: false
  size1:
    enabled: false
commonelasticcurator:
  size0:
    jvmArgs: "-Xms1024M -Xmx2048M"
    resources:
      requests:
        memory: "1200Mi"
        cpu: "0.2"
      limits:
        memory: "2800Mi"
        cpu: "1.0"
  size1:
    jvmArgs: "-Xms2048M -Xmx3072M"
    resources:
      requests:
        memory: "2400Mi"
        cpu: "1.0"
      limits:
        memory: "4000Mi"
        cpu: "2.5"
{{- end -}}

{{- define "ibm-common-elastic-curator.comp.size.data" -}}
  {{- $root := (index . 0) -}}
  {{- $resName := (index . 1) -}}
  {{- $keyName := (index . 2) -}}
  {{- $sizeData := fromYaml (include "ibm-common-elastic-curator.sizeData" .) -}}
  {{- $resData := index $sizeData $resName -}}
  {{- $resSizeData := index $resData $root.Values.global.environmentSize -}}
  {{- $result := index $resSizeData $keyName -}}

  {{- toYaml $result | trimSuffix "\n" -}}
{{- end -}}
