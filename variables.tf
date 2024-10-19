#local
variable my_ip {}
variable public_key_location {}



#Jenkins_Server
variable jenkins_cidr_blocks {
    description = "cidr blocks and name tags for vpc, subnets& route table"
    type        = list(object({
        cidr_block = string 
        name = string
    }))
    
}
variable jenkins_avail_zone {}
variable jenkins_igw {}
variable jenkins_instance_type {}


#APP_Server
variable app_cidr_blocks {
    description = "cidr blocks and name tags for vpc, subnets& route table"
    type        = list(object({
        cidr_block = string 
        name = string
    }))
    
}
variable app_avail_zone {}
variable app_igw {}
variable app_instance_type {}
