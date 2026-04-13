---
title: "WebGL2RenderingContext: phương thức isQuery()"
short-title: isQuery()
slug: Web/API/WebGL2RenderingContext/isQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.isQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.isQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền là một đối tượng {{domxref("WebGLQuery")}} hợp lệ.

## Cú pháp

```js-nolint
isQuery(query)
```

### Tham số

- `query`
  - : Một đối tượng {{domxref("WebGLQuery")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là một đối tượng {{domxref("WebGLQuery")}} hợp lệ (`true`) hay không (`false`).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLQuery` không có sẵn trong WebGL 1.

```js
const query = gl.createQuery();

// …

gl.isQuery(query);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}