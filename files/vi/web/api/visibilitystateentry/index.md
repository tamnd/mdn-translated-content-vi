---
title: VisibilityStateEntry
slug: Web/API/VisibilityStateEntry
page-type: web-api-interface
status:
  - experimental
browser-compat: api.VisibilityStateEntry
---

{{APIRef("Performance API")}}{{seecompattable}}

Giao diện **`VisibilityStateEntry`** cung cấp thời gian của các thay đổi trạng thái hiển thị trang, tức là khi tab chuyển từ foreground sang background hoặc ngược lại.

Điều này có thể được dùng để xác định các thay đổi hiển thị trên performance timeline, và tham chiếu chéo chúng với các mục performance khác như "first-contentful-paint" (xem {{domxref("PerformancePaintTiming")}}).

Có hai thời gian thay đổi trạng thái hiển thị quan trọng mà API này báo cáo:

- `visible`: Thời gian khi trang trở nên hiển thị (tức là khi tab của nó chuyển sang foreground).
- `hidden`: Thời gian khi trang trở nên bị ẩn (tức là khi tab của nó chuyển sang background).

Performance timeline sẽ luôn có một mục `"visibility-state"` với `startTime` là `0` và `name` đại diện cho trạng thái hiển thị trang ban đầu.

> [!NOTE]
> Giống như các Performance API khác, API này mở rộng {{domxref("PerformanceEntry")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này không có thuộc tính riêng nhưng mở rộng các thuộc tính của {{domxref("PerformanceEntry")}} bằng cách giới hạn và ràng buộc chúng như sau:

- {{domxref("PerformanceEntry.entryType")}} {{experimental_inline}}
  - : Trả về `"visibility-state"`.
- {{domxref("PerformanceEntry.name")}} {{experimental_inline}}
  - : Trả về `"visible"` hoặc `"hidden"`.
- {{domxref("PerformanceEntry.startTime")}} {{experimental_inline}}
  - : Trả về {{domxref("DOMHighResTimeStamp","timestamp")}} khi thay đổi trạng thái hiển thị xảy ra.
- {{domxref("PerformanceEntry.duration")}} {{experimental_inline}}
  - : Trả về 0.

## Phương thức phiên bản

Giao diện này không có phương thức.

## Ví dụ

### Cách dùng cơ bản

Hàm sau có thể được dùng để ghi log bảng tất cả các mục performance `"visibility-state"` vào console:

```js
function getVisibilityStateEntries() {
  const visibilityStateEntries =
    performance.getEntriesByType("visibility-state");
  console.table(visibilityStateEntries);
}
```

### Tương quan các thay đổi trạng thái hiển thị với paint timing

Hàm bên dưới lấy tham chiếu đến tất cả các mục `"visibility-state"` và mục `"first-contentful-paint"`, sau đó dùng {{jsxref("Array.some()")}} để kiểm tra xem có mục hiển thị `"hidden"` nào xảy ra trước lần paint contentful đầu tiên hay không:

```js
function wasHiddenBeforeFirstContentfulPaint() {
  const fcpEntry = performance.getEntriesByName("first-contentful-paint")[0];
  const visibilityStateEntries =
    performance.getEntriesByType("visibility-state");
  return visibilityStateEntries.some(
    (e) => e.startTime < fcpEntry.startTime && e.name === "hidden",
  );
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Page Visibility API](/en-US/docs/Web/API/Page_Visibility_API)
