---
title: "WebGLShaderPrecisionFormat: thuộc tính precision"
short-title: precision
slug: Web/API/WebGLShaderPrecisionFormat/precision
page-type: web-api-instance-property
browser-compat: api.WebGLShaderPrecisionFormat.precision
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLShaderPrecisionFormat.precision`** trả về số bit độ chính xác có thể biểu diễn.

Đối với định dạng số nguyên, giá trị này luôn là 0.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT).precision; // 23
gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT).precision; // 0
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShaderPrecisionFormat")}}
- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
