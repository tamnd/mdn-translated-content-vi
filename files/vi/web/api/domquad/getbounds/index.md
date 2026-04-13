---
title: "DOMQuad: getBounds() method"
short-title: getBounds()
slug: Web/API/DOMQuad/getBounds
page-type: web-api-instance-method
browser-compat: api.DOMQuad.getBounds
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `getBounds()` của {{domxref("DOMQuad")}} trả về một đối tượng {{domxref("DOMRect")}} đại diện cho hình chữ nhật nhỏ nhất bao hoàn toàn đối tượng `DOMQuad`.

## Cú pháp

```js-nolint
getBounds()
```

### Tham số

Không có.

### Giá trị trả về

Một {{domxref("DOMRect")}} với các thuộc tính x, y, width và height, định nghĩa hình chữ nhật bao quanh `DOMQuad` dựa trên tọa độ các góc của nó.

## Ví dụ

Ví dụ này tạo một {{domxref("DOMQuad")}} với bốn điểm, rồi lấy hình chữ nhật bao quanh của nó.

```js
const quad = new DOMQuad(
  { x: 40, y: 25 },
  { x: 180, y: 8 },
  { x: 210, y: 150 },
  { x: 10, y: 180 },
);

const quadBounds = quad.getBounds();
```

![An irregular quadrilateral with none of the sides being vertical or horizontal. Its four corners are marked with red circles. Around this quadrilateral is a dashed rectangle. All sides of this rectangle are vertical or horizontal and tangent the quadrilateral.](./domquad.svg)

Hình vẽ cho thấy một tứ giác không đều được biểu diễn bởi {{domxref("DOMQuad")}}. Bốn hình tròn màu đỏ đại diện cho các thuộc tính {{domxref("DOMPoint")}} `p1` đến `p4`. Hình chữ nhật nét đứt là hình chữ nhật bao quanh được trả về bởi phương thức `getBounds()` của {{domxref("DOMQuad")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
