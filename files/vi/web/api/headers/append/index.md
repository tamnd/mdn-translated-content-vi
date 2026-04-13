---
title: "Headers: phương thức append()"
short-title: append()
slug: Web/API/Headers/append
page-type: web-api-instance-method
browser-compat: api.Headers.append
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`append()`** của giao diện {{domxref("Headers")}} thêm một giá trị mới vào một header hiện có bên trong đối tượng `Headers`, hoặc thêm header nếu nó chưa tồn tại.

Sự khác biệt giữa {{domxref("Headers.set", "set()")}} và `append()` là nếu header được chỉ định đã tồn tại và chấp nhận nhiều giá trị, `set()` sẽ ghi đè giá trị hiện có bằng giá trị mới, trong khi `append()` sẽ nối giá trị mới vào cuối tập giá trị.

Vì lý do bảo mật, một số header chỉ có thể được user agent kiểm soát. Những header này bao gồm {{Glossary("Forbidden_request_header", "các forbidden request headers")}} và {{Glossary("Forbidden_response_header_name", "các forbidden response header names")}}.

## Cú pháp

```js-nolint
append(name, value)
```

### Tham số

- `name`
  - : Tên của HTTP header mà bạn muốn thêm vào đối tượng `Headers`.
- `value`
  - : Giá trị của HTTP header mà bạn muốn thêm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
```

Bạn có thể thêm một header vào đó bằng `append()`:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.get("Content-Type"); // Returns 'image/jpeg'
```

Nếu header được chỉ định đã tồn tại, `append()` sẽ đổi giá trị của nó thành giá trị đã chỉ định. Nếu header được chỉ định đã tồn tại và chấp nhận nhiều giá trị, `append()` sẽ nối giá trị mới vào cuối tập giá trị:

```js
myHeaders.append("Accept-Encoding", "deflate");
myHeaders.append("Accept-Encoding", "gzip");
myHeaders.get("Accept-Encoding"); // Returns 'deflate, gzip'
```

Để ghi đè giá trị cũ bằng giá trị mới, hãy dùng {{domxref("Headers.set")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
