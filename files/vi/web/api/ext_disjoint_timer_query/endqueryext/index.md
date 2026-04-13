---
title: "EXT_disjoint_timer_query: endQueryEXT() method"
short-title: endQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/endQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.endQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.endQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) kết thúc một truy vấn thời gian.

## Cú pháp

```js-nolint
endQueryEXT(target)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn thời gian. Phải là `ext.TIME_ELAPSED_EXT`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryEXT();
ext.beginQueryEXT(ext.TIME_ELAPSED_EXT, query);

// …

ext.endQueryEXT(ext.TIME_ELAPSED_EXT);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
