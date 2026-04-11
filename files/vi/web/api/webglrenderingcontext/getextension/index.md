---
title: "WebGLRenderingContext: getExtension() method"
short-title: getExtension()
slug: Web/API/WebGLRenderingContext/getExtension
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getExtension
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getExtension()`** cho phép mở rộng [WebGL](/en-US/docs/Web/API/WebGL_API).

## Cú pháp

```js-nolint
getExtension(name)
```

### Thông số

- `name`
  - : Một {{jsxref("String")}} cho tên của phần mở rộng WebGL cần kích hoạt.

### Giá trị trả về

Một đối tượng mở rộng WebGL, hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu tên không khớp (không phân biệt chữ hoa chữ thường) với một trong các chuỗi trong {{domxref("WebGLRenderingContext.getSupportedExtensions")}}.

## Ví dụ

Khi tiện ích mở rộng WebGL được kích hoạt, bạn có thể sử dụng các phương thức, thuộc tính hoặc hằng số mà đối tượng tiện ích mở rộng này cung cấp.

```js
const canvas = document.getElementById("canvas");
gl = canvas.getContext("webgl");

gl.getExtension("WEBGL_lose_context").loseContext();
```

## phần mở rộng WebGL

Các phần mở rộng cho WebGL API được đăng ký trong [WebGL Sổ đăng ký mở rộng](https://registry.khronos.org/webgl/extensions/). Chúng cũng được liệt kê trong [WebGL API tham chiếu](/en-US/docs/Web/API/WebGL_API#extensions) của chúng tôi.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getSupportedExtensions()")}}
- [webglreport.com](https://webglreport.com/)
