---
title: "CanvasRenderingContext2D: phương thức fill()"
short-title: đổ đầy()
slug: Web/API/CanvasRenderingContext2D/fill
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.fill
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.fill()`** của API Canvas 2D lấp đầy đường dẫn hiện tại hoặc đường dẫn nhất định bằng {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} hiện tại.

## Cú pháp

```js-nolint
fill()
fill(path)
fill(fillRule)
fill(path, fillRule)
```

### Tham số

- `fillRule`
- : Thuật toán để xác định xem một điểm nằm bên trong hay bên ngoài phần điền
  vùng đất. Các giá trị có thể có: -`nonzero`
- : [non-zero winding rule](https://en.wikipedia.org/wiki/Nonzero-rule).
  Quy tắc mặc định. -`evenodd`
- : [even-odd winding rule](https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule).

- `path`
- : Đường dẫn {{domxref("Path2D")}} cần điền.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Điền vào một hình chữ nhật

Ví dụ này tô màu hình chữ nhật bằng phương thức `fill()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.rect(10, 10, 150, 100);
ctx.fill();
```

#### Kết quả

{{ EmbedLiveSample('Filling_a_rectangle', 700, 180) }}

### Chỉ định đường dẫn và fillRule

Ví dụ này lưu một số đường giao nhau vào đối tượng Path2D. Phương thức `fill()`sau đó được sử dụng để hiển thị đối tượng trên canvas. Một lỗ trống được để trống ở tâm đối tượng bằng cách sử dụng quy tắc`"evenodd"`; theo mặc định (với quy tắc`"nonzero"`), lỗ hổng cũng sẽ được lấp đầy.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create path
let region = new Path2D();
region.moveTo(30, 90);
region.lineTo(110, 20);
region.lineTo(240, 130);
region.lineTo(60, 130);
region.lineTo(190, 20);
region.lineTo(270, 90);
region.closePath();

// Fill path
ctx.fillStyle = "green";
ctx.fill(region, "evenodd");
```

#### Kết quả

{{ EmbedLiveSample('Specifying_a_path_and_a_fillRule', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.fillStyle")}}
