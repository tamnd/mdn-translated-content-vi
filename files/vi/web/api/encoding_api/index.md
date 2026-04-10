---
title: Encoding API
slug: Web/API/Encoding_API
page-type: web-api-overview
browser-compat:
  - api.TextDecoder
  - api.TextEncoder
  - api.TextEncoderStream
  - api.TextDecoderStream
spec-urls: https://encoding.spec.whatwg.org/
---

{{DefaultAPISidebar("Encoding API")}}{{AvailableInWorkers}}

**Encoding API** cho phép nhà phát triển web làm việc với văn bản được biểu diễn bằng các hệ thống {{Glossary("character encoding", "mã hóa ký tự")}} khác với bộ mã hóa mà chuỗi JavaScript dùng nội bộ. Cụ thể, API này cho phép chuyển đổi văn bản giữa chuỗi JavaScript và mã hóa {{glossary("UTF-8")}} được dùng cho phần lớn tài liệu trên web.

API này cung cấp hai cơ chế:

- **Mã hóa**: nhận một chuỗi JavaScript và chuyển nó thành một mảng byte biểu diễn mã hóa {{glossary("UTF-8")}} của chuỗi đó.
- **Giải mã**: nhận một mảng byte biểu diễn một mã hóa ký tự cụ thể của văn bản, rồi chuyển nó thành một chuỗi JavaScript.

Lưu ý rằng các thao tác này không đối xứng: mã hóa chỉ mã hóa sang UTF-8, còn giải mã có thể giải mã UTF-8 nhưng cũng có thể giải mã [nhiều hệ mã hóa kế thừa](/en-US/docs/Web/API/Encoding_API/Encodings).

API này cung cấp các giao diện đồng bộ cho việc mã hóa và giải mã, đồng thời có cả các bộ mã hóa và bộ giải mã [dựa trên luồng](/en-US/docs/Web/API/Streams_API), có thể dùng để, chẳng hạn, giải mã văn bản khi dữ liệu đến qua kết nối mạng.

## Giao diện

- {{DOMxRef("TextDecoder")}}
  - : Một bộ giải mã để chuyển một mảng byte chứa một mã hóa cụ thể thành một chuỗi JavaScript.
- {{DOMxRef("TextDecoderStream")}}
  - : Một bộ giải mã để chuyển một luồng byte chứa một mã hóa cụ thể thành một luồng các chuỗi JavaScript.
- {{DOMxRef("TextEncoder")}}
  - : Một bộ mã hóa để chuyển một chuỗi JavaScript thành một mảng byte biểu diễn mã hóa UTF-8 của chuỗi đó.
- {{DOMxRef("TextEncoderStream")}}
  - : Một bộ mã hóa để chuyển một luồng các chuỗi JavaScript thành một luồng byte biểu diễn mã hóa UTF-8 của các chuỗi đó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Encoding API Encodings](/en-US/docs/Web/API/Encoding_API/Encodings) - Các bộ mã hóa phải được hỗ trợ khi giải mã văn bản.
