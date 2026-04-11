---
title: "HTMLButtonElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLButtonElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.type
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLButtonElement")}} là một chuỗi cho biết kiểu hành vi của phần tử {{HTMLElement("button")}}.

Nó phản ánh thuộc tính [`type`](/en-US/docs/Web/HTML/Reference/Elements/button#type) của phần tử {{HTMLElement("button")}}.

## Giá trị

Một chuỗi đại diện cho kiểu.

Các giá trị có thể được liệt kê trong phần [button types](/en-US/docs/Web/HTML/Reference/Elements/button#type) của thuộc tính.

## Ví dụ

### HTML

```html
<button id="button" type="reset">type</button>
```

### JavaScript

```js
const buttonElement = document.querySelector("#button");
console.log(buttonElement.type); // "reset"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.type")}} property
- {{domxref("HTMLInputElement.type")}} property
