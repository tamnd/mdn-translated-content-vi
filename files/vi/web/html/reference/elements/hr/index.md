---
title: "<hr>: Phần tử Ngắt chủ đề (Đường kẻ ngang)"
slug: Web/HTML/Reference/Elements/hr
page-type: html-element
browser-compat: html.elements.hr
sidebar: htmlsidebar
---

Phần tử **`<hr>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho sự ngắt chủ đề giữa các phần tử cấp đoạn văn: ví dụ, sự thay đổi cảnh trong một câu chuyện, hoặc sự chuyển đổi chủ đề trong một mục.

{{InteractiveExample("HTML Demo: &lt;hr&gt;", "tabbed-shorter")}}

```html interactive-example
<p>§1: The first rule of Fight Club is: You do not talk about Fight Club.</p>

<hr />

<p>§2: The second rule of Fight Club is: Always bring cupcakes.</p>
```

```css interactive-example
hr {
  border: none;
  border-top: 3px double #333333;
  color: #333333;
  overflow: visible;
  text-align: center;
  height: 5px;
}

hr::after {
  background: white;
  content: "§";
  padding: 0 4px;
  position: relative;
  top: -13px;
}
```

Trong lịch sử, phần tử `<hr>` luôn được trình bày dưới dạng đường kẻ ngang. Mặc dù nó vẫn có thể được hiển thị dưới dạng đường kẻ ngang trong các trình duyệt trực quan, phần tử này hiện được định nghĩa theo nghĩa ngữ nghĩa, chứ không phải theo nghĩa trình bày. Do đó, nếu bạn muốn vẽ một đường ngang, bạn nên thực hiện điều đó bằng cách thêm đường viền vào một phần tử hiện có sử dụng CSS.

Các thuộc tính `border-*` (ví dụ: {{cssxref("border-style")}} và {{cssxref("border-color")}}) cho phép bạn tùy chỉnh đáng kể giao diện của đường kẻ, cho dù bạn đang tùy chỉnh phần tử `<hr>` hay đường viền được vẽ trên một phần tử khác.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `align` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Đặt căn chỉnh của đường kẻ trên trang. Nếu không có giá trị nào được chỉ định, giá trị mặc định là `left`.
- `color` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Đặt màu của đường kẻ thông qua tên màu hoặc giá trị thập lục phân.
- `noshade` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Đặt đường kẻ không có bóng.
- `size` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Đặt chiều cao, tính bằng pixel, của đường kẻ.
- `width` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Đặt độ dài của đường kẻ trên trang thông qua giá trị pixel hoặc phần trăm.

## Ví dụ

### HTML

```html
<p>
  This is the first paragraph of text. This is the first paragraph of text. This
  is the first paragraph of text. This is the first paragraph of text.
</p>

<hr />

<p>
  This is the second paragraph of text. This is the second paragraph of text.
  This is the second paragraph of text. This is the second paragraph of text.
</p>
```

### Kết quả

{{EmbedLiveSample("Example")}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        <ul>
          <li>Bất kỳ phần tử nào chấp nhận <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content">nội dung luồng</a></li>
          <li>Phần tử <a href="/en-US/docs/Web/HTML/Reference/Elements/select"><code>&lt;select></code></a></li>
        </ul>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role"><code>separator</code></a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a> hoặc <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLHRElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement('p')}}
- [`<hr>` trong `<select>`](/en-US/docs/Web/HTML/Reference/Elements/select#select_with_grouping_options)
