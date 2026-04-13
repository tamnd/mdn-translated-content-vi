---
title: "TaskSignal: sự kiện prioritychange"
short-title: prioritychange
slug: Web/API/TaskSignal/prioritychange_event
page-type: web-api-event
browser-compat: api.TaskSignal.prioritychange_event
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Sự kiện **`prioritychange`** được gửi đến {{domxref('TaskSignal')}} nếu [ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của nó thay đổi.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("prioritychange", (event) => { })

onprioritychange = (event) => { }
```

## Loại sự kiện

Một {{domxref("TaskPriorityChangeEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("TaskPriorityChangeEvent")}}

## Thuộc tính sự kiện

- {{domxref('TaskPriorityChangeEvent.previousPriority')}}
  - : Cho biết ưu tiên trước đó của tác vụ (trước khi nó được thay đổi).
    Ưu tiên mới/được cập nhật được đọc từ `event.target.priority` ([`TaskSignal.priority`](/en-US/docs/Web/API/TaskSignal/priority)).

## Ví dụ

Ví dụ dưới đây cho thấy cách lắng nghe sự kiện `prioritychange` trên {{domxref("TaskSignal")}}.

```html hidden
<textarea id="log"></textarea>
```

```css hidden
#log {
  min-height: 70px;
  width: 95%;
}
```

```js hidden
let log = document.getElementById("log");
function myLog(text) {
  log.textContent += `${text}\n`;
}
```

Đầu tiên chúng ta tạo bộ điều khiển và thêm trình lắng nghe sự kiện vào tín hiệu của nó.
Khi xử lý sự kiện, chúng ta sử dụng {{domxref('TaskPriorityChangeEvent.previousPriority', 'previousPriority')}} trên sự kiện để lấy ưu tiên ban đầu và {{domxref("TaskSignal.priority")}} trên đích sự kiện để lấy ưu tiên mới/hiện tại.

Sau đó tác vụ được đăng, truyền tín hiệu vào, và ngay sau đó chúng ta thay đổi ưu tiên.

```js
if ("scheduler" in this) {
  // Declare a TaskController, setting its signal priority to 'user-blocking'
  const controller = new TaskController({ priority: "user-blocking" });

  // Listen for 'prioritychange' events on the controller's signal.
  controller.signal.addEventListener("prioritychange", (event) => {
    const previousPriority = event.previousPriority;
    const newPriority = event.target.priority;
    myLog(`Priority changed from ${previousPriority} to ${newPriority}.`);
  });

  // Post task using the controller's signal.
  // The signal priority sets the initial priority of the task
  scheduler.postTask(
    () => {
      myLog("Task 1");
    },
    { signal: controller.signal },
  );

  // Change the priority to 'background' using the controller
  controller.setPriority("background");
}
```

> [!NOTE]
> Mã trên sử dụng hàm ghi nhật ký tùy chỉnh `myLog()` để ghi vào vùng văn bản bên dưới.
> Điều này bị ẩn vì nó không liên quan đến ví dụ.

Đầu ra bên dưới cho thấy [ưu tiên của tác vụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) đã thay đổi từ `user-blocking` sang `background`.
Điều này xảy ra trước khi tác vụ được thực thi, nhưng cũng có thể xảy ra khi tác vụ đang chạy.

{{EmbedLiveSample("Examples",'400px','130px')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
