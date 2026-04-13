---
title: PerformanceLongAnimationFrameTiming
slug: Web/API/PerformanceLongAnimationFrameTiming
page-type: web-api-interface
status:
  - experimental
browser-compat: api.PerformanceLongAnimationFrameTiming
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Giao diện **`PerformanceLongAnimationFrameTiming`** được chỉ định trong Long Animation Frames API và cung cấp số liệu về các khung hoạt hình dài (LoAF) chiếm dụng kết xuất và ngăn các tác vụ khác thực thi.

## Mô tả

Các khung hoạt hình dài (LoAF) là các bản cập nhật kết xuất bị trì hoãn vượt quá 50ms. LoAF có thể dẫn đến các bản cập nhật giao diện người dùng (UI) chậm, khiến các điều khiển có vẻ không phản hồi và gây ra hiệu ứng hoạt hình và cuộn [giật cục](/en-US/docs/Glossary/Jank) (không mượt mà). Điều này thường dẫn đến sự thất vọng của người dùng.

Giao diện `PerformanceLongAnimationFrameTiming` cung cấp bộ thông tin chi tiết sau về LoAF, cho phép các nhà phát triển thu hẹp nguyên nhân gốc rễ:

- Bộ timestamps chi tiết cho từng LoAF.
- Thông tin chi tiết về mỗi script góp phần tạo ra LoAF, thông qua thuộc tính {{domxref("PerformanceLongAnimationFrameTiming.scripts")}}. Thuộc tính này trả về một mảng các đối tượng {{domxref("PerformanceScriptTiming")}}, mỗi đối tượng cho mỗi script.

`PerformanceLongAnimationFrameTiming` kế thừa từ {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này trực tiếp định nghĩa các thuộc tính sau:

- {{domxref("PerformanceLongAnimationFrameTiming.blockingDuration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} cho biết tổng thời gian tính bằng mili giây mà luồng chính bị chặn không phản hồi các tác vụ ưu tiên cao, chẳng hạn như đầu vào người dùng.
- {{domxref("PerformanceLongAnimationFrameTiming.firstUIEventTimestamp")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} cho biết thời gian của sự kiện UI đầu tiên (chẳng hạn như sự kiện chuột hoặc bàn phím) được xếp hàng trong khung hoạt hình hiện tại.
- {{domxref("PerformanceLongAnimationFrameTiming.paintTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi giai đoạn kết xuất kết thúc và khung hoạt hình bắt đầu.
- {{domxref("PerformanceLongAnimationFrameTiming.presentationTime")}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi bản cập nhật UI thực sự được vẽ lên màn hình.
- {{domxref("PerformanceLongAnimationFrameTiming.renderStart")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} cho biết thời gian bắt đầu của chu kỳ kết xuất, bao gồm các callback {{domxref("Window.requestAnimationFrame()")}}, tính toán style và layout, các callback {{domxref("ResizeObserver")}} và các callback {{domxref("IntersectionObserver")}}.
- {{domxref("PerformanceLongAnimationFrameTiming.scripts")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một mảng các phiên bản {{domxref("PerformanceScriptTiming")}}.
- {{domxref("PerformanceLongAnimationFrameTiming.styleAndLayoutStart")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} cho biết điểm bắt đầu của khoảng thời gian dành cho các tính toán style và layout cho khung hoạt hình hiện tại.

Nó cũng mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau, đủ điều kiện và ràng buộc chúng như được mô tả:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian tính bằng mili giây để xử lý LoAF hoàn toàn.
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về loại mục, luôn là `"long-animation-frame"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về tên mục, luôn là `"long-animation-frame"`.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp")}} đại diện cho thời gian khi khung hoạt hình bắt đầu.

## Phương thức phiên bản

- {{domxref("PerformanceLongAnimationFrameTiming.toJSON()")}} {{Experimental_Inline}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceLongAnimationFrameTiming`.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceScriptTiming")}}
