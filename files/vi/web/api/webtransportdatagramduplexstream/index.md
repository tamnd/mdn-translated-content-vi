---
title: WebTransportDatagramDuplexStream
slug: Web/API/WebTransportDatagramDuplexStream
page-type: web-api-interface
browser-compat: api.WebTransportDatagramDuplexStream
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Giao diện **`WebTransportDatagramDuplexStream`** của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} đại diện cho một luồng song công có thể được sử dụng để truyền tải không đáng tin cậy các datagram giữa client và server. Cung cấp quyền truy cập vào {{domxref("ReadableStream")}} để đọc các datagram đến, {{domxref("WritableStream")}} để ghi các datagram đi, cùng với nhiều cài đặt và thống kê liên quan đến luồng.

Giao diện này được truy cập thông qua thuộc tính {{domxref("WebTransport.datagrams")}}.

"Không đáng tin cậy" có nghĩa là việc truyền dữ liệu không được đảm bảo, và cũng không đảm bảo thứ tự đến. Điều này phù hợp trong một số tình huống và cung cấp khả năng truyền rất nhanh. Ví dụ, bạn có thể muốn truyền các bản cập nhật trạng thái trò chơi thường xuyên, nơi mỗi thông điệp thay thế thông điệp trước đó và thứ tự không quan trọng.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("WebTransportDatagramDuplexStream.incomingHighWaterMark", "incomingHighWaterMark")}}
  - : Lấy hoặc đặt mức nước cao cho các chunk dữ liệu đến, đây là kích thước tối đa, tính bằng số chunk, mà hàng đợi nội bộ của {{domxref("ReadableStream")}} đến có thể đạt đến trước khi được coi là đầy. Xem [Hàng đợi nội bộ và chiến lược xếp hàng](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies) để biết thêm thông tin.
- {{domxref("WebTransportDatagramDuplexStream.incomingMaxAge", "incomingMaxAge")}}
  - : Lấy hoặc đặt thời gian tối đa cho các datagram đến, tính bằng miligiây. Trả về `null` nếu chưa đặt thời gian tối đa.
- {{domxref("WebTransportDatagramDuplexStream.maxDatagramSize", "maxDatagramSize")}} {{ReadOnlyInline}}
  - : Trả về kích thước tối đa cho phép của các datagram đi, tính bằng byte, có thể được ghi vào {{domxref("WebTransportDatagramDuplexStream.writable", "writable")}}.
- {{domxref("WebTransportDatagramDuplexStream.outgoingHighWaterMark", "outgoingHighWaterMark")}}
  - : Lấy hoặc đặt mức nước cao cho các chunk dữ liệu đi, đây là kích thước tối đa, tính bằng số chunk, mà hàng đợi nội bộ của {{domxref("WritableStream")}} đi có thể đạt đến trước khi được coi là đầy. Xem [Hàng đợi nội bộ và chiến lược xếp hàng](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies) để biết thêm thông tin.
- {{domxref("WebTransportDatagramDuplexStream.outgoingMaxAge", "outgoingMaxAge")}}
  - : Lấy hoặc đặt thời gian tối đa cho các datagram đi, tính bằng miligiây. Trả về `null` nếu chưa đặt thời gian tối đa.
- {{domxref("WebTransportDatagramDuplexStream.readable", "readable")}} {{ReadOnlyInline}}
  - : Trả về một đối tượng {{domxref("ReadableStream")}} có thể được sử dụng để đọc các datagram đến từ luồng.
- {{domxref("WebTransportDatagramDuplexStream.writable", "writable")}} {{ReadOnlyInline}} {{deprecated_inline}} {{non-standard_inline}}
  - : Trả về một đối tượng {{domxref("WritableStream")}} có thể được sử dụng để ghi các datagram đi vào luồng.

## Ví dụ

### Ghi các datagram đi

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.writable", "writable")}} trả về một đối tượng {{domxref("WritableStream")}} mà bạn có thể ghi dữ liệu vào bằng writer, để truyền đến server:

```js
const writer = transport.datagrams.writable.getWriter();
const data1 = new Uint8Array([65, 66, 67]);
const data2 = new Uint8Array([68, 69, 70]);
writer.write(data1);
writer.write(data2);
```

### Đọc các datagram đến

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.readable", "readable")}} trả về một đối tượng {{domxref("ReadableStream")}} mà bạn có thể sử dụng để nhận dữ liệu từ server:

```js
async function readData() {
  const reader = transport.datagrams.readable.getReader();
  while (true) {
    const { value, done } = await reader.read();
    if (done) {
      break;
    }
    // value is a Uint8Array.
    console.log(value);
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
