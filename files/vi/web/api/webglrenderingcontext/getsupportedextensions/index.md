---
title: "WebGLRenderingContext: getSupportedExtensions() method"
short-title: getSupportedExtensions()
slug: Web/API/WebGLRenderingContext/getSupportedExtensions
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getSupportedExtensions
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getSupportedExtensions()`** trả về danh sách tất cả các phần mở rộng [WebGL](/en-US/docs/Web/API/WebGL_API) được hỗ trợ.

## Cú pháp

```js-nolint
getSupportedExtensions()
```

### Thông số

Không có.

### Giá trị trả về

Một chuỗi {{jsxref("Array")}} với tất cả phần mở rộng WebGL được hỗ trợ.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
gl = canvas.getContext("webgl");

const extensions = gl.getSupportedExtensions();
// Array [ 'ANGLE_instanced_arrays', 'EXT_blend_minmax', … ]
```

Xem thêm phương thức {{domxref("WebGLRenderingContext.getExtension()")}} để có được một đối tượng mở rộng cụ thể.

## phần mở rộng WebGL

Các phần mở rộng cho WebGL API được đăng ký trong [WebGL Sổ đăng ký mở rộng](https://registry.khronos.org/webgl/extensions/). Chúng cũng được liệt kê trong [WebGL API tham chiếu](/en-US/docs/Web/API/WebGL_API#extensions) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- [webglreport.com](https://webglreport.com/)
