---
title: XRViewport
slug: Web/API/XRViewport
page-type: web-api-interface
browser-compat: api.XRViewport
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Giao diện **`XRViewport`** của WebXR Device API cung cấp các thuộc tính dùng để mô tả kích thước và vị trí của khung nhìn (viewport) hiện tại trong {{domxref("XRWebGLLayer")}} đang được sử dụng để kết xuất cảnh 3D.

## Thuộc tính phiên bản

- {{domxref("XRViewport.height", "height")}} {{ReadOnlyInline}}
  - : Chiều cao, tính bằng pixel, của khung nhìn.
- {{domxref("XRViewport.width", "width")}} {{ReadOnlyInline}}
  - : Chiều rộng, tính bằng pixel, của khung nhìn.
- {{domxref("XRViewport.x", "x")}} {{ReadOnlyInline}}
  - : Độ lệch từ gốc tọa độ của bề mặt đồ họa đích (thường là {{domxref("XRWebGLLayer")}}) đến cạnh trái của khung nhìn, tính bằng pixel.
- {{domxref("XRViewport.y", "y")}} {{ReadOnlyInline}}
  - : Độ lệch từ gốc tọa độ của khung nhìn đến cạnh dưới cùng của khung nhìn; hệ tọa độ của WebGL đặt (0, 0) tại góc dưới bên trái của bề mặt.

## Ghi chú sử dụng

Hiện tại, loại bề mặt duy nhất có sẵn là {{domxref("XRWebGLLayer")}}. Hướng chính xác của hệ tọa độ có thể thay đổi với các loại bề mặt khác, nhưng trong WebGL, gốc tọa độ (0, 0) nằm ở góc dưới bên trái của bề mặt. Do đó, các giá trị được chỉ định trong `XRViewport` xác định một hình chữ nhật có góc dưới bên trái tại (`x`, `y`) và kéo dài `width` pixel sang bên trái và `height` pixel lên trên.

Các giá trị này có thể được truyền trực tiếp vào phương thức {{domxref("WebGLRenderingContext.viewport()")}}:

```js
const xrViewport = xrWebGLLayer.getViewport(xrView);
gl.viewport(xrViewport.x, xrViewport.y, xrViewport.width, xrViewport.height);
```

## Ví dụ

Ví dụ này thiết lập một hàm callback khung hình hoạt ảnh sử dụng {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}}. Sau khi thiết lập ban đầu, nó lặp qua từng khung nhìn trong pose của người xem, cấu hình khung nhìn theo chỉ dẫn của {{domxref("XRWebGLLayer")}}.

```js
xrSession.requestAnimationFrame((time, xrFrame) => {
  const viewerPose = xrFrame.getViewerPose(xrReferenceSpace);

  gl.bindFramebuffer(xrWebGLLayer.framebuffer);

  for (const xrView of viewerPose.views) {
    const xrViewport = xrWebGLLayer.getViewport(xrView);
    gl.viewport(
      xrViewport.x,
      xrViewport.y,
      xrViewport.width,
      xrViewport.height,
    );

    // Now we can use WebGL to draw into a viewport matching
    // the viewer's needs
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
