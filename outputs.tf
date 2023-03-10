# output "vault_serial" {
#     value = replace(vault_pki_secret_backend_cert.this.serial_number, ":", "")
# }

# output "vip_serial" {
#     value = element(data.tls_certificate.example.certificates, length(data.tls_certificate.example.certificates)-1).serial_number
# }