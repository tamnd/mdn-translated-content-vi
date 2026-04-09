---
title: "<u>: Phần tử Chú thích Không có Phát âm (Gạch chân)"
slug: Web/HTML/Reference/Elements/u
page-type: html-element
browser-compat: html.elements.u
sidebar: htmlsidebar
---

Phần tử **`<u>`** [HTML](/en-US/docs/Web/HTML) đại diện cho một đoạn văn bản nội tuyến cần được hiển thị theo cách cho thấy nó có chú thích không phải văn bản. Theo mặc định, nó được hiển thị với một đường gạch chân đơn liền, nhưng có thể được thay đổi bằng CSS.

> [!WARNING]
> Phần tử này trước đây được gọi là phần tử "Underline" (Gạch chân) trong các phiên bản HTML cũ hơn, và đôi khi vẫn bị lạm dụng theo cách này. Để gạch chân văn bản, bạn nên áp dụng một kiểu dáng có thuộc tính CSS {{cssxref("text-decoration")}} được đặt thành `underline`.

{{InteractiveExample("HTML Demo: &lt;u&gt;", "tabbed-shorter")}}

<!-- cSpell:ignore speling corect -->

```html interactive-example
<p>
  You could use this element to highlight <u>speling</u> mistakes, so the writer
  can <u>corect</u> them.
</p>
```

```css interactive-example
p {
  margin: 0;
}

u {
  text-decoration: red wavy underline;
}
```

Xem phần [Ghi chú sử dụng](#usage_notes) để biết thêm chi tiết về khi nào nên và không nên sử dụng `<u>`.

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Cùng với các phần tử tạo kiểu thuần túy khác, phần tử HTML Gạch chân gốc (`<u>`) đã bị loại bỏ trong HTML 4; tuy nhiên, `<u>` đã được phục hồi trong HTML 5 với ý nghĩa ngữ nghĩa mới: để đánh dấu văn bản có một dạng chú thích không phải văn bản nào đó được áp dụng.

> [!NOTE]
> Tránh sử dụng phần tử `<u>` với kiểu dáng mặc định (văn bản có gạch chân) theo cách dễ nhầm lẫn với siêu liên kết, vốn cũng được gạch chân theo mặc định.

### Các trường hợp sử dụng

Các trường hợp sử dụng hợp lệ của phần tử `<u>` bao gồm chú thích lỗi chính tả, áp dụng [dấu tên riêng](https://en.wikipedia.org/wiki/Proper_name_mark) để biểu thị tên riêng trong văn bản tiếng Trung, và các dạng chú thích khác.

Bạn _không nên_ dùng `<u>` để gạch chân văn bản vì mục đích trình bày, hoặc để biểu thị tiêu đề sách.

### Các phần tử khác cần cân nhắc sử dụng

Trong hầu hết các trường hợp, bạn nên sử dụng một phần tử khác thay vì `<u>`, chẳng hạn:

- {{HTMLElement("em")}} để biểu thị nhấn mạnh
- {{HTMLElement("b")}} để thu hút sự chú ý vào văn bản
- {{HTMLElement("mark")}} để đánh dấu từ hoặc cụm từ quan trọng
- {{HTMLElement("strong")}} để cho biết văn bản có tầm quan trọng cao
- {{HTMLElement("cite")}} để đánh dấu tiêu đề sách hoặc các ấn phẩm khác
- {{HTMLElement("i")}} để biểu thị thuật ngữ kỹ thuật, phiên âm, suy nghĩ, hoặc tên tàu trong văn bản phương Tây

Để cung cấp chú thích văn bản (thay vì chú thích không phải văn bản được tạo bằng `<u>`), sử dụng phần tử {{HTMLElement("ruby")}}.

Để áp dụng giao diện gạch chân mà không có ý nghĩa ngữ nghĩa, sử dụng giá trị `underline` của thuộc tính {{cssxref("text-decoration")}}.

## Ví dụ

### Chỉ thị lỗi chính tả

Ví dụ này sử dụng phần tử `<u>` và một số CSS để hiển thị một đoạn văn có lỗi chính tả, với lỗi được chỉ thị bằng kiểu đường gạch chân lượn sóng màu đỏ thường được dùng cho mục đích này.

#### HTML

<!-- cSpell:ignore wrnogly -->

```html
<p>This paragraph includes a <u class="spelling">wrnogly</u> spelled word.</p>
```

Trong HTML, chúng ta thấy cách sử dụng `<u>` với một lớp, `spelling`, được dùng để chỉ thị lỗi chính tả của từ "wrongly".

#### CSS

```css
u.spelling {
  text-decoration: red wavy underline;
}
```

CSS này chỉ thị rằng khi phần tử `<u>` được tạo kiểu với lớp `spelling`, nó sẽ có một đường gạch chân lượn sóng màu đỏ phía dưới văn bản. Đây là kiểu tạo kiểu thông dụng cho lỗi chính tả. Một kiểu phổ biến khác có thể được trình bày bằng `red dashed underline`.

#### Kết quả

Kết quả sẽ quen thuộc với bất kỳ ai đã từng sử dụng các trình xử lý văn bản phổ biến hiện nay.

{{EmbedLiveSample("Indicating_a_spelling_error", 650, 80)}}

### Tránh dùng \<u>

Trong hầu hết các trường hợp, bạn thực sự không muốn dùng `<u>`. Dưới đây là một số ví dụ cho thấy những gì bạn nên làm thay thế trong một số trường hợp.

#### Gạch chân không có ngữ nghĩa

Để gạch chân văn bản mà không ngụ ý bất kỳ ý nghĩa ngữ nghĩa nào, sử dụng phần tử {{HTMLElement("span")}} với thuộc tính {{cssxref("text-decoration")}} được đặt thành `"underline"`, như minh họa dưới đây.

##### HTML

```html
<span class="underline">Today's Special</span>
<br />
Chicken Noodle Soup With Carrots
```

##### CSS

```css
.underline {
  text-decoration: underline;
}
```

##### Kết quả

{{EmbedLiveSample("Non-semantic_underlines", 650, 80)}}

#### Trình bày tiêu đề sách

Tiêu đề sách nên được trình bày bằng phần tử {{HTMLElement("cite")}} thay vì `<u>` hay thậm chí `<i>`.

##### Sử dụng phần tử cite

```html
<p>The class read <cite>Moby-Dick</cite> in the first term.</p>
```

{{EmbedLiveSample("Using_the_cite_element", 650, 80)}}

##### Tạo kiểu cho phần tử cite

Kiểu mặc định của phần tử `<cite>` hiển thị văn bản in nghiêng. Bạn có thể ghi đè điều đó bằng CSS:

```html
<p>The class read <cite>Moby-Dick</cite> in the first term.</p>
```

```css
cite {
  font-style: normal;
  text-decoration: underline;
}
```

{{EmbedLiveSample("Styling_the_cite_element", 650, 80)}}

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
        >, nội dung có thể nhìn thấy.
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
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
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
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("span")}}, {{HTMLElement("i")}}, {{HTMLElement("em")}}, {{HTMLElement("b")}}, và {{HTMLElement("cite")}} thường nên được sử dụng thay thế.
- Thuộc tính CSS {{cssxref("text-decoration")}} nên được dùng để gạch chân không có ngữ nghĩa.
