---
title: "IntersectionObserver: delay property"
short-title: delay
slug: Web/API/IntersectionObserver/delay
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IntersectionObserver.delay
---

{{APIRef("Intersection Observer API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`delay`** của giao diện {{domxref("IntersectionObserver")}} cho biết độ trễ tối thiểu giữa các thông báo từ trình quan sát này.

Độ trễ được dùng để giới hạn tốc độ cung cấp thông báo khi [theo dõi khả năng hiển thị](/en-US/docs/Web/API/IntersectionObserver/trackVisibility), vì đây là thao tác tốn nhiều tài nguyên tính toán.
Khuyến nghị khi theo dõi khả năng hiển thị là bạn nên đặt độ trễ ở mức giá trị lớn nhất có thể chấp nhận được.

## Giá trị

Một số dương tính bằng mili giây.

Giá trị được đặt bằng đối số [`option.delay`](/en-US/docs/Web/API/IntersectionObserver/IntersectionObserver#delay) trong hàm khởi tạo `IntersectionObserver()`.
Giá trị bị giới hạn ở mức 100 hoặc lớn hơn nếu {{domxref("IntersectionObserver/trackVisibility","trackVisibility")}} là `true`, nhưng mặc định là 0 trong trường hợp khác.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)
