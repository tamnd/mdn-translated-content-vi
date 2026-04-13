---
title: "WebGL2RenderingContext: phương thức copyBufferSubData()"
short-title: copyBufferSubData()
slug: Web/API/WebGL2RenderingContext/copyBufferSubData
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.copyBufferSubData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.copyBufferSubData()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) sao chép một phần dữ liệu từ bộ đệm này sang bộ đệm khác.

## Cú pháp

```js-nolint
copyBufferSubData(readTarget, writeTarget, readOffset, writeOffset, size)
```

### Tham số

- `readTarget`, `writeTarget`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (target) từ nơi dữ liệu sẽ được đọc hoặc ghi. Các giá trị có thể:
    - `gl.ARRAY_BUFFER`: Bộ đệm chứa các thuộc tính đỉnh, chẳng hạn như tọa độ đỉnh, dữ liệu tọa độ texture hoặc dữ liệu màu đỉnh.
    - `gl.ELEMENT_ARRAY_BUFFER`: Bộ đệm dùng cho chỉ mục phần tử.
    - `gl.COPY_READ_BUFFER`: Bộ đệm để sao chép từ một đối tượng bộ đệm sang bộ đệm khác (cung cấp cụ thể cho các hoạt động sao chép).
    - `gl.COPY_WRITE_BUFFER`: Bộ đệm để sao chép từ một đối tượng bộ đệm sang bộ đệm khác (cung cấp cụ thể cho các hoạt động sao chép).
    - `gl.TRANSFORM_FEEDBACK_BUFFER`: Bộ đệm cho các hoạt động transform feedback.
    - `gl.UNIFORM_BUFFER`: Bộ đệm dùng để lưu trữ các khối uniform.
    - `gl.PIXEL_PACK_BUFFER`: Bộ đệm dùng cho các hoạt động chuyển pixel.
    - `gl.PIXEL_UNPACK_BUFFER`: Bộ đệm dùng cho các hoạt động chuyển pixel.

- `readOffset`, `writeOffset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định offset byte từ nơi bắt đầu đọc hoặc ghi vào bộ đệm.
- `size`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} tính bằng byte chỉ định kích thước dữ liệu sẽ được sao chép từ `readTarget` sang `writeTarget`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const srcBuffer = gl.createBuffer();
const dstBuffer = gl.createBuffer();

const data = new Float32Array(vertices);
const length = vertices.length * 4;

gl.bindBuffer(gl.ARRAY_BUFFER, srcBuffer);
gl.bufferData(gl.ARRAY_BUFFER, data, gl.STATIC_DRAW);
gl.bindBuffer(gl.COPY_READ_BUFFER, srcBuffer);

gl.bindBuffer(gl.ARRAY_BUFFER, dstBuffer);
gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(length), gl.STATIC_DRAW);

gl.copyBufferSubData(gl.COPY_READ_BUFFER, gl.ARRAY_BUFFER, 0, 0, length);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bufferData()")}}
- {{domxref("WebGLRenderingContext.bufferSubData()")}}
- {{domxref("WebGLRenderingContext.getBufferParameter()")}}
- {{domxref("WebGL2RenderingContext.getBufferSubData()")}}