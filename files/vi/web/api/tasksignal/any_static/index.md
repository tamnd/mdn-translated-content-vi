---
title: "TaskSignal: phương thức tĩnh any()"
short-title: any()
slug: Web/API/TaskSignal/any_static
page-type: web-api-static-method
browser-compat: api.TaskSignal.any_static
---

{{APIRef("Prioritized Task Scheduling API")}}{{AvailableInWorkers}}

Phương thức tĩnh **`TaskSignal.any()`** nhận một iterable các đối tượng {{domxref("AbortSignal")}} và trả về một {{domxref("TaskSignal")}}. Tín hiệu tác vụ được trả về bị hủy khi bất kỳ tín hiệu hủy nào bị hủy.

Khi tín hiệu tác vụ bị hủy, thuộc tính {{domxref("AbortSignal.reason", "reason")}} của nó sẽ được đặt thành lý do của tín hiệu đầu tiên bị hủy.

## Cú pháp

```js-nolint
TaskSignal.any(signals)
TaskSignal.any(signals, init)
```

### Tham số

- `signals`
  - : Một [iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol) (chẳng hạn như {{jsxref("Array")}}) của các tín hiệu hủy.
- `init` {{optional_inline}}
  - : Chứa các tham số cấu hình tùy chọn. Hiện tại chỉ có một thuộc tính được định nghĩa:
    - `priority` {{optional_inline}}
      - : Một trong các giá trị sau:
        - Chuỗi [ưu tiên](/en-US/docs/Web/API/Prioritized_Task_Scheduling_API#task_priorities) là một trong `user-blocking`, `user-visible` và `background`.
        - Một {{domxref("TaskSignal")}}.

### Giá trị trả về

Một phiên bản `TaskSignal`. Nó sẽ bị hủy khi tín hiệu đầu tiên được truyền vào `signals` bị hủy. Khi điều này xảy ra:

- Thuộc tính {{domxref("AbortSignal.reason", "reason")}} của nó sẽ được đặt thành lý do của tín hiệu đã gây ra tín hiệu này bị hủy.
- Thuộc tính {{domxref("TaskSignal.priority", "priority")}} của nó sẽ được xác định bởi tham số `priority`.

## Ví dụ

### Sử dụng `TaskSignal.any()`

Ví dụ này trình bày kết hợp cả tín hiệu từ {{domxref("TaskController")}} và tín hiệu timeout từ {{domxref("AbortSignal/timeout_static", "TaskSignal.timeout()")}}.

```js
const cancelDownloadButton = document.getElementById("cancelDownloadButton");

const userCancelController = new TaskController({
  priority: "user-visible",
});

cancelDownloadButton.addEventListener("click", () => {
  userCancelController.abort();
});

// Timeout after 5 minutes
const timeoutSignal = TaskSignal.timeout(1_000 * 60 * 5);

// This signal will abort when either the user clicks the cancel button or 5 minutes is up whichever is sooner
const combinedSignal = TaskSignal.any([
  userCancelController.signal,
  timeoutSignal,
]);

try {
  const res = await fetch(someUrlToDownload, {
    // Stop the fetch when any of the
    signal: combinedSignal,
  });
  const body = await res.blob();
  // Do something with downloaded content
  // …
} catch (e) {
  if (e.name === "AbortError") {
    // Cancelled by the user
  } else if (e.name === "TimeoutError") {
    // Show user that download timed out
  } else {
    // Other error, e.g. network error
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("AbortSignal/any_static", "AbortSignal.any()")}}
