---
title: "WebGL2RenderingContext: phương thức getActiveUniformBlockParameter()"
short-title: getActiveUniformBlockParameter()
slug: Web/API/WebGL2RenderingContext/getActiveUniformBlockParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getActiveUniformBlockParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getActiveUniformBlockParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truy xuất thông tin về một khối uniform đang hoạt động trong một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getActiveUniformBlockParameter(program, uniformBlockIndex, pname)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa khối uniform đang hoạt động.
- `uniformBlockIndex`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của khối uniform đang hoạt động trong chương trình.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin nào sẽ truy vấn. Các giá trị có thể:
    - `gl.UNIFORM_BLOCK_BINDING`
      - : Trả về một {{domxref("WebGL_API/Types", "GLuint")}} cho biết điểm liên kết bộ đệm uniform.
    - `gl.UNIFORM_BLOCK_DATA_SIZE`
      - : Trả về một {{domxref("WebGL_API/Types", "GLuint")}} cho biết kích thước tối thiểu của đối tượng bộ đệm.
    - `gl.UNIFORM_BLOCK_ACTIVE_UNIFORMS`
      - : Trả về một {{domxref("WebGL_API/Types", "GLuint")}} cho biết số lượng uniform đang hoạt động trong khối uniform.
    - `gl.UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES`
      - : Trả về một {{jsxref("Uint32Array")}} cho biết danh sách các uniform đang hoạt động trong khối uniform.
    - `gl.UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER`
      - : Trả về một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết khối uniform có được vertex shader tham chiếu hay không.
    - `gl.UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER`
      - : Trả về một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết khối uniform có được fragment shader tham chiếu hay không.

### Giá trị trả về

Phụ thuộc vào thông tin nào được yêu cầu bằng tham số `pname`. Nếu xảy ra lỗi, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) được trả về.

## Ví dụ

```js
const blockSize = gl.getActiveUniformBlockParameter(
  program,
  blockIndex,
  gl.UNIFORM_BLOCK_DATA_SIZE,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getActiveUniforms()")}}