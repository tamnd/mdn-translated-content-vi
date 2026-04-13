---
title: "ScreenDetailed: thuộc tính isInternal"
short-title: isInternal
slug: Web/API/ScreenDetailed/isInternal
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.isInternal
---

{{APIRef("Window Management API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`isInternal`** của giao diện {{domxref("ScreenDetailed")}} là một giá trị boolean cho biết màn hình là nội bộ của thiết bị hay bên ngoài. Các thiết bị bên ngoài thường được sản xuất riêng biệt với thiết bị mà chúng được kết nối và có thể kết nối hoặc ngắt kết nối khi cần, trong khi màn hình nội bộ là một phần của thiết bị và không được thiết kế để ngắt kết nối.

## Giá trị

Một giá trị boolean: `true` nếu màn hình là nội bộ, `false` nếu là bên ngoài.

## Ví dụ

```js
const screenDetails = await window.getScreenDetails();

// Is the first screen internal?
const screen1Internal = screenDetails.screens[0].isInternal;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
