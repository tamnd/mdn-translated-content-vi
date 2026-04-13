---
title: "WebGLRenderingContext: viewport() method"
short-title: viewport()
slug: Web/API/WebGLRenderingContext/viewport
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.viewport
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`WebGLRenderingContext.viewport()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) đặt khung nhìn, chỉ định phép biến đổi affine của x và y từ tọa độ thiết bị chuẩn hóa sang tọa độ cửa sổ.

## Cú pháp

```js-nolint
viewport(x, y, width, height)
```

### Thông số

- `x`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ ngang cho phía dưới bên trái
góc gốc của khung nhìn. Giá trị mặc định: 0.
- `y`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định tọa độ dọc cho góc dưới bên trái
của nguồn gốc khung nhìn. Giá trị mặc định: 0.
- `width`
  - : {{domxref("WebGL_API/Types", "GLsizei")}} không âm chỉ định chiều rộng của khung nhìn. Mặc định
giá trị: chiều rộng của canvas.
- `height`
  - : {{domxref("WebGL_API/Types", "GLsizei")}} không âm chỉ định chiều cao của khung nhìn. Mặc định
giá trị: chiều cao của canvas.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Nếu _width_ hoặc _height_ là giá trị âm thì sẽ xảy ra lỗi `gl.INVALID_VALUE`.

## Ví dụ

Khi bạn tạo bối cảnh WebGL lần đầu tiên, kích thước của khung nhìn sẽ khớp với kích thước của khung vẽ. Tuy nhiên, nếu thay đổi kích thước khung vẽ, bạn sẽ cần thông báo cho ngữ cảnh WebGL một cài đặt chế độ xem mới. Trong tình huống này, bạn có thể sử dụng `gl.viewport`.

```js
gl.viewport(0, 0, canvas.width, canvas.height);
```

Chiều rộng và chiều cao của khung nhìn được giới hạn trong phạm vi phụ thuộc vào việc triển khai. Để có được phạm vi này, bạn có thể sử dụng hằng số `MAX_VIEWPORT_DIMS`, hằng số này trả về {{jsxref("Int32Array")}}.

```js
gl.getParameter(gl.MAX_VIEWPORT_DIMS);
// e.g. Int32Array[16384, 16384]
```

Để có chế độ xem hiện tại, hãy truy vấn hằng số `VIEWPORT`.

```js
gl.getParameter(gl.VIEWPORT);
// e.g. Int32Array[0, 0, 640, 480]
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.scissor()")}}
- {{domxref("WebGLRenderingContext.getParameter()")}}
