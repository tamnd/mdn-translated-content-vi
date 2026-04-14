---
title: "<ins>: Phần tử văn bản được chèn"
slug: Web/HTML/Reference/Elements/ins
page-type: html-element
browser-compat: html.elements.ins
sidebar: htmlsidebar
---

Phần tử **`<ins>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn một đoạn văn bản đã được thêm vào tài liệu. Bạn có thể sử dụng phần tử {{HTMLElement("del")}} để biểu diễn tương tự một đoạn văn bản đã bị xóa khỏi tài liệu.

{{InteractiveExample("HTML Demo: &lt;ins&gt;", "tabbed-standard")}}

```html interactive-example
<p>&ldquo;You're late!&rdquo;</p>
<del>
  <p>&ldquo;I apologize for the delay.&rdquo;</p>
</del>
<ins cite="../how-to-be-a-wizard.html" datetime="2018-05">
  <p>&ldquo;A wizard is never late &hellip;&rdquo;</p>
</ins>
```

```css interactive-example
del,
ins {
  display: block;
  text-decoration: none;
  position: relative;
}

del {
  background-color: #ffbbbb;
}

ins {
  background-color: #d4fcbc;
}

del::before,
ins::before {
  position: absolute;
  left: 0.5rem;
  font-family: monospace;
}

del::before {
  content: "−";
}

ins::before {
  content: "+";
}

p {
  margin: 0 1.8rem;
  font-family: "Georgia", serif;
  font-size: 1rem;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `cite`
  - : Thuộc tính này định nghĩa URI của tài nguyên giải thích về sự thay đổi, chẳng hạn như liên kết đến biên bản cuộc họp hoặc vé trong hệ thống xử lý sự cố.
- `datetime`
  - : Thuộc tính này cho biết thời gian và ngày tháng của sự thay đổi và phải là một ngày hợp lệ với chuỗi thời gian tùy chọn. Nếu giá trị không thể được phân tích cú pháp thành ngày với chuỗi thời gian tùy chọn, phần tử không có dấu thời gian liên quan. Để biết định dạng của chuỗi không có thời gian, xem [Định dạng chuỗi ngày hợp lệ](/vi/docs/Web/HTML/Guides/Date_and_time_formats#date_strings). Định dạng của chuỗi nếu bao gồm cả ngày và giờ được trình bày trong [Định dạng chuỗi ngày giờ địa phương hợp lệ](/vi/docs/Web/HTML/Guides/Date_and_time_formats#local_date_and_time_strings).

## Khả năng tiếp cận

Sự hiện diện của phần tử `<ins>` thường không được thông báo bởi hầu hết các công nghệ đọc màn hình trong cấu hình mặc định. Có thể khiến nó được thông báo bằng cách sử dụng thuộc tính CSS {{cssxref("content")}}, cùng với các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}}.

```css
ins::before,
ins::after {
  clip-path: inset(100%);
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

ins::before {
  content: " [insertion start] ";
}

ins::after {
  content: " [insertion end] ";
}
```

Một số người dùng đọc màn hình cố ý tắt thông báo nội dung gây ra sự dài dòng thêm. Chính vì vậy, điều quan trọng là không lạm dụng kỹ thuật này và chỉ áp dụng nó trong các tình huống mà việc không biết nội dung đã được chèn vào sẽ ảnh hưởng xấu đến việc hiểu tài liệu.

- [Short note on making your mark (more accessible) | Vispero](https://vispero.com/resources/short-note-on-making-your-mark-more-accessible/)
- [Tweaking Text Level Styles | Adrian Roselli](https://adrianroselli.com/2017/12/tweaking-text-level-styles.html)

## Ví dụ

```html
<ins>This text has been inserted</ins>
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/vi/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >,
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a
          href="/vi/docs/Web/HTML/Guides/Content_categories#transparent_content_model"
          >Trong suốt</a
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
        <a href="/vi/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">insertion</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLModElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("del")}} để đánh dấu xóa trong tài liệu
