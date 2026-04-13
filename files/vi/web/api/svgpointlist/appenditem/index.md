---
title: "SVGPointList: appendItem() method"
short-title: appendItem()
slug: Web/API/SVGPointList/appendItem
page-type: web-api-instance-method
browser-compat: api.SVGPointList.appendItem
---

{{APIRef("SVG")}}

Phương thức **`appendItem()`** của giao diện {{domxref("SVGPointList")}} thêm một {{domxref("DOMPoint")}} vào cuối danh sách.

## Cú pháp

```js-nolint
appendItem(obj)
```

### Tham số

- `obj`
  - : Một đối tượng {{domxref("DOMPoint")}} chứa tọa độ của điểm cần thêm vào.

### Giá trị trả về

Đối tượng {{domxref("DOMPoint")}} đã được thêm vào.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Một {{domxref("DOMPoint")}} mới được tạo và thêm vào danh sách.

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
console.log(example.points.appendItem(point));
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
