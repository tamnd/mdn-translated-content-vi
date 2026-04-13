---
title: "SVGPointList: getItem() method"
short-title: getItem()
slug: Web/API/SVGPointList/getItem
page-type: web-api-instance-method
browser-compat: api.SVGPointList.getItem
---

{{APIRef("SVG")}}

Phương thức **`getItem()`** của giao diện {{domxref("SVGPointList")}} lấy một phần tử từ danh sách tại chỉ mục được chỉ định.

## Cú pháp

```js-nolint
getItem(index)
```

### Tham số

- `index`
  - : Chỉ mục của phần tử cần trả về.

### Giá trị trả về

Một đối tượng {{domxref("DOMPoint")}}.

### Ngoại lệ

- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu chỉ mục được truyền vào lớn hơn số lượng phần tử trong danh sách.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. {{domxref("DOMPoint")}} tại chỉ mục `0`.

```html
<svg id="svg" viewBox="-10 -10 120 120" xmlns="http://www.w3.org/2000/svg">
  <polyline
    id="example"
    stroke="black"
    fill="none"
    points="50,0 21,90 98,35 2,35 79,90" />
</svg>
```

```js
const example = document.getElementById("example");
console.log(example.points.getItem(0));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
