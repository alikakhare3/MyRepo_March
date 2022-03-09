resource "aws_eip" "nat" {
  count = "${var.subnet_no_private}"
  vpc   = true

    tags = {
       Name = "eip"
  }
}

resource "aws_nat_gateway" "nat" {
  count = "${var.subnet_no_private}"

  allocation_id = "${aws_eip.nat.*.id[count.index]}"

  subnet_id = "${aws_subnet.web-subnet-1.id}"
 
  tags ={
    Name = "sa-private${count.index}-natgw"
        
  }
}

