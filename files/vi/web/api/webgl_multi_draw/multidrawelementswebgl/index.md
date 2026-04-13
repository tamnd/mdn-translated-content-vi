---
title: "WEBGL_multi_draw: multiDrawElementsWEBGL() method"
short-title: multiDrawElementsWEBGL()
slug: Web/API/WEBGL_multi_draw/multiDrawElementsWEBGL
page-type: webgl-extension-method
browser-compat: api.WEBGL_multi_draw.multiDrawElementsWEBGL
---

{{APIRef("WebGL")}}

Phương thức **`WEBGL_multi_draw.multiDrawElementsWEBGL()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết xuất nhiều hình nguyên thủy từ dữ liệu mảng. Phương thức này giống với nhiều lần gọi phương thức [`gl.drawElements()`](/en-US/docs/Web/API/WebGLRenderingContext/drawElements).

## Cú pháp

```js-nolint
multiDrawElementsWEBGL(mode,
    countsList, countsOffset,
    type,
    firstsList, firstsOffset,
    drawCount)
```

### Tham số

- `mode`
  - : Một [`GLenum`](/en-US/docs/Web/API/WebGL_API/Types) chỉ định loại hình nguyên thủy để kết xuất. Các giá trị có thể:
    - `gl.POINTS`, `gl.LINE_STRIP`, `gl.LINE_LOOP`, `gl.LINES`, `gl.TRIANGLE_STRIP`, `gl.TRIANGLE_FAN`, `gl.TRIANGLES`

- `countsList`
  - : Một [`Int32Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array) hoặc [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) (của [`GLint`](/en-US/docs/Web/API/WebGL_API/Types)) chỉ định danh sách số lượng chỉ số cần kết xuất.
- `countsOffset`
  - : Một [`GLUint`](/en-US/docs/Web/API/WebGL_API/Types) xác định điểm bắt đầu trong mảng `countsList`.
- type
  - : Một [`GLenum`](/en-US/docs/Web/API/WebGL_API/Types) chỉ định loại của các giá trị trong bộ đệm mảng phần tử. Các giá trị có thể:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT`
    - Khi sử dụng tiện ích [`OES_element_index_uint`](/en-US/docs/Web/API/OES_element_index_uint):
      - `gl.UNSIGNED_INT`

- `offsetsList`
  - : Một [`Int32Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Int32Array) hoặc [`Array`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) (của [`GLsizei`](/en-US/docs/Web/API/WebGL_API/Types)) chỉ định danh sách các chỉ số bắt đầu cho các mảng điểm vectơ.
- `offsetsOffset`
  - : Một [`GLuint`](/en-US/docs/Web/API/WebGL_API/Types) xác định điểm bắt đầu trong mảng `offsetsList`.
- `drawCount`
  - : Một [`GLsizei`](/en-US/docs/Web/API/WebGL_API/Types) chỉ định số lượng thể hiện của phạm vi phần tử cần thực thi.

### Giá trị trả về

Không có.

### Ngoại lệ

- Nếu `mode` không phải là một trong các giá trị được chấp nhận, lỗi `gl.INVALID_ENUM` sẽ được ném ra.
- Nếu `drawCount` hoặc các mục trong `countsList` hoặc `offsetsList` là âm, lỗi `gl.INVALID_VALUE` sẽ được ném ra.

## Ví dụ

```js
const counts = new Int32Array(/* … */);
const offsets = new Int32Array(/* … */);
ext.multiDrawElementsWEBGL(
  gl.TRIANGLES,
  counts,
  0,
  gl.UNSIGNED_SHORT,
  offsets,
  0,
  counts.length,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [`WebGLRenderingContext.drawElements()`](/en-US/docs/Web/API/WebGLRenderingContext/drawElements)
- [`WebGL2RenderingContext.drawElementsInstanced()`](/en-US/docs/Web/API/WebGL2RenderingContext/drawElementsInstanced)
