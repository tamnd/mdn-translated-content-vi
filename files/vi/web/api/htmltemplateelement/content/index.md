---
title: "HTMLTemplateElement: thuộc tính content"
short-title: content
slug: Web/API/HTMLTemplateElement/content
page-type: web-api-instance-property
browser-compat: api.HTMLTemplateElement.content
---

{{APIRef("Web Components")}}

Thuộc tính **`content`** của giao diện {{domxref("HTMLTemplateElement")}} trả về nội dung template của phần tử `<template>` dưới dạng một {{domxref("DocumentFragment")}}. {{domxref("Node/ownerDocument", "ownerDocument")}} của nội dung này là một {{domxref("Document")}} riêng biệt với document chứa chính phần tử `<template>` - trừ khi document chứa nó vốn được tạo ra để lưu nội dung template.

Các phương thức {{domxref("Node.cloneNode()")}} và {{domxref("Document.importNode()")}} đều tạo ra một bản sao của một nút. Khác biệt là `importNode()` sao chép nút trong ngữ cảnh của document đang gọi, còn `cloneNode()` dùng document của nút đang được sao chép. Ngữ cảnh document xác định {{domxref("CustomElementRegistry")}} dùng để tạo bất kỳ custom element nào. Vì lý do này, hãy dùng `document.importNode()` để sao chép fragment `content` sao cho các phần tử con tùy biến được tạo bằng các định nghĩa trong document hiện tại, thay vì document riêng sở hữu nội dung template. Xem các ví dụ trên trang {{domxref("Node.cloneNode()")}} để biết thêm chi tiết.

## Giá trị

Một {{domxref("DocumentFragment")}}.

## Ví dụ

### Sử dụng importNode() với nội dung template

```js
const templateElement = document.querySelector("#foo");
const documentFragment = document.importNode(templateElement.content, true);
// Now you can insert the documentFragment into the DOM
```

### ownerDocument của nội dung template

Với các phần tử `<template>` được tạo trong ngữ cảnh của một tài liệu HTML bình thường, `ownerDocument` của `content` là một document riêng biệt, vừa được tạo mới:

```js
const template = document.createElement("template");
console.log(template.content.ownerDocument === document); // false
console.log(template.content.ownerDocument.URL); // "about:blank"
```

Nếu phần tử `<template>` được tạo trong ngữ cảnh của một document cũng được tạo ra để lưu nội dung template, thì `ownerDocument` của `content` sẽ giống với document chứa nó:

```js
const template1 = document.createElement("template");
const docForTemplate = template1.content.ownerDocument;
const template2 = docForTemplate.createElement("template");
console.log(template2.content.ownerDocument === docForTemplate); // true
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLTemplateElement")}}
