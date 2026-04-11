---
title: "WebGLRenderingContext: stencilFunc() method"
short-title: stencilFunc()
slug: Web/API/WebGLRenderingContext/stencilFunc
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.stencilFunc
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.stencilFunc()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập chức năng mặt trước và mặt sau cũng như giá trị tham chiếu cho việc kiểm tra stencil.

Tính năng tạo khuôn cho phép và vô hiệu hóa việc vẽ trên cơ sở từng pixel. Nó thường được sử dụng trong kết xuất nhiều lượt để đạt được các hiệu ứng đặc biệt.

## Cú pháp

```js-nolint
stencilFunc(func, ref, mask)
```

### Thông số

- `func`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chức năng kiểm tra. Chức năng mặc định là
`gl.ALWAYS`. Các giá trị có thể là:
    - `gl.NEVER`: Không bao giờ vượt qua.
    - `gl.LESS`: Đạt nếu
`(ref & mask) < (stencil & mask)`.
    - `gl.EQUAL`: Đạt nếu
`(ref & mask) = (stencil & mask)`.
    - `gl.LEQUAL`: Đạt nếu
`(ref & mask) <= (stencil & mask)`.
    - `gl.GREATER`: Đạt nếu
`(ref & mask) > (stencil & mask)`.
    - `gl.NOTEQUAL`: Đạt nếu
`(ref & mask) !== (stencil & mask)`.
    - `gl.GEQUAL`: Đạt nếu
`(ref & mask) >= (stencil & mask)`.
    - `gl.ALWAYS`: Luôn đậu.

- `ref`
  - : A {{domxref("WebGL_API/Types", "GLint")}} chỉ định giá trị tham chiếu cho thử nghiệm stencil. Cái này
giá trị được giới hạn trong phạm vi từ 0 đến 2^n - 1 trong đó n là số mặt phẳng bit trong bộ đệm stencil. Giá trị mặc định là 0.
- `mask`
  - : Một {{domxref("WebGL_API/Types", "GLuint")}} chỉ định một mặt nạ bit khôn ngoan được sử dụng để VÀ tham chiếu
giá trị và giá trị stencil được lưu trữ khi quá trình kiểm tra được thực hiện. Giá trị mặc định đều là 1.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Việc kiểm tra stencil bị tắt theo mặc định. Để bật hoặc tắt kiểm tra stencil, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.STENCIL_TEST`.

```js
gl.enable(gl.STENCIL_TEST);
gl.stencilFunc(gl.LESS, 0, 0b1110011);
```

Để có được hàm stencil hiện tại, giá trị tham chiếu hoặc thông tin stencil khác, hãy truy vấn các hằng số sau bằng {{domxref("WebGLRenderingContext.getParameter", "getParameter()")}}.

```js
gl.getParameter(gl.STENCIL_FUNC);
gl.getParameter(gl.STENCIL_VALUE_MASK);
gl.getParameter(gl.STENCIL_REF);
gl.getParameter(gl.STENCIL_BACK_FUNC);
gl.getParameter(gl.STENCIL_BACK_VALUE_MASK);
gl.getParameter(gl.STENCIL_BACK_REF);
gl.getParameter(gl.STENCIL_BITS);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.stencilFuncSeparate()")}}
- {{domxref("WebGLRenderingContext.stencilMask()")}}
- {{domxref("WebGLRenderingContext.stencilMaskSeparate()")}}
- {{domxref("WebGLRenderingContext.stencilOp()")}}
- {{domxref("WebGLRenderingContext.stencilOpSeparate()")}}
