---
title: "URLSearchParams: phương thức set()"
short-title: set()
slug: Web/API/URLSearchParams/set
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.set
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`set()`** của giao diện {{domxref("URLSearchParams")}} đặt giá trị gắn với một tham số truy vấn đã cho thành giá trị đã chỉ định. Nếu có nhiều giá trị, các giá trị còn lại sẽ bị xóa.

## Cú pháp

```js-nolint
set(name, value)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn.
- `value`
  - : Giá trị mới của tham số truy vấn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const params = new URLSearchParams("foo=1&bar=2&foo=3");
params.set("foo", "4");
console.log(params.toString()); // "foo=4&bar=2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
