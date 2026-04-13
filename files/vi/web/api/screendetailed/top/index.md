---
title: "ScreenDetailed: thuộc tính top"
short-title: top
slug: Web/API/ScreenDetailed/top
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.top
---

{{APIRef("Window Management API")}}{{seecompattable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`top`** của giao diện {{domxref("ScreenDetailed")}} là một số đại diện cho tọa độ y (cạnh trên) của toàn bộ vùng màn hình bên trong bố cục màn hình ảo của OS, tương đối so với [điểm gốc đa màn hình](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin).

Giá trị này bằng với cạnh trên thực sự, bỏ qua bất kỳ phần tử giao diện OS nào được vẽ ở phía trên màn hình. Các cửa sổ không thể đặt trong những vùng đó; để lấy tọa độ trên của vùng màn hình có thể đặt cửa sổ, hãy sử dụng {{domxref("ScreenDetailed.availTop")}}.

> [!NOTE]
> Trong Firefox, một triển khai không chuẩn của thuộc tính `top` có sẵn trên giao diện `Screen`. Xem [Ví dụ không chuẩn](#non-standard_example) bên dưới để biết chi tiết sử dụng.

## Giá trị

Một số.

## Ví dụ

### Ví dụ Window Management API

```js
// Available in browsers that support the Window Management API
const screenDetails = await window.getScreenDetails();

// Return the absolute top value of the first screen
const screen1Top = screenDetails.screens[0].top;
```

### Ví dụ không chuẩn

```js
// Available in Firefox
// Return the absolute top value of the current screen
const screenTop = window.screen.top;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
