---
title: "WebGL2RenderingContext: phương thức createSampler()"
short-title: createSampler()
slug: Web/API/WebGL2RenderingContext/createSampler
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.createSampler
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.createSampler()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo các đối tượng {{domxref("WebGLSampler")}}.

## Cú pháp

```js-nolint
createSampler()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLSampler")}}.

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLSampler` không có sẵn trong WebGL 1.

```js
const sampler = gl.createSampler();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}