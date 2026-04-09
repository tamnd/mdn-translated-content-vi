---
title: "AbortSignal: phương thức throwIfAborted()"
short-title: throwIfAborted()
slug: Web/API/AbortSignal/throwIfAborted
page-type: web-api-instance-method
browser-compat: api.AbortSignal.throwIfAborted
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Phương thức **`throwIfAborted()`** ném ra {{domxref("AbortSignal.reason", "reason")}} hủy của tín hiệu nếu tín hiệu đã bị hủy; nếu không, nó không làm gì cả.

Một API cần hỗ trợ khả năng hủy có thể chấp nhận một đối tượng {{domxref("AbortSignal")}} và dùng `throwIfAborted()` để kiểm tra rồi ném lỗi khi sự kiện [`abort`](/en-US/docs/Web/API/AbortSignal/abort_event) được phát tín hiệu.

Phương thức này cũng có thể được dùng để hủy thao tác tại những điểm cụ thể trong mã, thay vì truyền tín hiệu vào các hàm nhận một tín hiệu.

## Cú pháp

```js-nolint
throwIfAborted()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Các ví dụ dưới đây lấy từ đặc tả.

### Hủy một thao tác thăm dò

Ví dụ này minh họa cách bạn có thể dùng `throwIfAborted()` để hủy một thao tác thăm dò.

Hãy xét một hàm bất đồng bộ `waitForCondition()` được gọi với một hàm bất đồng bộ khác là `func`, một giá trị đích `targetValue` và một `AbortSignal`. Phương thức này so sánh kết quả của `func` với `targetValue` trong một vòng lặp và trả về khi chúng khớp.

```js
async function waitForCondition(func, targetValue, { signal } = {}) {
  while (true) {
    signal?.throwIfAborted();

    const result = await func();
    if (result === targetValue) {
      return;
    }
  }
}
```

Ở mỗi vòng lặp, chúng ta dùng `throwIfAborted()` để ném ra `reason` của tín hiệu nếu thao tác đã bị hủy, còn nếu không thì không làm gì cả. Nếu tín hiệu bị hủy, điều này sẽ khiến promise `waitForCondition()` bị từ chối.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Fetch API](/en-US/docs/Web/API/Fetch_API)
