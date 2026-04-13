---
title: "WebGLRenderingContext: hint() method"
short-title: hint()
slug: Web/API/WebGLRenderingContext/hint
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.hint
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.hint()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định các gợi ý cho một số hành vi nhất định. Việc giải thích những gợi ý này phụ thuộc vào việc thực hiện.

## Cú pháp

```js-nolint
hint(target, mode)
```

### Thông số

- `target`
  - : Đặt hành vi nào sẽ được kiểm soát. Các giá trị có thể:
    - `gl.GENERATE_MIPMAP_HINT`
      - : Chất lượng lọc khi tạo
hình ảnh mipmap với {{domxref("WebGLRenderingContext.generateMipmap()")}}.

Khi sử dụng phần mở rộng {{domxref("OES_standard_derivatives")}}:
    - `ext.FRAGMENT_SHADER_DERIVATIVE_HINT_OES`
      - : Độ chính xác của
tính toán đạo hàm cho các hàm dựng sẵn GLSL: `dFdx`, `dFdy`, và `fwidth`.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.FRAGMENT_SHADER_DERIVATIVE_HINT`
      - : Giống như `ext.FRAGMENT_SHADER_DERIVATIVE_HINT_OES`

- `mode`
  - : Thiết lập hành vi. Giá trị mặc định là `gl.DONT_CARE`. Điều có thể
giá trị là:
    - `gl.FASTEST`: Nên sử dụng hành vi hiệu quả nhất.
    - `gl.NICEST`: Lựa chọn chính xác nhất hoặc chất lượng cao nhất phải là
đã sử dụng.
    - `gl.DONT_CARE`: Không có ưu tiên nào cho hành vi này.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ sau gợi ý rằng chất lượng lọc khi tạo hình ảnh mipmap phải hiệu quả nhất thay vì chất lượng tốt nhất.

```js
gl.hint(gl.GENERATE_MIPMAP_HINT, gl.FASTEST);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.generateMipmap()")}}
- {{domxref("OES_standard_derivatives")}}
