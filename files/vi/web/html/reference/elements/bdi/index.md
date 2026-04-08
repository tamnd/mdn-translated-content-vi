---
title: "<bdi>: The Bidirectional Isolate element"
slug: Web/HTML/Reference/Elements/bdi
page-type: html-element
browser-compat: html.elements.bdi
sidebar: htmlsidebar
---

Phần tử **`<bdi>`** trong [HTML](/en-US/docs/Web/HTML) cho trình duyệt biết thuật toán hai chiều phải xử lý văn bản nó chứa riêng biệt với văn bản xung quanh. Nó đặc biệt hữu ích khi một trang web chèn một số văn bản động và không biết hướng của văn bản được chèn.

{{InteractiveExample("HTML Demo: &lt;bdi&gt;", "tabbed-standard")}}

```html interactive-example
<h1>World wrestling championships</h1>

<ul>
  <li><bdi class="name">Evil Steven</bdi>: 1st place</li>
  <li><bdi class="name">François fatale</bdi>: 2nd place</li>
  <li><span class="name">سما</span>: 3rd place</li>
  <li><bdi class="name">الرجل القوي إيان</bdi>: 4th place</li>
  <li><span class="name" dir="auto">سما</span>: 5th place</li>
</ul>
```

```css interactive-example
html {
  font-family: sans-serif;
}

bdi {
  /* Add your styles here */
}

.name {
  color: red;
}
```

Văn bản hai chiều là văn bản có thể chứa cả các chuỗi ký tự được sắp xếp từ trái sang phải (LTR) và các chuỗi ký tự được sắp xếp từ phải sang trái (RTL), chẳng hạn như một trích dẫn tiếng Ả Rập được nhúng trong một chuỗi tiếng Anh. Các trình duyệt triển khai [Thuật toán Hai chiều Unicode](https://www.w3.org/International/articles/inline-bidi-markup/uba-basics) để xử lý vấn đề này. Trong thuật toán này, các ký tự được gán hướng ngầm định: ví dụ, các ký tự Latin được xử lý là LTR trong khi các ký tự Ả Rập được xử lý là RTL. Một số ký tự khác (chẳng hạn như dấu cách và một số dấu câu) được xem là trung lập và được gán hướng dựa trên hướng của các ký tự xung quanh chúng.

Thường thì thuật toán hai chiều sẽ làm đúng mà không cần tác giả cung cấp bất kỳ đánh dấu đặc biệt nào nhưng, đôi khi, thuật toán cần sự trợ giúp. Đó là lúc `<bdi>` phát huy tác dụng.

Phần tử `<bdi>` được sử dụng để bao bọc một đoạn văn bản và hướng dẫn thuật toán hai chiều xử lý văn bản này riêng biệt với các vùng xung quanh. Điều này hoạt động theo hai cách:

- Hướng của văn bản nhúng trong `<bdi>` _không ảnh hưởng_ đến hướng của văn bản xung quanh.
- Hướng của văn bản nhúng trong `<bdi>` _không bị ảnh hưởng bởi_ hướng của văn bản xung quanh.

Ví dụ, hãy xem xét một số văn bản như:

```plain
EMBEDDED-TEXT - 1st place
```

Nếu `EMBEDDED-TEXT` là LTR, điều này hoạt động tốt. Nhưng nếu `EMBEDDED-TEXT` là RTL, thì `- 1` sẽ được xem là văn bản RTL (vì nó bao gồm các ký tự trung lập và yếu). Kết quả sẽ bị lộn xộn:

```plain
1 - EMBEDDED-TEXTst place
```

Nếu bạn biết hướng của `EMBEDDED-TEXT` trước, bạn có thể khắc phục vấn đề này bằng cách bao bọc `EMBEDDED-TEXT` trong một {{HTMLElement("span")}} với thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) được đặt thành hướng đã biết. Nhưng nếu bạn không biết hướng — ví dụ, vì `EMBEDDED-TEXT` đang được đọc từ cơ sở dữ liệu hoặc do người dùng nhập — bạn nên sử dụng `<bdi>` để ngăn hướng của `EMBEDDED-TEXT` ảnh hưởng đến môi trường xung quanh.

Mặc dù hiệu ứng trực quan tương tự có thể đạt được bằng cách sử dụng quy tắc CSS {{cssxref("unicode-bidi", "unicode-bidi: isolate")}} trên một {{HTMLElement("span")}} hoặc phần tử định dạng văn bản khác, các tác giả HTML không nên sử dụng phương pháp này vì nó không có tính ngữ nghĩa và các trình duyệt được phép bỏ qua kiểu dáng CSS.

Nhúng các ký tự trong `<span dir="auto">` có cùng hiệu ứng như sử dụng `<bdi>`, nhưng ngữ nghĩa của nó kém rõ ràng hơn.

## Thuộc tính

Giống như tất cả các phần tử HTML khác, phần tử này hỗ trợ [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes), ngoại trừ thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) hoạt động khác so với bình thường: nó mặc định là `auto`, nghĩa là giá trị của nó không bao giờ được kế thừa từ phần tử cha. Điều này có nghĩa là trừ khi bạn chỉ định giá trị `rtl` hoặc `ltr` cho `dir`, {{Glossary("user agent")}} sẽ xác định hướng chính xác để sử dụng dựa trên nội dung của `<bdi>`.

## Ví dụ

### Không có bdi chỉ với LTR

Ví dụ này liệt kê những người chiến thắng trong một cuộc thi chỉ sử dụng các phần tử {{HTMLElement("span")}}. Khi tên chỉ chứa văn bản LTR, kết quả trông ổn:

```html
<ul>
  <li><span class="name">Henrietta Boffin</span> - 1st place</li>
  <li><span class="name">Jerry Cruncher</span> - 2nd place</li>
</ul>
```

```css hidden
body {
  border: 1px solid #3f87a6;
  max-width: calc(100% - 40px - 6px);
  padding: 20px;
  width: calc(100% - 40px - 6px);
  border-width: 1px 1px 1px 5px;
}
```

{{ EmbedLiveSample('No_bdi_with_only_LTR','','120') }}

### Không có bdi với văn bản RTL

Ví dụ này liệt kê những người chiến thắng trong một cuộc thi chỉ sử dụng các phần tử {{HTMLElement("span")}}, và một trong những người chiến thắng có tên gồm văn bản RTL. Trong trường hợp này, `- 1`, bao gồm các ký tự trung lập hoặc yếu, sẽ nhận hướng của văn bản RTL, và kết quả sẽ bị lộn xộn:

```html
<ul>
  <li><span class="name">اَلأَعْشَى</span> - 1st place</li>
  <li><span class="name">Jerry Cruncher</span> - 2nd place</li>
</ul>
```

```css hidden
body {
  border: 1px solid #3f87a6;
  max-width: calc(100% - 40px - 6px);
  padding: 20px;
  width: calc(100% - 40px - 6px);
  border-width: 1px 1px 1px 5px;
}
```

{{ EmbedLiveSample('No_bdi_with_RTL_text','','120') }}

### Sử dụng bdi với văn bản LTR và RTL

Ví dụ này liệt kê những người chiến thắng trong một cuộc thi sử dụng các phần tử `<bdi>`. Các phần tử này hướng dẫn trình duyệt xử lý tên riêng biệt với ngữ cảnh nhúng của nó, vì vậy kết quả đầu ra của ví dụ được sắp xếp đúng thứ tự:

```html
<ul>
  <li><bdi class="name">اَلأَعْشَى</bdi> - 1st place</li>
  <li><bdi class="name">Jerry Cruncher</bdi> - 2nd place</li>
</ul>
```

```css hidden
body {
  border: 1px solid #3f87a6;
  max-width: calc(100% - 40px - 6px);
  padding: 20px;
  width: calc(100% - 40px - 6px);
  border-width: 1px 1px 1px 5px;
}
```

{{ EmbedLiveSample('Using_bdi_with_LTR_and_RTL_text','','120') }}

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
        >, nội dung hữu hình.
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
      <td>Không có, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
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
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/generic_role"
            >generic</a
          ></code
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Các vai trò ARIA được phép</th>
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

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Inline markup and bidirectional text in HTML](https://www.w3.org/International/articles/inline-bidi-markup/)
- [Unicode Bidirectional Algorithm basics](https://www.w3.org/International/articles/inline-bidi-markup/uba-basics)
- {{Glossary("Localization")}}
- Phần tử HTML liên quan: {{HTMLElement("bdo")}}
- Các thuộc tính CSS liên quan: {{cssxref("direction")}}, {{cssxref("unicode-bidi")}}
