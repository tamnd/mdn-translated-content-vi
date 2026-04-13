---
title: "HTMLMapElement: name property"
short-title: name
slug: Web/API/HTMLMapElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLMapElement.name
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`name`** của {{domxref("HTMLMapElement")}} đại diện cho tên duy nhất của phần tử `<map>`.
Giá trị của nó có thể được sử dụng với thuộc tính `useMap` của phần tử {{HTMLElement("img")}} để tham chiếu đến phần tử `<map>`.

Nếu thuộc tính `id` được đặt trên phần tử {{HTMLElement("map")}}, thì thuộc tính `name` này phải giống với `id` đó.

## Giá trị

Một chuỗi không rỗng không có khoảng trắng.

## Ví dụ

```html
<map name="image-map">
  <area shape="circle" coords="15,15,5" />
</map>
```

```js
const mapElement = document.getElementsByName("image-map")[0];
console.log(mapElement.name); // output: "image-map"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLImageElement.useMap")}}
- Phần tử {{domxref("HTMLAreaElement")}}
