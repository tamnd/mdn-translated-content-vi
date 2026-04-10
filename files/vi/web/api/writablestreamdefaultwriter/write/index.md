---
title: "WritableStreamDefaultWriter: write() method"
short-title: write()
slug: Web/API/WritableStreamDefaultWriter/write
page-type: web-api-instance-method
browser-compat: api.WritableStreamDefaultWriter.write
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`write()`** của giao diện {{domxref("WritableStreamDefaultWriter")}} ghi một khối dữ liệu được truyền vào tới {{domxref("WritableStream")}} và sink nền tảng của nó, rồi trả về một {{jsxref("Promise")}} được giải quyết để cho biết thao tác ghi thành công hay thất bại.

Lưu ý rằng "thành công" có nghĩa là gì là do sink nền tảng quyết định; nó có thể chỉ ra rằng
khối dữ liệu đã được chấp nhận, chứ không nhất thiết là nó đã được lưu an toàn tới
đích cuối cùng.

## Cú pháp

```js-nolint
write(chunk)
```

### Tham số

- `chunk`
  - : Một khối dữ liệu nhị phân để truyền tới `WritableStream`.

### Giá trị trả về

Một {{jsxref("Promise")}}, được hoàn tất với `undefined` khi ghi thành công,
hoặc bị từ chối nếu việc ghi thất bại hoặc luồng trở nên ở trạng thái lỗi trước khi
quá trình ghi được khởi động.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Luồng đích không phải là luồng ghi, hoặc nó không có chủ sở hữu.

## Ví dụ

Ví dụ sau cho thấy việc tạo một `WritableStream` với một sink tùy chỉnh
và một chiến lược xếp hàng do API cung cấp. Sau đó nó gọi một hàm tên là
`sendMessage()`, truyền vào luồng mới được tạo và một chuỗi. Bên trong
hàm này, nó gọi phương thức `getWriter()` của luồng, phương thức này trả về một
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

Bạn có thể tìm thấy mã đầy đủ trong [ví dụ trình ghi đơn giản](https://mdn.github.io/dom-examples/streams/simple-writer/) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
