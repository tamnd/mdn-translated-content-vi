---
title: "EXT_disjoint_timer_query: deleteQueryEXT() method"
short-title: deleteQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/deleteQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.deleteQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.deleteQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLQuery")}} đã cho.

## Cú pháp

```js-nolint
deleteQueryEXT(query)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} cần xóa.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryEXT();

// …

ext.deleteQueryEXT(query);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
