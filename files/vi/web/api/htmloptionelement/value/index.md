---
title: "HTMLOptionElement: thuộc tính value"
short-title: value
slug: Web/API/HTMLOptionElement/value
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.value
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`value`** của giao diện {{DOMxRef("HTMLOptionElement")}} đại diện cho giá trị của phần tử {{htmlelement("option")}} dưới dạng chuỗi, hoặc chuỗi rỗng nếu không có giá trị nào được đặt. Nó phản ánh thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/option#value) của phần tử, nếu có. Ngược lại, nó trả về hoặc đặt nội dung của phần tử, tương tự như thuộc tính {{domxref("Node.textContent","textContent")}}.

## Giá trị

Một chuỗi chứa giá trị thuộc tính `value` nếu có, hoặc nội dung của phần tử.

## Ví dụ

```js
const optionElement = document.querySelector("datalist option:first-of-type");
const oldValue = optionElement.value;
optionElement.value = oldValue.toUpperCase();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{DOMXref("HTMLOptionElement.selected")}}
- {{DOMXref("HTMLOptionElement.defaultSelected")}}
- {{DOMXref("HTMLOptionElement.label")}}
