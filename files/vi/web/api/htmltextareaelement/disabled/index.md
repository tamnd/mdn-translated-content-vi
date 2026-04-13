---
title: "HTMLTextAreaElement: disabled property"
short-title: disabled
slug: Web/API/HTMLTextAreaElement/disabled
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.disabled
---

{{ APIRef("HTML DOM")}}

Thuộc tính **`disabled`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} cho biết điều khiển văn bản nhiều dòng này có bị vô hiệu hóa và không thể tương tác hay không. Nó phản ánh thuộc tính [`disabled`](/en-US/docs/Web/HTML/Reference/Elements/textarea#autocomplete) của phần tử {{htmlelement("textarea")}}. Khi `false`, `textarea` này vẫn có thể bị vô hiệu hóa nếu phần tử chứa nó, chẳng hạn như {{htmlelement("fieldset")}}, bị vô hiệu hóa.

## Giá trị

Một giá trị logic.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
if (commentsDisabled) {
  textareaElement.disabled = true;
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.readOnly")}}
