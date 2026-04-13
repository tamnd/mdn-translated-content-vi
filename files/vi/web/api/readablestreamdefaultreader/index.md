---
title: ReadableStreamDefaultReader
slug: Web/API/ReadableStreamDefaultReader
page-type: web-api-interface
browser-compat: api.ReadableStreamDefaultReader
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`ReadableStreamDefaultReader`** của [API Streams](/en-US/docs/Web/API/Streams_API) biểu diễn một trình đọc mặc định có thể dùng để đọc dữ liệu luồng được cung cấp từ mạng, chẳng hạn như một yêu cầu fetch.

`ReadableStreamDefaultReader` có thể được dùng để đọc từ một {{domxref("ReadableStream")}} có nguồn nền tảng thuộc bất kỳ kiểu nào, khác với {{domxref("ReadableStreamBYOBReader")}}, vốn chỉ có thể dùng với các luồng có thể đọc có _nguồn byte nền tảng_.

Lưu ý rằng việc truyền không sao chép từ nguồn nền tảng chỉ được hỗ trợ cho các nguồn byte nền tảng tự động cấp phát bộ đệm.
Nói cách khác, luồng phải được [khởi tạo](/en-US/docs/Web/API/ReadableStream/ReadableStream) với cả [`type="bytes"`](/en-US/docs/Web/API/ReadableStream/ReadableStream#type) và [`autoAllocateChunkSize`](/en-US/docs/Web/API/ReadableStream/ReadableStream#autoallocatechunksize).
Với mọi nguồn nền tảng khác, luồng sẽ luôn đáp ứng các yêu cầu đọc bằng dữ liệu từ hàng đợi nội bộ.

## Bộ khởi tạo

- {{domxref("ReadableStreamDefaultReader.ReadableStreamDefaultReader", "ReadableStreamDefaultReader()")}}
  - : Tạo và trả về một thể hiện đối tượng `ReadableStreamDefaultReader`.

## Thuộc tính thể hiện

- {{domxref("ReadableStreamDefaultReader.closed")}} {{ReadOnlyInline}}
  - : Trả về một {{jsxref("Promise")}} được hoàn tất khi luồng đóng, hoặc bị từ chối nếu luồng phát sinh lỗi hay khóa của trình đọc bị giải phóng. Thuộc tính này cho phép bạn viết mã phản hồi khi quá trình streaming kết thúc.

## Phương thức thể hiện

- {{domxref("ReadableStreamDefaultReader.cancel()")}}
  - : Trả về một {{jsxref("Promise")}} được giải quyết khi luồng bị hủy. Gọi phương thức này báo hiệu rằng phía tiêu thụ không còn quan tâm đến luồng nữa. Đối số `reason` được cung cấp sẽ được chuyển cho nguồn nền tảng, nguồn này có thể dùng hoặc không dùng nó.
- {{domxref("ReadableStreamDefaultReader.read()")}}
  - : Trả về một Promise cung cấp quyền truy cập tới khối dữ liệu tiếp theo trong hàng đợi nội bộ của luồng.
- {{domxref("ReadableStreamDefaultReader.releaseLock()")}}
  - : Giải phóng khóa của trình đọc trên luồng.

## Ví dụ

Trong ví dụ sau, một {{domxref("Response")}} giả lập được tạo để truyền các đoạn HTML được tìm nạp từ một tài nguyên khác tới trình duyệt.

Ví dụ này minh họa việc sử dụng {{domxref("ReadableStream")}} kết hợp với {{jsxref("Uint8Array")}}.

```js
fetch("https://www.example.org/").then((response) => {
  const reader = response.body.getReader();
  const stream = new ReadableStream({
    start(controller) {
      // The following function handles each data chunk
      function push() {
        // "done" is a Boolean and value a "Uint8Array"
        return reader.read().then(({ done, value }) => {
          // Is there no more data to read?
          if (done) {
            // Tell the browser that we have finished sending data
            controller.close();
            return;
          }

          // Get the data and send it to the browser via the controller
          controller.enqueue(value);
          push();
        });
      }

      push();
    },
  });

  return new Response(stream, { headers: { "Content-Type": "text/html" } });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm API Streams](/en-US/docs/Web/API/Streams_API)
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStream")}}
- [Web-streams-polyfill](https://github.com/MattiasBuelens/web-streams-polyfill)
