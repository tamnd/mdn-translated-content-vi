---
title: "WebGLRenderingContext: readPixels() method"
short-title: readPixels()
slug: Web/API/WebGLRenderingContext/readPixels
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.readPixels
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.readPixels()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) đọc một khối pixel từ một hình chữ nhật được chỉ định của bộ đệm khung màu hiện tại vào một đối tượng {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}.

## Cú pháp

```js-nolint
// WebGL1:
readPixels(x, y, width, height, format, type, pixels)

// WebGL2:
readPixels(x, y, width, height, format, type, offset)
readPixels(x, y, width, height, format, type, pixels)
readPixels(x, y, width, height, format, type, pixels, dstOffset)
```

### Thông số

- `x`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định pixel ngang đầu tiên được đọc từ
góc dưới bên trái của khối pixel hình chữ nhật.
- `y`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định pixel dọc đầu tiên được đọc từ
góc dưới bên trái của khối pixel hình chữ nhật.
- `width`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} chỉ định chiều rộng của hình chữ nhật.
- `height`
  - : A {{domxref("WebGL_API/Types", "GLsizei")}} xác định chiều cao của hình chữ nhật.
- `format`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng của dữ liệu pixel. Các giá trị có thể:
    - `gl.ALPHA`
      - : Loại bỏ các thành phần màu đỏ, xanh lá cây và xanh dương và đọc
thành phần alpha.
    - `gl.RGB`
      - : Loại bỏ các thành phần alpha và đọc các thành phần màu đỏ, xanh lá cây và
thành phần màu xanh.
    - `gl.RGBA`
      - : Các thành phần màu đỏ, xanh lá cây, xanh dương và alpha được đọc từ
đệm màu.

WebGL2 thêm vào
    - `gl.RED`
    - `gl.RG`
    - `gl.RED_INTEGER`
    - `gl.RG_INTEGER`
    - `gl.RGB_INTEGER`
    - `gl.RGBA_INTEGER`

- `type`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại dữ liệu của dữ liệu pixel. Các giá trị có thể:
    - `gl.UNSIGNED_BYTE`
    - `gl.UNSIGNED_SHORT_5_6_5`
    - `gl.UNSIGNED_SHORT_4_4_4_4`
    - `gl.UNSIGNED_SHORT_5_5_5_1`
    - `gl.FLOAT`

WebGL2 thêm vào
    - `gl.BYTE`
    - `gl.UNSIGNED_INT_2_10_10_10_REV`
    - `gl.HALF_FLOAT`
    - `gl.SHORT`
    - `gl.UNSIGNED_SHORT`
    - `gl.INT`
    - `gl.UNSIGNED_INT`
    - `gl.UNSIGNED_INT_10F_11F_11F_REV`
    - `gl.UNSIGNED_INT_5_9_9_9_REV`

- `pixels`
  - : Đối tượng để đọc dữ liệu vào. Kiểu mảng phải
khớp với kiểu của tham số `type`:
    - {{jsxref("Uint8Array")}} cho `gl.UNSIGNED_BYTE`.
    - {{jsxref("Uint16Array")}} cho `gl.UNSIGNED_SHORT_5_6_5`,
`gl.UNSIGNED_SHORT_4_4_4_4`, hoặc `gl.UNSIGNED_SHORT_5_5_5_1`.
    - {{jsxref("Float32Array")}} cho `gl.FLOAT`.

- `dstOffset` {{optional_inline}}
  - : Bù lại. Mặc định là 0.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- Lỗi `gl.INVALID_ENUM` được đưa ra nếu `format` hoặc
`type` không phải là giá trị được chấp nhận.
- Lỗi `gl.INVALID_OPERATION` sẽ xuất hiện nếu
  - `type` là `gl.UNSIGNED_SHORT_5_6_5` và
`format` không phải là `gl.RGB`.
  - `type` là `gl.UNSIGNED_SHORT_4_4_4_4` và
`format` không phải là `gl.RGBA`.
  - `type` không khớp với kiểu mảng được gõ của `pixels`.

- Lỗi `gl.INVALID_FRAMEBUFFER_OPERATION` sẽ xuất hiện nếu hiện tại
bộ đệm khung bị ràng buộc chưa hoàn thành bộ đệm khung.

## Ví dụ

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const pixels = new Uint8Array(
  gl.drawingBufferWidth * gl.drawingBufferHeight * 4,
);
gl.readPixels(
  0,
  0,
  gl.drawingBufferWidth,
  gl.drawingBufferHeight,
  gl.RGBA,
  gl.UNSIGNED_BYTE,
  pixels,
);
console.log(pixels); // Uint8Array
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- [Mảng được gõ](/en-US/docs/Web/JavaScript/Guide/Typed_arrays)
