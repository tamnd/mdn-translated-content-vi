---
title: "ReadableStreamBYOBReader: hàm khởi tạo ReadableStreamBYOBReader()"
short-title: ReadableStreamBYOBReader()
slug: Web/API/ReadableStreamBYOBReader/ReadableStreamBYOBReader
page-type: web-api-constructor
browser-compat: api.ReadableStreamBYOBReader.ReadableStreamBYOBReader
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Hàm khởi tạo **`ReadableStreamBYOBReader()`** tạo và trả về một đối tượng `ReadableStreamBYOBReader`.

> [!NOTE]
> Thông thường bạn sẽ không dùng hàm khởi tạo này trực tiếp;
> thay vào đó, bạn sẽ dùng phương thức {{domxref("ReadableStream.getReader()")}} với đối số `"byob"`.

## Cú pháp

```js-nolint
new ReadableStreamBYOBReader(stream)
```

### Tham số

- `stream`
  - : {{domxref("ReadableStream")}} cần đọc.

### Giá trị trả về

Một đối tượng {{domxref("ReadableStreamBYOBReader")}}.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu tham số `stream` được cung cấp không phải là {{domxref("ReadableStream")}}, hoặc nó đã bị khóa để đọc bởi một reader khác, hoặc controller của stream không phải là {{domxref("ReadableByteStreamController")}}.

## Ví dụ

Hàm khởi tạo hiếm khi được gọi trực tiếp.
Thay vào đó, hãy gọi {{domxref("ReadableStream.getReader()")}} như sau:

```js
const reader = stream.getReader({ mode: "byob" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStreamBYOBReader")}}
- [Sử dụng readable byte stream](/en-US/docs/Web/API/Streams_API/Using_readable_byte_streams)
