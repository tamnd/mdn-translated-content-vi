---
title: "WebGL2RenderingContext: phương thức getUniformIndices()"
short-title: getUniformIndices()
slug: Web/API/WebGL2RenderingContext/getUniformIndices
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getUniformIndices
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getUniformIndices()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truy xuất các chỉ mục của một số uniform trong một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getUniformIndices(program, uniformNames)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa các uniform mà chỉ mục sẽ được truy vấn.
- `uniformNames`
  - : Một {{jsxref("Array")}} chuỗi chỉ định tên của các uniform sẽ truy vấn.

### Giá trị trả về

Một {{jsxref("Array")}} các {{domxref("WebGL_API/Types", "GLuint")}} chứa các chỉ mục uniform.

## Ví dụ

```js
const uniformIndices = gl.getUniformIndices(program, [
  "UBORed",
  "UBOGreen",
  "UBOBlue",
]);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getUniformBlockIndex()")}}