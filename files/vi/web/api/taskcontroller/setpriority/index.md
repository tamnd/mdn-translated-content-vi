---
title: "TaskController: setPriority() method"
short-title: setPriority()
slug: Web/API/TaskController/setPriority
page-type: web-api-instance-method
browser-compat: api.TaskController.setPriority
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Phương thức **`setPriority()`** của giao diện {{domxref("TaskController")}} có thể được gọi để đặt [mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) mới cho [`signal`](/en-US/docs/Web/API/TaskController#taskcontroller.signal) của bộ điều khiển này. Nếu một tác vụ ưu tiên được [cấu hình](/en-US/docs/Web/API/Scheduler/postTask#signal) để sử dụng tín hiệu, thao tác này cũng sẽ thay đổi mức ưu tiên của tác vụ.

Các trình quan sát được thông báo về thay đổi mức ưu tiên bằng cách gửi sự kiện [`prioritychange`](/en-US/docs/Web/API/TaskSignal/prioritychange_event). Phương thức chỉ thông báo nếu mức ưu tiên thực sự thay đổi (sự kiện không được kích hoạt nếu mức ưu tiên không thay đổi sau khi gọi).

Lưu ý rằng mức ưu tiên của tác vụ chỉ có thể thay đổi đối với [tác vụ có mức ưu tiên có thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority). Nếu tác vụ không thể thay đổi, lời gọi hàm sẽ bị bỏ qua.

## Cú pháp

```js-nolint
setPriority(priority)
```

### Tham số

- `priority`
  - : [Mức ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) của tác vụ. Một trong: [`"user-blocking"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-blocking), [`"user-visible"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#user-visible), [`"background"`](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#background).

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotAllowedError` {{domxref("DOMException")}}
  - : Một thay đổi mức ưu tiên đã được bắt đầu trong khi một thay đổi khác đang chạy.

## Ví dụ

Đầu tiên chúng ta tạo một bộ điều khiển tác vụ. Trong trường hợp này chúng ta không chỉ định mức ưu tiên, vì vậy nó sẽ mặc định là `user-visible`.

```js
// Tạo TaskController với mức ưu tiên mặc định: 'user-visible'
const controller = new TaskController();
```

Sau đó chúng ta truyền tín hiệu của bộ điều khiển vào phương thức [`Scheduler.postTask()`](/en-US/docs/Web/API/Scheduler/postTask#signal).

```js
// Đăng tải tác vụ truyền vào tín hiệu của bộ điều khiển.
scheduler
  .postTask(() => "Task execute", { signal: controller.signal })
  .then((taskResult) => {
    console.log(`${taskResult}`);
  }) // Chạy khi thành công
  .catch((error) => {
    console.log(`Catch error: ${error}`);
  }); // Chạy khi thất bại
```

Sau đó bộ điều khiển có thể được dùng để thay đổi mức ưu tiên

```js
// Thay đổi mức ưu tiên thành 'background' bằng bộ điều khiển
controller.setPriority("background");
```

Các ví dụ bổ sung, bao gồm cách xử lý sự kiện xuất hiện từ việc thay đổi mức ưu tiên, có thể tìm thấy tại: [Prioritized Task Scheduling API > Ví dụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#examples).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
