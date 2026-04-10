---
title: "WebGL2RenderingContext: phương thức bindBufferRange()"
short-title: bindBufferRange()
slug: Web/API/WebGL2RenderingContext/bindBufferRange
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bindBufferRange
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bindBufferRange()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) liên kết một dải của {{domxref("WebGLBuffer")}} đã cho với một điểm liên kết (`target`) đã cho tại một `index` đã cho.

## Cú pháp

```js-nolint
bindBufferRange(target, index, buffer, offset, size)
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
- `offset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định offset bắt đầu.
- `size`
  - : Một {{domxref("WebGL_API/Types", "GLsizeiptr")}} chỉ định lượng dữ liệu có thể được đọc từ bộ đệm.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.bindBufferRange(gl.TRANSFORM_FEEDBACK_BUFFER, 1, buffer, 0, 4);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.bindBufferBase()")}}
