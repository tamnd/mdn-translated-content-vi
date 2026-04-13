---
title: "WebTransportSendStream: thuộc tính sendOrder"
short-title: sendOrder
slug: Web/API/WebTransportSendStream/sendOrder
page-type: web-api-instance-property
browser-compat: api.WebTransportSendStream.sendOrder
---

{{APIRef("WebTransport API")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính **`sendOrder`** của giao diện {{domxref("WebTransportSendStream")}} cho biết độ ưu tiên gửi của luồng này so với các luồng khác mà giá trị đã được đặt.

Các byte trong hàng chờ được gửi trước cho các luồng có giá trị cao hơn. Nếu không được đặt, thứ tự gửi phụ thuộc vào triển khai.

## Giá trị

Một số cho biết độ ưu tiên tương đối của luồng này khi gửi byte.

## Ví dụ

Ví dụ dưới đây cho thấy cách bạn có thể đặt `sendOrder` ban đầu khi gọi {{domxref("WebTransport.createUnidirectionalStream()")}} để tạo luồng gửi, đọc giá trị từ luồng, sau đó thay đổi thứ tự. Sau khi thay đổi thứ tự, độ ưu tiên của luồng này sẽ tăng lên, trở nên cao hơn bất kỳ luồng nào có độ ưu tiên nhỏ hơn "596996858".

```js
async function writeData() {
  const stream = await transport.createUnidirectionalStream({
    sendOrder: "400", // Set initial stream order
  });

  console.log(`Stream order: ${stream.sendOrder}`); // Stream order: 400

  // write data ...

  // Change the stream order
  stream.sendOrder = 596996858;
  console.log(`Stream order: ${stream.sendOrder}`); // Stream order: 596996858

  // write more data ...
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
