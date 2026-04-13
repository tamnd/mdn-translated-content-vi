---
title: "TextEncoderStream: TextEncoderStream() constructor"
short-title: TextEncoderStream()
slug: Web/API/TextEncoderStream/TextEncoderStream
page-type: web-api-constructor
browser-compat: api.TextEncoderStream.TextEncoderStream
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`TextEncoderStream()`** tạo một đối tượng {{domxref("TextEncoderStream")}} mới, được sử dụng để chuyển đổi một luồng chuỗi thành các byte sử dụng mã hóa UTF-8.

## Cú pháp

```js-nolint
new TextEncoderStream()
```

### Tham số

Không có.

## Ví dụ

Trong ví dụ này, một `TextEncoderStream` được tạo và sử dụng để tải lên một luồng văn bản.

```js
const body = textStream.pipeThrough(new TextEncoderStream());
fetch("/dest", {
  method: "POST",
  body,
  headers: { "Content-Type": "text/plain; charset=UTF-8" },
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
