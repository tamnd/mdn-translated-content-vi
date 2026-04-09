---
title: "<ruby>: The Ruby Annotation element"
slug: Web/HTML/Reference/Elements/ruby
page-type: html-element
browser-compat: html.elements.ruby
sidebar: htmlsidebar
---

Phần tử **`<ruby>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho các chú thích nhỏ được hiển thị phía trên, phía dưới hoặc bên cạnh văn bản cơ sở, thường được dùng để hiển thị cách phát âm của các ký tự Đông Á. Nó cũng có thể được dùng để chú thích các loại văn bản khác, nhưng cách dùng này ít phổ biến hơn.

Thuật ngữ _ruby_ có nguồn gốc từ [đơn vị đo lường được thợ sắp chữ sử dụng](<https://en.wikipedia.org/wiki/Agate_(typography)>), đại diện cho cỡ chữ nhỏ nhất có thể in trên giấy báo mà vẫn đọc được.

{{InteractiveExample("HTML Demo: &lt;ruby&gt;", "tabbed-shorter")}}

```html interactive-example
<ruby> 明日 <rp>(</rp><rt>Ashita</rt><rp>)</rp> </ruby>
```

```css interactive-example
ruby {
  font-size: 2em;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

### Ví dụ 1: Ký tự

```html
<ruby>
  漢 <rp>(</rp><rt>Kan</rt><rp>)</rp> 字 <rp>(</rp><rt>ji</rt><rp>)</rp>
</ruby>
```

#### Kết quả

{{EmbedLiveSample('Example 1: Character')}}

### Ví dụ 2: Từ

```html
<ruby> 明日 <rp>(</rp><rt>Ashita</rt><rp>)</rp> </ruby>
```

#### Kết quả

{{EmbedLiveSample('Example 1: Word')}}

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
        Một hoặc nhiều nhóm, mỗi nhóm gồm hai phần:
        <ol>
          <li>Văn bản cơ sở, là một trong:
            <ul>
              <li><a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content">Nội dung cụm từ</a>, nhưng không có phần tử <code>&lt;ruby&gt;</code> và không có phần tử con <code>&lt;ruby&gt;</code>, hoặc</li>
              <li>Một phần tử <code>&lt;ruby&gt;</code> đơn lẻ không có phần tử con <code>&lt;ruby&gt;</code>.</li>
            </ul>
          </li>
          <li>Chú thích cho văn bản cơ sở, là một trong:
            <ul>
              <li>Một hoặc nhiều phần tử {{HTMLElement("rt")}}, hoặc</li>
              <li>Một phần tử {{HTMLElement("rp")}} theo sau là một hoặc nhiều phần tử {{HTMLElement("rt")}}, mỗi phần tử lại theo sau bởi một phần tử {{HTMLElement("rp")}} (tức là <code>rp, rt, rp, rt, ..., rp</code>).</li>
            </ul>
          </li>
        </ol>
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

## Xem thêm

- {{HTMLElement("rt")}}
- {{HTMLElement("rp")}}
- {{cssxref("ruby-overhang")}}
- {{CSSxRef("text-transform")}}: full-size-kana
- [CSS ruby layout](/en-US/docs/Web/CSS/Guides/Ruby_layout) module
