---
title: "HTMLTextAreaElement: name property"
short-title: name
slug: Web/API/HTMLTextAreaElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.name
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLTextAreaElement")}} cho biết tên của phần tử {{HTMLElement("textarea")}}. Nó phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/textarea#name) của phần tử.

## Giá trị

Một chuỗi đại diện cho tên của phần tử.

## Ví dụ

```js
const textareaElement = document.querySelector("#message");
console.log(`Element's name: ${textareaElement.name}`);
textareaElement.name = "response"; // sets or updates the element's name
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.value")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
