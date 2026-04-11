---
title: "WebGLRenderingContext: makeXRCompatible() method"
short-title: makeXRCompatible()
slug: Web/API/WebGLRenderingContext/makeXRCompatible
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.makeXRCompatible
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức {{domxref("WebGLRenderingContext")}} **`makeXRCompatible()`** đảm bảo rằng bối cảnh hiển thị được mô tả bởi `WebGLRenderingContext` sẵn sàng hiển thị cảnh cho thiết bị [WebXR](/en-US/docs/Web/API/WebXR_Device_API) sống động mà nó sẽ được hiển thị trên đó. Nếu cần thiết, lớp [WebGL](/en-US/docs/Web/API/WebGL_API) có thể cấu hình lại bối cảnh để sẵn sàng hiển thị cho một thiết bị khác với thiết bị ban đầu.

Điều này rất hữu ích nếu bạn có một ứng dụng có thể bắt đầu được trình bày trên màn hình 2D tiêu chuẩn nhưng sau đó có thể được chuyển sang hệ thống nhúng 3D.

## Cú pháp

```js-nolint
makeXRCompatible()
```

### Thông số

Không có.

### Giá trị trả về

Một [`Promise`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise) được giải quyết thành công khi bối cảnh WebGL sẵn sàng được sử dụng để hiển thị nội dung [WebXR](/en-US/docs/Web/API/WebXR_Device_API).

### Ngoại lệ

Phương pháp này không đưa ra các ngoại lệ truyền thống; thay vào đó, lời hứa sẽ từ chối với một trong các lỗi sau khi giá trị được chuyển vào trình xử lý từ chối:

- `AbortError` {{domxref("DOMException")}}
  - : Được trả về nếu việc chuyển ngữ cảnh sang ngữ cảnh tương thích với WebXR không thành công.
- `InvalidStateError` {{domxref("DOMException")}}
  - : Được trả về nếu ngữ cảnh WebGL bị mất hoặc không có thiết bị WebXR nào.

## ghi chú sử dụng

Bởi vì `makeXRCompatible()` có ​​thể liên quan đến việc thay thế bối cảnh WebGL cơ bản bằng một bối cảnh mới sử dụng phần cứng kết xuất mới, nội dung hiện có của bối cảnh có thể bị mất và do đó cần phải được kết xuất lại. Đây là lý do tại sao sự kiện [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event) và [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event) được sử dụng: sự kiện đầu tiên cho bạn cơ hội loại bỏ bất kỳ thứ gì bạn không cần nữa, trong khi sự kiện thứ hai cho bạn cơ hội tải tài nguyên và chuẩn bị hiển thị cảnh trong ngữ cảnh mới của nó.

Trong khi phương pháp này có sẵn thông qua giao diện {{domxref("WebGLRenderingContext")}}, nó thực sự được xác định bởi [API thiết bị WebXR](/en-US/docs/Web/API/WebXR_Device_API) chứ không phải bởi WebGL.

## Ví dụ

Ví dụ này minh họa logic mã mà bạn có thể tìm thấy trong một trò chơi khởi động bằng WebGL để hiển thị các menu và giao diện người dùng khác, đồng thời sử dụng WebGL để hiển thị lối chơi, nhưng có một nút trên menu chính cung cấp tùy chọn để bắt đầu trò chơi ở chế độ WebXR.

### HTML

HTML cho các nút trông như thế này:

```html
<button class="green button" type="button">Start Game</button>
<button class="blue button use-webxr" type="button">
  Start Game (VR mode)
</button>
```

Nút đầu tiên bắt đầu trò chơi, tiếp tục hiển thị trò chơi trên màn hình như bình thường. Nút thứ hai sẽ được sử dụng để bắt đầu trò chơi ở chế độ `immersive-vr`. Lưu ý có thêm lớp `use-webxr` trên nút chế độ VR. Điều này rất quan trọng mà chúng ta sẽ khám phá ngay sau đây.

### JavaScript

Mã xử lý việc khởi động đồ họa, chuyển sang chế độ VR, v.v. trông như thế này:

```js
const outputCanvas = document.querySelector(".output-canvas");
const gl = outputCanvas.getContext("webgl");
let xrSession = null;
let usingXR = false;
let currentScene = "scene1";
let glStartButton;
let xrStartButton;

loadSceneResources(currentScene);

glStartButton.addEventListener("click", handleStartButtonClick);
xrStartButton.addEventListener("click", handleStartButtonClick);

outputCanvas.addEventListener("webglcontextlost", (event) => {
  /* The context has been lost but can be restored */
  event.canceled = true;
});

/* When the GL context is reconnected, reload the resources for the
   current scene. */
outputCanvas.addEventListener("webglcontextrestored", (event) => {
  loadSceneResources(currentScene);
});

async function onStartedXRSession(xrSession) {
  try {
    await gl.makeXRCompatible();
  } catch (err) {
    switch (err) {
      case AbortError:
        showSimpleMessageBox(
          "Unable to transfer the game to your XR headset.",
          "Cancel",
        );
        break;
      case InvalidStateError:
        showSimpleMessageBox(
          "You don't appear to have a compatible XR headset available.",
          "Cancel",
        );
        break;
      default:
        handleFatalError(err);
        break;
    }
    xrSession.end();
  }
}

async function handleStartButtonClick(event) {
  if (event.target.classList.contains("use-webxr") && navigator.xr) {
    try {
      xrSession = await navigator.xr.requestSession("immersive-vr");
      usingXR = true;
    } catch (err) {
      xrSession = NULL;
      usingXR = false;
    }
  }
  startGame();
}

function startGame() {
  currentScene = "scene1";
  loadSceneResources(currentScene);

  /* and so on */
}
```

Tính năng này hoạt động bằng cách có hai nút, một nút bắt đầu trò chơi bình thường và nút còn lại bắt đầu trò chơi ở chế độ VR. Cả hai đều sử dụng hàm `handleStartButtonClick()` làm trình xử lý sự kiện. Hàm này xác định rằng nút được bấm là nút yêu cầu chế độ `immersive-vr` bằng cách kiểm tra xem nút đó có lớp `use-webxr` trên đó hay không. Nếu nút được người dùng nhấp vào có lớp đó (và chúng tôi đã xác nhận rằng WebXR có sẵn bằng cách đảm bảo rằng thuộc tính {{domxref("navigator.xr")}} tồn tại), chúng tôi sử dụng {{domxref("XRSystem.requestSession", "requestSession()")}} để yêu cầu một phiên WebXR mới và đặt cờ `usingXR` thành `true`.

Nếu nút khác được nhấp vào, chúng tôi đảm bảo rằng `xrSession` là `NULL` và xóa `usingXR` thành `false`.

Sau đó, chức năng `startGame()` được gọi để bắt đầu trò chơi.

Các trình xử lý được cung cấp cho cả [`webglcontextlost`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextlost_event) và [`webglcontextrestored`](/en-US/docs/Web/API/HTMLCanvasElement/webglcontextrestored_event); trong trường hợp đầu tiên, chúng tôi đảm bảo rằng chúng tôi biết rằng trạng thái có thể được khôi phục, trong khi ở trường hợp sau, chúng tôi thực sự tải lại cảnh để đảm bảo có đúng tài nguyên cho màn hình hoặc cấu hình tai nghe hiện tại.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}
