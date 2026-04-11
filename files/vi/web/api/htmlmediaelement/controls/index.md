---
title: "HTMLMediaElement: thuộc tính controls"
short-title: controls
slug: Web/API/HTMLMediaElement/controls
page-type: web-api-instance-property
browser-compat: api.HTMLMediaElement.controls
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLMediaElement.controls`** phản ánh
[`controls`](/en-US/docs/Web/HTML/Reference/Elements/video#controls) Thuộc tính HTML, kiểm soát xem người dùng có
điều khiển giao diện để phát mục phương tiện sẽ được hiển thị.

## Giá trị

Một giá trị boolean. Giá trị `true` có nghĩa là các điều khiển sẽ được
được hiển thị.

## Ví dụ

```js
const obj = document.createElement("video");
obj.controls = true;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLMediaElement")}}: Giao diện dùng để định nghĩa thuộc tính `HTMLMediaElement.controls`
