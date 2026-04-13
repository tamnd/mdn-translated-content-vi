---
title: "Scheduler: phương thức yield()"
short-title: yield()
slug: Web/API/Scheduler/yield
page-type: web-api-instance-method
browser-compat: api.Scheduler.yield
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Phương thức **`yield()`** của giao diện {{domxref('Scheduler')}} được sử dụng để nhường quyền kiểm soát [luồng chính](/en-US/docs/Glossary/Main_thread) trong một tác vụ và tiếp tục thực thi sau đó, với việc tiếp tục được lên lịch như một tác vụ có độ ưu tiên (xem [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API) để biết thêm thông tin). Điều này cho phép chia nhỏ công việc đang chạy dài để trình duyệt luôn phản hồi tốt.

Tác vụ có thể tiếp tục khi promise do phương thức trả về được giải quyết. Độ ưu tiên cho việc giải quyết promise mặc định là [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible), nhưng có thể kế thừa độ ưu tiên khác nếu lệnh gọi `yield()` xảy ra trong hàm gọi lại {{domxref('Scheduler.postTask()')}}.

Ngoài ra, việc tiếp tục công việc sau lệnh gọi `yield()` có thể bị hủy nếu nó xảy ra trong hàm gọi lại `postTask()` và [tác vụ bị hủy](/en-US/docs/Web/API/Scheduler/postTask#aborting_tasks).

## Cú pháp

```js-nolint
yield()
```

### Tham số

Không có.

### Giá trị trả về

Trả về một {{jsxref('Promise')}} được fulfill với {{jsxref('undefined')}}, hoặc bị từ chối với {{domxref('AbortSignal.reason')}}.

## Ví dụ

### Kiểm tra tính năng

Kiểm tra xem việc lập lịch tác vụ có độ ưu tiên có được hỗ trợ hay không bằng cách kiểm tra `scheduler.yield` trên {{jsxref('globalThis')}}, trong phạm vi window hoặc worker.

Ví dụ, đoạn mã dưới đây ghi log `"scheduler.yield: Supported"` nếu API được hỗ trợ trong trình duyệt hiện tại.

```js
// Check for support before using.
if (globalThis.scheduler?.yield) {
  console.log("scheduler.yield: Supported");
} else {
  console.error("scheduler.yield: NOT Supported");
}
```

### Sử dụng cơ bản

Các tác vụ dài có thể được chia nhỏ bằng cách await `scheduler.yield()`. Hàm trả về một promise, nhường quyền cho luồng chính để cho phép trình duyệt thực thi công việc đang chờ khác—như phản hồi đầu vào người dùng—nếu cần. Trình duyệt lên lịch một tác vụ tiếp theo giải quyết promise, tại thời điểm đó việc thực thi mã có thể tiếp tục từ nơi đã dừng.

Ví dụ: nếu trình lắng nghe sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) trên một nút dẫn đến khối lượng công việc đáng kể để tải và hiển thị nội dung trang mới, sẽ không có phản hồi trực quan nào cho người dùng biết rằng nút của họ đã được trang ghi nhận cho đến khi công việc đó hoàn tất. Một `scheduler.yield()` có thể được chèn vào trình lắng nghe sự kiện để phản hồi nhanh có thể được hiển thị (như spinner), và sau đó phần công việc còn lại có thể được thực hiện khi tiếp tục sau yield.

```js
button.addEventListener("click", async () => {
  // Provide immediate feedback so the user knows their click was received.
  showSpinner();
  await scheduler.yield();
  // Do longer processing
  doSlowContentSwap();
});
```

Nó cũng có thể đủ để cung cấp phản hồi tương tác nhanh với giao diện mặc định. Ví dụ: nếu trình lắng nghe sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event) trên checkbox kích hoạt việc lọc nội dung trang chậm, lệnh gọi `scheduler.yield()` có thể được chèn để hiển thị thay đổi trạng thái check ngay lập tức trước khi tiếp tục phần còn lại của phản hồi sự kiện.

```js
checkbox.addEventListener("change", async () => {
  await scheduler.yield();
  doSlowContentFiltering();
});
```

Trong các tình huống có công việc dài cần thực hiện trên luồng chính có thể được chia thành chuỗi các tác vụ, `scheduler.yield()` có thể được gọi nhiều lần để giữ cho trang luôn phản hồi tốt.

```js
function doWork(value) {
  console.log(`work chunk ${value}`);
}

const workList = [0, 1, 2, 3, 4];

for (const work of workList) {
  doWork(work);
  await scheduler.yield();
}
```

### Độ ưu tiên của yield

Thứ tự giải quyết promise do `scheduler.yield()` trả về so với các tác vụ khác dựa trên [độ ưu tiên tác vụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) ngầm định.

Theo mặc định, `scheduler.yield()` được chạy với độ ưu tiên [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible). Tuy nhiên, việc tiếp tục sau lệnh gọi `scheduler.yield()` có hành vi hơi khác so với các tác vụ `scheduler.postTask()` có cùng `priority`.

`scheduler.yield()` xếp tác vụ của nó vào hàng đợi tác vụ được tăng cường so với `scheduler.postTask()` có cùng mức độ ưu tiên. Vì vậy, ví dụ: phần tiếp tục `scheduler.yield()` với độ ưu tiên `"user-visible"` sẽ được ưu tiên sau các tác vụ `scheduler.postTask()` có độ ưu tiên `"user-blocking"` cao hơn, nhưng trước các tác vụ `scheduler.postTask()` có cùng độ ưu tiên `"user-visible"` (trong đặc tả, điều này được định nghĩa bởi [effective priority](https://wicg.github.io/scheduling-apis/#scheduler-task-queue-effective-priority) của hàng đợi tác vụ).

Điều này đôi khi được mô tả là `scheduler.yield()` xếp tác vụ của nó ở phía trước của hàng đợi mức độ ưu tiên, trong khi các tác vụ `scheduler.postTask()` đi vào cuối. Đây có thể là một mô hình tinh thần hữu ích. Trong các tình huống chỉ có một vài tác vụ, điều này có nghĩa là với cùng độ ưu tiên, phần tiếp tục `scheduler.yield()` sẽ đến trước, cho phép linh hoạt hơn trong cách lên lịch tác vụ. Ví dụ:

```js
scheduler.postTask(() => console.log("user-visible postTask"));
scheduler.postTask(() => console.log("user-blocking postTask"), {
  priority: "user-blocking",
});
await scheduler.yield();
console.log("user-visible yield");
```

sẽ ghi log như sau:

```plain
user-blocking postTask
user-visible yield
user-visible postTask
```

Tuy nhiên, trong trường hợp có nhiều lệnh gọi `scheduler.yield()`, sự khác biệt là các tác vụ tiếp tục `scheduler.yield()` đi vào hàng đợi được tăng cường _độ ưu tiên_ trở nên quan trọng vì tác vụ `scheduler.yield()` thứ hai sẽ không được chạy trước tác vụ đã có trong hàng đợi.

Nếu một hàm yield công việc của nó trước hàm thứ hai, hàm yield đầu tiên sẽ tiếp tục trước. Ví dụ:

```js
async function first() {
  console.log("starting first function");
  await scheduler.yield();
  console.log("ending first function");
}

async function second() {
  console.log("starting second function");
  await scheduler.yield();
  console.log("ending second function");
}

first();
second();
```

sẽ ghi log như sau:

```plain
starting first function
starting second function
ending first function
ending second function
```

### Kế thừa độ ưu tiên tác vụ

Lệnh gọi `scheduler.yield()` trong tác vụ `scheduler.postTask()` sẽ kế thừa độ ưu tiên của tác vụ. Ví dụ: công việc sau `scheduler.yield()` trong tác vụ [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-blocking) có độ ưu tiên thấp cũng sẽ được lên lịch là `"background"` theo mặc định (nhưng, một lần nữa, được chèn vào hàng đợi ưu tiên `"background"` được tăng cường để chạy trước bất kỳ tác vụ `"background"` `postTask()` nào).

Ví dụ:

```js
async function backgroundWork() {
  scheduler.postTask(() => console.log("background postTask"), {
    priority: "background",
  });
  scheduler.postTask(() => console.log("user-visible postTask"), {
    priority: "user-visible",
  });
  // yield() inherits "background" priority from surrounding task.
  await scheduler.yield();
  console.log("default-background yield");
}

await scheduler.postTask(backgroundWork, { priority: "background" });
```

sẽ ghi log như sau:

```plain
user-visible postTask
default-background yield
background postTask
```

Các phần tiếp tục `scheduler.yield()` sẽ kế thừa bất kỳ độ ưu tiên nào mà tác vụ `scheduler.postTask()` chứa nó có, bao gồm việc độ ưu tiên của tác vụ có được [thay đổi động](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#changing_task_priorities) hay không.

### Hủy một yield

Tương tự như việc đặt độ ưu tiên, lệnh gọi `scheduler.yield()` không thể bị hủy trực tiếp, nhưng nó sẽ kế thừa tín hiệu hủy từ tác vụ `scheduler.postTask()` bao quanh. Việc hủy tác vụ cũng sẽ hủy mọi yield đang chờ trong đó.

Ví dụ này sử dụng {{domxref('TaskController')}} để [hủy tác vụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#aborting_tasks) có `scheduler.yield()` trong đó.

```js
const taskController = new TaskController();

function firstHalfOfWork() {
  console.log("first half of work");
  taskController.abort("cancel work");
}

function secondHalfOfWork() {
  // Never runs.
  console.log("second half of work");
}

scheduler.postTask(
  async () => {
    firstHalfOfWork();
    await scheduler.yield();
    secondHalfOfWork();
  },
  { signal: taskController.signal },
);
```

Ví dụ này có phần giả tạo ở chỗ nó luôn kích hoạt lệnh gọi `taskController.abort()` trong chính tác vụ, nhưng lệnh gọi `abort()` có thể đến từ bất kỳ đâu. Ví dụ: nó có thể được kích hoạt bởi người dùng nhấn nút 'Cancel'.

Trong trường hợp này, `abort()` xảy ra sau khi tác vụ `scheduler.postTask()` đã bắt đầu (`"first half of work"` được ghi log), nhưng lệnh gọi yield kế thừa [tín hiệu hủy](/en-US/docs/Web/API/AbortSignal) do đó lệnh gọi `await scheduler.yield()` sẽ ném ra với lý do hủy là `"cancel work"`.

### Sử dụng `yield()` trong `requestIdleCallback()`

Các lệnh gọi `scheduler.yield()` cũng kế thừa độ ưu tiên từ {{domxref("Window.requestIdleCallback()")}}, khi được gọi từ bên trong hàm gọi lại. Trong trường hợp này, giá trị độ ưu tiên [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#background) được kế thừa. Tuy nhiên, lưu ý rằng các lệnh gọi `scheduler.yield()` bên trong hàm gọi lại `requestIdleCallback()` không thể bị hủy.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API)
- {{domxref('Scheduler')}}
- {{domxref('Scheduler.postTask()')}}
