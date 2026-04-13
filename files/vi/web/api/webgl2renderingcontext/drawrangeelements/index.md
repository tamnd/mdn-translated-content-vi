---
title: "WebGL2RenderingContext: phương thức drawRangeElements()"
short-title: drawRangeElements()
slug: Web/API/WebGL2RenderingContext/drawRangeElements
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.drawRangeElements
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.drawRangeElements()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết xuất các hình nguyên từ dữ liệu mảng trong một dải đã cho.

## Cú pháp

```js-nolint
drawRangeElements(mode, start, end, count, type, offset)
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

- `start`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục mảng nhỏ nhất chứa trong `offset`.
- `end`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục mảng lớn nhất chứa trong `offset`.
- `count`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định số lượng phần tử sẽ được kết xuất.
- `type`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại giá trị trong bộ đệm mảng phần tử. Các giá trị có thể:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT`
    - `gl.UNSIGNED_INT`

- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định một offset trong bộ đệm mảng phần tử. Phải là bội số hợp lệ của kích thước của `type` đã cho.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` được ném.
- Nếu `offset` không phải là bội số hợp lệ của kích thước của type đã cho, lỗi `gl.INVALID_OPERATION` được ném.
- Nếu `count` là số âm, lỗi `gl.INVALID_VALUE` được ném.

## Ví dụ

```js
gl.drawRangeElements(gl.POINTS, 0, 7, 8, gl.UNSIGNED_BYTE, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.drawElements()")}}