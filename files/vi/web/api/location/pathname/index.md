---
title: "Location: thuộc tính pathname"
short-title: pathname
slug: Web/API/Location/pathname
page-type: web-api-instance-property
browser-compat: api.Location.pathname
---

{{ApiRef("Location")}}

Thuộc tính **`pathname`** của giao diện {{domxref("Location")}} là một chuỗi chứa đường dẫn của URL cho location. Nếu không có đường dẫn, `pathname` sẽ rỗng; ngược lại, `pathname` chứa một `'/'` ở đầu theo sau bởi đường dẫn của URL, không bao gồm query string hoặc fragment.

## Giá trị

Một chuỗi.

## Ví dụ

```js
// Giả sử chúng ta đang ở URL https://developer.mozilla.org/en-US/docs/Web/API/Location/pathname#examples
console.log(location.pathname); // '/en-US/docs/Web/API/Location/pathname'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
