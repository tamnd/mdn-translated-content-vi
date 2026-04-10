---
title: "WebGL2RenderingContext: phương thức drawElementsInstanced()"
short-title: drawElementsInstanced()
slug: Web/API/WebGL2RenderingContext/drawElementsInstanced
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.drawElementsInstanced
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.drawElementsInstanced()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) kết xuất các hình nguyên từ dữ liệu mảng giống như phương thức {{domxref("WebGLRenderingContext.drawElements()", "gl.drawElements()")}}. Ngoài ra, nó có thể thực thi nhiều phiên bản của một tập hợp phần tử.

> [!NOTE]
> Khi sử dụng {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}, phần mở rộng {{domxref("ANGLE_instanced_arrays")}} cũng có thể cung cấp phương thức này.

## Cú pháp

```js-nolint
drawElementsInstanced(mode, count, type, offset, instanceCount)
```

### Tham số

- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại hình nguyên sẽ kết xuất. Các giá trị có thể:
    - `gl.POINTS`: Vẽ một điểm duy nhất.
    - `gl.LINE_STRIP`: Vẽ một đường thẳng đến đỉnh tiếp theo.
    - `gl.LINE_LOOP`: Vẽ một đường thẳng đến đỉnh tiếp theo và kết nối đỉnh cuối cùng trở lại đỉnh đầu tiên.
    - `gl.LINES`: Vẽ một đường giữa một cặp đỉnh.
    - [`gl.TRIANGLE_STRIP`](https://en.wikipedia.org/wiki/Triangle_strip)
    - [`gl.TRIANGLE_FAN`](https://en.wikipedia.org/wiki/Triangle_fan)
    - `gl.TRIANGLES`: Vẽ một tam giác cho một nhóm ba đỉnh.

- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng phần tử sẽ được kết xuất.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại giá trị trong bộ đệm mảng phần tử. Các giá trị có thể:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT`
    - `gl.UNSIGNED_INT` Khi sử dụng phần mở rộng {{domxref("OES_element_index_uint")}}.

- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định một offset trong bộ đệm mảng phần tử. Phải là bội số hợp lệ của kích thước của `type` đã cho.
- `instanceCount`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng phiên bản của tập hợp phần tử sẽ thực thi.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` được ném.
- Nếu `offset` không phải là bội số hợp lệ của kích thước của type đã cho, lỗi `gl.INVALID_OPERATION` được ném.
- Nếu `count` hoặc `instanceCount` là số âm, lỗi `gl.INVALID_VALUE` được ném.

## Ví dụ

```js
gl.drawElementsInstanced(gl.POINTS, 2, gl.UNSIGNED_SHORT, 0, 4);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()", "ext.drawArraysInstancedANGLE()")}}
- {{domxref("ANGLE_instanced_arrays.vertexAttribDivisorANGLE()", "ext.vertexAttribDivisorANGLE()")}}
- {{domxref("WebGLRenderingContext.drawArrays()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
- {{domxref("WebGL2RenderingContext.drawArraysInstanced()")}}
- {{domxref("WebGL2RenderingContext.vertexAttribDivisor()")}}
- {{domxref("WEBGL_multi_draw.multiDrawElementsInstancedWEBGL()")}}