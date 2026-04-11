---
title: "WebGLRenderingContext: lineWidth() method"
short-title: lineWidth()
slug: Web/API/WebGLRenderingContext/lineWidth
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.lineWidth
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.lineWidth()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập độ rộng đường của các đường rasterized.

## Cú pháp

```js-nolint
lineWidth(width)
```

### Thông số

- `width`
  - : A {{domxref("WebGL_API/Types", "GLfloat")}} chỉ định độ rộng của các đường rasterized. Giá trị mặc định: 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Thiết lập độ rộng dòng:

```js
gl.lineWidth(5);
```

Lấy chiều rộng của dòng:

```js
gl.getParameter(gl.LINE_WIDTH);
```

Lấy phạm vi chiều rộng có sẵn. Trả về {{jsxref("Float32Array")}}.

```js
gl.getParameter(gl.ALIASED_LINE_WIDTH_RANGE);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext")}}
