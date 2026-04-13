---
title: "ScreenDetailed: thuộc tính left"
short-title: left
slug: Web/API/ScreenDetailed/left
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.left
---

{{APIRef("Window Management API")}}{{seecompattable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`left`** của giao diện {{domxref("ScreenDetailed")}} là một số đại diện cho tọa độ x (cạnh trái) của toàn bộ vùng màn hình bên trong bố cục màn hình ảo của OS, tương đối so với [điểm gốc đa màn hình](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin).

Giá trị này bằng với cạnh trái thực sự, bỏ qua bất kỳ phần tử giao diện OS nào được vẽ ở phía bên trái màn hình. Các cửa sổ không thể đặt trong những vùng đó; để lấy tọa độ trái của vùng màn hình có thể đặt cửa sổ, hãy sử dụng {{domxref("ScreenDetailed.availLeft")}}.

> [!NOTE]
> Trong Firefox, một triển khai không chuẩn của thuộc tính `left` có sẵn trên giao diện `Screen`. Xem [Ví dụ không chuẩn](#non-standard_example) bên dưới để biết chi tiết sử dụng.

## Giá trị

Một số.

## Ví dụ

### Ví dụ Window Management API

```js
// Available in browsers that support the Window Management API
const screenDetails = await window.getScreenDetails();

// Return the absolute left value of the first screen
const screen1Left = screenDetails.screens[0].left;
```

### Ví dụ không chuẩn

```js
// Available in Firefox
// Return the absolute left value of the current screen
const screenLeft = window.screen.left;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
