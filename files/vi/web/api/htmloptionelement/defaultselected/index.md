---
title: "HTMLOptionElement: thuộc tính defaultSelected"
short-title: defaultSelected
slug: Web/API/HTMLOptionElement/defaultSelected
page-type: web-api-instance-property
browser-compat: api.HTMLOptionElement.defaultSelected
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`defaultSelected`** của giao diện {{DOMxRef("HTMLOptionElement")}} xác định trạng thái được chọn mặc định của phần tử. Thuộc tính này phản ánh thuộc tính [`selected`](/en-US/docs/Web/HTML/Reference/Elements/option#selected) của phần tử {{htmlelement("option")}}. Sự hiện diện của thuộc tính `selected` đặt thuộc tính `defaultSelected` thành `true`.

## Giá trị

Một giá trị boolean.

## Ví dụ

```js
const optionElement = document.getElementById("water");
console.log(optionElement.defaultSelected);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("option")}}
- {{DOMxRef("HTMLOptionElement.selected")}}
- {{DOMxRef("HTMLOptionElement.index")}}
- {{DOMxRef("HTMLOptionsCollection")}}
- {{cssxref(":default")}}
