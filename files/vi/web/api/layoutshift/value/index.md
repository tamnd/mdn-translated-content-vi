---
title: "LayoutShift: thuộc tính value"
short-title: value
slug: Web/API/LayoutShift/value
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShift.value
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`value`** của giao diện {{domxref("LayoutShift")}} trả về điểm dịch chuyển bố cục được tính là phần phân số tác động (phần phân số của viewport bị dịch chuyển) nhân với phần phân số khoảng cách (khoảng cách di chuyển theo phân số của viewport).

## Giá trị

Một số từ `0.0` đến `1.0` cho biết điểm dịch chuyển bố cục.

Nó được tính là phần phân số tác động (phần phân số của viewport bị dịch chuyển) nhân với phần phân số khoảng cách (khoảng cách di chuyển theo phân số của viewport).

```plain
layout shift score = impact fraction * distance fraction
```

Để biết thêm chi tiết, xem [Layout shift score](https://web.dev/articles/cls#layout_shift_score) trên web.dev.

## Ví dụ

### Ghi lại điểm dịch chuyển bố cục của mục

Ví dụ sau đây cho thấy cách sử dụng thuộc tính `value` để ghi lại điểm dịch chuyển bố cục.

```js
const observer = new PerformanceObserver((list) => {
  for (const entry of list.getEntries()) {
    // Count layout shifts without recent user input only
    if (!entry.hadRecentInput) {
      console.log("Entry's layout shift score:", entry.value);
    }
  }
});

observer.observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
