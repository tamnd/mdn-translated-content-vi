---
title: Thao tác pixel bằng canvas
slug: Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Advanced_animations", "Web/API/Canvas_API/Tutorial/Optimizing_canvas")}}

Cho đến bây giờ chúng ta vẫn chưa xem xét các pixel thực tế của canvas. Với đối tượng `ImageData`, bạn có thể trực tiếp đọc và ghi một mảng dữ liệu để thao tác dữ liệu pixel. Chúng tôi cũng sẽ xem xét cách kiểm soát việc làm mịn hình ảnh (khử răng cưa) và cách lưu hình ảnh từ canvas của bạn.

## Đối tượng ImageData

Đối tượng {{domxref("ImageData")}} đại diện cho dữ liệu pixel cơ bản của một vùng đối tượng canvas.
Thuộc tính `data` của nó trả về {{jsxref("Uint8ClampedArray")}} (hoặc {{jsxref("Float16Array")}} nếu được yêu cầu) có thể được truy cập để xem dữ liệu pixel thô; mỗi pixel được biểu thị bằng bốn giá trị một byte (đỏ, lục, lam và alpha, theo thứ tự đó; nghĩa là định dạng "RGBA"). Mỗi thành phần màu được biểu thị bằng một số nguyên từ 0 đến 255. Mỗi thành phần được gán một chỉ mục liên tiếp trong mảng, với thành phần màu đỏ của pixel trên cùng bên trái nằm ở chỉ mục 0 trong mảng. Sau đó, các pixel sẽ đi từ trái sang phải, rồi đi xuống trong toàn mảng.

{{jsxref("Uint8ClampedArray")}} chứa `height` × `width` × 4 byte dữ liệu, với các giá trị chỉ mục nằm trong khoảng từ 0 đến (`height` × `width` × 4) - 1.

Ví dụ: để đọc giá trị của thành phần màu xanh lam từ pixel ở cột 200, hàng 50 trong ảnh, bạn sẽ làm như sau:

```js
const blueComponent = imageData.data[50 * (imageData.width * 4) + 200 * 4 + 2];
```

Nếu được cung cấp một tập hợp tọa độ (X và Y), cuối cùng bạn có thể làm điều gì đó như thế này:

```js
const xCoord = 50;
const yCoord = 100;
const canvasWidth = 1024;

const getColorIndicesForCoord = (x, y, width) => {
  const red = y * (width * 4) + x * 4;
  return [red, red + 1, red + 2, red + 3];
};

const colorIndices = getColorIndicesForCoord(xCoord, yCoord, canvasWidth);

const [redIndex, greenIndex, blueIndex, alphaIndex] = colorIndices;
```

Bạn cũng có thể truy cập kích thước của mảng pixel theo byte bằng cách đọc thuộc tính `Uint8ClampedArray.length`:

```js
const numBytes = imageData.data.length;
```

## Tạo một đối tượng ImageData

Để tạo một đối tượng `ImageData` mới, trống, bạn nên sử dụng phương thức {{domxref("CanvasRenderingContext2D.createImageData", "createImageData()")}}. Có hai phiên bản của phương pháp `createImageData()`:

```js
const myImageData = ctx.createImageData(width, height);
```

Điều này tạo ra một đối tượng `ImageData` mới với các kích thước được chỉ định. Tất cả các pixel được đặt trước để trong suốt.

Bạn cũng có thể tạo một đối tượng `ImageData` mới có cùng kích thước với đối tượng được chỉ định bởi `anotherImageData`. Tất cả các pixel của đối tượng mới đều được đặt trước thành màu đen trong suốt. **Điều này không sao chép dữ liệu hình ảnh!**

```js
const myImageData = ctx.createImageData(anotherImageData);
```

## Lấy dữ liệu pixel cho ngữ cảnh

Để có được đối tượng `ImageData` chứa bản sao dữ liệu pixel cho bối cảnh canvas, bạn có thể sử dụng phương thức `getImageData()`:

```js
const myImageData = ctx.getImageData(left, top, width, height);
```

Phương thức này trả về một đối tượng `ImageData` biểu thị dữ liệu pixel cho vùng canvas có các góc được biểu thị bằng các điểm (`left`, `top`), (`left+width`, `top`), (`left`, `top+height`) và (`left+width`, `top+height`). Các tọa độ được chỉ định theo đơn vị không gian tọa độ canvas.

> [!NOTE]
> Bất kỳ pixel nào bên ngoài canvas đều được trả về dưới dạng màu đen trong suốt trong đối tượng `ImageData` thu được.

Phương thức này cũng được thể hiện trong bài viết [Thao tác video bằng canvas](/en-US/docs/Web/API/Canvas_API/Manipulating_video_using_canvas).

## Tạo bộ chọn màu

Trong ví dụ này, chúng tôi đang sử dụng phương pháp [`getImageData()`](/en-US/docs/Web/API/CanvasRenderingContext2D/getImageData) để hiển thị màu dưới con trỏ chuột.
Để làm được điều này, chúng ta cần vị trí hiện tại của chuột, sau đó chúng ta tra cứu dữ liệu pixel tại vị trí đó trong mảng pixel mà [`getImageData()`](/en-US/docs/Web/API/CanvasRenderingContext2D/getImageData) cung cấp.
Cuối cùng, chúng tôi sử dụng dữ liệu mảng để đặt màu nền và văn bản trong `<div>` để hiển thị màu.
Bấm vào ảnh sẽ thực hiện thao tác tương tự nhưng sử dụng màu đã chọn.

```html
<table>
  <thead>
    <tr>
      <th>Source</th>
      <th>Hovered color</th>
      <th>Selected color</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <canvas id="canvas" width="300" height="227"></canvas>
      </td>
      <td class="color-cell" id="hovered-color"></td>
      <td class="color-cell" id="selected-color"></td>
    </tr>
  </tbody>
</table>
```

```js
const img = new Image();
img.crossOrigin = "anonymous";
img.src = "/shared-assets/images/examples/rhino.jpg";
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
img.addEventListener("load", () => {
  ctx.drawImage(img, 0, 0);
  img.style.display = "none";
});
const hoveredColor = document.getElementById("hovered-color");
const selectedColor = document.getElementById("selected-color");

const pick = (event, destination) => {
  const bounding = canvas.getBoundingClientRect();
  const x = event.clientX - bounding.left;
  const y = event.clientY - bounding.top;
  const pixel = ctx.getImageData(x, y, 1, 1);
  const data = pixel.data;

  const rgbColor = `rgb(${data[0]} ${data[1]} ${data[2]} / ${data[3] / 255})`;
  destination.style.background = rgbColor;
  destination.textContent = rgbColor;

  return rgbColor;
};

canvas.addEventListener("mousemove", (event) => pick(event, hoveredColor));
canvas.addEventListener("click", (event) => pick(event, selectedColor));
```

```css hidden
body {
  font-family: sans-serif;
}
.color-cell {
  color: white;
}
th {
  width: 30%;
}
td {
  font-family: monospace;
  font-weight: bold;
  padding-left: 1rem;
}
```

Di con trỏ đến bất kỳ đâu trên hình ảnh để xem kết quả trong cột "Màu được di chuột".
Nhấp vào bất kỳ vị trí nào trong ảnh để xem kết quả trong cột "Màu đã chọn".

{{embedlivesample("creating_a_color_picker", , 300)}}

## Vẽ dữ liệu pixel vào ngữ cảnh

Bạn có thể sử dụng phương thức [putImageData()](/en-US/docs/Web/API/CanvasRenderingContext2D/putImageData) để vẽ dữ liệu pixel vào ngữ cảnh:

```js
ctx.putImageData(myImageData, dx, dy);
```

Các tham số `dx` và `dy` cho biết tọa độ của thiết bị trong bối cảnh cần vẽ góc trên cùng bên trái của dữ liệu pixel mà bạn muốn vẽ.

Ví dụ: để vẽ toàn bộ hình ảnh được đại diện bởi `myImageData` vào góc trên cùng bên trái của ngữ cảnh, bạn có thể làm như sau:

```js
ctx.putImageData(myImageData, 0, 0);
```

## Thang màu xám và đảo màu

Trong ví dụ này, chúng tôi lặp lại tất cả các pixel để thay đổi giá trị của chúng, sau đó chúng tôi đặt mảng pixel đã sửa đổi trở lại canvas bằng cách sử dụng [putImageData()](/en-US/docs/Web/API/CanvasRenderingContext2D/putImageData).
Hàm `invert` trừ từng màu khỏi giá trị tối đa, `255`.
Hàm `grayscale` sử dụng mức trung bình của màu đỏ, xanh lá cây và xanh lam. Ví dụ: bạn cũng có thể sử dụng giá trị trung bình có trọng số được tính theo công thức `x = 0.299r + 0.587g + 0.114b`.
Xem [Grayscale](https://en.wikipedia.org/wiki/Grayscale) trên Wikipedia để biết thêm thông tin.

```html
<canvas id="canvas" width="300" height="227"></canvas>
<form>
  <input type="radio" id="original" name="color" value="original" checked />
  <label for="original">Original</label>

  <input type="radio" id="grayscale" name="color" value="grayscale" />
  <label for="grayscale">Grayscale</label>

  <input type="radio" id="inverted" name="color" value="inverted" />
  <label for="inverted">Inverted</label>

  <input type="radio" id="sepia" name="color" value="sepia" />
  <label for="sepia">Sepia</label>
</form>
```

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const img = new Image();
img.crossOrigin = "anonymous";
img.src = "/shared-assets/images/examples/rhino.jpg";
img.onload = () => {
  ctx.drawImage(img, 0, 0);
};

const original = () => {
  ctx.drawImage(img, 0, 0);
};

const invert = () => {
  ctx.drawImage(img, 0, 0);
  const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
  const data = imageData.data;
  for (let i = 0; i < data.length; i += 4) {
    data[i] = 255 - data[i]; // red
    data[i + 1] = 255 - data[i + 1]; // green
    data[i + 2] = 255 - data[i + 2]; // blue
  }
  ctx.putImageData(imageData, 0, 0);
};

const grayscale = () => {
  ctx.drawImage(img, 0, 0);
  const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
  const data = imageData.data;
  for (let i = 0; i < data.length; i += 4) {
    const avg = (data[i] + data[i + 1] + data[i + 2]) / 3;
    data[i] = avg; // red
    data[i + 1] = avg; // green
    data[i + 2] = avg; // blue
  }
  ctx.putImageData(imageData, 0, 0);
};

const sepia = () => {
  ctx.drawImage(img, 0, 0);
  const imageData = ctx.getImageData(0, 0, canvas.width, canvas.height);
  const data = imageData.data;
  for (let i = 0; i < data.length; i += 4) {
    let r = data[i], // red
      g = data[i + 1], // green
      b = data[i + 2]; // blue

    data[i] = Math.min(Math.round(0.393 * r + 0.769 * g + 0.189 * b), 255);
    data[i + 1] = Math.min(Math.round(0.349 * r + 0.686 * g + 0.168 * b), 255);
    data[i + 2] = Math.min(Math.round(0.272 * r + 0.534 * g + 0.131 * b), 255);
  }
  ctx.putImageData(imageData, 0, 0);
};

const inputs = document.querySelectorAll("[name=color]");
for (const input of inputs) {
  input.addEventListener("change", (evt) => {
    switch (evt.target.value) {
      case "inverted":
        return invert();
      case "grayscale":
        return grayscale();
      case "sepia":
        return sepia();
      default:
        return original();
    }
  });
}
```

Nhấp vào các tùy chọn khác nhau để xem kết quả hoạt động.

{{embedlivesample("grayscaling_and_inverting_colors", , 300)}}

## Thu phóng và khử răng cưa

Với sự trợ giúp của phương pháp {{domxref("CanvasRenderingContext2D.drawImage", "drawImage()")}}, canvas thứ hai và thuộc tính {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled", "imageSmoothingEnabled")}}, chúng tôi có thể phóng to hình ảnh của mình và xem chi tiết. Canvas thứ ba không có {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled", "imageSmoothingEnabled")}} cũng được vẽ để cho phép so sánh cạnh nhau.

```html
<table>
  <thead>
    <tr>
      <th>Source</th>
      <th>Smoothing enabled = true</th>
      <th>Smoothing enabled = false</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <canvas id="canvas" width="300" height="227"></canvas>
      </td>
      <td>
        <canvas id="smoothed" width="200" height="200"></canvas>
      </td>
      <td>
        <canvas id="pixelated" width="200" height="200"></canvas>
      </td>
    </tr>
  </tbody>
</table>
```

```css hidden
body {
  font-family: monospace;
}
```

Chúng ta lấy vị trí của chuột và cắt hình ảnh 5 pixel bên trái và bên trên thành 5 pixel bên phải và bên dưới.
Sau đó, chúng tôi sao chép cái đó sang một canvas khác và thay đổi kích thước hình ảnh theo kích thước chúng tôi muốn. Trong khung thu phóng, chúng tôi thay đổi kích thước phần cắt 10 × 10 pixel của canvas gốc thành 200 × 200:

```js
const img = new Image();
img.crossOrigin = "anonymous";
img.src = "/shared-assets/images/examples/rhino.jpg";
img.onload = () => {
  draw(img);
};

function draw(image) {
  const canvas = document.getElementById("canvas");
  const ctx = canvas.getContext("2d");
  ctx.drawImage(image, 0, 0);

  const smoothCtx = document.getElementById("smoothed").getContext("2d");
  smoothCtx.imageSmoothingEnabled = true;

  const pixelatedCtx = document.getElementById("pixelated").getContext("2d");
  pixelatedCtx.imageSmoothingEnabled = false;

  const zoom = (ctx, x, y) => {
    ctx.drawImage(
      canvas,
      Math.min(Math.max(0, x - 5), image.width - 10),
      Math.min(Math.max(0, y - 5), image.height - 10),
      10,
      10,
      0,
      0,
      200,
      200,
    );
  };

  canvas.addEventListener("mousemove", (event) => {
    const x = event.layerX;
    const y = event.layerY;
    zoom(smoothCtx, x, y);
    zoom(pixelatedCtx, x, y);
  });
}
```

{{embedlivesample("zooming_and_anti-aliasing", , 300)}}

## Lưu hình ảnh

{{domxref("HTMLCanvasElement")}} cung cấp phương pháp `toDataURL()`, rất hữu ích khi lưu hình ảnh. Nó trả về [URL](/en-US/docs/Web/URI/Reference/Schemes/data) dữ liệu chứa hình ảnh đại diện ở định dạng được chỉ định bởi tham số `type` (mặc định là [PNG](https://en.wikipedia.org/wiki/Portable_Network_Graphics)). Hình ảnh trả về có độ phân giải 96 dpi.

> [!NOTE]
> Xin lưu ý rằng nếu canvas chứa bất kỳ pixel nào được lấy từ một {{Glossary("origin")}} khác mà không sử dụng CORS thì canvas sẽ **bị nhiễm bẩn** và nội dung của nó không thể đọc và lưu được nữa.
> Xem [Các bức vẽ bảo mật và bị nhiễm độc](/en-US/docs/Web/HTML/How_to/CORS_enabled_image#security_and_tainted_canvases).

- {{domxref("HTMLCanvasElement.toDataURL", "canvas.toDataURL('image/png')")}}
  - : Cài đặt mặc định. Tạo một hình ảnh PNG.
- {{domxref("HTMLCanvasElement.toDataURL", "canvas.toDataURL('image/jpeg', quality)")}}
  - : Tạo hình ảnh JPG. Tùy chọn, bạn có thể cung cấp chất lượng trong phạm vi từ 0 đến 1, với một là chất lượng tốt nhất và với 0 là hầu như không thể nhận dạng được nhưng có kích thước tệp nhỏ.

Ví dụ: khi bạn đã tạo URL dữ liệu từ canvas của mình, bạn có thể sử dụng nó làm nguồn của bất kỳ {{HTMLElement("img")}} nào hoặc đặt nó vào một siêu liên kết có [tải xuống thuộc tính](/en-US/docs/Web/HTML/Reference/Elements/a#download) để lưu nó vào đĩa chẳng hạn.

Bạn cũng có thể tạo {{domxref("Blob")}} từ canvas.

- {{domxref("HTMLCanvasElement.toBlob", "canvas.toBlob(callback, type, encoderOptions)")}}
  - : Tạo đối tượng `Blob` đại diện cho hình ảnh có trong canvas.

## Xem thêm

- {{domxref("ImageData")}}
- [Thao tác video bằng canvas](/en-US/docs/Web/API/Canvas_API/Manipulating_video_using_canvas)
- [Tải xuống hình ảnh do API Canvas tạo bằng cách sử dụng toBlob](https://www.digitalocean.com/community/tutorials/js-canvas-toblob)

{{PreviousNext("Web/API/Canvas_API/Tutorial/Advanced_animations", "Web/API/Canvas_API/Tutorial/Optimizing_canvas")}}
