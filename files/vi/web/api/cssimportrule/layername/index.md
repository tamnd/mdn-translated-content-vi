---
title: "CSSImportRule: thuộc tính layerName"
short-title: layerName
slug: Web/API/CSSImportRule/layerName
page-type: web-api-instance-property
browser-compat: api.CSSImportRule.layerName
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`layerName`** của giao diện {{domxref("CSSImportRule")}} trả về tên của tầng cascade được tạo bởi [quy tắc điều kiện](/vi/docs/Web/CSS/Guides/Syntax/At-rules) {{cssxref("@import")}}.

Nếu tầng được tạo là ẩn danh, chuỗi sẽ rỗng (`""`), nếu không có tầng nào được tạo, nó sẽ là đối tượng `null`.

## Giá trị

Một chuỗi, có thể rỗng, hoặc đối tượng `null`.

## Ví dụ

Bảng kiểu duy nhất của tài liệu chứa ba quy tắc {{cssxref("@import")}}. Khai báo đầu tiên nhập một bảng kiểu vào một tầng có tên. Khai báo thứ hai nhập một bảng kiểu vào một tầng ẩn danh. Khai báo thứ ba nhập một bảng kiểu mà không có khai báo tầng.

Thuộc tính `layerName` trả về tên của tầng liên kết với bảng kiểu được nhập.

```css
@import "style1.css" layer(layer-1);
@import "style2.css" layer;
@import "style3.css";
```

```js
const myRules = document.styleSheets[0].cssRules;
console.log(myRules[0].layerName); // trả về `"layer-1"`
console.log(myRules[1].layerName); // trả về `""` (một tầng ẩn danh)
console.log(myRules[2].layerName); // trả về `null`
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Khu vực học: [Tầng cascade](/vi/docs/Learn_web_development/Core/Styling_basics/Cascade_layers)
- {{cssxref("@import")}} và {{cssxref("@layer")}}
