resource "aws_security_group" "sg" {
    name = "sg"
    vpc_id = var.app_vpc_id

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = [var.my_ip]
    }

    ingress {
        from_port = 8080        
        to_port = 8080
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

        ingress {
        from_port = 8081        
        to_port = 8081
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

        ingress {
        from_port = 3000        
        to_port = 3000
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }


    egress {
        from_port = 0        
        to_port = 0
        protocol = "-1"
        cidr_blocks= ["0.0.0.0/0"]
        prefix_list_ids = []
    }

    tags = {
        Name = "sg"
    }

}

resource "aws_key_pair" "app_key" {

    key_name = "app_key"
    public_key = file(var.public_key_location)
}

data "aws_ami" "latest-amazon-linux-image"{
    most_recent = true 
    owners = ["amazon"] 
    filter {
        name = "name"
        values = ["amzn2-ami-kernel-5.10-hvm-*-x86_64-gp2"]
    }

}
resource "aws_instance" "app_server" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = var.app_instance_type 

    subnet_id = var.app_subnet_id
    vpc_security_group_ids = [aws_security_group.sg.id]
    availability_zone = var.app_avail_zone

    associate_public_ip_address = true
    key_name = aws_key_pair.app_key.key_name

    user_data = file("script_app.sh")

    tags = {
        Name = "app_server"
    }   

}