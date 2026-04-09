---
title: "<wbr>: Phần tử Cơ hội Ngắt Dòng"
slug: Web/HTML/Reference/Elements/wbr
page-type: html-element
browser-compat: html.elements.wbr
sidebar: htmlsidebar
---

Phần tử **`<wbr>`** [HTML](/en-US/docs/Web/HTML) đại diện cho một cơ hội ngắt từ — một vị trí trong văn bản mà trình duyệt có thể tùy ý ngắt dòng, dù các quy tắc ngắt dòng của nó thường không tạo ra một điểm ngắt tại vị trí đó.

{{InteractiveExample("HTML Demo: &lt;wbr&gt;", "tabbed-shorter")}}

```html interactive-example
<div id="example-paragraphs">
  <p>Fernstraßenbauprivatfinanzierungsgesetz</p>
  <p>Fernstraßen<wbr />bau<wbr />privat<wbr />finanzierungs<wbr />gesetz</p>
  <p>Fernstraßen&shy;bau&shy;privat&shy;finanzierungs&shy;gesetz</p>
</div>
```

```css interactive-example
#example-paragraphs {
  background-color: white;
  overflow: hidden;
  resize: horizontal;
  width: 9rem;
  border: 2px dashed #999999;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú

Trên các trang được mã hóa UTF-8, `<wbr>` hoạt động giống như điểm mã `U+200B ZERO-WIDTH SPACE`. Cụ thể, nó hoạt động giống như một điểm mã bidi BN Unicode, nghĩa là nó không có tác dụng đối với thứ tự {{Glossary("bidi")}}: `<div dir=rtl>123,<wbr>456</div>` hiển thị, khi không bị ngắt thành hai dòng, là `123,456` chứ không phải `456,123`.

Vì lý do tương tự, phần tử `<wbr>` không đưa vào một dấu gạch nối tại điểm ngắt dòng. Để hiển thị dấu gạch nối chỉ ở cuối dòng, sử dụng ký tự thực thể dấu gạch nối mềm (`&shy;`) thay thế.

## Ví dụ

_[The Yahoo Style Guide](https://web.archive.org/web/20121014054923/http://styleguide.yahoo.com/)_ khuyến nghị [ngắt URL _trước_ dấu câu](https://web.archive.org/web/20121105171040/http://styleguide.yahoo.com/editing/treat-abbreviations-capitalization-and-titles-consistently/website-names-and-addresses), để tránh để lại dấu câu ở cuối dòng mà người đọc có thể nhầm là cuối URL.

```html
<p>
  http://this<wbr />.is<wbr />.a<wbr />.really<wbr />.long<wbr />.example<wbr />.com/With<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages<wbr />/deeper<wbr />/level<wbr />/pages
</p>
```

### Kết quả

{{EmbedLiveSample("Example")}}

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
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>Rỗng</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Phải có thẻ mở và không được có thẻ đóng.</td>
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

- {{cssxref("overflow-wrap")}}
- {{cssxref("word-break")}}
- {{cssxref("hyphens")}}
- Phần tử {{HTMLElement("br")}}
