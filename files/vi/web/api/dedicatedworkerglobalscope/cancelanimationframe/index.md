---
title: "DedicatedWorkerGlobalScope: cancelAnimationFrame() method"
short-title: cancelAnimationFrame()
slug: Web/API/DedicatedWorkerGlobalScope/cancelAnimationFrame
page-type: web-api-instance-method
browser-compat: api.DedicatedWorkerGlobalScope.cancelAnimationFrame
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`cancelAnimationFrame()`** của giao diện {{domxref("DedicatedWorkerGlobalScope")}} hủy một yêu cầu khung hình ảnh động đã được lên lịch trước đó bằng lời gọi {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()", "requestAnimationFrame()")}}.

Việc gọi phương thức `cancelAnimationFrame()` yêu cầu worker hiện tại phải có một owner {{domxref("Window", "window")}} được liên kết. Nghĩa là worker hiện tại phải được tạo bởi {{domxref("Window", "window")}} hoặc bởi một dedicated worker cũng có một owner {{domxref("Window", "window")}} được liên kết.

## Cú pháp

```js-nolint
cancelAnimationFrame(handle)
```

### Tham số

- `handle`
  - : Giá trị ID trả về từ lời gọi {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()", "requestAnimationFrame()")}}; lời gọi đó phải được thực hiện trong cùng một worker.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Được ném ra nếu phương thức này không được worker hiện tại hỗ trợ.

## Ví dụ

Đây là một ví dụ đầy đủ cho thấy cách dùng `requestAnimationFrame()` trong một dedicated worker với `OffscreenCanvas`.

HTML nên chứa:

```html
<canvas width="100" height="100"></canvas>
```

Nó nên liên kết tới JavaScript sau:

```js
const worker = new Worker("worker.js");

// Chuyển quyền điều khiển canvas sang worker
const offscreenCanvas = document
  .querySelector("canvas")
  .transferControlToOffscreen();

// Bắt đầu hoạt ảnh
worker.postMessage(
  {
    type: "start",
    canvas: offscreenCanvas,
  },
  [offscreenCanvas],
);

// Dừng hoạt ảnh sau 5 giây
setTimeout(() => {
  worker.postMessage({
    type: "stop",
  });
}, 5000);
```

**worker.js:**

```js
let ctx;
let pos = 0;
let animationId;
let isRunning = false;
let lastTime = 0;

function draw(currentTime) {
  if (!isRunning) return;

  // Tính delta time để hoạt ảnh mượt
  if (lastTime === 0) lastTime = currentTime;
  const deltaTime = (currentTime - lastTime) / 1000;
  lastTime = currentTime;

  // Xóa và vẽ hình chữ nhật đang di chuyển
  ctx.clearRect(0, 0, 100, 100);
  ctx.fillRect(pos, 0, 10, 10);
  pos += 50 * deltaTime; // Di chuyển 50 pixel mỗi giây

  // Lặp hoạt ảnh
  if (pos > 100) pos = -10;

  animationId = self.requestAnimationFrame(draw);
}

self.addEventListener("message", (e) => {
  if (e.data.type === "start") {
    const transferredCanvas = e.data.canvas;
    ctx = transferredCanvas.getContext("2d");
    isRunning = true;
    lastTime = 0;
    animationId = self.requestAnimationFrame(draw);
  }
  if (e.data.type === "stop") {
    isRunning = false;
    if (animationId) {
      self.cancelAnimationFrame(animationId);
    }
  }
});
```

Trên luồng chính, ta bắt đầu bằng cách chuyển quyền điều khiển của phần tử {{HTMLElement("canvas")}} sang một {{domxref("OffscreenCanvas")}}, dùng {{domxref("HTMLCanvasElement.transferControlToOffscreen()")}} và gửi một thông điệp `"start"` công việc của nó cho worker, kèm theo offscreen canvas.

Trong tệp worker (`worker.js`), ta xử lý logic hoạt ảnh. Khi nhận thông điệp `"start"`, worker bắt đầu hoạt ảnh, di chuyển hình chữ nhật từ trái sang phải. Khi nhận thông điệp `"stop"`, nó sẽ dừng hoạt ảnh.

Cuối cùng, luồng chính có thể gửi thông điệp `"stop"` đến worker để dừng hoạt ảnh sau một khoảng trễ, cho phép hoạt ảnh hiển thị trước khi dừng.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DedicatedWorkerGlobalScope.requestAnimationFrame()")}}
- {{domxref("Window.cancelAnimationFrame()")}}
