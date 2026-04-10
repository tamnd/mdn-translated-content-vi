---
title: "URLSearchParams: phương thức getAll()"
short-title: getAll()
slug: Web/API/URLSearchParams/getAll
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.getAll
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`getAll()`** của giao diện {{domxref("URLSearchParams")}} trả về tất cả các giá trị gắn với một tham số truy vấn đã cho dưới dạng một mảng.

## Cú pháp

```js-nolint
getAll(name)
```

### Tham số

- `name`
  - : Tên của tham số cần trả về.

### Giá trị trả về

Một mảng các chuỗi, có thể rỗng nếu không tìm thấy giá trị nào cho tham số đã cho.

## Ví dụ

```js
const url = new URL("https://example.com?foo=1&bar=2");
const params = new URLSearchParams(url.search);

// Thêm một tham số foo thứ hai.
params.append("foo", 4);

console.log(params.getAll("foo")); // ["1", "4"]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
