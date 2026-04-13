---
title: "WritableStreamDefaultWriter: close() method"
short-title: close()
slug: Web/API/WritableStreamDefaultWriter/close
page-type: web-api-instance-method
browser-compat: api.WritableStreamDefaultWriter.close
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`close()`** của giao diện {{domxref("WritableStreamDefaultWriter")}} đóng luồng ghi liên kết.

Sink nền tảng sẽ hoàn tất việc xử lý mọi khối đã được ghi trước đó, trước khi gọi hành vi đóng. Trong thời gian này, mọi nỗ lực ghi thêm sẽ thất bại, nhưng không làm luồng chuyển sang trạng thái lỗi.

## Cú pháp

```js-nolint
close()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}}, được hoàn tất với `undefined` nếu tất cả
các khối còn lại đã được ghi thành công trước khi đóng, hoặc bị từ chối với lỗi nếu
xảy ra sự cố trong quá trình này.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luồng bạn đang cố đóng không phải là một {{domxref("WritableStream")}}.

## Ví dụ

Ví dụ sau cho thấy việc tạo một `WritableStream` với một sink tùy chỉnh và
một chiến lược xếp hàng do API cung cấp. Sau đó nó gọi một hàm tên là
`sendMessage()`, truyền vào luồng mới được tạo và một chuỗi. Bên trong
hàm này, nó gọi phương thức `getWriter()` của luồng, phương thức này trả về một
thể hiện của {{domxref("WritableStreamDefaultWriter")}}. Mỗi khối của chuỗi đã mã hóa được ghi vào luồng bằng phương thức `write()`, và phương thức `forEach()` của `Uint8Array` đã mã hóa được dùng để xử lý từng byte. Cuối cùng, `close()` được gọi và promise mà nó trả về được xử lý để giải quyết thành công hoặc mọi lỗi của các thao tác ghi theo khối.

```js
const list = document.querySelector("ul");

function sendMessage(message, writableStream) {
  // defaultWriter is of type WritableStreamDefaultWriter
  const defaultWriter = writableStream.getWriter();
  const encoder = new TextEncoder();
  const encoded = encoder.encode(message);
  encoded.forEach((chunk) => {
    defaultWriter.ready
      .then(() => {
        defaultWriter.write(chunk);
      })
      .then(() => {
        console.log("Chunk written to sink.");
      })
      .catch((err) => {
        console.log("Chunk error:", err);
      });
  });
  // Call ready again to ensure that all chunks are written
  //   before closing the writer.
  defaultWriter.ready
    .then(() => {
      defaultWriter.close();
    })
    .then(() => {
      console.log("All chunks written");
    })
    .catch((err) => {
      console.log("Stream error:", err);
    });
}

const decoder = new TextDecoder("utf-8");
const queuingStrategy = new CountQueuingStrategy({ highWaterMark: 1 });
let result = "";
const writableStream = new WritableStream(
  {
    // Implement the sink
    write(chunk) {
      return new Promise((resolve, reject) => {
        const buffer = new ArrayBuffer(1);
        const view = new Uint8Array(buffer);
        view[0] = chunk;
        const decoded = decoder.decode(view, { stream: true });
        const listItem = document.createElement("li");
        listItem.textContent = `Chunk decoded: ${decoded}`;
        list.appendChild(listItem);
        result += decoded;
        resolve();
      });
    },
    close() {
      const listItem = document.createElement("li");
      listItem.textContent = `[MESSAGE RECEIVED] ${result}`;
      list.appendChild(listItem);
    },
    abort(err) {
      console.log("Sink error:", err);
    },
  },
  queuingStrategy,
);

sendMessage("Hello, world.", writableStream);
```

Bạn có thể xem một bản trình diễn trực tiếp của ví dụ này tại [ví dụ trình ghi đơn giản](https://mdn.github.io/dom-examples/streams/simple-writer/) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
