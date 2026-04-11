---
title: "WebGLRenderingContext: getVertexAttribOffset() method"
short-title: getVertexAttribOffset()
slug: Web/API/WebGLRenderingContext/getVertexAttribOffset
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getVertexAttribOffset
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getVertexAttribOffset()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về địa chỉ của một thuộc tính đỉnh được chỉ định.

## Cú pháp

```js-nolint
getVertexAttribOffset(index, pname)
```

### Thông số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính đỉnh.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} phải là `gl.VERTEX_ATTRIB_ARRAY_POINTER`.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLintptr")}} cho biết địa chỉ của thuộc tính đỉnh.

## Ví dụ

```js
gl.getVertexAttribOffset(i, gl.VERTEX_ATTRIB_ARRAY_POINTER);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.vertexAttribPointer()")}}
