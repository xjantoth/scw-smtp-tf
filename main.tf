module "mail" {
  source  = "./modules/mail"
  from    = "${var.from}"
  to      = "${var.to}"
  body    = "${file("conf/body.tpl")}"
  subject = "${file("conf/subject.tpl")}"
  port    = "${var.port}"
  host    = "${var.host}"

  vars = "${var.vars}"

}

