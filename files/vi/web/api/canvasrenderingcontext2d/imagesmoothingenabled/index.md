---
title: "CanvasRenderingContext2D: thuộc tính imageSmoothingEnabled"
short-title: Làm mịn hình ảnhĐã bật
slug: Web/API/CanvasRenderingContext2D/imageSmoothingEnabled
page-type: web-api-instance-property
browser-compat: api.CanvasRenderingContext2D.imageSmoothingEnabled
---

{{APIRef("Canvas API")}}

Thuộc tính **`imageSmoothingEnabled`** của giao diện {{domxref("CanvasRenderingContext2D")}}, một phần của [Canvas API](/en-US/docs/Web/API/Canvas_API), xác định xem hình ảnh được chia tỷ lệ có được làm mịn hay không (`true`, mặc định) hay không (`false`). Khi nhận được thuộc tính`imageSmoothingEnabled`, giá trị cuối cùng được đặt thành sẽ được trả về.

Thuộc tính này hữu ích cho các trò chơi và ứng dụng khác sử dụng pixel art. Khi phóng to hình ảnh, thuật toán thay đổi kích thước mặc định sẽ làm mờ các pixel. Đặt thuộc tính này thành `false` để giữ lại độ sắc nét của pixel.

> [!LƯU Ý]
> Bạn có thể điều chỉnh chất lượng làm mịn bằng
> {{domxref("CanvasRenderingContext2D.imageSmoothingQuality", "imageSmoothingQuality")}}
> tài sản.

## Giá trị

Một giá trị boolean cho biết có làm mịn hình ảnh được chia tỷ lệ hay không. Giá trị mặc định là `true`.

## Ví dụ

### Vô hiệu hóa làm mịn hình ảnh

Ví dụ này so sánh ba hình ảnh. Hình ảnh đầu tiên được vẽ ở kích thước tự nhiên, hình ảnh thứ hai được chia tỷ lệ thành 3X và được vẽ với tính năng làm mịn hình ảnh được bật và hình ảnh thứ ba được chia tỷ lệ thành 3X nhưng được vẽ với tính năng làm mịn hình ảnh bị tắt.

#### HTML

```html
<canvas id="canvas" width="460" height="210"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");

const ctx = canvas.getContext("2d");
ctx.font = "16px sans-serif";
ctx.textAlign = "center";

const img = new Image();
img.src = "/shared-assets/images/examples/big-star.png";
img.onload = () => {
  const w = img.width,
    h = img.height;

  ctx.fillText("Source", w * 0.5, 20);
  ctx.drawImage(img, 0, 24, w, h);

  ctx.fillText("Smoothing = TRUE", w * 2.5, 20);
  ctx.imageSmoothingEnabled = true;
  ctx.drawImage(img, w, 24, w * 3, h * 3);

  ctx.fillText("Smoothing = FALSE", w * 5.5, 20);
  ctx.imageSmoothingEnabled = false;
  ctx.drawImage(img, w * 4, 24, w * 3, h * 3);
};
```

#### Kết quả

{{ EmbedLiveSample('Disabling_image_smoothing', 700, 240) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện xác định thuộc tính này: {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasRenderingContext2D.imageSmoothingQuality")}}
- {{cssxref("image-rendering")}}
