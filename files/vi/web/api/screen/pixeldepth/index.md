---
title: "Screen: thuộc tính pixelDepth"
short-title: pixelDepth
slug: Web/API/Screen/pixelDepth
page-type: web-api-instance-property
browser-compat: api.Screen.pixelDepth
---

{{APIRef("CSSOM view API")}}

Trả về độ sâu bit của màn hình. Theo CSSOM, một số triển khai trả về `24` vì lý do tương thích. Xem phần [tương thích trình duyệt](#browser_compatibility) để biết những trình duyệt không làm vậy.

## Giá trị

Một số.

## Ví dụ

```js
// nếu không có đủ độ sâu bit
// chọn màu đơn giản hơn
document.style.color = window.screen.pixelDepth > 8 ? "#FAEBD7" : "white";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Screen.colorDepth")}}
