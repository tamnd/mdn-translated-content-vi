---
title: "WebGLRenderingContext: getShaderPrecisionFormat() method"
short-title: getShaderPrecisionFormat()
slug: Web/API/WebGLRenderingContext/getShaderPrecisionFormat
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getShaderPrecisionFormat
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getShaderPrecisionFormat()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về một đối tượng {{domxref("WebGLShaderPrecisionFormat")}} mới mô tả phạm vi và độ chính xác cho định dạng số đổ bóng được chỉ định.

## Cú pháp

```js-nolint
getShaderPrecisionFormat(shaderType, precisionType)
```

### Thông số

- `shaderType`
  - : Hoặc là `gl.FRAGMENT_SHADER` hoặc `gl.VERTEX_SHADER`.
- `precisionType`
  - : Một giá trị loại chính xác. Hoặc `gl.LOW_FLOAT`,
`gl.MEDIUM_FLOAT`, `gl.HIGH_FLOAT`, `gl.LOW_INT`, `gl.MEDIUM_INT`, hoặc `gl.HIGH_INT`.

### Giá trị trả về

Một đối tượng {{domxref("WebGLShaderPrecisionFormat")}} hoặc `null`, nếu xảy ra lỗi.

### Ngoại lệ

- `gl.INVALID_ENUM` nếu bộ đổ bóng hoặc loại chính xác không được nhận dạng.
- `gl.INVALID_OPERATION` nếu trình biên dịch shader không được hỗ trợ.

## Ví dụ

Đoạn mã sau lấy định dạng chính xác của `gl.VERTEX_SHADER` với loại chính xác `gl.MEDIUM_FLOAT`.

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT);
// WebGLShaderPrecisionFormat { rangeMin: 127, rangeMax: 127, precision: 23 }
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShaderPrecisionFormat")}}
