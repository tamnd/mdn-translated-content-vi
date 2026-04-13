---
title: "WebGL2RenderingContext: phương thức samplerParameter[if]()"
short-title: samplerParameter[if]()
slug: Web/API/WebGL2RenderingContext/samplerParameter
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.samplerParameteri
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Các phương thức **`WebGL2RenderingContext.samplerParameter[if]()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) đặt các tham số {{domxref("WebGLSampler")}}.

## Cú pháp

```js-nolint
samplerParameteri(sampler, pname, param)
samplerParameterf(sampler, pname, param)
```

### Tham số

- `sampler`
  - : Một đối tượng {{domxref("WebGLSampler")}}.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định tham số nào sẽ đặt. Các giá trị có thể:
    - `gl.TEXTURE_COMPARE_FUNC`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hàm so sánh texture.
    - `gl.TEXTURE_COMPARE_MODE`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định chế độ so sánh texture.
    - `gl.TEXTURE_MAG_FILTER`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định bộ lọc phóng đại texture.
    - `gl.TEXTURE_MAX_LOD`
      - : Một {{domxref("WebGL_API/Types", "GLfloat")}} chỉ định giá trị mức chi tiết tối đa.
    - `gl.TEXTURE_MIN_FILTER`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định bộ lọc thu nhỏ texture.
    - `gl.TEXTURE_MIN_LOD`
      - : Một {{domxref("WebGL_API/Types", "GLfloat")}} chỉ định giá trị mức chi tiết tối thiểu.
    - `gl.TEXTURE_WRAP_R`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hàm bao quanh texture cho tọa độ texture r.
    - `gl.TEXTURE_WRAP_S`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hàm bao quanh texture cho tọa độ texture s.
    - `gl.TEXTURE_WRAP_T`
      - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định hàm bao quanh texture cho tọa độ texture t.

- `param`
  - : Một {{domxref("WebGL_API/Types", "GLint")}} (`samplerParameteri`) hoặc một {{domxref("WebGL_API/Types", "GLfloat")}} (`samplerParameterf`) chỉ định giá trị cho `pname`.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

```js
const sampler = gl.createSampler();
gl.samplerParameteri(sampler, gl.TEXTURE_MAG_FILTER, gl.NEAREST);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSampler")}}