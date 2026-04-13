---
title: "WritableStreamDefaultWriter: ready property"
short-title: ready
slug: Web/API/WritableStreamDefaultWriter/ready
page-type: web-api-instance-property
browser-compat: api.WritableStreamDefaultWriter.ready
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`ready`** là thuộc tính chỉ đọc của giao diện
{{domxref("WritableStreamDefaultWriter")}} trả về một {{jsxref("Promise")}}
được giải quyết khi kích thước mong muốn của hàng đợi nội bộ của luồng chuyển từ
không dương sang dương, báo hiệu rằng nó không còn áp dụng áp lực ngược nữa.

## Giá trị

Một {{jsxref("Promise")}}.

## Ví dụ

Ví dụ sau cho thấy hai cách dùng của thuộc tính `ready`. Cách đầu tiên dùng
`ready` để bảo đảm rằng `WritableStream` đã ghi xong và
do đó có thể nhận dữ liệu trước khi gửi một khối nhị phân. Cách thứ hai cũng kiểm tra xem
`WritableStream` đã ghi xong hay chưa, nhưng lần này là vì việc ghi
phải hoàn tất trước khi trình ghi có thể được đóng.

```js
function sendMessage(message, writableStream) {
  // defaultWriter is of type WritableStreamDefaultWriter
  const defaultWriter = writableStream.getWriter();
  const encoder = new TextEncoder();
  const encoded = encoder.encode(message);
  encoded.forEach((chunk) => {
    // Make sure the stream and its writer are able to
    //   receive data.
    defaultWriter.ready
      .then(() => defaultWriter.write(chunk))
      .then(() => {
        console.log("Chunk written to sink.");
      })
      .catch((err) => {
        console.error(`Chunk error: ${err}`);
      });
    // Call ready again to ensure that all chunks are written
    //   before closing the writer.
    defaultWriter.ready
      .then(() => defaultWriter.close())
      .then(() => {
        console.log("All chunks written");
      })
      .catch((err) => {
        console.error(`Stream error: ${err}`);
      });
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
