---
title: TaskSignal
slug: Web/API/TaskSignal
page-type: web-api-interface
browser-compat: api.TaskSignal
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Giao diện **`TaskSignal`** của [Prioritized Task Scheduling API](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API) đại diện cho đối tượng tín hiệu cho phép bạn giao tiếp với tác vụ có ưu tiên, và hủy nó hoặc thay đổi [ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) (nếu cần) thông qua đối tượng {{domxref('TaskController')}}.

Đối tượng thuộc loại này được tạo ra và liên kết với {{domxref('TaskController')}}.
Ưu tiên ban đầu của tín hiệu có thể được đặt bằng cách chỉ định nó như một đối số cho hàm khởi tạo {{domxref("TaskController.TaskController", "TaskController()")}} (mặc định là `"user-visible"`).
Ưu tiên có thể được thay đổi bằng cách gọi {{domxref("TaskController.setPriority()")}} trên bộ điều khiển.

Tín hiệu có thể được truyền như đối số `options.signal` trong {{domxref("Scheduler.postTask()")}}, sau đó bộ điều khiển liên quan có thể được sử dụng để hủy tác vụ.
Nếu [ưu tiên tác vụ có thể thay đổi](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#mutable_and_immutable_task_priority), bộ điều khiển cũng có thể được sử dụng để thay đổi ưu tiên của tác vụ.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `TaskSignal` cũng kế thừa các thuộc tính từ giao diện cha {{domxref("AbortSignal")}}._

- {{domxref('TaskSignal.priority')}} {{ReadOnlyInline}}
  - : Trả về ưu tiên của tín hiệu.

## Phương thức tĩnh

_Giao diện `TaskSignal` kế thừa các phương thức từ giao diện cha {{domxref("AbortSignal")}}._

- {{domxref("TaskSignal/any_static", "TaskSignal.any()")}}
  - : Trả về **`TaskSignal`** bị hủy khi bất kỳ tín hiệu hủy nào đã cho bị hủy.

## Phương thức phiên bản

_Giao diện `TaskSignal` kế thừa các phương thức từ giao diện cha {{domxref("AbortSignal")}}._

## Sự kiện

Lắng nghe các sự kiện này bằng cách sử dụng {{domxref("EventTarget.addEventListener()", "addEventListener()")}} hoặc bằng cách gán trình lắng nghe sự kiện vào thuộc tính `oneventname` của giao diện này.

- {{domxref("TaskSignal/prioritychange_event", "prioritychange")}}
  - : Được kích hoạt khi ưu tiên thay đổi.
    Điều này được kích hoạt bằng cách gọi {{domxref('TaskController.setPriority()')}} trên bộ điều khiển liên quan.

## Ví dụ

Các ví dụ về cách `TaskSignal` được tạo và sử dụng để ưu tiên và hủy các tác vụ có thể được tìm thấy ở đây:

- [Prioritized Task Scheduling API > Examples](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#examples)
- [`TaskController` > Examples](/en-US/docs/Web/API/TaskController#examples)
- [`TaskSignal: prioritychange` event > Examples](/en-US/docs/Web/API/TaskSignal/prioritychange_event#examples)

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
