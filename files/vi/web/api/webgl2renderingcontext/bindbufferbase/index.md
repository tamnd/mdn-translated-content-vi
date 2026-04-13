---
title: "WebGL2RenderingContext: phương thức bindBufferBase()"
short-title: bindBufferBase()
slug: Web/API/WebGL2RenderingContext/bindBufferBase
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bindBufferBase
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bindBufferBase()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) liên kết một {{domxref("WebGLBuffer")}} đã cho với một điểm liên kết (`target`) đã cho tại một `index` đã cho.

## Cú pháp

```js-nolint
bindBufferBase(target, index, buffer)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target cho hoạt động liên kết. Các giá trị có thể:
    - `gl.TRANSFORM_FEEDBACK_BUFFER`
    - `gl.UNIFORM_BUFFER`

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của `target`.
- `buffer`
  - : Một {{domxref("WebGLBuffer")}} sẽ được liên kết với điểm liên kết (`target`).

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.bindBufferBase(gl.TRANSFORM_FEEDBACK_BUFFER, 0, buffer);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}
