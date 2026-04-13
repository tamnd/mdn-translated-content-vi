---
title: WritableStreamDefaultWriter
slug: Web/API/WritableStreamDefaultWriter
page-type: web-api-interface
browser-compat: api.WritableStreamDefaultWriter
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`WritableStreamDefaultWriter`** của [API Streams](/en-US/docs/Web/API/Streams_API) là đối tượng được trả về bởi {{domxref("WritableStream.getWriter()")}} và, khi đã được tạo, sẽ khóa trình ghi vào `WritableStream`, bảo đảm rằng không có luồng nào khác có thể ghi vào sink nền tảng.

## Bộ khởi tạo

- {{domxref("WritableStreamDefaultWriter.WritableStreamDefaultWriter", "WritableStreamDefaultWriter()")}}
  - : Tạo một thể hiện đối tượng `WritableStreamDefaultWriter` mới.

## Thuộc tính thể hiện

- {{domxref("WritableStreamDefaultWriter.closed")}} {{ReadOnlyInline}}
  - : Cho phép bạn viết mã phản hồi khi quá trình streaming kết thúc. Trả về một promise được hoàn tất nếu luồng đóng, hoặc bị từ chối nếu luồng phát sinh lỗi hoặc khóa của trình ghi bị giải phóng.
- {{domxref("WritableStreamDefaultWriter.desiredSize")}} {{ReadOnlyInline}}
  - : Trả về kích thước mong muốn cần để lấp đầy hàng đợi nội bộ của luồng.
- {{domxref("WritableStreamDefaultWriter.ready")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi kích thước mong muốn của hàng đợi nội bộ của luồng chuyển từ không dương sang dương, báo hiệu rằng nó không còn áp dụng áp lực ngược nữa.

## Phương thức thể hiện

- {{domxref("WritableStreamDefaultWriter.abort()")}}
  - : Hủy luồng, báo hiệu rằng bộ sinh dữ liệu không còn có thể ghi thành công vào luồng nữa và luồng sẽ ngay lập tức được đưa vào trạng thái lỗi, với mọi thao tác ghi đang chờ sẽ bị loại bỏ.
- {{domxref("WritableStreamDefaultWriter.close()")}}
  - : Đóng luồng ghi liên kết.
- {{domxref("WritableStreamDefaultWriter.releaseLock()")}}
  - : Giải phóng khóa của trình ghi trên luồng tương ứng. Sau khi khóa được giải phóng, trình ghi không còn hoạt động nữa. Nếu luồng liên kết đang ở trạng thái lỗi khi khóa được giải phóng, trình ghi sẽ xuất hiện ở trạng thái lỗi tương tự kể từ lúc đó; nếu không, trình ghi sẽ xuất hiện là đã đóng.
- {{domxref("WritableStreamDefaultWriter.write()")}}
  - : Ghi một khối dữ liệu được truyền vào tới {{domxref("WritableStream")}} và sink nền tảng của nó, rồi trả về một {{jsxref("Promise")}} được giải quyết để cho biết thao tác ghi thành công hay thất bại.

## Ví dụ

Ví dụ sau cho thấy việc tạo một `WritableStream` với một sink tùy chỉnh và một chiến lược xếp hàng do API cung cấp. Sau đó nó gọi một hàm tên là `sendMessage()`, truyền vào luồng mới được tạo và một chuỗi. Bên trong hàm này, nó gọi phương thức `getWriter()` của luồng, phương thức này trả về một thể hiện của `WritableStreamDefaultWriter`. Một lệnh gọi `forEach()` được dùng để ghi từng khối của chuỗi vào luồng. Cuối cùng, `write()` và `close()` trả về các promise được xử lý để giải quyết thành công hoặc thất bại của các khối và luồng.

```js
const list = document.querySelector("ul");

async function sendMessage(message, writableStream) {
  // defaultWriter is of type WritableStreamDefaultWriter
  const defaultWriter = writableStream.getWriter();
  const encoder = new TextEncoder();
  const encoded = encoder.encode(message);

  try {
    for (const chunk of encoded) {
      await defaultWriter.ready;
      await defaultWriter.write(chunk);
      console.log("Chunk written to sink.");
    }
    // Call ready again to ensure that all chunks are written
    // before closing the writer.
    await defaultWriter.ready;
    await defaultWriter.close();
    console.log("All chunks written");
  } catch (err) {
    console.log("Error:", err);
  }
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
