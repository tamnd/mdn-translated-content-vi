---
title: "EXT_disjoint_timer_query: isQueryEXT() method"
short-title: isQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/isQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.isQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.isQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền vào là một đối tượng {{domxref("WebGLQuery")}}.

## Cú pháp

```js-nolint
isQueryEXT(query)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là đối tượng {{domxref("WebGLQuery")}} (`true`) hay không (`false`).

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryEXT();

// …

ext.isQueryEXT(query);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
