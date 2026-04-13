---
title: "ReadableStreamBYOBReader: phương thức cancel()"
short-title: cancel()
slug: Web/API/ReadableStreamBYOBReader/cancel
page-type: web-api-instance-method
browser-compat: api.ReadableStreamBYOBReader.cancel
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`cancel()`** của giao diện {{domxref("ReadableStreamBYOBReader")}} trả về một {{jsxref("Promise")}} được giải quyết khi stream bị hủy.
Gọi phương thức này báo hiệu rằng consumer không còn quan tâm đến stream.

> [!NOTE]
> Nếu reader đang hoạt động, phương thức `cancel()` hoạt động giống như phương thức tương ứng của stream liên quan ({{domxref("ReadableStream.cancel()")}}).

## Cú pháp

```js-nolint
cancel()
cancel(reason)
```

### Tham số

- `reason` {{optional_inline}}
  - : Lý do hủy mà con người có thể đọc được. Nguồn bên dưới có thể hoặc không sử dụng nó.

### Giá trị trả về

Một {{jsxref("Promise")}}, hoàn thành với giá trị được cho trong tham số `reason`.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Đối tượng nguồn không phải là `ReadableStreamBYOBReader`, hoặc stream không có chủ.

## Ví dụ

Mã ví dụ này gọi phương thức `cancel()` khi nút được nhấn, truyền chuỗi "user choice" làm lý do.
Promise được giải quyết khi việc hủy hoàn tất.

```js
button.addEventListener("click", () => {
  reader.cancel("user choice").then(() => console.log(`cancel complete`));
});
```

Lưu ý rằng mã này có thể thấy đang chạy trong ví dụ [Sử dụng readable byte streams](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams#result) (nhấn nút **Cancel stream**).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("ReadableStreamBYOBReader.ReadableStreamBYOBReader", "ReadableStreamBYOBReader()")}}
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
