---
title: "LayoutShift: thuộc tính lastInputTime"
short-title: lastInputTime
slug: Web/API/LayoutShift/lastInputTime
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.LayoutShift.lastInputTime
---

{{SeeCompatTable}}{{APIRef("Performance API")}}

Thuộc tính chỉ đọc **`lastInputTime`** của giao diện {{domxref("LayoutShift")}} trả về thời gian của đầu vào loại trừ gần nhất hoặc `0` nếu không có đầu vào loại trừ nào xảy ra.

Sự dịch chuyển bố cục chỉ là xấu nếu người dùng không mong đợi chúng. Các chỉ số dịch chuyển bố cục như {{glossary("CLS")}} loại trừ các sự dịch chuyển xảy ra ngay sau một số tương tác người dùng nhất định. Các tương tác này được gọi là _đầu vào loại trừ_. Các đầu vào loại trừ bao gồm:

- Bất kỳ sự kiện nào báo hiệu tương tác chủ động của người dùng với tài liệu: ([`mousedown`](/en-US/docs/Web/API/Element/mousedown_event), [`keydown`](/en-US/docs/Web/API/Element/keydown_event), và [`pointerdown`](/en-US/docs/Web/API/Element/pointerdown_event))
- Bất kỳ sự kiện nào thay đổi trực tiếp kích thước viewport.
- Các sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event).

Các sự kiện [`mousemove`](/en-US/docs/Web/API/Element/mousemove_event) và [`pointermove`](/en-US/docs/Web/API/Element/pointermove_event) **không** là đầu vào loại trừ.

## Giá trị

Một {{domxref("DOMHighResTimeStamp")}} chỉ ra thời gian đầu vào loại trừ gần nhất hoặc `0` nếu không có đầu vào loại trừ nào xảy ra.

## Ví dụ

### Ghi lại thời gian đầu vào cuối cùng

Ghi lại thời gian đầu vào loại trừ nếu đầu vào loại trừ đã xảy ra.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.lastInputTime) {
      console.log(entry.lastInputTime);
    }
  });
});

observer.observe({ type: "layout-shift", buffered: true });
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("LayoutShift.hadRecentInput")}}
