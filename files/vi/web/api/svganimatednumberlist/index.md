---
title: SVGAnimatedNumberList
slug: Web/API/SVGAnimatedNumberList
page-type: web-api-interface
browser-compat: api.SVGAnimatedNumberList
---

{{APIRef("SVG")}}

Giao diện **`SVGAnimatedNumberList`** đại diện cho danh sách các thuộc tính thuộc kiểu [\<number>](/en-US/docs/Web/SVG/Guides/Content_type#number) có thể được hoạt hình.

## Thuộc tính phiên bản

- {{domxref("SVGAnimatedNumberList.baseVal")}} {{ReadOnlyInline}}
  - : Một {{domxref("SVGNumberList")}} đại diện cho giá trị cơ sở của thuộc tính đã cho trước khi áp dụng bất kỳ hoạt hình nào.
- {{domxref("SVGAnimatedNumberList.animVal")}} {{ReadOnlyInline}}
  - : Một {{ domxref("SVGNumberList") }} chỉ đọc đại diện cho giá trị hoạt hình hiện tại của thuộc tính đã cho. Nếu thuộc tính đã cho hiện không đang được hoạt hình, thì {{ domxref("SVGNumberList") }} sẽ có cùng nội dung như `baseVal`. Đối tượng được tham chiếu bởi `animVal` luôn khác biệt so với đối tượng được tham chiếu bởi `baseVal`, ngay cả khi thuộc tính không được hoạt hình.

## Phương thức phiên bản

Giao diện `SVGAnimatedNumberList` không cung cấp bất kỳ phương thức cụ thể nào.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
