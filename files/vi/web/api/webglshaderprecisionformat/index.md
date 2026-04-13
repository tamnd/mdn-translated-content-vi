---
title: WebGLShaderPrecisionFormat
slug: Web/API/WebGLShaderPrecisionFormat
page-type: web-api-interface
browser-compat: api.WebGLShaderPrecisionFormat
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLShaderPrecisionFormat** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho thông tin được trả về bởi lệnh gọi phương thức {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}.

## Thuộc tính phiên bản

- {{domxref("WebGLShaderPrecisionFormat.rangeMin")}} {{ReadOnlyInline}}
  - : Logarithm cơ số 2 của giá trị tuyệt đối của giá trị tối thiểu có thể biểu diễn.
- {{domxref("WebGLShaderPrecisionFormat.rangeMax")}} {{ReadOnlyInline}}
  - : Logarithm cơ số 2 của giá trị tuyệt đối của giá trị tối đa có thể biểu diễn.
- {{domxref("WebGLShaderPrecisionFormat.precision")}} {{ReadOnlyInline}}
  - : Số bit độ chính xác có thể biểu diễn. Đối với định dạng số nguyên, giá trị này luôn là 0.

## Ví dụ

Đối tượng `WebGLShaderPrecisionFormat` được trả về bởi phương thức {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}.

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT);
// WebGLShaderPrecisionFormat { rangeMin: 127, rangeMax: 127, precision: 23 }
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
