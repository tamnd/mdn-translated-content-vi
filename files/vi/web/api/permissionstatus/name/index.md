---
title: "PermissionStatus: name property"
short-title: name
slug: Web/API/PermissionStatus/name
page-type: web-api-instance-property
browser-compat: api.PermissionStatus.name
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("PermissionStatus")}} trả về tên của quyền được yêu cầu.

## Giá trị

Giá trị chỉ đọc giống với đối số `name` được truyền vào {{domxref("Permissions.query", "navigator.permissions.query()")}}.

## Ví dụ

```js
function stateChangeListener() {
  console.log(`${this.name} permission status changed to ${this.state}`);
}
function queryAndTrackPermission(permissionName) {
  navigator.permissions
    .query({ name: permissionName })
    .then((permissionStatus) => {
      console.log(
        `${permissionName} permission state is ${permissionStatus.state}`,
      );
      permissionStatus.onchange = stateChangeListener;
    });
}
queryAndTrackPermission("geolocation");
queryAndTrackPermission("midi");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
