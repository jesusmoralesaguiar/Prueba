define bbva_jboss::servergroup (
  $ensure = 'present',
  $servergroups_dir = "/usr/local/pr/jboss/BBVA/SERVERGROUPS",
  $max_number_of_servers = "1",
  $servergroup_template = "default",
  $java_opts = "-d64 -server -Xmx2048m -Xms2048m -XX:+UseG1GC -XX:MaxGCPauseMillis=200 -XX:+UseCompressedOops -XX:MaxPermSize=512m",
  $dynatrace_enabled = true,
  $dynatrace_server = "lpdyn001:25003",
  $ibm_mq_enabled = true,
  $ibm_msg_log_status = "OFF",
  $ibm_msg_ffst_suppress = "10",
  $ports_offset
  
) {

  $servergroup_dir = "${servergroups_dir}/${name}"
  $servergroup_conf_dir = "${servergroup_dir}/configuration"
  $servergroup_data_dir = "${servergroup_dir}/data"
  $servergroup_tmp_dir = "${servergroup_dir}/tmp"
  $servergroup_conf_file = "${servergroup_dir}/${name}.conf"  
  $servergroup_xml_file = "${servergroup_conf_dir}/${name}.xml"
  $servergroup_logging_properties = "${servergroup_conf_dir}/logging.properties"
    
