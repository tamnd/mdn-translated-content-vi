---
title: OffscreenCanvas
slug: Web/API/OffscreenCanvas
page-type: web-api-interface
browser-compat: api.OffscreenCanvas
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Khi sử dụng phần tử {{HtmlElement("canvas")}} hoặc [Canvas API](/en-US/docs/Web/API/Canvas_API), việc dựng hình, hoạt ảnh và tương tác người dùng thường diễn ra trên luồng thực thi chính của ứng dụng web.
Phần tính toán liên quan đến hoạt ảnh và kết xuất canvas có thể ảnh hưởng đáng kể đến hiệu năng ứng dụng.

Giao diện **`OffscreenCanvas`** cung cấp một canvas có thể được dựng hình ngoài màn hình, tách DOM khỏi Canvas API để phần tử {{HtmlElement("canvas")}} không còn phụ thuộc hoàn toàn vào DOM.
Các thao tác dựng hình cũng có thể chạy trong ngữ cảnh [worker](/en-US/docs/Web/API/Web_Workers_API), cho phép bạn chạy một số tác vụ trên luồng riêng và tránh công việc nặng trên luồng chính.

`OffscreenCanvas` là một [đối tượng có thể chuyển giao](/en-US/docs/Web/API/Web_Workers_API/Transferable_objects).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("OffscreenCanvas.OffscreenCanvas", "OffscreenCanvas()")}}
  - : Hàm khởi tạo `OffscreenCanvas`. Tạo một đối tượng `OffscreenCanvas` mới.

## Thuộc tính thể hiện

- {{domxref("OffscreenCanvas.height")}}
  - : Chiều cao của canvas ngoài màn hình.
- {{domxref("OffscreenCanvas.width")}}
  - : Chiều rộng của canvas ngoài màn hình.

## Phương thức thể hiện

- {{domxref("OffscreenCanvas.getContext()")}}
  - : Trả về ngữ cảnh vẽ cho canvas ngoài màn hình, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu mã định danh ngữ cảnh không được hỗ trợ, hoặc canvas ngoài màn hình đã được đặt sang một chế độ ngữ cảnh khác.
- {{domxref("OffscreenCanvas.convertToBlob()")}}
  - : Tạo một đối tượng {{domxref("Blob")}} biểu diễn hình ảnh chứa trong canvas.
- {{domxref("OffscreenCanvas.transferToImageBitmap()")}}
  - : Tạo một đối tượng {{domxref("ImageBitmap")}} từ hình ảnh được kết xuất gần đây nhất của `OffscreenCanvas`. Xem tài liệu tham khảo của nó để biết các lưu ý quan trọng khi quản lý {{domxref("ImageBitmap")}} này.

## Sự kiện

_Kế thừa sự kiện từ phần tử cha, {{domxref("EventTarget")}}._

Lắng nghe các sự kiện này bằng {{DOMxRef("EventTarget.addEventListener", "addEventListener()")}} hoặc bằng cách gán một trình lắng nghe sự kiện cho thuộc tính `oneventname` của giao diện này.

- [`contextlost`](/en-US/docs/Web/API/OffscreenCanvas/contextlost_event)
  - : Kích hoạt nếu trình duyệt phát hiện ngữ cảnh [`OffscreenCanvasRenderingContext2D`](/en-US/docs/Web/API/OffscreenCanvasRenderingContext2D) bị mất.
- [`contextrestored`](/en-US/docs/Web/API/OffscreenCanvas/contextrestored_event)
  - : Kích hoạt nếu trình duyệt khôi phục thành công ngữ cảnh [`OffscreenCanvasRenderingContext2D`](/en-US/docs/Web/API/OffscreenCanvasRenderingContext2D).

## Ví dụ

### Hiển thị đồng bộ các khung do `OffscreenCanvas` tạo ra

Một cách dùng API `OffscreenCanvas` là sử dụng một ngữ cảnh kết xuất đã lấy từ đối tượng `OffscreenCanvas` để tạo các khung hình mới. Khi một khung hình mới đã kết xuất xong trong ngữ cảnh này, có thể gọi phương thức {{domxref("OffscreenCanvas.transferToImageBitmap", "transferToImageBitmap()")}} để lưu hình ảnh được kết xuất gần nhất. Phương thức này trả về một đối tượng {{domxref("ImageBitmap")}}, có thể được dùng trong nhiều Web API khác nhau và cả trong canvas thứ hai mà không cần tạo bản sao chuyển giao.

Để hiển thị `ImageBitmap`, bạn có thể dùng ngữ cảnh {{domxref("ImageBitmapRenderingContext")}}, ngữ cảnh này có thể được tạo bằng cách gọi `canvas.getContext("bitmaprenderer")` trên một phần tử canvas (hiển thị). Ngữ cảnh này chỉ cung cấp chức năng thay thế nội dung canvas bằng `ImageBitmap` đã cho. Một lệnh gọi {{domxref("ImageBitmapRenderingContext.transferFromImageBitmap()")}} với `ImageBitmap` đã được kết xuất và lưu từ OffscreenCanvas trước đó sẽ hiển thị `ImageBitmap` trên canvas và chuyển quyền sở hữu của nó sang canvas. Một `OffscreenCanvas` đơn lẻ có thể chuyển các khung hình vào số lượng bất kỳ đối tượng `ImageBitmapRenderingContext` nào khác.

Với hai phần tử {{HTMLElement("canvas")}} sau

```html
<canvas id="one"></canvas> <canvas id="two"></canvas>
```

đoạn mã sau sẽ thực hiện kết xuất bằng `OffscreenCanvas` như mô tả ở trên.

```js
const one = document.getElementById("one").getContext("bitmaprenderer");
const two = document.getElementById("two").getContext("bitmaprenderer");

const offscreen = new OffscreenCanvas(256, 256);
const gl = offscreen.getContext("webgl");

// Thực hiện một số thao tác vẽ cho canvas thứ nhất bằng ngữ cảnh gl
const bitmapOne = offscreen.transferToImageBitmap();
one.transferFromImageBitmap(bitmapOne);

// Thực hiện thêm một số thao tác vẽ cho canvas thứ hai
const bitmapTwo = offscreen.transferToImageBitmap();
two.transferFromImageBitmap(bitmapTwo);
```

### Hiển thị bất đồng bộ các khung do `OffscreenCanvas` tạo ra

Một cách khác để dùng API `OffscreenCanvas` là gọi {{domxref("HTMLCanvasElement.transferControlToOffscreen", "transferControlToOffscreen()")}} trên phần tử {{HTMLElement("canvas")}}, dù là trong [worker](/en-US/docs/Web/API/Web_Workers_API) hay trên luồng chính, thao tác này sẽ trả về một đối tượng `OffscreenCanvas` từ đối tượng {{domxref("HTMLCanvasElement")}} ở luồng chính. Khi gọi {{domxref("OffscreenCanvas.getContext", "getContext()")}}, bạn sẽ lấy được ngữ cảnh kết xuất từ `OffscreenCanvas` đó.

Tập lệnh `main.js` (luồng chính) có thể trông như sau:

```js
const htmlCanvas = document.getElementById("canvas");
const offscreen = htmlCanvas.transferControlToOffscreen();

const worker = new Worker("offscreen-canvas.js");
worker.postMessage({ canvas: offscreen }, [offscreen]);
```

Trong khi tập lệnh `offscreen-canvas.js` (luồng worker) có thể như sau:

```js
onmessage = (evt) => {
  const canvas = evt.data.canvas;
  const gl = canvas.getContext("webgl");
  // Thực hiện một số thao tác vẽ bằng ngữ cảnh gl
};
```

Cũng có thể dùng {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} trong worker:

```js
onmessage = (evt) => {
  const canvas = evt.data.canvas;
  const gl = canvas.getContext("webgl");

  function render(time) {
    // Thực hiện một số thao tác vẽ bằng ngữ cảnh gl
    requestAnimationFrame(render);
  }
  requestAnimationFrame(render);
};
```

Để xem ví dụ đầy đủ, xem [mã nguồn ví dụ OffscreenCanvas](https://github.com/mdn/dom-examples/tree/main/web-workers/offscreen-canvas-worker) trên GitHub hoặc chạy [ví dụ OffscreenCanvas trực tiếp](https://mdn.github.io/dom-examples/web-workers/offscreen-canvas-worker/).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D")}}
- {{domxref("OffscreenCanvasRenderingContext2D")}}
- {{domxref("ImageBitmap")}}
- {{domxref("ImageBitmapRenderingContext")}}
- {{domxref("HTMLCanvasElement.transferControlToOffscreen()")}}
- {{domxref("Window.requestAnimationFrame()", "requestAnimationFrame()")}}
- [WebGL Off the Main Thread – Mozilla Hacks](https://hacks.mozilla.org/2016/01/webgl-off-the-main-thread/) (2016)
