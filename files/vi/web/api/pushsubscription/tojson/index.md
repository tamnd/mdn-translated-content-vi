---
title: "PushSubscription: toJSON() method"
short-title: toJSON()
slug: Web/API/PushSubscription/toJSON
page-type: web-api-instance-method
browser-compat: api.PushSubscription.toJSON
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Phương thức `toJSON()` của giao diện {{domxref("PushSubscription")}} là một
bộ tuần tự hóa chuẩn: nó trả về biểu diễn JSON của các thuộc tính đăng ký,
cung cấp một lối tắt hữu ích.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng JSON. Đối tượng này chứa điểm cuối của đăng ký, `expirationTime` và các khóa công khai, dưới dạng một thành viên `endpoint`, một thành viên `expirationTime` và một thành viên `keys`.

## Ví dụ

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.getSubscription().then((subscription) => {
    const mySubscription = subscription.toJSON();
    // thực hiện một việc gì đó với chi tiết đăng ký
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
