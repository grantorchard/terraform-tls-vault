resource "time_rotating" "this" {
  rotation_minutes = 1
}

data "tls_certificate" "this" {
    # depends_on = [
    #   bigip_ssl_certificate.this,
    #   bigip_ssl_key.this
    # ]
    url = "https://registry.terraform.io"

    # lifecycle {
    #     postcondition {
    #         condition     = element(self.certificates, length(self.certificates)-1).serial_number == replace(vault_pki_secret_backend_cert.this.serial_number, ":", "")
    #         error_message = "Certificate serial numbers do not match"
    #     }
    # }
}

resource "vault_pki_secret_backend_cert" "this" {
    backend = "pki"
    name = "gcve" # role name

    common_name = "gary.gcve.local"
    min_seconds_remaining = "604800"
    auto_renew = true

#     lifecycle {
#         replace_triggered_by = [
#         time_rotating.this.id
#         ]
#   }
}

# resource "bigip_ssl_certificate" "this" {
#     name      = "tls.crt"
#     content   = file("tls.crt")
#     partition = "Common"
# }

# resource "bigip_ssl_key" "this" {
#     name      = "tls.key"
#     content   = file("tls.key")
#     partition = "Common"
# }

