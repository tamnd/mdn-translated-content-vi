---
title: "WebGL2RenderingContext: phương thức isSync()"
short-title: isSync()
slug: Web/API/WebGL2RenderingContext/isSync
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.isSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.isSync()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) trả về `true` nếu đối tượng được truyền là một đối tượng {{domxref("WebGLSync")}} hợp lệ.

## Cú pháp

```js-nolint
isSync(sync)
```

### Tham số

- `sync`
  - : Một đối tượng {{domxref("WebGLSync")}} để kiểm tra.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLboolean")}} cho biết đối tượng đã cho có phải là một đối tượng {{domxref("WebGLSync")}} hợp lệ (`true`) hay không (`false`).

## Ví dụ

`gl` phải là một {{domxref("WebGL2RenderingContext")}}. Đối tượng `WebGLSync` không có sẵn trong WebGL 1.

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);

// …

gl.isSync(sync);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}