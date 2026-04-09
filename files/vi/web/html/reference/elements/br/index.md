---
title: "<br>: The Line Break element"
slug: Web/HTML/Reference/Elements/br
page-type: html-element
browser-compat: html.elements.br
sidebar: htmlsidebar
---

Phần tử **`<br>`** trong [HTML](/en-US/docs/Web/HTML) tạo ra một dấu ngắt dòng trong văn bản (xuống dòng). Nó hữu ích cho việc viết một bài thơ hoặc địa chỉ, nơi việc phân chia các dòng có ý nghĩa quan trọng.

{{InteractiveExample("HTML Demo: &lt;br&gt;", "tabbed-standard")}}

```html interactive-example
<p>
  O'er all the hilltops<br />
  Is quiet now,<br />
  In all the treetops<br />
  Hearest thou<br />
  Hardly a breath;<br />
  The birds are asleep in the trees:<br />
  Wait, soon like these<br />
  Thou too shalt rest.
</p>
```

```css interactive-example
p {
  font-size: 1rem;
  font-family: sans-serif;
  margin: 20px;
}
```

Như bạn có thể thấy từ ví dụ trên, một phần tử `<br>` được bao gồm tại mỗi điểm mà chúng ta muốn văn bản ngắt. Văn bản sau `<br>` bắt đầu lại ở đầu dòng tiếp theo của khối văn bản.

> [!NOTE]
> Không sử dụng `<br>` để tạo lề giữa các đoạn văn; hãy bọc chúng trong các phần tử {{htmlelement("p")}} và sử dụng thuộc tính CSS {{cssxref('margin')}} để kiểm soát kích thước của chúng.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

### Thuộc tính đã lỗi thời

- `clear` {{Deprecated_Inline}}
  - : Chỉ ra nơi bắt đầu dòng tiếp theo sau ngắt.

## Tạo kiểu với CSS

Phần tử `<br>` có một mục đích được xác định rõ ràng — tạo dấu ngắt dòng trong một khối văn bản. Do đó, nó không có kích thước hoặc đầu ra trực quan của riêng mình, và bạn có rất ít thứ có thể làm để tạo kiểu cho nó.

Bạn có thể đặt {{cssxref("margin")}} trên các phần tử `<br>` để tăng khoảng cách giữa các dòng văn bản trong khối, nhưng đây là thực hành xấu — bạn nên sử dụng thuộc tính {{cssxref("line-height")}} được thiết kế cho mục đích đó.

## Khả năng tiếp cận

Tạo các đoạn văn bản riêng biệt bằng `<br>` không chỉ là thực hành xấu, mà còn có vấn đề cho những người điều hướng bằng công nghệ đọc màn hình. Trình đọc màn hình có thể thông báo sự hiện diện của phần tử, nhưng không có bất kỳ nội dung nào chứa trong `<br>`. Đây có thể là một trải nghiệm gây bối rối và thất vọng cho người sử dụng trình đọc màn hình.

Sử dụng các phần tử `<p>`, và sử dụng các thuộc tính CSS như {{cssxref("margin")}} để kiểm soát khoảng cách của chúng.

## Ví dụ

### br cơ bản

Trong ví dụ sau, chúng ta sử dụng các phần tử `<br>` để tạo dấu ngắt dòng giữa các dòng khác nhau của địa chỉ bưu chính:

```html
Mozilla<br />
331 E. Evelyn Avenue<br />
Mountain View, CA<br />
94041<br />
USA<br />
```

#### Kết quả

{{ EmbedLiveSample('Basic_br', 640, 120) }}

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
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Không có; đây là {{Glossary("void element", "phần tử rỗng")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Phải có thẻ mở và không được có thẻ đóng. Trong các tài liệu XHTML,
        viết phần tử này là <code>&#x3C;br /></code>.
      </td>
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
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLBRElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("address")}}
- Phần tử {{HTMLElement("p")}}
- Phần tử {{HTMLElement("wbr")}}
