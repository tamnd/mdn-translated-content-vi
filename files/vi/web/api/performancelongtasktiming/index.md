---
title: PerformanceLongTaskTiming
slug: Web/API/PerformanceLongTaskTiming
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PerformanceLongTaskTiming
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Giao diện **`PerformanceLongTaskTiming`** cung cấp thông tin về các tác vụ chiếm luồng giao diện người dùng trong 50 mili giây hoặc hơn.

## Mô tả

Các tác vụ dài chặn luồng chính trong 50ms hoặc hơn gây ra, trong số các vấn đề khác:

- {{glossary("Time to interactive")}} (TTI) bị trì hoãn.
- Độ trễ đầu vào cao/biến thiên.
- Độ trễ xử lý sự kiện cao/biến thiên.
- Hoạt hình và cuộn bị giật.

Một tác vụ dài là bất kỳ khoảng thời gian liên tục nào mà luồng giao diện người dùng chính bận rộn trong 50ms hoặc lâu hơn. Các ví dụ phổ biến bao gồm:

- Các trình xử lý sự kiện chạy lâu.
- Reflow và re-render tốn kém.
- Công việc trình duyệt thực hiện giữa các vòng lặp sự kiện khác nhau vượt quá 50ms.

`PerformanceLongTaskTiming` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau cho các loại mục nhập hiệu suất long task timing bằng cách xác định chúng như sau:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian đã trôi qua giữa điểm bắt đầu và kết thúc của tác vụ, với độ chính xác 1ms.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `"longtask"`
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một trong các chuỗi sau đây tham chiếu đến ngữ cảnh duyệt web hoặc frame có thể được gán cho tác vụ dài.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian khi tác vụ bắt đầu.

Giao diện này cũng hỗ trợ các thuộc tính sau:

- {{domxref("PerformanceLongTaskTiming.attribution")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi các phiên bản {{domxref('TaskAttributionTiming')}}.

## Phương thức phiên bản

- {{domxref("PerformanceLongTaskTiming.toJSON()")}} {{Experimental_Inline}}
  - : Trả về một biểu diễn JSON của đối tượng `PerformanceLongTaskTiming`.

## Ví dụ

### Lấy các tác vụ dài

Để lấy thông tin timing tác vụ dài, hãy tạo một phiên bản {{domxref("PerformanceObserver")}} và sau đó gọi phương thức [`observe()`](/en-US/docs/Web/API/PerformanceObserver/observe) của nó, truyền `"longtask"` làm giá trị của tùy chọn [`type`](/en-US/docs/Web/API/PerformanceEntry/entryType).

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    console.log(entry);
  });
});

observer.observe({ type: "longtask", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("TaskAttributionTiming")}}
