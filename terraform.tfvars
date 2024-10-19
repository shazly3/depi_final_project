#local
my_ip = "0.0.0.0/0"
public_key_location = "/home/elshazly/.ssh/id_rsa.pub"



#Jenkins_Server
jenkins_cidr_blocks = [
    {cidr_block = "10.0.0.0/16", name = "vpc"},
    {cidr_block = "10.0.10.0/24", name = "subnet"},
    {cidr_block = "0.0.0.0/0", name = "route_table"}
]
jenkins_igw = "gateway"
jenkins_instance_type = "t2.micro"
jenkins_avail_zone = "us-east-1a"

#app_Server
app_cidr_blocks = [
    {cidr_block = "10.0.0.0/16", name = "vpc"},
    {cidr_block = "10.0.10.0/24", name = "subnet"},
    {cidr_block = "0.0.0.0/0", name = "route_table"}
]
app_igw = "gateway"
app_instance_type = "t2.micro"
app_avail_zone = "us-east-1a"
