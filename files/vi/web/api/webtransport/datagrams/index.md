---
title: "WebTransport: thuộc tính datagrams"
short-title: datagrams
slug: Web/API/WebTransport/datagrams
page-type: web-api-instance-property
browser-compat: api.WebTransport.datagrams
---

{{APIRef("WebTransport API")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`datagrams`** của giao diện {{domxref("WebTransport")}} trả về một thể hiện {{domxref("WebTransportDatagramDuplexStream")}} có thể dùng để gửi và nhận datagram, tức truyền dữ liệu không đáng tin cậy.

"Không đáng tin cậy" có nghĩa là việc truyền dữ liệu không được bảo đảm, và dữ liệu cũng không được bảo đảm sẽ đến theo một thứ tự cụ thể. Điều này phù hợp trong một số tình huống và cung cấp tốc độ phân phối rất nhanh. Ví dụ, bạn có thể muốn truyền các bản cập nhật trạng thái trò chơi thường xuyên, trong đó mỗi thông điệp mới thay thế thông điệp đến trước đó, và thứ tự không quan trọng.

## Giá trị

Một đối tượng {{domxref("WebTransportDatagramDuplexStream")}}.

## Ví dụ

### Ghi một datagram gửi đi

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.writable")}} trả về một đối tượng {{domxref("WritableStream")}} mà bạn có thể ghi dữ liệu vào bằng writer để truyền tới máy chủ:

```js
const writer = transport.datagrams.writable.getWriter();
const data1 = new Uint8Array([65, 66, 67]);
const data2 = new Uint8Array([68, 69, 70]);
writer.write(data1);
writer.write(data2);
```

### Đọc một datagram đến

Thuộc tính {{domxref("WebTransportDatagramDuplexStream.readable")}} trả về một đối tượng {{domxref("ReadableStream")}} mà bạn có thể dùng để nhận dữ liệu từ máy chủ:

```js
async function readData() {
  const reader = transport.datagrams.readable.getReader();
  while (true) {
    const { value, done } = await reader.read();
    if (done) {
      break;
    }
    // value là một Uint8Array.
    console.log(value);
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
