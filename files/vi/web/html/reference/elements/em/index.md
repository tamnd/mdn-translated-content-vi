---
title: "<em>: The Emphasis element"
slug: Web/HTML/Reference/Elements/em
page-type: html-element
browser-compat: html.elements.em
sidebar: htmlsidebar
---

Phần tử **`<em>`** trong [HTML](/en-US/docs/Web/HTML) đánh dấu văn bản có sự nhấn mạnh về ngữ điệu. Phần tử `<em>` có thể được lồng nhau, với mỗi cấp độ lồng nhau chỉ ra mức độ nhấn mạnh cao hơn.

{{InteractiveExample("HTML Demo: &lt;em&gt;", "tabbed-shorter")}}

```html interactive-example
<p>Get out of bed <em>now</em>!</p>

<p>We <em>had</em> to do something about it.</p>

<p>This is <em>not</em> a drill!</p>
```

```css interactive-example
em {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Phần tử `<em>` dành cho các từ có sự nhấn mạnh về ngữ điệu so với văn bản xung quanh, thường được giới hạn ở một từ hoặc các từ trong câu và ảnh hưởng đến ý nghĩa của câu đó.

Thông thường phần tử này được hiển thị bằng kiểu chữ nghiêng. Tuy nhiên, không nên sử dụng nó để áp dụng kiểu chữ nghiêng; hãy sử dụng thuộc tính CSS {{cssxref("font-style")}} cho mục đích đó. Sử dụng phần tử {{HTMLElement("cite")}} để đánh dấu tiêu đề của một tác phẩm (sách, vở kịch, bài hát, v.v.). Sử dụng phần tử {{HTMLElement("i")}} để đánh dấu văn bản có giọng điệu hoặc tâm trạng khác, bao gồm nhiều tình huống phổ biến cho chữ nghiêng như tên khoa học hoặc các từ trong ngôn ngữ khác. Sử dụng phần tử {{HTMLElement("strong")}} để đánh dấu văn bản có tầm quan trọng hơn văn bản xung quanh.

### \<i> so với \<em>

Một số nhà phát triển có thể bị nhầm lẫn bởi cách nhiều phần tử dường như tạo ra kết quả trực quan tương tự. `<em>` và `<i>` là một ví dụ phổ biến, vì cả hai đều in nghiêng văn bản. Sự khác biệt là gì? Cái nào nên sử dụng?

Theo mặc định, kết quả trực quan giống nhau. Tuy nhiên, ý nghĩa ngữ nghĩa khác nhau. Phần tử `<em>` đại diện cho sự nhấn mạnh về ngữ điệu của nội dung, trong khi phần tử `<i>` đại diện cho văn bản được tách biệt khỏi văn xuôi thông thường, chẳng hạn như từ nước ngoài, suy nghĩ của nhân vật hư cấu, hoặc khi văn bản đề cập đến định nghĩa của một từ thay vì đại diện cho ý nghĩa ngữ nghĩa của nó. (Tiêu đề của một tác phẩm, chẳng hạn như tên sách hoặc phim, nên sử dụng `<cite>`.)

Điều này có nghĩa là cái đúng để sử dụng phụ thuộc vào tình huống. Không phải cái nào cũng dùng cho mục đích trang trí thuần túy, đó là những gì tạo kiểu CSS dành cho.

Ví dụ cho `<em>` có thể là:

```html live-sample___em-example
<p>Just <em>do</em> it already!</p>
<p>We <em>had</em> to do something about it.</p>
```

{{EmbedLiveSample('em-example', "", 85)}}

Một người hoặc phần mềm đọc văn bản sẽ phát âm các từ in nghiêng với sự nhấn mạnh, sử dụng nhấn giọng bằng lời nói.

Ví dụ cho `<i>` có thể là:

```html live-sample___i-example
<p>The word <i>the</i> is an article.</p>
<p>The <i>Queen Mary</i> sailed last night.</p>
```

{{EmbedLiveSample('i-example', "", 85)}}

Ở đây, không có thêm sự nhấn mạnh hoặc tầm quan trọng vào từ "Queen Mary". Nó chỉ cho biết rằng đối tượng được đề cập không phải là một nữ hoàng tên Mary mà là một con tàu tên "Queen Mary".

## Ví dụ

Trong ví dụ này, phần tử `<em>` được sử dụng để làm nổi bật sự đối lập ngầm định hoặc rõ ràng giữa hai danh sách nguyên liệu:

```html
<p>
  Ice cream is made with milk, sweetener, and cream. Frozen custard, on the
  other hand, is made of milk, cream, sweetener, and <em>egg yolks</em>.
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
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">emphasis</a
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

- {{HTMLElement("i")}}
