---
title: "Screen: thuộc tính colorDepth"
short-title: colorDepth
slug: Web/API/Screen/colorDepth
page-type: web-api-instance-property
browser-compat: api.Screen.colorDepth
---

{{APIRef("CSSOM view API")}}

Thuộc tính chỉ đọc **`Screen.colorDepth`** trả về độ sâu màu của màn hình. Theo CSSOM, một số triển khai trả về `24` vì lý do tương thích. Xem phần tương thích trình duyệt để biết những trình duyệt không làm vậy.

## Giá trị

Một số.

## Ví dụ

```js
// Kiểm tra độ sâu màu của màn hình
if (window.screen.colorDepth < 8) {
  // Sử dụng phiên bản màu thấp của trang
} else {
  // Sử dụng trang thông thường, nhiều màu sắc
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Screen.pixelDepth")}}
