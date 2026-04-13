---
title: PushSubscriptionOptions
slug: Web/API/PushSubscriptionOptions
page-type: web-api-interface
browser-compat: api.PushSubscriptionOptions
---

{{APIRef("Push API")}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện **`PushSubscriptionOptions`** của {{domxref('Push API','','',' ')}} đại diện cho các tùy chọn liên kết với một đăng ký push.

Đối tượng `PushSubscriptionOptions` chỉ đọc được trả về bằng cách gọi {{domxref("PushSubscription.options")}} trên một {{domxref("PushSubscription")}}. Giao diện này không có hàm khởi tạo riêng.

## Thuộc tính phiên bản

- {{domxref("PushSubscriptionOptions.userVisibleOnly")}} {{ReadOnlyInline}}
  - : Một giá trị boolean chỉ ra rằng đăng ký push được trả về sẽ chỉ được sử dụng cho các thông báo có hiệu quả hiển thị với người dùng.
- {{domxref("PushSubscriptionOptions.applicationServerKey")}} {{ReadOnlyInline}}
  - : Một khóa công khai mà máy chủ push của bạn sẽ sử dụng để gửi tin nhắn đến các ứng dụng khách thông qua máy chủ push.

## Ví dụ

Gọi {{domxref("PushSubscription.options")}} trên một {{domxref("PushSubscription")}} trả về một đối tượng `PushSubscriptionOptions`. Trong ví dụ dưới đây, đối tượng này được in ra console.

```js
navigator.serviceWorker.ready.then((reg) => {
  reg.pushManager.getSubscription().then((subscription) => {
    const options = subscription.options;
    console.log(options); // một đối tượng PushSubscriptionOptions
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
