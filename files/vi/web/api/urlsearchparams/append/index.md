---
title: "URLSearchParams: phương thức append()"
short-title: append()
slug: Web/API/URLSearchParams/append
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.append
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`append()`** của giao diện {{domxref("URLSearchParams")}} thêm một cặp khóa/giá trị được chỉ định như một tham số truy vấn mới.

Như ví dụ bên dưới, nếu cùng một khóa được thêm nhiều lần, nó sẽ xuất hiện nhiều lần trong chuỗi tham số cho mỗi giá trị.

## Cú pháp

```js-nolint
append(name, value)
```

### Tham số

- `name`
  - : Tên của tham số cần thêm.
- `value`
  - : Giá trị của tham số cần thêm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Thêm cùng một tham số nhiều lần

```js
const url = new URL("https://example.com?foo=1&bar=2");
const params = new URLSearchParams(url.search);

// Thêm một tham số foo thứ hai.
params.append("foo", 4);
// Chuỗi truy vấn bây giờ là: 'foo=1&bar=2&foo=4'
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URL")}}
- [Google Developers: Thao tác URL dễ dàng với URLSearchParams](https://developer.chrome.com/blog/urlsearchparams/)
