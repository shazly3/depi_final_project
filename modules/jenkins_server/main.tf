resource "aws_security_group" "sg" {
    name = "sg"
    vpc_id = var.jenkins_vpc_id

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

resource "aws_key_pair" "jenkins_key" {

    key_name = "jenkins_key"
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
resource "aws_instance" "jenkins_server" {
    ami = data.aws_ami.latest-amazon-linux-image.id
    instance_type = var.jenkins_instance_type 

    subnet_id = var.jenkins_subnet_id
    vpc_security_group_ids = [aws_security_group.sg.id]
    availability_zone = var.jenkins_avail_zone

    associate_public_ip_address = true
    key_name = aws_key_pair.jenkins_key.key_name

    user_data = file("script_jenkins.sh")

    tags = {
        Name = "jenkins_server"
    }   

}