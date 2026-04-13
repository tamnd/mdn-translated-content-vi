---
title: "AnimationTimeline: thuộc tính duration"
short-title: duration
slug: Web/API/AnimationTimeline/duration
page-type: web-api-instance-property
browser-compat: api.AnimationTimeline.duration
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`duration`** của giao diện {{domxref("AnimationTimeline")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về giá trị lớn nhất cho timeline này hoặc `null`.

Lưu ý rằng các giao diện dẫn xuất {{domxref("ViewTimeline")}} và {{domxref("ScrollTimeline")}} luôn trả về duration là 100%, trong khi {{domxref("DocumentTimeline")}} không có duration và trả về `null`.

## Giá trị

Một số biểu diễn duration của timeline (giá trị lớn nhất của timeline này) hoặc `null`.

## Ví dụ

### Duration của view timeline

{{domxref("ViewTimeline")}} luôn trả về duration là 100% dưới dạng {{domxref("CSSUnitValue")}}.

```js
const subject = document.querySelector(".subject");
const timeline = new ViewTimeline({
  subject,
  axis: "block",
});

timeline.duration; // CSSUnitValue { value: 100, unit: "percent" }
```

### Duration của scroll timeline

{{domxref("ScrollTimeline")}} luôn trả về duration là 100% dưới dạng {{domxref("CSSUnitValue")}}.

```js
const timeline = new ScrollTimeline({
  source: document.documentElement,
  axis: "block",
});

timeline.duration; // CSSUnitValue { value: 100, unit: "percent" }
```

### Duration của document timeline

{{domxref("DocumentTimeline")}} không có duration.

```js
document.timeline.duration; // null
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("AnimationTimeline")}}
- {{domxref("DocumentTimeline")}} kế thừa thuộc tính này
- {{domxref("ScrollTimeline")}} kế thừa thuộc tính này
- {{domxref("ViewTimeline")}} kế thừa thuộc tính này
