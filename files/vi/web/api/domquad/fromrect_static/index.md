---
title: "DOMQuad: fromRect() static method"
short-title: fromRect()
slug: Web/API/DOMQuad/fromRect_static
page-type: web-api-static-method
browser-compat: api.DOMQuad.fromRect_static
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức tĩnh **`fromRect()`** của giao diện {{domxref("DOMQuad")}} trả về một đối tượng `DOMQuad` mới dựa trên tập tọa độ được cung cấp có dạng của một đối tượng {{domxref("DOMRect")}}.

## Cú pháp

```js-nolint
DOMQuad.fromRect()
DOMQuad.fromRect(rect)
```

### Tham số

- `rect` {{optional_inline}}
  - : Một {{domxref("DOMRect")}}, {{domxref("DOMRectReadOnly")}}, hoặc một đối tượng có cùng thuộc tính. Tất cả các thuộc tính mặc định là `0`. Các thuộc tính bao gồm:
    - {{domxref("DOMRect/x", "x")}} {{optional_inline}}
      - : Tọa độ x của góc gốc của hình chữ nhật (góc trên bên trái).
    - {{domxref("DOMRect/y", "y")}} {{optional_inline}}
      - : Tọa độ y của góc gốc của hình chữ nhật (góc trên bên trái).
    - {{domxref("DOMRect/width", "width")}} {{optional_inline}}
      - : Chiều rộng của hình chữ nhật.
    - {{domxref("DOMRect/height", "height")}} {{optional_inline}}
      - : Chiều cao của hình chữ nhật.

### Giá trị trả về

Một đối tượng {{domxref("DOMQuad")}}.

## Ví dụ

### Tạo quad hình chữ nhật

Ví dụ này tạo một `DOMQuad` từ đầu có dạng hình chữ nhật. Sử dụng `fromRect()` tiện hơn so với dùng hàm khởi tạo {{domxref("DOMQuad.DOMQuad", "DOMQuad()")}}.

```js
const quad = DOMQuad.fromRect({ x: 10, y: 20, width: 100, height: 50 });

console.log(quad.p1); // DOMPoint {x: 10, y: 20, z: 0, w: 1}
console.log(quad.p2); // DOMPoint {x: 110, y: 20, z: 0, w: 1}
console.log(quad.p3); // DOMPoint {x: 110, y: 70, z: 0, w: 1}
console.log(quad.p4); // DOMPoint {x: 10, y: 70, z: 0, w: 1}
```

### Tạo quad từ DOMRect

Ví dụ này cho thấy cách tạo một `DOMQuad` từ một đối tượng {{domxref("DOMRect")}}.

```js
const domRect = new DOMRect(50, 60, 200, 100);
const quad = DOMQuad.fromRect(domRect);

console.log(quad.p1); // DOMPoint {x: 50, y: 60, z: 0, w: 1}
console.log(quad.p2); // DOMPoint {x: 250, y: 60, z: 0, w: 1}
console.log(quad.p3); // DOMPoint {x: 250, y: 160, z: 0, w: 1}
console.log(quad.p4); // DOMPoint {x: 50, y: 160, z: 0, w: 1}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hàm khởi tạo {{domxref("DOMQuad.DOMQuad", "DOMQuad()")}}
- {{domxref("DOMRect")}}
- {{domxref("DOMPoint")}}
