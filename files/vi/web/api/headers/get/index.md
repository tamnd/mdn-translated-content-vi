---
title: "Headers: phương thức get()"
short-title: get()
slug: Web/API/Headers/get
page-type: web-api-instance-method
browser-compat: api.Headers.get
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`get()`** của giao diện {{domxref("Headers")}} trả về một chuỗi byte chứa tất cả giá trị của một header trong đối tượng `Headers` với tên đã cho. Nếu header được yêu cầu không tồn tại trong đối tượng `Headers`, phương thức trả về `null`.

Vì lý do bảo mật, một số header chỉ có thể được user agent kiểm soát. Những header này bao gồm {{Glossary("Forbidden_request_header", "các forbidden request headers")}} và {{Glossary("Forbidden_response_header_name", "các forbidden response header names")}}.

## Cú pháp

```js-nolint
get(name)
```

### Tham số

- `name`
  - : Tên của HTTP header mà bạn muốn truy xuất giá trị từ đối tượng `Headers`. Nếu tên đã cho không khớp với sản xuất [field-name](https://httpwg.org/specs/rfc9110.html#fields.names) trong đặc tả HTTP, phương thức này sẽ ném ra {{jsxref("TypeError")}}. Tên không phân biệt hoa thường.

### Giá trị trả về

Một chuỗi {{jsxref("String")}} biểu diễn các giá trị của header được truy xuất, hoặc `null` nếu header này chưa được đặt.

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
myHeaders.get("Not-Set"); // Returns null
```

Bạn có thể thêm một header vào đó bằng {{domxref("Headers.append")}}, rồi truy xuất nó bằng `get()`:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.get("Content-Type"); // Returns "image/jpeg"
```

Nếu header có nhiều giá trị liên kết với nó, chuỗi byte sẽ chứa tất cả các giá trị theo đúng thứ tự chúng được thêm vào đối tượng Headers:

```js
myHeaders.append("Accept-Encoding", "deflate");
myHeaders.append("Accept-Encoding", "gzip");
myHeaders.get("Accept-Encoding"); // Returns "deflate, gzip"
myHeaders
  .get("Accept-Encoding")
  .split(",")
  .map((v) => v.trimStart()); // Returns [ "deflate", "gzip" ]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
