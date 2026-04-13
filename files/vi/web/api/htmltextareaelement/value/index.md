---
title: "HTMLTextAreaElement: value property"
short-title: value
slug: Web/API/HTMLTextAreaElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.value
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`value`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} đại diện cho giá trị của phần tử {{htmlelement("textarea")}} dưới dạng chuỗi, và sẽ là chuỗi rỗng nếu widget không có nội dung. Nó trả về hoặc đặt giá trị thô chứa trong điều khiển.

## Giá trị

Một chuỗi chứa nội dung của phần tử {{htmlelement("textarea")}}.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
const oldText = textArea.value;
textArea.value = oldText.toUpperCase();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.textLength")}}
- {{DOMXref("HTMLTextAreaElement.labels")}}
- {{DOMXref("HTMLTextAreaElement.selectionStart")}}
- {{DOMXref("HTMLTextAreaElement.selectionEnd")}}
