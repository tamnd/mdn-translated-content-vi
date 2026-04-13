---
title: "ReadableStreamBYOBRequest: respondWithNewView() method"
short-title: respondWithNewView()
slug: Web/API/ReadableStreamBYOBRequest/respondWithNewView
page-type: web-api-instance-method
browser-compat: api.ReadableStreamBYOBRequest.respondWithNewView
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`respondWithNewView()`** của giao diện {{domxref("ReadableStreamBYOBRequest")}} chỉ định một view mới mà người tiêu thụ của readable byte stream liên quan nên ghi vào thay vì {{domxref("ReadableStreamBYOBRequest.view")}}.

View mới phải là một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} cung cấp view trên cùng vùng bộ nhớ sao lưu như {{domxref("ReadableStreamBYOBRequest.view")}}. Sau khi phương thức này được gọi, view được truyền vào phương thức sẽ được chuyển và không còn có thể sửa đổi.

Phương thức này dành cho các trường hợp nguồn byte bên dưới cần truyền `byobRequest.view` nội bộ trước khi hoàn thành phản hồi của nó. Ví dụ, nguồn có thể truyền view BYOB đến một worker thread riêng biệt và đợi worker truyền lại sau khi đã điền dữ liệu vào.

## Cú pháp

```js-nolint
respondWithNewView(view)
```

### Tham số

- `view`
  - : Một {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} mà người tiêu thụ của readable byte stream liên quan nên ghi vào thay vì {{domxref("ReadableStreamBYOBRequest.view")}}.

    Đây phải là view trên cùng vùng bộ nhớ sao lưu như {{domxref("ReadableStreamBYOBRequest.view")}} và chiếm cùng hoặc ít bộ nhớ hơn. Cụ thể, nó phải là bộ nhớ đệm của view hoặc phiên bản đã được truyền, phải có cùng `byteOffset`, và `byteLength` (số byte đã ghi) nhỏ hơn hoặc bằng view đó.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném nếu đối tượng nguồn không phải là `ReadableStreamBYOBRequest`, hoặc không có controller liên quan, hoặc mảng bộ nhớ đệm nội bộ liên quan không tồn tại hoặc bị tách ra. Cũng có thể được ném nếu `view` có độ dài bằng không khi có reader đang hoạt động, hoặc khác không khi được gọi trên stream đã đóng.

- {{jsxref("RangeError")}}
  - : Được ném nếu `view` mới không khớp với vùng bộ nhớ sao lưu của {{domxref("ReadableStreamBYOBRequest.view")}}. Ví dụ, nó không phải là cùng bộ nhớ đệm (hoặc phiên bản đã được truyền), có `byteOffset` khác, hoặc lớn hơn bộ nhớ có sẵn cho view sao lưu.

## Ví dụ

View cần truyền phải có cùng loại như {{domxref("ReadableStreamBYOBRequest.view")}}, có cùng bộ nhớ đệm bên dưới và byte offset, và có byteLength bằng hoặc nhỏ hơn.

Ví dụ, chúng ta có thể định nghĩa view và phản hồi như bên dưới:

```js
const v = controller.byobRequest.view;
bytesRead = socket.readInto(v.buffer, v.byteOffset, v.byteLength);
byobRequest.respondWithNewView(
  byobRequest.view.subarray(v.byteOffset, bytesRead),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
