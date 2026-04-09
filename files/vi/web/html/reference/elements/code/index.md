---
title: "<code>: The Inline Code element"
slug: Web/HTML/Reference/Elements/code
page-type: html-element
browser-compat: html.elements.code
sidebar: htmlsidebar
---

Phần tử **`<code>`** trong [HTML](/en-US/docs/Web/HTML) hiển thị nội dung của nó được tạo kiểu theo cách nhằm chỉ ra rằng văn bản là một đoạn ngắn của mã máy tính. Theo mặc định, nội dung văn bản được hiển thị bằng phông chữ monospace mặc định của {{Glossary("user agent", "user agent")}}.

{{InteractiveExample("HTML Demo: &lt;code&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  The <code>push()</code> method adds one or more elements to the end of an
  array and returns the new length of the array.
</p>
```

```css interactive-example
code {
  background-color: #eeeeee;
  border-radius: 3px;
  font-family: "Courier New", monospace;
  padding: 0 3px;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

Một đoạn văn bản bao gồm `<code>`:

```html
<p>
  The function <code>selectAll()</code> highlights all the text in the input
  field so the user can, for example, copy or delete the text.
</p>
```

### Kết quả

{{EmbedLiveSample("Example", 640, 70)}}

## Ghi chú

Để đại diện cho nhiều dòng mã, hãy bọc phần tử `<code>` trong một phần tử {{HTMLElement("pre")}}. Phần tử `<code>` tự nó chỉ đại diện cho một cụm từ mã hoặc dòng mã đơn.

Một quy tắc CSS có thể được định nghĩa cho bộ chọn `code` để ghi đè phông chữ mặc định của trình duyệt. Các tùy chọn do người dùng đặt có thể ưu tiên hơn CSS đã chỉ định.

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
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">code</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>
        {{domxref("HTMLElement")}} Đến Gecko 1.9.2 (Firefox 4)
        bao gồm, Firefox triển khai giao diện
        {{domxref("HTMLSpanElement")}} cho phần tử này.
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("samp")}}
- {{HTMLElement("kbd")}}
- {{HTMLElement("var")}}
- {{HTMLElement("pre")}}
