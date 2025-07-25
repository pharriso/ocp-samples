apiVersion: agent-install.openshift.io/v1beta1
kind: NMStateConfig
metadata:
  name: agent-controlplane0
  labels:
    agent-install.openshift.io/bmh: controlplane0.agent.example.com
    infraenvs.agent-install.openshift.io: agent
    nmstate-label: agent
  namespace: agent
spec:
  config:
    dns-resolver:
      config:
        server:
        - 192.168.50.1
    interfaces:
    - ipv4:
        address:
        - ip: 192.168.50.20
          prefix-length: 24
        dhcp: false
        enabled: true
      mac-address: 52:54:00:e0:3c:77
      name: enp1s0
      state: up
      type: ethernet
    routes:
      config:
      - destination: 0.0.0.0/0
        next-hop-address: 192.168.50.1
        next-hop-interface: enp1s0
        table-id: 254
  interfaces:
  - macAddress: 52:54:00:e0:3c:77
    name: enp1s0
