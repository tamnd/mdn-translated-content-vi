---
title: PerformanceScriptTiming
slug: Web/API/PerformanceScriptTiming
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PerformanceScriptTiming
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Giao diện **`PerformanceScriptTiming`** được chỉ định trong Long Animation Frames API và cung cấp các chỉ số về các tập lệnh riêng lẻ góp phần vào các khung hoạt hình dài (LoAF).

## Mô tả

Các khung hoạt hình dài (LoAF) là các cập nhật render bị trì hoãn vượt quá 50ms. LoAF có thể dẫn đến các cập nhật giao diện người dùng (UI) chậm, khiến các điều khiển có vẻ không phản hồi và gây ra các hiệu ứng hoạt hình và cuộn [giật cục](/en-US/docs/Glossary/Jank) (không mượt mà). Điều này thường dẫn đến sự thất vọng của người dùng.

Giao diện `PerformanceScriptTiming` (các phiên bản của nó được truy cập qua thuộc tính {{domxref("PerformanceLongAnimationFrameTiming.scripts")}}) cung cấp tập hợp thông tin chi tiết sau về các tập lệnh riêng lẻ góp phần vào LoAF, cho phép các nhà phát triển thu hẹp nguyên nhân gốc rễ của chúng:

- Một tập hợp chi tiết các dấu thời gian cho mỗi tập lệnh.
- Danh tính và loại của invoker, tức là tính năng mà khi được gọi, đã chạy tập lệnh.
- Thông tin chi tiết về từng tệp nguồn tập lệnh, bao gồm URL, tên hàm và vị trí ký tự góp phần vào LoAF.

`PerformanceScriptTiming` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau cho các mục hiệu suất khung hoạt hình dài:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian trôi qua tính bằng mili giây giữa thời điểm bắt đầu và kết thúc thực thi tập lệnh.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về loại mục, luôn là `"script"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên mục, luôn là `"script"`.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} đại diện cho thời điểm thực thi tập lệnh bắt đầu, tính bằng mili giây.

Giao diện này cũng hỗ trợ các thuộc tính sau:

- {{domxref("PerformanceScriptTiming.executionStart")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} cho biết thời điểm quá trình biên dịch tập lệnh kết thúc và quá trình thực thi bắt đầu.
- {{domxref("PerformanceScriptTiming.forcedStyleAndLayoutDuration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian, tính bằng mili giây, tập lệnh xử lý bố cục/kiểu bị ép buộc. Xem [Avoid layout thrashing](https://web.dev/articles/avoid-large-complex-layouts-and-layout-thrashing#avoid_layout_thrashing) để hiểu nguyên nhân gây ra điều này.
- {{domxref("PerformanceScriptTiming.invoker")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị chuỗi cho biết danh tính của tính năng mà khi được gọi, đã chạy tập lệnh.
- {{domxref("PerformanceScriptTiming.invokerType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị chuỗi cho biết loại tính năng mà khi được gọi, đã chạy tập lệnh.
- {{domxref("PerformanceScriptTiming.pauseDuration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian, tính bằng mili giây, tập lệnh dành cho các thao tác đồng bộ "tạm dừng" (ví dụ: các lệnh gọi {{domxref("Window.alert()")}} hoặc các {{domxref("XMLHttpRequest")}} đồng bộ).
- {{domxref("PerformanceScriptTiming.sourceCharPosition")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một số đại diện cho vị trí ký tự tập lệnh của tính năng tập lệnh góp phần vào LoAF.
- {{domxref("PerformanceScriptTiming.sourceFunctionName")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi đại diện cho tên của hàm góp phần vào LoAF.
- {{domxref("PerformanceScriptTiming.sourceURL")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một chuỗi đại diện cho URL của tập lệnh.
- {{domxref("PerformanceScriptTiming.window")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một tham chiếu đến đối tượng {{domxref("Window")}} đại diện cho `window` của vùng chứa (tức là tài liệu cấp cao nhất hoặc {{htmlelement("iframe")}}) trong đó tập lệnh gây ra LoAF được thực thi.
- {{domxref("PerformanceScriptTiming.windowAttribution")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị liệt kê mô tả mối quan hệ của vùng chứa (tức là tài liệu cấp cao nhất hoặc {{htmlelement("iframe")}}) trong đó tập lệnh gây ra LoAF được thực thi, so với cửa sổ đang chạy tài liệu hiện tại.

## Phương thức phiên bản

- {{domxref("PerformanceScriptTiming.toJSON()")}} {{Experimental_Inline}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceScriptTiming`.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
