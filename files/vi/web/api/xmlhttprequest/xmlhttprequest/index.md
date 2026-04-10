---
title: "XMLHttpRequest: constructor XMLHttpRequest()"
short-title: XMLHttpRequest()
slug: Web/API/XMLHttpRequest/XMLHttpRequest
page-type: web-api-constructor
browser-compat: api.XMLHttpRequest.XMLHttpRequest
---

{{APIRef("XMLHttpRequest API")}} {{AvailableInWorkers("window_and_worker_except_service")}}

Constructor **`XMLHttpRequest()`** tạo một {{domxref("XMLHttpRequest")}} mới.

## Cú pháp

```js-nolint
new XMLHttpRequest()
// Không chuẩn
new XMLHttpRequest(options)
```

### Tham số

Không có tham số chuẩn. Tuy nhiên, Firefox cho phép một tham số không chuẩn:

- `options` {{non-standard_inline}}
  - : Một đối tượng có thể chứa các cờ sau:
    - `mozAnon`
      - : Một boolean. Khi đặt cờ này thành `true` sẽ khiến trình duyệt không tiết lộ {{Glossary("origin")}} và thông tin xác thực người dùng khi tải tài nguyên. Quan trọng nhất, điều này có nghĩa là {{Glossary("Cookie", "cookies")}} sẽ không được gửi trừ khi được thêm rõ ràng bằng cách sử dụng `setRequestHeader`.
    - `mozSystem`
      - : Một boolean. Khi đặt cờ này thành `true`, chính sách cùng nguồn gốc sẽ không được áp dụng cho yêu cầu.

### Giá trị trả về

Một đối tượng {{domxref("XMLHttpRequest")}} mới. Đối tượng phải được chuẩn bị bằng cách gọi ít nhất {{domxref("XMLHttpRequest.open", "open()")}} để khởi tạo trước khi gọi {{domxref("XMLHttpRequest.send", "send()")}} để gửi yêu cầu đến máy chủ.

## Các đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/Using_XMLHttpRequest)
- [HTML trong XMLHttpRequest](/en-US/docs/Web/API/XMLHttpRequest_API/HTML_in_XMLHttpRequest)
