---
title: DOMPointReadOnly
slug: Web/API/DOMPointReadOnly
page-type: web-api-interface
browser-compat: api.DOMPointReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Giao diện **`DOMPointReadOnly`** chỉ định các trường tọa độ và phối cảnh được {{domxref("DOMPoint")}} sử dụng để định nghĩa một điểm 2D hoặc 3D trong hệ tọa độ.

Có hai cách để tạo một đối tượng `DOMPointReadOnly` mới. Đầu tiên, bạn có thể sử dụng hàm khởi tạo của nó, truyền vào các giá trị tham số cho từng chiều và tùy chọn là phối cảnh:

```js
/* 2D */
const point2D = new DOMPointReadOnly(50, 50);

/* 3D */
const point3D = new DOMPointReadOnly(50, 50, 25);

/* 3D with perspective */
const point3DPerspective = new DOMPointReadOnly(100, 100, 100, 1.0);
```

Tùy chọn khác là sử dụng phương thức tĩnh {{domxref("DOMPointReadOnly.fromPoint_static", "DOMPointReadOnly.fromPoint()")}}:

```js
const point = DOMPointReadOnly.fromPoint({ x: 100, y: 100, z: 50, w: 1.0 });
```

## Hàm khởi tạo

- {{domxref("DOMPointReadOnly.DOMPointReadOnly","DOMPointReadOnly()")}}
  - : Tạo một đối tượng `DOMPointReadOnly` mới với các giá trị tọa độ và phối cảnh đã cho. Để tạo một điểm từ một đối tượng, bạn có thể sử dụng {{domxref("DOMPointReadOnly.fromPoint_static", "DOMPointReadOnly.fromPoint()")}}.

## Thuộc tính phiên bản

- {{domxref("DOMPointReadOnly.x")}} {{ReadOnlyInline}}
  - : Tọa độ ngang của điểm, `x`.
- {{domxref("DOMPointReadOnly.y")}} {{ReadOnlyInline}}
  - : Tọa độ dọc của điểm, `y`.
- {{domxref("DOMPointReadOnly.z")}} {{ReadOnlyInline}}
  - : Tọa độ độ sâu của điểm, `z`.
- {{domxref("DOMPointReadOnly.w")}} {{ReadOnlyInline}}
  - : Giá trị phối cảnh của điểm, `w`.

## Phương thức tĩnh

- {{domxref("DOMPointReadOnly.fromPoint_static", "DOMPointReadOnly.fromPoint()")}}
  - : Một phương thức tĩnh tạo một đối tượng `DOMPointReadOnly` mới dựa trên các tọa độ được cung cấp trong đối tượng đã chỉ định.

## Phương thức phiên bản

- {{domxref("DOMPointReadOnly.matrixTransform", "matrixTransform()")}}
  - : Áp dụng một phép biến đổi ma trận được chỉ định dưới dạng đối tượng lên đối tượng `DOMPointReadOnly`.
- {{domxref("DOMPointReadOnly.toJSON()", "toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `DOMPointReadOnly`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}
- {{domxref("DOMRect")}}
- {{domxref("DOMMatrix")}}
