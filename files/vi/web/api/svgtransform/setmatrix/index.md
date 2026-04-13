---
title: "SVGTransform: setMatrix() method"
short-title: setMatrix()
slug: Web/API/SVGTransform/setMatrix
page-type: web-api-instance-method
browser-compat: api.SVGTransform.setMatrix
---

{{APIRef("SVG")}}

Phương thức `setMatrix()` của giao diện {{domxref("SVGTransform")}} đặt kiểu biến đổi thành `SVG_TRANSFORM_MATRIX`, với tham số `matrix` xác định phép biến đổi mới.

Lưu ý rằng các giá trị từ tham số `matrix` được sao chép, nghĩa là các thay đổi đối với đối tượng `matrix` sau khi gọi phương thức này sẽ không ảnh hưởng đến phép biến đổi.

## Cú pháp

```js-nolint
setMatrix(matrix)
```

### Tham số

- `matrix`
  - : Một đối tượng {{domxref("DOMMatrix")}} live xác định ma trận biến đổi mới cần áp dụng.

### Giá trị trả về

Không có ({{jsxref('undefined')}}).

### Ngoại lệ

- `NoModificationAllowedError` {{domxref("DOMException")}}
  - : Được ném ra nếu thuộc tính hoặc đối tượng {{domxref("SVGTransform")}} là chỉ đọc.

## Ví dụ

### Đặt ma trận biến đổi

```js
// Lấy phần tử SVG và tạo đối tượng transform
const svgElement = document.querySelector("svg");
const transform = svgElement.createSVGTransform();

// Tạo DOMMatrix với các giá trị cụ thể
const matrix = new DOMMatrix();
matrix.a = 1; // Co giãn X
matrix.d = 1; // Co giãn Y
matrix.e = 50; // Dịch chuyển X
matrix.f = 50; // Dịch chuyển Y

// Đặt biến đổi thành ma trận mới
transform.setMatrix(matrix);

console.dir(transform.matrix); // Đầu ra: SVGMatrix { a: 1, b: 0, c: 0, d: 1, e: 50, f: 50 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrix")}}
