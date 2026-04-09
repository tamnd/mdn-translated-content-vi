---
title: Canvas API
slug: Web/API/Canvas_API
page-type: web-api-overview
browser-compat: html.elements.canvas
---

{{DefaultAPISidebar("Canvas API")}}

**API Canvas** cung cấp phương tiện để vẽ đồ họa thông qua [JavaScript](/en-US/docs/Web/JavaScript) và phần tử [HTML](/en-US/docs/Web/HTML) {{HtmlElement("canvas")}}. Trong số những thứ khác, nó có thể được sử dụng cho hoạt ảnh, đồ họa trò chơi, trực quan hóa dữ liệu, xử lý ảnh và xử lý video thời gian thực.

API Canvas chủ yếu tập trung vào đồ họa 2D. [WebGL API](/en-US/docs/Web/API/WebGL_API), cũng sử dụng phần tử `<canvas>`, vẽ đồ họa 2D và 3D được tăng tốc phần cứng.

## Ví dụ cơ bản

Ví dụ đơn giản này vẽ một hình chữ nhật màu xanh lá cây lên canvas.

### HTML

```html
<canvas id="canvas"></canvas>
```

### JavaScript

Phương thức {{domxref("Document.getElementById()")}} lấy tham chiếu đến phần tử HTML `<canvas>`. Tiếp theo, phương thức {{domxref("HTMLCanvasElement.getContext()")}} lấy bối cảnh của phần tử đó—thứ mà bản vẽ sẽ được hiển thị trên đó.

Bản vẽ thực tế được thực hiện bằng giao diện {{domxref("CanvasRenderingContext2D")}}. Thuộc tính {{domxref("CanvasRenderingContext2D.fillStyle", "fillStyle")}} làm cho hình chữ nhật có màu xanh lục. Phương thức {{domxref("CanvasRenderingContext2D.fillRect()", "fillRect()")}} đặt góc trên cùng bên trái của nó ở (10, 10) và cho nó kích thước rộng 150 đơn vị x cao 100 đơn vị.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

ctx.fillStyle = "green";
ctx.fillRect(10, 10, 150, 100);
```

### Kết quả

{{ EmbedLiveSample('Basic_example', 700, 180) }}

## Tham chiếu

- {{domxref("HTMLCanvasElement")}}
- {{domxref("CanvasRenderingContext2D")}}
- {{domxref("CanvasGradient")}}
- {{domxref("CanvasPattern")}}
- {{domxref("ImageBitmap")}}
- {{domxref("ImageData")}}
- {{domxref("TextMetrics")}}
- {{domxref("OffscreenCanvas")}}
- {{domxref("Path2D")}} {{experimental_inline}}
- {{domxref("ImageBitmapRenderingContext")}} {{experimental_inline}}

> [!NOTE]
> Các giao diện liên quan đến `WebGLRenderingContext` được tham chiếu trong [WebGL](/en-US/docs/Web/API/WebGL_API).

> [!NOTE]
> {{domxref("OffscreenCanvas")}} cũng có sẵn trong web worker.

{{domxref("CanvasCaptureMediaStreamTrack")}} là một giao diện liên quan.

## Hướng dẫn và bài thực hành

- [Hướng dẫn canvas](/en-US/docs/Web/API/Canvas_API/Tutorial)
  - : Hướng dẫn toàn diện bao gồm cả cách sử dụng cơ bản của API Canvas và các tính năng nâng cao của nó.
- [Tìm hiểu sâu về canvas HTML5](https://joshondesign.com/p/books/canvasdeepdive/title.html)
  - : Phần giới thiệu thực tế dài như một cuốn sách về API Canvas và WebGL.
- [Sổ tay canvas](https://bucephalus.org/text/CanvasHandbook/CanvasHandbook.html)
  - : Một tài liệu tham khảo hữu ích cho API Canvas.
- [Thao tác video bằng canvas](/en-US/docs/Web/API/Canvas_API/Manipulating_video_using_canvas)
  - : Kết hợp {{HTMLElement("video")}} và {{HTMLElement("canvas")}} để xử lý dữ liệu video trong thời gian thực.

## Thư viện

API Canvas cực kỳ mạnh mẽ nhưng không phải lúc nào cũng đơn giản để sử dụng. Các thư viện được liệt kê bên dưới có thể giúp việc tạo dự án dựa trên canvas nhanh hơn và dễ dàng hơn.

- [EaselJS](https://createjs.com/easeljs) là thư viện canvas mã nguồn mở giúp tạo trò chơi, nghệ thuật sáng tạo và các trải nghiệm đồ họa cao khác một cách dễ dàng.
- [Fabric.js](https://fabricjs.com/) là thư viện canvas nguồn mở có khả năng phân tích cú pháp SVG.
- [heatmap.js](https://www.patrick-wied.at/static/heatmapjs/) là thư viện mã nguồn mở để tạo bản đồ nhiệt dữ liệu dựa trên canvas.
- [JavaScript InfoVis Toolkit](https://philogb.github.io/jit/) tạo trực quan hóa dữ liệu tương tác.
- [Konva.js](https://konvajs.org/) là thư viện canvas 2D dành cho máy tính để bàn và ứng dụng di động.
- [p5.js](https://p5js.org/) có bộ đầy đủ chức năng vẽ canvas dành cho nghệ sĩ, nhà thiết kế, nhà giáo dục và người mới bắt đầu.
- [Phaser](https://phaser.io/) là khung nguồn mở nhanh, miễn phí và thú vị dành cho các trò chơi trình duyệt hỗ trợ Canvas và WebGL.
- [Pts.js](https://ptsjs.org/) là một thư viện để mã hóa và trực quan hóa sáng tạo trong canvas và SVG.
- [Rekapi](https://github.com/jeremyckahn/rekapi) là API tạo khung khóa hoạt ảnh cho Canvas.
- [Scrawl-canvas](https://scrawl.rikweb.org.uk/) là thư viện JavaScript mã nguồn mở để tạo và thao tác các phần tử canvas 2D.
- Khung [ZIM](https://zimjs.com/) cung cấp các tiện ích, thành phần và điều khiển để mã hóa sự sáng tạo trên canvas — bao gồm khả năng truy cập và hàng trăm hướng dẫn đầy màu sắc.
- [Sprig](https://github.com/hackclub/sprig) là thư viện phát triển trò chơi dựa trên ô xếp, mã nguồn mở, thân thiện với người mới bắt đầu, sử dụng Canvas.

> [!NOTE]
> Xem [WebGL API](/en-US/docs/Web/API/WebGL_API) để biết các thư viện 2D và 3D sử dụng WebGL.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebGL](/en-US/docs/Web/API/WebGL_API)
