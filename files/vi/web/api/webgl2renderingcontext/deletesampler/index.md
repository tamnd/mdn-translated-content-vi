---
title: "WebGL2RenderingContext: phương thức deleteSampler()"
short-title: deleteSampler()
slug: Web/API/WebGL2RenderingContext/deleteSampler
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.deleteSampler
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.deleteSampler()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLSampler")}} đã cho.

## Cú pháp

```js-nolint
deleteSampler(sampler)
```

### Tham số

- `sampler`
  - : Một đối tượng {{domxref("WebGLSampler")}} để xóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLSampler` không có sẵn trong WebGL 1.

```js
const sampler = gl.createSampler();

// …

gl.deleteSampler(sampler);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}