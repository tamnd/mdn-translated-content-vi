---
title: "HTMLInputElement: thuộc tính placeholder"
short-title: placeholder
slug: Web/API/HTMLInputElement/placeholder
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.placeholder
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`placeholder`** của giao diện {{DOMxRef("HTMLInputElement")}} đại diện cho một gợi ý cho người dùng về những gì có thể nhập vào điều khiển. Nó phản ánh thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) của phần tử {{htmlelement("input")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const inputElement = document.getElementById("phone");
console.log(input.placeholder);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{DOMXref("HTMLInputElement.value")}}
- Phần tử giả {{cssxref("::placeholder")}}
- Lớp giả {{CSSXref(":placeholder-shown")}}
