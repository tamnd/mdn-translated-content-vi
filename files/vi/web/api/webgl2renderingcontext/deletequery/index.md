---
title: "WebGL2RenderingContext: phương thức deleteQuery()"
short-title: deleteQuery()
slug: Web/API/WebGL2RenderingContext/deleteQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.deleteQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.deleteQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLQuery")}} đã cho.

## Cú pháp

```js-nolint
deleteQuery(query)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để xóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLQuery` không có sẵn trong WebGL 1.

```js
const query = gl.createQuery();

// …

gl.deleteQuery(query);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}