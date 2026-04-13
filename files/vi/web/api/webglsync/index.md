---
title: WebGLSync
slug: Web/API/WebGLSync
page-type: web-api-interface
browser-compat: api.WebGLSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Giao diện **`WebGLSync`** là một phần của API [WebGL 2](/vi/docs/Web/API/WebGL_API) và được sử dụng để đồng bộ hóa các hoạt động giữa GPU và ứng dụng.

{{InheritanceDiagram}}

Khi làm việc với các đối tượng `WebGLSync`, các phương thức sau của {{domxref("WebGL2RenderingContext")}} hữu ích:

- {{domxref("WebGL2RenderingContext.fenceSync()")}}
- {{domxref("WebGL2RenderingContext.deleteSync()")}}
- {{domxref("WebGL2RenderingContext.isSync()")}}
- {{domxref("WebGL2RenderingContext.clientWaitSync()")}}
- {{domxref("WebGL2RenderingContext.waitSync()")}}
- {{domxref("WebGL2RenderingContext.getSyncParameter()")}}

## Ví dụ

### Tạo đối tượng `WebGLSync`

Trong ví dụ này, `gl` phải là một {{domxref("WebGL2RenderingContext")}}. Các đối tượng `WebGLSync` không khả dụng trong WebGL 1.

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.finish()")}}
