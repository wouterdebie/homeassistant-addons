This add-on runs a datadog agent and exposes a `dogstatsd` service on `8125/udp`.

In order to configure this add-on, simply set an API key in the Configuration tab and use the datadog component that is included with Home Assistant.

Modify `configuration.yaml` and add the hostname that is found on the info tab of the add-on:

```yaml
datadog:
  host: 6f10207e-datadog
```
