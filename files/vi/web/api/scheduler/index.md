---
title: Scheduler
slug: Web/API/Scheduler
page-type: web-api-interface
browser-compat: api.Scheduler
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Giao diện **`Scheduler`** của [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API) cung cấp các phương thức để lập lịch các tác vụ có độ ưu tiên.

Một `Scheduler` có thể được truy cập từ đối tượng toàn cục bằng {{domxref("Window.scheduler")}} hoặc {{domxref("WorkerGlobalScope.scheduler")}} trong worker.

## Thuộc tính instance

Không có.

## Phương thức instance

- {{domxref('Scheduler.postTask()')}}
  - : Thêm một tác vụ vào bộ lập lịch dưới dạng hàm gọi lại, tùy chọn chỉ định độ ưu tiên, độ trễ và/hoặc tín hiệu để hủy tác vụ.
- {{domxref('Scheduler.yield()')}}
  - : Nhường quyền kiểm soát luồng chính lại cho trình duyệt, trả về một promise sẽ được giải quyết để tiếp tục thực thi từ nơi đã dừng.

## Ví dụ

Nếu tính năng được định nghĩa, một instance của đối tượng này sẽ được trả về bởi thuộc tính {{jsxref("globalThis")}} cả trong worker và luồng chính.

Đoạn mã dưới đây hiển thị một tác vụ đơn giản resolve với văn bản 'Task executing'.
Văn bản này được ghi log khi thành công.
Đoạn mã cũng hiển thị khối `catch`, khối này sẽ cần thiết trong mã phức tạp hơn để xử lý khi tác vụ bị hủy hoặc ném lỗi.

```js
if ("scheduler" in this) {
  // Post task with default priority: 'user-visible' (no other options)
  // When the task resolves, Promise.then() logs the result.
  scheduler
    .postTask(() => "Task executing")
    .then((taskResult) => console.log(`${taskResult}`)) // Log result
    .catch((error) => console.error(`Error: ${error}`)); // Log errors
}
```

Để biết mã ví dụ toàn diện hơn, xem [Prioritized Task Scheduling API > Ví dụ](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#examples).

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
