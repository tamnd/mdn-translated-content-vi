---
title: "CanvasRenderingContext2D: phương thức save()"
short-title: cứu()
slug: Web/API/CanvasRenderingContext2D/save
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.save
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.save()`** của API Canvas 2D lưu toàn bộ trạng thái của canvas bằng cách đẩy trạng thái hiện tại lên một ngăn xếp.

## Cú pháp

```js-nolint
save()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Sự miêu tả

Trạng thái bản vẽ được lưu vào ngăn xếp bao gồm:

- Ma trận chuyển đổi hiện tại.
- Vùng cắt hiện tại.
- Danh sách dấu gạch ngang hiện tại.
- Giá trị hiện tại của các thuộc tính sau: -{{domxref("CanvasRenderingContext2D.direction", "direction")}}-{{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}}-{{domxref("CanvasRenderingContext2D.filter", "filter")}}-{{domxref("CanvasRenderingContext2D.font", "font")}}-{{domxref("CanvasRenderingContext2D.fontKerning", "fontKerning")}}-{{domxref("CanvasRenderingContext2D.fontStretch", "fontStretch")}}-{{domxref("CanvasRenderingContext2D.fontVariantCaps", "fontVariantCaps")}}-{{domxref("CanvasRenderingContext2D.globalAlpha", "globalAlpha")}}-{{domxref("CanvasRenderingContext2D.globalCompositeOperation", "globalCompositeOperation")}}-{{domxref("CanvasRenderingContext2D.imageSmoothingEnabled", "imageSmoothingEnabled")}}-{{domxref("CanvasRenderingContext2D.imageSmoothingQuality", "imageSmoothingQuality")}}-{{domxref("CanvasRenderingContext2D.letterSpacing", "letterSpacing")}}-{{domxref("CanvasRenderingContext2D.lineCap", "lineCap")}}-{{domxref("CanvasRenderingContext2D.lineDashOffset", "lineDashOffset")}}-{{domxref("CanvasRenderingContext2D.lineJoin", "lineJoin")}}-{{domxref("CanvasRenderingContext2D.lineWidth", "lineWidth")}}-{{domxref("CanvasRenderingContext2D.miterLimit", "miterLimit")}}-{{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}}-{{domxref("CanvasRenderingContext2D.shadowColor", "shadowColor")}}-{{domxref("CanvasRenderingContext2D.shadowOffsetX", "shadowOffsetX")}}-{{domxref("CanvasRenderingContext2D.shadowOffsetY", "shadowOffsetY")}}-{{domxref("CanvasRenderingContext2D.strokeStyle", "strokeStyle")}}-{{domxref("CanvasRenderingContext2D.textAlign", "textAlign")}}-{{domxref("CanvasRenderingContext2D.textBaseline", "textBaseline")}}-{{domxref("CanvasRenderingContext2D.textRendering", "textRendering")}}-{{domxref("CanvasRenderingContext2D.wordSpacing", "wordSpacing")}}

## Ví dụ

### Lưu trạng thái bản vẽ

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

{{ EmbedLiveSample('Saving_the_drawing_state', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định phương thức này:{{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.restore()")}}
