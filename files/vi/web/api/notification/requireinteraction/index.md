---
title: "Notification: thuộc tính requireInteraction"
short-title: requireInteraction
slug: Web/API/Notification/requireInteraction
page-type: web-api-instance-property
browser-compat: api.Notification.requireInteraction
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`requireInteraction`** của giao diện {{domxref("Notification")}} trả về giá trị boolean cho biết thông báo phải còn hoạt động cho đến khi người dùng bấm hoặc đóng nó, thay vì tự động biến mất.

> [!NOTE]
> Thuộc tính này có thể được đặt ngay khi tạo thông báo bằng cách đặt tùy chọn `requireInteraction` thành `true` trong object tùy chọn của constructor {{domxref("Notification.Notification", "Notification()")}}.

## Giá trị

Một giá trị boolean.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
