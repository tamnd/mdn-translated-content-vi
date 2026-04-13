---
title: "WEBGL_multi_draw: multiDrawArraysInstancedWEBGL() method"
short-title: multiDrawArraysInstancedWEBGL()
slug: Web/API/WEBGL_multi_draw/multiDrawArraysInstancedWEBGL
page-type: webgl-extension-method
browser-compat: api.WEBGL_multi_draw.multiDrawArraysInstancedWEBGL
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_multi_draw.multiDrawArraysInstancedWEBGL()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết xuất nhiều hình nguyên thủy từ dữ liệu mảng. Phương thức này giống với nhiều lần gọi phương thức [`gl.drawArraysInstanced()`](/en-US/docs/Web/API/WebGL2RenderingContext/drawArraysInstanced).

## Cú pháp

```js-nolint
multiDrawArraysInstancedWEBGL(mode,
    firstsList, firstsOffset,
    countsList, countsOffset,
    instanceCountsList, instanceCountsOffset,
    drawCount)
```

### Tham số

- `mode`
  - : Một [`GLenum`](/en-US/docs/Web/API/WebGL_API/Types) chỉ định loại hình nguyên thủy để kết xuất. Các giá trị có thể:
    - `gl.POINTS`: Vẽ một điểm đơn.
    - `gl.LINE_STRIP`: Vẽ một đường thẳng đến đỉnh tiếp theo.
    - `gl.LINE_LOOP`: Vẽ một đường thẳng đến đỉnh tiếp theo và kết nối đỉnh cuối cùng trở lại đỉnh đầu tiên.
    - `gl.LINES`: Vẽ một đường thẳng giữa một cặp đỉnh.
    - [`gl.TRIANGLE_STRIP`](https://en.wikipedia.org/wiki/Triangle_strip)
    - [`gl.TRIANGLE_FAN`](https://en.wikipedia.org/wiki/Triangle_fan)
    - `gl.TRIANGLES`: Vẽ một tam giác cho một nhóm ba đỉnh.

- `firstsList`
  - : Một [`Int32Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array) hoặc [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) (của [`GLint`](/en-US/docs/Web/API/WebGL_API/Types)) chỉ định danh sách các chỉ số bắt đầu cho các mảng điểm vectơ.
- `firstsOffset`
  - : Một [`GLuint`](/en-US/docs/Web/API/WebGL_API/Types) xác định điểm bắt đầu trong mảng `firstsList`.
- `countsList`
  - : Một [`Int32Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array) hoặc [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) (của [`GLsizei`](/en-US/docs/Web/API/WebGL_API/Types)) chỉ định danh sách số lượng chỉ số cần kết xuất.
- `countsOffset`
  - : Một [`GLuint`](/en-US/docs/Web/API/WebGL_API/Types) xác định điểm bắt đầu trong mảng `countsList`.
- `instanceCountsList`
  - : Một [`Int32Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array) hoặc [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) (của [`GLsizei`](/en-US/docs/Web/API/WebGL_API/Types)) chỉ định danh sách số lượng thể hiện của phạm vi phần tử cần thực thi.
- `instanceCountsOffset`
  - : Một [`GLuint`](/en-US/docs/Web/API/WebGL_API/Types) xác định điểm bắt đầu trong mảng `instanceCountsList`.
- `drawCount`
  - : Một [`GLsizei`](/en-US/docs/Web/API/WebGL_API/Types) chỉ định số lượng thể hiện của phạm vi phần tử cần thực thi.

### Giá trị trả về

Không có.

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` sẽ được ném ra.
- Nếu `drawCount` hoặc các mục trong `firstsList`, `countsList`, hoặc `instanceCountsList` là âm, lỗi `gl.INVALID_VALUE` sẽ được ném ra.
- Nếu `gl.CURRENT_PROGRAM` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null), lỗi `gl.INVALID_OPERATION` sẽ được ném ra.

## Ví dụ

```js
const firsts = new Int32Array(/* … */);
const counts = new Int32Array(/* … */);
const instanceCounts = new Int32Array(/* … */);
ext.multiDrawArraysInstancedWEBGL(
  gl.TRIANGLES,
  firsts,
  0,
  counts,
  0,
  instanceCounts,
  0,
  firsts.length,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.drawArrays()`](/en-US/docs/Web/API/WebGLRenderingContext/drawArrays)
- [`WebGL2RenderingContext.drawArraysInstanced()`](/en-US/docs/Web/API/WebGL2RenderingContext/drawArraysInstanced)
