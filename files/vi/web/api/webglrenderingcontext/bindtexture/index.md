---
title: "WebGLRenderingContext: bindTexture() method"
short-title: bindTexture()
slug: Web/API/WebGLRenderingContext/bindTexture
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.bindTexture
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.bindTexture()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) liên kết một {{domxref("WebGLTexture")}} nhất định với một mục tiêu (điểm liên kết).

## Cú pháp

```js-nolint
bindTexture(target, texture)
```

### Thông số

- `target`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định điểm liên kết (đích). Các giá trị có thể:
    - `gl.TEXTURE_2D`
      - : Một kết cấu hai chiều.
    - `gl.TEXTURE_CUBE_MAP`
      - : Một kết cấu được ánh xạ hình khối.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.TEXTURE_3D`
      - : Một kết cấu ba chiều.
    - `gl.TEXTURE_2D_ARRAY`
      - : Kết cấu mảng hai chiều.

- `texture`
  - : Một đối tượng {{domxref("WebGLTexture")}} để liên kết.
Nếu `null` được thông qua, kết cấu hiện tại bị ràng buộc cho mục tiêu đã chỉ định sẽ không bị ràng buộc.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Một lỗi `gl.INVALID_ENUM` được đưa ra nếu `target` không phải là `gl.TEXTURE_2D`, `gl.TEXTURE_CUBE_MAP`, `gl.TEXTURE_3D`, hoặc `gl.TEXTURE_2D_ARRAY`.

## Ví dụ

### Ràng buộc một kết cấu

```js
const canvas = document.getElementById("canvas");
const gl = canvas.getContext("webgl");
const texture = gl.createTexture();

gl.bindTexture(gl.TEXTURE_2D, texture);
```

### Bỏ ràng buộc một kết cấu

```js
// Unbind any texture currently bound to TEXTURE_2D
gl.bindTexture(gl.TEXTURE_2D, null);
```

### Nhận các ràng buộc hiện tại

Để kiểm tra liên kết kết cấu hiện tại, hãy truy vấn các hằng số `gl.TEXTURE_BINDING_2D` hoặc `gl.TEXTURE_BINDING_CUBE_MAP`.

```js
gl.getParameter(gl.TEXTURE_BINDING_2D);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.createTexture()")}}
- {{domxref("WebGLRenderingContext.deleteTexture()")}}
- {{domxref("WebGLRenderingContext.isTexture()")}}
- {{domxref("WebGLRenderingContext.texImage2D()")}}
