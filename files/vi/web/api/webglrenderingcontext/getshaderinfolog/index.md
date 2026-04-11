---
title: "WebGLRenderingContext: getShaderInfoLog() method"
short-title: getShaderInfoLog()
slug: Web/API/WebGLRenderingContext/getShaderInfoLog
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getShaderInfoLog
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

**WebGLRenderingContext.getShaderInfoLog** trả về nhật ký thông tin cho đối tượng {{domxref("WebGLShader")}} được chỉ định. Nó chứa các cảnh báo, gỡ lỗi và biên dịch thông tin.

## Cú pháp

```js-nolint
getShaderInfoLog(shader)
```

### Thông số

- `shader`
  - : Một {{domxref("WebGLShader")}} để truy vấn.

### Giá trị trả về

Một chuỗi chứa các thông báo chẩn đoán, thông báo cảnh báo và thông tin khác về thao tác biên dịch cuối cùng. Khi một đối tượng {{domxref("WebGLShader")}} được tạo lần đầu, nhật ký thông tin của nó sẽ là một chuỗi có độ dài 0.

## Ví dụ

### Kiểm tra tin nhắn biên soạn

```js
/* load shader source code. */
gl.shaderSource(shader, shaderCode);

/* compile shader source code. */
gl.compileShader(shader);

const message = gl.getShaderInfoLog(shader);

if (message.length > 0) {
  /* message may be an error or a warning */
  throw message;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getShaderParameter()")}} – được sử dụng với
`gl.COMPILE_STATUS` để kiểm tra quá trình biên dịch bị lỗi.
- {{domxref("WebGLRenderingContext.getError()")}}
