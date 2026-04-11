---
title: "Navigator: thuộc tính permissions"
short-title: permissions
slug: Web/API/Navigator/permissions
page-type: web-api-instance-property
browser-compat: api.Navigator.permissions
---

{{APIRef("Permissions API")}}

Thuộc tính chỉ đọc **`permissions`** của giao diện {{domxref("Navigator")}} trả về một
Đối tượng {{domxref("Permissions")}} có thể được sử dụng để truy vấn và cập nhật quyền
trạng thái của các API thuộc phạm vi điều chỉnh của [Permissions API](/en-US/docs/Web/API/Permissions_API).

## Giá trị

Đối tượng {{domxref("Permissions")}}.

## Ví dụ

```js
navigator.permissions.query({ name: "geolocation" }).then((result) => {
  if (result.state === "granted") {
    showMap();
  } else if (result.state === "prompt") {
    showButtonToEnableMap();
  }
  // Don't do anything if the permission was denied.
});
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Permissions API](/en-US/docs/Web/API/Permissions_API)
- {{domxref("Navigator")}}
