---
title: "WebGLRenderingContext: getProgramParameter() method"
short-title: getProgramParameter()
slug: Web/API/WebGLRenderingContext/getProgramParameter
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getProgramParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getProgramParameter()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về chương trình đã cho.

## Cú pháp

```js-nolint
getProgramParameter(program, pname)
```

### Thông số

- `program`
  - : A {{domxref("WebGLProgram")}} để lấy thông tin tham số từ đó.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần truy vấn. Các giá trị có thể:
    - `gl.DELETE_STATUS`
      - : Trả về {{domxref("WebGL_API/Types", "GLboolean")}} cho biết
chương trình có bị gắn cờ xóa hay không.
    - `gl.LINK_STATUS`
      - : Trả về {{domxref("WebGL_API/Types", "GLboolean")}} cho biết
hoạt động liên kết cuối cùng có thành công hay không.
    - `gl.VALIDATE_STATUS`
      - : Trả về {{domxref("WebGL_API/Types", "GLboolean")}} cho biết
liệu hoạt động xác thực cuối cùng có thành công hay không.
    - `gl.ATTACHED_SHADERS`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết
số lượng shader đính kèm vào một chương trình.
    - `gl.ACTIVE_ATTRIBUTES`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết
số lượng các biến thuộc tính đang hoạt động của một chương trình.
    - `gl.ACTIVE_UNIFORMS`
      - : Trả về {{domxref("WebGL_API/Types", "GLint")}} cho biết
số lượng các biến thống nhất hoạt động cho một chương trình.

Khi sử dụng {{domxref("WebGL2RenderingContext", "WebGL 2 context", "", 1)}}, các giá trị sau đây có sẵn bổ sung:
    - `gl.TRANSFORM_FEEDBACK_BUFFER_MODE`
      - : Trả về một
{{domxref("WebGL_API/Types", "GLenum")}} cho biết chế độ đệm khi phản hồi biến đổi được kích hoạt. Có thể là `gl.SEPARATE_ATTRIBS` hoặc `gl.INTERLEAVED_ATTRIBS`.
    - `gl.TRANSFORM_FEEDBACK_VARYINGS`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
cho biết số lượng các biến khác nhau cần nắm bắt trong chế độ phản hồi chuyển đổi.
    - `gl.ACTIVE_UNIFORM_BLOCKS`
      - : Trả về một {{domxref("WebGL_API/Types", "GLint")}}
cho biết số khối thống nhất chứa đồng phục hoạt động.

### Giá trị trả về

Trả về thông tin chương trình được yêu cầu (như được chỉ định với `pname`).

## Ví dụ

```js
gl.getProgramParameter(program, gl.DELETE_STATUS);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getShaderParameter()")}}
