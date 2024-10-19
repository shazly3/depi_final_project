variable app_cidr_blocks {
    description = "cidr blocks and name tags for vpc, subnets& route table"
    type        = list(object({
        cidr_block = string 
        name = string
    }))
    
}

variable app_avail_zone {}
variable app_igw {}
variable app_vpc_id {}
