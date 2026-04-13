---
title: "VirtualKeyboard: overlaysContent property"
short-title: overlaysContent
slug: Web/API/VirtualKeyboard/overlaysContent
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.VirtualKeyboard.overlaysContent
---

{{APIRef("VirtualKeyboard API")}}{{SeeCompatTable}}{{securecontext_header}}

Thuộc tính **`overlaysContent`** của giao diện VirtualKeyboard có thể được dùng để thoát ra khỏi cách tự động xử lý bàn phím ảo trên màn hình của trình duyệt bằng cách giảm kích thước viewport để nhường chỗ cho chúng.

Nếu thuộc tính `overlaysContent` được đặt thành `true`, trình duyệt không còn thay đổi kích thước viewport khi bàn phím ảo xuất hiện. Thay vào đó, bàn phím ảo phủ lên nội dung của trang web, và bạn có thể điều chỉnh bố cục trang cho phù hợp bằng {{domxref("VirtualKeyboard_API", "Virtual Keyboard API", "", "nocode")}} và CSS, JavaScript tùy chỉnh của bạn.

## Giá trị

Một giá trị boolean. `false` theo mặc định, đặt thành `true` để thoát ra khỏi xử lý tự động của trình duyệt đối với bàn phím ảo trên màn hình.

## Ví dụ

```js
if ("virtualKeyboard" in navigator) {
  console.log(navigator.virtualKeyboard.overlaysContent); // false
  navigator.virtualKeyboard.overlaysContent = true; // Opt out of the automatic handling.
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("VirtualKeyboard_API", "The VirtualKeyboard API", "", "nocode")}}
- [Full control with the VirtualKeyboard API](https://developer.chrome.com/docs/web-platform/virtual-keyboard/)
