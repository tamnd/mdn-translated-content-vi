---
title: "SVGSVGElement: phương thức createSVGTransformFromMatrix()"
short-title: createSVGTransformFromMatrix()
slug: Web/API/SVGSVGElement/createSVGTransformFromMatrix
page-type: web-api-instance-method
browser-compat: api.SVGSVGElement.createSVGTransformFromMatrix
---

{{APIRef("SVG")}}

Phương thức `createSVGTransformFromMatrix()` của giao diện {{domxref("SVGSVGElement")}} tạo một đối tượng {{domxref("SVGTransform")}} bên ngoài bất kỳ cây tài liệu nào, dựa trên đối tượng {{domxref("DOMMatrix")}} đã cho.

## Cú pháp

```js-nolint
createSVGTransformFromMatrix(matrix)
```

### Tham số

- `matrix`
  - : Một đối tượng {{domxref("DOMMatrix")}} biểu thị ma trận ban đầu cho phép biến đổi.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}, được khởi tạo thành phép biến đổi ma trận đã cho. Đây là phép biến đổi `matrix()` nếu `matrix` là [2D](/en-US/docs/Web/API/DOMMatrixReadOnly/is2D), và là phép biến đổi `matrix3d()` trong các trường hợp khác.

## Ví dụ

### Tạo phép biến đổi từ ma trận

```html
<svg id="exampleSVG" width="200" height="200">
  <rect id="exampleRect" x="50" y="50" width="100" height="50" fill="blue" />
</svg>
```

```js
const svgElement = document.getElementById("exampleSVG");
const rectElement = document.getElementById("exampleRect");

// Tạo ma trận mới
const matrix = svgElement.createSVGMatrix();
matrix.a = 1; // Tỉ lệ x
matrix.d = 1; // Tỉ lệ y
matrix.e = 50; // Dịch chuyển x
matrix.f = 50; // Dịch chuyển y

// Tạo SVGTransform mới từ ma trận
const transform = svgElement.createSVGTransformFromMatrix(matrix);

// Áp dụng phép biến đổi cho hình chữ nhật
rectElement.transform.baseVal.appendItem(transform);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
- {{domxref("DOMMatrix")}}
