---
title: "HTMLMediaElement: thuộc tính volume"
short-title: volume
slug: Web/API/HTMLMediaElement/volume
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.volume
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.volume`** đặt âm lượng ở mức
mà phương tiện truyền thông sẽ được phát.

## Giá trị

Một số từ 0 đến 1, trong đó 0 được tắt tiếng một cách hiệu quả và 1 là giá trị lớn nhất có thể.

## Ví dụ

```js
const obj = document.createElement("audio");
console.log(obj.volume); // 1
obj.volume = 0.75;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.volume`
- {{domxref("HTMLMediaElement.muted")}}
