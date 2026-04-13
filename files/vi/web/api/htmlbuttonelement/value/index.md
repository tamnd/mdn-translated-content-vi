---
title: "HTMLButtonElement: thuộc tính value"
short-title: value
slug: Web/API/HTMLButtonElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.value
---

{{APIRef("HTML DOM")}}

Thuộc tính **`value`** của giao diện {{DOMxRef("HTMLButtonElement")}} đại diện cho giá trị của phần tử {{htmlelement("button")}} dưới dạng chuỗi, hoặc chuỗi rỗng nếu chưa đặt giá trị. Nó phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/button#value) của phần tử.

## Giá trị

Một chuỗi chứa giá trị của phần tử {{htmlelement("button")}}.

## Ví dụ

```js
const buttonElement = document.getElementById("given-name");
console.log(`value: ${buttonElement.value}`);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("button")}}
- {{DOMXref("HTMLButtonElement.type")}}
- {{DOMXref("HTMLButtonElement.labels")}}
