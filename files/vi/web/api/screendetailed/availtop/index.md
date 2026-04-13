---
title: "ScreenDetailed: thuộc tính availTop"
short-title: availTop
slug: Web/API/ScreenDetailed/availTop
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.availTop
---

{{APIRef("Window Management API")}}{{seecompattable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`availTop`** của giao diện {{domxref("ScreenDetailed")}} là một số đại diện cho tọa độ y (cạnh trên) của vùng màn hình khả dụng bên trong bố cục màn hình ảo của OS, tương đối so với [điểm gốc đa màn hình](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin).

Giá trị này bằng với thuộc tính {{domxref("ScreenDetailed.top")}}, cộng thêm chiều cao của bất kỳ phần tử giao diện OS nào được vẽ ở phía trên màn hình. Các cửa sổ không thể được đặt trong những vùng đó, vì vậy `availTop` hữu ích để xác định ranh giới trên của vùng thực sự có thể mở hoặc đặt cửa sổ.

> [!NOTE]
> Một triển khai không chuẩn của thuộc tính `availTop` có sẵn trên giao diện `Screen` trong tất cả các trình duyệt. Xem [Ví dụ không chuẩn](#non-standard_example) bên dưới để biết chi tiết sử dụng.

## Giá trị

Một số.

## Ví dụ

### Ví dụ Window Management API

```js
// Available in browsers that support the Window Management API
const screenDetails = await window.getScreenDetails();

// Return the availTop value of the first screen
const screen1AvailTop = screenDetails.screens[0].availTop;
```

### Ví dụ không chuẩn

```js
// Available in all browsers
// Return the availTop value of the current screen
const screenAvailTop = window.screen.availTop;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
