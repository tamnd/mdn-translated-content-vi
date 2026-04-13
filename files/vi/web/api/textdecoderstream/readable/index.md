---
title: "TextDecoderStream: readable property"
short-title: readable
slug: Web/API/TextDecoderStream/readable
page-type: web-api-instance-property
browser-compat: api.TextDecoderStream.readable
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("TextDecoderStream")}} trả về {{domxref("ReadableStream")}} phát ra các chuỗi đã được giải mã.

## Giá trị

Một {{domxref("ReadableStream")}}.

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
console.log(output); // 你好世界
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TransformStream.readable")}}
