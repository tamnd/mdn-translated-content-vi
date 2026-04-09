---
title: "<pre>: Phần tử Văn bản định dạng trước"
slug: Web/HTML/Reference/Elements/pre
page-type: html-element
browser-compat: html.elements.pre
sidebar: htmlsidebar
---

Phần tử **`<pre>`** trong [HTML](/en-US/docs/Web/HTML) đại diện cho văn bản định dạng trước được trình bày chính xác như cách viết trong tệp HTML. Văn bản thường được hiển thị bằng phông chữ không tỷ lệ, hay còn gọi là phông [monospaced](https://en.wikipedia.org/wiki/Monospaced_font).

Khoảng trắng bên trong phần tử này được hiển thị như đã viết, với một ngoại lệ. Nếu một hoặc nhiều ký tự xuống dòng đứng đầu được bao gồm ngay sau thẻ mở `<pre>`, ký tự xuống dòng _đầu tiên_ sẽ bị loại bỏ. Sự chuyển đổi này được thực hiện bởi trình phân tích HTML và không áp dụng khi sử dụng {{Glossary("XHTML")}}.

Nội dung văn bản của các phần tử `<pre>` được phân tích cú pháp như HTML, vì vậy nếu bạn muốn đảm bảo rằng nội dung văn bản vẫn là văn bản thuần túy, một số ký tự cú pháp như `<` có thể cần được thoát bằng {{glossary("character reference", "tham chiếu ký tự")}} tương ứng. Xem [thoát ký tự không rõ ràng](#escaping_ambiguous_characters) để biết thêm thông tin.

Các phần tử `<pre>` thường chứa các phần tử {{HTMLElement("code")}}, {{HTMLElement("samp")}} và {{HTMLElement("kbd")}}, tương ứng để đại diện cho mã máy tính, đầu ra máy tính và đầu vào của người dùng.

Theo mặc định, `<pre>` là phần tử [cấp khối](/en-US/docs/Glossary/Block-level_content), tức là giá trị {{cssxref("display")}} mặc định của nó là `block`.

{{InteractiveExample("HTML Demo: &lt;pre&gt;", "tabbed-standard")}}

```html interactive-example
<pre>
             S
             A
            LUT
             M
            O N
            D  E
            DONT
          JE SUIS
          LA  LAN
          G U E  É
         L O Q U E N
        TE      QUESA
       B  O  U  C  H  E
      O        P A R I S
     T I R E   ET   TIRERA
    T O U             JOURS
   AUX                  A  L
 LEM                      ANDS   - Apollinaire
</pre>
```

```css interactive-example
pre {
  font-size: 0.7rem;
  margin: 0;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `width` {{deprecated_inline}} {{Non-standard_Inline}}
  - : Chứa số ký tự _ưa thích_ mà một dòng nên có. Mặc dù vẫn được triển khai về mặt kỹ thuật, thuộc tính này không có hiệu ứng trực quan; để đạt được hiệu ứng như vậy, hãy sử dụng CSS {{Cssxref("width")}} thay thế.
- `wrap` {{non-standard_inline}} {{Deprecated_Inline}}
  - : Là _gợi ý_ chỉ ra cách xử lý tràn. Trong trình duyệt hiện đại, gợi ý này bị bỏ qua và không có hiệu ứng trực quan nào xảy ra; để đạt được hiệu ứng như vậy, hãy sử dụng CSS {{Cssxref("white-space")}} thay thế.

## Khả năng tiếp cận

Điều quan trọng là phải cung cấp mô tả thay thế cho bất kỳ hình ảnh hoặc sơ đồ nào được tạo bằng văn bản định dạng trước. Mô tả thay thế nên mô tả rõ ràng và súc tích nội dung của hình ảnh hoặc sơ đồ.

Những người gặp vấn đề về thị lực và duyệt web với sự hỗ trợ của công nghệ hỗ trợ như trình đọc màn hình có thể không hiểu các ký tự văn bản định dạng trước đang đại diện cho điều gì khi chúng được đọc theo thứ tự.

Sự kết hợp của các phần tử {{HTMLElement("figure")}} và {{HTMLElement("figcaption")}}, bổ sung bởi thuộc tính `role` của [ARIA](/en-US/docs/Web/Accessibility/ARIA) và [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) trên phần tử `pre` cho phép nghệ thuật {{Glossary("ASCII")}} định dạng trước được thông báo là hình ảnh với văn bản thay thế, và `figcaption` phục vụ như chú thích của hình ảnh.

### Ví dụ

```html
<figure>
  <pre role="img" aria-label="ASCII COW">
      ___________________________
  &lt; I'm an expert in my field. &gt;
      ---------------------------
          \   ^__^
           \  (oo)\_______
              (__)\       )\/\
                  ||----w |
                  ||     ||
  </pre>
  <figcaption id="cow-caption">
    A cow saying, "I'm an expert in my field." The cow is illustrated using
    preformatted text characters.
  </figcaption>
</figure>
```

- [MDN Understanding WCAG, Guideline 1.1 explanations](/en-US/docs/Web/Accessibility/Guides/Understanding_WCAG/Perceivable#guideline_1.1_—_providing_text_alternatives_for_non-text_content)
- [H86: Providing text alternatives for ASCII art, emoticons, and leetspeak | W3C Techniques for WCAG 2.0](https://www.w3.org/TR/WCAG20-TECHS/H86.html)

## Ví dụ

### Ví dụ cơ bản

#### HTML

```html
<p>Using CSS to change the font color is easy.</p>
<pre><code>
body {
  color: red;
}
</code></pre>
```

#### Kết quả

{{EmbedLiveSample("Basic_example")}}

### Thoát ký tự không rõ ràng

Giả sử bạn muốn minh họa mã HTML trong phần tử `<pre>`. Các chuỗi ký tự xác định thẻ HTML hợp lệ (bắt đầu bằng `<` và kết thúc bằng `>`) sẽ không được hiển thị. Để hiển thị các ký tự thẻ dưới dạng văn bản, bạn cần thoát (ít nhất) ký tự `<` bằng tham chiếu ký tự của nó, để các chuỗi không còn xác định thẻ hợp lệ nữa.

Trên thực tế, trình phân tích HTML coi hầu hết các ký tự là văn bản thuần túy trừ trong các ngữ cảnh cụ thể. Ví dụ: `< code` là ổn, nhưng `<code` sẽ bị phân tích sai; `&am;` là ổn, nhưng `&amp;` thì không. Tuy nhiên, thực hành tốt là thoát tất cả các ký tự không rõ ràng để tránh nhầm lẫn, đặc biệt nếu bạn đang tạo HTML theo cách lập trình và chèn nội dung `<pre>`. Trong trường hợp này, đây là quy tắc hữu ích để thoát ký tự:

1. Đầu tiên, viết nội dung ra, như bạn muốn nó xuất hiện trong tài liệu HTML.
2. Thay thế bất kỳ dấu và (`&`) bằng `&amp;`. Thực hiện bước này trước, để các ký tự `&` mới được tạo ra trong bước tiếp theo không bị thoát.
3. Thay thế bất kỳ ký tự `<` bằng `&lt;`.

Điều này sẽ dẫn đến nội dung được hiển thị như bạn dự định. Việc thay thế các ký tự cú pháp HTML khác là tùy chọn (như `>` thành `&gt;`, `"` thành `&quot;` và `'` thành `&apos;`), nhưng sẽ không gây hại gì.

#### HTML

```html
<pre><code>
let i = 5;

if (i &lt; 10 &amp;&amp; i &gt; 0)
  return &quot;Single Digit Number&quot;
</code></pre>
```

#### Kết quả

{{EmbedLiveSample("Escaping_reserved_characters")}}

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
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >Nội dung diễn đạt</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
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
      <td>{{domxref("HTMLPreElement")}}</td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- CSS: {{Cssxref('white-space')}}, {{Cssxref('word-break')}}
- {{glossary("Character reference")}}
- Các phần tử liên quan: {{HTMLElement("code")}}, {{HTMLElement("samp")}}, {{HTMLElement("kbd")}}
