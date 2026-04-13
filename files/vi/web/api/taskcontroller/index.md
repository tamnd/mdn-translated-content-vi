---
title: TaskController
slug: Web/API/TaskController
page-type: web-api-interface
browser-compat: api.TaskController
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Giao diện **`TaskController`** của [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API) đại diện cho một đối tượng điều khiển có thể được dùng để hủy và thay đổi [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của một hoặc nhiều tác vụ ưu tiên. Nếu không cần thay đổi mức ưu tiên của tác vụ, có thể dùng {{domxref("AbortController")}} thay thế.

Một phiên bản `TaskController` mới được tạo bằng hàm khởi tạo {{domxref("TaskController.TaskController()", "TaskController()")}}, tùy chọn chỉ định [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) cho tín hiệu liên kết (một {{domxref("TaskSignal")}}). Nếu không chỉ định, tín hiệu sẽ có mức ưu tiên mặc định là [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible).

Tín hiệu của bộ điều khiển có thể được truyền làm đối số cho phương thức {{domxref("Scheduler.postTask()")}} cho một hoặc nhiều tác vụ. Đối với [tác vụ có thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority) (chỉ), tác vụ được khởi tạo với mức ưu tiên của tín hiệu và có thể được thay đổi sau bằng cách gọi {{domxref('TaskController.setPriority()')}}. Đối với tác vụ không thể thay đổi, mọi mức ưu tiên được khởi tạo hoặc đặt bởi bộ điều khiển đều bị bỏ qua.

Các tác vụ có thể bị hủy bằng cách gọi {{domxref("AbortController.abort()","abort()")}} trên bộ điều khiển.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("TaskController.TaskController", "TaskController()")}}
  - : Tạo một đối tượng `TaskController` mới, tùy chọn chỉ định mức ưu tiên của [`signal`](#taskcontroller.signal) liên kết.

## Phương thức phiên bản

_Giao diện này cũng kế thừa các phương thức của phần tử cha, {{domxref("AbortController")}}._

- {{domxref('TaskController.setPriority()')}}
  - : Đặt mức ưu tiên của [`signal`](#taskcontroller.signal) của bộ điều khiển, và do đó là mức ưu tiên của bất kỳ tác vụ nào liên kết với nó. Điều này thông báo cho các trình quan sát về thay đổi mức ưu tiên bằng cách gửi sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event).

## Thuộc tính phiên bản

_Giao diện này cũng kế thừa các thuộc tính của phần tử cha, {{domxref("AbortController")}}._

- `TaskController.signal` {{ReadOnlyInline}}
  - : Trả về một phiên bản đối tượng {{domxref("TaskSignal")}}. Tín hiệu được truyền vào các tác vụ để chúng có thể bị hủy hoặc thay đổi ưu tiên bởi bộ điều khiển. Thuộc tính này được kế thừa từ [`AbortController`](/en-US/docs/Web/API/AbortController/signal).

## Ví dụ

> [!NOTE]
> Các ví dụ "trực tiếp" bổ sung có thể tìm thấy tại: [Ví dụ Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#examples).

Đầu tiên chúng ta tạo một bộ điều khiển tác vụ, đặt mức ưu tiên của tín hiệu liên kết thành `user-blocking`.

```js
// Tạo TaskController, đặt mức ưu tiên tín hiệu là 'user-blocking'
const controller = new TaskController({ priority: "user-blocking" });
```

Sau đó chúng ta thêm trình nghe sự kiện cho các sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event) (ở đây `addEventListener()` được gọi, nhưng chúng ta cũng có thể gán trình xử lý cho `TaskSignal.onprioritychange`). Trình xử lý sử dụng [previousPolicy](/en-US/docs/Web/API/TaskPriorityChangeEvent/previousPriority) trên sự kiện để lấy mức ưu tiên gốc và {{domxref("TaskSignal.priority")}} trên mục tiêu sự kiện để lấy mức ưu tiên mới.

```js
// Lắng nghe sự kiện 'prioritychange' trên tín hiệu của bộ điều khiển.
controller.signal.addEventListener("prioritychange", (event) => {
  const previousPriority = event.previousPriority;
  const newPriority = event.target.priority;
  console.log(`Priority changed from ${previousPriority} to ${newPriority}.`);
});
```

Chúng ta cũng có thể lắng nghe sự kiện [`abort`](/en-US/docs/Web/API/AbortSignal/abort_event) như dưới đây. Cách tiếp cận tương tự sẽ được sử dụng nếu bộ điều khiển là `AbortController`.

```js
controller.signal.addEventListener(
  "abort",
  (event) => {
    console.log("Task aborted");
  },
  { once: true },
);
```

Tiếp theo, chúng ta đăng tải tác vụ, truyền tín hiệu của bộ điều khiển vào đối số tùy chọn. Trong trường hợp này, tác vụ chỉ là một hàm mũi tên phân giải promise bằng cách trả về một số văn bản. Chúng ta sử dụng `then` và `catch` để xử lý khi tác vụ được phân giải hoặc bị từ chối.

```js
// Đăng tải tác vụ sử dụng tín hiệu của bộ điều khiển.
scheduler
  .postTask(() => "Task execute", { signal: controller.signal })
  .then((taskResult) => {
    console.log(`${taskResult}`);
  }) // Bị hủy (sẽ không chạy)
  .catch((error) => {
    console.log(`Catch error: ${error}`);
  }); // Ghi lỗi
```

Chúng ta có thể dùng bộ điều khiển để quản lý tác vụ. Ở đây chúng ta có thể thay đổi mức ưu tiên bằng {{domxref('TaskController.setPriority()')}}. Điều này sẽ kích hoạt sự kiện `prioritychange` liên quan.

```js
// Thay đổi mức ưu tiên thành 'background' bằng bộ điều khiển
controller.setPriority("background");
```

Cuối cùng, tác vụ có thể bị hủy bằng cách gọi {{domxref("AbortController.abort()","abort()")}} trên bộ điều khiển.

```js
// Hủy tác vụ
controller.abort();
```

Đầu ra console của ví dụ này sẽ là:

```plain
The priority changed from user-blocking to background.
Task aborted
Catch error: AbortError
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
