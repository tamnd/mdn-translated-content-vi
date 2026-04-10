---
title: "URLSearchParams: phương thức has()"
short-title: has()
slug: Web/API/URLSearchParams/has
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.has
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`has()`** của giao diện {{domxref("URLSearchParams")}} trả về một giá trị boolean cho biết một tham số đã cho, hoặc một cặp tham số và giá trị, có tồn tại hay không.

## Cú pháp

```js-nolint
has(name)
has(name, value)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn.
- `value` {{optional_inline}}
  - : Nếu được cung cấp, phương thức chỉ kiểm tra cặp tên và giá trị này.

### Giá trị trả về

Một giá trị boolean.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2");
console.log(params.has("foo")); // true
console.log(params.has("foo", "1")); // true
console.log(params.has("foo", "2")); // false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
