---
title: OES_texture_half_float_linear extension
short-title: OES_texture_half_float_linear
slug: Web/API/OES_texture_half_float_linear
page-type: webgl-extension
browser-compat: api.OES_texture_half_float_linear
---

{{APIRef("WebGL")}}

Phần mở rộng **`OES_texture_half_float_linear`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép lọc tuyến tính với các kiểu pixel dấu phẩy động nửa độ chính xác cho texture.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định và không cần phần mở rộng.

## Lọc tuyến tính

Phần mở rộng {{domxref("OES_texture_half_float")}} một mình không cho phép lọc tuyến tính với texture dấu phẩy động nửa độ chính xác. Phần mở rộng này cho phép khả năng này.

Với sự giúp đỡ của phần mở rộng này, bạn có thể đặt bộ lọc phóng to hoặc thu nhỏ trong phương thức {{domxref("WebGLRenderingContext.texParameter()")}} thành một trong `gl.LINEAR`, `gl.LINEAR_MIPMAP_NEAREST`, `gl.NEAREST_MIPMAP_LINEAR` hoặc `gl.LINEAR_MIPMAP_LINEAR` và sử dụng texture dấu phẩy động nửa độ chính xác.

## Ví dụ

```js
const halfFloat = gl.getExtension("OES_texture_half_float");
gl.getExtension("OES_texture_half_float_linear");

const texture = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, texture);

gl.texParameterf(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texImage2D(
  gl.TEXTURE_2D,
  0,
  gl.RGBA,
  gl.RGBA,
  halfFloat.HALF_FLOAT_OES,
  image,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
- {{domxref("WebGLRenderingContext.texSubImage2D()")}}
- {{domxref("OES_texture_float")}}
- {{domxref("OES_texture_float_linear")}}
- {{domxref("OES_texture_half_float")}}
