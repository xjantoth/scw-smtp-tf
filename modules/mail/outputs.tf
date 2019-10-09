output "body" {
  description = "Rendered body of the email"
  value       = "${local.body}"
}

output "io" {
  description = ""
  value       = data.external.mail.*.result
}
