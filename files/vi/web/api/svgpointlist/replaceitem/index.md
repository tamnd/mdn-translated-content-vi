---
title: "SVGPointList: replaceItem() method"
short-title: replaceItem()
slug: Web/API/SVGPointList/replaceItem
page-type: web-api-instance-method
browser-compat: api.SVGPointList.replaceItem
---

{{APIRef("SVG")}}

Phương thức **`replaceItem()`** của giao diện {{domxref("SVGPointList")}} thay thế một {{domxref("DOMPoint")}} trong danh sách.

## Cú pháp

```js-nolint
replaceItem(obj, index)
```

### Tham số

- `obj`
  - : Một đối tượng {{domxref("DOMPoint")}} chứa tọa độ của điểm cần chèn.
- `index`
  - : Chỉ mục của phần tử cần thay thế.

### Giá trị trả về

Đối tượng {{domxref("DOMPoint")}} mới.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.
- `IndexSizeError` {{domxref("DOMException")}}
  - : Được ném ra nếu chỉ mục được truyền vào lớn hơn số lượng phần tử trong danh sách.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Một {{domxref("DOMPoint")}} mới được tạo, sau đó thay thế điểm tại chỉ mục `1` (phần tử thứ hai trong danh sách).

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
console.log(example.points.replaceItem(point, 1));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
