---
title: "DedicatedWorkerGlobalScope: requestAnimationFrame() method"
short-title: requestAnimationFrame()
slug: Web/API/DedicatedWorkerGlobalScope/requestAnimationFrame
page-type: web-api-instance-method
browser-compat: api.DedicatedWorkerGlobalScope.requestAnimationFrame
---

{{APIRef("Web Workers API")}}{{AvailableInWorkers("dedicated")}}

Phương thức **`requestAnimationFrame()`** của giao diện {{domxref("DedicatedWorkerGlobalScope")}} báo cho trình duyệt biết rằng bạn muốn thực hiện một yêu cầu khung hình ảnh động và gọi một hàm callback do người dùng cung cấp trước lần repaint tiếp theo.

Tần suất gọi hàm callback thường sẽ khớp với tốc độ làm tươi của màn hình. Tốc độ làm tươi phổ biến nhất là 60 Hz, (60 chu kỳ/khung hình mỗi giây), dù 75 Hz, 120 Hz và 144 Hz cũng được dùng rộng rãi. Các lời gọi `requestAnimationFrame()` bị tạm dừng trong hầu hết trình duyệt khi chạy ở tab nền hoặc các {{HTMLElement("iframe")}} bị ẩn, nhằm cải thiện hiệu năng và thời lượng pin.

Một lời gọi tới phương thức `requestAnimationFrame()` chỉ lên lịch một lần gọi duy nhất cho hàm callback. Nếu bạn muốn tạo hiệu ứng cho khung hình tiếp theo, hàm callback của bạn phải gọi lại `requestAnimationFrame()`.

> [!WARNING]
> Hãy luôn dùng đối số đầu tiên (hoặc một phương pháp khác để lấy thời gian hiện tại) để tính toán mức độ hoạt ảnh tiến triển trong một khung hình, nếu không, hoạt ảnh sẽ chạy nhanh hơn trên màn hình có tốc độ làm tươi cao. Xem các ví dụ bên dưới để biết cách thực hiện.

Việc gọi phương thức `requestAnimationFrame()` yêu cầu worker hiện tại phải có một owner {{domxref("Window", "window")}} được liên kết. Nghĩa là worker hiện tại phải được tạo bởi {{domxref("Window", "window")}} hoặc bởi một dedicated worker cũng có một owner {{domxref("Window", "window")}} được liên kết.

## Cú pháp

```js-nolint
requestAnimationFrame(callback)
```

### Tham số

- `callback`
  - : Hàm sẽ được gọi khi đến lúc cập nhật hoạt ảnh cho lần repaint tiếp theo. Hàm callback này nhận một đối số duy nhất:
    - `timestamp`
      - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm kết thúc việc kết xuất của khung hình trước đó (dựa trên số mili giây kể từ [time origin](/en-US/docs/Web/API/Performance/timeOrigin)). Timestamp là một số thập phân, tính bằng mili giây, nhưng có độ chính xác tối thiểu là 1 mili giây. Giá trị timestamp cũng tương tự như việc gọi {{domxref('performance.now()')}} ở đầu hàm callback, nhưng không bao giờ là cùng một giá trị.

        Khi nhiều callback được xếp hàng bởi `requestAnimationFrame()` bắt đầu chạy trong cùng một khung hình, mỗi callback sẽ nhận cùng một timestamp dù thời gian đã trôi qua trong quá trình tính toán của khối lượng công việc của các callback trước đó.

### Giá trị trả về

Một giá trị số nguyên `long` là ID của yêu cầu, định danh duy nhất cho mục trong danh sách callback.
Đây là một giá trị khác 0, nhưng bạn không nên giả định thêm điều gì về nó. Bạn có thể truyền giá trị này tới {{domxref("DedicatedWorkerGlobalScope.cancelAnimationFrame()", "cancelAnimationFrame()")}} để hủy yêu cầu callback làm mới, thao tác hủy phải được thực hiện trong cùng worker.

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

- {{domxref("DedicatedWorkerGlobalScope.cancelAnimationFrame()")}}
- {{domxref("Window.requestAnimationFrame()")}}
