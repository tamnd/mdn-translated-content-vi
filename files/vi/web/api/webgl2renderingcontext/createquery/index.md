---
title: "WebGL2RenderingContext: phương thức createQuery()"
short-title: createQuery()
slug: Web/API/WebGL2RenderingContext/createQuery
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.createQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.createQuery()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo các đối tượng {{domxref("WebGLQuery")}}, cung cấp các cách truy vấn thông tin không đồng bộ.

## Cú pháp

```js-nolint
createQuery()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLQuery")}}.

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}.
Đối tượng `WebGLQuery` không có sẵn trong WebGL 1.

```js
const query = gl.createQuery();
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLQuery")}}