---
title: "SVGPointList: initialize() method"
short-title: initialize()
slug: Web/API/SVGPointList/initialize
page-type: web-api-instance-method
browser-compat: api.SVGPointList.initialize
---

{{APIRef("SVG")}}

Phương thức **`initialize()`** của giao diện {{domxref("SVGPointList")}} xóa danh sách rồi thêm một đối tượng {{domxref("DOMPoint")}} mới duy nhất vào danh sách.

## Cú pháp

```js-nolint
initialize(obj)
```

### Tham số

- `obj`
  - : Một đối tượng {{domxref("DOMPoint")}} chứa tọa độ của điểm cần thêm khi danh sách được khởi tạo.

### Giá trị trả về

Đối tượng {{domxref("DOMPoint")}} đã được thêm vào.

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu danh sách là chỉ đọc.

## Ví dụ

Ví dụ sau cho thấy SVG chứa {{SVGElement("polyline")}} với năm cặp tọa độ. Trả về {{domxref("SVGPointList.length")}} cho giá trị `5`. Sau khi gọi `initialize()`, trả về {{domxref("SVGPointList.length")}} cho giá trị `1`.

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
console.log(example.points.length); // 5;
const point = document.getElementById("svg").createSVGPoint();
example.points.initialize(point);
console.log(example.points.length); // 1
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
