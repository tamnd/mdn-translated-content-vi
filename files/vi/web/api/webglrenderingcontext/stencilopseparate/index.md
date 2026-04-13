---
title: "WebGLRenderingContext: stencilOpSeparate() method"
short-title: stencilOpSeparate()
slug: Web/API/WebGLRenderingContext/stencilOpSeparate
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.stencilOpSeparate
---

{{APIRef("WebGL")}}_TOK1__

Phương thức **`WebGLRenderingContext.stencilOpSeparate()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập các hành động kiểm tra stencil mặt trước và/hoặc mặt sau.

## Cú pháp

```js-nolint
stencilOpSeparate(face, fail, zfail, zpass)
```

### Thông số

- `face`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định trạng thái stencil mặt trước và/hoặc mặt sau là
được cập nhật. Các giá trị có thể là:
    - `gl.FRONT`
    - `gl.BACK`
    - `gl.FRONT_AND_BACK`

- `fail`
  - : {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chức năng sẽ sử dụng khi kiểm tra stencil không thành công.
Giá trị mặc định là `gl.KEEP`.
- `zfail`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chức năng sẽ sử dụng khi vượt qua bài kiểm tra stencil,
nhưng bài kiểm tra độ sâu không thành công. Giá trị mặc định là `gl.KEEP`.
- `zpass`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chức năng sẽ sử dụng khi kiểm tra cả stencil
và vượt qua bài kiểm tra độ sâu hoặc khi bài kiểm tra stencil đạt và không có bộ đệm độ sâu hoặc kiểm tra độ sâu bị vô hiệu hóa. Giá trị mặc định là `gl.KEEP`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Hằng số

- `gl.KEEP`
  - : Giữ giá trị hiện tại.
- `gl.ZERO`
  - : Đặt giá trị bộ đệm stencil thành 0.
- `gl.REPLACE`
  - : Đặt giá trị bộ đệm stencil thành giá trị tham chiếu như được chỉ định bởi
{{domxref("WebGLRenderingContext.stencilFunc()")}}.
- `gl.INCR`
  - : Tăng giá trị bộ đệm stencil hiện tại. Kẹp đến mức tối đa có thể thể hiện được
giá trị không dấu.
- `gl.INCR_WRAP`
  - : Tăng giá trị bộ đệm stencil hiện tại. Bao bọc giá trị bộ đệm stencil về 0 khi
tăng giá trị không dấu tối đa có thể biểu thị.
- `gl.DECR`
  - : Giảm giá trị bộ đệm stencil hiện tại. Kẹp về 0.
- `gl.DECR_WRAP`
  - : Giảm giá trị bộ đệm stencil hiện tại. Bao bọc giá trị bộ đệm stencil vào
giá trị không dấu có thể biểu thị tối đa khi giảm giá trị bộ đệm stencil bằng 0.
- `gl.INVERT`
  - : Đảo ngược giá trị bộ đệm stencil hiện tại theo bit.

## Ví dụ

Việc kiểm tra stencil bị tắt theo mặc định. Để bật hoặc tắt kiểm tra stencil, hãy sử dụng phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.STENCIL_TEST`.

```js
gl.enable(gl.STENCIL_TEST);
gl.stencilOpSeparate(gl.FRONT, gl.INCR, gl.DECR, gl.INVERT);
```

Để có được thông tin hiện tại về stencil và độ sâu đạt hoặc không đạt, hãy truy vấn các hằng số sau bằng {{domxref("WebGLRenderingContext.getParameter", "getParameter()")}}.

```js
gl.getParameter(gl.STENCIL_FAIL);
gl.getParameter(gl.STENCIL_PASS_DEPTH_PASS);
gl.getParameter(gl.STENCIL_PASS_DEPTH_FAIL);
gl.getParameter(gl.STENCIL_BACK_FAIL);
gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_PASS);
gl.getParameter(gl.STENCIL_BACK_PASS_DEPTH_FAIL);
gl.getParameter(gl.STENCIL_BITS);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.stencilOp()")}}
- {{domxref("WebGLRenderingContext.stencilFunc()")}}
- {{domxref("WebGLRenderingContext.stencilFuncSeparate()")}}
- {{domxref("WebGLRenderingContext.stencilMask()")}}
- {{domxref("WebGLRenderingContext.stencilMaskSeparate()")}}
