---
title: "WebGL2RenderingContext: phương thức getUniformBlockIndex()"
short-title: getUniformBlockIndex()
slug: Web/API/WebGL2RenderingContext/getUniformBlockIndex
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getUniformBlockIndex
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getUniformBlockIndex()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truy xuất chỉ mục của một khối uniform trong một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getUniformBlockIndex(program, uniformBlockName)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa khối uniform.
- `uniformName`
  - : Một chuỗi chỉ định tên của khối uniform mà chỉ mục sẽ được truy xuất.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLuint")}} cho biết chỉ mục khối uniform.

## Ví dụ

```js
// Giả sử một shader với khai báo sau:
// uniform UBOData {
//   mat4 foo;
// } instanceName;

// sử dụng tên khối, không phải tên instance:
const blockIndex = gl.getUniformBlockIndex(program, "UBOData");
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getUniformIndices()")}}