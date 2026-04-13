---
title: ReadableStreamBYOBRequest
slug: Web/API/ReadableStreamBYOBRequest
page-type: web-api-interface
browser-compat: api.ReadableStreamBYOBRequest
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Giao diện **`ReadableStreamBYOBRequest`** của [Streams API](/en-US/docs/Web/API/Streams_API) đại diện cho một "yêu cầu kéo" dữ liệu từ nguồn bên dưới sẽ được thực hiện dưới dạng truyền zero-copy tới người tiêu thụ (bỏ qua hàng đợi nội bộ của stream).

Các đối tượng `ReadableStreamBYOBRequest` được tạo ở "chế độ BYOB" khi người tiêu thụ yêu cầu dữ liệu và hàng đợi nội bộ của stream là _trống_. (Stream sẽ giải quyết yêu cầu của người tiêu thụ trực tiếp nếu nó đã có dữ liệu được đệm sẵn.) Nguồn byte bên dưới có thể truy cập các yêu cầu BYOB đang hoạt động thông qua thuộc tính {{domxref("ReadableByteStreamController.byobRequest")}} của controller, sẽ được đặt thành `null` nếu không có yêu cầu nào đang chờ xử lý.

Nguồn bên dưới hỗ trợ "chế độ BYOB" cần kiểm tra {{domxref("ReadableByteStreamController.byobRequest")}} và phải sử dụng nó để truyền dữ liệu, nếu có. Nếu dữ liệu đến từ nguồn bên dưới khi {{domxref("ReadableByteStreamController.byobRequest")}} là `null`, dữ liệu có thể được xếp hàng bằng cách dùng {{domxref("ReadableByteStreamController.enqueue()")}}.

Nguồn bên dưới sử dụng yêu cầu bằng cách ghi dữ liệu vào [`view`](/en-US/docs/Web/API/ReadableStreamBYOBRequest/view) của yêu cầu BYOB và sau đó gọi [`respond()`](/en-US/docs/Web/API/ReadableStreamBYOBRequest/respond), hoặc bằng cách gọi [`respondWithNewView()`](/en-US/docs/Web/API/ReadableStreamBYOBRequest/respondWithNewView) và truyền một view mới làm đối số. Lưu ý rằng "view mới" phải thực sự là một view trên _cùng_ bộ nhớ đệm như `view` ban đầu, bắt đầu tại cùng offset.

## Hàm khởi tạo

Không có. Thực thể `ReadableStreamBYOBRequest` được tạo tự động bởi `ReadableByteStreamController` khi cần.

## Thuộc tính phiên bản

- {{domxref("ReadableStreamBYOBRequest.view")}} {{ReadOnlyInline}}
  - : Trả về view hiện tại. Đây là view trên một bộ nhớ đệm sẽ được truyền cho người tiêu thụ khi `ReadableStreamBYOBRequest.respond()` được gọi.

## Phương thức phiên bản

- {{domxref("ReadableStreamBYOBRequest.respond()")}}
  - : Báo hiệu cho readable byte stream liên quan rằng số byte được chỉ định đã được ghi vào [`view`](/en-US/docs/Web/API/ReadableStreamBYOBRequest/view) hiện tại, từ đó khiến yêu cầu đang chờ từ người tiêu thụ được giải quyết. Lưu ý rằng sau khi phương thức này được gọi, `view` sẽ được truyền và không còn có thể sửa đổi.
- {{domxref("ReadableStreamBYOBRequest.respondWithNewView()")}}
  - : Báo hiệu cho readable byte stream liên quan rằng view được truyền làm đối số sẽ được chuyển đến người tiêu thụ của readable byte stream. View mới này phải sử dụng cùng bộ nhớ đệm như [`view`](/en-US/docs/Web/API/ReadableStreamBYOBRequest/view) ban đầu, bắt đầu tại cùng offset, và có độ dài bằng hoặc nhỏ hơn. Lưu ý rằng sau khi phương thức này được gọi, `view` sẽ được truyền và không còn có thể sửa đổi.

## Ví dụ

Code sau được lấy từ ví dụ trực tiếp trong [Sử dụng readable byte streams > Tạo readable socket push byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#creating_a_readable_socket_push_byte_stream).

Nguồn byte push bên dưới có dữ liệu để truyền trước tiên cần kiểm tra xem {{domxref("ReadableByteStreamController.byobRequest","controller.byobRequest")}} có khác `null` không. Nguồn byte pull chỉ cần kiểm tra này nếu tự động phân bổ chunk không được bật và nó được dùng với reader mặc định.

```js
if (controller.byobRequest) {
  /* code to transfer data */
}
```

Có hai cách để đọc dữ liệu vào `ReadableStreamBYOBRequest` và sau đó truyền nó. Cách đầu tiên là ghi dữ liệu vào thuộc tính {{domxref("ReadableStreamBYOBRequest.view")}} và sau đó gọi {{domxref("ReadableStreamBYOBRequest.respond()")}} để chỉ ra lượng dữ liệu cần truyền. Sau khi thao tác này, `byobRequest.view` sẽ bị tách ra và yêu cầu nên bị loại bỏ.

Code bên dưới cho thấy trường hợp này bằng cách dùng phương thức giả định `readInto()` để sao chép dữ liệu vào view:

```js
const v = controller.byobRequest.view;
bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
controller.byobRequest.respond(bytesRead);
```

Cách khác là gọi {{domxref("ReadableStreamBYOBRequest.respondWithNewView()")}} truyền view của bạn trên cùng dữ liệu sao lưu bên dưới. Lưu ý rằng đây chỉ là cách khác để chỉ định phạm vi của bộ nhớ đệm/bộ nhớ sao lưu bên dưới thực sự được truyền. Tương đương `respondWithNewView` của code trên sẽ là:

```js
const v = controller.byobRequest.view;
bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
const newView = new Uint8Array(v.buffer, v.byteOffset, bytesRead);
controller.byobRequest.respondWithNewView(newView);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
