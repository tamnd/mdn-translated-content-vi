---
title: "XRWebGLBinding: phương thức getSubImage()"
short-title: getSubImage()
slug: Web/API/XRWebGLBinding/getSubImage
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.getSubImage
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`getSubImage()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XRWebGLSubImage")}} đại diện cho kết cấu WebGL cần kết xuất.

## Cú pháp

```js-nolint
getSubImage(layer, frame)
getSubImage(layer, frame, eye)
```

### Tham số

- `layer`
  - : {{domxref("XRCompositionLayer")}} để sử dụng cho kết xuất (có thể là tất cả các loại đối tượng `XRCompositionLayer` ngoại trừ {{domxref("XRProjectionLayer")}}, xem {{domxref("XRWebGLBinding.getViewSubImage()")}} để kết xuất lớp chiếu).
- `frame`
  - : Khung {{domxref("XRFrame")}} để sử dụng cho kết xuất.
- `eye` {{optional_inline}}
  - : {{domxref("XRView.eye")}} tùy chọn cho biết mắt của khung nhìn nào cần sử dụng để kết xuất. Các giá trị có thể:
    - `left`
      - : {{domxref("XRView")}} đại diện cho điểm nhìn của mắt trái của người xem.
    - `right`
      - : Khung nhìn đại diện cho mắt phải của người xem.
    - `none`
      - : Khung nhìn mô tả chế độ nhìn đơn sắc, hoặc khung nhìn không đại diện cho điểm nhìn của mắt cụ thể nào.
        Mặc định là `none`.

### Giá trị trả về

Đối tượng {{domxref("XRWebGLSubImage")}}.

### Ngoại lệ

{{jsxref("TypeError")}} được ném ra,

- nếu `layer` không có trong [mảng `layer` của phiên](/en-US/docs/Web/API/XRSession/updateRenderState#setting_the_layers_array).
- nếu `layer` là {{domxref("XRProjectionLayer")}}.
- nếu thuộc tính [`layout`](/en-US/docs/Web/API/XRCompositionLayer/layout) của lớp là `default`.
- nếu thuộc tính [`layout`](/en-US/docs/Web/API/XRCompositionLayer/layout) của lớp là `stereo` và `eye` là `none`.

## Ví dụ

### Kết xuất một `XRQuadLayer`

Ví dụ sau kết xuất một {{domxref("XRQuadLayer")}}.

```js
const xrGlBinding = new XRWebGLBinding(xrSession, gl);
const quadLayer = xrGlBinding.createQuadLayer({
  space: xrReferenceSpace,
  viewPixelWidth: 512,
  viewPixelHeight: 512,
});

// Đặt cách gốc 2 mét với chiều rộng và chiều cao 1.5 mét
quadLayer.transform = new XRRigidTransform({ z: -2 });
quadLayer.width = 1.5;
quadLayer.height = 1.5;

const framebuffer = gl.createFramebuffer();
xrSession.updateRenderState({ layers: [quadLayer] });
xrSession.requestAnimationFrame(onXRFrame);

function onXRFrame(time, xrFrame) {
  xrSession.requestAnimationFrame(onXRFrame);

  gl.bindFramebuffer(gl.FRAMEBUFFER, framebuffer);
  let subImage = xrGlBinding.getSubImage(quadLayer, xrFrame);
  gl.framebufferTexture2D(
    gl.FRAMEBUFFER,
    gl.COLOR_ATTACHMENT0,
    subImage.colorTexture,
    0,
  );
  let viewport = subImage.viewport;
  gl.viewport(viewport.x, viewport.y, viewport.width, viewport.height);

  // Kết xuất nội dung cho lớp quad
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRWebGLSubImage")}}
