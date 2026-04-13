---
title: "XRHitTestSource: phương thức cancel()"
short-title: cancel()
slug: Web/API/XRHitTestSource/cancel
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRHitTestSource.cancel
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`cancel()`** của giao diện {{domxref("XRHitTestSource")}} hủy đăng ký kiểm tra va chạm.

## Cú pháp

```js-nolint
cancel()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Hủy đăng ký kiểm tra va chạm

Phương thức `cancel()` hủy đăng ký khỏi một nguồn kiểm tra va chạm. Vì đối tượng {{domxref("XRHitTestSource")}} sẽ không còn dùng được nữa, bạn có thể dọn dẹp và đặt nó thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

```js
hitTestSource.cancel();
hitTestSource = null;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
