# --- NAP-BLUE ENVRIONMENT --- #

resource "aws_elastic_beanstalk_environment" "nap-blue" {
  name                = "shegoj-homepage-app-nap-blue"
  application         = "${aws_elastic_beanstalk_application.adapt-webapp.name}"
  solution_stack_name = "${var.blue_stack_vars["stack"]}"
  cname_prefix        = "${var.blue_stack_vars["cname_prefix"]}"

  setting {
    namespace = "aws:ec2:vpc"
    name      = "VPCId"
    resource  = "AWSEBSecurityGroup"
    value     = "}"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "Subnets"
    resource  = "AWSEBAutoScalingGroup"
    value     = "subnet-ae5e15e7, subnet-b89fd1df"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "ELBSubnets"
    resource  = "AWSEBAutoScalingGroup"
    value     = "subnet-ae5e15e7, subnet-b89fd1df"
  }

  setting {
    namespace = "aws:ec2:vpc"
    name      = "AssociatePublicIpAddress"
    resource  = "AWSEBAutoScalingLaunchConfiguration"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "IamInstanceProfile"
    resource  = "AWSEBAutoScalingLaunchConfiguration"
    value     = "aws-elasticbeanstalk-ec2-role"
  }


  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "EC2KeyName"
    resource  = "AWSEBAutoScalingLaunchConfiguration"
    value     = "jenkins_key4"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateEnabled"
    value     = "true"
  }

  setting {
    namespace = "aws:autoscaling:updatepolicy:rollingupdate"
    name      = "RollingUpdateType"
    value     = "Health"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "ServiceRole"
    value     = "aws-elasticbeanstalk-service-role"
  }

  setting {
    namespace = "aws:elb:loadbalancer"
    name      = "CrossZone"
    value     = "true"
  }

  #setting {
  #  namespace = "aws:elbv2:listener:443"
  #  name      = "Protocol"
  #  value     = "HTTPS"
  #}

  setting {
    namespace = "aws:elasticbeanstalk:environment"
    name      = "LoadBalancerType"
    value     = "application"
  }

  setting {
    namespace = "aws:elasticbeanstalk:environment:process:default"
    name      = "HealthCheckPath"
    value     = "${var.blue_stack_vars["healthcheck_url"]}"
  }

  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingEnabled"
    value     = "${var.blue_stack_vars["connection_draining_enabled"]}"
  }

  setting {
    namespace = "aws:elb:policies"
    name      = "ConnectionDrainingTimeout"
    value     = "${var.blue_stack_vars["connection_draining_timeout"]}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MaxSize"
    resource  = "AWSEBAutoScalingGroup"
    value     = "${var.blue_stack_vars["max_instances"]}"
  }

  setting {
    namespace = "aws:autoscaling:asg"
    name      = "MinSize"
    resource  = "AWSEBAutoScalingGroup"
    value     = "${var.blue_stack_vars["min_instances"]}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "InstanceType"
    value     = "${var.blue_stack_vars["instance_type"]}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "RootVolumeSize"
    value     = "${var.blue_stack_vars["root_volume_size"]}"
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"
    name      = "MonitoringInterval"
    resource  = "AWSEBAutoScalingLaunchConfiguration"
    value     = "${var.blue_stack_vars["monitoring_interval"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "MeasureName"
    resource  = "AWSEBCloudwatchAlarmLow"
    value     = "${var.blue_stack_vars["alarm_measure"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Period"
    resource  = "AWSEBCloudwatchAlarmLow"
    value     = "${var.blue_stack_vars["alarm_period"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Statistic"
    resource  = "AWSEBCloudwatchAlarmLow"
    value     = "${var.blue_stack_vars["alarm_statistic"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "Unit"
    resource  = "AWSEBCloudwatchAlarmLow"
    value     = "${var.blue_stack_vars["alarm_unit"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "LowerThreshold"
    resource  = "AWSEBCloudwatchAlarmLow"
    value     = "${var.blue_stack_vars["alarm_lower_threshold"]}"
  }

  setting {
    namespace = "aws:autoscaling:trigger"
    name      = "UpperThreshold"
    resource  = "AWSEBCloudwatchAlarmHigh"
    value     = "${var.blue_stack_vars["alarm_upper_threshold"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:application"
    name      = "Application Healthcheck URL"
    value     = "${var.blue_stack_vars["healthcheck_url"]}"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "SystemType"
    value     = "enhanced"
  }

  setting {
    namespace = "aws:elasticbeanstalk:healthreporting:system"
    name      = "ConfigDocument"
    value     = <<EOF
{
  "CloudWatchMetrics": {
    "Environment": {
      "ApplicationLatencyP99.9": 60,
      "InstancesSevere": 60,
      "ApplicationLatencyP90": 60,
      "ApplicationLatencyP99": 60,
      "ApplicationLatencyP95": 60,
      "InstancesUnknown": 60,
      "ApplicationLatencyP85": 60,
      "InstancesInfo": 60,
      "ApplicationRequests2xx": 60,
      "InstancesDegraded": 60,
      "InstancesWarning": 60,
      "ApplicationLatencyP50": 60,
      "ApplicationRequestsTotal": 60,
      "InstancesNoData": 60,
      "InstancesPending": 60,
      "ApplicationLatencyP10": 60,
      "ApplicationRequests5xx": 60,
      "ApplicationLatencyP75": 60,
      "InstancesOk": 60,
      "ApplicationRequests3xx": 60,
      "ApplicationRequests4xx": 60
    },
    "Instance": {
      "ApplicationLatencyP99.9": 60,
      "ApplicationLatencyP90": 60,
      "ApplicationLatencyP99": 60,
      "ApplicationLatencyP95": 60,
      "ApplicationLatencyP85": 60,
      "CPUUser": 60,
      "ApplicationRequests2xx": 60,
      "CPUIdle": 60,
      "ApplicationLatencyP50": 60,
      "ApplicationRequestsTotal": 60,
      "RootFilesystemUtil": 60,
      "LoadAverage1min": 60,
      "CPUIrq": 60,
      "CPUNice": 60,
      "CPUIowait": 60,
      "ApplicationLatencyP10": 60,
      "LoadAverage5min": 60,
      "ApplicationRequests5xx": 60,
      "ApplicationLatencyP75": 60,
      "CPUSystem": 60,
      "ApplicationRequests3xx": 60,
      "ApplicationRequests4xx": 60,
      "InstanceHealth": 60,
      "CPUSoftirq": 60
    }
  },
  "Version": 1
}
EOF
  }

}
