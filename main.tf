resource "aws_vpc" "connice_vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    name = "dev"
  }
}

resource "aws_subnet" "connice_public_subnet" {
  vpc_id                  = aws_vpc.connice_vpc.id
  cidr_block              = var.subnet_cidr_block
  map_public_ip_on_launch = true
  availability_zone       = var.availability_zone

  tags = {
    Name = "dev_public"
  }
}

resource "aws_internet_gateway" "connice_internet_gateway" {
  vpc_id = aws_vpc.connice_vpc.id

  tags = {
    Name = "dev_igw"
  }
}

resource "aws_route_table" "connice_route_table" {
  vpc_id = aws_vpc.connice_vpc.id
  tags = {
    Name = "dev_public_rt"
  }
}


resource "aws_route" "default_route" {
  route_table_id         = aws_route_table.connice_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.connice_internet_gateway.id
}

resource "aws_route_table_association" "connice_public_rt_assoc" {
  subnet_id      = aws_subnet.connice_public_subnet.id
  route_table_id = aws_route_table.connice_route_table.id
}

resource "aws_security_group" "connice_tls" {
  name        = "dev_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.connice_vpc.id

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = [aws_vpc.connice_vpc.cidr_block]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = var.allowed_ssh_cidr
  }


  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "dev_tls"
  }
}

resource "aws_key_pair" "connice_auth_deployer" {
  key_name   = "connice_key"
  public_key = file(var.public_key_path)
  }

resource "aws_instance" "connice_dev_node" {
  ami           = data.aws_ami.server_ami.id
  instance_type = var.instance_type
  key_name = aws_key_pair.connice_auth_deployer.id
  vpc_security_group_ids = [aws_security_group.connice_tls.id]
  subnet_id = aws_subnet.connice_public_subnet.id
  user_data = file("userdata.tpl")

  root_block_device{
    volume_size = 8
  }
  
  tags = {
    Name = "dev-node"
  }

  provisioner "local-exec" {
        command = templatefile("${var.host_os}-ssh-config.tpl", {
          host_name = self.public_ip,
          user = "ec2-user", 
          identity_file = "~/.ssh/connice_key"  
        })
        interpreter = var.host_os == "linux" ? ["bash", "-c"] : ["windows", "command"]
  }

 
}



 

