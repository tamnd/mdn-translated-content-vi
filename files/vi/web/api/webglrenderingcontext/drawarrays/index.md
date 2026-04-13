---
title: "WebGLRenderingContext: drawArrays() method"
short-title: drawArrays()
slug: Web/API/WebGLRenderingContext/drawArrays
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.drawArrays
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.drawArrays()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) hiển thị các giá trị gốc từ dữ liệu mảng.

## Cú pháp

```js-nolint
drawArrays(mode, first, count)
```

### Thông số

- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kiểu nguyên thủy cần hiển thị. Giá trị có thể
là:
    - `gl.POINTS`: Vẽ một dấu chấm đơn.
    - `gl.LINE_STRIP`: Vẽ một đường thẳng tới đỉnh tiếp theo.
    - `gl.LINE_LOOP`: Vẽ một đường thẳng tới đỉnh tiếp theo, và
nối đỉnh cuối cùng trở lại đỉnh đầu tiên.
    - `gl.LINES`: Vẽ một đường thẳng giữa một cặp đỉnh.
    - [`gl.TRIANGLE_STRIP`](https://en.wikipedia.org/wiki/Triangle_strip)
    - [`gl.TRIANGLE_FAN`](https://en.wikipedia.org/wiki/Triangle_fan)
    - `gl.TRIANGLES`: Vẽ một tam giác cho một nhóm ba đỉnh.

    > [!GHI CHÚ]
    > Nếu `mode` là `POINTS`, [`gl_PointSize`](https://registry.khronos.org/OpenGL-Refpages/gl4/html/gl_PointSize.xhtml) có thể cần được thiết lập để `drawArrays` hiển thị, vì giá trị của nó không xác định nếu không được ghi rõ ràng. Chỉ một số GPU đặt mặc định là `1.0`.

- `first`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định chỉ số bắt đầu trong mảng các điểm vectơ.
- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng chỉ mục được hiển thị.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong những giá trị được chấp nhận, thì
Lỗi `gl.INVALID_ENUM` được đưa ra.
- Nếu `first` hoặc `count` âm, a
Lỗi `gl.INVALID_VALUE` được đưa ra.
- nếu `gl.CURRENT_PROGRAM` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), a
Lỗi `gl.INVALID_OPERATION` được đưa ra.

## Ví dụ

```js
gl.drawArrays(gl.POINTS, 0, 8);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()", "ext.vertexAttribDivisorANGLE()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
- {{domxref("WEBGL_multi_draw.multiDrawArraysWEBGL()")}}
