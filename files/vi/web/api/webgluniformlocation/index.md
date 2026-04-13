---
title: WebGLUniformLocation
slug: Web/API/WebGLUniformLocation
page-type: web-api-interface
browser-compat: api.WebGLUniformLocation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLUniformLocation** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho vị trí của một biến uniform trong chương trình shader.

## Mô tả

Đối tượng `WebGLUniformLocation` không định nghĩa bất kỳ phương thức hoặc thuộc tính nào của riêng nó và nội dung của nó không thể truy cập trực tiếp. Khi làm việc với các đối tượng `WebGLUniformLocation`, các phương thức sau của {{domxref("WebGLRenderingContext")}} hữu ích:

- {{domxref("WebGLRenderingContext.getUniformLocation()")}}
- {{domxref("WebGLRenderingContext.uniform()")}}

## Ví dụ

### Lấy vị trí uniform

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

const location = gl.getUniformLocation(WebGLProgram, "uniformName");
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getUniformLocation()")}}
