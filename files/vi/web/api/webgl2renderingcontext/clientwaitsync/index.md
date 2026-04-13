---
title: "WebGL2RenderingContext: phương thức clientWaitSync()"
short-title: clientWaitSync()
slug: Web/API/WebGL2RenderingContext/clientWaitSync
page-type: web-api-instance-method
browser-compat: api.WebGL2RenderingContext.clientWaitSync
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGL2RenderingContext.clientWaitSync()`** của [WebGL 2 API](/en-US/docs/Web/API/WebGL_API) chặn và chờ một đối tượng {{domxref("WebGLSync")}} trở thành signaled hoặc một thời gian chờ đã cho trôi qua.

## Cú pháp

```js-nolint
clientWaitSync(sync, flags, timeout)
```

### Tham số

- `sync`
  - : Một đối tượng {{domxref("WebGLSync")}} để chờ.
- `flags`
  - : Một {{domxref("WebGL_API/Types", "GLbitfield")}} chỉ định tổ hợp bitwise của các cờ điều khiển hành vi flush. Có thể là `gl.SYNC_FLUSH_COMMANDS_BIT`.
- `timeout`
  - : Một {{domxref("WebGL_API/Types", "GLint64")}} chỉ định thời gian chờ (tính bằng nano giây) để chờ đối tượng đồng bộ trở thành signaled. Không được lớn hơn `gl.MAX_CLIENT_WAIT_TIMEOUT_WEBGL`.

### Giá trị trả về

Một {{domxref("WebGL_API/Types", "GLenum")}} cho biết trạng thái của đối tượng đồng bộ.

- `gl.ALREADY_SIGNALED`: Cho biết đối tượng đồng bộ đã được signaled khi phương thức này được gọi.
- `gl.TIMEOUT_EXPIRED`: Cho biết thời gian `timeout` đã trôi qua và đối tượng đồng bộ không trở thành signaled.
- `gl.CONDITION_SATISFIED`: Cho biết đối tượng đồng bộ đã được signaled trước khi `timeout` hết hạn.
- `gl.WAIT_FAILED`: Cho biết một lỗi đã xảy ra trong quá trình thực thi.

## Ví dụ

```js
const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
const status = gl.clientWaitSync(sync, 0, 0);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLSync")}}