resource "aws_elastic_beanstalk_application" "myapp" {
  name        = "Tutorial_App"
  description = "Test of beanstalk deployment"
}

resource "aws_elastic_beanstalk_environment" "test_env" {
  name                = "Tutorial-App-env1"
  application         = "${aws_elastic_beanstalk_application.myapp.name}"
  cname_prefix        = "agstechtutorialapp1"

 solution_stack_name = "64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"

}

provider aws {
  region = "eu-west-1"
}

output "cname" {
  value = "${aws_elastic_beanstalk_environment.test_env.cname}"
}

