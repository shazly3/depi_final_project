

#Jenkins_Server
module "jenkins_subnet" {
    source = "./modules/jenkins_subnet"
    jenkins_cidr_blocks = var.jenkins_cidr_blocks
    jenkins_avail_zone = var.jenkins_avail_zone
    jenkins_igw = var.jenkins_igw
    jenkins_vpc_id = aws_vpc.jenkins_vpc.id
}

module "jenkins_server" {
    source = "./modules/jenkins_server"
    my_ip = var.my_ip
    public_key_location = var.public_key_location
    jenkins_instance_type = var.jenkins_instance_type
    jenkins_avail_zone = var.jenkins_avail_zone
    jenkins_subnet_id = module.jenkins_subnet.jenkins_subnet.id
    jenkins_vpc_id = aws_vpc.jenkins_vpc.id
}

resource "aws_vpc" "jenkins_vpc" {
    cidr_block = var.jenkins_cidr_blocks[0].cidr_block
    tags = {
        Name = var.jenkins_cidr_blocks[0].name
    }

}

#APP_Server
module "app_subnet" {
    source = "./modules/app_subnet"
    app_cidr_blocks = var.app_cidr_blocks
    app_avail_zone = var.app_avail_zone
    app_igw = var.app_igw
    app_vpc_id = aws_vpc.app_vpc.id
}

module "app_server" {
    source = "./modules/app_server"
    my_ip = var.my_ip
    public_key_location = var.public_key_location
    app_instance_type = var.app_instance_type
    app_avail_zone = var.app_avail_zone
    app_subnet_id = module.app_subnet.app_subnet.id
    app_vpc_id = aws_vpc.app_vpc.id
}

resource "aws_vpc" "app_vpc" {
    cidr_block = var.app_cidr_blocks[0].cidr_block
    tags = {
        Name = var.app_cidr_blocks[0].name
    }

}