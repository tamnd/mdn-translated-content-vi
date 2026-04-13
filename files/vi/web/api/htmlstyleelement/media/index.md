---
title: "HTMLStyleElement: thuộc tính media"
short-title: media
slug: Web/API/HTMLStyleElement/media
page-type: web-api-instance-property
browser-compat: api.HTMLStyleElement.media
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLStyleElement.media`** chỉ định phương tiện đích dự kiến cho thông tin kiểu dáng.

## Giá trị

Một chuỗi mô tả một phương tiện đơn lẻ hoặc danh sách phân tách bằng dấu phẩy.

## Ví dụ

Giả sử `<head>` chứa những gì sau:

```html
<style id="inline-style" media="screen, print">
  p {
    color: blue;
  }
</style>
```

Thì:

```js
const style = document.getElementById("inline-style");

console.log(style.media); // 'screen, print'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
