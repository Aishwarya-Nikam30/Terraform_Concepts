# instance ami and type
resource aws_instance my_instance {
  for_each = tomap({
    my-instance-micro    = "t2.micro",
    #my-instance-medium = "t2.medium",
    my_instance-micro2 = "t2.micro"
  })    #meta argument  ; you can use it's key and value
  
  depends_on = [ aws_key_pair.my-key1 , aws_security_group.my-sg1]

  key_name = aws_key_pair.my-key1.key_name
  security_groups = [aws_security_group.my-sg1.name]
  ami           = var.ec2_emi_id
  instance_type = each.value
  user_data = file("nginx.sh")

  root_block_device {
    volume_size = var.env == "prd" ? 20 : var.ec2_default_root_storage_size  # if var.env == "prd" ? true condition : false condition
    volume_type = "gp3"                          #? acta as an then
  }
  tags = {
    Name = each.key
    Environment = var.env
  }
}

#instance vpc
resource aws_default_vpc default {
  tags = {
    Name = "Default VPC"
  }
}

# instance key-pair
resource aws_key_pair my-key1 {
  key_name   = "my-key1"
  public_key = file("my-key1.pub")
  
  }

# instance security group
resource aws_security_group my-sg1 {
  name        = "my-sg1"
  description = "Allow TLS inbound traffic and all outbound traffic"
  vpc_id = aws_default_vpc.default.id    #interpolation

  tags = {
    Name = "my-sg1"
  }
#instance-sg-inbound-rule(Ingress)
ingress {
    from_port = 22
    to_port = 22
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "ssh open"
}
ingress{
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "http open"
}
egress{
    from_port = 0
    to_port = 0
    protocol = "-1"   #all outbound traffic
    cidr_blocks = ["0.0.0.0/0"]  
    description = "all access"
}
}

###import instance from aws to terraform

# resource "aws_instance" "my_new_instance" {
#   ami = "unknown"
#   instance_type = "unknown"
# }