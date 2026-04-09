---
title: "CanvasRenderingContext2D: phương thức getLineDash()"
short-title: getLineDash()
slug: Web/API/CanvasRenderingContext2D/getLineDash
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.getLineDash
---

{{APIRef("Canvas API")}}

Phương thức **`getLineDash()`** của giao diện {{domxref("CanvasRenderingContext2D")}} của API Canvas 2D lấy mẫu gạch ngang hiện tại.

## Cú pháp

```js-nolint
getLineDash()
```

### Tham số

Không có.

### Giá trị trả về

Một số {{jsxref("Array")}} gồm các số xác định khoảng cách để lần lượt vẽ một đường thẳng và một khoảng cách (theo đơn vị không gian tọa độ). Nếu số khi thiết lập các phần tử là số lẻ thì các phần tử của mảng sẽ được sao chép và nối. Ví dụ: đặt dấu gạch ngang thành `[5, 15, 25]`sẽ dẫn đến việc lấy lại`[5, 15, 25, 5, 15, 25]`.

## Ví dụ

### Lấy cài đặt dấu gạch ngang dòng hiện tại

Ví dụ này minh họa phương thức `getLineDash()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Như được đặt bởi {{domxref("CanvasRenderingContext2D.setLineDash()", "setLineDash()")}}, các nét bao gồm các đường rộng 10 đơn vị, với khoảng cách 20 đơn vị ở giữa mỗi dòng.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.setLineDash([10, 20]);
console.log(ctx.getLineDash()); // [10, 20]

// Draw a dashed line
ctx.beginPath();
ctx.moveTo(0, 50);
ctx.lineTo(300, 50);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Getting_the_current_line_dash_setting', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.setLineDash()")}}
- {{domxref("CanvasRenderingContext2D.lineDashOffset")}}
