{{- define "management.json.tmpl" -}}
{{- $config := .Values.config | default dict }}
{{- $Stuns := $config.Stuns | default list }}
Stuns:
  {{- range $Stuns }}
  - Proto: {{ .Proto | default "udp" | quote }}
    URI: {{ .URI | quote }}
    Username: {{ .Username | default "" | quote }}
    Password: {{ .Password | default "" }}
  {{- end }}
{{- $TURNConfig := $config.TURNConfig | default dict }}
TURNConfig:
  Turns:
    {{- range $TURNConfig.Turns}}
    - Proto: {{ .Proto | default "udp" | quote }}
      URI: {{ .URI | quote }}
      Username: {{ .Username | default "$TURN_USER" | quote }}
      Password: {{ .Password | default "$TURN_PASSWORD" }}
    {{- end }}
  CredentialsTTL: {{ $TURNConfig.CredentialsTTL | default "12h" | quote }}
  Secret: {{ $TURNConfig.Secret | default "secret" | quote }}
  TimeBasedCredentials: {{ $TURNConfig.TimeBasedCredentials | default false }}
{{- $Relay := $config.Relay | default dict }}
Relay:
  Addresses:
    {{- range $Relay.Addresses }}
    - {{ . | quote }}
    {{- end }}
  CredentialsTTL: {{ $Relay.CredentialsTTL | default "24h" | quote }}
  Secret: {{ $Relay.Secret | default "$NETBIRD_RELAY_AUTH_SECRET" | quote }}
{{- $Signal := $config.Signal | default dict }}
Signal:
  Proto: {{ $Signal.Proto | default "https" | quote }}
  URI: {{ $Signal.URI | default "" | quote }}
  Username: {{ $Signal.Username | default "" | quote }}
  Password: {{ $Signal.Password | default "" }}
{{- $ReverseProxy := $config.ReverseProxy | default dict }}
ReverseProxy:
  TrustedHTTPProxies:
    {{- range $ReverseProxy.TrustedHTTPProxies }}
    - {{ . | quote }}
    {{- end }}
  TrustedHTTPProxiesCount: {{ $ReverseProxy.TrustedHTTPProxiesCount | default 0 }}
  TrustedPeers: 
    {{- range $ReverseProxy.TrustedPeers }}
    - {{ . | quote }}
    {{- end }}
DataDir: {{ $config.DataDir | default "/var/lib/netbird/" | quote }}
DataStoreEncryptionKey: {{ $config.DataStoreEncryptionKey | default "$NETBIRD_DATASTORE_ENC_KEY" | quote }}
{{- $StoreConfig := $config.StoreConfig | default dict }}
StoreConfig:
  Engine: {{ $StoreConfig.Engine | default "sqlite" | quote }}
{{- $HttpConfig := $config.HttpConfig | default dict }}
HttpConfig:
  Address: {{ $HttpConfig.Address | default "" | quote }}
  AuthIssuer: {{ $HttpConfig.AuthIssuer | default "" | quote }}
  AuthAudience: {{ $HttpConfig.AuthAudience | default "" | quote }}
  AuthKeysLocation: {{ $HttpConfig.AuthKeysLocation | default "" | quote }}
  AuthUserIDClaim: {{ $HttpConfig.AuthUserIDClaim | default "" | quote }}
  CertFile: {{ $HttpConfig.CertFile | default "" | quote }}
  CertKey: {{ $HttpConfig.CertKey | default "" | quote }}
  IdpSignKeyRefreshEnabled: {{ $HttpConfig.IdpSignKeyRefreshEnabled | default "" | quote }}
  OIDCConfigEndpoint: {{ $HttpConfig.OIDCConfigEndpoint | default "" | quote }}
{{- $IdpManagerConfig := $config.IdpManagerConfig | default dict }}
IdpManagerConfig:
  ManagerType: {{ $IdpManagerConfig.ManagerType | default "" | quote }}
  {{- $IdpManagerConfigClientConfig := $IdpManagerConfig.ClientConfig | default dict }}
  ClientConfig:
    Issuer: {{ $IdpManagerConfigClientConfig.Issuer | default "" | quote }}
    TokenEndpoint: {{ $IdpManagerConfigClientConfig.TokenEndpoint | default "" | quote }}
    ClientID: {{ $IdpManagerConfigClientConfig.ClientID | default "" | quote }}
    ClientSecret: {{ $IdpManagerConfigClientConfig.ClientSecret | default "" | quote }}
    GrantType: {{ $IdpManagerConfigClientConfig.GrantType | default "client_credentials" | quote }}
  ExtraConfig: {{ $IdpManagerConfigClientConfig.ExtraConfig | default "" }}
  Auth0ClientCredentials: {{ $IdpManagerConfig.Auth0ClientCredentials | default "" }}
  AzureClientCredentials: {{ $IdpManagerConfig.AzureClientCredentials | default "" }}
  KeycloakClientCredentials: {{ $IdpManagerConfig.KeycloakClientCredentials | default "" }}
  ZitadelClientCredentials: {{ $IdpManagerConfig.ZitadelClientCredentials | default "" }}
{{- $DeviceAuthorizationFlow := $config.DeviceAuthorizationFlow | default dict }}
  Provider: {{ $DeviceAuthorizationFlow.Provider | default "" | quote }}
  {{- $DeviceAuthorizationFlowProviderConfig := $DeviceAuthorizationFlow.ProviderConfig | default dict }}
  ProviderConfig:
    Audience: {{ $DeviceAuthorizationFlowProviderConfig.Audience | default "" | quote }}
    AuthorizationEndpoint: {{ $DeviceAuthorizationFlowProviderConfig.AuthorizationEndpoint | default "" | quote }}
    Domain: {{ $DeviceAuthorizationFlowProviderConfig.Domain | default "" | quote }}
    ClientID: {{ $DeviceAuthorizationFlowProviderConfig.ClientID | default "" | quote }}
    ClientSecret: {{ $DeviceAuthorizationFlowProviderConfig.ClientSecret | default "" | quote }}
    TokenEndpoint: {{ $DeviceAuthorizationFlowProviderConfig.TokenEndpoint | default "" | quote }}
    DeviceAuthEndpoint: {{ $DeviceAuthorizationFlowProviderConfig.DeviceAuthEndpoint | default "" | quote }}
    Scope: {{ $DeviceAuthorizationFlowProviderConfig.Scope | default "" | quote }}
    UseIDToken: {{ $DeviceAuthorizationFlowProviderConfig.UseIDToken | default "" | quote }}
    RedirectURLs: {{ $DeviceAuthorizationFlowProviderConfig.RedirectURLs | default "" }}
{{- $PKCEAuthorizationFlow := $config.PKCEAuthorizationFlow | default dict }}
PKCEAuthorizationFlow:
  {{- $PKCEAuthorizationFlowProviderConfig := $PKCEAuthorizationFlow.ProviderConfig | default dict }}
  ProviderConfig:
    Audience: {{ $PKCEAuthorizationFlowProviderConfig.Audience | default "" | quote }}
    ClientID: {{ $PKCEAuthorizationFlowProviderConfig.ClientID | default "" | quote }}
    ClientSecret: {{ $PKCEAuthorizationFlowProviderConfig.ClientSecret | default "" | quote }}
    Domain: {{ $PKCEAuthorizationFlowProviderConfig.Domain | default "" | quote }}
    AuthorizationEndpoint: {{ $PKCEAuthorizationFlowProviderConfig.AuthorizationEndpoint | default "" | quote }}
    TokenEndpoint: {{ $PKCEAuthorizationFlowProviderConfig.TokenEndpoint | default "" | quote }}
    Scope: {{ $PKCEAuthorizationFlowProviderConfig.Scope | default "" | quote }}
    RedirectURLs: {{ $PKCEAuthorizationFlowProviderConfig.Audience | default "" | quote }}
    UseIDToken: {{ $PKCEAuthorizationFlowProviderConfig.Audience | default "" | quote }}
{{- end -}}
