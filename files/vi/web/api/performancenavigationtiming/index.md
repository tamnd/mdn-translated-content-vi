---
title: PerformanceNavigationTiming
slug: Web/API/PerformanceNavigationTiming
page-type: web-api-interface
browser-compat: api.PerformanceNavigationTiming
---

{{APIRef("Performance API")}}

Giao diện **`PerformanceNavigationTiming`** cung cấp các phương thức và thuộc tính để lưu trữ và truy xuất số liệu về các sự kiện điều hướng tài liệu của trình duyệt. Ví dụ, giao diện này có thể được dùng để xác định cần bao lâu để tải hoặc dỡ một tài liệu.

Chỉ tài liệu hiện tại được bao gồm trong performance timeline, vì vậy chỉ có một đối tượng `PerformanceNavigationTiming` trong performance timeline. Nó kế thừa tất cả các thuộc tính và phương thức của {{domxref("PerformanceResourceTiming")}} và {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

Sơ đồ sau cho thấy toàn bộ các thuộc tính timestamp được định nghĩa trong `PerformanceNavigationTiming`.

![Timestamp diagram listing timestamps in the order in which they are recorded for the fetching of a document](https://mdn.github.io/shared-assets/images/diagrams/api/performance/timestamp-diagram.svg)

## Thuộc tính thể hiện

Giao diện này mở rộng các thuộc tính {{domxref('PerformanceEntry')}} sau đây bằng cách giới hạn và ràng buộc chúng như sau:

- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}}
  - : Trả về `"navigation"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}}
  - : Trả về [URL của tài liệu](/en-US/docs/Web/API/Document/URL).
    Lưu ý rằng [text fragments](/en-US/docs/Web/URI/Reference/Fragment/Text_fragments) và mọi chỉ dẫn fragment khác sẽ bị loại khỏi URL.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} có giá trị `0`.
- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp","timestamp")}} là hiệu số giữa các thuộc tính {{domxref("PerformanceNavigationTiming.loadEventEnd")}} và {{domxref("PerformanceEntry.startTime")}}.

Giao diện này cũng mở rộng các thuộc tính {{domxref('PerformanceResourceTiming')}} sau đây bằng cách giới hạn và ràng buộc chúng như sau:

- {{domxref('PerformanceResourceTiming.initiatorType')}} {{ReadOnlyInline}}
  - : Trả về `"navigation"`.

Giao diện cũng hỗ trợ các thuộc tính sau:

- {{domxref('PerformanceNavigationTiming.activationStart')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị khoảng thời gian giữa lúc tài liệu bắt đầu prerendering và lúc nó được kích hoạt.
- {{domxref('PerformanceNavigationTiming.criticalCHRestart')}} {{ReadOnlyInline}} {{experimental_inline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm kết nối được khởi động lại do không khớp với tiêu đề phản hồi HTTP {{HTTPHeader("Critical-CH")}}.
- {{domxref('PerformanceNavigationTiming.domComplete')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"complete"`.
- {{domxref('PerformanceNavigationTiming.domContentLoadedEventEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại hoàn tất.
- {{domxref('PerformanceNavigationTiming.domContentLoadedEventStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình xử lý sự kiện [`DOMContentLoaded`](/en-US/docs/Web/API/Document/DOMContentLoaded_event) của tài liệu hiện tại bắt đầu.
- {{domxref('PerformanceNavigationTiming.domInteractive')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi tác nhân người dùng đặt [`readyState`](/en-US/docs/Web/API/Document/readyState) của tài liệu thành `"interactive"`.
- {{domxref('PerformanceNavigationTiming.loadEventEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`load`](/en-US/docs/Web/API/Window/load_event) của tài liệu hiện tại hoàn tất.
- {{domxref('PerformanceNavigationTiming.loadEventStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình xử lý sự kiện [`load`](/en-US/docs/Web/API/Window/load_event) của tài liệu hiện tại bắt đầu.
- {{domxref('PerformanceNavigationTiming.notRestoredReasons')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Một đối tượng {{domxref("NotRestoredReasons")}} cung cấp dữ liệu báo cáo về lý do tài liệu hiện tại bị chặn không cho dùng back/forward cache ({{Glossary("bfcache")}}) khi điều hướng.
- {{domxref('PerformanceNavigationTiming.redirectCount')}} {{ReadOnlyInline}}
  - : Một số biểu thị số lần chuyển hướng kể từ lần điều hướng không phải chuyển hướng gần nhất trong ngữ cảnh duyệt hiện tại.
- {{domxref('PerformanceNavigationTiming.type')}} {{ReadOnlyInline}}
  - : Một chuỗi biểu thị kiểu điều hướng. Có thể là `"navigate"`, `"reload"`, hoặc `"back_forward"`.
- {{domxref('PerformanceNavigationTiming.unloadEventEnd')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình xử lý sự kiện [`unload`](/en-US/docs/Web/API/Window/unload_event) của tài liệu hiện tại hoàn tất.
- {{domxref('PerformanceNavigationTiming.unloadEventStart')}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình xử lý sự kiện [`unload`](/en-US/docs/Web/API/Window/unload_event) của tài liệu hiện tại bắt đầu.

## Phương thức thể hiện

- {{domxref("PerformanceNavigationTiming.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceNavigationTiming`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Performance.navigation")}}
- {{domxref("PerformanceNavigation")}}
