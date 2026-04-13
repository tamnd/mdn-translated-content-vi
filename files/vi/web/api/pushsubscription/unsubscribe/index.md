---
title: "PushSubscription: unsubscribe() method"
short-title: unsubscribe()
slug: Web/API/PushSubscription/unsubscribe
page-type: web-api-instance-method
browser-compat: api.PushSubscription.unsubscribe
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức `unsubscribe()` của giao diện {{domxref("PushSubscription")}}
trả về một {{jsxref("Promise")}} sẽ phân giải thành một giá trị boolean khi
đăng ký hiện tại được hủy đăng ký thành công.

## Cú pháp

```js-nolint
unsubscribe()
```

### Tham số

Không có.

### Giá trị trả về

Một {{jsxref("Promise")}} sẽ phân giải thành một giá trị boolean khi đăng ký
hiện tại được hủy đăng ký thành công.

## Ví dụ

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.getSubscription().then((subscription) => {
    subscription
      .unsubscribe()
      .then((successful) => {
        // Bạn đã hủy đăng ký thành công
      })
      .catch((e) => {
        // Hủy đăng ký thất bại
      });
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PushManager.getSubscription")}}
