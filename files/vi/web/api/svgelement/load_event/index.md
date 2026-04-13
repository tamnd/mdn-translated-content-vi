---
title: "SVGElement: sự kiện load"
short-title: load
slug: Web/API/SVGElement/load_event
page-type: web-api-event
browser-compat: api.SVGElement.load_event
---

{{APIRef("SVG")}}

Sự kiện `load` được kích hoạt trên `SVGElement` khi nó được tải trong trình duyệt, ví dụ trong DOM trong trường hợp một `<svg>` được nhúng vào. Về cơ bản nó giống với sự kiện DOM `load` tiêu chuẩn.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("load", (event) => { })

onload = (event) => { }
```

## Loại sự kiện

Một {{domxref("Event")}} thông thường.

## Ví dụ

```js
svgElem.addEventListener("load", () => {
  console.log("SVG loaded.");
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
