---
title: "HTMLAreaElement: thuộc tính coords"
short-title: coords
slug: Web/API/HTMLAreaElement/coords
page-type: web-api-instance-property
browser-compat: api.HTMLAreaElement.coords
---

{{APIRef("HTML DOM")}}

Thuộc tính **`coords`** của giao diện {{DOMxRef("HTMLAreaElement")}} là một chuỗi phản ánh thuộc tính [`coords`](/en-US/docs/Web/HTML/Reference/Elements/area#coords) của phần tử {{htmlelement("area")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const area = document.getElementById("imageArea");
console.log(area.coords);
area.coords = "0,0,82,126";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
