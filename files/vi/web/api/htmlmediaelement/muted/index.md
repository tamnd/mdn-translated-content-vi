---
title: "HTMLMediaElement: thuộc tính muted"
short-title: muted
slug: Web/API/HTMLMediaElement/muted
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.muted
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.muted`** cho biết liệu phương tiện có
phần tử bị tắt tiếng.

## Giá trị

Một giá trị boolean. `true` có nghĩa là tắt tiếng và `false` có nghĩa là
không bị tắt tiếng.

## Ví dụ

```js
const obj = document.createElement("video");
console.log(obj.muted); // false
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.muted`
- {{domxref("HTMLMediaElement.defaultMuted")}}
- {{domxref("HTMLMediaElement.volume")}}
