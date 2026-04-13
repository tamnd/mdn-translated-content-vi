---
title: "WebGLShaderPrecisionFormat: thuộc tính rangeMax"
short-title: rangeMax
slug: Web/API/WebGLShaderPrecisionFormat/rangeMax
page-type: web-api-instance-property
browser-compat: api.WebGLShaderPrecisionFormat.rangeMax
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLShaderPrecisionFormat.rangeMax`** trả về logarithm cơ số 2 của giá trị tuyệt đối của giá trị tối đa có thể biểu diễn.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT).rangeMax; // 127
gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT).rangeMax; // 24
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShaderPrecisionFormat")}}
- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
