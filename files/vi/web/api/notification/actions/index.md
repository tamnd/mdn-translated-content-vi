---
title: "Notification: thuộc tính actions"
short-title: actions
slug: Web/API/Notification/actions
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Notification.actions
---

{{APIRef("Web Notifications")}}{{SecureContext_Header}}{{SeeCompatTable}} {{AvailableInWorkers}}

Thuộc tính chỉ đọc **`actions`** của giao diện {{domxref("Notification")}} cung cấp các hành động mà người dùng có thể chọn để tương tác với thông báo.

Các hành động này được đặt bằng tùy chọn `actions` của đối số thứ hai cho phương thức {{DOMxref("ServiceWorkerRegistration.showNotification", "showNotification()")}} và constructor {{DOMxref("Notification/Notification", "Notification()")}}.

> [!NOTE]
> Trình duyệt thường giới hạn số lượng hành động tối đa mà chúng sẽ hiển thị cho một thông báo cụ thể. Hãy kiểm tra thuộc tính tĩnh {{DOMxref("Notification.maxActions_static", "Notification.maxActions")}} để biết giới hạn.

## Giá trị

Một mảng chỉ đọc các hành động. Mỗi phần tử trong mảng là một object với các thành viên sau:

- `action`
  - : Một chuỗi xác định hành động của người dùng sẽ được hiển thị trên thông báo.
- `title`
  - : Một chuỗi chứa văn bản hành động sẽ được hiển thị cho người dùng.
- `icon`
  - : Một chuỗi chứa URL của biểu tượng sẽ được hiển thị cùng hành động.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Dùng Notifications API](/en-US/docs/Web/API/Notifications_API/Using_the_Notifications_API)
- {{DOMxref("Notification.maxActions_static", "Notification.maxActions")}}
