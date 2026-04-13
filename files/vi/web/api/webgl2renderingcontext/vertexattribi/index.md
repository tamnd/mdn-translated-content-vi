---
title: "WebGL2RenderingContext: phương thức vertexAttribI4[u]i[v]()"
short-title: vertexAttribI4[u]i[v]()
slug: Web/API/WebGL2RenderingContext/vertexAttribI
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.vertexAttribI4i
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Các phương thức **`WebGL2RenderingContext.vertexAttribI4[u]i[v]()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chỉ định giá trị số nguyên cho các thuộc tính đỉnh chung.

## Cú pháp

```js-nolint
vertexAttribI4i(index, v0, v1, v2, v3)
vertexAttribI4ui(index, v0, v1, v2, v3)
vertexAttribI4iv(index, value)
vertexAttribI4uiv(index, value)
```

### Tham số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định vị trí của thuộc tính đỉnh sẽ được sửa đổi.
- `v0`, `v1`, `v2`, `v3`
  - : Một {{jsxref("Number")}} số nguyên cho giá trị thuộc tính đỉnh.
- `value`
  - : Một {{jsxref("Uint32Array")}}/{{jsxref("Int32Array")}} hoặc chuỗi các {{domxref("WebGL_API/Types", "GLuint")}}/{{domxref("WebGL_API/Types", "GLint")}} cho các giá trị thuộc tính đỉnh vector số nguyên.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.vertexAttribI4i(index, 10);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getVertexAttrib()")}}