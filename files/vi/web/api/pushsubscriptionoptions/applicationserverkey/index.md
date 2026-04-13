---
title: "PushSubscriptionOptions: thuộc tính applicationServerKey"
short-title: applicationServerKey
slug: Web/API/PushSubscriptionOptions/applicationServerKey
page-type: web-api-instance-property
browser-compat: api.PushSubscriptionOptions.applicationServerKey
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`applicationServerKey`** của giao diện {{domxref("PushSubscriptionOptions")}} chứa khóa công khai được sử dụng bởi máy chủ push.

## Giá trị

Một khóa công khai mà máy chủ push của bạn sử dụng để gửi tin nhắn đến các ứng dụng khách thông qua máy chủ push. Giá trị này là một phần của cặp khóa ký được tạo bởi máy chủ ứng dụng của bạn, và có thể sử dụng với chữ ký số đường cong elliptic (ECDSA), trên đường cong P-256. Nếu không có thành viên `applicationServerKey` nào được truyền khi khởi tạo, nó sẽ được đặt thành `null`.

## Ví dụ

Trong ví dụ dưới đây, giá trị của `applicationServerKey` được in ra console.

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.getSubscription().then((subscription) => {
    const options = subscription.options;
    console.log(options.applicationServerKey); // khóa công khai
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
