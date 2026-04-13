---
title: "WebGL2RenderingContext: phương thức bindSampler()"
short-title: bindSampler()
slug: Web/API/WebGL2RenderingContext/bindSampler
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bindSampler
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bindSampler()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) liên kết một đối tượng {{domxref("WebGLSampler")}} đã cho với đơn vị texture tại chỉ mục đã cho.

## Cú pháp

```js-nolint
bindSampler(unit, sampler)
```

### Tham số

- `unit`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định chỉ mục của đơn vị texture sẽ liên kết sampler.
- `sampler`
  - : Một đối tượng {{domxref("WebGLSampler")}} để liên kết.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const sampler = gl.createSampler();
gl.bindSampler(0, sampler);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}
