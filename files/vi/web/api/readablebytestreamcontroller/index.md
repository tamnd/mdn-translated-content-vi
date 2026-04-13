---
title: ReadableByteStreamController
slug: Web/API/ReadableByteStreamController
page-type: web-api-interface
browser-compat: api.ReadableByteStreamController
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`ReadableByteStreamController`** của [Streams API](/en-US/docs/Web/API/Streams_API) đại diện cho controller của một [readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams).
Nó cho phép kiểm soát trạng thái và hàng đợi nội bộ của {{domxref("ReadableStream")}} với nguồn byte bên dưới, đồng thời cho phép truyền zero-copy hiệu quả từ nguồn bên dưới đến consumer khi hàng đợi nội bộ của stream rỗng.

Một đối tượng của loại controller này được tạo nếu một đối tượng `underlyingSource` với thuộc tính `type="bytes"` được truyền làm đối số cho [`hàm khởi tạo ReadableStream()`](/en-US/docs/Web/API/ReadableStream/ReadableStream#type).
Đối tượng `underlyingSource` cũng có thể định nghĩa các hàm callback [`start()`](/en-US/docs/Web/API/ReadableStream/ReadableStream#start) và [`pull()`](/en-US/docs/Web/API/ReadableStream/ReadableStream#pull).
Các hàm này được gọi với controller làm tham số, để thiết lập nguồn bên dưới và yêu cầu dữ liệu khi cần.

Nguồn bên dưới dùng controller để cung cấp dữ liệu cho stream thông qua thuộc tính [`byobRequest`](/en-US/docs/Web/API/ReadableByteStreamController/byobRequest) hoặc phương thức [`enqueue()`](/en-US/docs/Web/API/ReadableByteStreamController/enqueue).
`byobRequest` là đối tượng {{domxref("ReadableStreamBYOBRequest")}} đại diện cho yêu cầu đang chờ từ consumer để thực hiện truyền zero-copy trực tiếp đến consumer.
`byobRequest` phải được dùng để sao chép dữ liệu nếu nó tồn tại (đừng dùng `enqueue()` trong trường hợp này)!
Nếu nguồn bên dưới cần truyền dữ liệu cho stream và `byobRequest` là `null`, nguồn có thể gọi `enqueue()` để thêm dữ liệu vào các hàng đợi nội bộ của stream.

Lưu ý rằng `byobRequest` chỉ được tạo trong "chế độ BYOB" khi có yêu cầu từ reader và hàng đợi nội bộ của stream rỗng.
"Chế độ BYOB" được bật khi dùng {{domxref("ReadableStreamBYOBReader")}} (thường được tạo bằng cách gọi {{domxref("ReadableStream.getReader()")}} với đối số `{ mode: 'byob' }`).
Nó cũng được bật khi dùng reader mặc định và [`autoAllocateChunkSize`](/en-US/docs/Web/API/ReadableStream/ReadableStream#autoallocatechunksize) được chỉ định trong [`hàm khởi tạo ReadableStream()`](/en-US/docs/Web/API/ReadableStream/ReadableStream).

Nguồn byte bên dưới cũng có thể dùng controller để [`đóng()`](/en-US/docs/Web/API/ReadableByteStreamController/close) stream khi tất cả dữ liệu đã được gửi và báo cáo lỗi từ nguồn bên dưới bằng [`error()`](/en-US/docs/Web/API/ReadableByteStreamController/error).
Thuộc tính [`desiredSize`](/en-US/docs/Web/API/ReadableByteStreamController/desiredSize) của controller được dùng để áp dụng "backpressure", thông báo cho nguồn bên dưới về kích thước của hàng đợi nội bộ (các giá trị nhỏ chỉ ra rằng hàng đợi đang đầy, gợi ý cho nguồn bên dưới rằng nên tạm dừng hoặc giới hạn lượng dữ liệu đầu vào).

## Hàm khởi tạo

Không có. Các đối tượng `ReadableByteStreamController` được tạo tự động nếu `underlyingSource` với thuộc tính `type="bytes"` được truyền cho [`hàm khởi tạo ReadableStream()`](/en-US/docs/Web/API/ReadableStream/ReadableStream#type).

## Thuộc tính phiên bản

- {{domxref("ReadableByteStreamController.byobRequest")}} {{ReadOnlyInline}}
  - : Trả về yêu cầu BYOB pull hiện tại, hoặc `null` nếu không có yêu cầu nào đang chờ.
- {{domxref("ReadableByteStreamController.desiredSize")}} {{ReadOnlyInline}}
  - : Trả về kích thước mong muốn cần thiết để lấp đầy hàng đợi nội bộ của stream.

## Phương thức phiên bản

- {{domxref("ReadableByteStreamController.close()")}}
  - : Đóng stream liên quan.
- {{domxref("ReadableByteStreamController.enqueue()")}}
  - : Xếp hàng một chunk đã cho trong stream liên quan.
- {{domxref("ReadableByteStreamController.error()")}}
  - : Khiến bất kỳ tương tác nào trong tương lai với stream liên quan gặp lỗi.

## Ví dụ

Controller được nguồn bên dưới sử dụng để truyền hoặc xếp hàng dữ liệu, để báo hiệu rằng stream không còn dữ liệu (đã đóng) hoặc gặp lỗi. Nó cũng được dùng để báo hiệu cho nguồn bên dưới từ "thượng nguồn" về tốc độ dữ liệu mong muốn, bằng cách dùng {{domxref("ReadableByteStreamController.desiredSize","desiredSize")}}.

Ví dụ trong [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams), cụ thể là [Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream), cho thấy hầu hết các trường hợp này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Khái niệm Streams API](/en-US/docs/Web/API/Streams_API)
- [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
- {{domxref("ReadableStream")}}
- [Web-streams-polyfill](https://github.com/MattiasBuelens/web-streams-polyfill)
