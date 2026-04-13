---
title: TextDecoderStream
slug: Web/API/TextDecoderStream
page-type: web-api-interface
browser-compat: api.TextDecoderStream
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Giao diện **`TextDecoderStream`** của {{domxref('Encoding API','','',' ')}} chuyển đổi một luồng văn bản trong mã hóa nhị phân, chẳng hạn UTF-8, thành một luồng chuỗi.
Đây là phiên bản streaming tương đương với {{domxref("TextDecoder")}}.
Nó triển khai hình dạng tương tự như {{domxref("TransformStream")}}, cho phép sử dụng trong {{domxref("ReadableStream.pipeThrough()")}} và các phương thức tương tự.

## Hàm khởi tạo

- {{domxref("TextDecoderStream.TextDecoderStream","TextDecoderStream()")}}
  - : Tạo một đối tượng `TextDecoderStream` mới.

## Thuộc tính phiên bản

- {{DOMxRef("TextDecoderStream.encoding")}} {{ReadOnlyInline}}
  - : Mã hóa được sử dụng.
- {{DOMxRef("TextDecoderStream.fatal")}} {{ReadOnlyInline}}
  - : Giá trị {{jsxref("boolean")}} cho biết chế độ lỗi có phải là fatal hay không.
- {{DOMxRef("TextDecoderStream.ignoreBOM")}} {{ReadOnlyInline}}
  - : Giá trị {{jsxref("boolean")}} cho biết byte order mark có bị bỏ qua hay không.
- {{DOMxRef("TextDecoderStream.readable")}} {{ReadOnlyInline}}
  - : Trả về phiên bản {{domxref("ReadableStream")}} được kiểm soát bởi đối tượng này.
- {{DOMxRef("TextDecoderStream.writable")}} {{ReadOnlyInline}}
  - : Trả về phiên bản {{domxref("WritableStream")}} được kiểm soát bởi đối tượng này.

## Ví dụ

[Ví dụ về streaming dữ liệu có cấu trúc và HTML](https://streams.spec.whatwg.org/demos/)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TextEncoderStream")}}
- {{domxref("TextDecoder")}}
- {{domxref("TransformStream")}}
- [Streams API Concepts](/en-US/docs/Web/API/Streams_API/Concepts)
- [Experimenting with the Streams API](https://deanhume.com/experimenting-with-the-streams-api/)
- [Streaming requests with the fetch API](https://developer.chrome.com/docs/capabilities/web-apis/fetch-streaming-requests), developer.chrome.com (2020)
