---
title: "SVGPointList: insertItemBefore() method"
short-title: insertItemBefore()
slug: Web/API/SVGPointList/insertItemBefore
page-type: web-api-instance-method
browser-compat: api.SVGPointList.insertItemBefore
---

{{APIRef("SVG")}}

Phương thức **`insertItemBefore()`** của giao diện {{domxref("SVGPointList")}} chèn một {{domxref("DOMPoint")}} vào trước một phần tử khác trong danh sách.

## Cú pháp

```js-nolint
insertItemBefore(obj, index)
```

### Tham số

- `obj`
  - : Một đối tượng {{domxref("DOMPoint")}} chứa tọa độ của điểm cần chèn.
- `index`
  - : Chỉ mục của phần tử mà đối tượng cần được chèn trước đó. Nếu chỉ mục được truyền vào lớn hơn độ dài của danh sách, chỉ mục sẽ được đặt bằng độ dài danh sách và phần tử được chèn vào trước phần tử cuối cùng trong danh sách.

### Giá trị trả về

Đối tượng {{domxref("DOMPoint")}} đã được chèn.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Một {{domxref("DOMPoint")}} mới được tạo và chèn vào trước điểm tại chỉ mục `2`.

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
const point = document.getElementById("svg").createSVGPoint();
point.y = 10;
point.x = 10;
console.log(example.points.insertItemBefore(point, 2));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
