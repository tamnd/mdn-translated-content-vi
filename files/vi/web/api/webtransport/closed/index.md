---
title: "WebTransport: thuộc tính closed"
short-title: closed
slug: Web/API/WebTransport/closed
page-type: web-api-instance-property
browser-compat: api.WebTransport.closed
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`closed`** của giao diện {{domxref("WebTransport")}} trả về một promise được giải quyết khi transport được đóng.

Promise này được tạo khi đối tượng `WebTransport` được tạo và được giải quyết khi transport đóng theo bất kỳ cách nào, chẳng hạn bằng cách gọi phương thức {{domxref("WebTransport.close", "close()")}}, khi kết nối thất bại, hoặc khi kết nối bị máy chủ đóng. Việc truy cập hoặc chờ promise này không kích hoạt hành động nào; nó chỉ cho phép thực hiện hành động khi transport đóng, tương tự như lắng nghe một sự kiện.

## Giá trị

Một {{jsxref("Promise")}} được giải quyết thành một object chứa các thuộc tính sau:

- `closeCode`
  - : Một số biểu thị mã lỗi cho lỗi.
- `reason`
  - : Một chuỗi biểu thị lý do đóng `WebTransport`.

Hoặc, trong trường hợp đóng bất ngờ, chẳng hạn lỗi mạng, promise bị từ chối với một lỗi.

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
