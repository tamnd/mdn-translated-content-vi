---
title: LayoutShift
slug: Web/API/LayoutShift
page-type: web-api-interface
status:
  - experimental
browser-compat: api.LayoutShift
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Giao diện `LayoutShift` của [Performance API](/en-US/docs/Web/API/Performance_API) cung cấp thông tin chi tiết về độ ổn định bố cục của các trang web dựa trên sự di chuyển của các phần tử trên trang.

## Mô tả

Sự dịch chuyển bố cục xảy ra khi bất kỳ phần tử nào hiển thị trong viewport thay đổi vị trí của nó giữa hai khung hình. Các phần tử này được mô tả là **không ổn định**, cho thấy sự thiếu ổn định trực quan.

Layout Instability API cung cấp cách đo lường và báo cáo về các sự dịch chuyển bố cục này. Tất cả các công cụ để debug sự dịch chuyển bố cục, bao gồm cả trong developer tools của trình duyệt, sử dụng API này. API cũng có thể được dùng để quan sát và debug các sự dịch chuyển bố cục bằng cách ghi thông tin vào console, gửi dữ liệu đến endpoint máy chủ, hoặc đến phân tích trang web.

Các công cụ hiệu năng có thể dùng API này để tính điểm {{glossary("CLS")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

Giao diện này mở rộng các thuộc tính {{domxref("PerformanceEntry")}} sau đây bằng cách xác định chúng như sau:

- {{domxref("PerformanceEntry.duration")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `0` (khái niệm duration không áp dụng cho sự dịch chuyển bố cục).
- {{domxref("PerformanceEntry.entryType")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `"layout-shift"`.
- {{domxref("PerformanceEntry.name")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Luôn trả về `"layout-shift"`.
- {{domxref("PerformanceEntry.startTime")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("DOMHighResTimeStamp")}} đại diện cho thời điểm bắt đầu sự dịch chuyển bố cục.

Giao diện này cũng hỗ trợ các thuộc tính sau:

- {{domxref("LayoutShift.value")}} {{Experimental_Inline}}
  - : Trả về điểm dịch chuyển bố cục được tính là phần phân số tác động (phần phân số của viewport bị dịch chuyển) nhân với phần phân số khoảng cách (khoảng cách di chuyển theo phân số của viewport).
- {{domxref("LayoutShift.hadRecentInput")}} {{Experimental_Inline}}
  - : Trả về `true` nếu {{domxref("LayoutShift.lastInputTime", "lastInputTime")}} nhỏ hơn 500 mili giây trước.
- {{domxref("LayoutShift.lastInputTime")}} {{Experimental_Inline}}
  - : Trả về thời gian của đầu vào loại trừ gần nhất (đầu vào người dùng loại trừ mục này khỏi việc đóng góp vào điểm CLS) hoặc `0` nếu không có đầu vào loại trừ nào xảy ra.
- {{domxref("LayoutShift.sources")}} {{Experimental_Inline}}
  - : Trả về một mảng các đối tượng {{domxref("LayoutShiftAttribution")}} với thông tin về các phần tử bị dịch chuyển.

## Phương thức phiên bản

- {{domxref("LayoutShift.toJSON()")}} {{Experimental_Inline}}
  - : Chuyển đổi các thuộc tính sang JSON.

## Ví dụ

### Ghi lại các giá trị dịch chuyển bố cục

Ví dụ sau đây cho thấy cách nắm bắt các sự dịch chuyển bố cục và ghi chúng vào console.

```js
const observer = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    // Count layout shifts without recent user input only
    if (!entry.hadRecentInput) {
      console.log("LayoutShift value:", entry.value);
      if (entry.sources) {
        for (const { node, currentRect, previousRect } of entry.sources)
          console.log("LayoutShift source:", node, {
            currentRect,
            previousRect,
          });
      }
    }
  }
});

observer.observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("LayoutShiftAttribution")}}
- {{glossary("CLS")}}
