---
title: "PerformanceResourceTiming: redirectStart property"
short-title: redirectStart
slug: Web/API/PerformanceResourceTiming/redirectStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.redirectStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`redirectStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} biểu thị thời điểm bắt đầu của lần tìm nạp khởi tạo chuyển hướng.

Nếu có chuyển hướng HTTP khi tìm nạp tài nguyên và bất kỳ chuyển hướng nào không cùng origin với tài liệu hiện tại, nhưng thuật toán kiểm tra timing allow thành công cho từng tài nguyên được chuyển hướng, thuộc tính này trả về thời điểm bắt đầu của lần tìm nạp khởi tạo chuyển hướng; nếu không, trả về 0.

Để lấy số lần chuyển hướng, xem thêm {{domxref("PerformanceNavigationTiming.redirectCount")}}.

## Giá trị

Thuộc tính `redirectStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp","timestamp")}} biểu thị thời điểm bắt đầu của lần tìm nạp khởi tạo chuyển hướng.
- `0` nếu không có chuyển hướng.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian chuyển hướng

Các thuộc tính `redirectStart` và {{domxref("PerformanceResourceTiming.redirectEnd", "redirectEnd")}} có thể dùng để đo xem quá trình chuyển hướng mất bao lâu.

```js
const redirect = entry.redirectEnd - entry.redirectStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const redirect = entry.redirectEnd - entry.redirectStart;
    if (redirect > 0) {
      console.log(`${entry.name}: Redirect time: ${redirect}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const redirect = entry.redirectEnd - entry.redirectStart;
  if (redirect > 0) {
    console.log(`${entry.name}: Redirect time: ${redirect}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `redirectStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem timing tài nguyên, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceNavigationTiming.redirectCount")}}
- {{HTTPHeader("Timing-Allow-Origin")}}
