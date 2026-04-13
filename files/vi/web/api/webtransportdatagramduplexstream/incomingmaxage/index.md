---
title: "WebTransportDatagramDuplexStream: incomingMaxAge property"
short-title: incomingMaxAge
slug: Web/API/WebTransportDatagramDuplexStream/incomingMaxAge
page-type: web-api-instance-property
browser-compat: api.WebTransportDatagramDuplexStream.incomingMaxAge
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính **`incomingMaxAge`** của giao diện {{domxref("WebTransportDatagramDuplexStream")}} lấy hoặc đặt thời gian tối đa cho các datagram đến, tính bằng miligiây.

## Giá trị

Một số, hoặc `null` nếu chưa đặt thời gian tối đa.

## Ví dụ

```js
const url = "https://example.com:4999/wt";

async function initTransport(url) {
  // Initialize transport connection
  const transport = new WebTransport(url);

  // The connection can be used once ready fulfills
  await transport.ready;

  const datagrams = transport.datagrams;

  // set incomingMaxAge
  datagrams.incomingMaxAge = 2000;

  // get incomingMaxAge
  console.log(datagrams.incomingMaxAge);
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
