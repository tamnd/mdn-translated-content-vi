---
title: "IntersectionObserverEntry: thuộc tính isIntersecting"
short-title: isIntersecting
slug: Web/API/IntersectionObserverEntry/isIntersecting
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.isIntersecting
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`isIntersecting`** của giao diện {{domxref("IntersectionObserverEntry")}} là một giá trị Boolean cho biết `true` nếu phần tử đích giao nhau với root của intersection observer.

Nếu là `true`, `IntersectionObserverEntry` mô tả một chuyển đổi vào trạng thái giao nhau; nếu là `false`, bạn biết rằng nó đã chuyển từ giao nhau sang không giao nhau.

## Giá trị

Một giá trị Boolean cho biết {{domxref("IntersectionObserverEntry.target", "target")}} đã chuyển vào trạng thái giao nhau (`true`) hay ra khỏi trạng thái giao nhau (`false`).

## Ví dụ

Trong ví dụ đơn giản này, callback giao nhau được dùng để cập nhật bộ đếm số phần tử đích hiện đang giao nhau với {{domxref("IntersectionObserver.root", "intersection root", "", 1)}}.

```js
function intersectionCallback(entries) {
  entries.forEach((entry) => {
    if (entry.isIntersecting) {
      intersectingCount += 1;
    } else {
      intersectingCount -= 1;
    }
  });
}
```

Để xem ví dụ cụ thể hơn, hãy xem [Handling intersection changes](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility#handling_intersection_changes).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
