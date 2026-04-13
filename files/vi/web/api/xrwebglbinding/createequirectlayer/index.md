---
title: "XRWebGLBinding: phương thức createEquirectLayer()"
short-title: createEquirectLayer()
slug: Web/API/XRWebGLBinding/createEquirectLayer
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRWebGLBinding.createEquirectLayer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}

Phương thức **`createEquirectLayer()`** của giao diện {{domxref("XRWebGLBinding")}} trả về đối tượng {{domxref("XREquirectLayer")}}, là một lớp ánh xạ dữ liệu được mã hóa [equirectangular](https://en.wikipedia.org/wiki/Equirectangular_projection) lên bên trong của một hình cầu.

## Cú pháp

```js-nolint
createEquirectLayer(options)
```

### Tham số

- `options`
  - : Đối tượng để cấu hình {{domxref("XREquirectLayer")}}. Nó phải có các thuộc tính `space`, `viewPixelHeight` và `viewPixelWidth`. `init` có các thuộc tính sau:
    - `centralHorizontalAngle` {{optional_inline}}
      - : Số cho biết góc ngang trung tâm tính bằng radian của hình cầu. Giá trị mặc định: `6.28318` (2π).
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
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("WEBGL_compressed_texture_etc")}} được kích hoạt:
        - `ext.COMPRESSED_RGB8_ETC2`
        - `ext.COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2`
        - `ext.COMPRESSED_RGBA8_ETC2_EAC`
        - `ext.COMPRESSED_SRGB8_ETC2`
        - `ext.COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2`
        - `ext.COMPRESSED_SRGB8_ALPHA8_ETC2_EAC`
          Ngoài ra, cho các ngữ cảnh với phần mở rộng {{domxref("WEBGL_compressed_texture_astc")}} được kích hoạt:
        - `All` của các định dạng mà phần mở rộng hỗ trợ.
          Giá trị mặc định là `gl.RGBA`.
    - `depthFormat` {{optional_inline}}
      - : {{domxref("WebGL_API/Types", "GLenum")}} xác định kiểu dữ liệu của dữ liệu kết cấu độ sâu, hoặc `0` để cho biết lớp không nên cung cấp kết cấu độ sâu (trong trường hợp đó {{domxref("XRProjectionLayer.ignoreDepthValues")}} sẽ là `true`).
        Các giá trị có thể trong các ngữ cảnh {{domxref("WebGLRenderingContext")}} có phần mở rộng {{domxref("WEBGL_depth_texture")}} được kích hoạt, hoặc trong các ngữ cảnh {{domxref("WebGL2RenderingContext")}} (không cần phần mở rộng):
        - `gl.DEPTH_COMPONENT`
        - `gl.DEPTH_STENCIL`
          Ngoài ra, cho các ngữ cảnh {{domxref("WebGL2RenderingContext")}}:
        - `gl.DEPTH_COMPONENT24`
        - `gl.DEPTH24_STENCIL24`
          Giá trị mặc định là `gl.DEPTH_COMPONENT`.
    - `isStatic` {{optional_inline}}
      - : Giá trị boolean, nếu là true, cho biết bạn chỉ có thể vẽ vào lớp này khi {{domxref("XRCompositionLayer.needsRedraw", "needsRedraw")}} là `true`. Giá trị mặc định là `false`.
    - `layout` {{optional_inline}}
      - : Chuỗi cho biết bố cục của lớp. Các giá trị có thể:
        - `default`
          - : Lớp chứa tất cả các khung nhìn của phiên.
        - `mono`
          - : Một {{domxref("XRSubImage")}} duy nhất được phân bổ và hiển thị cho cả hai mắt.
        - `stereo`
          - : Tác nhân người dùng quyết định cách phân bổ {{domxref("XRSubImage")}} (một hoặc hai) và bố cục (trên/dưới hoặc trái/phải).
        - `stereo-left-right`
          - : Một {{domxref("XRSubImage")}} duy nhất được phân bổ. Mắt trái nhận vùng bên trái của kết cấu, mắt phải nhận vùng bên phải.
        - `stereo-top-bottom`
          - : Một {{domxref("XRSubImage")}} duy nhất được phân bổ. Mắt trái nhận vùng trên của kết cấu, mắt phải nhận vùng dưới.
            Giá trị mặc định là `mono`.
    - `lowerVerticalAngle` {{optional_inline}}
      - : Số cho biết góc dọc dưới tính bằng radian của hình cầu. Giá trị mặc định: `-1.570795` (-π/2).
    - `mipLevels` {{optional_inline}}
      - : Số xác định số mức mip mong muốn. Giá trị mặc định là `1`.
    - `radius` {{optional_inline}}
      - : Số cho biết bán kính của hình cầu. Giá trị mặc định: `0` (hình cầu vô hạn).
    - `space` **Bắt buộc**
      - : Đối tượng {{domxref("XRSpace")}} xác định mối quan hệ không gian của lớp với môi trường vật lý của người dùng.
    - `textureType` {{optional_inline}}
      - : Chuỗi xác định loại kết cấu mà lớp sẽ có. Các giá trị có thể:
        - `texture`
          - : Các kết cấu của {{domxref("XRWebGLSubImage")}} sẽ có kiểu `gl.TEXTURE_2D`.
        - `texture-array`
          - : Các kết cấu của {{domxref("XRWebGLSubImage")}} sẽ có kiểu `gl.TEXTURE_2D_ARRAY` (chỉ dành cho ngữ cảnh WebGL 2).
            Giá trị mặc định là `texture`.
    - `transform` {{optional_inline}}
      - : Đối tượng {{domxref("XRRigidTransform")}} xác định độ lệch và hướng tương đối với `space`.
    - `upperVerticalAngle` {{optional_inline}}
      - : Số cho biết góc dọc trên tính bằng radian của hình cầu. Giá trị mặc định: `1.570795` (π/2).
    - `viewPixelHeight` **Bắt buộc**
      - : Số xác định chiều cao pixel của khung nhìn lớp.
    - `viewPixelWidth` **Bắt buộc**
      - : Số xác định chiều rộng pixel của khung nhìn lớp.

### Giá trị trả về

Đối tượng {{domxref("XREquirectLayer")}}.

## Ví dụ

### Tạo một `XREquirectLayer`

Cấu hình lớp equirect bằng các thuộc tính được liệt kê ở trên trong lần gọi `createEquirect()`. Để hiển thị các lớp trên thiết bị XR, hãy thêm chúng vào trạng thái kết xuất `layers` bằng {{domxref("XRSession.updateRenderState()")}}.

```js
function onXRSessionStarted(xrSession) {
  const glCanvas = document.createElement("canvas");
  const gl = glCanvas.getContext("webgl2", { xrCompatible: true });
  const xrGlBinding = new XRWebGLBinding(xrSession, gl);
  const equirectLayer = xrGlBinding.createEquirectLayer({
    space: xrReferenceSpace,
    viewPixelWidth: 1200,
    viewPixelHeight: 600,
    centralHorizontalAngle: 2 * Math.PI,
    upperVerticalAngle: Math.PI / 2.0,
    lowerVerticalAngle: -Math.PI / 2.0,
    radius: 0,
  });

  xrSession.updateRenderState({
    layers: [equirectLayer],
  });
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("XREquirectLayer")}}
- [Hằng số WebGL](/en-US/docs/Web/API/WebGL_API/Constants)
