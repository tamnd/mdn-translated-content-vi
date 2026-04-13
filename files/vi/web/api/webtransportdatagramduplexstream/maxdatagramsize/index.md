---
title: "WebTransportDatagramDuplexStream: maxDatagramSize property"
short-title: maxDatagramSize
slug: Web/API/WebTransportDatagramDuplexStream/maxDatagramSize
page-type: web-api-instance-property
browser-compat: api.WebTransportDatagramDuplexStream.maxDatagramSize
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`maxDatagramSize`** của giao diện {{domxref("WebTransportDatagramDuplexStream")}} trả về kích thước tối đa cho phép của các datagram đi, tính bằng byte, có thể được ghi vào {{domxref("WebTransportDatagramDuplexStream.writable", "writable")}}.

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

  // get maxDatagramSize
  console.log(datagrams.maxDatagramSize);
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
