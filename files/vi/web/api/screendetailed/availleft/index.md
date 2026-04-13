---
title: "ScreenDetailed: thuộc tính availLeft"
short-title: availLeft
slug: Web/API/ScreenDetailed/availLeft
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.ScreenDetailed.availLeft
---

{{APIRef("Window Management API")}}{{seecompattable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`availLeft`** của giao diện {{domxref("ScreenDetailed")}} là một số đại diện cho tọa độ x (cạnh trái) của vùng màn hình khả dụng bên trong bố cục màn hình ảo của OS, tương đối so với [điểm gốc đa màn hình](/en-US/docs/Web/API/Window_Management_API/Multi-screen_origin).

Giá trị này bằng với thuộc tính {{domxref("ScreenDetailed.left")}}, cộng thêm chiều rộng của bất kỳ phần tử giao diện OS nào được vẽ ở phía bên trái màn hình. Các cửa sổ không thể được đặt trong những vùng đó, vì vậy `availLeft` hữu ích để xác định ranh giới trái của vùng thực sự có thể mở hoặc đặt cửa sổ.

> [!NOTE]
> Một triển khai không chuẩn của thuộc tính `availLeft` có sẵn trên giao diện `Screen` trong tất cả các trình duyệt. Xem [Ví dụ không chuẩn](#non-standard_example) bên dưới để biết chi tiết sử dụng.

## Giá trị

Một số.

## Ví dụ

### Ví dụ Window Management API

```js
// Available in browsers that support the Window Management API
const screenDetails = await window.getScreenDetails();

// Return the availLeft value of the first screen
const screen1AvailLeft = screenDetails.screens[0].availLeft;
```

### Ví dụ không chuẩn

```js
// Available in all browsers
// Return the availLeft value of the current screen
const screenAvailLeft = window.screen.availLeft;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Window Management API](/en-US/docs/Web/API/Window_Management_API)
