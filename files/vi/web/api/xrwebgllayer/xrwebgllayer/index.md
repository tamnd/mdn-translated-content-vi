---
title: "XRWebGLLayer: XRWebGLLayer() constructor"
short-title: XRWebGLLayer()
slug: Web/API/XRWebGLLayer/XRWebGLLayer
page-type: web-api-constructor
status:
  - experimental
browser-compat: api.XRWebGLLayer.XRWebGLLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Hàm khởi tạo **`XRWebGLLayer()`** của [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API) tạo và trả về một đối tượng {{domxref("XRWebGLLayer")}} mới, cung cấp liên kết giữa thiết bị WebXR và lớp đồ họa WebGL được sử dụng để hiển thị cảnh 3D.

## Cú pháp

```js-nolint
new XRWebGLLayer(session, context)
new XRWebGLLayer(session, context, options)
```

### Tham số

- `session`
  - : Một đối tượng {{domxref("XRSession")}} chỉ định phiên WebXR sẽ được hiển thị bằng ngữ cảnh WebGL.
- `context`
  - : Một {{domxref("WebGLRenderingContext")}} hoặc {{domxref("WebGL2RenderingContext")}} xác định ngữ cảnh vẽ WebGL để sử dụng cho việc hiển thị cảnh cho phiên WebXR đã chỉ định.
- `options` {{optional_inline}}
  - : Một đối tượng cung cấp các tùy chọn cấu hình cho `XRWebGLLayer` mới. Các tùy chọn có sẵn bao gồm:
    - `alpha`
      - : Bộ đệm màu của framebuffer sẽ được thiết lập với kênh alpha nếu thuộc tính Boolean `alpha` là `true`. Ngược lại, bộ đệm màu sẽ không có kênh alpha. Giá trị mặc định là `true`.
    - `antialias`
      - : Một giá trị Boolean là `true` nếu khử răng cưa được sử dụng khi hiển thị trong ngữ cảnh; ngược lại là `false`. Trình duyệt chọn phương thức khử răng cưa để sử dụng; hiện chưa có hỗ trợ để yêu cầu một chế độ cụ thể. Giá trị mặc định là `true`.
    - `depth`
      - : Một giá trị Boolean mà nếu là `true`, yêu cầu lớp mới có bộ đệm độ sâu; ngược lại, không có lớp độ sâu nào được cấp phát. Mặc định là `true`.
    - `framebufferScaleFactor`
      - : Một giá trị dấu phẩy động được sử dụng để thu phóng hình ảnh trong quá trình ghép, với giá trị 1.0 đại diện cho kích thước pixel mặc định cho framebuffer. Hàm tĩnh {{domxref("XRWebGLLayer")}} {{domxref("XRWebGLLayer.getNativeFramebufferScaleFactor_static", "XRWebGLLayer.getNativeFramebufferScaleFactor()")}} trả về tỷ lệ dẫn đến tỷ lệ pixel 1:1, do đó đảm bảo rằng việc hiển thị xảy ra ở độ phân giải gốc của thiết bị. Mặc định là 1.0.
    - `ignoreDepthValues`
      - : Một giá trị Boolean cho biết có bỏ qua nội dung của bộ đệm độ sâu khi ghép cảnh hay không. Mặc định là `false`.
    - `stencil`
      - : Một giá trị Boolean mà nếu là `true`, yêu cầu lớp mới bao gồm bộ đệm stencil. Ngược lại, không có bộ đệm stencil nào được cấp phát. Mặc định là `false`.

### Giá trị trả về

Một {{domxref("XRWebGLLayer")}} mới được tạo liên kết {{domxref("XRSession")}} đã chỉ định với ngữ cảnh WebGL được cho bởi `context`, sẽ được sử dụng làm renderer cho phiên. Bất kỳ tùy chọn nào được chỉ định trong `layerInit` đều được sử dụng để tùy chỉnh cấu hình hệ thống hiển thị.

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu `XRWebGLLayer` mới không thể được tạo do một trong một số lỗi trạng thái có thể xảy ra:
    - {{domxref("XRSession")}} được chỉ định bởi `session` đã bị dừng.
    - Ngữ cảnh WebGL được chỉ định, `context`, [đã bị mất](/en-US/docs/Web/API/WebGLRenderingContext/isContextLost#usage_notes) vì bất kỳ lý do nào, chẳng hạn như switch hoặc reset GPU.
    - `session` đã chỉ định là immersive nhưng `context` không tương thích với WebXR.
- `OperationError` {{domxref("DOMException")}}
  - : Được ném ra nếu các tài nguyên (bao gồm các bộ đệm bộ nhớ) cần thiết cho lớp hoạt động không thể được cấp phát.

## Ví dụ

Trong ví dụ này, một {{domxref("XRWebGLLayer")}} mới được tạo cho phiên WebXR `xrSession`.

```js
xrSession.updateRenderState({
  baseLayer: new XRWebGLLayer(xrSession, gl, {
    alpha: false,
    antialias: false,
    depth: false,
    framebufferScaleFactor: 0.5,
    ignoreDepthValues: true,
    stencil: false,
  }),
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
- [Getting started with WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Getting_started_with_WebGL)
- [Handling lost context in WebGL](https://wikis.khronos.org/webgl/HandlingContextLost): Khronos WebGL wiki
