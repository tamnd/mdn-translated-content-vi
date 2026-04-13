---
title: "IntersectionObserverEntry: thuộc tính target"
short-title: target
slug: Web/API/IntersectionObserverEntry/target
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.target
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`target`** của giao diện {{domxref("IntersectionObserverEntry")}} cho biết {{domxref("Element")}} đích nào đã thay đổi mức giao nhau với intersection root.

## Giá trị

Thuộc tính `target` của `IntersectionObserverEntry` chỉ ra {{domxref("Element")}} nào, trước đó được theo dõi bằng cách gọi {{domxref("IntersectionObserver.observe()")}}, đã trải qua thay đổi về mức giao nhau với root.

## Ví dụ

Trong ví dụ đơn giản này, {{cssxref("opacity")}} của mỗi phần tử đích được đặt bằng {{domxref("IntersectionObserverEntry.intersectionRatio", "intersectionRatio")}} của nó.

```js
function intersectionCallback(entries) {
  entries.forEach((entry) => {
    entry.target.style.opacity = entry.intersectionRatio;
  });
}
```

Để xem ví dụ cụ thể hơn, hãy xem [Handling intersection changes](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility#handling_intersection_changes).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
