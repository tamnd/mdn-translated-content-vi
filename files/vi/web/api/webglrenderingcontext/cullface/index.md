---
title: "WebGLRenderingContext: cullFace() method"
short-title: cullFace()
slug: Web/API/WebGLRenderingContext/cullFace
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.cullFace
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.cullFace()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chỉ định liệu các đa giác ở mặt trước và/hoặc mặt sau có thể được loại bỏ hay không.

## Cú pháp

```js-nolint
cullFace(mode)
```

### Thông số

- `mode`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định các đa giác hướng về phía trước hay phía sau là
các ứng cử viên để loại bỏ. Giá trị mặc định là `gl.BACK`. Các giá trị có thể là:
    - `gl.FRONT`
    - `gl.BACK`
    - `gl.FRONT_AND_BACK`

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Việc loại bỏ đa giác bị tắt theo mặc định. Để bật hoặc tắt tính năng loại bỏ, hãy sử dụng các phương thức {{domxref("WebGLRenderingContext.enable", "enable()")}} và {{domxref("WebGLRenderingContext.disable", "disable()")}} với đối số `gl.CULL_FACE`.

```js
gl.enable(gl.CULL_FACE);
gl.cullFace(gl.FRONT_AND_BACK);
```

Để kiểm tra chế độ loại bỏ mặt hiện tại, hãy truy vấn hằng số `CULL_FACE_MODE`.

```js
gl.getParameter(gl.CULL_FACE_MODE) === gl.FRONT_AND_BACK;
// true
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.enable()")}}
- {{domxref("WebGLRenderingContext.frontFace()")}}
