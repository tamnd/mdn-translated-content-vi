---
title: "LayoutShiftAttribution: toJSON() method"
short-title: toJSON()
slug: Web/API/LayoutShiftAttribution/toJSON
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.LayoutShiftAttribution.toJSON
---

{{APIRef("Performance API")}}{{SeeCompatTable}}

Phương thức **`toJSON()`** của giao diện {{domxref("LayoutShiftAttribution")}} là một _bộ tuần tự hóa_ trả về biểu diễn JSON của đối tượng `LayoutShiftAttribution`.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng JSON là kết quả tuần tự hóa của đối tượng {{domxref("LayoutShiftAttribution")}}.

## Ví dụ

Ví dụ sau in biểu diễn JSON của phần tử đầu tiên trong {{domxref("LayoutShift.sources")}} vào bảng điều khiển.

```js
new PerformanceObserver((list) => {
  for (const { sources } of list.getEntries()) {
    if (sources) {
      console.log(sources[0].toJSON());
    }
  }
}).observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
