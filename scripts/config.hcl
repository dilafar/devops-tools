disable_cache = true
disable_mlock = true
ui            = true
listener "tcp" {
  address                  = "0.0.0.0:8200"
  tls_disable              = 0
  tls_cert_file            = "/etc/letsencrypt/live/cncloudnet.com/fullchain.pem"
  tls_key_file             = "/etc/letsencrypt/live/cncloudnet.com/privkey.pem"
  tls_disable_client_certs = "true"

}
storage "s3" {
  bucket = "workspacevaultbucketnew"
}

seal "awskms" {
  region     = "us-east-1"
  kms_key_id = "a536dce4-b828-4eca-b44e-eee3c62d6f8a"
  endpoint   = "kms.us-east-1.amazonaws.com"
}
api_addr                = "https://kmsvault.cncloudnet.com:8200"
max_lease_ttl           = "10h"
default_lease_ttl       = "10h"
cluster_name            = "vault"
raw_storage_endpoint    = true
disable_sealwrap        = true
disable_printable_check = true