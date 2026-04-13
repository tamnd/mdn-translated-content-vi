---
title: "ShadowRoot: thuộc tính mode"
short-title: mode
slug: Web/API/ShadowRoot/mode
page-type: web-api-instance-property
browser-compat: api.ShadowRoot.mode
---

{{APIRef("Shadow DOM")}}

Thuộc tính chỉ đọc **`mode`** của {{domxref("ShadowRoot")}} chỉ định chế độ của nó - hoặc `open` hoặc `closed`. Điều này xác định các tính năng nội bộ của shadow root có thể truy cập từ JavaScript hay không.

Khi `mode` của một shadow root là `"closed"`, các chi tiết nội bộ trong phần triển khai của shadow root sẽ không thể truy cập và không thể thay đổi từ JavaScript, tương tự như cách các chi tiết nội bộ trong phần triển khai của, ví dụ, phần tử {{HTMLElement("video")}} không thể truy cập và không thể thay đổi từ JavaScript.

Giá trị của thuộc tính này được đặt bằng thuộc tính `mode` của đối tượng được truyền vào {{domxref("Element.attachShadow()")}}, hoặc bằng thuộc tính [`shadowrootmode`](/en-US/docs/Web/HTML/Reference/Elements/template#shadowrootmode) của phần tử [`<template>`](/en-US/docs/Web/HTML/Reference/Elements/template) khi shadow root được tạo theo kiểu khai báo.

## Giá trị

Một giá trị chuỗi có thể là một trong các giá trị sau:

- `open`
  - : Các phần tử của shadow root có thể truy cập từ JavaScript bên ngoài root.
- `closed`
  - : Các nút bên trong cây shadow đóng không thể được truy cập bởi JavaScript bên ngoài root.

## Ví dụ

```js
// Chúng ta tạo một shadow root đóng, không thể truy cập
let element = document.createElement("div");
element.attachShadow({ mode: "closed" });
console.log(element.shadowRoot); // ghi null vì shadow root là closed

// Chúng ta tạo một shadow root mở, có thể truy cập
let element2 = document.createElement("div");
element2.attachShadow({ mode: "open" });
console.log(`Shadow là ${element2.shadowRoot.mode}`); // ghi "Shadow is open"
element2.shadowRoot.textContent = "Opened shadow"; // Shadow là open, có thể truy cập từ bên ngoài
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
