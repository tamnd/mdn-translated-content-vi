---
title: "<tt>: Phần tử văn bản Teletype"
slug: Web/HTML/Reference/Elements/tt
page-type: html-element
status:
  - deprecated
browser-compat: html.elements.tt
sidebar: htmlsidebar
---

{{deprecated_header}}

Phần tử **`<tt>`** trong [HTML](/en-US/docs/Web/HTML) tạo văn bản nội tuyến được trình bày bằng phông chữ monospace mặc định của {{Glossary("user agent", "tác nhân người dùng")}}. Phần tử này được tạo ra để hiển thị văn bản như thể nó được hiển thị trên màn hình độ rộng cố định như máy đánh chữ, màn hình chỉ văn bản hoặc máy in dòng.

Các thuật ngữ **non-proportional** (không tỷ lệ), **monotype** và **monospace** được dùng thay thế cho nhau và có cùng ý nghĩa chung: chúng mô tả kiểu chữ mà tất cả các ký tự đều có cùng số pixel chiều rộng.

Phần tử này đã lỗi thời. Bạn nên dùng các phần tử có ngữ nghĩa hữu ích hơn như {{HTMLElement("code")}}, {{HTMLElement("kbd")}}, {{HTMLElement("samp")}}, hoặc {{HTMLElement("var")}} cho văn bản nội tuyến cần được trình bày bằng kiểu monospace, hoặc thẻ {{HTMLElement("pre")}} cho nội dung cần được trình bày dưới dạng khối riêng biệt.

> [!NOTE]
> Nếu không có phần tử ngữ nghĩa nào phù hợp với trường hợp sử dụng của bạn (ví dụ: nếu bạn cần hiển thị một số nội dung bằng phông chữ không tỷ lệ), hãy cân nhắc dùng phần tử {{ HTMLElement("span") }}, tạo kiểu theo ý muốn bằng CSS. Thuộc tính {{cssxref("font-family")}} là nơi tốt để bắt đầu.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes)

## Ví dụ

### Ví dụ cơ bản

Ví dụ này dùng `<tt>` để hiển thị văn bản nhập vào và đầu ra của ứng dụng terminal.

```html
<p>
  Enter the following at the telnet command prompt:
  <code>set localecho</code><br />

  The telnet client should display: <tt>Local Echo is on</tt>
</p>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 650, 80)}}

### Ghi đè phông chữ mặc định

Bạn có thể ghi đè phông chữ mặc định của trình duyệt — nếu trình duyệt cho phép bạn làm vậy, điều này không bắt buộc — bằng CSS:

#### CSS

```css
tt {
  font-family: "Lucida Console", "Menlo", "Monaco", "Courier New", monospace;
}
```

#### HTML

```html
<p>
  Enter the following at the telnet command prompt:
  <code>set localecho</code><br />

  The telnet client should display: <tt>Local Echo is on</tt>
</p>
```

#### Kết quả

{{EmbedLiveSample("Overriding_the_default_font", 650, 80)}}

## Ghi chú sử dụng

Phần tử `<tt>` theo mặc định được hiển thị bằng phông chữ không tỷ lệ mặc định của trình duyệt. Bạn có thể ghi đè điều này bằng CSS bằng cách tạo quy tắc sử dụng bộ chọn `tt`, như trong ví dụ [Ghi đè phông chữ mặc định](#ghi_đè_phông_chữ_mặc_định) ở trên.

> [!NOTE]
> Các thay đổi được người dùng cấu hình đối với cài đặt phông chữ monospace mặc định có thể được ưu tiên hơn CSS của bạn.

Mặc dù phần tử này không bị deprecated chính thức trong HTML 4.01, nhưng việc sử dụng nó đã không được khuyến khích để ủng hộ các phần tử ngữ nghĩa và/hoặc CSS. Phần tử `<tt>` đã lỗi thời trong HTML 5.

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
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ bắt đầu và thẻ kết thúc đều bắt buộc.</td>
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

- Các phần tử ngữ nghĩa {{HTMLElement("code")}}, {{HTMLElement("var")}}, {{HTMLElement("kbd")}}, và {{HTMLElement("samp")}}
- Phần tử {{HTMLElement("pre")}} để hiển thị các khối văn bản được định dạng trước
