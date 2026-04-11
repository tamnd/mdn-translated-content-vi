---
title: "HTMLTextAreaElement: required property"
short-title: required
slug: Web/API/HTMLTextAreaElement/required
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.required
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`required`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} chỉ định rằng người dùng phải nhập giá trị trước khi gửi biểu mẫu. Nó phản ánh thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/textarea#required) của phần tử {{htmlelement("textarea")}}.

## Giá trị

Một giá trị logic.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
console.log(textArea.required);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.validity")}}
- Pseudo-class {{cssxref(":required")}}
