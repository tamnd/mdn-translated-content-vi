---
title: "WritableStreamDefaultWriter: WritableStreamDefaultWriter() constructor"
short-title: WritableStreamDefaultWriter()
slug: Web/API/WritableStreamDefaultWriter/WritableStreamDefaultWriter
page-type: web-api-constructor
browser-compat: api.WritableStreamDefaultWriter.WritableStreamDefaultWriter
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`WritableStreamDefaultWriter()`**
bộ khởi tạo tạo một thể hiện đối tượng {{domxref("WritableStreamDefaultWriter")}} mới.

> [!NOTE]
> Thông thường bạn sẽ không dùng bộ khởi tạo này trực tiếp; thay vào đó,
> bạn sẽ dùng phương thức {{domxref("WritableStream.getWriter()")}}.

## Cú pháp

```js-nolint
new WritableStreamDefaultWriter(stream)
```

### Tham số

- `stream`
  - : {{domxref("WritableStream")}} sẽ được ghi vào.

### Giá trị trả về

Một thể hiện của đối tượng {{domxref("WritableStreamDefaultWriter")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Giá trị `stream` được cung cấp không phải là {{domxref("WritableStream")}}, hoặc nó
    đã bị khóa bởi một trình ghi khác.

## Ví dụ

Ví dụ sau cho thấy việc tạo một `WritableStream` với một sink tùy chỉnh và
một chiến lược xếp hàng do API cung cấp. Sau đó nó gọi một hàm tên là
`sendMessage()`, truyền vào luồng mới được tạo và một chuỗi. Bên trong hàm này
nó gọi phương thức `getWriter()` của luồng, phương thức này trả về một
thể hiện của {{domxref("WritableStreamDefaultWriter")}}. Một lệnh gọi `forEach()` được
dùng để ghi từng khối của chuỗi vào luồng. Cuối cùng, `write()` và `close()`
trả về các promise được xử lý để giải quyết thành công hoặc thất bại
của các khối và luồng.

```js
const list = document.querySelector("ul");

function sendMessage(message, writableStream) {
  // defaultWriter is of type WritableStreamDefaultWriter
  const defaultWriter = writableStream.getWriter();
  const encoder = new TextEncoder();
  const encoded = encoder.encode(message);
  encoded.forEach((chunk) => {
    defaultWriter.ready
      .then(() => defaultWriter.write(chunk))
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

Bạn có thể xem mã đầy đủ trong [ví dụ trình ghi đơn giản](https://mdn.github.io/dom-examples/streams/simple-writer/) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
