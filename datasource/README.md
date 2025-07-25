Setup PVC cron from registry
=========

Create a container with VM QCOW in container and push to registry.

Create datasource and dataimportcron from example yaml.

If the registry is private then you need to create a secret for user and password/token.

```
echo -n "username"| base64 
echo -n "password"| base64 
```

Take the resulting values and create the secret for them in two projects:

```
openshift-virtualization-os-images
openshift-cnv
```

Apply the hyperconverged patch

```
oc -n openshift-cnv patch hyperconverged kubevirt-hyperconverged   --type merge --patch-file hyperconverged_patch_customimage.yaml
```

Validate the source:

```
oc get -n openshift-cnv hyperconverged -o json   | jq '.items[].spec.dataImportCronTemplates'
```

Disable default bootsources:

```
oc patch hyperconverged kubevirt-hyperconverged -n openshift-cnv \
  --type json -p '[{"op": "replace", "path": \
  "/spec/featureGates/enableCommonBootImageImport", \
  "value": false}]'
```
