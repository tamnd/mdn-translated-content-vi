---
title: "EXT_disjoint_timer_query: getQueryObjectEXT() method"
short-title: getQueryObjectEXT()
slug: Web/API/EXT_disjoint_timer_query/getQueryObjectEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.getQueryObjectEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.getQueryObjectEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về trạng thái của một đối tượng truy vấn.

## Cú pháp

```js-nolint
getQueryObjectEXT(query, pname)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để trả về thông tin.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần trả về. Phải là `ext.QUERY_RESULT_EXT` hoặc `ext.QUERY_RESULT_AVAILABLE_EXT`.

### Giá trị trả về

Phụ thuộc vào `pname`:

- Nếu `pname` là `ext.QUERY_RESULT_EXT`: Một {{domxref("WebGL_API/Types", "GLuint64EXT")}} chứa kết quả truy vấn.
- Nếu `pname` là `ext.QUERY_RESULT_AVAILABLE_EXT`: Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết kết quả truy vấn có sẵn hay không.

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryEXT();
ext.beginQueryEXT(ext.TIME_ELAPSED_EXT, query);

// Draw
ext.endQueryEXT(ext.TIME_ELAPSED_EXT);

// At some point in the future, after returning control to the browser
const available = ext.getQueryObjectEXT(query, ext.QUERY_RESULT_AVAILABLE_EXT);
const disjoint = gl.getParameter(ext.GPU_DISJOINT_EXT);

if (available && !disjoint) {
  // See how much time the rendering of the object took in nanoseconds.
  const timeElapsed = ext.getQueryObjectEXT(query, ext.QUERY_RESULT_EXT);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
