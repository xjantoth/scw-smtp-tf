data "template_file" "subject" {
  template = "${var.subject}"

  vars = "${var.vars}"
}

data "template_file" "body" {
  template = "${var.body}"

  vars = "${merge(var.vars, { "subject" : data.template_file.subject.rendered })}"
}

locals {
  body = "${data.template_file.body.rendered}"
  # subject = "${data.template_file.subject.rendered}"

}

data "external" "mail" {
  count   = "${var.enabled == "true" ? 1 : 0}"
  program = ["python3", "${path.module}/../../bin/sendemail.py"]

  query = {
    smtp_server  = "${var.host}"
    sender_email = "${var.from}"
    # TODO: implement looping over count ?
    receiver_email = "${var.to[0]}"
    message        = "${local.body}"
    port           = "${var.port}"

  }

  depends_on = ["data.template_file.body", "data.template_file.subject"]
}



