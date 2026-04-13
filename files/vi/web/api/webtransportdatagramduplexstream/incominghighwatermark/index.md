---
title: "WebTransportDatagramDuplexStream: incomingHighWaterMark property"
short-title: incomingHighWaterMark
slug: Web/API/WebTransportDatagramDuplexStream/incomingHighWaterMark
page-type: web-api-instance-property
browser-compat: api.WebTransportDatagramDuplexStream.incomingHighWaterMark
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính **`incomingHighWaterMark`** của giao diện {{domxref("WebTransportDatagramDuplexStream")}} lấy hoặc đặt mức nước cao cho các chunk dữ liệu đến, đây là kích thước tối đa, tính bằng số chunk, mà hàng đợi nội bộ của {{domxref("ReadableStream")}} đến có thể đạt đến trước khi được coi là đầy. Xem [Hàng đợi nội bộ và chiến lược xếp hàng](/en-US/docs/Web/API/Streams_API/Concepts#internal_queues_and_queuing_strategies) để biết thêm thông tin.

## Giá trị

Một số.

## Ví dụ

```js
const url = "https://example.com:4999/wt";

async function initTransport(url) {
  // Initialize transport connection
  const transport = new WebTransport(url);

  // The connection can be used once ready fulfills
  await transport.ready;

  const datagrams = transport.datagrams;

  // set incomingHighWaterMark
  datagrams.incomingHighWaterMark = 20000;

  // get incomingHighWaterMark
  console.log(datagrams.incomingHighWaterMark);
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
