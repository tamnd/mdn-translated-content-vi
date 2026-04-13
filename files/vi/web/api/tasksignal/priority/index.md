---
title: "TaskSignal: thuộc tính priority"
short-title: priority
slug: Web/API/TaskSignal/priority
page-type: web-api-instance-property
browser-compat: api.TaskSignal.priority
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`priority`** của giao diện {{domxref("TaskSignal")}} cho biết [ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của tín hiệu.

Giá trị ban đầu được đặt trong {{domxref("TaskController")}} liên quan bằng cách chỉ định nó như một đối số cho [hàm khởi tạo `TaskController`](/en-US/docs/Web/API/TaskController/TaskController) (mặc định là `"user-visible"`).
Ưu tiên của tín hiệu có thể được thay đổi bằng cách gọi {{domxref("TaskController.setPriority()")}} trên bộ điều khiển liên quan.

Đối với [các tác vụ có ưu tiên có thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority), giá trị này được sử dụng để đặt ưu tiên tác vụ ban đầu và sau đó để thay đổi nó.
Các tác vụ có ưu tiên không thể thay đổi sẽ bỏ qua giá trị này.

## Giá trị

Một chuỗi cho biết [ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của tín hiệu.
Sẽ là một trong: `"user-blocking"`, `"user-visible"`, `"background"`.

## Ví dụ

Thuộc tính `priority` thường được các nhà phát triển sử dụng để xác định ưu tiên mới sau các sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event).
Xem [TaskSignal: sự kiện prioritychange](/en-US/docs/Web/API/TaskSignal/prioritychange_event#examples) để biết ví dụ trực tiếp.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
