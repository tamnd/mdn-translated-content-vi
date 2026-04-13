---
title: WritableStream
slug: Web/API/WritableStream
page-type: web-api-interface
browser-compat: api.WritableStream
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`WritableStream`** của [Streams API](/en-US/docs/Web/API/Streams_API) cung cấp một bản tóm tắt tiêu chuẩn để ghi dữ liệu truyền trực tuyến đến đích, được gọi là phần chìm.
Đối tượng này đi kèm với áp suất ngược và xếp hàng tích hợp.

`WritableStream` là một [đối tượng có thể chuyển nhượng](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

## Trình xây dựng

- {{domxref("WritableStream.WritableStream", "WritableStream()")}}
  - : Tạo một đối tượng `WritableStream` mới.

## Thuộc tính phiên bản

- {{domxref("WritableStream.locked")}} {{ReadOnlyInline}}
  - : Một giá trị boolean cho biết `WritableStream` có bị khóa đối với người ghi hay không.

## Các phương thức thực thể

- {{domxref("WritableStream.abort()")}}
  - : Hủy bỏ luồng, báo hiệu rằng nhà sản xuất không còn có thể ghi thành công vào luồng nữa và nó sẽ ngay lập tức được chuyển sang trạng thái lỗi, mọi thao tác ghi trong hàng đợi sẽ bị loại bỏ.
- {{domxref("WritableStream.close()")}}
  - : Đóng luồng.
- {{domxref("WritableStream.getWriter()")}}
  - : Trả về phiên bản mới của {{domxref("WritableStreamDefaultWriter")}} và khóa luồng vào phiên bản đó. Trong khi luồng bị khóa, không thể lấy được trình ghi nào khác cho đến khi luồng này được phát hành.

## Ví dụ

Ví dụ sau minh họa một số tính năng của giao diện này. Nó tạo `WritableStream` bằng một bồn rửa tùy chỉnh. Sau đó, nó gọi phương thức `getWriter()` của luồng, phương thức này trả về một phiên bản {{domxref("WritableStreamDefaultWriter")}}. Tiếp theo, một số chuỗi được ghi vào luồng. Cuối cùng, `close()` trả về một lời hứa sẽ được giải quyết khi tất cả quá trình ghi đã hoàn tất thành công.

```js
const writableStream = new WritableStream(
  // Implement the sink
  {
    write(chunk) {
      const textElement = document.getElementById("text-output");
      textElement.textContent += chunk;
    },
  },
);

const writer = writableStream.getWriter();

try {
  writer.write("Hello, ");
  writer.write("world!\n");
  writer.write("This has been a demo!\n");

  await writer.close(); // wait for all chunks to be written
  console.log("All chunks written");
} catch (error) {
  console.error("Stream error: ", error);
}
```

Ví dụ này không hỗ trợ tính năng [backpressure](/en-US/docs/Web/API/Streams_API/Concepts#backpressure) của Luồng.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Streams—Hướng dẫn chính xác](https://web.dev/articles/streams)
