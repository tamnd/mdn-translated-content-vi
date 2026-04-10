---
title: "Headers: phương thức delete()"
short-title: delete()
slug: Web/API/Headers/delete
page-type: web-api-instance-method
browser-compat: api.Headers.delete
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`delete()`** của giao diện {{domxref("Headers")}} xóa một header khỏi đối tượng `Headers` hiện tại.

Vì lý do bảo mật, một số header chỉ có thể được user agent kiểm soát. Những header này bao gồm {{Glossary("Forbidden_request_header", "các forbidden request headers")}} và {{Glossary("Forbidden_response_header_name", "các forbidden response header names")}}.

## Cú pháp

```js-nolint
delete(name)
```

### Tham số

- `name`
  - : Tên của HTTP header mà bạn muốn xóa khỏi đối tượng `Headers`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
```

Bạn có thể thêm một header vào đó bằng {{domxref("Headers.append")}}:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.get("Content-Type"); // Returns 'image/jpeg'
```

Sau đó bạn có thể xóa nó:

```js
myHeaders.delete("Content-Type");
myHeaders.get("Content-Type"); // Returns null, as it has been deleted
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
