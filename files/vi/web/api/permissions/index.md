---
title: Permissions
slug: Web/API/Permissions
page-type: web-api-interface
browser-compat: api.Permissions
---

{{APIRef("Permissions API")}}{{AvailableInWorkers}}

Giao diện **`Permissions`** của [Permissions API](/en-US/docs/Web/API/Permissions_API) cung cấp chức năng Permission API cốt lõi, chẳng hạn như các phương thức để truy vấn và thu hồi quyền.

## Phương thức phiên bản

- {{domxref("Permissions.query","Permissions.query()")}}
  - : Trả về trạng thái quyền của người dùng cho một API đã cho.
- {{domxref("Permissions.revoke","Permissions.revoke()")}} {{Deprecated_Inline}}
  - : Thu hồi quyền hiện đang được đặt cho một API đã cho.

## Ví dụ

```js
navigator.permissions.query({ name: "geolocation" }).then((result) => {
  if (result.state === "granted") {
    showLocalNewsWithGeolocation();
  } else if (result.state === "prompt") {
    showButtonToEnableLocalNews();
  }
  // Không làm gì nếu quyền bị từ chối.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
