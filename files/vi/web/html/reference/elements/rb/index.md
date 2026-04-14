---
title: "<rb>: Phần tử gốc Ruby"
slug: Web/HTML/Reference/Elements/rb
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.rb
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<rb>`** trong [HTML](/en-US/docs/Web/HTML) được dùng để phân định thành phần văn bản cơ sở của chú thích {{HTMLElement("ruby") }}, tức là văn bản đang được chú thích. Mỗi phần tử `<rb>` phải bao bọc mỗi phân đoạn nguyên tử riêng biệt của văn bản cơ sở.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Chú thích ruby được dùng để hiển thị cách phát âm của các ký tự Đông Á, như sử dụng furigana Nhật Bản hoặc ký tự bopomofo Đài Loan. Phần tử `<rb>` được dùng để phân tách từng phân đoạn của văn bản cơ sở ruby.
- Mặc dù `<rb>` không phải là {{glossary("void element","phần tử void")}}, nhưng thông thường chỉ bao gồm thẻ mở của mỗi phần tử trong mã nguồn, do đó đánh dấu ruby ít phức tạp hơn và dễ đọc hơn. Trình duyệt sau đó có thể điền vào phần tử đầy đủ trong phiên bản được hiển thị.
- Bạn cần bao gồm một phần tử {{htmlelement("rt")}} cho mỗi phân đoạn cơ sở/phần tử `<rb>` mà bạn muốn chú thích.

## Ví dụ

### Dùng rb

Trong ví dụ này, chúng ta cung cấp chú thích cho ký tự gốc tương đương của "Kanji":

```html
<ruby>
  <rb>漢</rb><rb>字 </rb><rp>(</rp><rt>kan</rt><rt>ji</rt><rp>)</rp>
</ruby>
```

Lưu ý cách chúng ta đã bao gồm hai phần tử `<rb>` để phân định hai phần riêng biệt của văn bản cơ sở ruby. Chú thích mặt khác được phân định bởi hai phần tử {{htmlelement("rt")}}.

#### Kết quả

{{EmbedLiveSample("Using_rb", "100%", 60)}}

### Chú thích riêng biệt

Lưu ý rằng chúng ta cũng có thể viết ví dụ này với hai phần văn bản cơ sở được chú thích hoàn toàn riêng biệt. Trong trường hợp này chúng ta không cần bao gồm các phần tử `<rb>`:

```html
<ruby>
  漢 <rp>(</rp><rt>Kan</rt><rp>)</rp> 字 <rp>(</rp><rt>ji</rt><rp>)</rp>
</ruby>
```

#### Kết quả

{{EmbedLiveSample('Separate annotations')}}

Xem bài viết về phần tử {{HTMLElement("ruby")}} để biết thêm ví dụ.

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
      <td>Là con của phần tử {{htmlelement("ruby")}}.</td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>
        Thẻ kết thúc có thể được bỏ qua nếu phần tử được theo sau ngay bởi một
        phần tử {{HTMLElement("rt")}}, {{HTMLElement("rtc")}}, hoặc
        {{HTMLElement("rp")}} hoặc phần tử
        <code>&#x3C;rb></code> khác, hoặc nếu không còn nội dung nào trong
        phần tử cha.
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
- {{HTMLElement("rt")}}
- {{HTMLElement("rp")}}
- {{HTMLElement("rtc")}}
- [Mô-đun bố cục ruby CSS](/en-US/docs/Web/CSS/Guides/Ruby_layout)
