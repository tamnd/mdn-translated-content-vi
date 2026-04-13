---
title: "TextDecoderStream: ignoreBOM property"
short-title: ignoreBOM
slug: Web/API/TextDecoderStream/ignoreBOM
page-type: web-api-instance-property
browser-compat: api.TextDecoderStream.ignoreBOM
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`ignoreBOM`** của giao diện {{domxref("TextDecoderStream")}} là giá trị {{jsxref('Boolean')}} cho biết [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) có được đưa vào đầu ra hay bị bỏ qua hay không.

## Giá trị

`true` nếu [byte order mark](https://www.w3.org/International/questions/qa-byte-order-mark) sẽ được đưa vào văn bản đã giải mã; `false` nếu nó sẽ bị bỏ qua khi giải mã và bị loại bỏ.

## Ví dụ

```js
stream = new TextDecoderStream();
console.log(stream.ignoreBOM); // returns false
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
