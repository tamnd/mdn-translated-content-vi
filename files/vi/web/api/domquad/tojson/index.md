---
title: "DOMQuad: toJSON() method"
short-title: toJSON()
slug: Web/API/DOMQuad/toJSON
page-type: web-api-instance-method
browser-compat: api.DOMQuad.toJSON
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Phương thức `toJSON()` của {{domxref("DOMQuad")}} trả về biểu diễn {{Glossary("JSON")}} của đối tượng `DOMQuad`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng mới có các thuộc tính được đặt theo các giá trị trong `DOMQuad` mà phương thức được gọi trên đó.

## Ví dụ

Ví dụ này tạo một {{domxref("DOMQuad")}} với bốn đối tượng {{domxref("DOMPoint")}} đại diện cho các góc của cửa sổ hiện tại, theo tọa độ màn hình, rồi chuyển đổi sang JSON.

```js
const topLeft = new DOMPoint(window.screenX, window.screenY);
const topRight = new DOMPoint(
  window.screenX + window.innerWidth,
  window.screenY,
);
const bottomLeft = new DOMPoint(
  window.screenX,
  window.screenY + window.innerHeight,
);
const bottomRight = new DOMPoint(
  window.screenX + window.innerWidth,
  window.screenY + window.innerHeight,
);

const quad = new DOMQuad(topLeft, topRight, bottomRight, bottomLeft);

const quadJSON = quad.toJSON();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
