---
title: "WebGL2RenderingContext: phương thức deleteSync()"
short-title: deleteSync()
slug: Web/API/WebGL2RenderingContext/deleteSync
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.deleteSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.deleteSync()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) xóa một đối tượng {{domxref("WebGLSync")}} đã cho.

## Cú pháp

```js-nolint
deleteSync(sync)
```

### Tham số

- `sync`
  - : Một đối tượng {{domxref("WebGLSync")}} để xóa.

### Giá trị trả về

None ({{jsxref("undefined")}}).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}. Đối tượng `WebGLSync` không có sẵn trong WebGL 1.

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);

// …

gl.deleteSync(sync);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}