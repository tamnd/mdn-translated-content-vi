---
title: PerformancePaintTiming
slug: Web/API/PerformancePaintTiming
page-type: web-api-interface
browser-compat: api.PerformancePaintTiming
---

{{APIRef("Performance API")}}

Giao diện **`PerformancePaintTiming`** cung cấp thông tin thời gian về các thao tác "paint" (còn được gọi là "render") trong quá trình xây dựng trang web. "Paint" là quá trình chuyển đổi cây render thành các pixel trên màn hình.

API này cung cấp hai thời điểm paint quan trọng:

- {{Glossary("First Paint")}} (FP): Thời gian khi bất kỳ thứ gì được render. Lưu ý rằng việc đánh dấu first paint là tùy chọn, không phải tất cả các user agent đều báo cáo nó.
- {{Glossary("First Contentful Paint")}} (FCP): Thời gian khi bit đầu tiên của văn bản DOM hoặc nội dung hình ảnh được render.

Một thời điểm paint quan trọng thứ ba được cung cấp bởi API {{domxref("LargestContentfulPaint")}}:

- {{Glossary("Largest Contentful Paint")}} (LCP): Thời gian render của hình ảnh hoặc khối văn bản lớn nhất hiển thị trong viewport, được ghi từ khi trang bắt đầu tải.

Dữ liệu mà API này cung cấp giúp bạn giảm thiểu thời gian người dùng phải chờ trước khi thấy nội dung của trang bắt đầu xuất hiện. Giảm thời gian đến các thời điểm paint quan trọng này giúp các trang web cảm thấy phản hồi nhanh hơn, hiệu suất cao hơn và hấp dẫn hơn với người dùng.

Giống như các Performance API khác, API này mở rộng {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này định nghĩa trực tiếp các thuộc tính sau:

- {{domxref("PerformancePaintTiming.paintTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi giai đoạn rendering kết thúc và giai đoạn paint bắt đầu.
- {{domxref("PerformancePaintTiming.presentationTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi các pixel đã paint thực sự được vẽ lên màn hình.

Nó cũng mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau, đủ điều kiện và ràng buộc chúng như được mô tả:

- {{domxref("PerformanceEntry.entryType")}}
  - : Trả về `"paint"`.
- {{domxref("PerformanceEntry.name")}}
  - : Trả về `"first-paint"` hoặc `"first-contentful-paint"`.
- {{domxref("PerformanceEntry.startTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi quá trình paint xảy ra.
- {{domxref("PerformanceEntry.duration")}}
  - : Trả về 0.

## Phương thức phiên bản

- {{domxref("PerformancePaintTiming.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `PerformancePaintTiming`.

## Ví dụ

### Lấy thời gian paint cơ bản

Ví dụ sử dụng {{domxref("PerformanceObserver")}}, thông báo về các mục hiệu suất `paint` mới khi chúng được ghi lại trong timeline hiệu suất của trình duyệt. Sử dụng tùy chọn `buffered` để truy cập các mục trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(
      `The time to ${entry.name} was ${entry.startTime} milliseconds.`,
    );
    // Logs "The time to first-paint was 386.7999999523163 milliseconds."
    // Logs "The time to first-contentful-paint was 400.6999999284744 milliseconds."
  });
});

observer.observe({ type: "paint", buffered: true });
```

Ví dụ sử dụng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các mục hiệu suất `paint` có trong timeline hiệu suất của trình duyệt tại thời điểm bạn gọi phương thức này:

```js
const entries = performance.getEntriesByType("paint");
entries.forEach((entry) => {
  console.log(`The time to ${entry.name} was ${entry.startTime} milliseconds.`);
  // Logs "The time to first-paint was 386.7999999523163 milliseconds."
  // Logs "The time to first-contentful-paint was 400.6999999284744 milliseconds."
});
```

### Lấy thời gian paint và presentation riêng biệt

Các thuộc tính `paintTime` và `presentationTime` cho phép bạn lấy thời gian cụ thể cho khi giai đoạn paint bắt đầu và khi các pixel đã paint được vẽ lên màn hình. `paintTime` có thể tương thích rộng rãi, trong khi `presentationTime` phụ thuộc vào triển khai.

Ví dụ này dựa trên ví dụ {{domxref("Performance.getEntriesByType()")}} trước đó, cho thấy cách kiểm tra hỗ trợ `paintTime` và `presentationTime` và lấy các giá trị đó nếu chúng có sẵn. Trong các trình duyệt không hỗ trợ, code lấy `loadTime`.

```js
const entries = performance.getEntriesByType("paint");
entries.forEach((entry) => {
  if (entry.presentationTime) {
    console.log(
      "paintTime:",
      entry.paintTime,
      "presentationTime:",
      entry.presentationTime,
    );
  } else if (entry.paintTime) {
    console.log("paintTime:", entry.paintTime);
  } else {
    console.log("loadTime", entry.loadTime);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

### Xem thêm

- {{domxref("LargestContentfulPaint")}}
