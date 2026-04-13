---
title: "Document: styleSheets property"
short-title: styleSheets
slug: Web/API/Document/styleSheets
page-type: web-api-instance-property
browser-compat: api.Document.styleSheets
---

{{APIRef("CSSOM")}}

Thuộc tính chỉ đọc **`styleSheets`** của giao diện {{domxref("Document")}} trả về một {{domxref('StyleSheetList')}} các đối tượng {{domxref('CSSStyleSheet')}}, cho các bảng kiểu được liên kết rõ ràng hoặc nhúng trong một tài liệu.

## Giá trị

Danh sách trả về được sắp xếp như sau:

- Các StyleSheet lấy từ header {{HTTPHeader("Link")}} được đặt đầu tiên, sắp xếp theo thứ tự header.
- Các StyleSheet lấy từ DOM được đặt sau, sắp xếp theo [thứ tự cây](https://dom.spec.whatwg.org/#concept-tree-order).

## Ví dụ

### Truy xuất một bảng kiểu cụ thể theo tiêu đề

```js
function getStyleSheet(uniqueTitle) {
  for (const sheet of document.styleSheets) {
    if (sheet.title === uniqueTitle) {
      return sheet;
    }
  }
}
```

### Truy cập các quy tắc trong bảng kiểu

Bạn có thể truy cập các bảng kiểu và quy tắc của chúng một cách riêng lẻ bằng cách sử dụng các đối tượng stylesheet, style và {{domxref("CSSRule")}}, như được minh họa trong ví dụ này, in ra tất cả các bộ chọn quy tắc kiểu lên console.

```js
for (const styleSheet of document.styleSheets) {
  for (const rule of styleSheet.cssRules) {
    console.log(`${rule.selectorText}\n`);
  }
}
```

Đối với một tài liệu có một bảng kiểu duy nhất trong đó ba quy tắc sau được định nghĩa:

```css
body {
  background-color: darkblue;
}
p {
  font-family: "Arial";
  font-size: 10pt;
  margin-left: 0.125in;
}
#lumpy {
  display: none;
}
```

Tập lệnh này xuất ra kết quả sau:

```plain
BODY
P
#LUMPY
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
