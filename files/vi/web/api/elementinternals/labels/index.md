---
title: "ElementInternals: labels property"
short-title: labels
slug: Web/API/ElementInternals/labels
page-type: web-api-instance-property
browser-compat: api.ElementInternals.labels
---

{{APIRef("Web Components")}}

Thuộc tính chỉ đọc **`labels`** của giao diện {{domxref("ElementInternals")}} trả về các nhãn được liên kết với phần tử.

## Giá trị

Một {{domxref("NodeList")}} chứa tất cả các phần tử nhãn được liên kết với phần tử này.

## Ví dụ

Ví dụ sau đây hiển thị một thành phần hộp kiểm tùy chỉnh với phần tử {{HTMLElement("label")}} được liên kết với nó.
In giá trị của `labels` ra console sẽ trả về một {{domxref("NodeList")}} với một mục, đại diện cho nhãn này.

```html
<form id="myForm">
  <custom-checkbox id="custom-checkbox"></custom-checkbox>
  <label for="custom-checkbox">Join newsletter</label>
</form>
```

```js
let element = document.getElementById("custom-checkbox");
console.log(element.internals_.label);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
