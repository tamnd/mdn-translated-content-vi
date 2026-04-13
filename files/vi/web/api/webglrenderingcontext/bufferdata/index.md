---
title: "WebGLRenderingContext: bufferData() method"
short-title: bufferData()
slug: Web/API/WebGLRenderingContext/bufferData
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bufferData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bufferData()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) khởi tạo và tạo kho lưu trữ dữ liệu của đối tượng đệm.

## Cú pháp

```js-nolint
bufferData(target, size, usage)
bufferData(target, srcData, usage)
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

- `size`
  - : A {{domxref("WebGL_API/Types", "GLsizeiptr")}} thiết lập kích thước theo byte của dữ liệu của đối tượng bộ đệm
cửa hàng.
- `srcData` {{optional_inline}}
  - : Một {{jsxref("TypedArray")}} hoặc một {{jsxref("DataView")}} xem một {{jsxref("ArrayBuffer")}} hoặc
{{jsxref("SharedArrayBuffer")}} sẽ được sao chép vào kho dữ liệu. Nếu `null`, một kho dữ liệu vẫn được tạo, nhưng nội dung chưa được khởi tạo và không được xác định.
- `usage`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định kiểu sử dụng dự định của kho dữ liệu
cho mục đích tối ưu hóa. Các giá trị có thể:
    - `gl.STATIC_DRAW`
      - : Nội dung dự định được chỉ định
một lần bởi ứng dụng và được sử dụng nhiều lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh WebGL.
    - `gl.DYNAMIC_DRAW`
      - : Nội dung dự kiến ​​sẽ được xác định lại
được ứng dụng lặp đi lặp lại và được sử dụng nhiều lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh WebGL.
    - `gl.STREAM_DRAW`
      - : Nội dung dự định được chỉ định
một lần bởi ứng dụng và được sử dụng nhiều nhất một vài lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh WebGL.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.STATIC_READ`
      - : Nội dung được dự định là
được chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được ứng dụng truy vấn nhiều lần.
    - `gl.DYNAMIC_READ`
      - : Nội dung được dự định là
được xác định lại nhiều lần bằng cách đọc dữ liệu từ WebGL, và được ứng dụng truy vấn nhiều lần.
    - `gl.STREAM_READ`
      - : Nội dung được dự định là
được chỉ định một lần bằng cách đọc dữ liệu từ WebGL và được ứng dụng truy vấn nhiều nhất một vài lần
    - `gl.STATIC_COPY`
      - : Nội dung được dự định là
được chỉ định một lần bằng cách đọc dữ liệu từ WebGL, và được sử dụng nhiều lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh của WebGL.
    - `gl.DYNAMIC_COPY`
      - : Nội dung được dự định là
được xác định lại nhiều lần bằng cách đọc dữ liệu từ WebGL, và được sử dụng nhiều lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh WebGL.
    - `gl.STREAM_COPY`
      - : Nội dung được dự định là
được chỉ định một lần bằng cách đọc dữ liệu từ WebGL, và được sử dụng nhiều nhất một vài lần làm nguồn cho các lệnh vẽ và đặc tả hình ảnh của WebGL.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.OUT_OF_MEMORY` sẽ xuất hiện nếu ngữ cảnh không thể tạo
một kho dữ liệu với `size` đã cho.
- Một lỗi `gl.INVALID_VALUE` sẽ xuất hiện nếu `size` âm.
- Lỗi `gl.INVALID_ENUM` được đưa ra nếu `target` hoặc
`usage` không phải là một trong những enum được phép.

## Ví dụ

### Sử dụng bộ đệmData

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const buffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.bufferData(gl.ARRAY_BUFFER, 1024, gl.STATIC_DRAW);
```

### Lấy thông tin bộ đệm

Để kiểm tra việc sử dụng bộ đệm hiện tại và kích thước bộ đệm, hãy sử dụng phương pháp {{domxref("WebGLRenderingContext.getBufferParameter()")}}.

```js
gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_SIZE);
gl.getBufferParameter(gl.ARRAY_BUFFER, gl.BUFFER_USAGE);
```

### Lấy kích thước của một mảng đã gõ

Để tính tham số kích thước cho một mảng đã gõ.

```js
const dataArray = new Float32Array([1, 2, 3, 4]);
const sizeInBytes = dataArray.length * dataArray.BYTES_PER_ELEMENT;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGL2RenderingContext.bufferData()")}}
- {{domxref("WebGLRenderingContext.createBuffer()")}}
- {{domxref("WebGLRenderingContext.bufferSubData()")}}
- Các bộ đệm khác: {{domxref("WebGLFramebuffer")}}, {{domxref("WebGLRenderbuffer")}}
