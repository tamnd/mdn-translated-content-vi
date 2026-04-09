---
title: "ANGLE_instanced_arrays: phương thức drawArraysInstancedANGLE()"
short-title: drawArraysInstancedANGLE()
slug: Web/API/ANGLE_instanced_arrays/drawArraysInstancedANGLE
page-type: web-api-instance-method
browser-compat: api.ANGLE_instanced_arrays.drawArraysInstancedANGLE
---

{{APIRef("WebGL")}}

Phương thức **`ANGLE_instanced_arrays.drawArraysInstancedANGLE()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết xuất các nguyên thủy từ dữ liệu mảng giống như phương thức {{domxref("WebGLRenderingContext.drawArrays()", "gl.drawArrays()")}}. Ngoài ra, nó có thể thực thi nhiều thể hiện của dải phần tử.

> [!NOTE]
> Khi dùng {{domxref("WebGL2RenderingContext", "WebGL2")}}, phương thức này mặc định có sẵn dưới dạng {{domxref("WebGL2RenderingContext.drawArraysInstanced()", "gl.drawArraysInstanced()")}}.

## Cú pháp

```js-nolint
drawArraysInstancedANGLE(mode, first, count, primcount)
```

### Tham số

- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kiểu nguyên thủy cần kết xuất. Các giá trị có thể là:
    - `gl.POINTS`: Vẽ một chấm đơn.
    - `gl.LINE_STRIP`: Vẽ một đường thẳng tới đỉnh tiếp theo.
    - `gl.LINE_LOOP`: Vẽ một đường thẳng tới đỉnh tiếp theo, và nối đỉnh cuối trở lại đỉnh đầu.
    - `gl.LINES`: Vẽ một đường giữa một cặp đỉnh.
    - [`gl.TRIANGLE_STRIP`](https://en.wikipedia.org/wiki/Triangle_strip)
    - [`gl.TRIANGLE_FAN`](https://en.wikipedia.org/wiki/Triangle_fan)
    - `gl.TRIANGLES`: Vẽ một tam giác cho một nhóm ba đỉnh.

- `first`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định chỉ mục bắt đầu trong mảng các điểm véc-tơ.
- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số chỉ mục sẽ được kết xuất.
- `primcount`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số thể hiện của dải phần tử cần thực thi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` sẽ được ném ra.
- Nếu `first`, `count` hoặc `primcount` là số âm, lỗi `gl.INVALID_VALUE` sẽ được ném ra.
- nếu `gl.CURRENT_PROGRAM` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), lỗi `gl.INVALID_OPERATION` sẽ được ném ra.

## Ví dụ

```js
const ext = gl.getExtension("ANGLE_instanced_arrays");
ext.drawArraysInstancedANGLE(gl.POINTS, 0, 8, 4);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.drawElementsInstancedANGLE()", "ext.drawElementsInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()", "ext.vertexAttribDivisorANGLE()")}}
- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
- {{domxref("WEBGL_multi_draw.multiDrawArraysInstancedWEBGL()")}}
