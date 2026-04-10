---
title: "URLSearchParams: phương thức get()"
short-title: get()
slug: Web/API/URLSearchParams/get
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.get
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("URLSearchParams")}} trả về giá trị đầu tiên gắn với tham số truy vấn đã cho.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn.

### Giá trị trả về

Một chuỗi hoặc `null`.

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2&foo=3");
console.log(params.get("foo")); // "1"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
