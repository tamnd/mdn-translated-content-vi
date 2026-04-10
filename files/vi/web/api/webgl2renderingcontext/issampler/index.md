---
title: "WebGL2RenderingContext: phương thức isSampler()"
short-title: isSampler()
slug: Web/API/WebGL2RenderingContext/isSampler
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.isSampler
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.isSampler()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền là một đối tượng {{domxref("WebGLSampler")}} hợp lệ.

## Cú pháp

```js-nolint
isSampler(sampler)
```

### Tham số

- `sampler`
  - : Một đối tượng {{domxref("WebGLSampler")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là một đối tượng {{domxref("WebGLSampler")}} hợp lệ (`true`) hay không (`false`).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLSampler` không có sẵn trong WebGL 1.

```js
const sampler = gl.createSampler();

// …

gl.isSampler(sampler);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}