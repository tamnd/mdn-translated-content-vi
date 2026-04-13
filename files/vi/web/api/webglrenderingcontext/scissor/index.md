---
title: "WebGLRenderingContext: scissor() method"
short-title: scissor()
slug: Web/API/WebGLRenderingContext/scissor
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.scissor
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.scissor()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập một hộp cắt kéo, giới hạn bản vẽ trong một hình chữ nhật xác định.

## Cú pháp

```js-nolint
scissor(x, y, width, height)
```

### Thông số

- `x`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ ngang cho phía dưới bên trái
góc của hộp. Giá trị mặc định: 0.
- `y`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ dọc cho góc dưới bên trái
của hộp. Giá trị mặc định: 0.
- `width`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} không âm xác định chiều rộng của hộp cắt kéo.
Giá trị mặc định: chiều rộng của khung vẽ.
- `height`
  - : Một {{domxref("WebGL_API/Types", "GLsizei")}} không âm xác định chiều cao của hộp cắt kéo.
Giá trị mặc định: chiều cao của canvas.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Nếu _width_ hoặc _height_ là giá trị âm, lỗi `gl.INVALID_VALUE` sẽ được đưa ra.

## Ví dụ

Khi bật tính năng kiểm tra cắt kéo, chỉ các pixel trong hộp cắt kéo mới có thể được sửa đổi bằng lệnh vẽ.

```js
// turn on scissor test
gl.enable(gl.SCISSOR_TEST);

// set the scissor rectangle
gl.scissor(x, y, width, height);

// execute drawing commands in the scissor box (e.g. clear)

// turn off scissor test again
gl.disable(gl.SCISSOR_TEST);
```

Để có được kích thước hộp cắt kéo hiện tại, hãy truy vấn hằng số `SCISSOR_BOX` trả về {{jsxref("Int32Array")}}.

```js
gl.scissor(0, 0, 200, 200);
gl.getParameter(gl.SCISSOR_BOX);
// Int32Array[0, 0, 200, 200]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.viewport()")}}
- {{domxref("WebGLRenderingContext.enable()")}}
- {{domxref("WebGLRenderingContext.disable()")}}
