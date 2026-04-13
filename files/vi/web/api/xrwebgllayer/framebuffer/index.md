---
title: "XRWebGLLayer: framebuffer property"
short-title: framebuffer
slug: Web/API/XRWebGLLayer/framebuffer
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.XRWebGLLayer.framebuffer
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`framebuffer`** của {{domxref("XRWebGLLayer")}} là một {{domxref("WebGLFramebuffer")}} mờ được sử dụng để đệm hình ảnh hiển thị nếu [XR compositor](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals#the_webxr_compositor) đang được sử dụng. Ngược lại, giá trị thuộc tính này là `null`. Framebuffer mờ về mặt chức năng gần giống như framebuffer WebGL tiêu chuẩn, ngoại trừ các điểm khác biệt được đề cập trong phần [Cách framebuffer mờ đặc biệt](#how_opaque_framebuffers_are_special) bên dưới.

## Giá trị

Một đối tượng {{domxref("WebGLFramebuffer")}} đại diện cho framebuffer mà cảnh 3D đang được hiển thị vào, hoặc `null` nếu [XR compositor](/en-US/docs/Web/API/WebXR_Device_API/Fundamentals#the_webxr_compositor) bị tắt cho phiên.

## Ghi chú sử dụng

### Cách framebuffer mờ đặc biệt

Framebuffer được đại diện bởi thuộc tính `framebuffer` là mờ. Do đó, hành vi của nó khác nhau theo một số cách so với ngữ cảnh WebGL tiêu chuẩn. Những khác biệt này khiến framebuffer mờ hoạt động giống hơn với framebuffer WebGL mặc định:

- Framebuffer mờ _có thể_ hỗ trợ [khử răng cưa](/en-US/docs/Web/API/XRWebGLLayer/antialias), ngay cả trong WebGL 1.0, loại thường không làm như vậy.
- Các attachment (bộ đệm và tương tự) của framebuffer mờ không thể được kiểm tra hoặc thay đổi. Gọi các hàm như {{domxref("WebGLRenderingContext.framebufferTexture2D", "framebufferTexture2D()")}}, {{domxref("WebGLRenderingContext.framebufferRenderbuffer", "framebufferRenderbuffer()")}}, {{domxref("WebGLRenderingContext.deleteFramebuffer","deleteFramebuffer()")}}, hoặc {{domxref("WebGLRenderingContext.getFramebufferAttachmentParameter", "getFramebufferAttachmentParameter()")}} trên framebuffer mờ dẫn đến lỗi WebGL `INVALID_OPERATION` (`0x0502`).
- Framebuffer mờ được coi là chưa hoàn chỉnh và không có sẵn để hiển thị trừ khi đang thực thi callback của {{domxref("XRSession.requestAnimationFrame","requestAnimationFrame()")}}. Việc cố gắng xóa, vẽ vào, hoặc đọc từ framebuffer dẫn đến lỗi WebGL `INVALID_FRAMEBUFFER_OPERATION` (`0x0506`). Gọi {{domxref("WebGLRenderingContext.checkFramebufferStatus", "checkFramebufferStatus()")}} trên ngữ cảnh WebGL từ bên ngoài callback animation frame khiến lỗi WebGL `FRAMEBUFFER_UNSUPPORTED` (`0x8CDD`) được báo cáo.
- Framebuffer mờ được khởi tạo với thuộc tính `depth` đặt thành `false` sẽ không có bộ đệm độ sâu và sẽ dựa vào các tọa độ để xác định khoảng cách.
- Framebuffer mờ được khởi tạo mà không chỉ định thuộc tính `stencil` sẽ không có bộ đệm stencil.
- Framebuffer mờ sẽ không có kênh alpha trừ khi thuộc tính `alpha` là `true` khi tạo lớp.
- XR compositor giả định rằng framebuffer mờ sử dụng màu với alpha được nhân trước, bất kể thuộc tính ngữ cảnh [`premultipliedAlpha`](/en-US/docs/Web/API/HTMLCanvasElement/getContext#premultipliedalpha) của ngữ cảnh WebGL có được đặt hay không.

> [!NOTE]
> Các thuộc tính `depth` và `stencil` không cần được hỗ trợ để trình duyệt được coi là có hỗ trợ WebGL đầy đủ.

### Cấu hình mặc định của framebuffer mới

Khi tạo một {{domxref("XRWebGLLayer")}} mới, framebuffer mới của nó được khởi tạo giống như framebuffer mặc định cho bất kỳ giao diện WebGL nào:

- Bộ đệm màu được cấu hình với giá trị clear được đặt thành màu (0, 0, 0, 0) (có nghĩa là màu đen trong suốt).
- Giá trị clear của bộ đệm độ sâu là số 1.0.
- Bộ đệm stencil được lấp đầy bằng 0.

## Ví dụ

Ví dụ này lấy `XRWebGLLayer` cho một phiên và sau đó truyền framebuffer của nó vào hàm {{domxref("WebGLRenderingContext.bindFramebuffer", "bindFramebuffer()")}} của ngữ cảnh WebGL.

```js
let glLayer = xrSession.renderState.baseLayer;
gl.bindFramebuffer(gl.FRAMEBUFFER, glLayer.framebuffer);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [WebXR Device API](/en-US/docs/Web/API/WebXR_Device_API)
