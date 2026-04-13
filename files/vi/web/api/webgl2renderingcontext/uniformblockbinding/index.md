---
title: "WebGL2RenderingContext: phương thức uniformBlockBinding()"
short-title: uniformBlockBinding()
slug: Web/API/WebGL2RenderingContext/uniformBlockBinding
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.uniformBlockBinding
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.uniformBlockBinding()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) gán các điểm liên kết cho các khối uniform đang hoạt động.

## Cú pháp

```js-nolint
uniformBlockBinding(program, uniformBlockIndex, uniformBlockBinding)
```

### Tham số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa khối uniform đang hoạt động mà liên kết sẽ được gán.
- `uniformBlockIndex`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của khối uniform đang hoạt động trong chương trình.
- `uniformBlockBinding`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định điểm liên kết sẽ liên kết khối uniform.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.uniformBlockBinding(program, 0, 1);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getUniformIndices()")}}