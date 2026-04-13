---
title: "XRWebGLBinding: phương thức createProjectionLayer()"
short-title: createProjectionLayer()
slug: Web/API/XRWebGLBinding/createProjectionLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.createProjectionLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createProjectionLayer()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XRProjectionLayer")}}, là một lớp lấp đầy toàn bộ tầm nhìn của người quan sát và được làm mới gần với tốc độ khung gốc của thiết bị.

## Cú pháp

```js-nolint
createProjectionLayer(options)
```

### Tham số

- `options`
  - : Đối tượng để cấu hình {{domxref("XRProjectionLayer")}}.
    - `textureType` {{optional_inline}}
      - : Chuỗi xác định loại kết cấu mà lớp sẽ có. Các giá trị có thể:
        - `texture`
          - : Các kết cấu của {{domxref("XRWebGLSubImage")}} sẽ có kiểu `gl.TEXTURE_2D`.
        - `texture-array`
          - : Các kết cấu của {{domxref("XRWebGLSubImage")}} sẽ có kiểu `gl.TEXTURE_2D_ARRAY` (chỉ dành cho ngữ cảnh WebGL 2).
            Giá trị mặc định là `texture`.
    - `colorFormat` {{optional_inline}}
      - : {{domxref("WebGL_API/Types", "GLenum")}} xác định kiểu dữ liệu của dữ liệu kết cấu màu. Các giá trị có thể:
        - `gl.RGB`
        - `gl.RGBA`
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("EXT_sRGB")}} được kích hoạt:
        - `ext.SRGB_EXT`
        - `ext.SRGB_ALPHA_EXT`
          Ngoài ra, cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}}:
        - `gl.RGBA8`
        - `gl.RGB8`
        - `gl.SRGB8`
        - `gl.RGB8_ALPHA8`
          Giá trị mặc định là `gl.RGBA`.
    - `depthFormat` {{optional_inline}}
      - : {{domxref("WebGL_API/Types", "GLenum")}} xác định kiểu dữ liệu của dữ liệu kết cấu độ sâu hoặc `0` cho biết lớp không nên cung cấp kết cấu độ sâu. (Trong trường hợp đó {{domxref("XRProjectionLayer.ignoreDepthValues")}} sẽ là `true`.)
        Các giá trị có thể trong các ngữ cảnh {{domxref("WebGLRenderingContext")}} có phần mở rộng {{domxref("WEBGL_depth_texture")}} được kích hoạt, hoặc trong các ngữ cảnh {{domxref("WebGL2RenderingContext")}} (không cần phần mở rộng):
        - `gl.DEPTH_COMPONENT`
        - `gl.DEPTH_STENCIL`
          Ngoài ra, cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}}:
        - `gl.DEPTH_COMPONENT24`
        - `gl.DEPTH24_STENCIL24`
          Giá trị mặc định là `gl.DEPTH_COMPONENT`.
    - `scaleFactor` {{optional_inline}}
      - : Giá trị dấu phẩy động được sử dụng để chia tỷ lệ lớp trong quá trình ghép hình. Giá trị `1.0` đại diện cho kích thước pixel mặc định của bộ đệm khung. (Xem thêm {{domxref("XRWebGLLayer.getNativeFramebufferScaleFactor_static", "XRWebGLLayer.getNativeFramebufferScaleFactor()")}}.) Không giống các lớp khác, `XRProjectionLayer` không thể được tạo với chiều rộng và chiều cao pixel rõ ràng, vì kích thước được suy ra bởi phần cứng. (Các lớp chiếu lấp đầy toàn bộ tầm nhìn của người quan sát.)

### Giá trị trả về

Đối tượng {{domxref("XRProjectionLayer")}}.

## Ví dụ

### Tạo một `XRProjectionLayer` trong ngữ cảnh WebGL 2

Tùy chọn `textureType` cho phép phân bổ một mảng kết cấu thay thế, trong đó mỗi {{domxref("XRView")}} sẽ được kết xuất vào một cấp riêng biệt của mảng. Điều này cho phép một số tối ưu hóa kết xuất, chẳng hạn như việc sử dụng phần mở rộng {{domxref("OVR_multiview2")}} có sẵn trong các ngữ cảnh WebGL 2.

```js
function onXRSessionStarted(xrSession) {
  const glCanvas = document.createElement("canvas");
  const gl = glCanvas.getContext("webgl2", { xrCompatible: true });
  const xrGlBinding = new XRWebGLBinding(xrSession, gl);
  const projectionLayer = xrGlBinding.createProjectionLayer({
    textureType: "texture-array",
  });
  xrSession.updateRenderState({
    layers: [projectionLayer],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRProjectionLayer")}}
- [Hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants)
