---
title: "URLSearchParams: phương thức toString()"
short-title: toString()
slug: Web/API/URLSearchParams/toString
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.toString
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`toString()`** của giao diện {{domxref("URLSearchParams")}} trả về một chuỗi chứa chuỗi truy vấn phù hợp để dùng trong một URL.

## Cú pháp

```js-nolint
toString()
```

### Giá trị trả về

Một chuỗi.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
console.log(params.toString()); // "foo=1&bar=2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
