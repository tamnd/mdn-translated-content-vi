---
title: "WebGL2RenderingContext: phương thức getIndexedParameter()"
short-title: getIndexedParameter()
slug: Web/API/WebGL2RenderingContext/getIndexedParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getIndexedParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getIndexedParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin được lập chỉ mục về một `target` đã cho.

## Cú pháp

```js-nolint
getIndexedParameter(target, index)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target để trả về thông tin. Các giá trị có thể:
    - `gl.TRANSFORM_FEEDBACK_BUFFER_BINDING`: Trả về một {{domxref("WebGLBuffer")}}.
    - `gl.TRANSFORM_FEEDBACK_BUFFER_SIZE`: Trả về một {{domxref("WebGL_API/Types", "GLsizeiptr")}}.
    - `gl.TRANSFORM_FEEDBACK_BUFFER_START`: Trả về một {{domxref("WebGL_API/Types", "GLintptr")}}.
    - `gl.UNIFORM_BUFFER_BINDING`: Trả về một {{domxref("WebGLBuffer")}}.
    - `gl.UNIFORM_BUFFER_SIZE`: Trả về một {{domxref("WebGL_API/Types", "GLsizeiptr")}}.
    - `gl.UNIFORM_BUFFER_START`: Trả về một {{domxref("WebGL_API/Types", "GLintptr")}}.

    Khi sử dụng phần mở rộng WebGL 2 {{domxref("OES_draw_buffers_indexed")}}, các giá trị sau cũng có sẵn:
    - `gl.BLEND_EQUATION_RGB`: Trả về phương trình blend RGB cho bộ đệm vẽ tại `index`.
    - `gl.BLEND_EQUATION_ALPHA`: Trả về phương trình blend alpha cho bộ đệm vẽ tại `index`.
    - `gl.BLEND_SRC_RGB`: Trả về hàm blend nguồn RGB cho bộ đệm vẽ tại `index`.
    - `gl.BLEND_SRC_ALPHA`: Trả về hàm blend nguồn alpha cho bộ đệm vẽ tại `index`.
    - `gl.BLEND_DST_RGB`: Trả về hàm blend đích RGB cho bộ đệm vẽ tại `index`.
    - `gl.BLEND_DST_ALPHA`: Trả về hàm blend đích alpha cho bộ đệm vẽ tại `index`.
    - `gl.COLOR_WRITEMASK`: Trả về một mảng chứa các thành phần màu được bật cho bộ đệm vẽ tại `index`.

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của `target` được truy vấn.

### Giá trị trả về

Phụ thuộc vào thông tin được yêu cầu (được chỉ định bằng `target`).

## Ví dụ

```js
const binding = gl.getIndexedParameter(gl.TRANSFORM_FEEDBACK_BUFFER_BINDING, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getParameter()")}}