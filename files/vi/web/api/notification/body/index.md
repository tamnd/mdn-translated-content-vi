---
title: "Notification: thuộc tính body"
short-title: body
slug: Web/API/Notification/body
page-type: web-api-instance-property
browser-compat: api.Notification.body
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`body`** của giao diện {{domxref("Notification")}} cho biết chuỗi nội dung của thông báo, như được chỉ định trong tùy chọn `body` của constructor {{domxref("Notification.Notification","Notification()")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```js
function spawnNotification(theBody, theIcon, theTitle) {
  const options = {
    body: theBody,
    icon: theIcon,
  };
  const n = new Notification(theTitle, options);

  console.log(n.body);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
