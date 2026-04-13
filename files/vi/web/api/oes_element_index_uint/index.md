---
title: OES_element_index_uint extension
short-title: OES_element_index_uint
slug: Web/API/OES_element_index_uint
page-type: webgl-extension
browser-compat: api.OES_element_index_uint
---

{{APIRef("WebGL")}}

Phần mở rộng **`OES_element_index_uint`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và thêm hỗ trợ cho các kiểu `gl.UNSIGNED_INT` vào {{domxref("WebGLRenderingContext.drawElements()")}}.

Các phần mở rộng WebGL có sẵn bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Sử dụng Phần mở rộng](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Phần mở rộng này chỉ có sẵn cho ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}}. Trong {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}, chức năng của phần mở rộng này có sẵn theo mặc định.

## Phương thức mở rộng

Phần mở rộng này mở rộng {{domxref("WebGLRenderingContext.drawElements()")}}:

- Tham số `type` giờ chấp nhận `gl.UNSIGNED_INT`.

## Ví dụ

```js
const ext = gl.getExtension("OES_element_index_uint");

gl.drawElements(gl.POINTS, 8, gl.UNSIGNED_INT, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLRenderingContext.drawElements()")}}
