resource "aws_instance" "web" {
  count         = var.ec2_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id

  tags = {
    Name = "Web-Server-${count.index + 1}"
    Env  = terraform.workspace
  }
}



output "AWS_Instace_ID" {
  value       = aws_instance.web.*.id
  description = "EC2 instances IDs"
}
