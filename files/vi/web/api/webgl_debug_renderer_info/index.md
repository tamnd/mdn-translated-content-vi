---
title: Tiện ích WEBGL_debug_renderer_info
short-title: WEBGL_debug_renderer_info
slug: Web/API/WEBGL_debug_renderer_info
page-type: webgl-extension
browser-compat: api.WEBGL_debug_renderer_info
---

{{APIRef("WebGL")}}

Tiện ích **`WEBGL_debug_renderer_info`** là một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API) và cung cấp hai hằng số chứa thông tin về driver đồ họa cho mục đích gỡ lỗi.

Tùy thuộc vào cài đặt quyền riêng tư của trình duyệt, tiện ích này có thể chỉ khả dụng với các ngữ cảnh được cấp đặc quyền. Nhìn chung, thông tin driver đồ họa chỉ nên được dùng trong các trường hợp đặc biệt để tối ưu hóa nội dung WebGL hoặc gỡ lỗi vấn đề GPU. Phương thức {{domxref("WebGLRenderingContext.getParameter()")}} có thể giúp phát hiện các tính năng được hỗ trợ, và thuộc tính ngữ cảnh [`failIfMajorPerformanceCaveat`](/en-US/docs/Web/API/HTMLCanvasElement/getContext) cho phép kiểm soát xem có nên trả về ngữ cảnh hay không, nếu hiệu suất sẽ cực kỳ chậm.

Các tiện ích WebGL có thể dùng bằng phương thức {{domxref("WebGLRenderingContext.getExtension()")}}. Để biết thêm thông tin, xem [Using Extensions](/en-US/docs/Web/API/WebGL_API/Using_Extensions) trong [hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial).

> [!NOTE]
> Tùy thuộc vào cài đặt quyền riêng tư của trình duyệt, tiện ích này có thể chỉ khả dụng với các ngữ cảnh được cấp đặc quyền hoặc không hoạt động. Trong Firefox, nếu `privacy.resistFingerprinting` được đặt thành `true`, tiện ích này bị tắt.
>
> Tiện ích này khả dụng với cả ngữ cảnh {{domxref("WebGLRenderingContext", "WebGL1", "", 1)}} và {{domxref("WebGL2RenderingContext", "WebGL2", "", 1)}}.

## Hằng số

- ext.UNMASKED_VENDOR_WEBGL
  - : Chuỗi nhà cung cấp của driver đồ họa.
- ext.UNMASKED_RENDERER_WEBGL
  - : Chuỗi renderer của driver đồ họa.

## Ví dụ

Với sự hỗ trợ của tiện ích này, các ngữ cảnh được cấp đặc quyền có thể lấy thông tin gỡ lỗi về driver đồ họa của người dùng:

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");

const debugInfo = gl.getExtension("WEBGL_debug_renderer_info");
const vendor = gl.getParameter(debugInfo.UNMASKED_VENDOR_WEBGL);
const renderer = gl.getParameter(debugInfo.UNMASKED_RENDERER_WEBGL);

console.log(vendor);
console.log(renderer);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
