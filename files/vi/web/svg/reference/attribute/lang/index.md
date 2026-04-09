---
title: lang
slug: Web/SVG/Reference/Attribute/lang
page-type: svg-attribute
browser-compat: svg.global_attributes.lang
sidebar: svgref
---

Thuộc tính **`lang`** xác định ngôn ngữ chính được dùng trong nội dung và các thuộc tính chứa nội dung văn bản của những phần tử nhất định.

Cũng có một thuộc tính {{SVGAttr("xml:lang")}} (có namespace). Nếu cả hai đều được định nghĩa, thuộc tính có namespace sẽ được dùng và thuộc tính không có namespace sẽ bị bỏ qua.

Trong SVG 1.1, từng có một thuộc tính `lang` được định nghĩa với ý nghĩa khác và chỉ áp dụng cho các phần tử `<glyph>`. Thuộc tính đó chỉ định một danh sách {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}. Glyph này được dùng nếu thuộc tính `xml:lang` khớp chính xác với một trong các ngôn ngữ được cho trong giá trị của tham số này, hoặc nếu thuộc tính `xml:lang` khớp chính xác với một tiền tố của một trong các ngôn ngữ được cho trong giá trị của tham số này sao cho ký tự thẻ đầu tiên theo sau tiền tố là `"-"`.

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Ví dụ

```html
<svg viewBox="0 0 200 100" xmlns="http://www.w3.org/2000/svg">
  <text lang="en-US">Đây là một đoạn văn bản tiếng Anh</text>
</svg>
```

## Ghi chú sử dụng

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
      <th scope="row">Có thể animate</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `<language-tag>`
  - : Giá trị này xác định ngôn ngữ được dùng cho phần tử dưới dạng một {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}} hợp lệ.

    Cú pháp phổ biến nhất là một giá trị được tạo bởi phần hai ký tự viết thường cho ngôn ngữ và phần hai ký tự viết hoa cho khu vực hoặc quốc gia, ngăn cách bằng dấu gạch ngang, ví dụ `en-US` cho tiếng Anh Mỹ hoặc `de-AT` cho tiếng Đức Áo.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{glossary("BCP 47 language tag", "thẻ ngôn ngữ BCP 47")}}
