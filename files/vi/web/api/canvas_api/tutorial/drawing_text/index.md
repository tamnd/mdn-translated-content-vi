---
title: Vẽ văn bản
slug: Web/API/Canvas_API/Tutorial/Drawing_text
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Applying_styles_and_colors", "Web/API/Canvas_API/Tutorial/Using_images")}}

Sau khi xem cách [áp dụng kiểu và màu](/en-US/docs/Web/API/Canvas_API/Tutorial/Applying_styles_and_colors) trong chương trước, bây giờ chúng ta sẽ xem cách vẽ văn bản lên canvas.

## Vẽ văn bản

Ngữ cảnh hiển thị canvas cung cấp hai phương thức để hiển thị văn bản:

- {{domxref("CanvasRenderingContext2D.fillText", "fillText(text, x, y [, maxWidth])")}}
  - : Điền văn bản cho trước tại vị trí (x,y) đã cho. Tùy chọn với chiều rộng tối đa để vẽ.
- {{domxref("CanvasRenderingContext2D.strokeText", "strokeText(text, x, y [, maxWidth])")}}
  - : Vuốt một văn bản nhất định tại vị trí (x,y) đã cho. Tùy chọn với chiều rộng tối đa để vẽ.

### Ví dụ về `fillText`

Văn bản được điền bằng `fillStyle` hiện tại.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  ctx.font = "48px serif";
  ctx.fillText("Hello world", 10, 50);
}
```

```html hidden
<canvas id="canvas" width="300" height="100"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_fillText_example", 310, 110)}}

### Ví dụ về `strokeText`

Văn bản được điền bằng `strokeStyle` hiện tại.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  ctx.font = "48px serif";
  ctx.strokeText("Hello world", 10, 50);
}
```

```html hidden
<canvas id="canvas" width="300" height="100"></canvas>
```

```js hidden
draw();
```

{{EmbedLiveSample("A_strokeText_example", 310, 110)}}

## Tạo kiểu cho văn bản

Trong các ví dụ trên, chúng tôi đã sử dụng thuộc tính `font` để làm cho văn bản lớn hơn một chút so với kích thước mặc định. Có một số thuộc tính khác cho phép bạn điều chỉnh cách hiển thị văn bản trên canvas:

- {{domxref("CanvasRenderingContext2D.font", "font = value")}}
  - : Kiểu văn bản hiện tại đang được sử dụng khi vẽ văn bản. Chuỗi này sử dụng cú pháp tương tự như thuộc tính [CSS](/en-US/docs/Web/CSS) {{cssxref("font")}}. Phông chữ mặc định là sans-serif 10px.
- {{domxref("CanvasRenderingContext2D.textAlign", "textAlign = value")}}
  - : Cài đặt căn chỉnh văn bản. Các giá trị có thể có: `start`, `end`, `left`, `right` hoặc `center`. Giá trị mặc định là `start`.
- {{domxref("CanvasRenderingContext2D.textBaseline", "textBaseline = value")}}
  - : Cài đặt căn chỉnh đường cơ sở. Các giá trị có thể có: `top`, `hanging`, `middle`, `alphabetic`, `ideographic`, `bottom`. Giá trị mặc định là `alphabetic`.
- {{domxref("CanvasRenderingContext2D.direction", "direction = value")}}
  - : Tính định hướng. Các giá trị có thể có: `ltr`, `rtl`, `inherit`. Giá trị mặc định là `inherit`.

Những thuộc tính này có thể quen thuộc với bạn nếu bạn đã từng làm việc với CSS trước đây.

Sơ đồ sau từ [HTML spec](https://html.spec.whatwg.org/multipage/canvas.html#text-styles) thể hiện các đường cơ sở khác nhau được thuộc tính `textBaseline` hỗ trợ.

![Đường cơ sở phía trên gần như ở trên cùng của các ký tự trong một phông chữ, đường cơ sở treo là nơi neo một số ký tự như आ, phần giữa nằm giữa đường cơ sở phía trên và đường cơ sở phía dưới, đường cơ sở theo bảng chữ cái là nơi neo các ký tự như Á, ÿ, f và Ω, đường cơ sở dưới chữ tượng hình là nơi các ký tự như 私 và 達 được neo và đường cơ sở em-under gần như ở mức dưới cùng của glyphs trong một phông chữ. Phần trên cùng và dưới cùng của hộp giới hạn có thể cách xa các đường cơ sở này, do các ký tự kéo dài ra xa bên ngoài các đường cơ sở phần trên và phần dưới.](baselines.png)

### Ví dụ về `textBaseline`

Ví dụ này thể hiện các giá trị thuộc tính `textBaseline` khác nhau.
Xem trang [`CanvasRenderingContext2D.textBaseline`](/en-US/docs/Web/API/CanvasRenderingContext2D/textBaseline) để biết thêm thông tin và ví dụ chi tiết.

```html hidden live-sample___textBaseline
<canvas id="canvas" width="400" height="100"></canvas>
```

```js live-sample___textBaseline
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  ctx.font = "48px serif";

  ctx.textBaseline = "hanging";
  ctx.strokeText("hanging", 10, 50);

  ctx.textBaseline = "middle";
  ctx.strokeText("middle", 250, 50);

  ctx.beginPath();
  ctx.moveTo(10, 50);
  ctx.lineTo(300, 50);
  ctx.stroke();
}
```

```js hidden live-sample___textBaseline
draw();
```

{{EmbedLiveSample('textBaseline', 310, 110)}}

## Đo văn bản nâng cao

Trong trường hợp bạn cần biết thêm chi tiết về văn bản, phương pháp sau đây cho phép bạn đo lường nó.

- {{domxref("CanvasRenderingContext2D.measureText", "measureText()")}}
  - : Trả về đối tượng {{domxref("TextMetrics")}} chứa chiều rộng, tính bằng pixel, mà văn bản đã chỉ định sẽ có khi được vẽ theo kiểu văn bản hiện tại.

Đoạn mã sau đây cho thấy cách bạn có thể đo văn bản và lấy chiều rộng của nó.

```js
function draw() {
  const ctx = document.getElementById("canvas").getContext("2d");
  const text = ctx.measureText("foo"); // TextMetrics object
  text.width; // 16;
}
```

## Mối lo ngại về khả năng tiếp cận

Phần tử `<canvas>` chỉ là một bitmap và không cung cấp thông tin về bất kỳ đối tượng được vẽ nào. Văn bản được viết trên canvas có thể gây ra vấn đề về mức độ dễ đọc đối với người dùng dựa vào độ phóng đại của màn hình. Các pixel trong phần tử canvas không chia tỷ lệ và có thể bị mờ khi phóng đại. Điều này là do chúng không phải là một tập hợp các pixel mà là một vectơ hình chữ cái. Khi phóng to nó, các pixel sẽ trở nên lớn hơn.

Nội dung canvas không được hiển thị với các công cụ trợ năng như HTML ngữ nghĩa. Nói chung, bạn nên tránh sử dụng canvas trong trang web hoặc ứng dụng có thể truy cập. Một cách khác là sử dụng các phần tử HTML hoặc SVG thay vì canvas.

{{PreviousNext("Web/API/Canvas_API/Tutorial/Applying_styles_and_colors", "Web/API/Canvas_API/Tutorial/Using_images")}}
