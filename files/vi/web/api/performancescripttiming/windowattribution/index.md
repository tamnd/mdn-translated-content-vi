---
title: "PerformanceScriptTiming: windowAttribution property"
short-title: windowAttribution
slug: Web/API/PerformanceScriptTiming/windowAttribution
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.PerformanceScriptTiming.windowAttribution
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`windowAttribution`** của giao diện {{domxref("PerformanceScriptTiming")}} trả về một giá trị liệt kê mô tả mối quan hệ của vùng chứa (tức là tài liệu cấp cao nhất hoặc {{htmlelement("iframe")}}) trong đó tập lệnh gây ra khung hoạt hình dài (LoAF) được thực thi, so với cửa sổ đang chạy tài liệu hiện tại.

## Giá trị

Một giá trị liệt kê, có thể là một trong:

- `"ancestor"`
  - : Tài liệu hiện tại là phần tử con của tài liệu trong đó tập lệnh được thực thi, được nhúng bên trong nó trong một `<iframe>`.
- `"descendant"`
  - : Tập lệnh được thực thi trong một tài liệu con được nhúng bên trong tài liệu hiện tại trong một `<iframe>`.
- `"other"`
  - : Không xác định được vị trí của tài liệu chứa tập lệnh được thực thi.
- `"same-page"`
  - : Tập lệnh được thực thi trong một phiên bản của tài liệu hiện tại được nhúng trong tài liệu hiện tại trong một `<iframe>`.
- `"self"`
  - : Tập lệnh được thực thi trong tài liệu hiện tại.

## Ví dụ

Xem [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#examples) để biết các ví dụ liên quan đến Long Animation Frames API.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Long animation frame timing](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing)
- {{domxref("PerformanceLongAnimationFrameTiming")}}
