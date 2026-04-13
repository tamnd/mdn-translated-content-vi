---
title: "Path2D: phương thức addPath()"
short-title: addPath()
slug: Web/API/Path2D/addPath
page-type: web-api-instance-method
browser-compat: api.Path2D.addPath
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`Path2D.addPath()`** trong Canvas 2D API thêm một đối tượng {{domxref("Path2D")}} vào một đối tượng `Path2D` khác.

## Cú pháp

```js-nolint
addPath(path)
addPath(path, transform)
```

### Tham số

- `path`
  - : Một đường dẫn {{domxref("Path2D")}} sẽ được thêm vào.
- `transform` {{optional_inline}}
  - : Một {{domxref("DOMMatrix")}} được dùng làm ma trận biến đổi cho đường dẫn được thêm vào. (Về mặt kỹ thuật, đây là một đối tượng sở hữu cùng các thuộc tính như đối tượng `DOMMatrix`.)

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Thêm một đường dẫn vào đường dẫn hiện có

Ví dụ này thêm một đường dẫn vào một đường dẫn khác.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Đầu tiên, chúng ta tạo hai đối tượng {{domxref("Path2D")}} riêng biệt, mỗi đối tượng chứa một hình chữ nhật được tạo bằng phương thức {{domxref("CanvasRenderingContext2D.rect()", "rect()")}}. Sau đó, chúng ta tạo một ma trận bằng {{domxref("DOMMatrix.DOMMatrix", "DOMMatrix()")}}. Tiếp theo, chúng ta thêm đường dẫn thứ hai vào đường dẫn thứ nhất, đồng thời áp dụng ma trận để di chuyển đường dẫn thứ hai sang phải. Cuối cùng, chúng ta vẽ đường dẫn thứ nhất, lúc này đã chứa cả hai hình chữ nhật, bằng {{domxref("CanvasRenderingContext2D.fill()", "fill()")}}.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Create first path and add a rectangle
let p1 = new Path2D();
p1.rect(0, 0, 100, 150);

// Create second path and add a rectangle
let p2 = new Path2D();
p2.rect(0, 0, 100, 75);

// Create transformation matrix that moves 200 points to the right
let m = new DOMMatrix();
m.a = 1;
m.b = 0;
m.c = 0;
m.d = 1;
m.e = 200;
m.f = 0;

// Add second path to the first path
p1.addPath(p2, m);

// Draw the first path
ctx.fill(p1);
```

#### Kết quả

{{ EmbedLiveSample('Adding_a_path_to_an_existing_path', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện định nghĩa phương thức này: {{domxref("Path2D")}}
