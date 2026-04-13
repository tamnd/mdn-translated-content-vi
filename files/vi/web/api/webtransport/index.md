---
title: WebTransport
slug: Web/API/WebTransport
page-type: web-api-interface
browser-compat: api.WebTransport
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Giao diện **`WebTransport`** của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} cung cấp chức năng cho phép một user agent kết nối tới máy chủ HTTP/3, khởi tạo truyền dữ liệu đáng tin cậy và không đáng tin cậy theo một hoặc cả hai hướng, và đóng kết nối khi không còn cần nữa.

{{InheritanceDiagram}}

## Constructor

- {{domxref("WebTransport.WebTransport", "WebTransport()")}}
  - : Tạo một thể hiện đối tượng `WebTransport` mới.

## Thuộc tính thể hiện

- {{domxref("WebTransport.closed", "closed")}} {{ReadOnlyInline}}
  - : Trả về một promise được giải quyết khi transport được đóng.
- {{domxref("WebTransport.datagrams", "datagrams")}} {{ReadOnlyInline}}
  - : Trả về một thể hiện {{domxref("WebTransportDatagramDuplexStream")}} có thể dùng để gửi và nhận datagram.
- {{domxref("WebTransport.congestionControl", "congestionControl")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết mức ưu tiên của ứng dụng đối với thông lượng cao hoặc độ trễ thấp khi gửi dữ liệu.
- {{domxref("WebTransport.incomingBidirectionalStreams", "incomingBidirectionalStreams")}} {{ReadOnlyInline}}
  - : Đại diện cho một hoặc nhiều luồng hai chiều do máy chủ mở. Trả về một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportBidirectionalStream")}}. Mỗi đối tượng có thể được dùng để đọc dữ liệu từ máy chủ và ghi dữ liệu trở lại máy chủ.
- {{domxref("WebTransport.incomingUnidirectionalStreams", "incomingUnidirectionalStreams")}} {{ReadOnlyInline}}
  - : Đại diện cho một hoặc nhiều luồng một chiều do máy chủ mở. Trả về một {{domxref("ReadableStream")}} của các đối tượng {{domxref("WebTransportReceiveStream")}}. Mỗi đối tượng có thể được dùng để đọc dữ liệu từ máy chủ.
- {{domxref("WebTransport.ready", "ready")}} {{ReadOnlyInline}}
  - : Trả về một promise được giải quyết khi transport sẵn sàng để dùng.
- {{domxref("WebTransport.reliability", "reliability")}} {{ReadOnlyInline}}
  - : Trả về một chuỗi cho biết kết nối chỉ hỗ trợ transport đáng tin cậy hay còn hỗ trợ cả transport không đáng tin cậy, như UDP.

## Phương thức thể hiện

- {{domxref("WebTransport.close", "close()")}}
  - : Đóng một phiên WebTransport đang diễn ra.
- {{domxref("WebTransport.createBidirectionalStream", "createBidirectionalStream()")}}
  - : Mở bất đồng bộ một luồng hai chiều ({{domxref("WebTransportBidirectionalStream")}}) có thể dùng để đọc từ và ghi tới máy chủ.
- {{domxref("WebTransport.createUnidirectionalStream", "createUnidirectionalStream()")}}
  - : Mở bất đồng bộ một luồng một chiều ({{domxref("WritableStream")}}) có thể dùng để ghi tới máy chủ.
- {{domxref("WebTransport.getStats", "getStats()")}}
  - : Trả về bất đồng bộ một {{jsxref("Promise")}} được giải quyết với một object chứa thống kê kết nối HTTP/3.

## Ví dụ

Đoạn mã ví dụ dưới đây cho thấy cách kết nối tới máy chủ HTTP/3 bằng cách truyền URL của nó vào constructor {{domxref("WebTransport.WebTransport", "WebTransport()")}}.
Lưu ý rằng scheme phải là HTTPS và số cổng phải được chỉ định rõ ràng.
Khi promise {{domxref("WebTransport.ready")}} được giải quyết, bạn có thể bắt đầu dùng kết nối.

```js
async function initTransport(url) {
  // Khởi tạo kết nối transport
  const transport = new WebTransport(url);

  // Kết nối có thể dùng được khi ready được giải quyết
  await transport.ready;
  return transport;
}
```

Bạn có thể phản ứng khi kết nối đóng bằng cách chờ promise {{domxref("WebTransport.closed")}} được giải quyết.
Các lỗi do thao tác `WebTransport` trả về có kiểu {{domxref("WebTransportError")}}, và chứa thêm dữ liệu ngoài tập {{domxref("DOMException")}} tiêu chuẩn.

Phương thức `closeTransport()` bên dưới cho thấy một cách triển khai có thể dùng.
Trong một khối `try...catch`, nó dùng `await` để chờ promise `closed` được giải quyết hoặc bị từ chối, rồi báo cáo xem kết nối đã đóng một cách chủ ý hay do lỗi.

```js
async function closeTransport(transport) {
  // Phản hồi khi kết nối đóng
  try {
    await transport.closed;
    console.log(`Kết nối HTTP/3 tới ${url} đã đóng êm thấm.`);
  } catch (error) {
    console.error(`Kết nối HTTP/3 tới ${url} đã đóng do ${error}.`);
  }
}
```

Ta có thể gọi các hàm bất đồng bộ ở trên trong chính một hàm bất đồng bộ khác, như minh họa dưới đây.

```js
// Dùng transport
async function useTransport(url) {
  const transport = await initTransport(url);

  // Dùng đối tượng transport để gửi và nhận dữ liệu
  // …

  // Khi xong, đóng transport
  await closeTransport(transport);
}

const url = "https://example.com:4999/wt";
useTransport(url);
```

Để xem mã ví dụ khác, hãy xem các trang thuộc tính và phương thức riêng lẻ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
