---
title: "<li>: Phần tử Mục danh sách"
slug: Web/HTML/Reference/Elements/li
page-type: html-element
browser-compat: html.elements.li
sidebar: htmlsidebar
---

Phần tử **`<li>`** trong [HTML](/en-US/docs/Web/HTML) được sử dụng để đại diện cho một mục trong danh sách. Nó phải được chứa trong một phần tử cha: danh sách có thứ tự ({{HTMLElement("ol")}}), danh sách không có thứ tự ({{HTMLElement("ul")}}), hoặc menu ({{HTMLElement("menu")}}). Trong menu và danh sách không có thứ tự, các mục trong danh sách thường được hiển thị bằng dấu đầu dòng. Trong danh sách có thứ tự, chúng thường được hiển thị với bộ đếm tăng dần ở bên trái, chẳng hạn như số hoặc chữ cái.

{{InteractiveExample("HTML Demo: &lt;li&gt;", "tabbed-shorter")}}

```html interactive-example
<p>Apollo astronauts:</p>

<ul>
  <li>Neil Armstrong</li>
  <li>Alan Bean</li>
  <li>Peter Conrad</li>
  <li>Edgar Mitchell</li>
  <li>Alan Shepard</li>
</ul>
```

```css interactive-example
p,
li {
  font:
    1rem "Fira Sans",
    sans-serif;
}

p {
  font-weight: bold;
}
```

## Thuộc tính

Phần tử này bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `value`
  - : Thuộc tính số nguyên này chỉ ra giá trị thứ tự hiện tại của mục trong danh sách như được xác định bởi phần tử {{HTMLElement("ol")}}. Giá trị duy nhất được phép cho thuộc tính này là một số, ngay cả khi danh sách được hiển thị bằng số La Mã hoặc chữ cái. Các mục trong danh sách theo sau sẽ tiếp tục đánh số từ giá trị được đặt. Thuộc tính này không có ý nghĩa đối với danh sách không có thứ tự ({{HTMLElement("ul")}}) hoặc menu ({{HTMLElement("menu")}}).
- `type` {{Deprecated_inline}}
  - : Thuộc tính ký tự này chỉ ra kiểu đánh số:
    - `a`: chữ cái thường
    - `A`: chữ cái hoa
    - `i`: số La Mã thường
    - `I`: số La Mã hoa
    - `1`: số

    Kiểu này ghi đè lên kiểu được sử dụng bởi phần tử {{HTMLElement("ol")}} cha, nếu có.

    > [!NOTE]
    > Thuộc tính này đã bị lỗi thời; hãy sử dụng thuộc tính CSS {{cssxref("list-style-type")}} thay thế.

## Ví dụ

Để biết thêm ví dụ chi tiết, xem các trang {{htmlelement("ol")}} và {{htmlelement("ul")}}.

### Danh sách có thứ tự

```html
<ol>
  <li>first item</li>
  <li>second item</li>
  <li>third item</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Ordered_list")}}

### Danh sách có thứ tự với giá trị tùy chỉnh

```html
<ol type="I">
  <li value="3">third item</li>
  <li>fourth item</li>
  <li>fifth item</li>
</ol>
```

#### Kết quả

{{EmbedLiveSample("Ordered_list_with_a_custom_value")}}

### Danh sách không có thứ tự

```html
<ul>
  <li>first item</li>
  <li>second item</li>
  <li>third item</li>
</ul>
```

#### Kết quả

{{EmbedLiveSample("Unordered_list")}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>Không có.</td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ đóng có thể bị bỏ qua nếu mục trong danh sách ngay sau đó là
        một phần tử <code>&lt;li&gt;</code> khác, hoặc nếu không còn
        nội dung nào trong phần tử cha của nó.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Phần tử {{HTMLElement("ul")}}, {{HTMLElement("ol")}}, hoặc
        {{HTMLElement("menu")}}. Mặc dù không phải cách sử dụng phù hợp,
        phần tử lỗi thời {{HTMLElement("dir")}} cũng có thể là cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/listitem_role"
            >listitem</a
          ></code
        >
        khi là con của phần tử
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/ol">ol</a></code
        >, <code><a href="/en-US/docs/Web/HTML/Reference/Elements/ul">ul</a></code> hoặc
        <code><a href="/en-US/docs/Web/HTML/Reference/Elements/menu">menu</a></code>
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitem_role"><code>menuitem</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemcheckbox_role"><code>menuitemcheckbox</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/menuitemradio_role"><code>menuitemradio</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/option_role"><code>option</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/none_role"><code>none</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/presentation_role"><code>presentation</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role"><code>radio</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/separator_role"><code>separator</code></a>,
        <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/tab_role"><code>tab</code></a>, <a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/treeitem_role"><code>treeitem</code></a>
      </td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLLIElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử HTML liên quan đến danh sách khác: {{HTMLElement("ul")}}, {{HTMLElement("ol")}}, {{HTMLElement("menu")}}, và phần tử lỗi thời {{HTMLElement("dir")}};
- Các thuộc tính CSS có thể đặc biệt hữu ích để tạo kiểu cho phần tử `<li>`:
  - Thuộc tính {{cssxref("list-style")}}, để chọn cách hiển thị số thứ tự,
  - [CSS counters](/en-US/docs/Web/CSS/Guides/Counter_styles/Using_counters), để xử lý các danh sách lồng nhau phức tạp,
  - Thuộc tính {{cssxref("margin")}}, để kiểm soát thụt lề của mục trong danh sách.
