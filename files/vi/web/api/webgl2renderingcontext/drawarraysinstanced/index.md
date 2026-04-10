---
title: "WebGL2RenderingContext: phương thức drawArraysInstanced()"
short-title: drawArraysInstanced()
slug: Web/API/WebGL2RenderingContext/drawArraysInstanced
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.drawArraysInstanced
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.drawArraysInstanced()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) kết xuất các hình nguyên từ dữ liệu mảng giống như phương thức {{domxref("WebGLRenderingContext.drawArrays()", "gl.drawArrays()")}}. Ngoài ra, nó có thể thực thi nhiều phiên bản của dải phần tử.

> [!NOTE]
> Khi sử dụng {{domxref("WebGLRenderingContext", "WebGL 1", "", 1)}}, phần mở rộng {{domxref("ANGLE_instanced_arrays")}} cũng có thể cung cấp phương thức này.

## Cú pháp

```js-nolint
drawArraysInstanced(mode, first, count, instanceCount)
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

- `first`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} chỉ định chỉ mục bắt đầu trong mảng các điểm vector.
- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng chỉ mục sẽ được kết xuất.
- `instanceCount`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng phiên bản của dải phần tử sẽ thực thi.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.drawArraysInstanced(gl.POINTS, 0, 8, 4);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("ANGLE_instanced_arrays.drawArraysInstancedANGLE()")}}
- {{domxref("WEBGL_multi_draw.multiDrawArraysInstancedWEBGL()")}}