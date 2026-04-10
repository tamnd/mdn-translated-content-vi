---
title: "WebGL2RenderingContext: phương thức createTransformFeedback()"
short-title: createTransformFeedback()
slug: Web/API/WebGL2RenderingContext/createTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.createTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.createTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo các đối tượng {{domxref("WebGLTransformFeedback")}}.

## Cú pháp

```js-nolint
createTransformFeedback()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLTransformFeedback")}}.

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLTransformFeedback` không có sẵn trong WebGL 1.

```js
const transformFeedback = gl.createTransformFeedback();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}