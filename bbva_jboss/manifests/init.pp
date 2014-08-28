# Class: bbva_jboss
#
# This module manages bbva_jboss
#
# Parameters: none
#
# Actions:
#
# Requires: see Modulefile
#
# Sample Usage:
#
class bbva_jboss (
  $ensure = present,
  $jboss_entorno = "pr",
  $jboss = true,
  $ews = false,
  $jdk_version = "1.7.0_11",
  $jboss_version = "6.2",
  $jboss_package_release = "0.1",
  $ews_version = "2.0",
  $ews_package_release = "2",
  $enabled_oracle_jdbc = false,
  $package_oracle_jdbc_version = "installed",
  $enabled_ibm_mq_connector = false,
  $package_ibm_mq_connector_version = "installed",  
  $enabled_mongodb_jdbc = false,
  $package_mongodb_jdbc_version = "installed",
  $enabled_rabbitmq_connector = false,
  $package_rabbitmq_connector_version = "installed",
  $service_enabled = true,
  $dbdc_enabled = true,
  $dbdc_package_version = "1.0.0-1", 
  $dynatrace_enabled = true,
  $dynatrace_server = "lpdyn001:25003",
  $dynatrace_package_version = "5.6.0-1",
  $management_native_port = "10000",
  $management_http_port = "10500",
  $http_port = "7000",
  $https_port = "",
  $ds_min_pool_size = "0",
  $ds_max_pool_size = "100",
  $ds_blocking_timeout_in_milliseconds = "5000",
  $ds_idle_timeout_in_minutes = "15",
  $ds_prepared_statement_cache_size = "100",
  $http_thread_max_count = "512",
  $http_thread_keepalive_time = "30",
  $jms_min_pool_size = "50",
  $jms_max_pool_size = "150",
  $jms_idle_timeout_in_minutes = "60",
  $jms_blocking_timeout_in_milliseconds = "5000"
){

  if $ensure == present {
    class { '::bbva_jboss::requirements': } ->
    class { '::bbva_jboss::install': } ->
    class { '::bbva_jboss::connectors': } ->
    class { '::bbva_jboss::configure': } ->
    class { '::bbva_jboss::service': }
  }
  if $ensure == absent {
    class { '::bbva_jboss::service': } ->
    class { '::bbva_jboss::connectors': } ->
    class { '::bbva_jboss::install': } ->
    class { '::bbva_jboss::requirements': } 
  }
}
