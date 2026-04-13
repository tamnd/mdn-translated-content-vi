---
title: OES_texture_float extension
short-title: OES_texture_float
slug: Web/API/OES_texture_float
page-type: webgl-extension
browser-compat: api.OES_texture_float
---

{{APIRef("WebGL")}}

Phần mở rộng **`OES_texture_float`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và hiển thị các kiểu pixel dấu phẩy động cho texture.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định.

## Phương thức mở rộng

Phần mở rộng này mở rộng {{domxref("WebGLRenderingContext.texImage2D()")}} và {{domxref("WebGLRenderingContext.texSubImage2D()")}}:

- Tham số `type` giờ chấp nhận `gl.FLOAT`.
- Tham số `pixels` giờ chấp nhận {{jsxref("Float32Array")}}.

## Giới hạn: Lọc tuyến tính

Lọc tuyến tính trên texture dấu phẩy động không được phép với phần mở rộng này. Để sử dụng lọc tuyến tính trên texture dấu phẩy động, hãy bật phần mở rộng {{domxref("OES_texture_float_linear")}} ngoài phần mở rộng này.

## Ví dụ

```js
const ext = gl.getExtension("OES_texture_float");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.FLOAT, image);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("OES_texture_float_linear")}}
- {{domxref("OES_texture_half_float")}}
- {{domxref("OES_texture_half_float_linear")}}
