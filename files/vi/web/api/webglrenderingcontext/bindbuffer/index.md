---
title: "WebGLRenderingContext: bindBuffer() method"
short-title: bindBuffer()
slug: Web/API/WebGLRenderingContext/bindBuffer
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bindBuffer
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bindBuffer()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) liên kết một {{domxref("WebGLBuffer")}} nhất định với một mục tiêu.

## Cú pháp

```js-nolint
bindBuffer(target, buffer)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
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

- `buffer`
  - : Một {{domxref("WebGLBuffer")}} để liên kết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Chỉ có một mục tiêu có thể được liên kết với một {{domxref("WebGLBuffer")}} nhất định. Một nỗ lực liên kết bộ đệm với một mục tiêu khác sẽ gây ra lỗi `INVALID_OPERATION` và liên kết bộ đệm hiện tại sẽ giữ nguyên.

Một {{domxref("WebGLBuffer")}} đã được đánh dấu để xóa bằng {{domxref("WebGLRenderingContext.deleteBuffer()", "deleteBuffer")}} không thể bị ràng buộc (lại). Cố gắng làm như vậy sẽ gây ra lỗi `INVALID_OPERATION` và liên kết hiện tại sẽ không bị ảnh hưởng.

## Ví dụ

### Liên kết bộ đệm với mục tiêu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();

gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
```

### Nhận các ràng buộc hiện tại

Để kiểm tra các liên kết bộ đệm hiện tại, hãy truy vấn các hằng số `ARRAY_BUFFER_BINDING` và `ELEMENT_ARRAY_BUFFER_BINDING`.

```js
gl.getParameter(gl.ARRAY_BUFFER_BINDING);
gl.getParameter(gl.ELEMENT_ARRAY_BUFFER_BINDING);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.deleteBuffer()")}}
- {{domxref("WebGLRenderingContext.isBuffer()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
