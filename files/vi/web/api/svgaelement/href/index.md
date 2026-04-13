---
title: "SVGAElement: thuộc tính href"
short-title: href
slug: Web/API/SVGAElement/href
page-type: web-api-instance-property
browser-compat: api.SVGAElement.href
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`href`** của {{domxref("SVGAElement")}} trả về một đối tượng {{domxref("SVGAnimatedString")}} phản ánh giá trị của thuộc tính href và, trong một số trường hợp nhất định, thuộc tính {{SVGAttr("xlink:href")}} {{deprecated_inline}}. Nó chỉ định URI đích liên kết với liên kết.

Thuộc tính này cho phép truy cập URI được đặt cho liên kết trong tài liệu SVG.

## Giá trị

Một {{domxref("SVGAnimatedString")}} cho biết giá trị của thuộc tính href. Ngoài ra, đối với các phần tử được định nghĩa để hỗ trợ nó, nó phản ánh giá trị của thuộc tính {{SVGAttr("xlink:href")}} {{deprecated_inline}} khi thuộc tính href không được đặt.

## Ví dụ

```js
// Chọn phần tử SVG <a>
const svgLink = document.querySelector("a");

// Truy cập thuộc tính href
console.log(svgLink.href.baseVal); // Ghi ra URI cơ sở
console.log(svgLink.href.animVal); // Ghi ra URI hoạt hình nếu có

// Ví dụ: Phản ánh xlink:href
const deprecatedLink = document.querySelector("a");
console.log(deprecatedLink.href.baseVal); // Phản ánh 'xlink:href' nếu 'href' không được đặt
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ SVGAttr("href") }}
