---
title: SVGAnimatedRect
slug: Web/API/SVGAnimatedRect
page-type: web-api-interface
browser-compat: api.SVGAnimatedRect
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedRect`** đại diện cho thuộc tính {{domxref("SVGRect")}} có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedRect.baseVal", "baseVal")}}
  - : Giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedRect.animVal", "animVal")}} {{ReadOnlyInline}}
  - : Giá trị hoạt hình hiện tại của thuộc tính đã cho dưới dạng {{domxref("SVGRect")}} chỉ đọc. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{domxref("SVGRect")}} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

_Giao diện `SVGAnimatedRect` không cung cấp bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
