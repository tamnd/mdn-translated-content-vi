---
title: "URLSearchParams: phương thức getAll()"
short-title: getAll()
slug: Web/API/URLSearchParams/getAll
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.getAll
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`getAll()`** của giao diện {{domxref("URLSearchParams")}} trả về tất cả các giá trị gắn với một tham số truy vấn đã cho.

## Cú pháp

```js-nolint
getAll(name)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn.

### Giá trị trả về

Một mảng chuỗi.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2&foo=3");
console.log(params.getAll("foo")); // ["1", "3"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
