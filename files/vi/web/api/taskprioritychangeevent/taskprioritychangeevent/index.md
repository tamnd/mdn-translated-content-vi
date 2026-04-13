---
title: "TaskPriorityChangeEvent: TaskPriorityChangeEvent() constructor"
short-title: TaskPriorityChangeEvent()
slug: Web/API/TaskPriorityChangeEvent/TaskPriorityChangeEvent
page-type: web-api-constructor
browser-compat: api.TaskPriorityChangeEvent.TaskPriorityChangeEvent
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`TaskPriorityChangeEvent()`** tạo một đối tượng {{domxref("TaskPriorityChangeEvent")}} mới.

Đối tượng này được tạo với một giá trị cho biết [mức ưu tiên trước đó](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của tác vụ, tức là mức ưu tiên trước khi thay đổi và sự kiện này được kích hoạt.

## Cú pháp

```js-nolint
new TaskPriorityChangeEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi với tên phân biệt chữ hoa chữ thường của sự kiện liên kết. Các tác nhân người dùng đặt nó thành `"prioritychange"`.

- `options`
  - : Một đối tượng, _ngoài các thuộc tính được xác định trong {{domxref("Event/Event", "Event()")}}_, có thể có các thuộc tính sau:
    - `previousPriority`
      - : Một chuỗi cho biết [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) _trước đó_ của tác vụ. Một trong: [`"user-blocking"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-blocking), [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible), [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#background).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
