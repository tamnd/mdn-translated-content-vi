---
title: SVGAnimatedTransformList
slug: Web/API/SVGAnimatedTransformList
page-type: web-api-interface
browser-compat: api.SVGAnimatedTransformList
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedTransformList`** đại diện cho các thuộc tính nhận một danh sách số và có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedTransformList.baseVal", "baseVal")}} {{ReadOnlyInline}}
  - : Giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedTransformList.animVal", "animVal")}} {{ReadOnlyInline}}
  - : Giá trị hoạt hình hiện tại của thuộc tính đã cho dưới dạng {{domxref("SVGTransformList")}} chỉ đọc. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{domxref("SVGTransformList")}} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

_Giao diện `SVGAnimatedTransformList` không cung cấp bất kỳ phương thức cụ thể nào._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
