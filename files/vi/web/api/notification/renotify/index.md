---
title: "Notification: thuộc tính renotify"
short-title: renotify
slug: Web/API/Notification/renotify
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Notification.renotify
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`renotify`** của giao diện {{domxref("Notification")}} chỉ định xem người dùng có nên được thông báo lại sau khi một thông báo mới thay thế một thông báo cũ hay không, như được chỉ định trong tùy chọn `renotify` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một giá trị boolean. `false` là mặc định; `true` sẽ khiến thông báo thông báo lại cho người dùng.

## Ví dụ

Đoạn mã sau nhằm phát một thông báo sẽ thông báo lại cho người dùng sau khi nó bị thay thế; một object `options` đơn giản được tạo rồi thông báo được phát bằng constructor `Notification()`.

```js
const options = {
  body: "Your code submission has received 3 new review comments.",
  renotify: true,
};

const n = new Notification("New review activity", options);

console.log(n.renotify); // true
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
