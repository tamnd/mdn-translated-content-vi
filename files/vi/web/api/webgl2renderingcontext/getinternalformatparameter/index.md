---
title: "WebGL2RenderingContext: phương thức getInternalformatParameter()"
short-title: getInternalformatParameter()
slug: Web/API/WebGL2RenderingContext/getInternalformatParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getInternalformatParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getInternalformatParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về hỗ trợ phụ thuộc vào triển khai cho các định dạng nội bộ.

## Cú pháp

```js-nolint
getInternalformatParameter(target, internalformat, pname)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định đối tượng renderbuffer target. Các giá trị có thể:
    - `gl.RENDERBUFFER`
      - : Lưu trữ dữ liệu bộ đệm cho hình ảnh đơn lẻ ở định dạng nội bộ có thể kết xuất.

- `internalformat`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định định dạng nội bộ cần truy xuất thông tin (phải là định dạng có thể kết xuất màu, depth hoặc stencil).
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định loại thông tin cần truy vấn. Các giá trị có thể:
    - `gl.SAMPLES`
      - : Trả về một {{jsxref("Int32Array")}} chứa số lượng mẫu được hỗ trợ cho `internalformat` theo thứ tự giảm dần.

### Giá trị trả về

Phụ thuộc vào thông tin được yêu cầu (được chỉ định bằng `pname`). Là một {{jsxref("Int32Array")}} nếu `pname` là `gl.SAMPLES`.

## Ví dụ

```js
const samples = gl.getInternalformatParameter(
  gl.RENDERBUFFER,
  gl.RGBA8,
  gl.SAMPLES,
);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getRenderbufferParameter()")}}