---
title: "XRSession: phương thức requestAnimationFrame()"
short-title: requestAnimationFrame()
slug: Web/API/XRSession/requestAnimationFrame
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRSession.requestAnimationFrame
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`requestAnimationFrame()`** của {{domxref("XRSession")}}, giống như phương thức cùng tên của {{domxref("Window")}}, lên lịch một callback để được thực hiện lần tiếp theo khi trình duyệt sẵn sàng vẽ môi trường ảo của phiên lên màn hình XR. Callback được chỉ định được thực hiện một lần trước lần vẽ lại tiếp theo; nếu bạn muốn nó được thực hiện cho lần vẽ lại tiếp theo, bạn phải gọi lại `requestAnimationFrame()`. Điều này có thể được thực hiện từ chính callback.

Callback nhận hai tham số làm đầu vào: một {{DOMxRef("XRFrame")}} mô tả trạng thái của tất cả các đối tượng được theo dõi cho phiên và một dấu thời gian bạn có thể sử dụng để tính toán bất kỳ cập nhật hoạt ảnh nào cần thiết.

Bạn có thể hủy một hoạt ảnh đã được lên lịch trước đó bằng cách gọi {{DOMxRef("XRSession.cancelAnimationFrame", "cancelAnimationFrame()")}}.

> [!NOTE]
> Mặc dù có sự tương đồng rõ ràng giữa các phương thức này và hàm toàn cầu {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}} được cung cấp bởi giao diện `Window`, bạn _không được_ coi chúng là có thể thay thế cho nhau. _Không_ có gì đảm bảo rằng hàm sau sẽ hoạt động khi một phiên XR nhậpvais đang diễn ra.

## Cú pháp

```js-nolint
requestAnimationFrame(animationFrameCallback)
```

### Tham số

- `animationFrameCallback`
  - : Một hàm được gọi trước lần vẽ lại tiếp theo để cho phép bạn cập nhật và kết xuất cảnh XR dựa trên thời gian trôi qua, hoạt ảnh, thay đổi đầu vào của người dùng, v.v. Callback nhận hai tham số làm đầu vào:
    - `time`
      - : Một {{domxref("DOMHighResTimeStamp")}} cho biết bù thời gian mà trạng thái người xem cập nhật được nhận từ thiết bị WebXR.
    - `xrFrame`
      - : Một đối tượng {{domxref("XRFrame")}} mô tả trạng thái của các đối tượng được theo dõi bởi phiên. Điều này có thể được sử dụng để lấy pose của người xem và chính cảnh đó, cũng như các thông tin khác cần thiết để kết xuất một khung hình của cảnh AR hoặc VR.

### Giá trị trả về

Một giá trị số nguyên đóng vai trò là ID hoặc handle duy nhất, khác không mà bạn có thể truyền cho {{domxref("XRSession.cancelAnimationFrame", "cancelAnimationFrame()")}} nếu cần xóa yêu cầu khung hình hoạt ảnh đang chờ.

## Ví dụ

Ví dụ sau đây yêu cầu `XRSession` với chế độ "inline" để nó có thể được hiển thị trong một phần tử HTML (mà không cần thiết bị AR hoặc VR riêng biệt).

> [!NOTE]
> Một ứng dụng thực tế nên kiểm tra xem thiết bị và Tác nhân người dùng có hỗ trợ WebXR API hay không và sau đó là họ có hỗ trợ loại phiên mong muốn thông qua {{DOMxRef("XRSystem.isSessionSupported()")}} hay không.

```js
// Obtain XR object
const XR = navigator.xr;

// Request a new XRSession
XR.requestSession("inline").then((xrSession) => {
  xrSession.requestAnimationFrame((time, xrFrame) => {
    const viewer = xrFrame.getViewerPose(xrReferenceSpace);

    gl.bindFramebuffer(xrWebGLLayer.framebuffer);
    for (const xrView of viewer.views) {
      const xrViewport = xrWebGLLayer.getViewport(xrView);
      gl.viewport(
        xrViewport.x,
        xrViewport.y,
        xrViewport.width,
        xrViewport.height,
      );

      // WebGL draw calls will now be rendered into the appropriate viewport.
    }
  });
});
```

Ví dụ sau được lấy trực tiếp từ bản nháp đặc tả. Ví dụ này minh họa một mẫu thiết kế đảm bảo chuyển đổi liền mạch giữa các hoạt ảnh không nhậpvai được tạo qua {{DOMxRef("Window.requestAnimationFrame")}} và các hoạt ảnh XR nhậpvai.

```js
let xrSession = null;

function onWindowAnimationFrame(time) {
  window.requestAnimationFrame(onWindowAnimationFrame);

  // This may be called while an immersive session is running on some devices,
  // such as a desktop with a tethered headset. To prevent two loops from
  // rendering in parallel, skip drawing in this one until the session ends.
  if (!xrSession) {
    renderFrame(time, null);
  }
}

// The window animation loop can be started immediately upon the page loading.
window.requestAnimationFrame(onWindowAnimationFrame);

function onXRAnimationFrame(time, xrFrame) {
  xrSession.requestAnimationFrame(onXRAnimationFrame);
  renderFrame(time, xrFrame);
}

function renderFrame(time, xrFrame) {
  // Shared rendering logic.
}

// Assumed to be called by a user gesture event elsewhere in code.
function startXRSession() {
  navigator.xr.requestSession("immersive-vr").then((session) => {
    xrSession = session;
    xrSession.addEventListener("end", onXRSessionEnded);
    // Do necessary session setup here.
    // Begin the session's animation loop.
    xrSession.requestAnimationFrame(onXRAnimationFrame);
  });
}

function onXRSessionEnded() {
  xrSession = null;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Window.requestAnimationFrame()")}}
- {{domxref("XRSession.cancelAnimationFrame()")}}
