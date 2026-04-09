---
title: "<i>: The Idiomatic Text element"
slug: Web/HTML/Reference/Elements/i
page-type: html-element
browser-compat: html.elements.i
sidebar: htmlsidebar
---

Phần tử **`<i>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một dải văn bản được tách biệt khỏi văn bản thông thường vì một lý do nào đó, chẳng hạn như văn bản thành ngữ, thuật ngữ kỹ thuật, chỉ định phân loại học, trong số những lý do khác. Về mặt lịch sử, những điều này đã được trình bày bằng kiểu chữ nghiêng, đó là nguồn gốc ban đầu của việc đặt tên phần tử `<i>` này.

{{InteractiveExample("HTML Demo: &lt;i&gt;", "tabbed-shorter")}}

```html interactive-example
<p>I looked at it and thought <i>This can't be real!</i></p>

<p>
  <i>Musa</i> is one of two or three genera in the family <i>Musaceae</i>; it
  includes bananas and plantains.
</p>

<p>
  The term <i>bandwidth</i> describes the measure of how much information can
  pass through a data connection in a given amount of time.
</p>
```

```css interactive-example
i {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Sử dụng phần tử `<i>` cho văn bản được tách biệt khỏi văn xuôi thông thường vì lý do dễ đọc. Đây sẽ là một dải văn bản có ý nghĩa ngữ nghĩa khác so với văn bản xung quanh. Trong số các trường hợp sử dụng phần tử `<i>` có các đoạn văn bản đại diện cho một chất lượng hoặc chế độ khác của văn bản, chẳng hạn như:
  - Giọng điệu hoặc tâm trạng thay thế
  - Chỉ định phân loại học (như chi và loài "_Homo sapiens_")
  - Các thuật ngữ thành ngữ từ ngôn ngữ khác (chẳng hạn như "_et cetera_"); những điều này nên bao gồm thuộc tính [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) để xác định ngôn ngữ
  - Thuật ngữ kỹ thuật
  - Phiên âm
  - Suy nghĩ (chẳng hạn như "Cô ấy tự hỏi, _Nhà văn này đang nói về điều gì vậy?_")
  - Tên tàu hoặc phương tiện trong hệ thống viết phương Tây (chẳng hạn như "Họ tìm kiếm các bến cảng cho _Empress of the Galaxy_, con tàu mà họ được phân công.")

- Trong các phiên bản trước của đặc tả HTML, phần tử `<i>` chỉ đơn giản là một phần tử trình bày được sử dụng để hiển thị văn bản bằng chữ nghiêng, giống như phần tử `<b>` được sử dụng để hiển thị văn bản bằng chữ đậm. Điều này không còn đúng nữa, vì các thẻ này hiện xác định ngữ nghĩa thay vì giao diện kiểu chữ. Trình duyệt thường vẫn sẽ hiển thị nội dung của phần tử `<i>` bằng kiểu chữ nghiêng, nhưng theo định nghĩa, không còn bắt buộc phải làm vậy. Để hiển thị văn bản bằng kiểu chữ nghiêng, tác giả nên sử dụng thuộc tính CSS {{cssxref("font-style")}}.
- Hãy chắc chắn rằng văn bản được đề cập không thực sự phù hợp hơn khi được đánh dấu bằng một phần tử khác.
  - Sử dụng {{HTMLElement("em")}} để chỉ ra sự nhấn mạnh về ngữ điệu.
  - Sử dụng {{HTMLElement("strong")}} để chỉ ra tầm quan trọng, mức độ nghiêm trọng, hoặc tính khẩn cấp.
  - Sử dụng {{HTMLElement("mark")}} để chỉ ra tính liên quan.
  - Sử dụng {{HTMLElement("cite")}} để đánh dấu tên của một tác phẩm, chẳng hạn như sách, vở kịch, hoặc bài hát.
  - Sử dụng {{HTMLElement("dfn")}} để đánh dấu trường hợp định nghĩa của một thuật ngữ.

## Ví dụ

Ví dụ này minh họa việc sử dụng phần tử `<i>` để đánh dấu văn bản bằng ngôn ngữ khác.

```html
<p>
  The Latin phrase <i lang="la">Veni, vidi, vici</i> is often mentioned in
  music, art, and literature.
</p>
```

### Kết quả

{{EmbedLiveSample("Examples")}}

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
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
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
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("em")}}
- Các phần tử nghiêng khác: {{HTMLElement("var")}}, {{HTMLElement("dfn")}}, {{HTMLElement("cite")}}, {{HTMLElement("address")}}
