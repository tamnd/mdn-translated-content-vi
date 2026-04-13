---
title: "EXT_disjoint_timer_query: queryCounterEXT() method"
short-title: queryCounterEXT()
slug: Web/API/EXT_disjoint_timer_query/queryCounterEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.queryCounterEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.queryCounterEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) ghi lại thời gian hiện tại vào đối tượng truy vấn tương ứng.

## Cú pháp

```js-nolint
queryCounterEXT(query, target)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để ghi lại thời gian hiện tại.
- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn thời gian. Phải là `ext.TIMESTAMP_EXT`.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const startQuery = ext.createQueryEXT();
const endQuery = ext.createQueryEXT();
ext.queryCounterEXT(startQuery, ext.TIMESTAMP_EXT);

// …

ext.queryCounterEXT(endQuery, ext.TIMESTAMP_EXT);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
