---
title: "WebGLRenderingContext: getFramebufferAttachmentParameter() method"
short-title: getFramebufferAttachmentParameter()
slug: Web/API/WebGLRenderingContext/getFramebufferAttachmentParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getFramebufferAttachmentParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getFramebufferAttachmentParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về phần đính kèm của bộ đệm khung.

## Cú pháp

```js-nolint
getFramebufferAttachmentParameter(target, attachment, pname)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Bộ sưu tập bộ đệm lưu trữ dữ liệu màu, alpha,
bộ đệm độ sâu và stencil được sử dụng để hiển thị hình ảnh.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DRAW_FRAMEBUFFER`
      - : Tương đương với `gl.FRAMEBUFFER`.
Được sử dụng làm đích cho các hoạt động vẽ, hiển thị, xóa và viết.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc.

- `attachment`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm đính kèm cho
`texture`. Các giá trị có thể:
    - `gl.COLOR_ATTACHMENT0`: Đính kèm họa tiết cho bộ đệm khung
đệm màu.
    - `gl.DEPTH_ATTACHMENT`: Đính kèm họa tiết cho độ sâu của bộ đệm khung
bộ đệm.
    - `gl.STENCIL_ATTACHMENT`: Đính kèm họa tiết cho bộ đệm khung
bộ đệm stencil.
    - `gl.DEPTH_STENCIL_ATTACHMENT`: Đính kèm họa tiết cho cả hai, độ sâu
và bộ đệm stencil.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.COLOR_ATTACHMENT1 gl.COLOR_ATTACHMENT2 gl.COLOR_ATTACHMENT3 gl.COLOR_ATTACHMENT4 gl.COLOR_ATTACHMENT5 gl.COLOR_ATTACHMENT6 gl.COLOR_ATTACHMENT7 gl.COLOR_ATTACHMENT8 gl.COLOR_ATTACHMENT9 gl.COLOR_ATTACHMENT10 gl.COLOR_ATTACHMENT11 gl.COLOR_ATTACHMENT12 gl.COLOR_ATTACHMENT13 gl.COLOR_ATTACHMENT14 gl.COLOR_ATTACHMENT15`

Khi sử dụng phần mở rộng {{domxref("WEBGL_draw_buffers")}}:
    - `ext.COLOR_ATTACHMENT0_WEBGL` (giống như
`gl.COLOR_ATTACHMENT0`) `ext.COLOR_ATTACHMENT1_WEBGL ext.COLOR_ATTACHMENT2_WEBGL ext.COLOR_ATTACHMENT3_WEBGL ext.COLOR_ATTACHMENT4_WEBGL ext.COLOR_ATTACHMENT5_WEBGL ext.COLOR_ATTACHMENT6_WEBGL ext.COLOR_ATTACHMENT7_WEBGL ext.COLOR_ATTACHMENT8_WEBGL ext.COLOR_ATTACHMENT9_WEBGL ext.COLOR_ATTACHMENT10_WEBGL ext.COLOR_ATTACHMENT11_WEBGL ext.COLOR_ATTACHMENT12_WEBGL ext.COLOR_ATTACHMENT13_WEBGL ext.COLOR_ATTACHMENT14_WEBGL ext.COLOR_ATTACHMENT15_WEBGL`

- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE`: Loại chứa
hình ảnh đính kèm.
    - `gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME`: Kết cấu hoặc bộ đệm kết xuất
của ảnh đính kèm ({{domxref("WebGLRenderbuffer")}} hoặc {{domxref("WebGLTexture")}}).
    - `gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL`: Cấp độ Mipmap. Mặc định
giá trị: 0.
    - `gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE`: Tên của
mặt bản đồ khối của kết cấu.

Khi sử dụng phần mở rộng {{domxref("EXT_sRGB")}}:
    - `ext.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT`: Bộ đệm khung
mã hóa màu sắc.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_BLUE_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING`
    - `gl.FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE`
    - `gl.FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_GREEN_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_RED_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE`
    - `gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER`

Khi sử dụng phần mở rộng {{domxref("OVR_multiview2")}}:
    - `ext.FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR`: số lượt xem của tệp đính kèm đối tượng bộ đệm khung.
    - `ext.FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR`: chỉ số khung nhìn cơ sở của phần đính kèm đối tượng bộ đệm khung.

### Giá trị trả về

Phụ thuộc vào thông tin được yêu cầu (như được chỉ định với `pname`). Hoặc là {{domxref("WebGL_API/Types", "GLint")}}, {{domxref("WebGL_API/Types", "GLenum")}}, {{domxref("WebGLRenderbuffer")}}, hoặc {{domxref("WebGLTexture")}}.

<table class="standard-table"> <thead> <tr> <th scope="col"><code>pname</code> tham số</th> <th scope="col">Giá trị trả về</th> </tr> </thead> <tbody> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE</code></td> <td> A {{domxref("WebGL_API/Types", "GLenum")}} biểu thị loại của kết cấu. Hoặc <code>gl.RENDERBUFFER</code>, <code>gl.TEXTURE</code>, hoặc nếu không có hình ảnh nào được đính kèm, <code>gl.NONE</code>. </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME</code></td> <td> Kết cấu (TOK1��) hoặc bộ đệm kết xuất ({{domxref("WebGLRenderbuffer")}}) của ảnh đính kèm. </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL</code></td> <td> A {{domxref("WebGL_API/Types", "GLint")}} cho biết mức độ mipmap. Giá trị mặc định: 0. </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE</code></td> <td> Một {{domxref("WebGL_API/Types", "GLenum")}} cho biết tên của mặt bản đồ khối của kết cấu. Các giá trị có thể có: <ul> <li> <code>gl.TEXTURE_CUBE_MAP_POSITIVE_X</code>: Hình ảnh cho mặt X dương của khối lập phương. </li> <li> <code>gl.TEXTURE_CUBE_MAP_NEGATIVE_X</code>: Hình ảnh cho mặt X âm của hình lập phương. </li> <li> <code>gl.TEXTURE_CUBE_MAP_POSITIVE_Y</code>: Hình ảnh cho mặt Y dương của khối lập phương. </li> <li> <code>gl.TEXTURE_CUBE_MAP_NEGATIVE_Y</code>: Hình ảnh cho mặt Y âm của hình lập phương. </li> <li> <code>gl.TEXTURE_CUBE_MAP_POSITIVE_Z</code>: Hình ảnh cho mặt Z dương của hình lập phương. </li> <li> <code>gl.TEXTURE_CUBE_MAP_NEGATIVE_Z</code>: Hình ảnh cho mặt Z âm của hình lập phương. </li> </ul> </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE</code></td> <td> A {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần alpha của phần đính kèm. </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_BLUE_SIZE</code></td> <td> {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần màu xanh của phần đính kèm. A {{domxref("WebGL_API/Types", "GLenum")}} biểu thị mã hóa của các thành phần của tệp đính kèm được chỉ định. Hoặc <code>gl.LINEART</code> hoặc <code>gl.SRGB</code>. A {{domxref("WebGL_API/Types", "GLenum")}} cho biết định dạng của các thành phần của tệp đính kèm được chỉ định. Hoặc <code>gl.FLOAT</code>, <code>gl.INT</code>, <code>gl.UNSIGNED_INT</code>, <code>gl.SIGNED_NORMALIZED</code>, hoặc <code>gl.UNSIGNED_NORMALIZED</code>. A {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần độ sâu của phần đính kèm. </td> </tr> <tr> <td><code>gl.FRAMEBUFFER_ATTACHMENT_GREEN_SIZE</code></td> <td> {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần màu xanh lá cây của phần đính kèm. A {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần màu đỏ của phần đính kèm. �TOK161� {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit trong thành phần stencil của phần đính kèm. A {{domxref("WebGL_API/Types", "GLint")}} cho biết số lớp kết cấu chứa hình ảnh đính kèm. </td> </tr> <tr> <td><code>ext.FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING_EXT</code></td> <td> Một {{domxref("WebGL_API/Types", "GLenum")}} biểu thị mã hóa màu của bộ đệm khung. Hoặc <code>gl.LINEART</code> hoặc <code>ext.SRGB_EXT</code>. </td> </tr> <tr> <td><code>ext.FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR</code></td> <td> Một {{domxref("WebGL_API/Types", "GLsizei")}} cho biết số lượt xem của tệp đính kèm đối tượng bộ đệm khung. </td> </tr> <tr> <td> <code>ext.FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR</code> </td> <td> Một {{domxref("WebGL_API/Types", "GLint")}} biểu thị chỉ số khung nhìn cơ sở của đối tượng đính kèm bộ đệm khung. </td> </tr> </tbody> </table>

### Ngoại lệ

- Một lỗi `gl.INVALID_ENUM` sẽ xuất hiện nếu `target` không được
`gl.FRAMEBUFFER`, `gl.DRAW_FRAMEBUFFER`, `gl.READ_FRAMEBUFFER` hoặc nếu `attachment` không phải là một trong những điểm đính kèm được chấp nhận.

## Ví dụ

```js
gl.getFramebufferAttachmentParameter(
  gl.FRAMEBUFFER,
  gl.COLOR_ATTACHMENT0,
  gl.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
- {{domxref("EXT_sRGB")}}
- {{domxref("WEBGL_draw_buffers")}}
