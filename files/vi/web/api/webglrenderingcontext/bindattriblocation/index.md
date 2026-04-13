---
title: "WebGLRenderingContext: bindAttribLocation() method"
short-title: bindAttribLocation()
slug: Web/API/WebGLRenderingContext/bindAttribLocation
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bindAttribLocation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bindAttribLocation()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) liên kết một chỉ số đỉnh chung với một biến thuộc tính.

## Cú pháp

```js-nolint
bindAttribLocation(program, index, name)
```

### Thông số

- `program`
  - : Một đối tượng {{domxref("WebGLProgram")}} để liên kết.
- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ số của đỉnh chung cần liên kết.
- `name`
  - : Một chuỗi xác định tên của biến để liên kết với
chỉ số đỉnh chung. Tên này không thể bắt đầu bằng `"webgl_"` hoặc `"_webgl_"`, vì chúng được dành riêng cho WebGL sử dụng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.bindAttribLocation(program, colorLocation, "vColor");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getActiveAttrib()")}}
- {{domxref("WebGLRenderingContext.getAttribLocation()")}}
- {{domxref("WebGLRenderingContext.getVertexAttrib()")}}
