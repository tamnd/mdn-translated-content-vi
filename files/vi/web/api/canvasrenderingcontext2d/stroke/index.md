---
title: "CanvasRenderingContext2D: phương thức Stroke()"
short-title: đột quỵ()
slug: Web/API/CanvasRenderingContext2D/stroke
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.stroke
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.stroke()`** của các nét vẽ API Canvas 2D (phác thảo) đường dẫn hiện tại hoặc đường dẫn đã cho với kiểu nét vẽ hiện tại.

Các nét được căn chỉnh về giữa đường path; nói cách khác, một nửa nét được vẽ ở mặt trong và một nửa ở mặt ngoài.

Nét vẽ được vẽ bằng cách sử dụng[non-zero winding rule](https://en.wikipedia.org/wiki/Nonzero-rule), có nghĩa là các giao điểm của đường dẫn vẫn sẽ được lấp đầy.

## Cú pháp

```js-nolint
stroke()
stroke(path)
```

### Tham số

- `path`
  - : Đường dẫn{{domxref("Path2D")}}đến đột quỵ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Một hình chữ nhật có nét vẽ đơn giản

Ví dụ này tạo một hình chữ nhật bằng phương thức`rect()`, sau đó vẽ nó vào khung vẽ bằng cách sử dụng`stroke()`.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
ctx.rect(10, 10, 150, 100);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('A_simple_stroked_rectangle', 700, 180) }}

### Vẽ lại đường dẫn

Thông thường, bạn sẽ muốn gọi{{domxref("CanvasRenderingContext2D.beginPath()", "beginPath()")}}cho mỗi thứ mới mà bạn muốn vuốt ve. Nếu không, các đường dẫn phụ trước đó sẽ vẫn là một phần của đường dẫn hiện tại và được thêm vào mỗi khi bạn gọi phương thức`stroke()`. Tuy nhiên, trong một số trường hợp, đây có thể là hiệu quả mong muốn.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

Mã này vuốt đường dẫn đầu tiên ba lần, đường dẫn thứ hai hai lần và đường dẫn thứ ba chỉ một lần.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// First sub-path
ctx.lineWidth = 26;
ctx.strokeStyle = "orange";
ctx.moveTo(20, 20);
ctx.lineTo(160, 20);
ctx.stroke();

// Second sub-path
ctx.lineWidth = 14;
ctx.strokeStyle = "green";
ctx.moveTo(20, 80);
ctx.lineTo(220, 80);
ctx.stroke();

// Third sub-path
ctx.lineWidth = 4;
ctx.strokeStyle = "pink";
ctx.moveTo(20, 140);
ctx.lineTo(280, 140);
ctx.stroke();
```

#### Kết quả

{{ EmbedLiveSample('Re-stroking_paths', 700, 180) }}

### Vuốt ve và làm đầy

Nếu bạn muốn vừa đột quỵ vừa điền vào một đường path, thứ tự bạn thực hiện những hành động này sẽ quyết định kết quả. Trong ví dụ này, hình vuông bên trái được vẽ bằng nét vẽ ở trên cùng của phần tô. Hình vuông bên phải được vẽ bằng phần tô màu ở trên cùng của nét vẽ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.lineWidth = 16;
ctx.strokeStyle = "red";

// Stroke on top of fill
ctx.beginPath();
ctx.rect(25, 25, 100, 100);
ctx.fill();
ctx.stroke();

// Fill on top of stroke
ctx.beginPath();
ctx.rect(175, 25, 100, 100);
ctx.stroke();
ctx.fill();
```

#### Kết quả

{{ EmbedLiveSample('Stroking_and_filling', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
