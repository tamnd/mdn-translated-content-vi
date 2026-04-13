---
title: OffscreenCanvasRenderingContext2D
slug: Web/API/OffscreenCanvasRenderingContext2D
page-type: web-api-interface
browser-compat: api.OffscreenCanvasRenderingContext2D
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

Giao diện **`OffscreenCanvasRenderingContext2D`** là ngữ cảnh kết xuất {{domxref("CanvasRenderingContext2D")}} để vẽ lên bitmap của đối tượng `OffscreenCanvas`. Nó tương tự như đối tượng `CanvasRenderingContext2D`, với các điểm khác biệt sau:

- không có hỗ trợ các tính năng giao diện người dùng (`drawFocusIfNeeded`)
- thuộc tính `canvas` của nó tham chiếu đến đối tượng `OffscreenCanvas` thay vì phần tử {{HtmlElement("canvas")}}
- bitmap cho phần tử {{HtmlElement("canvas")}} placeholder thuộc về đối tượng `OffscreenCanvas` được cập nhật trong quá trình cập nhật kết xuất của `Window` hoặc `Worker` sở hữu `OffscreenCanvas`

## Ví dụ

Đoạn code sau tạo đối tượng {{domxref("Worker")}} bằng cách sử dụng hàm khởi tạo {{domxref("Worker.Worker", "Worker()")}}. Phương thức `transferControlToOffscreen()` được sử dụng để lấy đối tượng `OffscreenCanvas` từ phần tử {{HtmlElement("canvas")}} để có thể chuyển sang worker:

```js
const canvas = document.getElementById("canvas");
const offscreen = canvas.transferControlToOffscreen();
const worker = new Worker("worker.js");
worker.postMessage({ canvas: offscreen }, [offscreen]);
```

Trong luồng worker, chúng ta có thể sử dụng `OffscreenCanvasRenderingContext2D` để vẽ lên bitmap của đối tượng `OffscreenCanvas`:

```js
onmessage = (event) => {
  const canvas = event.data.canvas;
  const offCtx = canvas.getContext("2d");
  // draw to the offscreen canvas context
  offCtx.fillStyle = "red";
  offCtx.fillRect(0, 0, 100, 100);
};
```

Để xem ví dụ đầy đủ, hãy xem [ví dụ OffscreenCanvas worker](https://github.com/mdn/dom-examples/tree/main/web-workers/offscreen-canvas-worker) ([chạy ví dụ OffscreenCanvas worker](https://mdn.github.io/dom-examples/web-workers/offscreen-canvas-worker/)).

## Phương thức bổ sung

Phương thức sau là mới trong giao diện `OffscreenCanvasRenderingContext2D` và không tồn tại trong giao diện `CanvasRenderingContext2D`:

- {{domxref("OffscreenCanvasRenderingContext2D.commit()", "commit()")}} {{deprecated_inline}} {{non-standard_inline}}
  - : Đẩy hình ảnh đã kết xuất lên phần tử {{HtmlElement("canvas")}} placeholder của đối tượng `OffscreenCanvas`.

## Tính năng không được hỗ trợ

Phương thức giao diện người dùng sau **không được hỗ trợ** bởi giao diện `OffscreenCanvasRenderingContext2D`:

- {{domxref("CanvasRenderingContext2D.drawFocusIfNeeded()")}}
  - : Nếu một phần tử đã cho được lấy nét, phương thức này vẽ vòng focus quanh đường dẫn hiện tại.

## Thuộc tính và phương thức kế thừa

_Các thuộc tính và phương thức sau được kế thừa từ {{domxref("CanvasRenderingContext2D")}}. Chúng có cách sử dụng giống như trong `CanvasRenderingContext2D`_

### Ngữ cảnh

- {{domxref("CanvasRenderingContext2D.getContextAttributes()")}} {{experimental_inline}}
  - : Trả về đối tượng chứa các thuộc tính ngữ cảnh thực tế. Thuộc tính ngữ cảnh có thể được yêu cầu bằng {{domxref("OffscreenCanvas.getContext()")}}.
- {{domxref("CanvasRenderingContext2D.isContextLost()")}}
  - : Trả về `true` nếu ngữ cảnh kết xuất bị mất.

### Vẽ hình chữ nhật

- {{domxref("CanvasRenderingContext2D.clearRect()")}}
  - : Đặt tất cả pixel trong hình chữ nhật được xác định bởi điểm bắt đầu _(x, y)_ và kích thước _(width, height)_ thành đen trong suốt, xóa mọi nội dung đã vẽ trước đó.
- {{domxref("CanvasRenderingContext2D.fillRect()")}}
  - : Vẽ một hình chữ nhật được tô màu tại vị trí _(x, y)_ với kích thước được xác định bởi _width_ và _height_.
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
  - : Vẽ một hình chữ nhật có điểm bắt đầu tại _(x, y)_ với chiều rộng _w_ và chiều cao _h_ lên canvas, sử dụng kiểu stroke hiện tại.

### Vẽ văn bản

- {{domxref("CanvasRenderingContext2D.fillText()")}}
  - : Vẽ (tô màu) văn bản đã cho tại vị trí (x, y) đã cho.
- {{domxref("CanvasRenderingContext2D.strokeText()")}}
  - : Vẽ (stroke) văn bản đã cho tại vị trí (x, y) đã cho.
- {{domxref("CanvasRenderingContext2D.measureText()")}}
  - : Trả về đối tượng {{domxref("TextMetrics")}}.

### Kiểu đường

- {{domxref("CanvasRenderingContext2D.lineWidth")}}
  - : Chiều rộng của đường. Mặc định `1.0`.
- {{domxref("CanvasRenderingContext2D.lineCap")}}
  - : Loại kết thúc ở cuối các đường. Các giá trị có thể: `butt` (mặc định), `round`, `square`.
- {{domxref("CanvasRenderingContext2D.lineJoin")}}
  - : Xác định loại góc nơi hai đường gặp nhau. Các giá trị có thể: `round`, `bevel`, `miter` (mặc định).
- {{domxref("CanvasRenderingContext2D.miterLimit")}}
  - : Tỷ lệ giới hạn miter. Mặc định `10`.
- {{domxref("CanvasRenderingContext2D.getLineDash()")}}
  - : Trả về mảng mẫu gạch đứt đoạn hiện tại chứa số chẵn các số không âm.
- {{domxref("CanvasRenderingContext2D.setLineDash()")}}
  - : Đặt mẫu gạch đứt đoạn hiện tại.
- {{domxref("CanvasRenderingContext2D.lineDashOffset")}}
  - : Chỉ định nơi bắt đầu mảng gạch đứt đoạn trên một đường.

### Kiểu fill và stroke

- {{domxref("CanvasRenderingContext2D.fillStyle")}}
  - : Màu sắc hoặc kiểu dùng bên trong hình dạng. Mặc định `black`.
- {{domxref("CanvasRenderingContext2D.strokeStyle")}}
  - : Màu sắc hoặc kiểu dùng cho các đường xung quanh hình dạng. Mặc định `black`.

### Gradient và mẫu

- {{domxref("CanvasRenderingContext2D.createConicGradient()")}}
  - : Tạo gradient hình nón quanh một điểm được xác định bởi tọa độ trong các tham số.
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
  - : Tạo gradient tuyến tính dọc theo đường được xác định bởi tọa độ trong các tham số.
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
  - : Tạo gradient hướng tâm từ tọa độ của hai vòng tròn trong các tham số.
- {{domxref("CanvasRenderingContext2D.createPattern()")}}
  - : Tạo mẫu sử dụng hình ảnh được chỉ định. Lặp lại nguồn theo các hướng được chỉ định bởi đối số lặp. Phương thức này trả về {{domxref("CanvasPattern")}}.

### Đường dẫn

- {{domxref("CanvasRenderingContext2D.beginPath()")}}
  - : Bắt đầu đường dẫn mới bằng cách xóa danh sách các đường dẫn con.
- {{domxref("CanvasRenderingContext2D.closePath()")}}
  - : Khiến điểm bút quay trở lại đầu đường dẫn con hiện tại.
- {{domxref("CanvasRenderingContext2D.moveTo()")}}
  - : Di chuyển điểm bắt đầu của đường dẫn con mới đến tọa độ (x, y).
- {{domxref("CanvasRenderingContext2D.lineTo()")}}
  - : Kết nối điểm cuối cùng trong đường dẫn con hiện tại với tọa độ (x, y) được chỉ định bằng một đường thẳng.
- {{domxref("CanvasRenderingContext2D.fill()")}}
  - : Tô màu các đường dẫn con hiện tại bằng kiểu fill hiện tại.
- {{domxref("CanvasRenderingContext2D.stroke()")}}
  - : Stroke các đường dẫn con hiện tại bằng kiểu stroke hiện tại.

### Biến đổi

- {{domxref("CanvasRenderingContext2D.getTransform()")}}
  - : Lấy ma trận biến đổi hiện tại đang được áp dụng cho ngữ cảnh.
- {{domxref("CanvasRenderingContext2D.rotate()")}}
  - : Thêm phép quay vào ma trận biến đổi.
- {{domxref("CanvasRenderingContext2D.scale()")}}
  - : Thêm phép co giãn vào canvas theo x theo chiều ngang và y theo chiều dọc.
- {{domxref("CanvasRenderingContext2D.translate()")}}
  - : Thêm phép dịch chuyển bằng cách di chuyển canvas và gốc tọa độ của nó x theo chiều ngang và y theo chiều dọc.

### Trạng thái canvas

- {{domxref("CanvasRenderingContext2D.save()")}}
  - : Lưu trạng thái kiểu vẽ hiện tại bằng stack.
- {{domxref("CanvasRenderingContext2D.restore()")}}
  - : Khôi phục trạng thái kiểu vẽ về phần tử cuối cùng trong stack trạng thái được lưu bởi `save()`.
- {{domxref("CanvasRenderingContext2D.canvas")}}
  - : Tham chiếu chỉ đọc đến đối tượng `OffscreenCanvas`.
- {{domxref("CanvasRenderingContext2D.reset()")}}
  - : Đặt lại trạng thái kiểu vẽ hiện tại về các giá trị mặc định.

### Bộ lọc

- {{domxref("CanvasRenderingContext2D.filter")}}
  - : Áp dụng bộ lọc CSS hoặc SVG lên canvas; ví dụ để thay đổi độ sáng hoặc độ mờ của nó.

## Thuộc tính và phương thức không được hỗ trợ

Phương thức sau **không được hỗ trợ** trong giao diện `OffscreenCanvasRenderingContext2D`:

- {{domxref("CanvasRenderingContext2D.drawFocusIfNeeded()")}}
  - : Nếu một phần tử đã cho được lấy nét, phương thức này vẽ vòng focus quanh đường dẫn hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement")}}
- {{HTMLElement("canvas")}}
