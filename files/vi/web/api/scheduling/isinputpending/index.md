---
title: "Scheduling: phương thức isInputPending()"
short-title: isInputPending()
slug: Web/API/Scheduling/isInputPending
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.Scheduling.isInputPending
---

{{SeeCompatTable}}{{APIRef("Prioritized Task Scheduling API")}}

Phương thức **`isInputPending()`** của giao diện {{domxref("Scheduling")}} cho phép bạn kiểm tra xem có sự kiện đầu vào đang chờ trong hàng đợi sự kiện không, cho biết người dùng đang cố gắng tương tác với trang.

Tính năng này có thể hữu ích trong các tình huống bạn có hàng đợi tác vụ cần chạy và bạn muốn nhường quyền cho luồng chính thường xuyên để cho phép tương tác người dùng xảy ra, giúp ứng dụng luôn phản hồi và có hiệu suất tốt nhất có thể. `isInputPending()` cho phép bạn chỉ nhường quyền khi có đầu vào đang chờ, thay vì phải làm vậy theo các khoảng thời gian tùy ý.

> [!WARNING]
> Phương thức `isInputPending()` đã được thay thế bởi các tính năng có sẵn trên giao diện {{domxref("Scheduler")}} như {{domxref("Scheduler.yield()", "yield()")}}, được thiết kế tốt hơn để giải quyết các tác vụ lập lịch. Xem [Don't use `isInputPending()`](https://web.dev/articles/optimize-long-tasks#isinputpending) để biết thêm chi tiết.

`isInputPending()` được gọi bằng `navigator.scheduling.isInputPending()`.

## Cú pháp

```js-nolint
isInputPending()
isInputPending(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Đối tượng cung cấp các tùy chọn. Hiện tại, tùy chọn duy nhất là:
    - `includeContinuous` {{optional_inline}}
      - : Giá trị boolean, mặc định là `false`. Nếu đặt thành `true`, cho biết các sự kiện liên tục nên được xem xét khi kiểm tra đầu vào đang chờ. Sự kiện liên tục là các sự kiện đáng tin cậy (sự kiện được gửi bởi trình duyệt) được kích hoạt liên tiếp, như {{domxref("Element/mousemove_event", "mousemove")}}, {{domxref("Element/wheel_event", "wheel")}}, {{domxref("Element/touchmove_event", "touchmove")}}, {{domxref("HTMLElement/drag_event", "drag")}}, {{domxref("Element/pointermove_event", "pointermove")}}, và {{domxref("Element/pointerrawupdate_event", "pointerrawupdate")}}.

### Giá trị trả về

Giá trị boolean cho biết có sự kiện đầu vào đang chờ trong hàng đợi sự kiện (`true`) hay không (`false`).

## Ví dụ

Chúng ta có thể sử dụng `isInputPending()` bên trong cấu trúc task runner để chạy hàm `yield()` chỉ khi người dùng đang cố gắng tương tác với trang:

```js
function yield() {
  return new Promise((resolve) => {
    setTimeout(resolve, 0);
  });
}

async function main() {
  // Tạo mảng các hàm cần chạy
  const tasks = [a, b, c, d, e];

  while (tasks.length > 0) {
    // Nhường quyền cho đầu vào người dùng đang chờ
    if (navigator.scheduling.isInputPending()) {
      await yield();
    } else {
      // Lấy tác vụ đầu tiên ra khỏi mảng tác vụ
      const task = tasks.shift();

      // Chạy tác vụ
      task();
    }
  }
}
```

Điều này cho phép bạn tránh chặn luồng chính khi người dùng đang tích cực tương tác với trang, có thể cung cấp trải nghiệm người dùng mượt mà hơn. Tuy nhiên, bằng cách chỉ nhường quyền khi cần thiết, chúng ta có thể tiếp tục chạy tác vụ hiện tại khi không có đầu vào người dùng nào cần xử lý.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{domxref("Scheduler")}}
- {{domxref("Prioritized_task_scheduling_api", "Prioritized Task Scheduling API", "", "nocode")}}
- [Faster input events with Facebook's first browser API contribution](https://engineering.fb.com/2019/04/22/developer-tools/isinputpending-api/) trên engineering.fb.com (2019)
- [Better JS scheduling with isInputPending()](https://developer.chrome.com/docs/capabilities/web-apis/isinputpending) trên developer.chrome.com (2020)
- [Optimizing long tasks](https://web.dev/articles/optimize-long-tasks#yield_only_when_necessary) trên web.dev (2022)
