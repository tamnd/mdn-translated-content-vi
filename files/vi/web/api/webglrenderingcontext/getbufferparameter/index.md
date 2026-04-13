---
title: "WebGLRenderingContext: getBufferParameter() method"
short-title: getBufferParameter()
slug: Web/API/WebGLRenderingContext/getBufferParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getBufferParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getBufferParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về bộ đệm.

## Cú pháp

```js-nolint
getBufferParameter(target, pname)
```

### Thông số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định đối tượng bộ đệm đích. Các giá trị có thể:
    - `gl.ARRAY_BUFFER`
      - : Bộ đệm chứa các thuộc tính đỉnh, chẳng hạn như
tọa độ đỉnh, dữ liệu tọa độ kết cấu hoặc dữ liệu màu đỉnh.
    - `gl.ELEMENT_ARRAY_BUFFER`
      - : Bộ đệm được sử dụng cho các chỉ số phần tử.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.COPY_READ_BUFFER`
      - : Bộ đệm để sao chép từ đối tượng bộ đệm này sang đối tượng bộ đệm khác.
    - `gl.COPY_WRITE_BUFFER`
      - : Bộ đệm để sao chép từ đối tượng bộ đệm này sang đối tượng bộ đệm khác.
    - `gl.TRANSFORM_FEEDBACK_BUFFER`
      - : Bộ đệm cho các hoạt động phản hồi chuyển đổi.
    - `gl.UNIFORM_BUFFER`
      - : Bộ đệm dùng để lưu trữ các khối đồng nhất.
    - `gl.PIXEL_PACK_BUFFER`
      - : Bộ đệm được sử dụng cho các hoạt động truyền pixel.
    - `gl.PIXEL_UNPACK_BUFFER`
      - : Bộ đệm được sử dụng cho các hoạt động truyền pixel.

- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.BUFFER_SIZE`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết kích thước
của bộ đệm theo byte.
    - `gl.BUFFER_USAGE`
      - : Trả về {{domxref("WebGL_API/Types", "GLenum")}} cho biết
mô hình sử dụng bộ đệm. Một trong những điều sau đây:
        - `gl.STATIC_DRAW`
        - `gl.DYNAMIC_DRAW`
        - `gl.STREAM_DRAW`

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
        - `gl.STATIC_READ`
        - `gl.DYNAMIC_READ`
        - `gl.STREAM_READ`
        - `gl.STATIC_COPY`
        - `gl.DYNAMIC_COPY`
        - `gl.STREAM_COPY`

### Giá trị trả về

Phụ thuộc vào thông tin được yêu cầu (như được chỉ định với `pname`). Hoặc là {{domxref("WebGL_API/Types", "GLint")}} hoặc {{domxref("WebGL_API/Types", "GLenum")}}.

## Ví dụ

```js
gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bindBuffer()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- {{domxref("WebGLRenderingContext.bufferData()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
