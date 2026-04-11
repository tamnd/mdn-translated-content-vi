---
title: "SVGTransformList: createSVGTransformFromMatrix() method"
short-title: createSVGTransformFromMatrix()
slug: Web/API/SVGTransformList/createSVGTransformFromMatrix
page-type: web-api-instance-method
browser-compat: api.SVGTransformList.createSVGTransformFromMatrix
---

{{APIRef("SVG")}}

Phương thức `createSVGTransformFromMatrix()` của giao diện {{domxref("SVGTransformList")}} tạo một đối tượng {{domxref("SVGTransform")}} được khởi tạo với biến đổi kiểu `SVG_TRANSFORM_MATRIX` và có các giá trị là ma trận đã cho.

Các giá trị từ tham số ma trận được sao chép; tham số ma trận không được áp dụng trực tiếp làm `SVGTransform::matrix`.

## Cú pháp

```js-nolint
createSVGTransformFromMatrix(matrix)
```

### Tham số

- `matrix`
  - : Một đối tượng {{domxref("DOMMatrix")}}; ma trận biến đổi.

### Giá trị trả về

Một đối tượng {{domxref("SVGTransform")}}.

## Ví dụ

### Tạo biến đổi từ ma trận

```html
<svg width="200" height="200">
  <rect width="100" height="100" fill="blue" />
</svg>
```

```js
const svgElement = document.querySelector("svg");
const rectElement = svgElement.querySelector("rect");

// Access the transform list of the <rect> element
const transformList = rectElement.transform.baseVal;

// Create a DOMMatrix object for a rotation transformation
const rotationMatrix = new DOMMatrix();
rotationMatrix.a = Math.cos(Math.PI / 4); // 45-degree rotation
rotationMatrix.b = Math.sin(Math.PI / 4);
rotationMatrix.c = -Math.sin(Math.PI / 4);
rotationMatrix.d = Math.cos(Math.PI / 4);

// Create an SVGTransform object from the matrix
const svgTransform = transformList.createSVGTransformFromMatrix(rotationMatrix);

// Append the new transformation to the transform list
transformList.appendItem(svgTransform);

console.dir(svgTransform); // Output: SVGTransform { type: 1, matrix: SVGMatrix, angle: 0 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform")}}
- {{domxref("DOMMatrix")}}
