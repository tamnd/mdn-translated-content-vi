---
title: "TaskController: TaskController() constructor"
short-title: TaskController()
slug: Web/API/TaskController/TaskController
page-type: web-api-constructor
browser-compat: api.TaskController.TaskController
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Hàm khởi tạo **`TaskController()`** tạo một đối tượng {{domxref("TaskController")}} mới, tùy chọn đặt [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) ban đầu cho [`signal`](/en-US/docs/Web/API/TaskController#taskcontroller.signal) liên kết.

Nếu không đặt mức ưu tiên, mức ưu tiên tín hiệu mặc định là [`user-visible`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible).

## Cú pháp

```js-nolint
new TaskController()
new TaskController(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng với các thuộc tính sau:
    - `priority` {{optional_inline}}
      - : [Mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của tín hiệu liên kết với `TaskController` này. Một trong: `"user-blocking"`, `"user-visible"` (mặc định), `"background"`.

## Ví dụ

Đoạn mã dưới đây hiển thị cách xây dựng một bộ điều khiển tác vụ có tín hiệu với mức ưu tiên mặc định (`user-visible`).

```js
const controller = new TaskController();
```

Để xây dựng một bộ điều khiển tác vụ có mức ưu tiên tín hiệu cụ thể, truyền `priority` làm thuộc tính của đối số tùy chọn.

```js
controller2 = new TaskController({ priority: "user-blocking" });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
