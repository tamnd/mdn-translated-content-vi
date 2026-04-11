---
title: "WebGLRenderingContext: depthMask() method"
short-title: depthMask()
slug: Web/API/WebGLRenderingContext/depthMask
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.depthMask
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.depthMask()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) thiết lập việc ghi vào vùng đệm sâu được bật hay tắt.

## Cú pháp

```js-nolint
depthMask(flag)
```

### Thông số

- `flag`
  - : A {{domxref("WebGL_API/Types", "GLboolean")}} chỉ định có ghi vào bộ đệm sâu hay không
được kích hoạt. Giá trị mặc định: `true`, nghĩa là chức năng ghi được kích hoạt.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
gl.depthMask(false);
```

Để có được mặt nạ độ sâu hiện tại, hãy truy vấn hằng số `DEPTH_WRITEMASK` trả về giá trị boolean.

```js
gl.getParameter(gl.DEPTH_WRITEMASK);
// false
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.colorMask()")}}
- {{domxref("WebGLRenderingContext.stencilMask()")}}
