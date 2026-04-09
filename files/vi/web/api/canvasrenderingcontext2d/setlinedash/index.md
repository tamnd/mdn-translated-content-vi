---
title: "CanvasRenderingContext2D: phương thức setLineDash()"
short-title: setLineDash()
slug: Web/API/CanvasRenderingContext2D/setLineDash
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.setLineDash
---

{{APIRef("Canvas API")}}

Phương thức **`setLineDash()`** của giao diện{{domxref("CanvasRenderingContext2D")}}của API Canvas 2D đặt mẫu dấu gạch ngang được sử dụng khi vuốt các đường. Nó sử dụng một mảng các giá trị chỉ định độ dài xen kẽ của các dòng và khoảng trống mô tả mẫu.

> [!LƯU Ý]
> Để quay lại sử dụng đường liền nét, hãy đặt danh sách gạch ngang thành một
> mảng trống.

## Cú pháp

```js-nolint
setLineDash(segments)
```

### Tham số

- `segments`
  - : Một{{jsxref("Array")}}gồm các số xác định khoảng cách để lần lượt vẽ một
    đường thẳng và khoảng trống (theo đơn vị không gian tọa độ). Nếu số phần tử trong mảng là số lẻ thì các phần tử của mảng sẽ được sao chép và ghép nối. Ví dụ:`[5, 15, 25]`sẽ trở thành`[5, 15, 25, 5, 15, 25]`. Nếu mảng trống, danh sách gạch ngang sẽ bị xóa và các nét dòng trở lại liền nét.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Ví dụ cơ bản

Ví dụ này sử dụng phương thức`setLineDash()`để vẽ một đường đứt nét phía trên một đường liền nét.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Dashed line
ctx.beginPath();
ctx.setLineDash([5, 15]);
ctx.moveTo(0, 50);
ctx.lineTo(300, 50);
ctx.stroke();

// Solid line
ctx.beginPath();
ctx.setLineDash([]);
ctx.moveTo(0, 100);
ctx.lineTo(300, 100);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Basic_example', 700, 180) }}

### Một số mẫu thông dụng

Ví dụ này minh họa một loạt các mẫu gạch ngang phổ biến.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Hàm`drawDashedLine()`được tạo bên dưới giúp việc vẽ nhiều đường đứt nét trở nên đơn giản. Nó nhận một mảng mẫu làm tham số duy nhất của nó.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let y = 15;

function drawDashedLine(pattern) {
  ctx.beginPath();
  ctx.setLineDash(pattern);
  ctx.moveTo(0, y);
  ctx.lineTo(300, y);
  ctx.stroke();
  y += 20;
}

drawDashedLine([]);
drawDashedLine([1, 1]);
drawDashedLine([10, 10]);
drawDashedLine([20, 5]);
drawDashedLine([15, 3, 3, 3]);
drawDashedLine([20, 3, 3, 3, 3, 3, 3, 3]);
drawDashedLine([12, 3, 3]); // Equals [12, 3, 3, 12, 3, 3]
```

#### Kết quả

{{ EmbedLiveSample('Some_common_patterns', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.getLineDash()")}}
- {{domxref("CanvasRenderingContext2D.lineDashOffset")}}
