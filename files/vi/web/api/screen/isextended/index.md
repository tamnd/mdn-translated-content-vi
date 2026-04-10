---
title: "Screen: thuộc tính isExtended"
short-title: isExtended
slug: Web/API/Screen/isExtended
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Screen.isExtended
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính chỉ đọc **`isExtended`** của giao diện {{domxref("Screen")}} trả về `true` nếu thiết bị của người dùng có nhiều màn hình, và `false` nếu không.

Thuộc tính này thường được truy cập thông qua `window.screen.isExtended`, và có thể được sử dụng để kiểm tra xem nhiều màn hình có khả dụng trước khi cố gắng tạo bố cục đa cửa sổ, đa màn hình bằng [Window Management API](/en-US/docs/Web/API/Window_Management_API).

## Giá trị

Một giá trị boolean -- `true` nếu thiết bị có nhiều màn hình, và `false` nếu không.

> [!NOTE]
> Nếu một {{httpheader("Permissions-Policy/window-management", "window-management")}} [Permissions-Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt để chặn sử dụng Window Management API, `isExtended` sẽ luôn trả về `false`.

## Ví dụ

```js
if (window.screen.isExtended) {
  // Tạo bố cục cửa sổ đa màn hình
} else {
  // Tạo bố cục cửa sổ đơn màn hình
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
