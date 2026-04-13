---
title: "PerformanceObserver: constructor PerformanceObserver()"
short-title: PerformanceObserver()
slug: Web/API/PerformanceObserver/PerformanceObserver
page-type: web-api-constructor
browser-compat: api.PerformanceObserver.PerformanceObserver
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Constructor **`PerformanceObserver()`** tạo một đối tượng {{domxref("PerformanceObserver")}} mới với `callback` observer đã cho. Callback observer sẽ được gọi khi các {{domxref("PerformanceEntry","sự kiện performance entry", '', 'true')}} được ghi nhận cho các {{domxref("PerformanceEntry.entryType","kiểu entry",'','true')}} đã được đăng ký qua phương thức {{domxref("PerformanceObserver.observe","observe()")}}.

## Cú pháp

```js-nolint
new PerformanceObserver(callback)
```

### Tham số

- `callback`
  - : Một callback `PerformanceObserverCallback` sẽ được gọi khi các sự kiện performance được quan sát ghi nhận. Khi callback được gọi, các tham số sau sẽ có sẵn:
    - `entries`
      - : {{domxref("PerformanceObserverEntryList","Danh sách các performance observer entry", '', 'true')}}.
    - `observer`
      - : Đối tượng {{domxref("PerformanceObserver","observer")}} đang nhận các entry trên.
    - `options`
      - : Một đối tượng với các thuộc tính sau:
        - `droppedEntriesCount`
          - : Số lượng entry không thể ghi nhận vì bộ đệm nội bộ của đối tượng {{domxref("Performance")}} đã đầy.

            Lưu ý rằng giá trị này chỉ được cung cấp lần đầu tiên khi observer gọi callback, khi các entry đã lưu đệm được phát lại. Một khi observer bắt đầu thực hiện các quan sát trong tương lai, nó không còn cần dùng bộ đệm nữa. Sau lần đầu tiên, `options` sẽ là một đối tượng rỗng (`{}`).

### Giá trị trả về

Một đối tượng {{domxref("PerformanceObserver")}} mới sẽ gọi `callback` đã chỉ định khi các sự kiện performance được quan sát xảy ra.

## Ví dụ

### Tạo một PerformanceObserver

Ví dụ sau tạo một `PerformanceObserver` để theo dõi các sự kiện "mark" ({{domxref("PerformanceMark")}}) và "measure" ({{domxref("PerformanceMeasure")}}).
Hàm callback `perfObserver` cung cấp một `list` ({{domxref("PerformanceObserverEntryList")}}) cho phép bạn lấy các performance entry đã được quan sát.

```js
function perfObserver(list, observer) {
  list.getEntries().forEach((entry) => {
    if (entry.entryType === "mark") {
      console.log(`${entry.name}'s startTime: ${entry.startTime}`);
    }
    if (entry.entryType === "measure") {
      console.log(`${entry.name}'s duration: ${entry.duration}`);
    }
  });
}
const observer = new PerformanceObserver(perfObserver);
observer.observe({ entryTypes: ["measure", "mark"] });
```

### Các entry bị loại bỏ trong bộ đệm

Bạn có thể dùng {{domxref("PerformanceObserver")}} với cờ `buffered` để lắng nghe các performance entry trong quá khứ.
Tuy nhiên, có một giới hạn về kích thước bộ đệm. Callback của performance observer chứa một đối tượng `options`: lần đầu tiên observer gọi callback, tham số `options` sẽ có một thuộc tính `droppedEntriesCount` cho biết có bao nhiêu entry đã bị loại bỏ do bộ đệm lưu trữ đã đầy. Các callback tiếp theo sẽ có tham số `options` rỗng.

```js
function perfObserver(list, observer, options) {
  list.getEntries().forEach((entry) => {
    // xử lý các entry
  });
  if (options?.droppedEntriesCount > 0) {
    console.warn(
      `${options?.droppedEntriesCount} entries đã bị loại bỏ do bộ đệm đã đầy.`,
    );
  }
}

const observer = new PerformanceObserver(perfObserver);
observer.observe({ type: "resource", buffered: true });
```

Thông thường, có rất nhiều entry resource timing, và riêng với các entry này, bạn cũng có thể đặt bộ đệm lớn hơn bằng {{domxref("performance.setResourceTimingBufferSize()")}} và theo dõi sự kiện {{domxref("Performance/resourcetimingbufferfull_event", "resourcetimingbufferfull")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
