---
title: PermissionStatus
slug: Web/API/PermissionStatus
page-type: web-api-interface
browser-compat: api.PermissionStatus
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Giao diện **`PermissionStatus`** của [Permissions API](/en-US/docs/Web/API/Permissions_API) cung cấp trạng thái của một đối tượng và một trình xử lý sự kiện để theo dõi các thay đổi đối với trạng thái đó.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("PermissionStatus.name")}} {{ReadOnlyInline}}
  - : Trả về tên của quyền được yêu cầu, giống với `name` được truyền vào {{domxref("Permissions.query")}}.
- {{domxref("PermissionStatus.state")}} {{ReadOnlyInline}}
  - : Trả về trạng thái của quyền được yêu cầu; một trong `'granted'`, `'denied'`, hoặc `'prompt'`.

### Sự kiện

- {{domxref("PermissionStatus.change_event", "change")}}
  - : Được gọi khi `PermissionStatus.state` thay đổi.

## Ví dụ

```js
navigator.permissions
  .query({ name: "geolocation" })
  .then((permissionStatus) => {
    console.log(`geolocation permission status is ${permissionStatus.state}`);
    permissionStatus.onchange = () => {
      console.log(
        `geolocation permission status has changed to ${permissionStatus.state}`,
      );
    };
  });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
