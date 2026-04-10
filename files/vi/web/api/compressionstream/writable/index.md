---
title: "CompressionStream: Thuộc tính writable"
short-title: writable
slug: Web/API/CompressionStream/writable
page-type: web-api-instance-property
browser-compat: api.CompressionStream.writable
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("CompressionStream")}} trả về một {{domxref("WritableStream")}} chấp nhận dữ liệu chưa nén để nén, dưới dạng các khối {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}.

## Giá trị

Một {{domxref("WritableStream")}}.

## Ví dụ

Ví dụ này tạo một `CompressionStream` thực hiện nén gzip. Nó ghi một số dữ liệu nhị phân vào stream `writable`, sau đó đọc dữ liệu đã nén từ stream `readable`.

```js
const stream = new CompressionStream("gzip");

// Ghi dữ liệu cần nén
const data = new TextEncoder().encode("Hello, world!");
const writer = stream.writable.getWriter();
writer.write(data);
writer.close();

// Đọc dữ liệu đã nén
const reader = stream.readable.getReader();
let done = false;
let output = [];
while (!done) {
  const result = await reader.read();
  if (result.value) {
    output.push(...result.value);
  }
  done = result.done;
}
console.log(new Uint8Array(output).toBase64()); // H4sIAAAAAAAAE/NIzcnJ11Eozy/KSVEEAObG5usNAAAA
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TransformStream.writable")}}
