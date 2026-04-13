---
title: "WebTransportDatagramDuplexStream: outgoingMaxAge property"
short-title: outgoingMaxAge
slug: Web/API/WebTransportDatagramDuplexStream/outgoingMaxAge
page-type: web-api-instance-property
browser-compat: api.WebTransportDatagramDuplexStream.outgoingMaxAge
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính **`outgoingMaxAge`** của giao diện {{domxref("WebTransportDatagramDuplexStream")}} lấy hoặc đặt thời gian tối đa cho các datagram đi, tính bằng miligiây.

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

  // set outgoingMaxAge
  datagrams.outgoingMaxAge = 2000;

  // get outgoingMaxAge
  console.log(datagrams.outgoingMaxAge);
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
