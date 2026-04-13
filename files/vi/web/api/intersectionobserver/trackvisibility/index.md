---
title: "IntersectionObserver: trackVisibility property"
short-title: trackVisibility
slug: Web/API/IntersectionObserver/trackVisibility
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.IntersectionObserver.trackVisibility
---

{{APIRef("Intersection Observer API")}}{{SeeCompatTable}}

Thuộc tính chỉ đọc **`trackVisibility`** của giao diện {{domxref("IntersectionObserver")}} cho biết liệu trình quan sát có đang theo dõi khả năng hiển thị của đích ngoài các giao nhau phần tử hay không.

## Giá trị

`true` nếu khả năng hiển thị đang được theo dõi để tính toán giao nhau, và `false` trong trường hợp khác.

Giá trị được đặt bằng đối số [`option.trackVisibility`](/en-US/docs/Web/API/IntersectionObserver/IntersectionObserver#trackvisibility) trong hàm khởi tạo `IntersectionObserver()`.

## Mô tả

Khi không theo dõi khả năng hiển thị, trình quan sát cung cấp thông báo khi phần tử đích được cuộn vào viewport của phần tử gốc.
Tuy nhiên, điều này không cho bạn biết liệu phần tử đích có bị suy giảm khả năng hiển thị hay không, nó có thể bị che một phần bởi một phần tử khác, có độ mờ giảm, hoặc bị biến dạng bởi bộ lọc, phép biến đổi, hoặc một số sửa đổi khác.

Khi theo dõi khả năng hiển thị, chỉ các phần tử mà trình duyệt cho là hiển thị mới được hiển thị là đang giao nhau.
Thuật toán có tính bảo thủ và có thể bỏ qua các phần tử kỹ thuật vẫn hiển thị, chẳng hạn như những phần tử chỉ giảm độ mờ một chút.

Lưu ý rằng việc tính toán khả năng hiển thị tốn kém về mặt tính toán.
Để tránh thao tác chạy quá thường xuyên, một {{domxref("IntersectionObserver/delay","delay")}} được dùng để giới hạn khoảng thời gian báo cáo tối thiểu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Timing element visibility with the Intersection Observer API](/en-US/docs/Web/API/Intersection_Observer_API/Timing_element_visibility)
