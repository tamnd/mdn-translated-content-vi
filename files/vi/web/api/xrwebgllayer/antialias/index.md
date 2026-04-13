---
title: "XRWebGLLayer: antialias property"
short-title: antialias
slug: Web/API/XRWebGLLayer/antialias
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.antialias
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`antialias`** của {{domxref("XRWebGLLayer")}} là một giá trị Boolean là `true` nếu framebuffer của lớp hiển thị hỗ trợ khử răng cưa. Ngược lại, giá trị thuộc tính này là `false`. Kỹ thuật khử răng cưa cụ thể được sử dụng tùy thuộc vào quyết định của {{Glossary("user agent", "user agent")}} và không thể được chỉ định bởi trang web hoặc ứng dụng web.

## Giá trị

Một giá trị Boolean là `true` nếu framebuffer của lớp hiển thị WebGL được cấu hình để hỗ trợ khử răng cưa. Ngược lại, thuộc tính này là `false`.

Khi [WebXR compositor](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals#the_webxr_compositor) được bật, giá trị này tương ứng với giá trị của thuộc tính `antialias` trên đối tượng được trả về bởi phương thức {{domxref("WebGLRenderingContext.getContextAttributes", "getContentAttributes()")}} của ngữ cảnh WebGL.

## Ghi chú sử dụng

Vì đây là thuộc tính chỉ đọc, bạn chỉ có thể đặt chế độ khử răng cưa khi tạo ban đầu `XRWebGLLayer`, bằng cách chỉ định thuộc tính `antialias` trong đối tượng cấu hình `options` của hàm khởi tạo {{domxref("XRWebGLLayer.XRWebGLLayer", "XRWebGLLayer()")}}.

## Ví dụ

Đoạn mã này kiểm tra giá trị của `antialias` để xem liệu có nên thực hiện thêm công việc để cố gắng bù đắp cho việc thiếu khử răng cưa trên lớp WebGL hay không.

```js
let glLayer = xrSession.renderState.baseLayer;
gl.bindFrameBuffer(gl.FRAMEBUFFER, glLayer.framebuffer);

/* .. */

if (!glLayer.antialias) {
  /* compensate for lack of anti-aliasing */
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
