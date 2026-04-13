---
title: "WebGLRenderingContext: disableVertexAttribArray() method"
short-title: disableVertexAttribArray()
slug: Web/API/WebGLRenderingContext/disableVertexAttribArray
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.disableVertexAttribArray
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.disableVertexAttribArray()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tắt mảng thuộc tính đỉnh chung tại một vị trí chỉ mục nhất định.

## Cú pháp

```js-nolint
disableVertexAttribArray(index)
```

### Thông số

- `index`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của thuộc tính đỉnh cần vô hiệu hóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.disableVertexAttribArray(0);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.enableVertexAttribArray()")}}
