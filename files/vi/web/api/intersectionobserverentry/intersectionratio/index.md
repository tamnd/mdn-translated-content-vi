---
title: "IntersectionObserverEntry: thuộc tính intersectionRatio"
short-title: intersectionRatio
slug: Web/API/IntersectionObserverEntry/intersectionRatio
page-type: web-api-instance-property
browser-compat: api.IntersectionObserverEntry.intersectionRatio
---

{{APIRef("Intersection Observer API")}}

Thuộc tính chỉ đọc **`intersectionRatio`** của giao diện {{domxref("IntersectionObserverEntry")}} cho biết phần nào của phần tử đích hiện đang hiển thị trong tỷ lệ giao nhau của root, dưới dạng giá trị từ 0.0 đến 1.0.

## Giá trị

Một số từ 0.0 đến 1.0 cho biết phần tử đích đang thực sự hiển thị trong hình chữ nhật giao nhau của root bao nhiêu.
Chính xác hơn, giá trị này là tỷ lệ giữa diện tích của hình chữ nhật giao nhau ({{domxref("IntersectionObserverEntry.intersectionRect", "intersectionRect")}}) với diện tích hình chữ nhật biên của target ({{domxref("IntersectionObserverEntry.boundingClientRect", "boundingClientRect")}}).

Nếu diện tích hình chữ nhật biên của target bằng 0, giá trị trả về là 1 nếu {{domxref("IntersectionObserverEntry.isIntersecting", "isIntersecting")}} là `true`, hoặc 0 nếu không.

## Ví dụ

Trong ví dụ đơn giản này, một callback giao nhau đặt {{cssxref("opacity")}} của mỗi phần tử đích bằng với tỷ lệ giao nhau của phần tử đó với root.

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
