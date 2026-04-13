---
title: "TextEncoder: encode() method"
short-title: encode()
slug: Web/API/TextEncoder/encode
page-type: web-api-instance-method
browser-compat: api.TextEncoder.encode
---

{{APIRef("Encoding API")}}{{AvailableInWorkers}}

Phương thức **`TextEncoder.encode()`** nhận một chuỗi làm đầu vào và trả về một {{jsxref("Global_Objects/Uint8Array", "Uint8Array")}} chứa chuỗi đã được {{glossary("character encoding", "mã hóa")}} bằng {{glossary("UTF-8")}}.

## Cú pháp

```js-nolint
encode(string)
```

### Tham số

- `string`
  - : Một chuỗi chứa văn bản cần mã hóa.

### Giá trị trả về

Một đối tượng {{jsxref("Uint8Array")}} chứa mã hóa UTF-8 của chuỗi đầu vào.

## Ví dụ

```html
<p class="source">Sample paragraph.</p>
<p class="result">Encoded result:</p>
```

```js
const sourcePara = document.querySelector(".source");
const resultPara = document.querySelector(".result");
const string = sourcePara.textContent;

const textEncoder = new TextEncoder();

const encoded = textEncoder.encode(string);
resultPara.textContent = `${resultPara.textContent} ${encoded}`;
```

{{EmbedLiveSample('Ví dụ')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("TextEncoder")}} mà nó thuộc về.
