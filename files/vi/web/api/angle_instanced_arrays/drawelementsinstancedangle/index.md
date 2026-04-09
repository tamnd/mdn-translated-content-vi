---
title: "ANGLE_instanced_arrays: phương thức drawElementsInstancedANGLE()"
short-title: drawElementsInstancedANGLE()
slug: Web/API/ANGLE_instanced_arrays/drawElementsInstancedANGLE
page-type: web-api-instance-method
browser-compat: api.ANGLE_instanced_arrays.drawElementsInstancedANGLE
---

{{APIRef("WebGL")}}

Phương thức **`ANGLE_instanced_arrays.drawElementsInstancedANGLE()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết xuất các nguyên thủy từ dữ liệu mảng giống như phương thức {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}}. Ngoài ra, nó có thể thực thi nhiều thể hiện của một tập phần tử.

> [!NOTE]
> Khi dùng {{domxref("WebGL2RenderingContext", "WebGL2")}}, phương thức này mặc định có sẵn dưới dạng {{domxref("WebGL2RenderingContext.drawElementsInstanced()", "gl.drawElementsInstanced()")}}.

## Cú pháp

```js-nolint
drawElementsInstancedANGLE(mode, count, type, offset, primcount)
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

- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số phần tử sẽ được kết xuất.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kiểu của các giá trị trong bộ đệm mảng phần tử. Các giá trị có thể là:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT`
    - `gl.UNSIGNED_INT` khi dùng tiện ích mở rộng {{domxref("OES_element_index_uint")}}.

- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định độ lệch trong bộ đệm mảng phần tử. Phải là một bội số hợp lệ của kích thước kiểu đã cho.
- `primcount`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số thể hiện của tập phần tử cần thực thi.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` sẽ được ném ra.
- Nếu `offset` không phải là bội số hợp lệ của kích thước kiểu đã cho, lỗi `gl.INVALID_OPERATION` sẽ được ném ra.
- Nếu `count` hoặc `primcount` là số âm, lỗi `gl.INVALID_VALUE` sẽ được ném ra.

## Ví dụ

```js
const ext = gl.getExtension("ANGLE_instanced_arrays");
ext.drawElementsInstancedANGLE(gl.POINTS, 2, gl.UNSIGNED_SHORT, 0, 4);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()", "ext.vertexAttribDivisorANGLE()")}}
- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.drawElementsInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
- {{domxref("WEBGL_multi_draw.multiDrawElementsInstancedWEBGL()")}}
