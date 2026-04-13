---
title: "Notification: thuộc tính tĩnh maxActions"
short-title: maxActions
slug: Web/API/Notification/maxActions_static
page-type: web-api-static-property
status:
  - experimental
browser-compat: api.Notification.maxActions_static
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}} {{AvailableInWorkers}}{{SeeCompatTable}}

Thuộc tính tĩnh chỉ đọc **`maxActions`** của giao diện {{domxref("Notification")}} trả về số lượng hành động tối đa được thiết bị và User Agent hỗ trợ. Về mặt thực tế, đây là số phần tử tối đa trong mảng {{domxref("Notification.actions")}} mà User Agent sẽ tôn trọng.

## Giá trị

Một số nguyên cho biết số lượng hành động thông báo lớn nhất mà User Agent và thiết bị có thể trình bày cho người dùng.

## Ví dụ

Đoạn mã sau ghi lại số lượng hành động được hỗ trợ tối đa.

```js
const maxActions = Notification.maxActions;
console.log(
  `Thiết bị này có thể hiển thị tối đa ${maxActions} hành động trên mỗi thông báo.`,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
- {{domxref("Notification.actions")}}
