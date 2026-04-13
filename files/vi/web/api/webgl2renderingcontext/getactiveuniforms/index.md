---
title: "WebGL2RenderingContext: phương thức getActiveUniforms()"
short-title: getActiveUniforms()
slug: Web/API/WebGL2RenderingContext/getActiveUniforms
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getActiveUniforms
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getActiveUniforms()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truy xuất thông tin về các uniform đang hoạt động trong một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getActiveUniforms(program, uniformIndices, pname)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa các uniform đang hoạt động.
- `uniformIndices`
  - : Một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLuint")}} chỉ định các chỉ mục của các uniform đang hoạt động sẽ truy vấn.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin nào sẽ truy vấn. Các giá trị có thể:
    - `gl.UNIFORM_TYPE`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLenum")}} cho biết [các loại của uniform](/en-US/docs/Web/API/WebGLRenderingContext/getUniform#return_value).
    - `gl.UNIFORM_SIZE`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLuint")}} cho biết kích thước của các uniform.
    - `gl.UNIFORM_BLOCK_INDEX`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLint")}} cho biết các chỉ mục khối của các uniform.
    - `gl.UNIFORM_OFFSET`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLint")}} cho biết các offset bộ đệm uniform.
    - `gl.UNIFORM_ARRAY_STRIDE`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLint")}} cho biết các stride giữa các phần tử.
    - `gl.UNIFORM_MATRIX_STRIDE`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLint")}} cho biết các stride giữa các cột của ma trận column-major hoặc ma trận row-major.
    - `gl.UNIFORM_IS_ROW_MAJOR`
      - : Trả về một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLboolean")}} cho biết mỗi uniform có phải là ma trận row-major hay không.

### Giá trị trả về

Phụ thuộc vào thông tin nào được yêu cầu bằng tham số `pname`.

## Ví dụ

```js
const uniformIndices = gl.getUniformIndices(program, [
  "UBORed",
  "UBOGreen",
  "UBOBlue",
]);
const uniformOffsets = gl.getActiveUniforms(
  program,
  uniformIndices,
  gl.UNIFORM_OFFSET,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getActiveUniformBlockParameter()")}}