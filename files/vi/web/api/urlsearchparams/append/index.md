---
title: "URLSearchParams: phương thức append()"
short-title: append()
slug: Web/API/URLSearchParams/append
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.append
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`append()`** của giao diện {{domxref("URLSearchParams")}} thêm một cặp tên/giá trị được chỉ định như một tham số truy vấn mới.

## Cú pháp

```js-nolint
append(name, value)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn.
- `value`
  - : Giá trị của tham số truy vấn.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const url = new URL("https://example.com?foo=1");
const params = url.searchParams;
params.append("bar", 2);
console.log(url.href); // "https://example.com/?foo=1&bar=2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URLSearchParams.set()")}}
