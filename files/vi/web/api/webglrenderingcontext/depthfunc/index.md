---
title: "WebGLRenderingContext: depthFunc() method"
short-title: depthFunc()
slug: Web/API/WebGLRenderingContext/depthFunc
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.depthFunc
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.depthFunc()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định một chức năng so sánh độ sâu pixel đến với giá trị bộ đệm độ sâu hiện tại.

## Cú pháp

```js-nolint
depthFunc(func)
```

### Thông số

- `func`
  - : A {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chức năng so sánh độ sâu, thiết lập
điều kiện mà pixel sẽ được vẽ. Giá trị mặc định là `gl.LESS`. Các giá trị có thể là:
    - `gl.NEVER` (không bao giờ vượt qua)
    - `gl.LESS` (đạt nếu giá trị đến nhỏ hơn bộ đệm độ sâu
giá trị)
    - `gl.EQUAL` (đạt nếu giá trị đến bằng giá trị bộ đệm độ sâu)
    - `gl.LEQUAL` (đạt nếu giá trị đến nhỏ hơn hoặc bằng giá trị
giá trị bộ đệm độ sâu)
    - `gl.GREATER` (đạt nếu giá trị đến lớn hơn độ sâu
giá trị đệm)
    - `gl.NOTEQUAL` (đạt nếu giá trị đến không bằng độ sâu
giá trị đệm)
    - `gl.GEQUAL` (đạt nếu giá trị đến lớn hơn hoặc bằng
giá trị bộ đệm độ sâu)
    - `gl.ALWAYS` (luôn đậu)

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Kiểm tra độ sâu bị tắt theo mặc định. Để bật hoặc tắt kiểm tra độ sâu, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.DEPTH_TEST`.

```js
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.NEVER);
```

Để kiểm tra hàm độ sâu hiện tại, hãy truy vấn hằng số `DEPTH_FUNC`.

```js
gl.getParameter(gl.DEPTH_FUNC) === gl.NEVER;
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.enable()")}}
