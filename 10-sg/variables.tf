variable "project" {
  default = "roboshop"
}

variable "env" {
  default = "dev"
}

variable "sg_names" {
  default = [
    # database
    "mongodb", "redis", "mysql", "rabbitmq",
    #backend
    "catalogue", "user", "cart", "shipping", "payment",
    #backend ALB
    "backend_alb",
    #frontend
    "frontend",
    #frontend ALB
    "frontend_alb",
    #bastion
    "bastion"
  ]
}