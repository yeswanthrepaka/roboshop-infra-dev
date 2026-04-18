resource "aws_instance" "main" {
  ami = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.catalogue_sg_id]
  subnet_id = local.private_subnet_id

  tags = merge(
    local.common_tags, 
    {
        Name = "${var.project}-${var.env}-catalogue"
    }
  )
}

resource "terraform_data" "main" {
  triggers_replace = [aws_instance.main.id]

  connection {
    type     = "ssh"
    user     = "ec2-user"
    password = "DevOps321"
    host     = aws_instance.main.private_ip
  }

  provisioner "file" {
    source = "bootstrap.sh"
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [ 
        "chmod +x /tmp/bootstrap.sh",
        "sudo sh /tmp/bootstrap.sh catalogue"
     ]
  }
}

resource "aws_ec2_instance_state" "main" {
  instance_id = aws_instance.main.id
  state       = "stopped"
  depends_on = [ terraform_data.main ]
}

resource "aws_ami_from_instance" "main" {
  name               = "${var.project}-${var.env}-catalogue"
  source_instance_id = aws_instance.main.id
  depends_on = [ aws_ec2_instance_state.main ]
  tags = merge(
    local.common_tags, 
    {
        Name = "${var.project}-${var.env}-catalogue"
    }
  )
}

resource "aws_lb_target_group" "main" {
  name        = "${var.project}-${var.env}-catalogue"
  port        = 8080
  protocol    = "HTTP"
  vpc_id      = local.vpc_id
  deregistration_delay = 60
  
  health_check {
    healthy_threshold = 3
    unhealthy_threshold = 3
    interval = 10
    path = "/health"
    port = 8080
    protocol = "HTTP"
    matcher = "200-299"
    timeout = 2
  }
}
