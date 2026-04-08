---
title: "<b>: The Bring Attention To element"
slug: Web/HTML/Reference/Elements/b
page-type: html-element
browser-compat: html.elements.b
sidebar: htmlsidebar
---

Phần tử **`<b>`** trong [HTML](/en-US/docs/Web/HTML) được sử dụng để thu hút sự chú ý của người đọc đến nội dung của phần tử, vốn không được trao tầm quan trọng đặc biệt theo cách khác. Trước đây được gọi là phần tử Boldface, và hầu hết các trình duyệt vẫn hiển thị văn bản in đậm. Tuy nhiên, bạn không nên sử dụng `<b>` để tạo kiểu văn bản hoặc trao tầm quan trọng. Nếu bạn muốn tạo văn bản in đậm, bạn nên sử dụng thuộc tính CSS {{cssxref("font-weight")}}. Nếu bạn muốn chỉ ra rằng một phần tử có tầm quan trọng đặc biệt, bạn nên sử dụng phần tử {{HTMLElement("strong")}}.

{{InteractiveExample("HTML Demo: &lt;b&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  The two most popular science courses offered by the school are
  <b class="term">chemistry</b> (the study of chemicals and the composition of
  substances) and <b class="term">physics</b> (the study of the nature and
  properties of matter and energy).
</p>
```

```css interactive-example
b {
  /* Add your styles here */
}
```

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Sử dụng `<b>` cho các trường hợp như từ khóa trong phần tóm tắt, tên sản phẩm trong bài đánh giá, hoặc các đoạn văn bản khác mà cách trình bày điển hình của chúng là in đậm (nhưng không bao gồm bất kỳ tầm quan trọng đặc biệt nào).
- Không nhầm lẫn phần tử `<b>` với các phần tử {{HTMLElement("strong")}}, {{HTMLElement("em")}}, hoặc {{HTMLElement("mark")}}. Phần tử {{HTMLElement("strong")}} đại diện cho văn bản có _tầm quan trọng_ nhất định, {{HTMLElement("em")}} nhấn mạnh một số điểm vào văn bản và phần tử {{HTMLElement("mark")}} đại diện cho văn bản có _tính liên quan_ nhất định. Phần tử `<b>` không truyền đạt thông tin ngữ nghĩa đặc biệt như vậy; chỉ sử dụng nó khi không có phần tử nào khác phù hợp.
- Tương tự, không đánh dấu tiêu đề và đề mục bằng phần tử `<b>`. Với mục đích này, hãy sử dụng các thẻ {{HTMLElement("Heading_Elements", "h1")}} đến {{HTMLElement("Heading_Elements", "h6")}}. Hơn nữa, các stylesheet có thể thay đổi kiểu mặc định của các phần tử này, dẫn đến chúng _không nhất thiết_ được hiển thị in đậm.
- Đây là một thực hành tốt khi sử dụng thuộc tính [`class`](/en-US/docs/Web/HTML/Reference/Global_attributes/class) trên phần tử `<b>` để truyền đạt thông tin ngữ nghĩa bổ sung khi cần (ví dụ `<b class="lead">` cho câu đầu tiên trong đoạn văn). Điều này giúp quản lý nhiều trường hợp sử dụng `<b>` dễ dàng hơn nếu nhu cầu tạo kiểu của bạn thay đổi, mà không cần thay đổi tất cả các cách sử dụng của nó trong HTML.
- Trong lịch sử, phần tử `<b>` được thiết kế để làm văn bản in đậm. Thông tin tạo kiểu đã bị loại bỏ kể từ HTML4, vì vậy ý nghĩa của phần tử `<b>` đã được thay đổi.
- Nếu không có mục đích ngữ nghĩa khi sử dụng phần tử `<b>`, bạn nên sử dụng thuộc tính CSS {{cssxref("font-weight")}} với giá trị `"bold"` thay thế để làm văn bản in đậm.

## Ví dụ

```html
<p>
  This article describes several <b class="keywords">text-level</b> elements. It
  explains their usage in an <b class="keywords">HTML</b> document.
</p>
Keywords are displayed with the default style of the
<b>element, likely in bold.</b>
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

- Các phần tử khác truyền đạt ngữ nghĩa cấp văn bản: {{HTMLElement("a")}}, {{HTMLElement("em")}}, {{HTMLElement("strong")}}, {{HTMLElement("small")}}, {{HTMLElement("cite")}}, {{HTMLElement("q")}}, {{HTMLElement("dfn")}}, {{HTMLElement("abbr")}}, {{HTMLElement("time")}}, {{HTMLElement("code")}}, {{HTMLElement("var")}}, {{HTMLElement("samp")}}, {{HTMLElement("kbd")}}, {{HTMLElement("sub")}}, {{HTMLElement("sup")}}, {{HTMLElement("i")}}, {{HTMLElement("mark")}}, {{HTMLElement("ruby")}}, {{HTMLElement("rp")}}, {{HTMLElement("rt")}}, {{HTMLElement("bdo")}}, {{HTMLElement("span")}}, {{HTMLElement("br")}}, {{HTMLElement("wbr")}}.
- [Using \<b> and \<i> elements (W3C)](https://www.w3.org/International/questions/qa-b-and-i-tags)
