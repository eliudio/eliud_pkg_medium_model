{
  "id": "AlbumEntry",
  "packageName": "eliud_pkg_medium_model",
  "packageFriendlyName": "medium",
  "generate": {
    "generateComponent": false,
    "generateRepository": true,
    "generateCache": true,
    "hasPersistentRepository": false,
    "generateFirestoreRepository": false,
    "generateRepositorySingleton": false,
    "generateModel": true,
    "generateEntity": true,
    "generateForm": false,
    "generateList": false,
    "generateDropDownButton": false,
    "generateInternalComponent": false,
    "generateEmbeddedComponent": true
  },
  "fields": [
    {
      "fieldName": "documentID",
      "required": true,
      "displayName": "Document ID",
      "fieldType": "String",
      "group": "general",
      "defaultValue": "IDENTIFIED",
      "iconName": "vpn_key",
      "hidden": true
    },
    {
      "fieldName": "name",
      "displayName": "Name",
      "fieldType": "String",
      "group": "general"
    },
    {
      "fieldName": "medium",
      "displayName": "medium",
      "fieldType": "PlatformMedium",
      "association": true,
      "group": "image",
      "optional": true
    }
  ],
  "groups": [
    {
        "group": "general",
        "description": "General"
    },
    {
        "group": "image",
        "description": "Optional Image"
    },
     {
         "group": "code",
         "description": "Optional Code"
     }
  ],
  "listFields": {
    "title": "value.name != null ? Center(child: StyleRegistry.registry().styleWithApp(app).frontEndStyle().textStyle().text(app, context, value.name!)) : Container()"
  },
  "depends": ["eliud_core_main"]
}
