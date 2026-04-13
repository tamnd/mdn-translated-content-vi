---
title: "TextEncoderStream: encoding property"
short-title: encoding
slug: Web/API/TextEncoderStream/encoding
page-type: web-api-instance-property
browser-compat: api.TextEncoderStream.encoding
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`encoding`** của giao diện {{domxref("TextEncoderStream")}} trả về một chuỗi chứa tên của thuật toán mã hóa được sử dụng bởi đối tượng `TextEncoderStream` hiện tại.

## Giá trị

Một chuỗi chứa dữ liệu được mã hóa `utf-8`.

## Ví dụ

Ví dụ sau đây minh họa cách lấy `encoding` từ một đối tượng `TextEncoderStream`.

```js
const stream = new TextEncoderStream();
console.log(stream.encoding);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
