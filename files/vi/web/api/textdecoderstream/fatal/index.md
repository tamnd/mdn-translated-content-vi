---
title: "TextDecoderStream: fatal property"
short-title: fatal
slug: Web/API/TextDecoderStream/fatal
page-type: web-api-instance-property
browser-compat: api.TextDecoderStream.fatal
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`fatal`** của giao diện {{domxref("TextDecoderStream")}} là giá trị {{jsxref("boolean")}} cho biết chế độ lỗi của đối tượng `TextDecoderStream` có được đặt thành `fatal` hay không.

Nếu thuộc tính là `true`, bộ giải mã sẽ ném {{jsxref("TypeError")}} nếu gặp dữ liệu không hợp lệ khi giải mã.
Nếu `false`, bộ giải mã sẽ thay thế dữ liệu không hợp lệ bằng ký tự thay thế `U+FFFD` (&#xFFFD;).
Giá trị của thuộc tính được đặt trong [hàm khởi tạo `TextDecoderStream()`](/en-US/docs/Web/API/TextDecoderStream/TextDecoderStream).

## Giá trị

Giá trị {{jsxref("boolean")}} sẽ trả về `true` nếu chế độ lỗi được đặt thành "fatal".
Ngược lại nó trả về `false`, cho biết chế độ lỗi là "replacement".

## Ví dụ

```js
stream = new TextDecoderStream();
console.log(stream.fatal); // returns false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
