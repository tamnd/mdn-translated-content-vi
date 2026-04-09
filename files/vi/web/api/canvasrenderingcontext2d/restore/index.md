---
title: "CanvasRenderingContext2D: phương thức khôi phục()"
short-title: khôi phục()
slug: Web/API/CanvasRenderingContext2D/restore
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.restore
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.restore()`** của API Canvas 2D khôi phục trạng thái canvas được lưu gần đây nhất bằng cách bật mục nhập trên cùng trong ngăn xếp trạng thái vẽ. Nếu không có trạng thái được lưu, phương pháp này không làm gì cả.

Để biết thêm thông tin về[drawing state](/en-US/docs/Web/API/CanvasRenderingContext2D/save#description), hãy xem{{domxref("CanvasRenderingContext2D.save()")}}.

## Cú pháp

```js-nolint
restore()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Khôi phục trạng thái đã lưu

Ví dụ này sử dụng phương thức`save()`để lưu trạng thái hiện tại và`restore()`để khôi phục nó sau này, để sau này bạn có thể vẽ một đường thẳng với trạng thái hiện tại.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

// Save the current state
ctx.save();

ctx.fillStyle = "green";
ctx.fillRect(10, 10, 100, 100);

// Restore to the state saved by the most recent call to save()
ctx.restore();

ctx.fillRect(150, 40, 100, 100);
```

#### Kết quả

{{ EmbedLiveSample('Restoring_a_saved_state', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.save()")}}
