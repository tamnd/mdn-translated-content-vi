---
title: TextEncoderStream
slug: Web/API/TextEncoderStream
page-type: web-api-interface
browser-compat: api.TextEncoderStream
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Giao diện **`TextEncoderStream`** thuộc {{domxref('Encoding API','','',' ')}} chuyển đổi một luồng chuỗi thành các byte theo mã hóa UTF-8. Đây là phiên bản luồng tương đương với {{domxref("TextEncoder")}}.
Giao diện này có cùng hình dạng với {{domxref("TransformStream")}}, cho phép sử dụng trong {{domxref("ReadableStream.pipeThrough()")}} và các phương thức tương tự.

## Hàm khởi tạo

- {{domxref("TextEncoderStream.TextEncoderStream","TextEncoderStream()")}}
  - : Tạo một đối tượng `TextEncoderStream` mới.

## Thuộc tính phiên bản

- {{DOMxRef("TextEncoderStream.encoding")}} {{ReadOnlyInline}}
  - : Luôn trả về `"utf-8"`.
- {{DOMxRef("TextEncoderStream.readable")}} {{ReadOnlyInline}}
  - : Trả về phiên bản {{domxref("ReadableStream")}} được điều khiển bởi đối tượng này.
- {{DOMxRef("TextEncoderStream.writable")}} {{ReadOnlyInline}}
  - : Trả về phiên bản {{domxref("WritableStream")}} được điều khiển bởi đối tượng này.

## Ví dụ

[Ví dụ về luồng dữ liệu có cấu trúc và HTML](https://streams.spec.whatwg.org/demos/)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextDecoderStream")}}
- {{domxref("TextEncoder")}}
- {{domxref("TransformStream")}}
- [Khái niệm Streams API](/en-US/docs/Web/API/Streams_API/Concepts)
- [Thử nghiệm với Streams API](https://deanhume.com/experimenting-with-the-streams-api/)
- [Yêu cầu phát trực tuyến với fetch API](https://developer.chrome.com/docs/capabilities/web-apis/fetch-streaming-requests), developer.chrome.com (2020)
