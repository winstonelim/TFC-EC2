output "elb_subnet_id" {
  value = aws_subnet.elb_subnet.*.id
}

output "dmz_subnet_id" {
  value = aws_subnet.dmz_subnet.*.id
}

output "dmz_subnet" {
  value = aws_subnet.dmz_subnet
}

output "ap_subnet_id" {
  value = aws_subnet.ap_subnet.*.id
}

output "db_subnet_id" {
  value = aws_subnet.db_subnet.*.id
}