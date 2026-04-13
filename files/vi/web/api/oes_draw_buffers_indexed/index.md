---
title: OES_draw_buffers_indexed
slug: Web/API/OES_draw_buffers_indexed
page-type: web-api-interface
browser-compat: api.OES_draw_buffers_indexed
---

{{APIRef("WebGL")}}

Phần mở rộng **`OES_draw_buffers_indexed`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cho phép sử dụng các tùy chọn pha trộn khác nhau khi ghi vào nhiều bộ đệm màu cùng lúc.

Các phần mở rộng WebGL khả dụng bằng cách dùng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Phần mở rộng này chỉ khả dụng cho các ngữ cảnh {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Phương thức phiên bản

- {{DOMxRef("OES_draw_buffers_indexed.blendEquationiOES()")}}
  - : Đặt cả phương trình pha trộn RGB và alpha cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.blendEquationSeparateiOES()")}}
  - : Đặt riêng các phương trình pha trộn RGB và alpha cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.blendFunciOES()")}}
  - : Định nghĩa hàm nào được dùng khi pha trộn pixel cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.blendFuncSeparateiOES()")}}
  - : Định nghĩa hàm nào được dùng khi pha trộn pixel cho các thành phần RGB và alpha riêng lẻ cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.colorMaskiOES()")}}
  - : Đặt các thành phần màu nào được bật hoặc tắt khi vẽ hoặc kết xuất cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.disableiOES()")}}
  - : Vô hiệu hóa pha trộn cho một bộ đệm vẽ cụ thể.
- {{DOMxRef("OES_draw_buffers_indexed.enableiOES()")}}
  - : Bật pha trộn cho một bộ đệm vẽ cụ thể.

## Ví dụ

### Sử dụng phần mở rộng `OES_draw_buffers_indexed`

Bật phần mở rộng bằng cách gọi {{domxref("WebGLRenderingContext.getExtension()")}}.

```js
const ext = gl.getExtension("OES_draw_buffers_indexed");
```

Bây giờ bạn có thể bật pha trộn, đặt phương trình pha trộn, hàm pha trộn, và mặt nạ màu cho một bộ đệm vẽ cụ thể.

```js
// For gl.DRAW_BUFFER0
ext.enableiOES(gl.BLEND, 0);
ext.blendEquationiOES(0, gl.FUNC_ADD);
ext.blendFunciOES(0, gl.ONE, gl.ONE);
ext.colorMaskiOES(0, 1, 0, 0, 0);

// For gl.DRAW_BUFFER1
ext.enableiOES(gl.BLEND, 1);
ext.blendEquationSeparateiOES(1, gl.FUNC_ADD, gl.FUNC_SUBTRACT);
ext.blendFuncSeparateiOES(
  1,
  gl.SRC_ALPHA,
  gl.ONE_MINUS_SRC_ALPHA,
  gl.ZERO,
  gl.ZERO,
);
ext.colorMaskiOES(1, 0, 1, 0, 0);
```

Để truy xuất cài đặt cho một bộ đệm vẽ cụ thể, dùng {{domxref("WebGL2RenderingContext.getIndexedParameter()")}}.

```js
// For gl.DRAW_BUFFER0
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 0);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 0);
gl.getIndexedParameter(gl.BLEND_SRC_RGB, 0);
gl.getIndexedParameter(gl.BLEND_SRC_ALPHA, 0);
gl.getIndexedParameter(gl.BLEND_DST_RGB, 0);
gl.getIndexedParameter(gl.BLEND_DST_ALPHA, 0);
gl.getIndexedParameter(gl.COLOR_WRITEMASK, 0);

// For gl.DRAW_BUFFER1
gl.getIndexedParameter(gl.BLEND_EQUATION_RGB, 1);
gl.getIndexedParameter(gl.BLEND_EQUATION_ALPHA, 1);
gl.getIndexedParameter(gl.BLEND_SRC_RGB, 1);
gl.getIndexedParameter(gl.BLEND_SRC_ALPHA, 1);
gl.getIndexedParameter(gl.BLEND_DST_RGB, 1);
gl.getIndexedParameter(gl.BLEND_DST_ALPHA, 1);
gl.getIndexedParameter(gl.COLOR_WRITEMASK, 1);
```

Bạn có thể dùng {{domxref("WebGLRenderingContext.getParameter()")}} để xem có bao nhiêu bộ đệm vẽ khả dụng.

```js
const maxDrawBuffers = gl.getParameter(gl.MAX_DRAW_BUFFERS);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
