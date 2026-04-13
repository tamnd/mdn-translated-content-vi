---
title: ReadableStreamBYOBReader
slug: Web/API/ReadableStreamBYOBReader
page-type: web-api-interface
browser-compat: api.ReadableStreamBYOBReader
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện `ReadableStreamBYOBReader` của [Streams API](/en-US/docs/Web/API/Streams_API) định nghĩa một reader cho {{domxref("ReadableStream")}} hỗ trợ đọc zero-copy từ nguồn byte bên dưới.
Nó được dùng để sao chép hiệu quả từ các nguồn bên dưới khi dữ liệu được truyền dưới dạng chuỗi byte "ẩn danh", chẳng hạn như tập tin.

Thông thường, một đối tượng loại reader này được lấy bằng cách gọi {{domxref("ReadableStream.getReader()")}} trên stream, truyền `mode: "byob"` trong tham số tùy chọn.
Stream có thể đọc phải có _nguồn byte bên dưới_. Nói cách khác, nó phải được [khởi tạo](/en-US/docs/Web/API/ReadableStream/ReadableStream) với nguồn bên dưới có [`type: "bytes"`](/en-US/docs/Web/API/ReadableStream/ReadableStream#type).

Khi dùng loại reader này, một yêu cầu [`read()`](/en-US/docs/Web/API/ReadableStreamBYOBReader/read) khi các hàng đợi nội bộ của stream đang rỗng sẽ dẫn đến việc truyền zero-copy từ nguồn bên dưới (bỏ qua các hàng đợi nội bộ của stream).
Nếu các hàng đợi nội bộ không rỗng, `read()` sẽ đáp ứng yêu cầu từ dữ liệu đã được đệm.

Lưu ý rằng các phương thức và thuộc tính tương tự như reader mặc định ({{domxref("ReadableStreamDefaultReader")}}).
Phương thức `read()` khác ở chỗ nó cung cấp một view để dữ liệu được ghi vào.

## Hàm khởi tạo

- {{domxref("ReadableStreamBYOBReader.ReadableStreamBYOBReader", "ReadableStreamBYOBReader()")}}
  - : Tạo và trả về một đối tượng `ReadableStreamBYOBReader`.

## Thuộc tính phiên bản

- {{domxref("ReadableStreamBYOBReader.closed")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} hoàn thành khi stream đóng lại, hoặc bị từ chối nếu stream phát sinh lỗi hoặc khóa của reader được giải phóng. Thuộc tính này cho phép bạn viết mã phản ứng khi quá trình streaming kết thúc.

## Phương thức phiên bản

- {{domxref("ReadableStreamBYOBReader.cancel()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi stream bị hủy. Gọi phương thức này báo hiệu rằng consumer không còn quan tâm đến stream. Đối số `reason` được cung cấp sẽ được truyền cho nguồn bên dưới, nguồn này có thể hoặc không sử dụng nó.
- {{domxref("ReadableStreamBYOBReader.read()")}}
  - : Truyền một view để ghi dữ liệu vào, và trả về một {{jsxref("Promise")}} được giải quyết với chunk tiếp theo trong stream hoặc bị từ chối với dấu hiệu cho thấy stream đã đóng hoặc gặp lỗi.
- {{domxref("ReadableStreamBYOBReader.releaseLock()")}}
  - : Giải phóng khóa của reader trên stream.

## Ví dụ

Ví dụ dưới đây được lấy từ các ví dụ trực tiếp trong [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#examples).

Đầu tiên tạo reader bằng cách dùng {{domxref("ReadableStream.getReader()")}} trên stream, truyền `mode: "byob"` trong tham số tùy chọn.
Vì đây là reader "Bring Your Own Buffer", chúng ta cũng cần tạo một `ArrayBuffer` để đọc vào.

```js
const reader = stream.getReader({ mode: "byob" });
let buffer = new ArrayBuffer(200);
```

Hàm sử dụng reader được hiển thị bên dưới.
Hàm này gọi đệ quy phương thức `read()` để đọc dữ liệu vào buffer.
Phương thức nhận một [`Uint8Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Uint8Array) [typed array](/en-US/docs/Web/JavaScript/Reference/Global_Objects/TypedArray) là view trên phần của array buffer gốc chưa được ghi vào.
Các tham số của view được tính từ dữ liệu nhận được trong các lần gọi trước, xác định offset vào array buffer gốc.

```js
readStream(reader);

function readStream(reader) {
  let bytesReceived = 0;
  let offset = 0;

  // read() returns a promise that resolves when a value has been received
  reader
    .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
    .then(function processText({ done, value }) {
      // Result objects contain two properties:
      // done  - true if the stream has already given all its data.
      // value - some data. Always undefined when done is true.

      if (done) {
        logConsumer(`readStream() complete. Total bytes: ${bytesReceived}`);
        return;
      }

      buffer = value.buffer;
      offset += value.byteLength;
      bytesReceived += value.byteLength;

      logConsumer(
        `Read ${value.byteLength} (${bytesReceived}) bytes: ${value}`,
      );
      result += value;

      // Read some more, and call this function again
      return reader
        .read(new Uint8Array(buffer, offset, buffer.byteLength - offset))
        .then(processText);
    });
}
```

Khi không còn dữ liệu trong stream, phương thức `read()` giải quyết với một đối tượng có thuộc tính `done` được đặt là `true`, và hàm trả về.

Thuộc tính {{domxref("ReadableStreamBYOBReader.closed")}} trả về một promise có thể dùng để theo dõi khi stream bị đóng hoặc gặp lỗi, hoặc khóa reader được giải phóng.

```js
reader.closed
  .then(() => {
    // Resolved - code to handle stream closing
  })
  .catch(() => {
    // Rejected - code to handle error
  });
```

Để hủy stream, gọi {{domxref("ReadableStreamBYOBReader.cancel()")}}, tùy chọn chỉ định _reason_.
Hàm này trả về một promise sẽ giải quyết khi stream được hủy.
Khi stream bị hủy, controller sẽ gọi `cancel()` trên nguồn bên dưới, truyền reason tùy chọn.

Mã ví dụ trong [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#examples) gọi phương thức cancel khi nút được nhấn, như sau:

```js
button.addEventListener("click", () => {
  reader.cancel("user choice").then(() => console.log("cancel complete"));
});
```

Consumer cũng có thể gọi `releaseLock()` để giải phóng khóa reader trên stream, nhưng chỉ khi không có lần đọc nào đang chờ:

```js
reader.releaseLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm Streams API](/en-US/docs/Web/API/Streams_API)
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableStream")}}
- [Web-streams-polyfill](https://github.com/MattiasBuelens/web-streams-polyfill)
