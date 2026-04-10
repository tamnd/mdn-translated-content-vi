---
title: "Notification: thuộc tính tag"
short-title: tag
slug: Web/API/Notification/tag
page-type: web-api-instance-property
browser-compat: api.Notification.tag
---

{{APIRef("Web Notifications")}}{{securecontext_header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`tag`** của giao diện {{domxref("Notification")}} biểu thị một thẻ nhận diện cho thông báo, như được chỉ định trong tùy chọn `tag` của constructor {{domxref("Notification.Notification","Notification()")}}.

Ý tưởng của thẻ thông báo là nhiều thông báo có thể dùng chung cùng một thẻ, liên kết chúng với nhau. Khi đó một thông báo có thể được thay thế bằng thông báo khác theo cách lập trình để tránh việc màn hình người dùng bị lấp đầy bởi quá nhiều thông báo giống nhau.

## Giá trị

Một chuỗi.

## Ví dụ

Bài viết [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API#replacing_existing_notifications) của chúng tôi có một ví dụ tốt về cách dùng thẻ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
