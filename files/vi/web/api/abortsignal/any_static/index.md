---
title: "AbortSignal: phương thức tĩnh any()"
short-title: any()
slug: Web/API/AbortSignal/any_static
page-type: web-api-static-method
browser-compat: api.AbortSignal.any_static
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức tĩnh **`AbortSignal.any()`** nhận một đối tượng có thể lặp gồm các tín hiệu hủy và trả về một {{domxref("AbortSignal")}}. Tín hiệu hủy được trả về sẽ bị hủy khi bất kỳ tín hiệu hủy nào trong đầu vào bị hủy. {{domxref("AbortSignal.reason", "Lý do hủy", "", "true")}} sẽ được đặt thành lý do của tín hiệu đầu tiên bị hủy. Nếu bất kỳ tín hiệu hủy nào đã cho đã bị hủy sẵn, thì {{domxref("AbortSignal")}} được trả về cũng sẽ ở trạng thái bị hủy.

## Cú pháp

```js-nolint
AbortSignal.any(iterable)
```

### Tham số

- `iterable`
  - : Một đối tượng [có thể lặp](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols#the_iterable_protocol), chẳng hạn như {{jsxref("Array")}}, chứa các tín hiệu hủy.

### Giá trị trả về

Một {{domxref("AbortSignal")}} có thể ở một trong các trạng thái sau:

- **Đã bị hủy sẵn**, nếu bất kỳ tín hiệu hủy nào được truyền vào đã bị hủy. `reason` của {{domxref("AbortSignal")}} được trả về sẽ được đặt sẵn thành {{domxref("AbortSignal.reason", "reason")}} của tín hiệu hủy đầu tiên vốn đã bị hủy.
- **Bị hủy bất đồng bộ**, khi bất kỳ tín hiệu hủy nào trong `iterable` bị hủy. {{domxref("AbortSignal.reason", "reason")}} sẽ được đặt thành lý do của tín hiệu đầu tiên bị hủy.

## Ví dụ

### Dùng `AbortSignal.any()`

Ví dụ này minh họa cách kết hợp cả một tín hiệu từ {{domxref("AbortController")}} và một tín hiệu hết thời gian chờ từ {{domxref("AbortSignal/timeout_static", "AbortSignal.timeout")}}.

```js
const cancelDownloadButton = document.getElementById("cancelDownloadButton");

const userCancelController = new AbortController();

cancelDownloadButton.addEventListener("click", () => {
  userCancelController.abort();
});

// Timeout after 5 minutes
const timeoutSignal = AbortSignal.timeout(1_000 * 60 * 5);

// This signal will abort when either the user clicks the cancel button or 5 minutes is up
// whichever is sooner
const combinedSignal = AbortSignal.any([
  userCancelController.signal,
  timeoutSignal,
]);

try {
  const res = await fetch(someUrlToDownload, {
    // Stop the fetch when any of the signals aborts
    signal: combinedSignal,
  });
  const body = await res.blob();
  // Do something with downloaded content:
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
