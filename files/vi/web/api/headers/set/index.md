---
title: "Headers: phương thức set()"
short-title: set()
slug: Web/API/Headers/set
page-type: web-api-instance-method
browser-compat: api.Headers.set
---

{{APIRef("Fetch API")}} {{AvailableInWorkers}}

Phương thức **`set()`** của giao diện {{domxref("Headers")}} đặt một giá trị mới cho một header hiện có bên trong đối tượng `Headers`, hoặc thêm header nếu nó chưa tồn tại.

Sự khác biệt giữa `set()` và {{domxref("Headers.append")}} là nếu header được chỉ định đã tồn tại và chấp nhận nhiều giá trị, `set()` sẽ ghi đè giá trị hiện có bằng giá trị mới, trong khi {{domxref("Headers.append")}} sẽ nối giá trị mới vào cuối tập giá trị.

Vì lý do bảo mật, một số header chỉ có thể được user agent kiểm soát. Những header này bao gồm {{Glossary("Forbidden_request_header", "các forbidden request headers")}} và {{Glossary("Forbidden_response_header_name", "các forbidden response header names")}}.

## Cú pháp

```js-nolint
set(name, value)
```

### Tham số

- `name`
  - : Tên của HTTP header mà bạn muốn đặt thành giá trị mới. Nếu tên đã cho không phải là tên của một HTTP header, phương thức này sẽ ném ra {{jsxref("TypeError")}}.
- `value`
  - : Giá trị mới mà bạn muốn đặt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Tạo một đối tượng `Headers` rỗng là rất đơn giản:

```js
const myHeaders = new Headers(); // Currently empty
```

Bạn có thể thêm một header vào đó bằng {{domxref("Headers.append")}}, rồi đặt một giá trị mới cho header này bằng `set()`:

```js
myHeaders.append("Content-Type", "image/jpeg");
myHeaders.set("Content-Type", "text/html");
```

Nếu header được chỉ định chưa tồn tại, `set()` sẽ tạo nó và đặt giá trị của nó thành giá trị đã chỉ định. Nếu header được chỉ định đã tồn tại và chấp nhận nhiều giá trị, `set()` sẽ ghi đè giá trị hiện có bằng giá trị mới:

```js
myHeaders.set("Accept-Encoding", "deflate");
myHeaders.set("Accept-Encoding", "gzip");
myHeaders.get("Accept-Encoding"); // Returns 'gzip'
```

Bạn sẽ cần {{domxref("Headers.append")}} để nối giá trị mới vào tập giá trị, thay vì ghi đè nó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [ServiceWorker API](/en-US/docs/Web/API/Service_Worker_API)
- [HTTP access control (CORS)](/en-US/docs/Web/HTTP/Guides/CORS)
- [HTTP](/en-US/docs/Web/HTTP)
