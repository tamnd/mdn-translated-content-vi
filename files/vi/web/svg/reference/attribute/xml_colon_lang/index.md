---
title: xml:lang
slug: Web/SVG/Reference/Attribute/xml:lang
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.xml_lang
sidebar: svgref
---

{{Deprecated_Header}}

Thuộc tính **`xml:lang`** chỉ định ngôn ngữ chính được dùng trong nội dung và các thuộc tính chứa nội dung văn bản của những phần tử nhất định.

Đây là một thuộc tính phổ quát được phép trong mọi phương ngữ XML để đánh dấu ngôn ngữ tự nhiên của con người mà một phần tử chứa.

Cũng có thuộc tính {{SVGAttr("lang")}} (không có không gian tên). Nếu cả hai cùng được định nghĩa, thuộc tính có không gian tên sẽ được dùng và thuộc tính không có không gian tên sẽ bị bỏ qua.

## Phần tử

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>&#x3C;language-tag></code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><em>Không có</em></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<language-tag>`
  - : Giá trị này chỉ định ngôn ngữ dùng cho phần tử như một {{glossary("BCP 47 language tag")}} hợp lệ.

    Cú pháp phổ biến nhất là một giá trị được tạo bởi phần hai ký tự viết thường cho ngôn ngữ và phần hai ký tự viết hoa cho vùng hoặc quốc gia, được ngăn cách bằng dấu gạch ngang, ví dụ `en-US` cho tiếng Anh Mỹ hoặc `de-AT` cho tiếng Đức Áo.

## Ví dụ

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <text xml:lang="en-US">This is some English text</text>
</svg>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Đặc tả XML của `xml:lang`](https://www.w3.org/TR/xml/#sec-lang-tag)
- {{glossary("BCP 47 language tag")}}
