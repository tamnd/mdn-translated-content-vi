---
title: "Notification: thuộc tính timestamp"
short-title: timestamp
slug: Web/API/Notification/timestamp
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Notification.timestamp
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`timestamp`** của giao diện {{domxref("Notification")}} trả về một số, như được chỉ định trong tùy chọn `timestamp` của constructor {{domxref("Notification.Notification","Notification()")}}.

Dấu thời gian của thông báo có thể biểu thị thời điểm, tính bằng mili giây kể từ 00:00:00 UTC ngày 1 tháng 1 năm 1970, của sự kiện mà thông báo được tạo ra, hoặc có thể là một dấu thời gian tùy ý mà bạn muốn gắn với thông báo. Ví dụ, dấu thời gian của một cuộc họp sắp tới có thể được đặt trong tương lai, trong khi dấu thời gian của một tin nhắn bị lỡ có thể được đặt trong quá khứ.

## Giá trị

Một số đại diện cho dấu thời gian, được cho dưới dạng {{Glossary("Unix time")}} tính bằng mili giây.

## Ví dụ

Đoạn mã sau phát một thông báo; một object `options` đơn giản được tạo rồi thông báo được phát bằng constructor `Notification()`.

```js
const dts = Math.floor(Date.now());

const options = {
  body: "Your code submission has received 3 new review comments.",
  timestamp: dts,
};

const n = new Notification("New review activity", options);

console.log(n.timestamp); // Ghi lại dấu thời gian
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
