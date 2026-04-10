---
title: "Headers: phương thức has()"
short-title: has()
slug: Web/API/Headers/has
page-type: web-api-instance-method
browser-compat: api.Headers.has
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`has()`** của giao diện {{domxref("Headers")}} trả về một giá trị boolean cho biết một đối tượng `Headers` có chứa một header nhất định hay không.

Vì lý do bảo mật, một số header chỉ có thể được user agent kiểm soát. Những header này bao gồm {{Glossary("Forbidden_request_header", "các forbidden request headers")}} và {{Glossary("Forbidden_response_header_name", "các forbidden response header names")}}.

## Cú pháp

```js-nolint
has(name)
```

### Tham số

- `name`
  - : Tên của HTTP header mà bạn muốn kiểm tra. Nếu tên đã cho không phải là tên HTTP header hợp lệ, phương thức này sẽ ném ra {{jsxref("TypeError")}}.

### Giá trị trả về

Một giá trị boolean.

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
```

Bạn có thể thêm một header vào đó bằng {{domxref("Headers.append")}}, rồi kiểm tra sự tồn tại của nó bằng `has()`:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.has("Content-Type"); // Returns true
myHeaders.has("Accept-Encoding"); // Returns false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
