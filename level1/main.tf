resource "aws_elastic_beanstalk_application" "test" {
  name        = "ebs-test2"
  description = "Test of beanstalk deployment"
}

resource "aws_elastic_beanstalk_environment" "test_env" {
  name                = "ebs-test-env"
  application         = "${aws_elastic_beanstalk_application.test.name}"
  cname_prefix        = "100034mytest"

 solution_stack_name = "64bit Amazon Linux 2017.03 v2.6.5 running Tomcat 8 Java 8"
 version_label = "latest"

 depends_on = ["aws_elastic_beanstalk_application_version.latest"]
}

resource "aws_elastic_beanstalk_application_version" "latest" {
  name        = "latest"
  application = "${aws_elastic_beanstalk_application.test.name}"
  description = "Version latest of app ${aws_elastic_beanstalk_application.test.name}"
  bucket      = "elasticbeanstalk-eu-west-2-877757016492"
  key         = "samples100.war"
  #bucket      = "elasticbeanstalk-eu-west-1-877757016492"
  #key         = "20173035LD-samples.war"
}


provider aws {
  region = "eu-west-1"
}

