resource "aws_instance" "ec2-demo" {
  ami           = data.aws_ami.amazonlinux2.id # us-west-2
  instance_type = var.aws-inst-type

  tags = {
    Name = "ec2-demo"
  }
}