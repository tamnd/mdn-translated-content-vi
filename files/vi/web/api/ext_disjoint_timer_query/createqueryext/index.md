---
title: "EXT_disjoint_timer_query: createQueryEXT() method"
short-title: createQueryEXT()
slug: Web/API/EXT_disjoint_timer_query/createQueryEXT
page-type: webgl-extension-method
browser-compat: api.EXT_disjoint_timer_query.createQueryEXT
---

{{APIRef("WebGL")}}

Phương thức **`EXT_disjoint_timer_query.createQueryEXT()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) tạo và khởi tạo các đối tượng {{domxref("WebGLQuery")}}, dùng để theo dõi thời gian cần thiết để hoàn thành toàn bộ một tập lệnh GL.

## Cú pháp

```js-nolint
createQueryEXT()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{domxref("WebGLQuery")}}.

## Ví dụ

```js
const ext = gl.getExtension("EXT_disjoint_timer_query");
const query = ext.createQueryExt();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getExtension()")}}
- {{domxref("WebGLQuery")}}
- {{domxref("EXT_disjoint_timer_query")}}
