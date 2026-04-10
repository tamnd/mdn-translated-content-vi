---
title: "ReadableStreamDefaultReader: closed property"
short-title: closed
slug: Web/API/ReadableStreamDefaultReader/closed
page-type: web-api-instance-property
browser-compat: api.ReadableStreamDefaultReader.closed
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

**`closed`** là thuộc tính chỉ đọc của giao diện
{{domxref("ReadableStreamDefaultReader")}} trả về một
{{jsxref("Promise")}} được hoàn tất khi luồng đóng, hoặc bị từ chối nếu
luồng phát sinh lỗi hoặc khóa của trình đọc bị giải phóng. Thuộc tính này cho phép bạn
viết mã phản hồi khi quá trình streaming kết thúc.

## Giá trị

Một {{jsxref("Promise")}}.

## Ví dụ

Trong đoạn mã này, một trình đọc đã được tạo trước đó được truy vấn để xem luồng có đã
đóng hay chưa. Khi nó đóng, promise được hoàn tất và thông điệp được ghi vào console.

```js
reader.closed.then(() => {
  console.log("reader closed");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ReadableStreamDefaultReader.ReadableStreamDefaultReader", "ReadableStreamDefaultReader()")}} bộ khởi tạo
- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
