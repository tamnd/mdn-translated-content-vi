---
title: WebTransportError
slug: Web/API/WebTransportError
page-type: web-api-interface
browser-compat: api.WebTransportError
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Giao diện **`WebTransportError`** của {{domxref("WebTransport API", "WebTransport API", "", "nocode")}} đại diện cho lỗi liên quan đến API, có thể phát sinh từ lỗi máy chủ, sự cố kết nối mạng, hoặc hoạt động hủy bỏ do khách hàng khởi tạo (ví dụ: phát sinh từ lệnh gọi {{domxref("WritableStream.abort()")}}).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("WebTransportError.WebTransportError", "WebTransportError()")}}
  - : Tạo phiên bản đối tượng `WebTransportError` mới.

## Thuộc tính phiên bản

_Kế thừa các thuộc tính từ cha, {{DOMxRef("DOMException")}}._

- {{domxref("WebTransportError.source", "source")}} {{ReadOnlyInline}}
  - : Trả về giá trị liệt kê cho biết nguồn gốc của lỗi, có thể là `stream` hoặc `session`.
- {{domxref("WebTransportError.streamErrorCode", "streamErrorCode")}} {{ReadOnlyInline}}
  - : Trả về một số trong khoảng 0-255 cho biết mã lỗi giao thức ứng dụng cho lỗi này, hoặc `null` nếu không có.

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
