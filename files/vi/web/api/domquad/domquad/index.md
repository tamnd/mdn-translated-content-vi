---
title: "DOMQuad: DOMQuad() constructor"
short-title: DOMQuad()
slug: Web/API/DOMQuad/DOMQuad
page-type: web-api-constructor
browser-compat: api.DOMQuad.DOMQuad
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Hàm khởi tạo **`DOMQuad()`** tạo và trả về một đối tượng {{domxref("DOMQuad")}} mới, dựa trên các giá trị cho một số hoặc tất cả các thuộc tính của nó.

Bạn cũng có thể tạo `DOMQuad` bằng cách gọi hàm tĩnh {{domxref("DOMQuad.fromRect_static", "DOMQuad.fromRect()")}} hoặc {{domxref("DOMQuad.fromQuad_static", "DOMQuad.fromQuad()")}}. Các hàm này chấp nhận bất kỳ đối tượng nào có các tham số bắt buộc, bao gồm {{domxref("DOMRect")}}, {{domxref("DOMRectReadOnly")}} hoặc một `DOMQuad` khác.

## Cú pháp

```js-nolint
new DOMQuad()
new DOMQuad(p1)
new DOMQuad(p1, p2)
new DOMQuad(p1, p2, p3)
new DOMQuad(p1, p2, p3, p4)
```

### Tham số

- {{domxref("DOMQuad/p1", "p1")}} {{optional_inline}}, {{domxref("DOMQuad/p2", "p2")}} {{optional_inline}}, {{domxref("DOMQuad/p3", "p3")}} {{optional_inline}}, {{domxref("DOMQuad/p4", "p4")}} {{optional_inline}}
  - : Mỗi tham số là một {{domxref("DOMPoint")}} hoặc một đối tượng có cùng thuộc tính, đại diện cho một góc của tứ giác.

## Ví dụ

Ví dụ này tạo một `DOMQuad` sử dụng một {{domxref("DOMPoint")}} và ba điểm bổ sung được định nghĩa dưới dạng đối tượng.

```js
const point = new DOMPoint(2, 0);
const quad = new DOMQuad(
  point,
  { x: 12, y: 0 },
  { x: 12, y: 10 },
  { x: 2, y: 10 },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}
- {{domxref("DOMRect")}}
- {{domxref("DOMMatrix")}}
