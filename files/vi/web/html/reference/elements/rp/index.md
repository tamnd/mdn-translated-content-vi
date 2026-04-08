---
title: "<rp>: The Ruby Fallback Parenthesis element"
slug: Web/HTML/Reference/Elements/rp
page-type: html-element
browser-compat: html.elements.rp
sidebar: htmlsidebar
---

Phần tử **`<rp>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để cung cấp dấu ngoặc đơn dự phòng cho các trình duyệt không hỗ trợ hiển thị chú thích ruby bằng phần tử {{HTMLElement("ruby") }}. Mỗi phần tử `<rp>` nên bao quanh từng dấu ngoặc mở và đóng bao quanh phần tử {{HTMLElement("rt")}} chứa văn bản chú thích.

{{InteractiveExample("HTML Demo: &lt;rp&gt;", "tabbed-shorter")}}

```html interactive-example
<ruby>
  漢 <rp>(</rp><rt>kan</rt><rp>)</rp> 字 <rp>(</rp><rt>ji</rt><rp>)</rp>
</ruby>
```

```css interactive-example
ruby {
  font-size: 2em;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Chú thích ruby dùng để hiển thị cách phát âm của các ký tự Đông Á, như dùng furigana tiếng Nhật hoặc ký tự bopomofo của Đài Loan. Phần tử `<rp>` được dùng trong trường hợp không có hỗ trợ phần tử {{HTMLElement("ruby")}}; nội dung `<rp>` cung cấp nội dung cần hiển thị để chỉ ra sự hiện diện của chú thích ruby, thường là dấu ngoặc đơn.

## Ví dụ

### Dùng chú thích ruby

Ví dụ này dùng chú thích ruby để hiển thị các ký tự tương đương theo [Romaji](https://en.wikipedia.org/wiki/Romaji) cho mỗi ký tự.

```html
<ruby>
  漢 <rp>(</rp><rt>Kan</rt><rp>)</rp> 字 <rp>(</rp><rt>ji</rt><rp>)</rp>
</ruby>
```

```css hidden
body {
  font-size: 22px;
}
```

#### Kết quả

{{EmbedLiveSample("Using_ruby_annotations", 600, 60)}}

Xem bài viết về phần tử {{HTMLElement("ruby")}} để biết thêm ví dụ.

### Không có hỗ trợ ruby

Nếu trình duyệt của bạn không hỗ trợ chú thích ruby, kết quả trông như thế này:

```html hidden
漢 (Kan) 字 (ji)
```

```css hidden
body {
  font-size: 22px;
}
```

{{EmbedLiveSample("Without_ruby_support", 600, 60)}}

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
      <td>Văn bản</td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>
        Có thể bỏ thẻ đóng nếu phần tử ngay sau đó là một
        {{HTMLElement("rt")}} hoặc phần tử <code>&#x3C;rp></code> khác,
        hoặc nếu không còn nội dung nào trong phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Một phần tử {{HTMLElement("ruby")}}. <code>&#x3C;rp></code> phải
        được đặt ngay trước hoặc sau một
        phần tử {{HTMLElement("rt")}}.
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

## Xem thêm

- {{HTMLElement("ruby")}}
- {{HTMLElement("rt")}}
- {{HTMLElement("rb")}}
- {{HTMLElement("rtc")}}
- [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout) module
