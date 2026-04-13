---
title: SVGAnimatedPreserveAspectRatio
slug: Web/API/SVGAnimatedPreserveAspectRatio
page-type: web-api-interface
browser-compat: api.SVGAnimatedPreserveAspectRatio
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedPreserveAspectRatio`** đại diện cho các thuộc tính thuộc kiểu {{ domxref("SVGPreserveAspectRatio") }} có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedPreserveAspectRatio.baseVal", "baseVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGPreserveAspectRatio")}} đại diện cho giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedPreserveAspectRatio.animVal", "animVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGPreserveAspectRatio")}} đại diện cho giá trị hoạt hình hiện tại của thuộc tính đã cho. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{ domxref("SVGPreserveAspectRatio") }} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

Giao diện `SVGAnimatedPreserveAspectRatio` không cung cấp bất kỳ phương thức cụ thể nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
