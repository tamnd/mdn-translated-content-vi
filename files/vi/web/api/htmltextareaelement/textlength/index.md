---
title: "HTMLTextAreaElement: textLength property"
short-title: textLength
slug: Web/API/HTMLTextAreaElement/textLength
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.textLength
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`textLength`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} là một số nguyên không âm đại diện cho số ký tự, tính theo {{glossary("UTF-16", "UTF-16 code units")}}, của giá trị phần tử {{htmlelement("textarea")}}. Đây là cách rút gọn để truy cập {{jsxref("String/length", "length")}} trên thuộc tính {{domxref("HTMLTextAreaElement/value", "value")}} của nó.

## Giá trị

Một số nguyên không âm.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
console.log(textArea.textLength);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.rows")}}
- {{DOMXref("HTMLTextAreaElement.cols")}}
- {{DOMXref("HTMLTextAreaElement.minLength")}}
- {{DOMXref("HTMLTextAreaElement.maxLength")}}
