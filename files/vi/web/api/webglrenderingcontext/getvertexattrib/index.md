---
title: "WebGLRenderingContext: getVertexAttrib() method"
short-title: getVertexAttrib()
slug: Web/API/WebGLRenderingContext/getVertexAttrib
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getVertexAttrib
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getVertexAttrib()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về thuộc tính đỉnh tại một vị trí nhất định.

## Cú pháp

```js-nolint
getVertexAttrib(index, pname)
```

### Thông số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính đỉnh.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING`
      - : Trả về {{domxref("WebGLBuffer")}} hiện đang bị ràng buộc.
    - `gl.VERTEX_ATTRIB_ARRAY_ENABLED`
      - : Trả về một {{domxref("WebGL_API/Types", "GLboolean")}} là `true` nếu thuộc tính đỉnh được kích hoạt tại `index` này. Nếu không thì `false`.
    - `gl.VERTEX_ATTRIB_ARRAY_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
cho biết kích thước của một phần tử của mảng đỉnh.
    - `gl.VERTEX_ATTRIB_ARRAY_STRIDE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
cho biết số byte giữa các phần tử liên tiếp trong mảng. 0 có nghĩa là các phần tử là tuần tự.
    - `gl.VERTEX_ATTRIB_ARRAY_TYPE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLenum")}}
đại diện cho kiểu mảng. Một trong
        - `gl.BYTE`
        - `gl.UNSIGNED_BYTE`
        - `gl.SHORT`,
        - `gl.UNSIGNED_SHORT`
        - `gl.FLOAT`

    - `gl.VERTEX_ATTRIB_ARRAY_NORMALIZED`
      - : Trả về một
{{domxref("WebGL_API/Types", "GLboolean")}} đúng nếu các kiểu dữ liệu điểm cố định được chuẩn hóa cho mảng thuộc tính đỉnh tại `index` đã cho.
    - `gl.CURRENT_VERTEX_ATTRIB`
      - : Trả về một {{jsxref("Float32Array")}}
(với 4 phần tử) biểu thị giá trị hiện tại của thuộc tính đỉnh tại `index` đã cho.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.VERTEX_ATTRIB_ARRAY_INTEGER`
      - : Trả về một
{{domxref("WebGL_API/Types", "GLboolean")}} cho biết liệu kiểu dữ liệu số nguyên có nằm trong mảng thuộc tính đỉnh tại `index` đã cho hay không.
    - `gl.VERTEX_ATTRIB_ARRAY_DIVISOR`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
mô tả bộ chia tần số được sử dụng để hiển thị theo phiên bản.

Khi sử dụng phần mở rộng {{domxref("ANGLE_instanced_arrays")}}:
    - `ext.VERTEX_ATTRIB_ARRAY_DIVISOR_ANGLE`
      - : Trả về một
{{domxref("WebGL_API/Types", "GLint")}} mô tả bộ chia tần số được sử dụng để hiển thị phiên bản.

### Giá trị trả về

Trả về thông tin thuộc tính đỉnh được yêu cầu (như được chỉ định với `pname`).

## Ví dụ

```js
gl.getVertexAttrib(0, gl.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getVertexAttribOffset()")}}
- {{domxref("ANGLE_instanced_arrays")}}
