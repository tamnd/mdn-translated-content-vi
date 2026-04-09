---
title: "CanvasRenderingContext2D: phương thức drawImage()"
short-title: drawImage()
slug: Web/API/CanvasRenderingContext2D/drawImage
page-type: web-api-instance-method
browser-compat: api.CanvasRenderingContext2D.drawImage
---

{{APIRef("Canvas API")}}

Phương thức **`CanvasRenderingContext2D.drawImage()`** của
API Canvas 2D cung cấp các cách khác nhau để vẽ hình ảnh lên canvas.

## Cú pháp

```js-nolint
drawImage(image, dx, dy)
drawImage(image, dx, dy, dWidth, dHeight)
drawImage(image, sx, sy, sWidth, sHeight, dx, dy, dWidth, dHeight)
```

! [drawImage](canvas_drawimage.jpg)

### Tham số-`image`

- : Một yếu tố để vẽ vào bối cảnh. Đặc điểm kỹ thuật cho phép mọi hình ảnh canvas
  nguồn, cụ thể là
  một {{domxref("HTMLImageElement")}},
  một {{domxref("SVGImageElement")}},
  một {{domxref("HTMLVideoElement")}},
  một {{domxref("HTMLCanvasElement")}},
  một {{domxref("ImageBitmap")}},
  một {{domxref("OffscreenCanvas")}},
  hoặc {{domxref("VideoFrame")}}.
- `sx` {{optional_inline}}
- : Tọa độ trục x của góc trên cùng bên trái của hình chữ nhật phụ của nguồn
  `image` để vẽ vào bối cảnh đích. Sử dụng cú pháp 3 hoặc 5 đối số
  để bỏ qua lập luận này.
- `sy` {{optional_inline}}
- : Tọa độ trục y của góc trên cùng bên trái của hình chữ nhật phụ của nguồn
  `image` để vẽ vào bối cảnh đích. Sử dụng cú pháp 3 hoặc 5 đối số
  để bỏ qua lập luận này.
- `sWidth` {{optional_inline}}
- : Chiều rộng của hình chữ nhật phụ của nguồn `image` để vẽ vào
  bối cảnh điểm đến. Nếu không được chỉ định, toàn bộ hình chữ nhật từ tọa độ
  được chỉ định bởi `sx`và`sy` ở góc dưới bên phải của
  hình ảnh được sử dụng. Sử dụng cú pháp 3 hoặc 5 đối số để bỏ qua đối số này.
  Giá trị âm làm tăng hình chữ nhật phụ theo hướng ngược lại, nhưng các pixel luôn được xử lý theo hướng ban đầu và hình ảnh không bị lật.
- `sHeight` {{optional_inline}}
- : Chiều cao của hình chữ nhật phụ của nguồn `image` để vẽ vào
  bối cảnh điểm đến. Sử dụng cú pháp 3 hoặc 5 đối số để bỏ qua đối số này.
  Giá trị âm làm tăng hình chữ nhật phụ theo hướng ngược lại, nhưng các pixel luôn được xử lý theo hướng ban đầu và hình ảnh không bị lật.
- `dx`
- : Tọa độ trục x trong khung vẽ đích để đặt phần trên cùng bên trái
  góc của nguồn `image`.
- `dy`
- : Tọa độ trục y trong khung vẽ đích để đặt phần trên cùng bên trái
  góc của nguồn `image`.
- `dWidth`
- : Chiều rộng để vẽ `image` trong khung vẽ đích. Điều này cho phép
  phóng to hình ảnh đã vẽ. Nếu không được chỉ định, hình ảnh sẽ không được chia tỷ lệ theo chiều rộng khi
  được vẽ. Lưu ý rằng đối số này không có trong cú pháp 3 đối số.
  Giá trị âm làm tăng hình chữ nhật phụ theo hướng ngược lại, nhưng các pixel luôn được xử lý theo hướng ban đầu và hình ảnh không bị lật.
- `dHeight`
- : Chiều cao để vẽ `image` trong khung vẽ đích. Điều này cho phép
  phóng to hình ảnh đã vẽ. Nếu không được chỉ định, hình ảnh sẽ không được chia tỷ lệ theo chiều cao khi
  được vẽ. Lưu ý rằng đối số này không có trong cú pháp 3 đối số.
  Giá trị âm làm tăng hình chữ nhật phụ theo hướng ngược lại, nhưng các pixel luôn được xử lý theo hướng ban đầu và hình ảnh không bị lật.### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
- : Được ném khi hình ảnh không có dữ liệu hình ảnh hoặc nếu chiều rộng hoặc chiều cao hình chữ nhật của canvas hoặc nguồn bằng 0.
- `TypeMismatchError` {{domxref("DOMException")}}
- : Được ném ra khi hình ảnh `null`hoặc`undefined` được truyền dưới dạng tham số.

## Ví dụ

### Vẽ hình ảnh lên canvas

Ví dụ này vẽ một hình ảnh vào khung vẽ bằng phương thức `drawImage()`.

#### HTML

```html
<canvas id="canvas"></canvas>
<div class="hidden">
  <img
    id="source"
    src="https://mdn.github.io/shared-assets/images/examples/rhino.jpg"
    width="300"
    height="227" />
</div>
```

```css hidden
.hidden {
  display: none;
}
```

#### JavaScript

Ảnh nguồn được lấy từ tọa độ (33, 71), có chiều rộng là 104 và
chiều cao là 124. Nó được vẽ vào canvas tại (21, 20), ở đó nó có chiều rộng là 87
và chiều cao là 104.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
const image = document.getElementById("source");

image.addEventListener("load", (e) => {
  ctx.drawImage(image, 33, 71, 104, 124, 21, 20, 87, 104);
});
```

#### Kết quả

{{ EmbedLiveSample('Drawing_an_image_to_the_canvas', 700, 180) }}

### Hiểu kích thước phần tử nguồn

Phương thức `drawImage()` sử dụng kích thước _intrinsic của phần tử nguồn trong CSS
pixel_ khi vẽ.

Ví dụ: nếu bạn tải `Image` và chỉ định các tham số kích thước tùy chọn
trong [constructor](/en-US/docs/Web/API/HTMLImageElement/Image) của nó, bạn sẽ
phải sử dụng các thuộc tính `naturalWidth`và`naturalHeight` của
phiên bản được tạo để tính toán chính xác những thứ như vùng cắt và tỷ lệ, thay vào đó
hơn `element.width`và`element.height`. Điều tương tự cũng xảy ra với
`videoWidth`và`videoHeight` nếu phần tử là
Phần tử {{htmlelement("video")}}, v.v.

#### HTML

```html
<canvas id="canvas"></canvas>
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const image = new Image(60, 45); // Using optional size for image
image.onload = drawImageActualSize; // Draw when image has loaded

// Load an image of intrinsic size 300x227 in CSS pixels
image.src = "https://mdn.github.io/shared-assets/images/examples/rhino.jpg";

function drawImageActualSize() {
  // Use the intrinsic size of image in CSS pixels for the canvas element
  canvas.width = this.naturalWidth;
  canvas.height = this.naturalHeight;

  // Will draw the image as 300x227, ignoring the custom size of 60x45
  // given in the constructor
  ctx.drawImage(this, 0, 0);

  // To use the custom size we'll have to specify the scale parameters
  // using the element's width and height properties - lets draw one
  // on top in the corner:
  ctx.drawImage(this, 0, 0, this.width, this.height);
}
```

#### Kết quả

{{EmbedLiveSample('Understanding_source_element_size', 700, 260)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Ghi chú

- `drawImage()` chỉ hoạt động chính xác trên {{domxref("HTMLVideoElement")}}
  khi {{domxref("HTMLMediaElement.readyState")}} của nó lớn hơn 1 (tức là
  Sự kiện **seek** được kích hoạt sau khi cài đặt `currentTime`
  tài sản).
- `drawImage()` sẽ luôn sử dụng kích thước _intrinsic của phần tử nguồn trong
  CSS pixels_ khi vẽ, cắt xén và/hoặc chia tỷ lệ.
- Ở một số phiên bản trình duyệt cũ hơn, `drawImage()` sẽ bỏ qua tất cả EXIF
  siêu dữ liệu trong hình ảnh, bao gồm cả Định hướng. Hành vi này đặc biệt rắc rối
  trên các thiết bị iOS. Bạn nên tự mình phát hiện Định hướng và sử dụng
  `rotate()` để làm cho đúng.

## Xem thêm

- Giao diện xác định phương thức này: {{domxref("CanvasRenderingContext2D")}}
