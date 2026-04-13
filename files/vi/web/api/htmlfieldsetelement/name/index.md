---
title: "HTMLFieldSetElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLFieldSetElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLFieldSetElement.name
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLFieldSetElement")}} cho biết tên của phần tử {{HTMLElement("fieldset")}}. Nó phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/fieldset#name) của phần tử.

## Giá trị

Một chuỗi đại diện cho tên của phần tử.

## Ví dụ

```js
const fs = document.querySelector("fieldset");
console.log(`Tên của phần tử: ${fs.name}`);
fs.name = "billing"; // đặt hoặc cập nhật tên của phần tử
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFieldSetElement.elements")}}
- {{domxref("HTMLFieldSetElement.disabled")}}
- {{domxref("HTMLLegendElement")}}
- {{domxref("HTMLFormElement")}}
- {{HTMLElement("fieldset")}}
- {{HTMLElement("legend")}}
- {{HTMLElement("form")}}
