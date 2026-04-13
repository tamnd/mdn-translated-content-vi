---
title: "SVGTransform: matrix property"
short-title: matrix
slug: Web/API/SVGTransform/matrix
page-type: web-api-instance-property
browser-compat: api.SVGTransform.matrix
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`matrix`** của giao diện {{domxref("SVGTransform")}} đại diện cho ma trận biến đổi tương ứng với `type` biến đổi.

Trong trường hợp đối tượng `matrix` được thay đổi trực tiếp (tức là, không sử dụng các phương thức trên giao diện `SVGTransform`) thì `type` của `SVGTransform` thay đổi thành `SVG_TRANSFORM_MATRIX`.

- Đối với `SVG_TRANSFORM_MATRIX`, ma trận chứa các giá trị a, b, c, d, e, f do người dùng cung cấp.

- Đối với `SVG_TRANSFORM_TRANSLATE`, e và f đại diện cho lượng dịch chuyển (a=1, b=0, c=0 và d=1).

- Đối với `SVG_TRANSFORM_SCALE`, a và d đại diện cho lượng co giãn (b=0, c=0, e=0 và f=0).

- Đối với `SVG_TRANSFORM_SKEWX` và `SVG_TRANSFORM_SKEWY`, a, b, c và d đại diện cho ma trận sẽ tạo ra độ nghiêng đã cho (e=0 và f=0).

- Đối với `SVG_TRANSFORM_ROTATE`, a, b, c, d, e và f cùng nhau đại diện cho ma trận sẽ tạo ra phép quay đã cho. Khi phép quay quanh điểm tâm (0, 0), e và f sẽ bằng không.

## Giá trị

Một đối tượng {{domxref("DOMMatrix")}} live.

## Ví dụ

### Truy cập và sửa đổi ma trận

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect id="rect" x="50" y="50" width="100" height="100" fill="red" />
</svg>
```

```js
const rect = document.getElementById("rect");
const transformList = rect.transform.baseVal;

// Tạo và thêm phép biến đổi quay
const rotateTransform = rect.ownerSVGElement.createSVGTransform();
rotateTransform.setRotate(30, 100, 100); // Quay 30 độ
transformList.appendItem(rotateTransform);

// Truy cập ma trận
const matrix = transformList.getItem(0).matrix;
console.log(matrix.a, matrix.b, matrix.c, matrix.d, matrix.e, matrix.f);

// Sửa đổi ma trận trực tiếp
matrix.a = 2; // Nhân đôi co giãn ngang
console.log(transformList.getItem(0).type); // Đầu ra: 1 (SVG_TRANSFORM_MATRIX)
```

### Hiểu các loại biến đổi

```html
<svg width="200" height="200" xmlns="http://www.w3.org/2000/svg">
  <rect id="rect" x="50" y="50" width="100" height="100" fill="blue" />
</svg>
```

```js
const rect = document.getElementById("rect");
const transformList = rect.transform.baseVal;

// Áp dụng phép biến đổi dịch chuyển
const translateTransform = rect.ownerSVGElement.createSVGTransform();
translateTransform.setTranslate(20, 30);
transformList.appendItem(translateTransform);

// Truy cập ma trận
const matrix = transformList.getItem(0).matrix;
console.log(matrix.e, matrix.f); // Đầu ra: 20, 30
console.log(transformList.getItem(0).type); // Đầu ra: 2 (SVG_TRANSFORM_TRANSLATE)
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGTransform.type")}}
- {{domxref("DOMMatrix")}}
