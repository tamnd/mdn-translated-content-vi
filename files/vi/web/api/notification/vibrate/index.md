---
title: "Notification: thuộc tính vibrate"
short-title: vibrate
slug: Web/API/Notification/vibrate
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Notification.vibrate
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`vibrate`** của giao diện {{domxref("Notification")}} chỉ định một [mẫu rung](/en-US/docs/Web/API/Vibration_API#vibration_patterns) cho phần cứng rung của thiết bị sẽ phát khi thông báo được kích hoạt. Điều này được chỉ định trong tùy chọn `vibrate` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một [mẫu rung](/en-US/docs/Web/API/Vibration_API#vibration_patterns), như được chỉ định trong [đặc tả Vibration API](https://w3c.github.io/vibration/).

## Ví dụ

Đoạn mã sau nhằm tạo một thông báo cũng kích hoạt rung trên thiết bị; một object `options` đơn giản được tạo, rồi thông báo được phát bằng constructor `Notification()`.

```js
const options = {
  body: "Your code submission has received 3 new review comments.",
  vibrate: [200, 100, 200],
};

const n = new Notification("New review activity", options);

console.log(n.vibrate); // [200, 100, 200]
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
