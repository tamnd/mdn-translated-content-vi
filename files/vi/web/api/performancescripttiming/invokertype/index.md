---
title: "PerformanceScriptTiming: invokerType property"
short-title: invokerType
slug: Web/API/PerformanceScriptTiming/invokerType
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.invokerType
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`invokerType`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một giá trị chuỗi cho biết loại tính năng mà khi được gọi, đã chạy tập lệnh.

## Giá trị

Một chuỗi cho biết loại invoker của điểm vào tập lệnh. Các giá trị có thể có là:

- `"user-callback"`
  - : Một callback đã biết được gọi từ trong một API nền tảng web, chẳng hạn như {{domxref("Window.setTimeout", "setTimeout()")}} hoặc {{domxref("Window.requestAnimationFrame()")}}.
- `"event-listener"`
  - : Một trình lắng nghe sự kiện cho một sự kiện nền tảng web, chẳng hạn như [`click`](/en-US/docs/Web/API/Element/click_event), [`load`](/en-US/docs/Web/API/Window/load_event), hoặc [`keyup`](/en-US/docs/Web/API/Element/keyup_event).
- `"resolve-promise"`
  - : Một hàm xử lý cho trạng thái đã giải quyết của một promise nền tảng web, chẳng hạn như {{domxref("Window/fetch", "fetch()")}}. Lưu ý rằng trong trường hợp promises, tất cả các handler của cùng một promise được nhóm lại như một loại mục `"script"` duy nhất.
- `"reject-promise"`
  - : Một hàm xử lý cho trạng thái bị từ chối của một promise nền tảng web.
- `"classic-script"`
  - : Việc đánh giá một tập lệnh tiêu chuẩn (ví dụ: thông qua phần tử {{htmlelement("script")}} hoặc câu lệnh [`import()`](/en-US/docs/Web/JavaScript/Reference/Operators/import)).
- `"module-script"`
  - : Việc đánh giá một tập lệnh module.

Cấu trúc của giá trị {{domxref("PerformanceScriptTiming.invoker")}} phụ thuộc vào giá trị `invokerType` của tập lệnh. Xem trang `invoker` để biết thêm chi tiết.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
