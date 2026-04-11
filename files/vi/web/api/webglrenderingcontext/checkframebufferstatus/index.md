---
title: "WebGLRenderingContext: checkFramebufferStatus() method"
short-title: checkFramebufferStatus()
slug: Web/API/WebGLRenderingContext/checkFramebufferStatus
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.checkFramebufferStatus
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.checkFramebufferStatus()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về trạng thái đầy đủ của đối tượng {{domxref("WebGLFramebuffer")}}.

## Cú pháp

```js-nolint
checkFramebufferStatus(target)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.FRAMEBUFFER`
      - : Bộ sưu tập bộ đệm lưu trữ dữ liệu màu, alpha,
bộ đệm độ sâu và stencil được sử dụng để hiển thị hình ảnh.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.DRAW_FRAMEBUFFER`
      - : Tương đương với `gl.FRAMEBUFFER`.
Được sử dụng làm đích cho các hoạt động vẽ, hiển thị, xóa và viết.
    - `gl.READ_FRAMEBUFFER`
      - : Được sử dụng làm nguồn cho các hoạt động đọc.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLenum")}} cho biết trạng thái hoàn chỉnh của bộ đệm khung hoặc `0` nếu xảy ra lỗi. Các giá trị trả về enum có thể có:

- `gl.FRAMEBUFFER_COMPLETE`: Bộ đệm khung đã sẵn sàng hiển thị.
- `gl.FRAMEBUFFER_INCOMPLETE_ATTACHMENT`: Các loại tệp đính kèm là
không khớp hoặc không phải tất cả các điểm đính kèm bộ đệm khung đều được đính kèm bộ đệm khung hoàn chỉnh.
- `gl.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT`: Không có tập tin đính kèm.
- `gl.FRAMEBUFFER_INCOMPLETE_DIMENSIONS`: Chiều cao và chiều rộng của
phần đính kèm không giống nhau.
- `gl.FRAMEBUFFER_UNSUPPORTED`: Định dạng của tệp đính kèm không đúng
được hỗ trợ hoặc nếu độ sâu và tệp đính kèm stencil không phải là cùng một bộ đệm kết xuất.
- Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}},
các giá trị sau có thể được trả về bổ sung:
  - `gl.FRAMEBUFFER_INCOMPLETE_MULTISAMPLE`: Các giá trị của
`gl.RENDERBUFFER_SAMPLES` khác nhau giữa các bộ đệm kết xuất được đính kèm hoặc khác 0 nếu hình ảnh đính kèm là sự kết hợp của bộ đệm kết xuất và kết cấu.

- Khi sử dụng phần mở rộng {{domxref("OVR_multiview2")}}, giá trị sau có thể được
được trả lại thêm:
  - `ext.FRAMEBUFFER_INCOMPLETE_VIEW_TARGETS_OVR`: Nếu
`baseViewIndex` không giống nhau đối với tất cả các điểm đính kèm bộ đệm khung mà giá trị của `FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE` không phải là `NONE`, bộ đệm khung được coi là không đầy đủ.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const framebuffer = gl.createFramebuffer();

// …

gl.checkFramebufferStatus(gl.FRAMEBUFFER);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createFramebuffer()")}}
- {{domxref("WebGLRenderingContext.deleteFramebuffer()")}}
- {{domxref("WebGLRenderingContext.isFramebuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLBuffer")}}, {{domxref("WebGLRenderbuffer")}}
