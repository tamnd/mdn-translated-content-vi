---
title: "SVGAnimatedBoolean: thuộc tính baseVal"
short-title: baseVal
slug: Web/API/SVGAnimatedBoolean/baseVal
page-type: web-api-instance-property
browser-compat: api.SVGAnimatedBoolean.baseVal
---

{{APIRef("SVG")}}

Thuộc tính **`baseVal`** của giao diện {{domxref("SVGAnimatedBoolean")}} là giá trị của thuộc tính SVG boolean có thể hoạt hình liên quan ở trạng thái cơ sở (không hoạt hình). Nó phản ánh giá trị của thuộc tính boolean có thể hoạt hình liên quan khi không có hoạt hình nào được áp dụng.

Một số thuộc tính SVG boolean, như [`preserveAlpha`](/en-US/docs/Web/SVG/Reference/Attribute/preserveAlpha), có thể được hoạt hình. Trong những trường hợp đó, thuộc tính `SVGAnimatedBoolean.baseVal` là `false` khi thuộc tính được đặt thành `false`, bị bỏ qua và mặc định thành `false`, hoặc có thể kế thừa và kế thừa `false`. Nếu không, giá trị là `true`.

## Giá trị

Một giá trị boolean; giá trị cơ sở của thuộc tính được phản chiếu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement")}}
- {{domxref("SVGAnimationElement")}}
