variable jenkins_cidr_blocks {
    description = "cidr blocks and name tags for vpc, subnets& route table"
    type        = list(object({
        cidr_block = string 
        name = string
    }))
    
}

variable jenkins_avail_zone {}
variable jenkins_igw {}
variable jenkins_vpc_id {}
