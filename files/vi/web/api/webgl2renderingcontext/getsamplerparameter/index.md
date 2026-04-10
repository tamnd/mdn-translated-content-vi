---
title: "WebGL2RenderingContext: phương thức getSamplerParameter()"
short-title: getSamplerParameter()
slug: Web/API/WebGL2RenderingContext/getSamplerParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.getSamplerParameter
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.getSamplerParameter()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về thông tin tham số của một đối tượng {{domxref("WebGLSampler")}}.

## Cú pháp

```js-nolint
getSamplerParameter(sampler, pname)
```

### Tham số

- `sampler`
  - : Một đối tượng {{domxref("WebGLSampler")}}.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin nào sẽ trả về. Các giá trị có thể:
    - `gl.TEXTURE_COMPARE_FUNC`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết hàm so sánh texture.
    - `gl.TEXTURE_COMPARE_MODE`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết chế độ so sánh texture.
    - `gl.TEXTURE_MAG_FILTER`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết bộ lọc phóng đại texture.
    - `gl.TEXTURE_MAX_LOD`: Trả về một {{domxref("WebGL_API/Types", "GLfloat")}} cho biết giá trị mức chi tiết tối đa.
    - `gl.TEXTURE_MIN_FILTER`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết bộ lọc thu nhỏ texture.
    - `gl.TEXTURE_MIN_LOD`: Trả về một {{domxref("WebGL_API/Types", "GLfloat")}} cho biết giá trị mức chi tiết tối thiểu.
    - `gl.TEXTURE_WRAP_R`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết hàm bao quanh texture cho tọa độ texture r.
    - `gl.TEXTURE_WRAP_S`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết hàm bao quanh texture cho tọa độ texture s.
    - `gl.TEXTURE_WRAP_T`: Trả về một {{domxref("WebGL_API/Types", "GLenum")}} cho biết hàm bao quanh texture cho tọa độ texture t.

### Giá trị trả về

Phụ thuộc vào tham số `pname`, là một {{domxref("WebGL_API/Types", "GLenum")}} hoặc một {{domxref("WebGL_API/Types", "GLfloat")}}.

## Ví dụ

```js
const sampler = gl.createSampler();
gl.getSamplerParameter(sampler, gl.TEXTURE_COMPARE_FUNC);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}