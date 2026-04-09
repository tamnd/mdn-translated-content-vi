---
title: "CanvasRenderingContext2D: phương thức isPointInStroke()"
short-title: isPointInStroke()
slug: Web/API/CanvasRenderingContext2D/isPointInStroke
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.isPointInStroke
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.isPointInStroke()`** của API Canvas 2D báo cáo xem điểm được chỉ định có nằm trong khu vực được chứa bởi đường dẫn hay không.

## Cú pháp

```js-nolint
isPointInStroke(x, y)
isPointInStroke(path, x, y)
```

### Tham số

- `x`
- : Tọa độ trục x của điểm cần kiểm tra.
- `y`
- : Tọa độ trục y của điểm cần kiểm tra.
- `path`
- : Đường dẫn {{domxref("Path2D")}} để kiểm tra. Nếu không được chỉ định, đường dẫn hiện tại là
  đã sử dụng.

### Giá trị trả về

Một giá trị boolean, là `true`nếu điểm nằm trong vùng được chứa bởi nét của đường dẫn, nếu không thì là`false`.

## Ví dụ

### Kiểm tra một điểm trên đường dẫn hiện tại

Ví dụ này sử dụng phương thức `isPointInStroke()` để kiểm tra xem một điểm có nằm trong khu vực nét của đường dẫn hiện tại hay không.

#### HTML

```html
<canvas id="canvas"></canvas>
<p>In stroke: <code id="result">false</code></p>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const result = document.getElementById("result");

ctx.rect(10, 10, 100, 100);
ctx.stroke();
result.innerText = ctx.isPointInStroke(50, 10);
```

#### Kết quả

{{ EmbedLiveSample('Checking_a_point_in_the_current_path', 700, 220) }}

### Kiểm tra một điểm trên đường dẫn đã chỉ định

Bất cứ khi nào bạn di chuyển chuột, ví dụ này sẽ kiểm tra xem con trỏ có nằm trong nét của đường dẫn hình elip `Path2D` hay không. Nếu có, nét vẽ của hình elip sẽ chuyển sang màu xanh lá cây, nếu không thì nó sẽ có màu đỏ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create ellipse
const ellipse = new Path2D();
ellipse.ellipse(150, 75, 40, 60, Math.PI * 0.25, 0, 2 * Math.PI);
ctx.lineWidth = 25;
ctx.strokeStyle = "red";
ctx.fill(ellipse);
ctx.stroke(ellipse);

// Listen for mouse moves
canvas.addEventListener("mousemove", (event) => {
  // Check whether point is inside ellipse's stroke
  const isPointInStroke = ctx.isPointInStroke(
    ellipse,
    event.offsetX,
    event.offsetY,
  );
  ctx.strokeStyle = isPointInStroke ? "green" : "red";

  // Draw ellipse
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.fill(ellipse);
  ctx.stroke(ellipse);
});
```

#### Kết quả

{{ EmbedLiveSample('Checking_a_point_in_the_specified_path', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
