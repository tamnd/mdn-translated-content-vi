---
title: WebTransport API
slug: Web/API/WebTransport_API
page-type: web-api-overview
browser-compat: api.WebTransport
---

{{DefaultAPISidebar("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

**WebTransport API** cung cấp bản cập nhật hiện đại cho {{domxref("WebSockets API", "WebSockets", "", "nocode")}}, truyền dữ liệu giữa client và server bằng [HTTP/3 Transport](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/). WebTransport cung cấp hỗ trợ cho nhiều luồng, luồng một chiều và truyền không theo thứ tự. Nó cho phép truyền đáng tin cậy thông qua {{domxref("Streams API", "streams", "", "nocode")}} và truyền không đáng tin cậy thông qua datagram giống UDP.

## Khái niệm và cách sử dụng

[HTTP/3](https://en.wikipedia.org/wiki/HTTP/3) đã được phát triển từ năm 2018. Nó dựa trên giao thức QUIC của Google (bản thân nó dựa trên UDP) và khắc phục một số vấn đề xung quanh giao thức TCP cổ điển mà HTTP và WebSockets dựa trên.

Các vấn đề này bao gồm:

- **{{glossary("head of line blocking", "Chặn đầu hàng đợi")}}**
  - : HTTP/2 cho phép ghép kênh, vì vậy một kết nối có thể truyền nhiều tài nguyên đồng thời. Tuy nhiên, nếu một tài nguyên thất bại, tất cả các tài nguyên khác trên kết nối đó bị giữ lại cho đến khi các gói bị mất được truyền lại. Với QUIC, chỉ tài nguyên bị lỗi mới bị ảnh hưởng.
- **Hiệu suất nhanh hơn**
  - : QUIC hiệu quả hơn TCP theo nhiều cách. QUIC có thể xử lý các tính năng bảo mật bởi chính nó, thay vì chuyển trách nhiệm cho các giao thức khác như TLS, nghĩa là ít chuyến đi khứ hồi hơn. Và các luồng cung cấp hiệu quả truyền tốt hơn so với cơ chế gói cũ. Điều đó có thể tạo ra sự khác biệt đáng kể, đặc biệt trên các mạng có độ trễ cao.
- **Chuyển đổi mạng tốt hơn**
  - : QUIC sử dụng ID kết nối duy nhất để xử lý nguồn và đích của mỗi yêu cầu, đảm bảo rằng các gói được giao chính xác. ID này có thể tồn tại giữa các mạng khác nhau, nghĩa là, ví dụ, một lần tải xuống có thể tiếp tục mà không bị gián đoạn nếu bạn chuyển từ Wi-Fi sang mạng di động. HTTP/2, mặt khác, sử dụng địa chỉ IP làm định danh, vì vậy chuyển đổi mạng có thể gặp vấn đề.
- **Truyền không đáng tin cậy**
  - : HTTP/3 hỗ trợ truyền dữ liệu không đáng tin cậy qua datagram.

WebTransport API cung cấp quyền truy cập cấp thấp vào giao tiếp hai chiều qua HTTP/3, tận dụng các lợi ích trên và hỗ trợ cả truyền dữ liệu đáng tin cậy và không đáng tin cậy.

### Kết nối ban đầu

Để mở kết nối đến máy chủ HTTP/3, bạn truyền URL của nó vào constructor {{domxref("WebTransport.WebTransport", "WebTransport()")}}. Lưu ý rằng scheme cần là HTTPS và số cổng cần được chỉ định rõ ràng. Khi promise {{domxref("WebTransport.ready")}} hoàn thành, bạn có thể bắt đầu sử dụng kết nối.

Cũng lưu ý rằng bạn có thể phản hồi khi kết nối đóng bằng cách chờ promise {{domxref("WebTransport.closed")}} hoàn thành. Các lỗi được trả về bởi các hoạt động WebTransport thuộc loại {{domxref("WebTransportError")}} và chứa dữ liệu bổ sung trên {{domxref("DOMException")}} tiêu chuẩn.

```js
const url = "https://example.com:4999/wt";

async function initTransport(url) {
  // Initialize transport connection
  const transport = new WebTransport(url);

  // The connection can be used once ready fulfills
  await transport.ready;

  // …
}

// …

async function closeTransport(transport) {
  // Respond to connection closing
  try {
    await transport.closed;
    console.log(`The HTTP/3 connection to ${url} closed gracefully.`);
  } catch (error) {
    console.error(`The HTTP/3 connection to ${url} closed due to ${error}.`);
  }
}
```

### Truyền không đáng tin cậy qua datagram

"Không đáng tin cậy" có nghĩa là việc truyền dữ liệu không được đảm bảo, cũng không đến theo thứ tự cụ thể. Điều này ổn trong một số tình huống và cung cấp khả năng giao hàng rất nhanh. Ví dụ, bạn có thể muốn truyền các bản cập nhật trạng thái trò chơi thường xuyên mà mỗi tin nhắn thay thế cái trước đó đến, và thứ tự không quan trọng.

Truyền dữ liệu không đáng tin cậy được xử lý thông qua thuộc tính {{domxref("WebTransport.datagrams")}}, trả về một đối tượng {{domxref("WebTransportDatagramDuplexStream")}} chứa mọi thứ bạn cần để gửi datagram đến máy chủ và nhận chúng trở lại.

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.writable")}} trả về một đối tượng {{domxref("WritableStream")}} mà bạn có thể ghi dữ liệu vào bằng cách sử dụng writer, để truyền đến máy chủ:

```js
const writer = transport.datagrams.writable.getWriter();
const data1 = new Uint8Array([65, 66, 67]);
const data2 = new Uint8Array([68, 69, 70]);
writer.write(data1);
writer.write(data2);
```

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.readable")}} trả về một đối tượng {{domxref("ReadableStream")}} mà bạn có thể sử dụng để nhận dữ liệu từ máy chủ:

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

### Truyền đáng tin cậy qua luồng

"Đáng tin cậy" có nghĩa là việc truyền và thứ tự dữ liệu được đảm bảo. Điều đó cung cấp khả năng giao hàng chậm hơn (mặc dù nhanh hơn so với WebSockets) và cần thiết trong các tình huống mà độ tin cậy và thứ tự quan trọng (chẳng hạn như các ứng dụng chat).

### Truyền một chiều

Để mở luồng một chiều từ user agent, bạn sử dụng phương thức {{domxref("WebTransport.createUnidirectionalStream()")}} để lấy tham chiếu đến {{domxref("WritableStream")}}. Từ đó bạn có thể [lấy writer](/en-US/docs/Web/API/WritableStream/getWriter) để cho phép dữ liệu được ghi vào luồng và gửi đến máy chủ.

```js
async function writeData() {
  const stream = await transport.createUnidirectionalStream();
  const writer = stream.writable.getWriter();
  const data1 = new Uint8Array([65, 66, 67]);
  const data2 = new Uint8Array([68, 69, 70]);
  writer.write(data1);
  writer.write(data2);

  try {
    await writer.close();
    console.log("All data has been sent.");
  } catch (error) {
    console.error(`An error occurred: ${error}`);
  }
}
```

Cũng lưu ý việc sử dụng phương thức {{domxref("WritableStreamDefaultWriter.close()")}} để đóng kết nối HTTP/3 liên quan sau khi tất cả dữ liệu đã được gửi.

Nếu máy chủ mở luồng một chiều để truyền dữ liệu đến client, điều này có thể được truy cập trên client thông qua thuộc tính {{domxref("WebTransport.incomingUnidirectionalStreams")}}, trả về {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportReceiveStream")}}. Chúng có thể được sử dụng để đọc các thể hiện {{jsxref("Uint8Array")}} được gửi bởi máy chủ.

```js
async function readData(receiveStream) {
  const reader = receiveStream.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value is a Uint8Array
    console.log(value);
  }
}
```

Tiếp theo, gọi {{domxref("WebTransport.incomingUnidirectionalStreams")}} và lấy tham chiếu đến reader có sẵn trên `ReadableStream` mà nó trả về, sau đó sử dụng reader để đọc dữ liệu từ máy chủ. Mỗi chunk là một `WebTransportReceiveStream`:

```js
async function receiveUnidirectional() {
  const uds = transport.incomingUnidirectionalStreams;
  const reader = uds.getReader();
  while (true) {
    const { done, value } = await reader.read();
    if (done) {
      break;
    }
    // value is an instance of WebTransportReceiveStream
    await readData(value);
  }
}
```

#### Truyền hai chiều

Để mở luồng hai chiều từ user agent, bạn sử dụng phương thức {{domxref("WebTransport.createBidirectionalStream()")}} để lấy tham chiếu đến {{domxref("WebTransportBidirectionalStream")}}.
Điều này chứa các thuộc tính `readable` và `writable` trả về tham chiếu đến các thể hiện `WebTransportReceiveStream` và `WebTransportSendStream` có thể được sử dụng để đọc từ và ghi vào máy chủ.

> [!NOTE]
> `WebTransportBidirectionalStream` tương tự như {{domxref("WebTransportDatagramDuplexStream")}}, ngoại trừ trong giao diện đó các thuộc tính `readable` và `writable` là `ReadableStream` và `WritableStream` tương ứng.

```js
async function setUpBidirectional() {
  const stream = await transport.createBidirectionalStream();
  // stream is a WebTransportBidirectionalStream
  // stream.readable is a WebTransportReceiveStream
  const readable = stream.readable;
  // stream.writable is a WebTransportSendStream
  const writable = stream.writable;

  // …
}
```

## Các giao diện

- {{domxref("WebTransport")}}
  - : Cung cấp chức năng để cho phép user agent kết nối với máy chủ HTTP/3, khởi tạo truyền đáng tin cậy và không đáng tin cậy theo một hoặc cả hai chiều, và đóng kết nối khi không còn cần thiết.
- {{domxref("WebTransportBidirectionalStream")}}
  - : Đại diện cho luồng hai chiều được tạo bởi máy chủ hoặc client có thể được sử dụng để truyền đáng tin cậy. Cung cấp quyền truy cập vào {{domxref("ReadableStream")}} để đọc dữ liệu đến và {{domxref("WritableStream")}} để ghi dữ liệu đi.
- {{domxref("WebTransportDatagramDuplexStream")}}
  - : Đại diện cho luồng song song có thể được sử dụng để truyền không đáng tin cậy của datagram giữa client và máy chủ. Cung cấp quyền truy cập vào {{domxref("ReadableStream")}} để đọc datagram đến, {{domxref("WritableStream")}} để ghi datagram đi, và các cài đặt và số liệu thống kê khác nhau liên quan đến luồng.
- {{domxref("WebTransportError")}}
  - : Đại diện cho lỗi liên quan đến WebTransport API, có thể phát sinh từ lỗi máy chủ, vấn đề kết nối mạng hoặc các hoạt động hủy do client khởi tạo.
- {{domxref("WebTransportReceiveStream")}}
  - : Cung cấp các tính năng streaming cho luồng WebTransport một chiều hoặc hai chiều đến.
- {{domxref("WebTransportSendStream")}}
  - : Cung cấp các tính năng streaming cho luồng WebTransport một chiều hoặc hai chiều đi.

## Ví dụ

Để biết ví dụ đầy đủ, xem:

- [WebTransport over HTTP/3 client](https://webtransport.day/)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
