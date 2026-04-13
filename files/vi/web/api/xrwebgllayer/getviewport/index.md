---
title: "XRWebGLLayer: getViewport() method"
short-title: getViewport()
slug: Web/API/XRWebGLLayer/getViewport
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLLayer.getViewport
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`getViewport()`** của giao diện {{domxref("XRWebGLLayer")}} trả về {{domxref("XRViewport")}} nên được sử dụng để hiển thị {{domxref("XRView")}} đã chỉ định vào lớp WebGL. Đối với các thiết bị WebXR sử dụng một framebuffer duy nhất cho cả mắt trái và mắt phải, viewport được trả về đại diện cho vùng của framebuffer mà cảnh nên được hiển thị cho mắt được đại diện bởi view.

## Cú pháp

```js-nolint
getViewport(view)
```

### Tham số

- `view`
  - : Một đối tượng {{domxref("XRView")}} cho biết view mà viewport cần được trả về.

### Giá trị trả về

Một đối tượng {{domxref("XRViewport")}} đại diện cho viewport sẽ giới hạn việc vẽ vào phần của lớp tương ứng với `view` đã chỉ định.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `view` đã chỉ định không nằm trong {{domxref("XRFrame")}} đang hoạt động hoặc `XRFrame` đó và {{domxref("XRWebGLLayer")}} không phải là một phần của cùng một [phiên WebXR](/en-US/docs/Web/API/XRSession).

## Ví dụ

Ví dụ này minh họa một phần những gì callback của hàm {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} có thể trông như thế nào, sử dụng `getViewport()` để lấy viewport để việc vẽ có thể bị giới hạn trong vùng dành riêng cho mắt có góc nhìn hiện đang được hiển thị.

Điều này hoạt động vì tập hợp các view được trả về bởi {{domxref("XRViewerPose")}} mỗi loại đại diện cho góc nhìn của một mắt về cảnh. Vì framebuffer được chia làm hai nửa, mỗi nửa cho mỗi mắt, việc đặt viewport WebGL để khớp với viewport của lớp WebXR sẽ đảm bảo rằng khi hiển thị cảnh cho pose của mắt hiện tại, nó được hiển thị vào nửa đúng của framebuffer.

```js
function drawFrame(time, frame) {
  const session = frame.session;

  const pose = frame.getViewerPose(mainReferenceSpace);

  if (pose) {
    const glLayer = session.renderState.baseLayer;
    gl.bindFramebuffer(gl.FRAMEBUFFER, glLayer.framebuffer);

    gl.clearColor(0, 0, 0, 1.0);
    gl.clearDepth(1.0);
    gl.clear(gl.COLOR_BUFFER_BIT, gl.DEPTH_COLOR_BIT);

    for (const view of pose.views) {
      const viewport = glLayer.getViewport(view);
      gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

      /* Render the scene now */
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
