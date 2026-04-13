---
title: "XRTransientInputHitTestSource: phương thức cancel()"
short-title: cancel()
slug: Web/API/XRTransientInputHitTestSource/cancel
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.XRTransientInputHitTestSource.cancel
---

{{APIRef("WebXR Device API")}}{{SeeCompatTable}}{{SecureContext_Header}}

Phương thức **`cancel()`** của giao diện {{domxref("XRTransientInputHitTestSource")}} hủy đăng ký kiểm tra va chạm đầu vào thoáng qua.

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

Phương thức `cancel()` hủy đăng ký khỏi một nguồn kiểm tra va chạm đầu vào thoáng qua. Vì đối tượng {{domxref("XRTransientInputHitTestSource")}} sẽ không còn dùng được nữa, bạn có thể dọn dẹp và đặt nó thành [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null).

```js
transientHitTestSource.cancel();
transientHitTestSource = null;
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
