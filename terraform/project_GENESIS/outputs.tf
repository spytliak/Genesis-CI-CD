#-----------------------------------------------------------------------
# AMI
#-----------------------------------------------------------------------
output "ubuntu_linux_latest_ami_id" {
  description = "The latest AMI ID for ubuntu 20.04"
  value       = data.aws_ami.ubuntu_linux_latest.id
}

output "ubuntu_linux_latest_ami_name" {
  description = "The latest AMI name for ubuntu 20.04"
  value       = data.aws_ami.ubuntu_linux_latest.name
}

#-----------------------------------------------------------------------
# SSH KEY
#-----------------------------------------------------------------------
output "ssh_key" {
  description = "ssh key generated by terraform"
  sensitive   = true
  value       = tls_private_key.ssh-key[0].private_key_pem
}

#-----------------------------------------------------------------------
# EC2
#-----------------------------------------------------------------------
output "APP_instances_info" {
  description = "Info about instances"
  value = {
    app_servers = {
      "${lookup(aws_instance.app[0].tags_all, "Name")}" = {
        id  = aws_instance.app[0].id,
        ip  = aws_instance.app[0].public_ip,
        arn = aws_instance.app[0].arn
        dns = aws_instance.app[0].public_dns
      },
      "${lookup(aws_instance.app[1].tags_all, "Name")}" = {
        id  = aws_instance.app[1].id,
        ip  = aws_instance.app[1].public_ip,
        arn = aws_instance.app[1].arn
        dns = aws_instance.app[1].public_dns
      }
    }
  }
}

output "APP_instances_ip" {
  description = "Instances ip"
  value       =  jsonencode(aws_instance.app[*].public_ip) #[for k in aws_instance.app[*] : k.public_ip]
}

#-----------------------------------------------------------------------
# RDS
#-----------------------------------------------------------------------
output "RDS_info" {
  description = "Info about RDS"
  sensitive   = true
  value = {
    arn     = aws_db_instance.rds[0].arn,
    address = aws_db_instance.rds[0].address,
    port    = aws_db_instance.rds[0].port,
    user    = aws_db_instance.rds[0].username
  }
}

#-----------------------------------------------------------------------
# ALB
#-----------------------------------------------------------------------
output "ALB_info" {
  description = "Info about ALB"
  value = {
    arn      = module.alb.lb_arn,
    id       = module.alb.lb_id,
    dns_name = module.alb.lb_dns_name
  }
}