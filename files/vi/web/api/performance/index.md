---
title: Performance
slug: Web/API/Performance
page-type: web-api-interface
browser-compat: api.Performance
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Giao diện **`Performance`** cung cấp quyền truy cập vào thông tin liên quan đến hiệu năng của trang hiện tại.

Các performance entry là riêng cho từng ngữ cảnh thực thi. Bạn có thể truy cập thông tin hiệu năng cho mã chạy trong window thông qua {{domxref("Window.performance")}}, và cho mã chạy trong worker thông qua {{domxref("WorkerGlobalScope.performance")}}.

{{InheritanceDiagram}}

## Thuộc tính thể hiện

_Giao diện `Performance` không kế thừa thuộc tính nào._

- {{domxref("Performance.eventCounts")}} {{ReadOnlyInline}}
  - : Một bản đồ {{domxref("EventCounts")}} chứa số lượng sự kiện đã được phát ra theo từng kiểu sự kiện.
- {{domxref("Performance.interactionCount")}} {{ReadOnlyInline}}
  - : Số lượng tương tác thực của người dùng đã xảy ra trên trang, hữu ích khi tính {{Glossary("Interaction_to_next_paint", "Interaction to Next Paint (INP)")}}.
- {{domxref("Performance.navigation")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một đối tượng {{domxref("PerformanceNavigation")}} kiểu cũ, cung cấp ngữ cảnh hữu ích về các thao tác được tính trong các giá trị ở `timing`, bao gồm trang là tải mới hay làm mới, có bao nhiêu lần chuyển hướng, v.v.
- {{domxref("Performance.timing")}} {{ReadOnlyInline}} {{Deprecated_Inline}}
  - : Một đối tượng {{domxref("PerformanceTiming")}} kiểu cũ chứa thông tin hiệu năng liên quan đến độ trễ.
- {{domxref("Performance.memory")}} {{ReadOnlyInline}} {{Non-standard_Inline}} {{Deprecated_Inline}}
  - : Một phần mở rộng _không chuẩn_ được thêm trong Chrome, thuộc tính này cung cấp một đối tượng với thông tin sử dụng bộ nhớ cơ bản. _Bạn **không nên dùng** API không chuẩn này._
- {{domxref("Performance.timeOrigin")}} {{ReadOnlyInline}}
  - : Trả về dấu thời gian độ phân giải cao của thời điểm bắt đầu phép đo hiệu năng.

## Phương thức thể hiện

_Giao diện `Performance` không kế thừa phương thức nào._

- {{domxref("Performance.clearMarks()")}}
  - : Xóa dấu _mark_ đã cho khỏi bộ đệm entry hiệu năng của trình duyệt.
- {{domxref("Performance.clearMeasures()")}}
  - : Xóa dấu _measure_ đã cho khỏi bộ đệm entry hiệu năng của trình duyệt.
- {{domxref("Performance.clearResourceTimings()")}}
  - : Xóa tất cả [performance entries](/en-US/docs/Web/API/PerformanceEntry) có {{domxref("PerformanceEntry.entryType","entryType")}} là `"resource"` khỏi bộ đệm dữ liệu hiệu năng của trình duyệt.
- {{domxref("Performance.getEntries()")}}
  - : Trả về danh sách các đối tượng {{domxref("PerformanceEntry")}} dựa trên _bộ lọc_ đã cho.
- {{domxref("Performance.getEntriesByName()")}}
  - : Trả về danh sách các đối tượng {{domxref("PerformanceEntry")}} dựa trên _name_ và _entry type_ đã cho.
- {{domxref("Performance.getEntriesByType()")}}
  - : Trả về danh sách các đối tượng {{domxref("PerformanceEntry")}} có _entry type_ đã cho.
- {{domxref("Performance.mark()")}}
  - : Tạo một {{domxref("DOMHighResTimeStamp","timestamp")}} trong _performance entry buffer_ của trình duyệt với tên đã cho.
- {{domxref("Performance.measure()")}}
  - : Tạo một {{domxref("DOMHighResTimeStamp","timestamp")}} có tên trong bộ đệm performance entry của trình duyệt giữa hai mark được chỉ định (tương ứng gọi là _start mark_ và _end mark_).
- {{domxref("Performance.measureUserAgentSpecificMemory()")}} {{Experimental_Inline}}
  - : Ước tính mức sử dụng bộ nhớ của một ứng dụng web, bao gồm tất cả iframe và worker của nó.
- {{domxref("Performance.now()")}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} biểu thị số mili giây đã trôi qua kể từ một mốc tham chiếu.
- {{domxref("Performance.setResourceTimingBufferSize()")}}
  - : Đặt kích thước bộ đệm tài nguyên của trình duyệt thành số lượng đối tượng {{domxref("PerformanceEntry","PerformanceEntry")}} kiểu `"resource"` được chỉ định.
- {{domxref("Performance.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `Performance`.

## Sự kiện

Lắng nghe các sự kiện này bằng `addEventListener()` hoặc bằng cách gán một trình xử lý sự kiện cho thuộc tính `oneventname` của giao diện này.

- {{DOMxRef("Performance.resourcetimingbufferfull_event", "resourcetimingbufferfull")}}
  - : Được phát khi [bộ đệm resource timing](/en-US/docs/Web/API/Performance/setResourceTimingBufferSize) của trình duyệt đầy.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
