---
title: "<mark>: The Mark Text element"
slug: Web/HTML/Reference/Elements/mark
page-type: html-element
browser-compat: html.elements.mark
sidebar: htmlsidebar
---

Phần tử **`<mark>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho văn bản được **đánh dấu** hoặc **tô sáng** phục vụ mục đích tham chiếu hoặc ghi chú, vì đoạn được đánh dấu có liên quan trong ngữ cảnh xung quanh.

{{InteractiveExample("HTML Demo: &lt;mark&gt;", "tabbed-shorter")}}

```html interactive-example
<p>Search results for "salamander":</p>

<hr />

<p>
  Several species of <mark>salamander</mark> inhabit the temperate rainforest of
  the Pacific Northwest.
</p>

<p>
  Most <mark>salamander</mark>s are nocturnal, and hunt for insects, worms, and
  other small creatures.
</p>
```

```css interactive-example
mark {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Các trường hợp sử dụng điển hình cho `<mark>` bao gồm:

- Khi được dùng trong trích dẫn ({{HTMLElement("q")}}) hoặc khối trích dẫn ({{HTMLElement("blockquote")}}), nó thường chỉ ra văn bản có sự quan tâm đặc biệt nhưng không được đánh dấu trong tài liệu nguồn gốc, hoặc nội dung cần xem xét kỹ dù tác giả ban đầu không nghĩ nó quan trọng. Hãy nghĩ đây như dùng bút dạ quang để đánh dấu những đoạn bạn thấy thú vị trong sách.
- Trong các trường hợp khác, `<mark>` chỉ ra phần nội dung tài liệu có khả năng liên quan đến hoạt động hiện tại của người dùng. Ví dụ, nó có thể được dùng để chỉ ra các từ khớp với thao tác tìm kiếm.
- Đừng dùng `<mark>` cho mục đích tô sáng cú pháp; thay vào đó, hãy dùng phần tử {{HTMLElement("span")}} kết hợp với CSS phù hợp.

> [!NOTE]
> Đừng nhầm lẫn `<mark>` với phần tử {{HTMLElement("strong")}}; `<mark>` được dùng để biểu thị nội dung có mức độ _liên quan_, trong khi `<strong>` chỉ ra các đoạn văn bản có _tầm quan trọng_.

## Khả năng tiếp cận

Sự hiện diện của phần tử `mark` không được hầu hết công nghệ đọc màn hình thông báo trong cấu hình mặc định của chúng. Có thể làm cho nó được thông báo bằng cách sử dụng thuộc tính CSS {{cssxref("content")}}, kết hợp với các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}}.

```css
mark::before,
mark::after {
  clip-path: inset(100%);
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

mark::before {
  content: " [highlight start] ";
}

mark::after {
  content: " [highlight end] ";
}
```

Một số người dùng trình đọc màn hình cố ý tắt thông báo nội dung tạo ra thêm sự dài dòng. Vì vậy, điều quan trọng là không lạm dụng kỹ thuật này và chỉ áp dụng trong các tình huống mà việc không biết nội dung đã được tô sáng sẽ ảnh hưởng xấu đến khả năng hiểu.

- [Tweaking Text Level Styles, Reprised](https://adrianroselli.com/2025/04/tweaking-text-level-styles-reprised.html) via Adrian Roselli (2025)
- [Short note on making your mark (more accessible)](https://vispero.com/resources/short-note-on-making-your-mark-more-accessible/) via Vispero (2017)

## Ví dụ

### Đánh dấu văn bản quan tâm

Trong ví dụ đầu tiên này, một phần tử `<mark>` được dùng để đánh dấu một đoạn văn bản trong một trích dẫn mà người dùng đặc biệt quan tâm.

```html
<blockquote>
  It is a period of civil war. Rebel spaceships, striking from a hidden base,
  have won their first victory against the evil Galactic Empire. During the
  battle, <mark>Rebel spies managed to steal secret plans</mark> to the Empire's
  ultimate weapon, the DEATH STAR, an armored space station with enough power to
  destroy an entire planet.
</blockquote>
```

#### Kết quả

{{EmbedLiveSample("Marking_text_of_interest", 650, 130)}}

### Xác định các đoạn phụ thuộc ngữ cảnh

Ví dụ này minh họa việc dùng `<mark>` để đánh dấu kết quả tìm kiếm trong một đoạn văn.

```html
<p>
  It is a dark time for the Rebellion. Although the Death Star has been
  destroyed, <mark class="match">Imperial</mark> troops have driven the Rebel
  forces from their hidden base and pursued them across the galaxy.
</p>

<p>
  Evading the dreaded <mark class="match">Imperial</mark> Starfleet, a group of
  freedom fighters led by Luke Skywalker has established a new secret base on
  the remote ice world of Hoth.
</p>
```

Để phân biệt việc dùng `<mark>` cho kết quả tìm kiếm với các mục đích sử dụng tiềm năng khác, ví dụ này áp dụng lớp tùy chỉnh `"match"` cho mỗi kết quả khớp.

#### Kết quả

{{EmbedLiveSample("Identifying_context-sensitive_passages", 650, 130)}}

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
        >, nội dung rõ ràng.
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
      <th scope="row">Bỏ thẻ</th>
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
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
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
