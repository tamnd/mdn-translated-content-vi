---
title: "EXT_disjoint_timer_query: beginQueryEXT() method"
short-title: beginQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/beginQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.beginQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.beginQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) bắt đầu một truy vấn thời gian.

## Cú pháp

```js-nolint
beginQueryEXT(target, query)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn thời gian. Phải là `ext.TIME_ELAPSED_EXT`.
- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để bắt đầu truy vấn thời gian.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryEXT();
ext.beginQueryEXT(ext.TIME_ELAPSED_EXT, query);

// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
