---
title: Tiện ích WEBGL_debug_shaders
short-title: WEBGL_debug_shaders
slug: Web/API/WEBGL_debug_shaders
page-type: webgl-extension
browser-compat: api.WEBGL_debug_shaders
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_debug_shaders`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp một phương thức để gỡ lỗi shader từ các ngữ cảnh được cấp đặc quyền.

Tiện ích này không trực tiếp khả dụng cho các trang web vì cách dịch shader có thể tiết lộ thông tin nhận dạng cá nhân về loại card đồ họa trong máy tính của người dùng cho trang web.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tùy thuộc vào cài đặt quyền riêng tư của trình duyệt, tiện ích này có thể chỉ khả dụng với các ngữ cảnh được cấp đặc quyền.
>
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Phương thức phiên bản

- {{domxref("WEBGL_debug_shaders.getTranslatedShaderSource()")}}
  - : Trả về mã nguồn shader đã được dịch.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
