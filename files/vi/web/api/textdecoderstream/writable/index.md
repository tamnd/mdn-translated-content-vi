---
title: "TextDecoderStream: writable property"
short-title: writable
slug: Web/API/TextDecoderStream/writable
page-type: web-api-instance-property
browser-compat: api.TextDecoderStream.writable
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("TextDecoderStream")}} trả về {{domxref("WritableStream")}} chấp nhận dữ liệu nhị phân, dưới dạng các chunk {{jsxref("ArrayBuffer")}}, {{jsxref("TypedArray")}}, hoặc {{jsxref("DataView")}} ({{jsxref("SharedArrayBuffer")}} và các view của nó cũng được phép), để giải mã thành chuỗi.

## Giá trị

Một {{domxref("WritableStream")}}.

## Ví dụ

Ví dụ này tạo `TextDecoderStream` giải mã dữ liệu nhị phân được mã hóa UTF-8. Nó ghi một số dữ liệu nhị phân đã mã hóa vào luồng `writable`, sau đó đọc văn bản đã giải mã từ luồng `readable`.

```js
const stream = new TextDecoderStream();

// Write data to be decoded
const data = Uint8Array.fromBase64("5L2g5aW95LiW55WM");
const writer = stream.writable.getWriter();
writer.write(data);
writer.close();

// Read decoded data
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
console.log(output);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TransformStream.writable")}}
