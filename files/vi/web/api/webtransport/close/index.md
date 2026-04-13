---
title: "WebTransport: phương thức close()"
short-title: close()
slug: Web/API/WebTransport/close
page-type: web-api-instance-method
browser-compat: api.WebTransport.close
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Phương thức **`close()`** của giao diện {{domxref("WebTransport")}} đóng một phiên WebTransport đang diễn ra.

## Cú pháp

```js-nolint
close(info)
```

### Tham số

- `info` {{optional_inline}}
  - : Một object chứa các thuộc tính sau:
    - `closeCode`
      - : Một số biểu thị mã lỗi cho lỗi.
    - `reason`
      - : Một chuỗi biểu thị lý do đóng `WebTransport`.

### Giá trị trả về

`undefined`.

### Ngoại lệ

- {{domxref("WebTransportError")}}
  - : Được ném ra nếu `close()` được gọi trong khi WebTransport đang trong quá trình kết nối.

## Ví dụ

```js
const url = "https://example.com:4999/wt";
// Khởi tạo kết nối transport
const transport = new WebTransport(url);

// …

transport.close({
  closeCode: 17,
  reason: "CloseButtonPressed",
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng WebTransport](https://developer.chrome.com/docs/capabilities/web-apis/webtransport)
- {{domxref("WebSockets API", "WebSockets API", "", "nocode")}}
- {{domxref("Streams API", "Streams API", "", "nocode")}}
- [WebTransport over HTTP/3](https://datatracker.ietf.org/doc/html/draft-ietf-webtrans-http3/)
