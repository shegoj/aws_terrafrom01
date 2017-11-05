resource "aws_elastic_beanstalk_application" "myapp" {
  name        = "Tutorial_App"
  description = "Test of beanstalk deployment"
}

resource "aws_elastic_beanstalk_environment" "collins_green" {
  name                = "Tutorial-App-env1-green"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1green"

 solution_stack_name = "64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"

}


resource "aws_elastic_beanstalk_environment" "collins_blue" {
  name                = "Tutorial-App-env1-blue"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1blue"

 solution_stack_name = "64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"

}


output "cname-green" {
  value = "${aws_elastic_beanstalk_environment.collins_green.cname}"
}


output "cname-blue" {
  value = "${aws_elastic_beanstalk_environment.collins_blue.cname}"
}
