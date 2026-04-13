---
title: "PerformanceResourceTiming: firstInterimResponseStart property"
short-title: firstInterimResponseStart
slug: Web/API/PerformanceResourceTiming/firstInterimResponseStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.firstInterimResponseStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`firstInterimResponseStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay sau khi trình duyệt nhận byte đầu tiên của phản hồi tạm thời 1xx (ví dụ 100 Continue hoặc 103 Early Hints) từ máy chủ.

Không có thuộc tính _end_ cho `firstInterimResponseStart`.

## Giá trị

Thuộc tính `firstInterimResponseStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} ngay sau khi trình duyệt nhận byte tạm thời đầu tiên của phản hồi từ máy chủ.
- `0` nếu tài nguyên không gửi phản hồi tạm thời nào.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

> [!NOTE]
> Vì Early Hints thường chỉ được hỗ trợ trên yêu cầu điều hướng chính, mà theo định nghĩa là cùng origin, giá trị `0` thường chỉ ra rằng Early Hints **không** được dùng.

Khi `firstInterimResponseStart` khác 0, điều đó cho thấy nó phải có cùng giá trị với {{domxref("PerformanceResourceTiming.requestStart", "requestStart")}} đối với [các trình duyệt hỗ trợ](#browser_compatibility).

## Ví dụ

### Đo thời gian yêu cầu

Các thuộc tính `firstInterimResponseStart` và `requestStart` có thể dùng để đo xem trình duyệt mất bao lâu để nhận phản hồi tạm thời sau khi gửi yêu cầu.

```js
const request = entry.firstInterimResponseStart - entry.requestStart;
```

Ví dụ sau dùng {{domxref("PerformanceObserver")}} để thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Tùy chọn `buffered` được dùng để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const request = entry.firstInterimResponseStart - entry.requestStart;
    if (request > 0) {
      console.log(`${entry.name}: Interim response time: ${request}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ sau dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này.

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const request = entry.firstInterimResponseStart - entry.requestStart;
  if (request > 0) {
    console.log(`${entry.name}: Interim response time: ${request}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `firstInterimResponseStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem timing tài nguyên, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Timing-Allow-Origin")}}
- {{domxref("PerformanceResourceTiming.finalResponseHeadersStart", "finalResponseHeadersStart")}}
