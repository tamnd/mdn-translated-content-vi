---
title: "CanvasRenderingContext2D: phương thức biến đổi()"
short-title: biến đổi()
slug: Web/API/CanvasRenderingContext2D/transform
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.transform
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.transform()`** của API Canvas 2D nhân phép biến đổi hiện tại với ma trận được mô tả bằng các đối số của phương thức này. Điều này cho phép bạn chia tỷ lệ, xoay, dịch (di chuyển) và nghiêng ngữ cảnh.

> [!LƯU Ý]
> Xem thêm
> phương thức{{domxref("CanvasRenderingContext2D.setTransform()", "setTransform()")}}, trong đó
> đặt lại biến đổi hiện tại thành ma trận nhận dạng và sau đó gọi
> `transform()`.

## Cú pháp

```js-nolint
transform(a, b, c, d, e, f)
```

Ma trận biến đổi được mô tả như sau: `[a c e; b d f; 0 0 1]`.

### Tham số

- `a` (`m11`)
  - : Ô ở hàng đầu tiên và cột đầu tiên của ma trận.
- `b` (`m12`)
  - : Ô ở hàng thứ hai và cột đầu tiên của ma trận.
- `c` (`m21`)
  - : Ô ở hàng đầu tiên và cột thứ hai của ma trận.
- `d` (`m22`)
  - : Ô ở hàng thứ hai và cột thứ hai của ma trận.
- `e` (`m41`)
  - : Ô ở hàng đầu tiên và cột thứ ba của ma trận.
- `f` (`m42`)
  - : Ô ở hàng thứ hai và cột thứ ba của ma trận.

Nếu một điểm ban đầu có tọa độ `(x, y)`, thì sau khi biến đổi nó sẽ có tọa độ `(ax + cy + e, bx + dy + f)`. Điều này có nghĩa là:

- `e` và `f` kiểm soát việc dịch theo chiều ngang và chiều dọc của ngữ cảnh.
- Khi `b` và `c` là `0`, `a` và `d` sẽ kiểm soát tỷ lệ theo chiều ngang và chiều dọc của ngữ cảnh.
- Khi `a` và `d` là `1`, `b` và `c` kiểm soát độ lệch ngang và dọc của ngữ cảnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Nghiêng một hình dạng

Ví dụ này nghiêng một hình chữ nhật theo cả chiều dọc (`.2`) và chiều ngang (`.8`). Tỷ lệ và phép tịnh tiến không thay đổi.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.transform(1, 0.2, 0.8, 1, 0, 0);
ctx.fillRect(0, 0, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Skewing_a_shape', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.setTransform()")}}
