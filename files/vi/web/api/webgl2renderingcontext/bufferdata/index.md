---
title: "WebGL2RenderingContext: phương thức bufferData()"
short-title: bufferData()
slug: Web/API/WebGL2RenderingContext/bufferData
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.bufferData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.bufferData()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo kho dữ liệu của đối tượng bộ đệm.

## Cú pháp

```js-nolint
bufferData(target, size, usage)
bufferData(target, srcData, usage)
bufferData(target, srcData, usage, srcOffset)
bufferData(target, srcData, usage, srcOffset, length)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target). Các giá trị có thể:
    - `gl.ARRAY_BUFFER`
      - : Bộ đệm chứa các thuộc tính đỉnh, chẳng hạn như
        tọa độ đỉnh, dữ liệu tọa độ texture hoặc dữ liệu màu đỉnh.
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

- `size` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLsizeiptr")}} đặt kích thước tính bằng byte của kho dữ liệu bộ đệm.
    Một trong `size` và `srcData` phải được cung cấp.
- `srcData` {{optional_inline}}
  - : Một {{jsxref("TypedArray")}} hoặc một {{jsxref("DataView")}} xem một {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}}
    sẽ được sao chép vào kho dữ liệu.
    Nếu `null`, một kho dữ liệu vẫn được tạo, nhưng nội dung chưa được khởi tạo và không xác định.
    Một trong `size` và `srcData` phải được cung cấp.
- `usage`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định mẫu sử dụng dự định của kho dữ liệu
    cho mục đích tối ưu hóa. Các giá trị có thể:
    - `gl.STATIC_DRAW`
      - : Nội dung dự định được chỉ định
        một lần bởi ứng dụng và được sử dụng nhiều lần làm nguồn cho các lệnh
        vẽ và chỉ định hình ảnh WebGL.
    - `gl.DYNAMIC_DRAW`
      - : Nội dung dự định được chỉ định lại
        nhiều lần bởi ứng dụng và được sử dụng nhiều lần làm nguồn cho các lệnh
        vẽ và chỉ định hình ảnh WebGL.
    - `gl.STREAM_DRAW`
      - : Nội dung dự định được chỉ định
        một lần bởi ứng dụng và được sử dụng nhiều nhất một vài lần làm nguồn cho
        các lệnh vẽ và chỉ định hình ảnh WebGL.
    - `gl.STATIC_READ`
      - : Nội dung dự định được
        chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được truy vấn nhiều lần
        bởi ứng dụng.
    - `gl.DYNAMIC_READ`
      - : Nội dung dự định được
        chỉ định lại nhiều lần bằng cách đọc dữ liệu từ WebGL và được truy vấn
        nhiều lần bởi ứng dụng.
    - `gl.STREAM_READ`
      - : Nội dung dự định được
        chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được truy vấn nhiều nhất
        một vài lần bởi ứng dụng.
    - `gl.STATIC_COPY`
      - : Nội dung dự định được
        chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được sử dụng nhiều lần làm
        nguồn cho các lệnh vẽ và chỉ định hình ảnh WebGL.
    - `gl.DYNAMIC_COPY`
      - : Nội dung dự định được
        chỉ định lại nhiều lần bằng cách đọc dữ liệu từ WebGL và được sử dụng nhiều
        lần làm nguồn cho các lệnh vẽ và chỉ định hình ảnh WebGL.
    - `gl.STREAM_COPY`
      - : Nội dung dự định được
        chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được sử dụng nhiều nhất
        một vài lần làm nguồn cho các lệnh vẽ và chỉ định hình ảnh WebGL.

- `srcOffset` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định offset chỉ mục phần tử nơi bắt đầu đọc
    bộ đệm.
    Chỉ được phép nếu `srcData` được cung cấp.
- `length` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} mặc định là 0.
    Chỉ được phép nếu `srcOffset` được cung cấp.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.OUT_OF_MEMORY` được ném nếu ngữ cảnh không thể tạo
  kho dữ liệu với `size` đã cho.
- Lỗi `gl.INVALID_VALUE` được ném nếu `size` là số âm.
- Lỗi `gl.INVALID_ENUM` được ném nếu `target` hoặc `usage` không phải là một trong các enum cho phép.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bufferData()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.bufferSubData()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
