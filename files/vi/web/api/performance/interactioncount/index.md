---
title: "Performance: interactionCount property"
short-title: interactionCount
slug: Web/API/Performance/interactionCount
page-type: web-api-instance-property
browser-compat: api.Performance.interactionCount
---

{{APIRef("Performance API")}}

Thuộc tính chỉ đọc `performance.interactionCount` biểu thị số lượng tương tác thực của người dùng đã xảy ra trên trang kể từ khi nó được tải.

Chỉ những tương tác rời rạc có {{domxref("PerformanceEventTiming.interactionId", "interactionId")}} - chẳng hạn như nhấp chuột và sự kiện phím - mới được đếm. Các tương tác khác, chẳng hạn như cuộn trang, sẽ bị loại trừ.

Thuộc tính này hữu ích khi tính {{Glossary("Interaction_to_next_paint", "Interaction to Next Paint (INP)")}}, đặc biệt là để loại bỏ các ngoại lệ trên những trang có vòng đời dài. INP lấy phần trăm vị trí thứ 98 của các tương tác cho một trang, vì vậy sẽ loại 1 trong mỗi 50 tương tác như những "ngoại lệ" không phản ánh khả năng phản hồi tổng thể của trang.

## Giá trị

Một số, ban đầu là `0`, và tăng thêm `1` cho mỗi tương tác rời rạc được đo bởi {{domxref("PerformanceEventTiming")}}, khi một {{domxref("PerformanceEventTiming.interactionId")}} được gán.

## Ví dụ

### Kiểm tra số lượng tương tác để tính INP chính xác

Với các trang có số lượng tương tác lớn, bạn có thể tính lại INP sau khi loại bỏ 1 trong mỗi 50 ngoại lệ bằng mẫu sau:

```js
if (performance.interactionCount >= 50) {
  recalculateINP(); // Phép tính thực tế phức tạp và không được trình bày ở đây
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceEventTiming")}}
- {{domxref("PerformanceEventTiming.interactionId")}}
- {{Glossary("Interaction_to_next_paint", "Interaction to Next Paint (INP)")}}
