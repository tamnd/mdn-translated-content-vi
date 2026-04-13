---
title: "URLSearchParams: phương thức set()"
short-title: set()
slug: Web/API/URLSearchParams/set
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.set
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`set()`** của giao diện {{domxref("URLSearchParams")}} đặt giá trị gắn với một tham số truy vấn đã cho thành giá trị đã chỉ định. Nếu có nhiều giá trị trùng khớp, phương thức này sẽ xóa các giá trị còn lại. Nếu tham số truy vấn không tồn tại, phương thức này sẽ tạo ra nó.

## Cú pháp

```js-nolint
set(name, value)
```

### Tham số

- `name`
  - : Tên của tham số cần đặt.
- `value`
  - : Giá trị của tham số cần đặt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
let url = new URL("https://example.com?foo=1&bar=2");
let params = new URLSearchParams(url.search);

// Thêm một tham số thứ ba.
params.set("baz", 3);
params.toString(); // "foo=1&bar=2&baz=3"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
