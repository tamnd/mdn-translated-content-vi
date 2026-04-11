---
title: "XRWebGLBinding: phương thức createCubeLayer()"
short-title: createCubeLayer()
slug: Web/API/XRWebGLBinding/createCubeLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.createCubeLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createCubeLayer()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XRCubeLayer")}}, là một lớp kết xuất trực tiếp từ [cubemap](https://en.wikipedia.org/wiki/Cube_mapping) và chiếu nó lên các mặt bên trong của một khối lập phương.

## Cú pháp

```js-nolint
createCubeLayer(init)
```

### Tham số

- `init`
  - : Đối tượng để cấu hình {{domxref("XRCubeLayer")}}. Nó phải có các thuộc tính `space`, `viewPixelHeight` và `viewPixelWidth`. `init` có các thuộc tính sau:
    - `colorFormat` {{optional_inline}}
      - : {{domxref("WebGL_API/Types", "GLenum")}} xác định kiểu dữ liệu của dữ liệu kết cấu màu. Các giá trị có thể:
        - `gl.RGB`
        - `gl.RGBA` (Mặc định)
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("EXT_sRGB")}} được kích hoạt:
        - `ext.SRGB_EXT`
        - `ext.SRGB_ALPHA_EXT`
          Ngoài ra, cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}}:
        - `gl.RGBA8`
        - `gl.RGB8`
        - `gl.SRGB8`
        - `gl.RGB8_ALPHA8`
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("WEBGL_compressed_texture_etc")}} được kích hoạt:
        - `ext.COMPRESSED_RGB8_ETC2`
        - `ext.COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
        - `ext.COMPRESSED_RGBA8_ETC2_EAC`
        - `ext.COMPRESSED_SRGB8_ETC2`
        - `ext.COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`
        - `ext.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("WEBGL_compressed_texture_astc")}} được kích hoạt:
        - Tất cả các [định dạng](/en-US/docs/Web/API/WEBGL_compressed_texture_astc#constants) mà phần mở rộng hỗ trợ.
    - `depthFormat` {{optional_inline}}
      - : {{domxref("WebGL_API/Types", "GLenum")}} xác định kiểu dữ liệu của dữ liệu kết cấu độ sâu hoặc `0` cho biết lớp không nên cung cấp kết cấu độ sâu. (Trong trường hợp đó {{domxref("XRProjectionLayer.ignoreDepthValues")}} sẽ là `true`.)
        Các giá trị có thể cho các ngữ cảnh {{domxref("WebGLRenderingContext")}} có phần mở rộng {{domxref("WEBGL_depth_texture")}} được kích hoạt, hoặc cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}} (không cần phần mở rộng):
        - `gl.DEPTH_COMPONENT` (Mặc định)
        - `gl.DEPTH_STENCIL`
          Ngoài ra, cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}}:
        - `gl.DEPTH_COMPONENT24`
        - `gl.DEPTH24_STENCIL24`
    - `isStatic` {{optional_inline}}
      - : Giá trị boolean, nếu là true, cho biết bạn chỉ có thể vẽ vào lớp này khi {{domxref("XRCompositionLayer.needsRedraw", "needsRedraw")}} là `true`. Giá trị mặc định là `false`.
    - `layout`
      - : Chuỗi cho biết bố cục của lớp. Các giá trị có thể:
        - `default`: Lớp chứa tất cả các khung nhìn của phiên.
        - `mono`: Một {{domxref("XRSubImage")}} duy nhất được phân bổ và hiển thị cho cả hai mắt.
        - `stereo`: Tác nhân người dùng quyết định cách phân bổ {{domxref("XRSubImage")}} (một hoặc hai) và bố cục (trên/dưới hoặc trái/phải).
        - `stereo-left-right`: Một {{domxref("XRSubImage")}} duy nhất được phân bổ. Mắt trái nhận vùng bên trái của kết cấu, mắt phải nhận vùng bên phải.
        - `stereo-top-bottom`: Một {{domxref("XRSubImage")}} duy nhất được phân bổ. Mắt trái nhận vùng trên của kết cấu, mắt phải nhận vùng dưới.
          Giá trị mặc định là `mono`.
    - `mipLevels` {{optional_inline}}
      - : Số xác định số mức mip mong muốn. Giá trị mặc định là `1`.
    - `orientation` {{optional_inline}}
      - : {{domxref("DOMPointReadOnly")}} xác định hướng tương đối với thuộc tính `space`.
    - `space` **Bắt buộc**
      - : Đối tượng {{domxref("XRSpace")}} xác định mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
    - `viewPixelHeight` **Bắt buộc**
      - : Số xác định chiều cao pixel của khung nhìn lớp.
    - `viewPixelWidth` **Bắt buộc**
      - : Số xác định chiều rộng pixel của khung nhìn lớp.

### Giá trị trả về

Đối tượng {{domxref("XRCubeLayer")}}.

## Ví dụ

### Tạo một XRCubeLayer

Cấu hình lớp cube bằng các thuộc tính được liệt kê ở trên trong lần gọi `createCubeLayer()`. Để hiển thị các lớp trên thiết bị XR, hãy thêm chúng vào trạng thái kết xuất `layers` bằng {{domxref("XRSession.updateRenderState()")}}.

```js
function onXRSessionStarted(xrSession) {
  const glCanvas = document.createElement("canvas");
  const gl = glCanvas.getContext("webgl2", { xrCompatible: true });
  const xrGlBinding = new XRWebGLBinding(xrSession, gl);
  const cubeLayer = xrGlBinding.createCubeLayer({
    space: xrReferenceSpace,
    viewPixelHeight: 512,
    viewPixelWidth: 512,
  });
  xrSession.updateRenderState({
    layers: [cubeLayer],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XRCubeLayer")}}
- [Hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants)
