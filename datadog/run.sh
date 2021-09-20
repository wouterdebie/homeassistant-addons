#!/usr/bin/with-contenv bashio

if bashio::config.is_empty 'api_key' ;
then
    bashio::log.fatal
    bashio::log.fatal 'Configuration of this add-on is incomplete.'
    bashio::log.fatal 'Please be sure to set an API key!'
    bashio::log.fatal
    bashio::exit.nok
fi

DD_ROOT="/opt/datadog-agent"
DD_API_KEY=$(bashio::config 'api_key')

cat << EOF > /opt/datadog-agent/agent/datadog.conf
[Main]
dd_url: https://app.datadoghq.com
api_key: ${DD_API_KEY}
jmxfetch_log_file: ${DD_ROOT}/logs/jmxfetch.log
dogstatsd_log_file: ${DD_ROOT}/logs/dogstatsd.log
forwarder_log_file: ${DD_ROOT}/logs/forwarder.log
collector_log_file: ${DD_ROOT}/logs/collector.log
non_local_traffic: yes
bind_host: 0.0.0.0
EOF

/opt/datadog-agent/bin/agent
