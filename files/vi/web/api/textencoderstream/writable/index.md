---
title: "TextEncoderStream: writable property"
short-title: writable
slug: Web/API/TextEncoderStream/writable
page-type: web-api-instance-property
browser-compat: api.TextEncoderStream.writable
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`writable`** của giao diện {{domxref("TextEncoderStream")}} trả về một {{domxref("WritableStream")}} chấp nhận các chuỗi để mã hóa thành dữ liệu nhị phân.

## Giá trị

Một {{domxref("WritableStream")}}.

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

- {{domxref("TransformStream.writable")}}
