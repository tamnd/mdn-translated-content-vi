---
title: "Blob: phương thức stream()"
short-title: stream()
slug: Web/API/Blob/stream
page-type: web-api-instance-method
browser-compat: api.Blob.stream
---

{{APIRef("File API")}}{{AvailableInWorkers}}

Phương thức **`stream()`** của giao diện {{domxref("Blob")}} trả về một {{domxref("ReadableStream")}} mà khi đọc sẽ trả về dữ liệu chứa trong `Blob`.

## Cú pháp

```js-nolint
stream()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("ReadableStream")}} mà khi đọc sẽ trả về nội dung của `Blob`.

## Lưu ý sử dụng

Với `stream()` và {{domxref("ReadableStream")}} được trả về, bạn có một số khả năng hữu ích:

- Gọi {{domxref("ReadableStream.getReader", "getReader()")}} trên stream được trả về để lấy một đối tượng dùng đọc dữ liệu từ blob bằng các phương thức như {{domxref("ReadableStreamDefaultReader.read", "read()")}} của giao diện {{domxref("ReadableStreamDefaultReader")}}.
- Gọi phương thức {{domxref("ReadableStream.pipeTo", "pipeTo()")}} của stream được trả về để dẫn dữ liệu của blob vào một writable stream.
- Gọi phương thức {{domxref("ReadableStream.tee", "tee()")}} của stream được trả về để **nhân đôi** readable stream. Phương thức này trả về một mảng chứa hai đối tượng `ReadableStream` mới, mỗi đối tượng đều trả về nội dung của `Blob`.
- Gọi phương thức {{domxref("ReadableStream.pipeThrough", "pipeThrough()")}} của stream được trả về để dẫn stream đi qua một {{domxref("TransformStream")}} hoặc bất kỳ cặp readable và writable nào khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Response.body")}}
- [Streams API](/en-US/docs/Web/API/Streams_API)
