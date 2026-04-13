---
title: "PushSubscriptionOptions: thuộc tính userVisibleOnly"
short-title: userVisibleOnly
slug: Web/API/PushSubscriptionOptions/userVisibleOnly
page-type: web-api-instance-property
browser-compat: api.PushSubscriptionOptions.userVisibleOnly
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`userVisibleOnly`** của giao diện {{domxref("PushSubscriptionOptions")}} chỉ ra liệu đăng ký push được trả về có chỉ được sử dụng cho các thông báo có hiệu quả hiển thị với người dùng hay không.

## Giá trị

Một giá trị boolean chỉ ra liệu đăng ký push được trả về có chỉ được sử dụng cho các thông báo có hiệu quả hiển thị với người dùng hay không.

## Ví dụ

Trong ví dụ dưới đây, giá trị của `userVisibleOnly` được in ra console.

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.getSubscription().then((subscription) => {
    const options = subscription.options;
    console.log(options.userVisibleOnly); // true nếu đây là đăng ký hiển thị với người dùng
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
