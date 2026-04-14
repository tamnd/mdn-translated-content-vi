---
title: "<del>: Phần tử văn bản đã xóa"
slug: Web/HTML/Reference/Elements/del
page-type: html-element
browser-compat: html.elements.del
sidebar: htmlsidebar
---

Phần tử **`<del>`** trong [HTML](/vi/docs/Web/HTML) biểu diễn một đoạn văn bản đã bị xóa khỏi tài liệu. Điều này có thể được sử dụng khi hiển thị thông tin "theo dõi thay đổi" hoặc thông tin diff mã nguồn chẳng hạn. Phần tử {{HTMLElement("ins")}} có thể được sử dụng cho mục đích ngược lại: để chỉ ra văn bản đã được thêm vào tài liệu.

{{InteractiveExample("HTML Demo: &lt;del&gt;", "tabbed-standard")}}

```html interactive-example
<blockquote>
  There is <del>nothing</del> <ins>no code</ins> either good or bad, but
  <del>thinking</del> <ins>running it</ins> makes it so.
</blockquote>
```

```css interactive-example
del {
  text-decoration: line-through;
  background-color: #ffbbbb;
  color: #555555;
}

ins {
  text-decoration: none;
  background-color: #d4fcbc;
}

blockquote {
  padding-left: 15px;
  border-left: 3px solid #d7d7db;
  font-size: 1rem;
}
```

Phần tử này thường (nhưng không bắt buộc) được hiển thị bằng cách áp dụng kiểu gạch ngang cho văn bản.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [các thuộc tính toàn cục](/vi/docs/Web/HTML/Reference/Global_attributes).

- `cite`
  - : Một URI đến tài nguyên giải thích về sự thay đổi (ví dụ: biên bản cuộc họp).
- `datetime`
  - : Thuộc tính này cho biết thời gian và ngày tháng của sự thay đổi và phải là một chuỗi ngày hợp lệ với thời gian tùy chọn. Nếu giá trị không thể được phân tích cú pháp thành ngày với chuỗi thời gian tùy chọn, phần tử không có dấu thời gian liên quan. Để biết định dạng của chuỗi không có thời gian, xem [Chuỗi ngày tháng](/vi/docs/Web/HTML/Guides/Date_and_time_formats#date_strings). Định dạng của chuỗi nếu bao gồm cả ngày và giờ được trình bày trong [Chuỗi ngày giờ địa phương](/vi/docs/Web/HTML/Guides/Date_and_time_formats#local_date_and_time_strings).

## Khả năng tiếp cận

Sự hiện diện của phần tử `del` thường không được thông báo bởi hầu hết các công nghệ đọc màn hình trong cấu hình mặc định. Có thể khiến nó được thông báo bằng cách sử dụng thuộc tính CSS {{cssxref("content")}}, cùng với các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}}.

```css
del::before,
del::after {
  clip-path: inset(100%);
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

del::before {
  content: " [deletion start] ";
}

del::after {
  content: " [deletion end] ";
}
```

Một số người dùng đọc màn hình cố ý tắt thông báo nội dung gây ra sự dài dòng thêm. Chính vì vậy, điều quan trọng là không lạm dụng kỹ thuật này và chỉ áp dụng nó trong các tình huống mà việc không biết nội dung đã bị xóa sẽ ảnh hưởng xấu đến việc hiểu tài liệu.

- [Short note on making your mark (more accessible) | Vispero](https://vispero.com/resources/short-note-on-making-your-mark-more-accessible/)
- [Tweaking Text Level Styles | Adrian Roselli](https://adrianroselli.com/2017/12/tweaking-text-level-styles.html)

## Ví dụ

```html
<p><del>This text has been deleted</del>, here is the rest of the paragraph.</p>
<del><p>This paragraph has been deleted.</p></del>
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
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">deletion</a
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

- Phần tử {{HTMLElement("ins")}} để chèn thêm vào văn bản
- Phần tử {{HTMLElement("s")}} để gạch ngang độc lập với việc biểu diễn xóa văn bản
