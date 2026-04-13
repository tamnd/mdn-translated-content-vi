---
title: "EXT_disjoint_timer_query: getQueryEXT() method"
short-title: getQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/getQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.getQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.getQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin về một target truy vấn.

## Cú pháp

```js-nolint
getQueryEXT(target, pname)
```

### Tham số

- `target`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định target của truy vấn thời gian. Phải là `ext.TIMESTAMP_EXT` hoặc `ext.TIME_ELAPSED_EXT`.
- `pname`
  - : Một {{domxref("WebGL_API/Types", "GLenum")}} chỉ định thông tin cần trả về. Phải là `ext.CURRENT_QUERY_EXT` hoặc `ext.QUERY_COUNTER_BITS_EXT`.

### Giá trị trả về

Phụ thuộc vào `pname`:

- Nếu `pname` là `ext.CURRENT_QUERY_EXT`: Một đối tượng {{domxref("WebGLQuery")}}, là truy vấn đang hoạt động hiện tại cho target đã cho.
- Nếu `pname` là `ext.QUERY_COUNTER_BITS_EXT`: Một {{domxref("WebGL_API/Types", "GLint")}} cho biết số bit được sử dụng để lưu kết quả truy vấn cho target đã cho.

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const startQuery = ext.createQueryEXT();
ext.queryCounterEXT(startQuery, ext.TIMESTAMP_EXT);

const currentQuery = ext.getQueryEXT(ext.TIMESTAMP_EXT, ext.CURRENT_QUERY_EXT);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
