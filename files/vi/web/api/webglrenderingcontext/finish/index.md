---
title: "WebGLRenderingContext: finish() method"
short-title: finish()
slug: Web/API/WebGLRenderingContext/finish
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.finish
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Phương thức **`WebGLRenderingContext.finish()`** của [WebGL API](/en-US/docs/Web/API/WebGL_API) chặn việc thực thi cho đến khi tất cả các lệnh được gọi trước đó kết thúc.

## Cú pháp

```js-nolint
finish()
```

### Thông số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.flush()")}}
- [WebGL các phương pháp hay nhất](/en-US/docs/Web/API/WebGL_API/WebGL_best_practices) (khuyến cáo nên tránh `finish()` vì nó có thể làm chậm tốc độ
vòng kết xuất chính của bạn)
