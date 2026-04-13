---
title: "DecompressionStream: Thuộc tính readable"
short-title: readable
slug: Web/API/DecompressionStream/readable
page-type: web-api-instance-property
browser-compat: api.DecompressionStream.readable
---

{{APIRef("Compression Streams API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("DecompressionStream")}} trả về một {{domxref("ReadableStream")}} phát ra dữ liệu đã giải nén dưới dạng các khối {{jsxref("Uint8Array")}}.

## Giá trị

Một {{domxref("ReadableStream")}}.

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

- {{domxref("TransformStream.readable")}}
