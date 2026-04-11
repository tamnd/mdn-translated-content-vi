---
title: "SVGAElement: thuộc tính target"
short-title: target
slug: Web/API/SVGAElement/target
page-type: web-api-instance-property
browser-compat: api.SVGAElement.target
---

{{APIRef("SVG")}}

Thuộc tính chỉ đọc **`SVGAElement.target`** của {{domxref("SVGAElement")}} trả về một đối tượng {{domxref("SVGAnimatedString")}} chỉ định phần cửa sổ, khung hoặc bảng đích mà tài liệu sẽ được mở khi kích hoạt liên kết.

Thuộc tính này được dùng khi có nhiều đích có thể cho tài nguyên kết thúc, chẳng hạn như khi tài liệu cha là tài liệu HTML hoặc XHTML đa khung.

## Giá trị

Một {{domxref("SVGAnimatedString")}} cho biết đích tài nguyên kết thúc mở tài liệu khi liên kết được kích hoạt. Xem {{SVGAttr("target")}} để biết các giá trị hợp lệ.

## Ví dụ

Mã được lấy từ ["mã ví dụ SVGAElement"](/en-US/docs/Web/API/SVGAElement#example)

```js
// …
const linkRef = document.querySelector("a");
linkRef.target = "_blank";
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ SVGAttr("target") }}
