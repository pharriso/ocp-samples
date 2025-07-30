# Redfish / Sushy Tools commands

Some useful Redfish / Sushy Tools commands:

View systems:

```
curl http://localhost:8000/redfish/v1/Systems/
```

For Libvirt, you can work out the system with this:

```
virsh list --uuid --name
b2a060c3-ffae-4a04-b294-934838ea7937 controlplane0
1a659bec-bdc1-43f5-a400-7306d441e514 controlplane1
859de595-4cbb-4247-9998-ea2ab123bf52 controlplane2
```

Insert media:

```
curl -d '{"Image":"http://192.168.50.1:8080/agent.x86_64.iso", "Inserted": true}' -H "Content-Type: application/json"  -X POST  http://192.168.50.1:8000/redfish/v1/Systems/859de595-4cbb-4247-9998-ea2ab123bf52/VirtualMedia/Cd/Actions/VirtualMedia.InsertMedia
```

Check media is mounted:

```
curl  http://192.168.50.1:8000/redfish/v1/Systems/859de595-4cbb-4247-9998-ea2ab123bf52/VirtualMedia/Cd
```

Eject media:

```
curl -H "Content-Type: application/json" -X POST  http://192.168.50.1:8000/redfish/v1/Systems/859de595-4cbb-4247-9998-ea2ab123bf52/VirtualMedia/Cd/Actions/VirtualMedia.EjectMedia
```
