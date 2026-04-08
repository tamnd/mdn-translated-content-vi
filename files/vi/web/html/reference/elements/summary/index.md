---
title: "<summary>: Phần tử tóm tắt tiết lộ"
slug: Web/HTML/Reference/Elements/summary
page-type: html-element
browser-compat: html.elements.summary
sidebar: htmlsidebar
---

Phần tử **`<summary>`** trong [HTML](/en-US/docs/Web/HTML) chỉ định tóm tắt, chú thích hoặc chú giải cho hộp tiết lộ của phần tử {{HTMLElement("details")}}. Nhấp vào phần tử `<summary>` sẽ chuyển đổi trạng thái mở và đóng của phần tử `<details>` cha.

{{InteractiveExample("HTML Demo: &lt;summary&gt;", "tabbed-shorter")}}

```html interactive-example
<details>
  <summary>
    I have keys but no doors. I have space but no room. You can enter but can't
    leave. What am I?
  </summary>
  A keyboard.
</details>
```

```css interactive-example
details {
  border: 1px solid #aaaaaa;
  border-radius: 4px;
  padding: 0.5em 0.5em 0;
}

summary {
  font-weight: bold;
  margin: -0.5em -0.5em 0;
  padding: 0.5em;
}

details[open] {
  padding: 0.5em;
}

details[open] summary {
  border-bottom: 1px solid #aaaaaa;
  margin-bottom: 0.5em;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Nội dung của phần tử `<summary>` có thể là bất kỳ nội dung tiêu đề, văn bản thuần túy hoặc HTML nào có thể dùng trong đoạn văn.

Phần tử `<summary>` chỉ _có thể_ được dùng làm con đầu tiên của phần tử `<details>`. Khi người dùng nhấp vào summary, phần tử `<details>` cha sẽ được chuyển đổi giữa trạng thái mở hoặc đóng, và sau đó một sự kiện {{domxref("HTMLElement/toggle_event", "toggle")}} được gửi đến phần tử `<details>`, có thể được dùng để biết khi nào thay đổi trạng thái này xảy ra.

Nội dung của `<details>` cung cấp {{glossary("accessible description")}} (mô tả có thể tiếp cận) cho `<summary>`.

### Văn bản nhãn mặc định

Nếu con đầu tiên của phần tử `<details>` không phải là phần tử `<summary>`, {{Glossary("user agent")}} sẽ dùng chuỗi mặc định (thường là "Details") làm nhãn cho hộp tiết lộ.

### Kiểu mặc định

Theo đặc tả HTML, kiểu mặc định cho các phần tử `<summary>` bao gồm `display: list-item`. Điều này cho phép thay đổi hoặc xóa biểu tượng hiển thị làm tiện ích tiết lộ bên cạnh nhãn so với mặc định, thường là tam giác.

Bạn cũng có thể thay đổi kiểu thành `display: block` để xóa tam giác tiết lộ.

Xem phần [Tương thích trình duyệt](#browser_compatibility) để biết thêm chi tiết, vì không phải tất cả các trình duyệt đều hỗ trợ đầy đủ chức năng của phần tử này.

Đối với các trình duyệt dựa trên WebKit, như Safari, có thể kiểm soát hiển thị biểu tượng thông qua phần tử giả CSS không chuẩn `::-webkit-details-marker`. Để xóa tam giác tiết lộ, dùng `summary::-webkit-details-marker { display: none }`.

## Ví dụ

Dưới đây là một số ví dụ hiển thị `<summary>` trong sử dụng. Bạn có thể tìm thêm ví dụ trong tài liệu về phần tử {{HTMLElement("details")}}.

### Ví dụ cơ bản

Một ví dụ cơ bản hiển thị cách dùng `<summary>` trong phần tử {{HTMLElement("details")}}:

```html
<details open>
  <summary>Overview</summary>
  <ol>
    <li>Cash on hand: $500.00</li>
    <li>Current invoice: $75.30</li>
    <li>Due date: 5/6/19</li>
  </ol>
</details>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 650, 120)}}

### Tóm tắt dưới dạng tiêu đề

Bạn có thể dùng các phần tử tiêu đề trong `<summary>`, như thế này:

```html
<details open>
  <summary><h4>Overview</h4></summary>
  <ol>
    <li>Cash on hand: $500.00</li>
    <li>Current invoice: $75.30</li>
    <li>Due date: 5/6/19</li>
  </ol>
</details>
```

#### Kết quả

{{EmbedLiveSample("Summaries_as_headings", 650, 200)}}

Hiện tại có một số vấn đề về khoảng cách có thể được giải quyết bằng CSS.

> [!WARNING]
> Vai trò được gán cho phần tử `<summary>` khác nhau tùy trình duyệt. Một số vẫn gán cho nó vai trò mặc định [`button`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/button_role), điều này xóa tất cả các vai trò khỏi các con của nó. Sự không nhất quán này có thể gây ra vấn đề cho người dùng công nghệ hỗ trợ như trình đọc màn hình (`<h4>` trong ví dụ trước sẽ bị xóa vai trò và sẽ không được coi là tiêu đề cho những người dùng này). Bạn nên kiểm tra triển khai `<summary>` của mình trên nhiều nền tảng để đảm bảo hỗ trợ trợ năng nhất quán.

### HTML trong tóm tắt

Ví dụ này thêm một số ngữ nghĩa vào phần tử `<summary>` để chỉ ra nhãn là quan trọng:

```html
<details open>
  <summary><strong>Overview</strong></summary>
  <ol>
    <li>Cash on hand: $500.00</li>
    <li>Current invoice: $75.30</li>
    <li>Due date: 5/6/19</li>
  </ol>
</details>
```

#### Kết quả

{{EmbedLiveSample("HTML_in_summaries", 650, 150)}}

### Thay đổi biểu tượng tóm tắt

Dấu của phần tử `<summary>`, tức là tam giác tiết lộ, có thể được tùy chỉnh bằng CSS. Dấu có thể được nhắm đến bằng phần tử giả {{cssxref("::marker")}}, chấp nhận thuộc tính viết tắt {{cssxref("list-style")}} và các thuộc tính thành phần của nó, như {{cssxref("list-style-type")}}. Điều này cho phép thay đổi tam giác thành hình ảnh (thường với {{cssxref("list-style-image")}}) hoặc chuỗi (bao gồm cả emoji). Trong ví dụ này, chúng ta thay thế nội dung của một tiện ích tiết lộ và xóa biểu tượng khỏi tiện ích khác bằng cách đặt `list-style: none` trước khi thêm biểu tượng tiết lộ tùy chỉnh qua nội dung được tạo ra.

#### CSS

Trong tiện ích tiết lộ đầu tiên, chúng ta tạo kiểu cho `::marker`, thay đổi {{cssxref("content")}} dựa trên thuộc tính `[open]` của phần tử `<details>`. Đối với tiện ích thứ hai, chúng ta xóa dấu bằng thuộc tính `list-style`, rồi thêm nội dung được tạo ra có kiểu với phần tử giả {{cssxref("::after")}}. Chúng ta cũng bao gồm các kiểu cho `::-webkit-details-marker` để nhắm đến Safari. Bộ chọn cho phần tử giả dành riêng cho trình duyệt được bao gồm trong lớp giả {{cssxref(":is()")}} để nó không làm mất hiệu lực danh sách bộ chọn.

```css
details {
  font-size: 1rem;
  font-family: "Open Sans", "Calibri", sans-serif;
  border: solid;
  padding: 2px 6px;
  margin-bottom: 1em;
}

details:first-of-type summary::marker,
:is(::-webkit-details-marker) {
  content: "+ ";
  font-family: monospace;
  color: red;
  font-weight: bold;
}

details[open]:first-of-type summary::marker {
  content: "− ";
}

details:last-of-type summary {
  list-style: none;
  &::after {
    content: "+";
    color: white;
    background-color: darkgreen;
    border-radius: 1em;
    font-weight: bold;
    padding: 0 5px;
    margin-inline-start: 5px;
  }
  [open] &::after {
    content: "−";
  }
}
details:last-of-type summary::-webkit-details-marker {
  display: none;
}
```

CSS bao gồm [bộ chọn thuộc tính](/en-US/docs/Web/CSS/Reference/Selectors/Attribute_selectors) `[open]`, chỉ khớp khi thuộc tính `open` có mặt (khi `<details>` đang mở). Các lớp giả {{cssxref(":first-of-type")}} và {{cssxref(":last-of-type")}} nhắm đến phần tử đầu tiên và anh chị em của cùng loại. Chúng ta bao gồm phần tử giả có tiền tố `-webkit-` trong lớp giả {{cssxref(":is()")}} vì nó nhận một [danh sách bộ chọn tha thứ](/en-US/docs/Web/CSS/Reference/Selectors/Selector_list#forgiving_selector_list), vì vậy nếu phần tử giả có tiền tố không hợp lệ trong trình duyệt, toàn bộ khối bộ chọn sẽ không bị vô hiệu. Chúng ta cũng dùng [lồng nhau](/en-US/docs/Web/CSS/Reference/Selectors/Nesting_selector) CSS. Xem mô-đun [bộ chọn CSS](/en-US/docs/Web/CSS/Guides/Selectors).

#### HTML

```html-nolint
<h1>Quotes from Helen Keller</h1>

<details>
  <summary>On women's rights</summary>
  <p>
    <q>We have prayed, we have coaxed, we have begged, for the vote, with the
      hope that men, out of chivalry, would bestow equal rights upon women and
      take them into partnership in the affairs of the state. We hoped that
      their common sense would triumph over prejudices and stupidity. We thought
      their boasted sense of justice would overcome the errors that so often
      fetter the human spirit; but we have always gone away empty-handed. We
      shall beg no more.</q>
  </p>
</details>

<details>
  <summary>On optimism</summary>
  <p>
    <q>Optimism is the faith that leads to achievement; nothing can be done
      without hope.</q>
  </p>
</details>
```

#### Kết quả

{{EmbedLiveSample("Changing the summary's icon", 650, 400)}}

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
        không có
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung diễn đạt</a
        >, tùy chọn xen kẽ với
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#heading_content"
          >Nội dung tiêu đề</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>Không; cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Phần tử {{HTMLElement("details")}}.</td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td> <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">Không có vai trò tương ứng</a></td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Không có <code>role</code> nào được phép</td>
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

- {{HTMLElement("details")}}
