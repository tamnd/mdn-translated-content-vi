---
title: "TextEncoderStream: readable property"
short-title: readable
slug: Web/API/TextEncoderStream/readable
page-type: web-api-instance-property
browser-compat: api.TextEncoderStream.readable
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`readable`** của giao diện {{domxref("TextEncoderStream")}} trả về một {{domxref("ReadableStream")}} phát ra dữ liệu nhị phân đã được mã hóa dưới dạng các đoạn {{jsxref("Uint8Array")}}.

## Giá trị

Một {{domxref("ReadableStream")}}.

## Ví dụ

Ví dụ này tạo một `TextEncoderStream` để mã hóa chuỗi thành UTF-8. Nó ghi một số chuỗi vào luồng `writable`, sau đó đọc dữ liệu nhị phân đã mã hóa từ luồng `readable`.

```js
const stream = new TextEncoderStream();

// Write data to be encoded
const data = "你好世界";
const writer = stream.writable.getWriter();
writer.write(data);
writer.close();

// Read compressed data
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
console.log(new Uint8Array(output).toBase64()); // 5L2g5aW95LiW55WM
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TransformStream.readable")}}
