---
title: "WebGL2RenderingContext: phương thức getActiveUniformBlockName()"
short-title: getActiveUniformBlockName()
slug: Web/API/WebGL2RenderingContext/getActiveUniformBlockName
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getActiveUniformBlockName
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getActiveUniformBlockName()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) truy xuất tên của khối uniform đang hoạt động tại một chỉ mục đã cho trong một {{domxref("WebGLProgram")}}.

## Cú pháp

```js-nolint
getActiveUniformBlockName(program, uniformBlockIndex)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa khối uniform.
- `uniformBlockIndex`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của khối uniform mà tên sẽ được truy xuất.

### Giá trị trả về

Một chuỗi cho biết tên khối uniform đang hoạt động.

## Ví dụ

```js
const blockName = gl.getActiveUniformBlockName(program, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getUniformBlockIndex()")}}