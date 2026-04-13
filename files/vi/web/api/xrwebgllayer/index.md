---
title: XRWebGLLayer
slug: Web/API/XRWebGLLayer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.XRWebGLLayer
---

{{SecureContext_Header}}{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Giao diện **`XRWebGLLayer`** của WebXR Device API cung cấp liên kết giữa thiết bị WebXR (hoặc thiết bị XR mô phỏng trong trường hợp phiên inline) và ngữ cảnh WebGL được sử dụng để hiển thị cảnh cho thiết bị. Cụ thể, nó cung cấp quyền truy cập vào framebuffer WebGL và viewport để dễ dàng truy cập ngữ cảnh.

Mặc dù `XRWebGLLayer` hiện là loại lớp framebuffer duy nhất được [WebGL](/en-US/docs/Web/API/WebGL_API) hỗ trợ, hoàn toàn có thể các bản cập nhật trong tương lai của đặc tả WebXR có thể cho phép các loại lớp khác và các nguồn ảnh tương ứng.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("XRWebGLLayer.XRWebGLLayer", "XRWebGLLayer()")}} {{Experimental_Inline}}
  - : Tạo và trả về một đối tượng `XRWebGLLayer` mới để sử dụng bởi {{domxref("XRSession")}} đã chỉ định, sử dụng một {{domxref("WebGLRenderingContext")}} hoặc {{domxref("WebGL2RenderingContext")}} cụ thể làm ngữ cảnh đích.

## Thuộc tính phiên bản

- {{domxref('XRWebGLLayer.antialias', "antialias")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một giá trị Boolean cho biết framebuffer của ngữ cảnh WebGL có hỗ trợ khử răng cưa hay không. Loại khử răng cưa cụ thể được xác định bởi {{Glossary("user agent")}}.
- {{domxref('XRWebGLLayer.fixedFoveation', "fixedFoveation")}} {{Experimental_Inline}}
  - : Một số cho biết mức độ foveation được sử dụng bởi XR compositor. Fixed Foveated Rendering (FFR) hiển thị các cạnh của texture mắt ở độ phân giải thấp hơn so với trung tâm và giảm tải GPU.
- {{domxref('XRWebGLLayer.framebuffer', "framebuffer")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref('WebGLFramebuffer')}} phù hợp để truyền vào phương thức {{domxref("WebGLRenderingContext.bindFrameBuffer", "bindFrameBuffer()")}}.
- {{domxref('XRWebGLLayer.framebufferWidth', "framebufferWidth")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chiều rộng của framebuffer `XRWebGLLayer`.
- {{domxref('XRWebGLLayer.framebufferHeight', "framebufferHeight")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về chiều cao của framebuffer lớp.
- {{domxref('XRWebGLLayer.ignoreDepthValues', "ignoreDepthValues")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một Boolean cho biết liệu [WebXR compositor](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals#the_webxr_compositor) có nên sử dụng nội dung của bộ đệm độ sâu của lớp khi ghép cảnh hay không.

## Phương thức tĩnh

- {{domxref('XRWebGLLayer/getNativeFramebufferScaleFactor_static', "getNativeFramebufferScaleFactor()")}} {{Experimental_Inline}}
  - : Trả về hệ số tỷ lệ có thể được dùng để thu phóng độ phân giải framebuffer WebGL được đề xuất về độ phân giải gốc của thiết bị hiển thị.

## Phương thức phiên bản

- {{domxref('XRWebGLLayer.getViewport()', "getViewport()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng {{domxref('XRViewport')}} mới đại diện cho vị trí, chiều rộng và chiều cao mà [viewport của ngữ cảnh WebGL](/en-US/docs/Web/API/WebGLRenderingContext/viewport) phải được đặt để chứa vùng vẽ dành cho nội dung của view đã chỉ định trong framebuffer. Theo cách này, ví dụ, phần hiển thị góc nhìn của mắt trái và mắt phải mỗi loại được đặt vào phần đúng của framebuffer.

## Ví dụ

### Liên kết lớp với ngữ cảnh WebGL

Đoạn mã này, lấy từ [Drawing a frame](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion#drawing_a_frame) trong ví dụ WebXR "Movement and motion" của chúng tôi, cho thấy cách `XRWebGLLayer` được lấy từ trạng thái hiển thị của đối tượng {{domxref("XRSession")}} và sau đó được liên kết làm framebuffer WebGL hiển thị hiện tại bằng cách gọi hàm WebGL {{domxref("WebGLRenderingContext.bindFrameBuffer", "bindFrameBuffer()")}}.

```js
let glLayer = xrSession.renderState.baseLayer;
gl.bindFrameBuffer(gl.FRAMEBUFFER, glLayer.framebuffer);
```

### Hiển thị mọi view trong một frame

Mỗi khi GPU sẵn sàng hiển thị cảnh lên thiết bị XR, thời gian chạy XR gọi hàm bạn đã chỉ định khi gọi phương thức {{domxref("XRSession")}} {{domxref("XRSession.requestAnimationFrame", "requestAnimationFrame()")}} để yêu cầu hiển thị frame.

Hàm đó nhận làm đầu vào một {{domxref("XRFrame")}} đóng gói dữ liệu cần thiết để hiển thị frame. Thông tin này bao gồm pose (đối tượng {{domxref("XRViewerPose")}}) mô tả vị trí và hướng nhìn của người xem trong cảnh cũng như danh sách các đối tượng {{domxref("XRView")}}, mỗi đối tượng đại diện cho một góc nhìn về cảnh. Trong các triển khai WebXR hiện tại, sẽ không bao giờ có nhiều hơn hai mục trong danh sách này: một mô tả vị trí và góc nhìn của mắt trái và một mô tả tương tự cho mắt phải.

```js
let pose = xrFrame.getViewerPose(xrReferenceSpace);

if (pose) {
  const glLayer = xrSession.renderState.baseLayer;
  gl.bindFrameBuffer(gl.FRAMEBUFFER, glLayer.framebuffer);

  for (const view of pose.views) {
    const viewport = glLayer.getViewport(view);
    gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

    /* Render the view */
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Getting started with WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL)
- {{domxref('WebGLRenderingContext')}} và {{domxref("WebGL2RenderingContext")}}
- [Drawing a frame](/en-US/docs/Web/API/WebXR_Device_API/Movement_and_motion#drawing_a_frame) trong ví dụ WebXR "Movement and motion" của chúng tôi
