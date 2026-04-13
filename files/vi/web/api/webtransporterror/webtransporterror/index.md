---
title: "WebTransportError: hàm khởi tạo WebTransportError()"
short-title: WebTransportError()
slug: Web/API/WebTransportError/WebTransportError
page-type: web-api-constructor
browser-compat: api.WebTransportError.WebTransportError
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Hàm khởi tạo **`WebTransportError()`** tạo phiên bản đối tượng {{domxref("WebTransportError")}} mới.

## Cú pháp

```js-nolint
new WebTransportError(init)
```

### Tham số

- `init` {{optional_inline}}
  - : Một đối tượng chứa các thuộc tính sau:
    - `message`
      - : Một chuỗi mô tả lỗi đã xảy ra.
    - `streamErrorCode`
      - : Một số trong khoảng 0-255 cho biết mã lỗi giao thức ứng dụng cho lỗi này.

## Ví dụ

Nhà phát triển thường không sử dụng hàm khởi tạo này theo cách thủ công. Đối tượng `WebTransportError` mới được tạo khi xảy ra lỗi liên quan đến WebTransport, ví dụ như lỗi máy chủ hoặc sự cố kết nối mạng.

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
