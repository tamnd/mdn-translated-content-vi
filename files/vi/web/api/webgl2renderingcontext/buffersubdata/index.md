---
title: "WebGL2RenderingContext: phương thức bufferSubData()"
short-title: bufferSubData()
slug: Web/API/WebGL2RenderingContext/bufferSubData
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bufferSubData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bufferSubData()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) cập nhật một tập hợp con của kho dữ liệu đối tượng bộ đệm.

## Cú pháp

```js-nolint
bufferSubData(target, dstByteOffset, srcData)
bufferSubData(target, dstByteOffset, srcData, srcOffset)
bufferSubData(target, dstByteOffset, srcData, srcOffset, length)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target). Các giá trị có thể:
    - `gl.ARRAY_BUFFER`
      - : Bộ đệm chứa các thuộc tính đỉnh, chẳng hạn như tọa độ đỉnh, dữ liệu tọa độ texture hoặc dữ liệu màu đỉnh.
    - `gl.ELEMENT_ARRAY_BUFFER`
      - : Bộ đệm dùng cho chỉ mục phần tử.
    - `gl.COPY_READ_BUFFER`
      - : Bộ đệm để sao chép từ một đối tượng bộ đệm sang bộ đệm khác.
    - `gl.COPY_WRITE_BUFFER`
      - : Bộ đệm để sao chép từ một đối tượng bộ đệm sang bộ đệm khác.
    - `gl.TRANSFORM_FEEDBACK_BUFFER`
      - : Bộ đệm cho các hoạt động transform feedback.
    - `gl.UNIFORM_BUFFER`
      - : Bộ đệm dùng để lưu trữ các khối uniform.
    - `gl.PIXEL_PACK_BUFFER`
      - : Bộ đệm dùng cho các hoạt động chuyển pixel.
    - `gl.PIXEL_UNPACK_BUFFER`
      - : Bộ đệm dùng cho các hoạt động chuyển pixel.

- `dstByteOffset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định offset tính bằng byte nơi việc thay thế dữ liệu sẽ bắt đầu.
- `srcData`
  - : Một {{jsxref("TypedArray")}} hoặc một {{jsxref("DataView")}} xem một {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}} sẽ được sao chép vào kho dữ liệu.
- `srcOffset` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định offset chỉ mục phần tử nơi bắt đầu đọc bộ đệm.
- `length` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} mặc định là 0, trong đó 0 có nghĩa là `bufferSubData` sẽ tính toán độ dài.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.INVALID_VALUE` được ném nếu dữ liệu sẽ được ghi vượt quá cuối bộ đệm hoặc nếu `data` là `null`.
- Lỗi `gl.INVALID_ENUM` được ném nếu `target` không phải là một trong các enum cho phép.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bufferSubData()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.bufferData()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}