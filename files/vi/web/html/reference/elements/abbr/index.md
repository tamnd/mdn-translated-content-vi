---
title: "<abbr>: The Abbreviation element"
slug: Web/HTML/Reference/Elements/abbr
page-type: html-element
browser-compat: html.elements.abbr
sidebar: htmlsidebar
---

Phần tử **`<abbr>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho một chữ viết tắt hoặc từ viết tắt.

Khi đưa vào một chữ viết tắt hoặc từ viết tắt, hãy cung cấp phần mở rộng đầy đủ của thuật ngữ bằng văn bản thuần túy khi sử dụng lần đầu, cùng với `<abbr>` để đánh dấu chữ viết tắt. Điều này thông báo cho người dùng biết chữ viết tắt hoặc từ viết tắt có nghĩa là gì.

Thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) tùy chọn có thể cung cấp phần mở rộng cho chữ viết tắt hoặc từ viết tắt khi không có phần mở rộng đầy đủ. Điều này cung cấp gợi ý cho user agent về cách thông báo/hiển thị nội dung trong khi thông báo cho tất cả người dùng biết chữ viết tắt có nghĩa là gì. Nếu có mặt, `title` phải chứa mô tả đầy đủ này và không có gì khác.

{{InteractiveExample("HTML Demo: &lt;abbr&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  You can use <abbr>CSS</abbr> (Cascading Style Sheets) to style your
  <abbr>HTML</abbr> (HyperText Markup Language). Using style sheets, you can
  keep your <abbr>CSS</abbr> presentation layer and <abbr>HTML</abbr> content
  layer separate. This is called "separation of concerns."
</p>
```

```css interactive-example
abbr {
  font-style: italic;
  color: chocolate;
}
```

## Thuộc tính

Phần tử này chỉ hỗ trợ [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes). Thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) có ý nghĩa ngữ nghĩa cụ thể khi được sử dụng với phần tử `<abbr>`; nó _phải_ chứa mô tả hoặc phần mở rộng đầy đủ có thể đọc được bởi con người về chữ viết tắt. Văn bản này thường được các trình duyệt hiển thị như tooltip khi con trỏ chuột di chuyển qua phần tử.

Mỗi phần tử `<abbr>` bạn sử dụng độc lập với tất cả các phần tử khác; cung cấp `title` cho một phần tử không tự động gắn cùng văn bản mở rộng đó vào các phần tử khác có cùng nội dung văn bản.

## Ghi chú sử dụng

### Các trường hợp sử dụng điển hình

Không nhất thiết phải đánh dấu tất cả các chữ viết tắt bằng `<abbr>`. Tuy nhiên, có một vài trường hợp khi nên làm vậy:

- Khi sử dụng chữ viết tắt và bạn muốn cung cấp phần mở rộng hoặc định nghĩa bên ngoài luồng nội dung của tài liệu, sử dụng `<abbr>` với [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) phù hợp.
- Để định nghĩa một chữ viết tắt có thể không quen thuộc với người đọc, hãy trình bày thuật ngữ bằng `<abbr>` và văn bản inline cung cấp định nghĩa. Chỉ bao gồm thuộc tính `title` khi phần mở rộng hoặc định nghĩa inline không có sẵn.
- Khi sự hiện diện của chữ viết tắt trong văn bản cần được ghi chú về mặt ngữ nghĩa, phần tử `<abbr>` rất hữu ích. Điều này có thể được sử dụng, lần lượt, cho mục đích tạo kiểu hoặc lập trình.
- Bạn có thể sử dụng `<abbr>` kết hợp với {{HTMLElement("dfn")}} để thiết lập các định nghĩa cho các thuật ngữ là chữ viết tắt hoặc từ viết tắt. Xem ví dụ [Định nghĩa một chữ viết tắt](#defining_an_abbreviation) dưới đây.

### Cân nhắc về ngữ pháp

Trong các ngôn ngữ có [số ngữ pháp](https://en.wikipedia.org/wiki/Grammatical_number) (tức là các ngôn ngữ nơi số lượng các mục ảnh hưởng đến ngữ pháp của một câu), hãy sử dụng cùng số ngữ pháp trong thuộc tính `title` của bạn như bên trong phần tử `<abbr>` của bạn. Điều này đặc biệt quan trọng trong các ngôn ngữ có hơn hai số, chẳng hạn như tiếng Ả Rập, nhưng cũng liên quan đến tiếng Anh.

## Kiểu dáng mặc định

Mục đích của phần tử này hoàn toàn là để thuận tiện cho tác giả và tất cả các trình duyệt hiển thị nó inline ({{cssxref("display", "display: inline")}}) theo mặc định, mặc dù kiểu dáng mặc định của nó thay đổi từ trình duyệt này sang trình duyệt khác:

Một số trình duyệt thêm gạch chân chấm vào nội dung của phần tử. Các trình duyệt khác thêm gạch chân chấm trong khi chuyển đổi nội dung thành chữ hoa nhỏ. Các trình duyệt khác có thể không tạo kiểu khác so với phần tử {{HTMLElement("span")}}. Để kiểm soát kiểu dáng này, sử dụng {{cssxref('text-decoration')}} và {{cssxref('font-variant')}}.

## Khả năng tiếp cận

Đánh vần đầy đủ từ viết tắt hoặc chữ viết tắt lần đầu tiên nó được sử dụng trên một trang có lợi cho việc giúp mọi người hiểu nó, đặc biệt là nếu nội dung là kỹ thuật hoặc thuật ngữ chuyên ngành.

Chỉ bao gồm `title` nếu không thể mở rộng chữ viết tắt hoặc từ viết tắt trong văn bản. Sự khác biệt giữa từ được thông báo hoặc cụm từ và những gì được hiển thị trên màn hình, đặc biệt nếu đó là thuật ngữ kỹ thuật mà người đọc có thể không quen thuộc, có thể gây khó chịu.

```html
<p>
  JavaScript Object Notation (<abbr>JSON</abbr>) is a lightweight
  data-interchange format.
</p>
```

{{EmbedLiveSample("Accessibility")}}

Điều này đặc biệt hữu ích cho những người không quen thuộc với thuật ngữ hoặc khái niệm được thảo luận trong nội dung, những người mới học ngôn ngữ và những người có mối quan tâm nhận thức.

## Ví dụ

### Đánh dấu chữ viết tắt về mặt ngữ nghĩa

Để đánh dấu một chữ viết tắt mà không cung cấp phần mở rộng hoặc mô tả, hãy sử dụng `<abbr>` không có thuộc tính nào, như được thấy trong ví dụ này.

#### HTML

```html
<p>Using <abbr>HTML</abbr> is fun and easy!</p>
```

#### Kết quả

{{EmbedLiveSample("Marking_up_an_abbreviation_semantically")}}

### Tạo kiểu cho chữ viết tắt

Bạn có thể sử dụng CSS để đặt một kiểu tùy chỉnh cho các chữ viết tắt, như được thấy trong ví dụ cơ bản này.

#### HTML

```html
<p>Using <abbr>CSS</abbr>, you can style your abbreviations!</p>
```

#### CSS

```css
abbr {
  font-variant: all-small-caps;
}
```

#### Kết quả

{{EmbedLiveSample("Styling_abbreviations")}}

### Cung cấp phần mở rộng

Thêm thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Global_attributes/title) cho phép bạn cung cấp phần mở rộng hoặc định nghĩa cho chữ viết tắt hoặc từ viết tắt.

#### HTML

```html
<p>Ashok's joke made me <abbr title="Laugh Out Loud">LOL</abbr> big time.</p>
```

#### Kết quả

{{EmbedLiveSample("Providing_an_expansion")}}

### Định nghĩa một chữ viết tắt

Bạn có thể sử dụng `<abbr>` kết hợp với {{HTMLElement("dfn")}} để định nghĩa chính thức hơn một chữ viết tắt, như được hiển thị ở đây.

#### HTML

```html
<p>
  <dfn id="html"><abbr title="HyperText Markup Language">HTML</abbr> </dfn> is a
  markup language used to create the semantics and structure of a web page.
</p>

<p>
  A <dfn id="spec">Specification</dfn> (<abbr>spec</abbr>) is a document that
  outlines in detail how a technology or API is intended to function and how it
  is accessed.
</p>
```

#### Kết quả

{{EmbedLiveSample("Defining_an_abbreviation", 600, 120)}}

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
        >, nội dung hữu hình
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >
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
        >
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

- [Sử dụng phần tử `<abbr>`](/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features#abbreviations)
