---
title: "PermissionStatus: state property"
short-title: state
slug: Web/API/PermissionStatus/state
page-type: web-api-instance-property
browser-compat: api.PermissionStatus.state
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`state`** của giao diện {{domxref("PermissionStatus")}} trả về trạng thái của quyền được yêu cầu. Thuộc tính này trả về một trong các giá trị `'granted'`, `'denied'`, hoặc `'prompt'`.

## Giá trị

Một trong các giá trị sau:

- `'granted'`
  - : Người dùng, hoặc user agent thay mặt người dùng, đã cấp phép rõ ràng để sử dụng một [tính năng mạnh](https://w3c.github.io/permissions/#dfn-powerful-feature). Người gọi có thể sử dụng tính năng này mà không cần user agent hỏi ý kiến người dùng.
- `'denied'`
  - : Người dùng, hoặc user agent thay mặt người dùng, đã từ chối quyền truy cập vào [tính năng mạnh](https://w3c.github.io/permissions/#dfn-powerful-feature) này. Người gọi không thể sử dụng tính năng này.
- `'prompt'`
  - : Người dùng chưa cấp phép rõ ràng để sử dụng tính năng (_tức là giống như bị từ chối_). Nó cũng có nghĩa là nếu người gọi cố gắng sử dụng tính năng, user agent sẽ nhắc người dùng cấp quyền hoặc quyền truy cập vào tính năng sẽ bị từ chối.

## Ví dụ

```js
navigator.permissions
  .query({ name: "geolocation" })
  .then((permissionStatus) => {
    console.log(`geolocation permission state is ${permissionStatus.state}`);
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
