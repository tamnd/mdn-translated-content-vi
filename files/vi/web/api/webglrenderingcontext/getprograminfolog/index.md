---
title: "WebGLRenderingContext: getProgramInfoLog() method"
short-title: getProgramInfoLog()
slug: Web/API/WebGLRenderingContext/getProgramInfoLog
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getProgramInfoLog
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

**WebGLRenderingContext.getProgramInfoLog** trả về nhật ký thông tin cho đối tượng {{domxref("WebGLProgram")}} được chỉ định. Nó chứa các lỗi xảy ra trong quá trình liên kết hoặc xác thực các đối tượng `WebGLProgram` không thành công.

## Cú pháp

```js-nolint
getProgramInfoLog(program)
```

### Thông số

- `program`
  - : {{domxref("WebGLProgram")}} để truy vấn.

### Giá trị trả về

Một chuỗi chứa các thông báo chẩn đoán, thông báo cảnh báo và thông tin khác về hoạt động xác thực hoặc liên kết cuối cùng. Khi một đối tượng {{domxref("WebGLProgram")}} được tạo lần đầu, nhật ký thông tin của nó sẽ là một chuỗi có độ dài 0.

## Ví dụ

### Kiểm tra lỗi chương trình

```js
const program = gl.createProgram();

// Attach pre-existing shaders
gl.attachShader(program, vertexShader);
gl.attachShader(program, fragmentShader);

gl.linkProgram(program);

gl.getProgramInfoLog(program);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getShaderInfoLog()")}}
- {{domxref("WebGLRenderingContext.getError()")}}
