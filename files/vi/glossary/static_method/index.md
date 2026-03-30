---
title: Phương thức tĩnh
slug: Glossary/Static_method
page-type: glossary-definition
sidebar: glossarysidebar
---

Một phương thức tĩnh (hay _hàm tĩnh_) là {{Glossary("method","phương thức")}} được định nghĩa như một thành viên của {{Glossary("object","đối tượng")}} nhưng có thể truy cập trực tiếp từ hàm tạo của đối tượng API, thay vì từ một thể hiện đối tượng được tạo qua hàm tạo.

Trong một [Web API](/en-US/docs/Web/API), phương thức tĩnh là phương thức được định nghĩa bởi một giao diện nhưng có thể được gọi mà không cần khởi tạo đối tượng thuộc kiểu đó trước.

Các phương thức được gọi trên các thể hiện đối tượng được gọi là _phương thức thể hiện_.

## Ví dụ

Trong [Notifications API](/en-US/docs/Web/API/Notifications_API), phương thức {{domxref("Notification/requestPermission_static", "Notification.requestPermission()")}} được gọi trên chính hàm tạo {{domxref("Notification")}} — đây là phương thức tĩnh:

```js
let promise = Notification.requestPermission();
```

Ngược lại, phương thức {{domxref("Notification.close()")}} là phương thức thể hiện — nó được gọi trên một thể hiện thông báo cụ thể để đóng thông báo hệ thống mà nó đại diện:

```js
let myNotification = new Notification("Đây là thông báo của tôi");

myNotification.close();
```

## Xem thêm

- [static](/en-US/docs/Web/JavaScript/Reference/Classes/static)
- Các thuật ngữ liên quan:
  - {{Glossary("Object")}}
  - {{Glossary("Method")}}
