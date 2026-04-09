---
title: "CanvasRenderingContext2D: thuộc tính imageSmoothingQuality"
short-title: làm mịn hình ảnhChất lượng
slug: Web/API/CanvasRenderingContext2D/imageSmoothingQuality
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.imageSmoothingQuality
---

{{APIRef("Canvas API")}}

Thuộc tính **`imageSmoothingQuality`** của giao diện {{domxref("CanvasRenderingContext2D")}}, một phần của [Canvas API](/en-US/docs/Web/API/Canvas_API), cho phép bạn đặt chất lượng làm mịn hình ảnh.

> [!LƯU Ý]
> Để thuộc tính này có hiệu lực,
> {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled", "imageSmoothingEnabled")}}
> phải là `true`.

## Giá trị

Một trong những điều sau đây:

- `"low"`
- : Chất lượng thấp.
- `"medium"`
- : Chất lượng trung bình.
- `"high"`
- : Chất lượng cao.

Giá trị mặc định là `"low"`.

## Ví dụ

### Cài đặt chất lượng làm mịn ảnh

Ví dụ này sử dụng thuộc tính `imageSmoothingQuality` với hình ảnh được chia tỷ lệ.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

let img = new Image();
img.src = "canvas_create_pattern.png";
img.onload = () => {
  ctx.imageSmoothingQuality = "low";
  ctx.drawImage(img, 0, 0, 300, 150);
};
```

#### Kết quả

{{ EmbedLiveSample('Setting_image_smoothing_quality', 700, 180) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled")}}
- {{cssxref("image-rendering")}}
