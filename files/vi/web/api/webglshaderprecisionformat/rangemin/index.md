---
title: "WebGLShaderPrecisionFormat: thuộc tính rangeMin"
short-title: rangeMin
slug: Web/API/WebGLShaderPrecisionFormat/rangeMin
page-type: web-api-instance-property
browser-compat: api.WebGLShaderPrecisionFormat.rangeMin
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`WebGLShaderPrecisionFormat.rangeMin`** trả về logarithm cơ số 2 của giá trị tuyệt đối của giá trị tối thiểu có thể biểu diễn.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

gl.getShaderPrecisionFormat(gl.VERTEX_SHADER, gl.MEDIUM_FLOAT).rangeMin; // 127
gl.getShaderPrecisionFormat(gl.FRAGMENT_SHADER, gl.LOW_INT).rangeMin; // 24
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLShaderPrecisionFormat")}}
- {{domxref("WebGLRenderingContext.getShaderPrecisionFormat()")}}
