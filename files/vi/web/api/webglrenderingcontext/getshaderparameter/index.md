---
title: "WebGLRenderingContext: getShaderParameter() method"
short-title: getShaderParameter()
slug: Web/API/WebGLRenderingContext/getShaderParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getShaderParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getShaderParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về shader đã cho.

## Cú pháp

```js-nolint
getShaderParameter(shader, pname)
```

### Thông số

- `shader`
  - : A {{domxref("WebGLShader")}} để lấy thông tin tham số từ đó.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.DELETE_STATUS`
      - : Trả về {{domxref("WebGL_API/Types", "GLboolean")}} cho biết
trình đổ bóng có được gắn cờ để xóa hay không.
    - `gl.COMPILE_STATUS`
      - : Trả về {{domxref("WebGL_API/Types", "GLboolean")}} cho biết
việc biên dịch shader cuối cùng có thành công hay không.
    - `gl.SHADER_TYPE`
      - : Trả về {{domxref("WebGL_API/Types", "GLenum")}} cho biết liệu
trình đổ bóng là đối tượng trình đổ bóng đỉnh (`gl.VERTEX_SHADER`) hoặc trình đổ bóng mảnh (`gl.FRAGMENT_SHADER`).

### Giá trị trả về

Trả về thông tin shader được yêu cầu (như được chỉ định với `pname`).

## Ví dụ

```js
gl.getShaderParameter(shader, gl.SHADER_TYPE);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getProgramParameter()")}}
