---
title: "HTMLSelectElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLSelectElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.name
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`name`** của giao diện {{domxref("HTMLSelectElement")}} cho biết tên của phần tử {{HTMLElement("select")}}. Nó phản ánh thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/select#name) của phần tử.

## Giá trị

Một chuỗi đại diện cho tên của phần tử.

## Ví dụ

```js
const selectElement = document.querySelector("#planets");
console.log(`Element's name: ${selectElement.name}`);
selectElement.name = "galaxies"; // sets or updates the element's name
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLSelectElement.value")}}
- {{domxref("HTMLSelectElement.selectedIndex")}}
- {{domxref("HTMLSelectElement.options")}}
