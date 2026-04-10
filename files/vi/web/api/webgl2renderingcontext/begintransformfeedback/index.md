---
title: "WebGL2RenderingContext: phương thức beginTransformFeedback()"
short-title: beginTransformFeedback()
slug: Web/API/WebGL2RenderingContext/beginTransformFeedback
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.beginTransformFeedback
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.beginTransformFeedback()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) bắt đầu một hoạt động transform feedback.

## Cú pháp

```js-nolint
beginTransformFeedback(primitiveMode)
```

### Tham số

- `primitiveMode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại đầu ra của các hình nguyên sẽ được
    ghi vào các đối tượng bộ đệm được liên kết cho transform feedback. Các giá trị có thể:
    - `gl.POINTS`
    - `gl.LINES`
    - `gl.TRIANGLES`

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const transformFeedback = gl.createTransformFeedback();
gl.bindTransformFeedback(gl.TRANSFORM_FEEDBACK, transformFeedback);
gl.beginTransformFeedback(gl.TRIANGLES);
gl.drawArrays(gl.TRIANGLES, 0, 3);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLTransformFeedback")}}
