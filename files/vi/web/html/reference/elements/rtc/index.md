---
title: "<rtc>: Phần tử container văn bản Ruby"
slug: Web/HTML/Reference/Elements/rtc
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.rtc
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<rtc>`** trong [HTML](/en-US/docs/Web/HTML) bao gồm các chú thích ngữ nghĩa của các ký tự được trình bày trong ruby của các phần tử {{HTMLElement("rb")}} được dùng bên trong phần tử {{ HTMLElement("ruby") }}. Các phần tử {{HTMLElement("rb")}} có thể có cả chú thích phát âm ({{HTMLElement("rt")}}) và ngữ nghĩa (`<rtc>`).

{{InteractiveExample("HTML Demo: &lt;rtc&gt;", "tabbed-standard")}}

```html interactive-example
<ruby lang="zh-Hant">
  <rbc>
    <rb>馬</rb><rp>(</rp><rt>mǎ</rt><rp>)</rp>
    <rb>來</rb><rp>(</rp><rt>lái</rt><rp>)</rp>
    <rb>西</rb><rp>(</rp><rt>xī</rt><rp>)</rp>
    <rb>亞</rb><rp>(</rp><rt>yà</rt><rp>)</rp>
  </rbc>
  <rtc lang="en">
    <rp>(</rp><rt>Malaysia</rt><rp>)</rp>
  </rtc>
</ruby>
```

```css interactive-example
ruby {
  font-size: 2em;
  ruby-position: under;
}

rtc {
  ruby-position: over;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ví dụ

```html
<div class="info">
  <ruby>
    <rbc>
      <rb>旧</rb><rt>jiù</rt> <rb>金</rb><rt>jīn</rt> <rb>山</rb><rt>shān</rt>
    </rbc>
    <rtc>San Francisco</rtc>
  </ruby>
</div>
```

```css hidden
.info {
  padding-top: 10px;
  font-size: 36px;
}
```

### Kết quả

{{EmbedLiveSample("Examples", 600, 120)}}

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
        >
        hoặc các phần tử {{HTMLElement("rt")}}.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ đóng có thể được bỏ qua nếu nó được theo sau ngay bởi thẻ mở của phần tử
        {{HTMLElement("rb")}}, <code>&lt;rtc&gt;</code> hoặc
        {{HTMLElement("rt")}} hoặc bởi thẻ đóng của phần tử cha.
      </td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>Một phần tử {{HTMLElement("ruby")}}.</td>
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

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("ruby")}}
- {{HTMLElement("rp")}}
- {{HTMLElement("rb")}}
- {{HTMLElement("rt")}}
- [Mô-đun bố cục ruby CSS](/en-US/docs/Web/CSS/Guides/Ruby_layout)
