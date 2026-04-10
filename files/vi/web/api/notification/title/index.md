---
title: "Notification: thuộc tính title"
short-title: title
slug: Web/API/Notification/title
page-type: web-api-instance-property
browser-compat: api.Notification.title
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`title`** của giao diện {{domxref("Notification")}} cho biết tiêu đề của thông báo, như được chỉ định trong tham số `title` của constructor {{domxref("Notification.Notification","Notification()")}}.

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

  console.log(n.title);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
