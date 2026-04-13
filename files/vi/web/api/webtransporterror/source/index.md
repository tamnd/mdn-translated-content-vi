---
title: "WebTransportError: thuộc tính source"
short-title: source
slug: Web/API/WebTransportError/source
page-type: web-api-instance-property
browser-compat: api.WebTransportError.source
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("WebTransportError")}} trả về giá trị liệt kê cho biết nguồn gốc của lỗi.

## Giá trị

Một giá trị liệt kê; có thể là `stream` hoặc `session`.

## Ví dụ

```js
const url = "not-a-url";

async function initTransport(url) {
  try {
    // Initialize transport connection
    const transport = new WebTransport(url);

    // The connection can be used once ready fulfills
    await transport.ready;

    // …
  } catch (error) {
    const msg = `Transport initialization failed.
                 Reason: ${error.message}.
                 Source: ${error.source}.
                 Error code: ${error.streamErrorCode}.`;
    console.log(msg);
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
