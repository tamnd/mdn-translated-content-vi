---
title: "<s>: The Strikethrough element"
slug: Web/HTML/Reference/Elements/s
page-type: html-element
browser-compat: html.elements.s
sidebar: htmlsidebar
---

Phần tử **`<s>`** trong [HTML](/en-US/docs/Web/HTML) hiển thị văn bản có gạch ngang, hay một đường kẻ xuyên qua. Dùng phần tử `<s>` để đại diện cho những thứ không còn liên quan hoặc không còn chính xác. Tuy nhiên, `<s>` không phù hợp khi chỉ ra các chỉnh sửa tài liệu; cho mục đích đó, hãy dùng các phần tử {{HTMLElement("del")}} và {{HTMLElement("ins")}} tùy trường hợp.

{{InteractiveExample("HTML Demo: &lt;s&gt;", "tabbed-shorter")}}

```html interactive-example
<p><s>There will be a few tickets available at the box office tonight.</s></p>

<p>SOLD OUT!</p>
```

```css interactive-example
s {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Khả năng tiếp cận

Sự hiện diện của phần tử `s` không được hầu hết công nghệ đọc màn hình thông báo trong cấu hình mặc định của chúng. Có thể làm cho nó được thông báo bằng cách sử dụng thuộc tính CSS {{cssxref("content")}}, kết hợp với các phần tử giả {{cssxref("::before")}} và {{cssxref("::after")}}.

```css
s::before,
s::after {
  clip-path: inset(100%);
  clip: rect(1px, 1px, 1px, 1px);
  height: 1px;
  overflow: hidden;
  position: absolute;
  white-space: nowrap;
  width: 1px;
}

s::before {
  content: " [start of stricken text] ";
}

s::after {
  content: " [end of stricken text] ";
}
```

Một số người dùng trình đọc màn hình cố ý tắt thông báo nội dung tạo ra thêm sự dài dòng. Vì vậy, điều quan trọng là không lạm dụng kỹ thuật này và chỉ áp dụng trong các tình huống mà việc không biết nội dung đã bị gạch ngang sẽ ảnh hưởng xấu đến khả năng hiểu.

- [Short note on making your mark (more accessible) | Vispero](https://vispero.com/resources/short-note-on-making-your-mark-more-accessible/)
- [Tweaking Text Level Styles | Adrian Roselli](https://adrianroselli.com/2017/12/tweaking-text-level-styles.html)

## Ví dụ

```css
.sold-out {
  text-decoration: line-through;
}
```

```html
<s>Today's Special: Salmon</s> SOLD OUT<br />
<span class="sold-out">Today's Special: Salmon</span> SOLD OUT
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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
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
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("strike")}}, phiên bản cũ của phần tử `<s>`, đã lỗi thời và không nên dùng trên các trang web nữa.
- Phần tử {{HTMLElement("del")}} nên được dùng thay thế khi dữ liệu đã bị _xóa_.
- Thuộc tính CSS {{cssxref("text-decoration-line")}} nên được dùng để đạt được giao diện trực quan trước đây của phần tử `<s>`.
