---
title: "WebGL2RenderingContext: phương thức getBufferSubData()"
short-title: getBufferSubData()
slug: Web/API/WebGL2RenderingContext/getBufferSubData
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getBufferSubData
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getBufferSubData()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) đọc dữ liệu từ một điểm liên kết bộ đệm và ghi chúng vào một {{jsxref("ArrayBuffer")}} hoặc {{jsxref("SharedArrayBuffer")}}.

## Cú pháp

```js-nolint
getBufferSubData(target, srcByteOffset, dstData)
getBufferSubData(target, srcByteOffset, dstData, dstOffset)
getBufferSubData(target, srcByteOffset, dstData, dstOffset, length)
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

- `srcByteOffset`
  - : Một {{domxref("WebGL_API/Types", "GLintptr")}} chỉ định offset byte từ nơi bắt đầu đọc từ bộ đệm.
- `dstData`
  - : Một đối tượng {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}} để sao chép dữ liệu vào. Nếu `dstData` là một {{jsxref("DataView")}} thì `dstOffset` và `length` được hiểu theo byte, nếu không thì loại phần tử của `dstData` được sử dụng.
- `dstOffset` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định offset phần tử bắt đầu ghi trong `dstData`.
- `length` {{optional_inline}}
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định số phần tử sẽ sao chép. Nếu là 0 hoặc không được chỉ định, `getBufferSubData` sẽ sao chép cho đến cuối `dstData`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

Lỗi `INVALID_VALUE` được tạo nếu:

- `offset` + `returnedData.byteLength` sẽ vượt quá cuối bộ đệm
- `returnedData` là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null)
- `offset` nhỏ hơn 0.

Lỗi `INVALID_OPERATION` được tạo nếu:

- số 0 được liên kết với `target`
- `target` là `TRANSFORM_FEEDBACK_BUFFER` và bất kỳ đối tượng transform feedback nào hiện đang hoạt động.

## Ví dụ

```js
const buffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buffer);
gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW);

const arrBuffer = new ArrayBuffer(
  vertices.length * Float32Array.BYTES_PER_ELEMENT,
);
gl.getBufferSubData(gl.ARRAY_BUFFER, 0, new Float32Array(arrBuffer));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.bufferData()")}}
- {{domxref("WebGLRenderingContext.bufferSubData()")}}
- {{domxref("WebGLRenderingContext.getBufferParameter()")}}
- {{domxref("WebGL2RenderingContext.copyBufferSubData()")}}