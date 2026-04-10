---
title: "Scheduler: phương thức postTask()"
short-title: postTask()
slug: Web/API/Scheduler/postTask
page-type: web-api-instance-method
browser-compat: api.Scheduler.postTask
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Phương thức **`postTask()`** của giao diện {{domxref("Scheduler")}} được sử dụng để thêm các tác vụ cần [lập lịch](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API) theo [độ ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của chúng.

Phương thức này cho phép người dùng tùy chọn chỉ định độ trễ tối thiểu trước khi tác vụ chạy, độ ưu tiên cho tác vụ và tín hiệu có thể được sử dụng để thay đổi độ ưu tiên của tác vụ và/hoặc hủy tác vụ.
Nó trả về một promise sẽ được giải quyết với kết quả của hàm gọi lại tác vụ, hoặc bị từ chối với lý do hủy hoặc lỗi được ném ra trong tác vụ.

Độ ưu tiên tác vụ có thể là [có thể thay đổi hoặc không thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority).
Nếu độ ưu tiên của tác vụ không bao giờ cần thay đổi thì nó nên được đặt bằng tham số `options.priority` (bất kỳ độ ưu tiên nào đặt qua tín hiệu sau đó sẽ bị bỏ qua).
Bạn vẫn có thể truyền {{domxref("AbortSignal")}} (không có độ ưu tiên) hoặc {{domxref("TaskSignal")}} vào tham số `options.signal` để hủy tác vụ.

Nếu độ ưu tiên của tác vụ có thể cần thay đổi thì tham số `options.priority` không được đặt.
Thay vào đó, một {{domxref("TaskController")}} nên được tạo và {{domxref("TaskSignal")}} của nó nên được truyền vào `options.signal`.
Độ ưu tiên tác vụ sẽ được khởi tạo từ độ ưu tiên của tín hiệu, và sau đó có thể được sửa đổi bằng {{domxref("TaskController")}} liên kết với tín hiệu.

Nếu không có độ ưu tiên nào được đặt thì độ ưu tiên tác vụ mặc định là [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible).

Nếu độ trễ được chỉ định và lớn hơn 0, việc thực thi tác vụ sẽ bị trì hoãn ít nhất trong số mili giây đó.
Ngược lại, tác vụ được lên lịch ngay lập tức để ưu tiên hóa.

## Cú pháp

```js-nolint
postTask(callback)
postTask(callback, options)
```

### Tham số

- `callback`
  - : Một hàm gọi lại triển khai tác vụ.
    Giá trị trả về của hàm gọi lại được sử dụng để giải quyết promise do hàm này trả về.

- `options` {{optional_inline}}
  - : Các tùy chọn tác vụ, bao gồm:
    - `priority` {{optional_inline}}
      - : [Độ ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) không thể thay đổi của tác vụ.
        Một trong các giá trị: [`"user-blocking"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-blocking), [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible), [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#background).
        Nếu được đặt, độ ưu tiên này được sử dụng cho toàn bộ vòng đời của tác vụ và độ ưu tiên đặt trên `signal` sẽ bị bỏ qua.

    - `signal` {{optional_inline}}
      - : Một {{domxref("TaskSignal")}} hoặc {{domxref("AbortSignal")}} có thể được sử dụng để hủy tác vụ (từ bộ điều khiển liên kết của nó).

        Nếu tham số `options.priority` được đặt thì độ ưu tiên tác vụ không thể thay đổi, và bất kỳ độ ưu tiên nào trên tín hiệu sẽ bị bỏ qua.
        Ngược lại, nếu tín hiệu là một {{domxref("TaskSignal")}} thì độ ưu tiên của nó được sử dụng để đặt độ ưu tiên ban đầu của tác vụ, và bộ điều khiển của tín hiệu sau đó có thể dùng nó để thay đổi độ ưu tiên tác vụ.

    - `delay` {{optional_inline}}
      - : Thời gian tối thiểu sau đó tác vụ sẽ được thêm vào hàng đợi của bộ lập lịch, tính bằng mili giây nguyên.
        Độ trễ thực tế có thể cao hơn giá trị chỉ định, nhưng sẽ không thấp hơn.
        Độ trễ mặc định là 0.

### Giá trị trả về

Trả về một {{jsxref("Promise")}} được giải quyết với giá trị trả về của hàm `callback`, hoặc có thể bị từ chối với lý do hủy của `signal` ({{domxref("AbortSignal.reason")}}).
Promise cũng có thể bị từ chối với một lỗi do hàm gọi lại ném ra trong quá trình thực thi.

## Ví dụ

Các ví dụ sau đây là phiên bản đã được đơn giản hóa một chút so với các ví dụ trực tiếp được cung cấp trong [Prioritized Task Scheduling API > Ví dụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#examples).

### Kiểm tra tính năng

Kiểm tra xem việc lập lịch tác vụ có độ ưu tiên có được hỗ trợ hay không bằng cách kiểm tra thuộc tính `scheduler` trong phạm vi toàn cục (chẳng hạn như {{domxref("Window.scheduler")}} trong phạm vi window hoặc {{domxref("WorkerGlobalScope.scheduler")}} trong phạm vi worker).

Ví dụ, đoạn mã dưới đây ghi log "Feature: Supported" nếu API được hỗ trợ trên trình duyệt này.

```js
// Check that feature is supported
if ("scheduler" in globalThis) {
  console.log("Feature: Supported");
} else {
  console.error("Feature: NOT Supported");
}
```

### Sử dụng cơ bản

Các tác vụ được đăng bằng cách chỉ định hàm gọi lại (tác vụ) trong đối số đầu tiên và đối số tùy chọn thứ hai có thể được sử dụng để chỉ định độ ưu tiên tác vụ, tín hiệu và/hoặc độ trễ.
Phương thức trả về một {{jsxref("Promise")}} resolve với giá trị trả về của hàm gọi lại, hoặc reject với lỗi hủy hoặc lỗi được ném ra trong hàm.

Vì nó trả về một promise, `postTask()` có thể được [nối với các promise khác](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise#chained_promises).
Dưới đây chúng tôi hiển thị cách chờ promise resolve bằng [`then`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/then) hoặc reject bằng [`catch`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Promise/catch).
Độ ưu tiên không được chỉ định, vì vậy độ ưu tiên mặc định `user-visible` sẽ được sử dụng.

```js
// A function that defines a task
function myTask() {
  return "Task 1: user-visible";
}

// Post task with default priority: 'user-visible' (no other options)
// When the task resolves, Promise.then() logs the result.
scheduler
  .postTask(myTask, { signal: abortTaskController.signal })
  .then((taskResult) => console.log(`${taskResult}`)) // Log resolved value
  .catch((error) => console.error("Error:", error)); // Log error or abort
```

Phương thức này cũng có thể được sử dụng với [`await`](/en-US/docs/Web/JavaScript/Reference/Operators/await) bên trong một [hàm async](/en-US/docs/Web/JavaScript/Reference/Statements/async_function).
Đoạn mã dưới đây hiển thị cách bạn có thể sử dụng cách tiếp cận này để chờ một tác vụ `user-blocking`.

```js
function myTask2() {
  return "Task 2: user-blocking";
}

async function runTask2() {
  const result = await scheduler.postTask(myTask2, {
    priority: "user-blocking",
  });
  console.log(result); // 'Task 2: user-blocking'.
}
runTask2();
```

### Độ ưu tiên cố định

[Độ ưu tiên tác vụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) có thể được đặt bằng tham số `priority` trong đối số tùy chọn thứ hai.
Các độ ưu tiên được đặt theo cách này không thể thay đổi ([không thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority)).

Dưới đây chúng tôi đăng hai nhóm ba tác vụ, mỗi thành viên theo thứ tự ngược lại của độ ưu tiên.
Tác vụ cuối cùng có độ ưu tiên mặc định.
Khi chạy, mỗi tác vụ chỉ ghi log thứ tự dự kiến của nó (chúng tôi không chờ kết quả vì không cần thiết để hiển thị thứ tự thực thi).

```js
// three tasks, in reverse order of priority
scheduler.postTask(() => console.log("bkg 1"), { priority: "background" });
scheduler.postTask(() => console.log("usr-vis 1"), {
  priority: "user-visible",
});
scheduler.postTask(() => console.log("usr-blk 1"), {
  priority: "user-blocking",
});

// three more tasks, in reverse order of priority
scheduler.postTask(() => console.log("bkg 2"), { priority: "background" });
scheduler.postTask(() => console.log("usr-vis 2"), {
  priority: "user-visible",
});
scheduler.postTask(() => console.log("usr-blk 2"), {
  priority: "user-blocking",
});

// Task with default priority: user-visible
scheduler.postTask(() => {
  console.log("usr-vis 3 (default)");
});
```

Kết quả đầu ra dự kiến được hiển thị bên dưới: các tác vụ được thực thi theo thứ tự ưu tiên, sau đó là thứ tự khai báo.

```plain
usr-blk 1
usr-blk 2
usr-vis 1
usr-vis 2
usr-vis 3 (default)
bkg 1
bkg 2
```

### Thay đổi độ ưu tiên tác vụ

[Độ ưu tiên tác vụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) cũng có thể lấy giá trị ban đầu từ {{domxref("TaskSignal")}} được truyền vào `postTask()` trong đối số tùy chọn thứ hai.
Nếu được đặt theo cách này, độ ưu tiên của tác vụ [sau đó có thể được thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority) bằng bộ điều khiển liên kết với tín hiệu.

> [!NOTE]
> Việc đặt và thay đổi độ ưu tiên tác vụ bằng tín hiệu chỉ hoạt động khi đối số `options.priority` cho `postTask()` không được đặt và khi `options.signal` là {{domxref("TaskSignal")}} (không phải {{domxref("AbortSignal")}}).

Đoạn mã dưới đây đầu tiên hiển thị cách tạo một {{domxref("TaskController")}}, đặt độ ưu tiên ban đầu của tín hiệu thành `user-blocking` trong [`TaskController()` constructor](/en-US/docs/Web/API/TaskController/TaskController).

Sau đó chúng tôi sử dụng `addEventListener()` để thêm trình lắng nghe sự kiện vào tín hiệu của bộ điều khiển (chúng tôi cũng có thể sử dụng thuộc tính `TaskSignal.onprioritychange` để thêm trình xử lý sự kiện).
Trình xử lý sự kiện sử dụng {{domxref('TaskPriorityChangeEvent.previousPriority', 'previousPriority')}} trên sự kiện để lấy độ ưu tiên ban đầu và {{domxref("TaskSignal.priority")}} trên đích sự kiện để lấy độ ưu tiên mới/hiện tại.

```js
// Create a TaskController, setting its signal priority to 'user-blocking'
const controller = new TaskController({ priority: "user-blocking" });

// Listen for 'prioritychange' events on the controller's signal.
controller.signal.addEventListener("prioritychange", (event) => {
  const previousPriority = event.previousPriority;
  const newPriority = event.target.priority;
  console.log(`Priority changed from ${previousPriority} to ${newPriority}.`);
});
```

Cuối cùng, tác vụ được đăng, truyền vào tín hiệu, và sau đó chúng tôi ngay lập tức thay đổi độ ưu tiên thành `background` bằng cách gọi {{domxref("TaskController.setPriority()")}} trên bộ điều khiển.

```js
// Post task using the controller's signal.
// The signal priority sets the initial priority of the task
scheduler.postTask(() => console.log("Task 1"), { signal: controller.signal });

// Change the priority to 'background' using the controller
controller.setPriority("background");
```

Kết quả đầu ra dự kiến được hiển thị bên dưới.
Lưu ý rằng trong trường hợp này, độ ưu tiên được thay đổi trước khi tác vụ được thực thi, nhưng nó cũng có thể được thay đổi trong khi tác vụ đang chạy.

```js
// Expected output
// Priority changed from user-blocking to background.
// Task 1
```

### Hủy tác vụ

Các tác vụ có thể được hủy bằng {{domxref("TaskController")}} hoặc {{domxref("AbortController")}}, theo cách hoàn toàn giống nhau.
Sự khác biệt duy nhất là bạn phải sử dụng {{domxref("TaskController")}} nếu bạn cũng muốn đặt độ ưu tiên tác vụ.

Đoạn mã dưới đây tạo một bộ điều khiển và truyền tín hiệu của nó vào tác vụ.
Tác vụ sau đó ngay lập tức bị hủy.
Điều này khiến promise bị từ chối với `AbortError`, được bắt trong khối `catch` và ghi log.
Lưu ý rằng chúng tôi cũng có thể lắng nghe [sự kiện `abort`](/en-US/docs/Web/API/AbortSignal/abort_event) được kích hoạt trên {{domxref("TaskSignal")}} hoặc {{domxref("AbortSignal")}} và ghi log việc hủy tại đó.

```js
// Declare a TaskController with default priority
const abortTaskController = new TaskController();
// Post task passing the controller's signal
scheduler
  .postTask(() => console.log("Task executing"), {
    signal: abortTaskController.signal,
  })
  .then((taskResult) => console.log(`${taskResult}`)) // This won't run!
  .catch((error) => console.error("Error:", error)); // Log the error

// Abort the task
abortTaskController.abort();
```

### Trì hoãn tác vụ

Các tác vụ có thể được trì hoãn bằng cách chỉ định số mili giây nguyên trong tham số `options.delay` của `postTask()`.
Về cơ bản, điều này thêm tác vụ vào hàng đợi ưu tiên theo timeout, như có thể được tạo bằng {{domxref("Window.setTimeout", "setTimeout()")}}.
`delay` là thời gian tối thiểu trước khi tác vụ được thêm vào bộ lập lịch; nó có thể dài hơn.

Đoạn mã dưới đây hiển thị hai tác vụ được thêm (dưới dạng hàm mũi tên) với độ trễ.

```js
// Post task as arrow function with delay of 2 seconds
scheduler
  .postTask(() => "Task delayed by 2000ms", { delay: 2000 })
  .then((taskResult) => console.log(`${taskResult}`));
scheduler
  .postTask(() => "Next task should complete in about 2000ms", { delay: 1 })
  .then((taskResult) => console.log(`${taskResult}`));
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
