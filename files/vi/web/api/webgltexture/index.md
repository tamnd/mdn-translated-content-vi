---
title: WebGLTexture
slug: Web/API/WebGLTexture
page-type: web-api-interface
browser-compat: api.WebGLTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **WebGLTexture** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và đại diện cho một đối tượng texture mờ đục cung cấp bộ nhớ và trạng thái cho các thao tác texturing.

{{InheritanceDiagram}}

## WebGL textures

Đối tượng `WebGLTexture` không định nghĩa bất kỳ phương thức hoặc thuộc tính nào của riêng nó và nội dung của nó không thể truy cập trực tiếp. Khi làm việc với các đối tượng `WebGLTexture`, các phương thức sau của {{domxref("WebGLRenderingContext")}} hữu ích:

- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
- {{domxref("WebGLRenderingContext.isTexture()")}}

Xem thêm [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial) về [Sử dụng texture trong WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial/Using_textures_in_WebGL).

## WebXR opaque textures

Khi sử dụng các layer [WebXR](/en-US/docs/Web/API/WebXR_Device_API), đối tượng {{domxref("XRWebGLBinding")}} sẽ trả về các thể hiện của `WebGLTexture` _mờ đục_ cho các tệp đính kèm màu sắc và độ sâu/stencil.

Các phương thức WebXR trả về đối tượng `WebGLTexture` _mờ đục_:

- {{domxref("XRWebGLBinding.getSubImage()")}}
- {{domxref("XRWebGLBinding.getViewSubImage()")}}

## Ví dụ

### Tạo texture

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const texture = gl.createTexture();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindTexture()")}}
- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
- {{domxref("WebGLRenderingContext.isTexture()")}}
- {{domxref("WebGLRenderingContext.compressedTexImage2D()")}}
- {{domxref("WebGLRenderingContext.compressedTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.copyTexImage2D()")}}
- {{domxref("WebGLRenderingContext.copyTexSubImage2D()")}}
- {{domxref("WebGLRenderingContext.generateMipmap()")}}
- {{domxref("WebGLRenderingContext.getTexParameter()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("WebGLRenderingContext/texParameter", "WebGLRenderingContext.texParameterf()")}}
- {{domxref("WebGLRenderingContext/texParameter", "WebGLRenderingContext.texParameteri()")}}
