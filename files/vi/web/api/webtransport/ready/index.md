---
title: "WebTransport: thuộc tính ready"
short-title: ready
slug: Web/API/WebTransport/ready
page-type: web-api-instance-property
browser-compat: api.WebTransport.ready
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ready`** của giao diện {{domxref("WebTransport")}} trả về một promise được giải quyết khi transport sẵn sàng để dùng.

Promise này được tạo khi đối tượng `WebTransport` được tạo và được giải quyết khi kết nối được thiết lập. Việc truy cập hoặc chờ promise này không kích hoạt hành động nào; nó chỉ cho phép thực hiện hành động khi transport sẵn sàng, tương tự như lắng nghe một sự kiện.

## Giá trị

Một {{jsxref("Promise")}} được giải quyết thành `undefined`.

## Ví dụ

```js
const url = "https://example.com:4999/wt";

async function initTransport(url) {
  // Khởi tạo kết nối transport
  const transport = new WebTransport(url);

  // Kết nối có thể dùng được khi ready được giải quyết
  await transport.ready;

  // …
}

// …

async function closeTransport(transport) {
  // Phản hồi khi kết nối đóng
  try {
    await transport.closed;
    console.log(`Kết nối HTTP/3 tới ${url} đã đóng êm thấm.`);
  } catch (error) {
    console.error(`Kết nối HTTP/3 tới ${url} đã đóng do ${error}.`);
  }
}
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
