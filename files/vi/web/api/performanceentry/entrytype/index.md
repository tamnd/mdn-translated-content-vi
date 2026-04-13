---
title: "PerformanceEntry: entryType property"
short-title: entryType
slug: Web/API/PerformanceEntry/entryType
page-type: web-api-instance-property
browser-compat: api.PerformanceEntry.entryType
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`entryType`** trả về một chuỗi biểu thị loại chỉ số hiệu năng mà entry này đại diện.

Tất cả `entryTypes` được hỗ trợ đều có sẵn thông qua thuộc tính tĩnh {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}}.

## Giá trị

Một chuỗi. Giá trị trả về phụ thuộc vào lớp con của đối tượng `PerformanceEntry`. Một số lớp con có nhiều hơn một `entryType`.

- `element`
  - : Báo cáo thời gian tải của phần tử.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceElementTiming")}}.

- `event`
  - : Báo cáo độ trễ của sự kiện.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceEventTiming")}}.

- `first-input`
  - : Báo cáo {{Glossary("First Input Delay")}} (FID).

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceEventTiming")}}.

- `largest-contentful-paint`
  - : Báo cáo paint lớn nhất mà một phần tử kích hoạt trên màn hình.

    Thể hiện entry sẽ là một đối tượng {{domxref("LargestContentfulPaint")}}.

- `layout-shift`
  - : Báo cáo độ ổn định bố cục của trang web dựa trên chuyển động của các phần tử trên trang.

    Thể hiện entry sẽ là một đối tượng {{domxref("LayoutShift")}}.

- `long-animation-frame`
  - : Báo cáo các trường hợp [long animation frames (LoAFs)](/en-US/docs/Web/API/Performance_API/Long_animation_frame_timing#what_is_a_long_animation_frame).

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceLongAnimationFrameTiming")}}.

- `longtask`
  - : Báo cáo các trường hợp tác vụ dài.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceLongTaskTiming")}}.

- `mark`
  - : Báo cáo các mốc hiệu năng tùy chỉnh của bạn.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceMark")}}.

- `measure`
  - : Báo cáo các phép đo hiệu năng tùy chỉnh của bạn.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceMeasure")}}.

- `navigation`
  - : Báo cáo thời gian điều hướng tài liệu.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceNavigationTiming")}}.

- `paint`
  - : Báo cáo các thời điểm quan trọng của việc hiển thị tài liệu (first paint, first contentful paint) trong lúc tải trang.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformancePaintTiming")}}.

- `resource`
  - : Báo cáo thông tin thời gian cho tài nguyên trong tài liệu.

    Thể hiện entry sẽ là một đối tượng {{domxref("PerformanceResourceTiming")}}.

- `taskattribution`
  - : Báo cáo loại công việc đã đóng góp đáng kể vào tác vụ dài.

    Thể hiện entry sẽ là một đối tượng {{domxref("TaskAttributionTiming")}}.

- `visibility-state`
  - : Báo cáo thời điểm thay đổi trạng thái hiển thị của trang, tức là khi một tab chuyển từ nền sang trước hoặc ngược lại.

    Thể hiện entry sẽ là một đối tượng {{domxref("VisibilityStateEntry")}}.

## Ví dụ

### Lọc performance entry theo kiểu

Thuộc tính `entryType` có thể hữu ích khi lọc các performance entry cụ thể. Ví dụ, bạn có thể muốn kiểm tra tất cả tài nguyên script, nên bạn sẽ kiểm tra `entryType` là `"resource"` và `initiatorType` là `"script"` của {{domxref("PerformanceResourceTiming.initiatorType", "initiatorType")}}.

```js
const scriptResources = performance
  .getEntries()
  .filter(
    (entry) =>
      entry.entryType === "resource" && entry.initiatorType === "script",
  );
console.log(scriptResources);
```

### Lấy performance entry theo kiểu

Cả {{domxref("Performance")}} và {{domxref("PerformanceObserver")}} đều cung cấp các phương thức cho phép bạn lấy performance entry theo kiểu trực tiếp. Bạn không nhất thiết phải dùng thuộc tính `entryType` cho việc đó, thay vào đó có thể dùng {{domxref("Performance.getEntriesByType()")}} hoặc {{domxref("PerformanceObserverEntryList.getEntriesByType()")}}.

Ngoài ra, khi quan sát bằng {{domxref("PerformanceObserver")}}, phương thức {{domxref("PerformanceObserver.observe", "observe()")}} nhận một mảng `entryTypes` trong đối tượng tùy chọn, nơi bạn có thể quyết định những kiểu entry nào sẽ được quan sát.

```js
// Ghi lại tất cả resource entry tại thời điểm này
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  console.log(`${entry.name}'s duration: ${entry.duration}`);
});

// Phiên bản PerformanceObserver
// Ghi lại tất cả resource entry khi chúng có sẵn
function perfObserver(list, observer) {
  list.getEntriesByType("resource").forEach((entry) => {
    console.log(`${entry.name}'s duration: ${entry.duration}`);
  });
}
const observer = new PerformanceObserver(perfObserver);
observer.observe({ entryTypes: ["resource", "navigation"] });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceObserver.supportedEntryTypes_static", "PerformanceObserver.supportedEntryTypes")}}
- {{domxref("Performance.getEntriesByType()")}}
- {{domxref("PerformanceObserverEntryList.getEntriesByType()")}}
