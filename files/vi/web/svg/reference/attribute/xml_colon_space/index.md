---
title: xml:space
slug: Web/SVG/Reference/Attribute/xml:space
page-type: svg-attribute
status:
  - deprecated
browser-compat: svg.global_attributes.xml_space
sidebar: svgref
---

{{Deprecated_Header}}

SVG hỗ trợ thuộc tính XML tích hợp **`xml:space`** để xử lý các ký tự khoảng trắng bên trong phần tử. Các phần tử con bên trong một phần tử cũng có thể có thuộc tính `xml:space` ghi đè thuộc tính của phần tử cha.

> [!NOTE]
> Thay vì dùng thuộc tính `xml:space`, hãy dùng thuộc tính CSS {{cssxref("white-space")}}.

Thuộc tính này ảnh hưởng đến cách trình duyệt phân tích nội dung văn bản và do đó thay đổi cách {{Glossary("DOM")}} được xây dựng. Vì vậy, việc thay đổi giá trị của thuộc tính này thông qua API DOM có thể không có tác dụng.

## Phần tử

Bạn có thể dùng thuộc tính này với bất kỳ phần tử SVG nào.

## Lưu ý sử dụng

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">Giá trị</th>
      <td><code>default</code> | <code>preserve</code></td>
    </tr>
    <tr>
      <th scope="row">Giá trị mặc định</th>
      <td><code>default</code></td>
    </tr>
    <tr>
      <th scope="row">Có thể hoạt ảnh</th>
      <td>Không</td>
    </tr>
  </tbody>
</table>

- `default`
  - : Khi đặt giá trị này, các ký tự khoảng trắng sẽ được xử lý theo thứ tự sau:
    1. Tất cả ký tự xuống dòng bị loại bỏ.
    2. Tất cả ký tự tab được chuyển thành ký tự khoảng trắng.
    3. Tất cả ký tự khoảng trắng ở đầu và cuối bị loại bỏ.
    4. Tất cả chuỗi khoảng trắng liên tiếp được gộp thành một ký tự khoảng trắng.

- `preserve`
  - : Giá trị này báo cho user agent chuyển tất cả ký tự xuống dòng và tab thành khoảng trắng. Sau đó, nó sẽ vẽ tất cả các ký tự khoảng trắng (bao gồm cả khoảng trắng ở đầu, cuối và nhiều khoảng trắng liên tiếp).

    Ví dụ, chuỗi "a&nbsp;&nbsp;&nbsp;b" (ba khoảng trắng giữa "a" và "b") tách "a" và "b" nhiều hơn "a b" (một khoảng trắng giữa "a" và "b").

## Ví dụ

```css hidden
html,
body,
svg {
  height: 100%;
}
```

```html-nolint
<svg viewBox="0 0 160 50" xmlns="http://www.w3.org/2000/svg">
  <text y="20" xml:space="default">    Default    spacing</text>
  <text y="40" xml:space="preserve">    Preserved    spacing</text>
</svg>
```

{{EmbedLiveSample("Examples", "160", "50")}}

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}
