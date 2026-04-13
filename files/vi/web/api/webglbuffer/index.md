---
title: WebGLBuffer
slug: Web/API/WebGLBuffer
page-type: web-api-interface
browser-compat: api.WebGLBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLBuffer** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho một đối tượng buffer mờ lưu trữ dữ liệu như đỉnh hoặc màu sắc.

{{InheritanceDiagram}}

## Mô tả

Đối tượng `WebGLBuffer` không định nghĩa bất kỳ phương thức hoặc thuộc tính nào của riêng nó và nội dung của nó không thể truy cập trực tiếp. Khi làm việc với các đối tượng `WebGLBuffer`, các phương thức sau của {{domxref("WebGLRenderingContext")}} hữu ích:

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- {{domxref("WebGLRenderingContext.isBuffer()")}}

## Ví dụ

### Tạo buffer

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- {{domxref("WebGLRenderingContext.isBuffer()")}}
- Các buffer khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
