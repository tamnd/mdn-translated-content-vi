---
title: "CanvasRenderingContext2D: phương thức isPointInPath()"
short-title: isPointInPath()
slug: Web/API/CanvasRenderingContext2D/isPointInPath
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.isPointInPath
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.isPointInPath()`** của API Canvas 2D báo cáo liệu điểm đã chỉ định có nằm trong đường dẫn hiện tại hay không.

## Cú pháp

```js-nolint
isPointInPath(x, y)
isPointInPath(x, y, fillRule)
isPointInPath(path, x, y)
isPointInPath(path, x, y, fillRule)
```

### Tham số

- `x`
- : Tọa độ trục x của điểm cần kiểm tra, không bị ảnh hưởng bởi dòng điện
  sự chuyển đổi của bối cảnh.
- `y`
- : Tọa độ trục y của điểm cần kiểm tra, không bị ảnh hưởng bởi dòng điện
  sự chuyển đổi của bối cảnh.
- `fillRule`
- : Thuật toán để xác định xem một điểm nằm trong hay ngoài đường dẫn.
  Các giá trị có thể có: -`nonzero`
- : [non-zero winding rule](https://en.wikipedia.org/wiki/Nonzero-rule).
  Quy tắc mặc định. -`evenodd`
- : [even-odd winding rule](https://en.wikipedia.org/wiki/Even%E2%80%93odd_rule).

- `path`
- : Đường dẫn {{domxref("Path2D")}} để kiểm tra. Nếu không được chỉ định, đường dẫn hiện tại là
  đã sử dụng.

### Giá trị trả về

Giá trị boolean, là `true`nếu điểm được chỉ định có trong đường dẫn hiện tại hoặc đường dẫn được chỉ định, nếu không thì là`false`.

## Ví dụ

### Kiểm tra một điểm trên đường dẫn hiện tại

Ví dụ này sử dụng phương thức `isPointInPath()` để kiểm tra xem một điểm có nằm trong đường dẫn hiện tại hay không.

#### HTML

```html
<canvas id="canvas"></canvas>
<p>In path: <code id="result">false</code></p>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const result = document.getElementById("result");

ctx.rect(10, 10, 100, 100);
ctx.fill();
result.innerText = ctx.isPointInPath(30, 70);
```

#### Kết quả

{{ EmbedLiveSample('Checking_a_point_in_the_current_path', 700, 220) }}

### Kiểm tra một điểm trên đường dẫn đã chỉ định

Bất cứ khi nào bạn di chuyển chuột, ví dụ này sẽ kiểm tra xem con trỏ có nằm trong đường dẫn hình tròn `Path2D` hay không. Nếu có thì vòng tròn sẽ có màu xanh, nếu không thì sẽ có màu đỏ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create circle
const circle = new Path2D();
circle.arc(150, 75, 50, 0, 2 * Math.PI);
ctx.fillStyle = "red";
ctx.fill(circle);

// Listen for mouse moves
canvas.addEventListener("mousemove", (event) => {
  // Check whether point is inside circle
  const isPointInPath = ctx.isPointInPath(circle, event.offsetX, event.offsetY);
  ctx.fillStyle = isPointInPath ? "green" : "red";

  // Draw circle
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ctx.fill(circle);
});
```

#### Kết quả

{{ EmbedLiveSample('Checking_a_point_in_the_specified_path', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Ghi chú dành riêng cho tắc kè

- Trước Gecko 7.0 (Firefox 7.0 / Thunderbird 7.0 / SeaMonkey 2.4), phương pháp này
  không thể nhân tọa độ của điểm đã chỉ định với ma trận biến đổi hiện tại trước khi so sánh nó với đường dẫn. Bây giờ phương pháp này hoạt động chính xác ngay cả khi bối cảnh được xoay, thu nhỏ hoặc chuyển đổi theo cách khác.

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
