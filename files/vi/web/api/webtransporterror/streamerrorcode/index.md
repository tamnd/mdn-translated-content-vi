---
title: "WebTransportError: thuộc tính streamErrorCode"
short-title: streamErrorCode
slug: Web/API/WebTransportError/streamErrorCode
page-type: web-api-instance-property
browser-compat: api.WebTransportError.streamErrorCode
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`streamErrorCode`** của giao diện {{domxref("WebTransportError")}} trả về một số trong khoảng 0-255 cho biết mã lỗi giao thức ứng dụng cho lỗi này, hoặc `null` nếu không có.

## Giá trị

Một số, hoặc `null`.

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
