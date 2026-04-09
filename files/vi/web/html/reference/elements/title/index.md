---
title: "<title>: The Document Title element"
slug: Web/HTML/Reference/Elements/title
page-type: html-element
browser-compat: html.elements.title
sidebar: htmlsidebar
---

Phần tử **`<title>`** [HTML](/en-US/docs/Web/HTML) xác định tiêu đề của tài liệu được hiển thị trong thanh tiêu đề hoặc tab trang của {{glossary("Browser", "trình duyệt")}}. Nó chỉ chứa văn bản; các thẻ HTML trong phần tử, nếu có, cũng được coi là văn bản thuần túy.

```html
<title>Grandma's Heavy Metal Festival Journal</title>
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Phần tử `<title>` luôn được sử dụng trong block {{HTMLElement("head")}} của trang.

### Tiêu đề trang và SEO

Nội dung của tiêu đề trang có thể có tác động đáng kể đến tối ưu hóa công cụ tìm kiếm ({{glossary("SEO")}}). Nói chung, tiêu đề dài hơn, mô tả tốt hơn so với tiêu đề ngắn hoặc chung chung. Nội dung của tiêu đề là một trong các thành phần được thuật toán của công cụ tìm kiếm sử dụng để quyết định thứ tự liệt kê các trang trong kết quả tìm kiếm. Ngoài ra, tiêu đề là "móc câu" ban đầu để thu hút sự chú ý của độc giả khi xem trang kết quả tìm kiếm.

Một số hướng dẫn và mẹo để soạn tiêu đề tốt:

- Tránh tiêu đề một hoặc hai từ. Sử dụng cụm từ mô tả, hoặc cặp thuật ngữ-định nghĩa cho các trang kiểu từ điển hoặc tài liệu tham khảo.
- Công cụ tìm kiếm thường hiển thị khoảng 55–60 ký tự đầu tiên của tiêu đề trang. Văn bản vượt quá đó có thể bị mất, vì vậy hãy cố gắng không có tiêu đề dài hơn thế. Nếu bạn phải sử dụng tiêu đề dài hơn, hãy đảm bảo các phần quan trọng xuất hiện trước và không có gì quan trọng ở phần tiêu đề có thể bị bỏ.
- Đừng sử dụng "từ khóa nhồi nhét". Nếu tiêu đề của bạn chỉ là danh sách các từ, các thuật toán thường giảm vị trí trang của bạn trong kết quả tìm kiếm.
- Hãy cố gắng đảm bảo tiêu đề của bạn càng duy nhất càng tốt trong trang web của bạn. Tiêu đề trùng lặp — hoặc gần như trùng lặp — có thể góp phần vào kết quả tìm kiếm không chính xác.

## Khả năng tiếp cận

Điều quan trọng là cung cấp tiêu đề chính xác và ngắn gọn để mô tả mục đích của trang.

Kỹ thuật điều hướng phổ biến cho người dùng công nghệ hỗ trợ là đọc tiêu đề trang và suy ra nội dung trang chứa. Điều này vì điều hướng vào một trang để xác định nội dung của nó có thể là quá trình tốn thời gian và có thể gây nhầm lẫn. Tiêu đề phải duy nhất cho mỗi trang của trang web, lý tưởng nhất là đề cập đến mục đích chính của trang trước, theo sau là tên của trang web. Theo mẫu này sẽ giúp đảm bảo mục đích chính của trang được thông báo bởi trình đọc màn hình trước. Điều này cung cấp trải nghiệm tốt hơn nhiều so với việc phải nghe tên của trang web trước tiêu đề trang duy nhất, cho mỗi trang mà người dùng điều hướng đến trong cùng một trang web.

### Ví dụ

```html
<title>Menu - Blue House Chinese Food - FoodYum: Online takeout today!</title>
```

Nếu một biểu mẫu gửi có lỗi và việc gửi hiển thị lại trang hiện tại, tiêu đề có thể được sử dụng để giúp người dùng nhận biết bất kỳ lỗi nào với lần gửi của họ. Ví dụ: cập nhật giá trị `title` của trang để phản ánh các thay đổi trạng thái trang quan trọng (như vấn đề xác nhận biểu mẫu).

```html
<title>
  2 errors - Your order - Sea Food Store - Food: Online takeout today!
</title>
```

> [!NOTE]
> Hiện tại, việc cập nhật động tiêu đề trang sẽ không được tự động thông báo bởi trình đọc màn hình. Nếu bạn sẽ cập nhật tiêu đề trang để phản ánh các thay đổi đáng kể về trạng thái trang, thì việc sử dụng [Vùng ARIA Live](/en-US/docs/Web/Accessibility/ARIA/Guides/Live_regions) cũng có thể cần thiết.

- [MDN Understanding WCAG, Guideline 2.4 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Operable#guideline_2.4_—_navigable_provide_ways_to_help_users_navigate_find_content_and_determine_where_they_are)
- [Understanding Success Criterion 2.4.2 | W3C Understanding WCAG 2.1](https://www.w3.org/WAI/WCAG21/Understanding/page-titled.html)

## Ví dụ

```html
<title>Awesome interesting stuff</title>
```

Ví dụ này thiết lập trang có tiêu đề (như được hiển thị ở trên cùng của cửa sổ hoặc trong tab của cửa sổ) là "Awesome interesting stuff".

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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#metadata_content"
          >Nội dung metadata</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Văn bản không phải là {{glossary("whitespace")}} giữa các phần tử.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Cả thẻ mở và thẻ đóng đều được yêu cầu. Lưu ý rằng việc bỏ
        <code>&#x3C;/title></code> sẽ khiến trình duyệt bỏ qua phần còn lại
        của trang.
      </td>
    </tr>
    <tr>
      <th scope="row">Cha được phép</th>
      <td>
        Phần tử {{ HTMLElement("head") }} không chứa phần tử
        <code>&lt;title&gt;</code> khác.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ẩn</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> được phép.</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLTitleElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử SVG {{svgelement("title")}}
