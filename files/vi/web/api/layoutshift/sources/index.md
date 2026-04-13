---
title: "LayoutShift: thuộc tính sources"
short-title: sources
slug: Web/API/LayoutShift/sources
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShift.sources
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`sources`** của giao diện {{domxref("LayoutShift")}} trả về một mảng các đối tượng {{domxref("LayoutShiftAttribution")}} cho biết các phần tử DOM đã di chuyển trong quá trình dịch chuyển bố cục.

## Giá trị

Một {{jsxref("Array")}} các đối tượng {{domxref("LayoutShiftAttribution")}}. Mảng này sẽ không chứa nhiều hơn năm nguồn. Nếu có nhiều hơn năm phần tử bị ảnh hưởng bởi sự dịch chuyển bố cục, năm phần tử có tác động lớn nhất được báo cáo.

## Ví dụ

### Ghi lại các nguồn dịch chuyển bố cục

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.sources.forEach((source) => {
      console.log(source);
    });
  });
});

observer.observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("LayoutShiftAttribution")}}
