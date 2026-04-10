---
title: "URLSearchParams: phương thức delete()"
short-title: delete()
slug: Web/API/URLSearchParams/delete
page-type: web-api-instance-method
browser-compat: api.URLSearchParams.delete
---

{{ApiRef("URL API")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("URLSearchParams")}} xóa các tham số truy vấn khớp với một tên, và tùy chọn một giá trị, khỏi danh sách tất cả các tham số truy vấn.

## Cú pháp

```js-nolint
delete(name)
delete(name, value)
```

### Tham số

- `name`
  - : Tên của tham số truy vấn cần xóa.
- `value` {{optional_inline}}
  - : Nếu được cung cấp, chỉ xóa các cặp có tên và giá trị này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const url = new URL("https://example.com?foo=1&bar=2&foo=3");
const params = url.searchParams;
params.delete("foo");
console.log(url.href); // "https://example.com/?bar=2"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("URLSearchParams.append()")}}
