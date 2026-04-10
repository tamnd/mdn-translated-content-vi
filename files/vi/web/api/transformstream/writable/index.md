---
title: "TransformStream: thuộc tính writable"
short-title: writable
slug: Web/API/TransformStream/writable
page-type: web-api-instance-property
browser-compat: api.TransformStream.writable
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("TransformStream")}} trả về phiên bản {{domxref("WritableStream")}} được điều khiển bởi `TransformStream` này. Luồng này chấp nhận dữ liệu đầu vào sẽ được chuyển đổi và phát ra luồng `readable`.

## Giá trị

Một {{domxref("WritableStream")}}.

## Ví dụ

Ví dụ này tạo `TransformStream` chuyển đổi tất cả văn bản đầu vào thành chữ in hoa. Nó ghi một số văn bản vào luồng `writable`, sau đó đọc văn bản đã chuyển đổi từ luồng `readable`.

```js
const stream = new TransformStream({
  transform(chunk, controller) {
    controller.enqueue(chunk.toUpperCase());
  },
});

// Write data to be transformed
const writer = stream.writable.getWriter();
writer.write("hello ");
writer.write("world");
writer.close();

// Read transformed data
const reader = stream.readable.getReader();
let done = false;
let output = "";
while (!done) {
  const result = await reader.read();
  if (result.value) {
    output += result.value;
  }
  done = result.done;
}
console.log(output); // HELLO WORLD
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
