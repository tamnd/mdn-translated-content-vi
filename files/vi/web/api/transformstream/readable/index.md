---
title: "TransformStream: thuộc tính readable"
short-title: readable
slug: Web/API/TransformStream/readable
page-type: web-api-instance-property
browser-compat: api.TransformStream.readable
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("TransformStream")}} trả về phiên bản {{domxref("ReadableStream")}} được điều khiển bởi `TransformStream` này. Luồng này phát ra dữ liệu đầu ra được chuyển đổi.

## Giá trị

Một {{domxref("ReadableStream")}}.

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
