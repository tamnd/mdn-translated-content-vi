---
title: "HTMLElement: thuộc tính draggable"
short-title: draggable
slug: Web/API/HTMLElement/draggable
page-type: web-api-instance-property
browser-compat: api.HTMLElement.draggable
---

{{APIRef("HTML Drag and Drop API")}}

Thuộc tính **`draggable`** của giao diện {{domxref("HTMLElement")}} lấy và thiết lập một giá trị {{jsxref("Boolean")}} cho biết phần tử có thể kéo được hay không.

Nó phản ánh giá trị của thuộc tính toàn cục HTML [`draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable).

## Giá trị

Một giá trị {{jsxref("Boolean")}} là `true` nếu phần tử có thể kéo, `false` nếu ngược lại.

## Ví dụ

Ví dụ sau minh họa cách bật hoặc tắt khả năng kéo của phần tử thông qua script:

```js
const draggableElement = document.querySelector(".draggable-element");
const notDraggableElement = document.querySelector(".not-draggable-element");

// enable the target element's ability to drag
draggableElement.draggable = true;

// disable the target element's ability to drag
notDraggableElement.draggable = false;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính toàn cục HTML [`draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable)
- Tổng quan về [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
