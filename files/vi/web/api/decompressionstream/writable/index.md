---
title: "DecompressionStream: Thuộc tính writable"
short-title: writable
slug: Web/API/DecompressionStream/writable
page-type: web-api-instance-property
browser-compat: api.DecompressionStream.writable
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("DecompressionStream")}} trả về một {{domxref("WritableStream")}} chấp nhận dữ liệu đã nén để giải nén, dưới dạng các khối {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}.

## Giá trị

Một {{domxref("WritableStream")}}.

## Ví dụ

Ví dụ này tạo một `DecompressionStream` thực hiện giải nén gzip. Nó ghi một số dữ liệu nhị phân đã nén vào stream `writable`, sau đó đọc dữ liệu đã giải nén từ stream `readable` và giải mã thành văn bản UTF-8.

```js
const stream = new DecompressionStream("gzip");

// Ghi dữ liệu cần nén
const data = Uint8Array.fromBase64(
  "H4sIAAAAAAAAE/NIzcnJ11Eozy/KSVEEAObG5usNAAAA",
);
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
console.log(new TextDecoder().decode(new Uint8Array(output))); // Hello, world!
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TransformStream.writable")}}
