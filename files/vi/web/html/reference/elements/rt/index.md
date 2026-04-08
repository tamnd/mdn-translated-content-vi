---
title: "<rt>: The Ruby Text element"
slug: Web/HTML/Reference/Elements/rt
page-type: html-element
browser-compat: html.elements.rt
sidebar: htmlsidebar
---

Phần tử **`<rt>`** trong [HTML](/en-US/docs/Web/HTML) chỉ định thành phần văn bản ruby của một chú thích ruby, được dùng để cung cấp thông tin phát âm, dịch nghĩa hoặc phiên âm cho kiểu chữ Đông Á. Phần tử `<rt>` luôn phải nằm trong phần tử {{HTMLElement("ruby")}}.

{{InteractiveExample("HTML Demo: &lt;rt&gt;", "tabbed-shorter")}}

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

Xem bài viết về phần tử {{HTMLElement("ruby")}} để biết thêm ví dụ.

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

### Dùng chú thích ruby

Ví dụ này cung cấp phiên âm Romaji cho các ký tự kanji trong phần tử {{HTMLElement("ruby")}}:

```html
<ruby> 漢 <rt>Kan</rt> 字 <rt>ji</rt> </ruby>
```

```css hidden
body {
  font-size: 22px;
}
```

#### Kết quả

{{EmbedLiveSample("Using_ruby_annotations", 600, 60)}}

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
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ thẻ</th>
      <td>
        Có thể bỏ thẻ đóng nếu phần tử <code>&#x3C;rt></code>
        ngay sau đó là một phần tử <code>&#x3C;rt></code> hoặc
        {{HTMLElement("rp")}}, hoặc nếu không còn nội dung nào trong
        phần tử cha
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Một phần tử {{HTMLElement("ruby")}}.</td>
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
- {{HTMLElement("rp")}}
- {{HTMLElement("rb")}}
- {{HTMLElement("rtc")}}
- {{CSSXRef("text-transform", "text-transform: full-size-kana")}}
- [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout) module
