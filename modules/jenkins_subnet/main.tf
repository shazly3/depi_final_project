resource "aws_subnet" "jenkins_subnet" {
    vpc_id = var.jenkins_vpc_id
    cidr_block = var.jenkins_cidr_blocks[1].cidr_block
    availability_zone = var.jenkins_avail_zone
    tags = {
        Name = var.jenkins_cidr_blocks[1].name
    }
}

resource "aws_route_table" "route_table"{
    vpc_id = var.jenkins_vpc_id
    
    route {
        cidr_block = var.jenkins_cidr_blocks[2].cidr_block
        gateway_id = aws_internet_gateway.gateway.id
    }

    tags = {
        Name = var.jenkins_cidr_blocks[2].name
    }

}

resource "aws_internet_gateway" "gateway" {
    vpc_id = var.jenkins_vpc_id

    tags = {
        Name = var.jenkins_igw
    }
}

resource "aws_route_table_association" "a_rtb_subnet" {
    subnet_id = aws_subnet.jenkins_subnet.id
    route_table_id = aws_route_table.route_table.id
}