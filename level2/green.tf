#  Green env
resource "aws_elastic_beanstalk_environment" "testenv" {
  name                  = "testenv"
  application           = "${aws_elastic_beanstalk_application.adapt-webapp.name}"
  solution_stack_name   = "64bit Amazon Linux 2016.03 v2.1.0 running Docker 1.9.1"
  tier                  = "WebServer"

  # This is the VPC that the instances will use.
  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    value     = "vpc-49b8ec2e"
  }

  # This is the subnet of the ELB
  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    value     = "subnet-ae5e15e7"
  }

  # This is the subnets for the instances.
  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    value     = "subnet-ae5e15e7"
  }

  # You can set the environment type, single or LoadBalanced
  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "EnvironmentType"
    value     = "LoadBalanced"
  }

  # Example of setting environment variables
  setting {
    namespace = "aws:elasticbeanstalk:application:environment"
    name      = "AWS_ENVIRONMENT"
    value     = "test"
  }

  # Are the load balancers multizone?
  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }

  # Enable connection draining.
  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingEnabled"
    value     = "true"
  }
  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "SecurityGroups"
    resource  = "AWSEBAutoScalingLaunchConfiguration"
    value     = "sg-47f11e3c"
  }

}
