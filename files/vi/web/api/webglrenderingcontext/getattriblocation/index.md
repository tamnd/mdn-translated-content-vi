---
title: "WebGLRenderingContext: getAttribLocation() method"
short-title: getAttribLocation()
slug: Web/API/WebGLRenderingContext/getAttribLocation
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getAttribLocation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getAttribLocation()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về vị trí của một biến thuộc tính trong một {{domxref("WebGLProgram")}} nhất định.

## Cú pháp

```js-nolint
getAttribLocation(program, name)
```

### Thông số

- `program`
  - : Một {{domxref("WebGLProgram")}} chứa biến thuộc tính.
- `name`
  - : Một chuỗi xác định tên của biến thuộc tính có
vị trí để có được.

### Giá trị trả về

Một số {{domxref("WebGL_API/Types", "GLint")}} cho biết vị trí của tên biến nếu tìm thấy. Trả về -1 nếu không.

## Ví dụ

```js
gl.getAttribLocation(program, "vColor");
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getUniformLocation()")}}
