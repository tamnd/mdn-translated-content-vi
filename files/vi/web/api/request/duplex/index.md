---
title: "Request: thuộc tính duplex"
short-title: duplex
slug: Web/API/Request/duplex
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Request.duplex
---

{{APIRef("Fetch API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`duplex`** của giao diện {{domxref("Request")}} trả về chế độ duplex của request, xác định việc trình duyệt có phải gửi toàn bộ request trước khi xử lý response hay không.

## Giá trị

Một chuỗi với giá trị khả dĩ sau:

- `"half"`
  - : Trình duyệt phải gửi toàn bộ request trước khi xử lý response.

## Ghi chú

Mặc dù `duplex` có thể được truyền vào như một tùy chọn khi tạo `Request`, hiện tại nó không được hiển thị như một thuộc tính có thể đọc trên đối tượng `Request` kết quả trong mọi trình duyệt.

## Ví dụ

### Kiểm tra chế độ duplex của request

```js
const stream = new ReadableStream({
  /* ... */
});
const request = new Request("/upload", {
  method: "POST",
  body: stream,
  duplex: "half", // Bắt buộc với request streaming
});

console.log(request.duplex); // "half"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
- {{domxref("Request.Request", "Request()")}} constructor
- [`RequestInit.duplex`](/en-US/docs/Web/API/RequestInit#duplex) trong các tùy chọn request
- [Consuming a fetch as a stream](/en-US/docs/Web/API/Streams_API/Using_readable_streams#consuming_a_fetch_as_a_stream)
