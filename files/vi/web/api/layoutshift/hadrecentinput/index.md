---
title: "LayoutShift: thuộc tính hadRecentInput"
short-title: hadRecentInput
slug: Web/API/LayoutShift/hadRecentInput
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShift.hadRecentInput
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`hadRecentInput`** của giao diện {{domxref("LayoutShift")}} trả về `true` nếu {{domxref("LayoutShift.lastInputTime", "lastInputTime")}} nhỏ hơn 500 mili giây trước.

Sự dịch chuyển bố cục chỉ là vấn đề nếu người dùng không mong đợi chúng, vì vậy các sự dịch chuyển bố cục là kết quả của tương tác người dùng (chẳng hạn như người dùng mở rộng phần tử UI) thường không được tính trong các chỉ số dịch chuyển bố cục. Thuộc tính `hadRecentInput` cho phép bạn loại trừ các sự dịch chuyển này.

## Giá trị

Một giá trị boolean trả về `true` nếu {{domxref("LayoutShift.lastInputTime", "lastInputTime")}} nhỏ hơn 500 mili giây trước; `false` nếu không.

## Ví dụ

### Bỏ qua đầu vào người dùng gần đây cho điểm dịch chuyển bố cục

Ví dụ sau đây cho thấy cách thuộc tính `hadRecentInput` được dùng để chỉ tính các sự dịch chuyển bố cục không có đầu vào người dùng gần đây.

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

- {{domxref("LayoutShift.lastInputTime")}}
