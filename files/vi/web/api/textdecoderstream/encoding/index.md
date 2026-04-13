---
title: "TextDecoderStream: encoding property"
short-title: encoding
slug: Web/API/TextDecoderStream/encoding
page-type: web-api-instance-property
browser-compat: api.TextDecoderStream.encoding
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`encoding`** của giao diện {{domxref("TextDecoderStream")}} trả về chuỗi chứa tên của thuật toán mã hóa được sử dụng bởi bộ giải mã cụ thể.

Mã hóa được đặt bởi tham số `label` của [hàm khởi tạo](/en-US/docs/Web/API/TextDecoderStream/TextDecoderStream) và mặc định là `utf-8`.

## Giá trị

Chuỗi chứa tên ASCII viết thường của định dạng mã hóa.

Các giá trị được phép là như nhau với những giá trị được liệt kê trong [`TextDecoder.encoding`](/en-US/docs/Web/API/TextDecoder/encoding) (các nhãn trong [Encoding API Encodings](/en-US/docs/Web/API/Encoding_API/Encodings)).

## Ví dụ

Trả về giá trị của `encoding` từ `TextDecoderStream`.

```js
stream = new TextDecoderStream();
console.log(stream.encoding); // returns the default "utf-8"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
