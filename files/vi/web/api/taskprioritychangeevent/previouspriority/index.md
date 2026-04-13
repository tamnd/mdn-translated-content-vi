---
title: "TaskPriorityChangeEvent: previousPriority property"
short-title: previousPriority
slug: Web/API/TaskPriorityChangeEvent/previousPriority
page-type: web-api-instance-property
browser-compat: api.TaskPriorityChangeEvent.previousPriority
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`previousPriority`** của giao diện {{domxref("TaskPriorityChangeEvent")}} trả về mức ưu tiên của {{domxref("TaskSignal")}} tương ứng trước khi nó được thay đổi và sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event) này được phát ra.

Đây là giá trị được đặt trong đối số `options.previous` của [hàm khởi tạo `TaskPriorityChangeEvent`](/en-US/docs/Web/API/TaskPriorityChangeEvent/TaskPriorityChangeEvent).

Mức ưu tiên mới của tác vụ có thể đọc từ `event.target.priority`.

## Giá trị

Một chuỗi, chỉ định mức ưu tiên của tác vụ liên kết trước khi nó được thay đổi. Giá trị sẽ là một trong: [`"user-blocking"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-blocking), [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible), [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#background).

## Ví dụ

Đoạn mã dưới đây hiển thị `previousPriority` được lấy trong trình xử lý sự kiện `prioritychange`.

```js
// Lắng nghe sự kiện 'prioritychange' trên tín hiệu của bộ điều khiển.
controller.signal.addEventListener("prioritychange", (event) => {
  const previousPriority = event.previousPriority;
  const newPriority = event.target.priority;
  console.log(
    `The priority changed from ${previousPriority} to ${newPriority}.`,
  );
});
```

Ví dụ trực tiếp đầy đủ hơn có thể tìm thấy tại [`prioritychange` event > Ví dụ](/en-US/docs/Web/API/TaskSignal/prioritychange_event).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
