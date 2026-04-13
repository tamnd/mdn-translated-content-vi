---
title: TaskPriorityChangeEvent
slug: Web/API/TaskPriorityChangeEvent
page-type: web-api-interface
browser-compat: api.TaskPriorityChangeEvent
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

**`TaskPriorityChangeEvent`** là giao diện cho sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event).

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("TaskPriorityChangeEvent.TaskPriorityChangeEvent", "TaskPriorityChangeEvent()")}}
  - : Tạo một đối tượng `TaskPriorityChangeEvent` mới, đặt tên sự kiện và mức ưu tiên trước đó.

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của phần tử cha, {{domxref("Event")}}._

- {{domxref("TaskPriorityChangeEvent.previousPriority")}} {{ReadOnlyInline}}
  - : Trả về [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của {{domxref("TaskSignal")}} tương ứng _trước khi_ sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event) này xảy ra.

## Phương thức phiên bản

_Giao diện này không có phương thức riêng mà kế thừa các phương thức của phần tử cha, {{domxref("Event")}}._

## Ví dụ

Một đối tượng kiểu này được trả về trong trình xử lý sự kiện `prioritychange`. Đoạn mã dưới đây hiển thị trình xử lý ghi lại `newPriority` và `previousPriority`.

```js
// Lắng nghe sự kiện 'prioritychange' trên tín hiệu của bộ điều khiển.
controller.signal.addEventListener("prioritychange", (event) => {
  const previousPriority = event.previousPriority;
  const newPriority = event.target.priority;
  console.log(`Priority changed from ${previousPriority} to ${newPriority}.`);
});
```

Ví dụ trực tiếp đầy đủ hơn có thể tìm thấy tại [`prioritychange` event > Ví dụ](/en-US/docs/Web/API/TaskSignal/prioritychange_event).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event)
