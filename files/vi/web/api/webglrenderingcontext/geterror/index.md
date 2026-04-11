---
title: "WebGLRenderingContext: getError() method"
short-title: getError()
slug: Web/API/WebGLRenderingContext/getError
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getError
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.getError()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) trả về thông tin lỗi.

## Cú pháp

```js-nolint
getError()
```

### Thông số

Không có.

### Giá trị trả về

<table class="no-markdown"> <thead> <tr> <th scope="col">Không đổi</th> <th scope="col">Mô tả</th> </tr> </thead> <tbody> <tr> <td><code>gl.NO_ERROR</code></td> <td>Không có lỗi nào được ghi lại. Giá trị của hằng số này là 0.</td> </tr> <tr> <td><code>gl.INVALID_ENUM</code></td> <td> Một giá trị không được chấp nhận đã được chỉ định cho một đối số liệt kê. Lệnh bị bỏ qua và cờ lỗi được đặt. </td> </tr> <tr> <td><code>gl.INVALID_VALUE</code></td> <td> Một đối số bằng số nằm ngoài phạm vi. Lệnh bị bỏ qua và cờ lỗi được đặt. </td> </tr> <tr> <td><code>gl.INVALID_OPERATION</code></td> <td> Lệnh được chỉ định không được phép cho trạng thái hiện tại. Lệnh bị bỏ qua và cờ lỗi được đặt. </td> </tr> <tr> <td><code>gl.INVALID_FRAMEBUFFER_OPERATION</code></td> <td> Bộ đệm khung hiện đang bị ràng buộc không phải là bộ đệm khung hoàn chỉnh khi cố gắng hiển thị hoặc đọc từ nó. </td> </tr> <tr> <td><code>gl.OUT_OF_MEMORY</code></td> <td>Không còn đủ bộ nhớ để thực thi lệnh.</td> </tr> <tr> <td><code>gl.CONTEXT_LOST_WEBGL</code></td> <td> Nếu ngữ cảnh WebGL bị mất, lỗi này sẽ được trả về trong lần gọi đầu tiên tới <code>getError</code>. Sau đó và cho đến khi context đư��c khôi phục, nó trả về <code>gl.NO_ERROR</code>. </td> </tr> </tbody> </table>

## Ví dụ

```js
gl.getError(); // gl.NO_ERROR (0)

gl.enable(gl.FOOBAR);
gl.getError(); // gl.INVALID_ENUM;
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext")}}
- {{domxref("WebGLContextEvent")}}
