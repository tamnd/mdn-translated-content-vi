---
title: "WebGLRenderingContext: getRenderbufferParameter() method"
short-title: getRenderbufferParameter()
slug: Web/API/WebGLRenderingContext/getRenderbufferParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getRenderbufferParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getRenderbufferParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về bộ đệm kết xuất.

## Cú pháp

```js-nolint
getRenderbufferParameter(target, pname)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định đối tượng bộ đệm kết xuất mục tiêu. Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Bộ đệm lưu trữ dữ liệu cho các hình ảnh đơn lẻ trong một
định dạng nội bộ có thể hiển thị.

- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.RENDERBUFFER_WIDTH`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết
chiều rộng của hình ảnh của bộ đệm kết xuất hiện bị ràng buộc.
    - `gl.RENDERBUFFER_HEIGHT`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết
chiều cao của hình ảnh của bộ đệm kết xuất hiện bị ràng buộc.
    - `gl.RENDERBUFFER_INTERNAL_FORMAT`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}}
cho biết định dạng bên trong của bộ đệm kết xuất hiện bị ràng buộc. Mặc định là `gl.RGBA4`. Các giá trị trả về có thể có:
        - `gl.RGBA4`: 4 bit đỏ, 4 bit xanh lục, 4 bit xanh dương 4 bit alpha.
        - `gl.RGB565`: 5 bit đỏ, 6 bit xanh lục, 5 bit xanh lam.
        - `gl.RGB5_A1`: 5 bit đỏ, 5 bit xanh lục, 5 bit xanh dương, 1 bit alpha.
        - `gl.DEPTH_COMPONENT16`: 16 bit độ sâu.
        - `gl.STENCIL_INDEX8`: 8 bit stencil.

    - `gl.RENDERBUFFER_GREEN_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} đó là
kích thước độ phân giải (tính bằng bit) cho màu xanh lục.
    - `gl.RENDERBUFFER_BLUE_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} đó là
kích thước độ phân giải (tính bằng bit) cho màu xanh lam.
    - `gl.RENDERBUFFER_RED_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} đó là
kích thước độ phân giải (tính bằng bit) cho màu đỏ.
    - `gl.RENDERBUFFER_ALPHA_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} đó là
kích thước độ phân giải (tính bằng bit) cho thành phần alpha.
    - `gl.RENDERBUFFER_DEPTH_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} đó là
kích thước độ phân giải (tính bằng bit) cho thành phần độ sâu.
    - `gl.RENDERBUFFER_STENCIL_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}} mà
là kích thước độ phân giải (tính bằng bit) cho thành phần stencil.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, giá trị sau đây có sẵn bổ sung:
    - `gl.RENDERBUFFER_SAMPLES`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
cho biết số lượng mẫu hình ảnh của bộ đệm kết xuất hiện bị ràng buộc.

### Giá trị trả về

Phụ thuộc vào thông tin được yêu cầu (như được chỉ định với `pname`). Hoặc là {{domxref("WebGL_API/Types", "GLint")}} hoặc {{domxref("WebGL_API/Types", "GLenum")}}.

## Ví dụ

```js
gl.getRenderbufferParameter(gl.RENDERBUFFER, gl.RENDERBUFFER_WIDTH);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.createRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.deleteRenderbuffer()")}}
- {{domxref("WebGLRenderingContext.renderbufferStorage()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLFramebuffer")}}
