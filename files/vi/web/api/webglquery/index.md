---
title: WebGLQuery
slug: Web/API/WebGLQuery
page-type: web-api-interface
browser-compat: api.WebGLQuery
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLQuery`** là một phần của API [WebGL 2](/vi/docs/Web/API/WebGL_API) và cung cấp các cách để truy vấn thông tin một cách bất đồng bộ. Mặc định, các truy vấn occlusion và truy vấn primitive đều khả dụng.

Một loại truy vấn khác là disjoint timer queries, cho phép bạn đo hiệu suất và lập hồ sơ GPU. Disjoint timer queries chỉ khả dụng với phần mở rộng {{domxref("EXT_disjoint_timer_query")}}.

{{InheritanceDiagram}}

Khi làm việc với các đối tượng `WebGLQuery`, các phương thức sau của {{domxref("WebGL2RenderingContext")}} hữu ích:

- {{domxref("WebGL2RenderingContext.createQuery()")}}
- {{domxref("WebGL2RenderingContext.deleteQuery()")}}
- {{domxref("WebGL2RenderingContext.isQuery()")}}
- {{domxref("WebGL2RenderingContext.beginQuery()")}}
- {{domxref("WebGL2RenderingContext.endQuery()")}}
- {{domxref("WebGL2RenderingContext.getQuery()")}}
- {{domxref("WebGL2RenderingContext.getQueryParameter()")}}

## Ví dụ

### Tạo đối tượng `WebGLQuery`

Trong ví dụ này, `gl` phải là một {{domxref("WebGL2RenderingContext")}}. Các đối tượng `WebGLQuery` không khả dụng trong WebGL 1.

```js
const query = gl.createQuery();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("EXT_disjoint_timer_query")}}
