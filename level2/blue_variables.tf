# --- BLUE ENVRIONMENT --- #

# Stack variables

variable "nap-blue_stack_vars" {
  type = "map"

  default = {
    stack = "64bit Amazon Linux 2017.03 v2.6.0 running Docker 1.12.6"
    cname_prefix = "shegoj-homepage-app-nap-blue"
    instance_type  = "t1.mirco"
    root_volume_size = "8"
    connection_draining_enabled = "true"
    connection_draining_timeout = "20"
    max_instances = "2"
    min_instances = "1"
    monitoring_interval = "5 minute"
    alarm_measure = "CPUUtilization"
    alarm_period = "5"
    alarm_statistic = "Average"
    alarm_unit = "Percent"
    alarm_lower_threshold = "20"
    alarm_upper_threshold = "40"
    healthcheck_url = "/health/ping"
  }
}

