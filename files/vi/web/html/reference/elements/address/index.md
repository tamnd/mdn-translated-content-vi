---
title: "<address>: The Contact Address element"
slug: Web/HTML/Reference/Elements/address
page-type: html-element
browser-compat: html.elements.address
sidebar: htmlsidebar
---

Phần tử **`<address>`** trong [HTML](/en-US/docs/Web/HTML) chỉ ra rằng HTML được bao gồm cung cấp thông tin liên lạc cho một người hay nhiều người, hoặc cho một tổ chức.

{{InteractiveExample("HTML Demo: &lt;address&gt;", "tabbed-standard")}}

```html interactive-example
<p>Contact the author of this page:</p>

<address>
  <a href="mailto:jim@example.com">jim@example.com</a><br />
  <a href="tel:+14155550132">+1 (415) 555‑0132</a>
</address>
```

```css interactive-example
a[href^="mailto"]::before {
  content: "📧 ";
}

a[href^="tel"]::before {
  content: "📞 ";
}
```

Thông tin liên lạc được cung cấp bởi nội dung của phần tử `<address>` có thể ở bất kỳ dạng nào phù hợp với ngữ cảnh, và có thể bao gồm bất kỳ loại thông tin liên lạc nào cần thiết, chẳng hạn như địa chỉ vật lý, URL, địa chỉ email, số điện thoại, tên người dùng mạng xã hội, tọa độ địa lý, và nhiều thứ khác. Phần tử `<address>` phải bao gồm tên của người, những người hoặc tổ chức mà thông tin liên lạc đề cập đến.

`<address>` có thể được sử dụng trong nhiều ngữ cảnh khác nhau, chẳng hạn như cung cấp thông tin liên lạc của doanh nghiệp trong header trang, hoặc chỉ ra tác giả của một bài viết bằng cách bao gồm phần tử `<address>` trong {{HTMLElement("article")}}.

## Thuộc tính

Phần tử này chỉ bao gồm [các thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

- Phần tử `<address>` chỉ có thể được dùng để biểu diễn thông tin liên lạc cho phần tử tổ tiên {{HTMLElement("article")}} hoặc {{HTMLElement("body")}} gần nhất.
- Phần tử này không nên chứa nhiều thông tin hơn thông tin liên lạc, như ngày xuất bản (thuộc về phần tử {{HTMLElement("time")}}).
- Thông thường, phần tử `<address>` có thể được đặt bên trong phần tử {{HTMLElement("footer")}} của section hiện tại, nếu có.

## Ví dụ

Ví dụ này minh họa việc sử dụng `<address>` để phân định thông tin liên lạc cho tác giả của bài viết.

```html
<address>
  You can contact author at
  <a href="http://www.example.com/contact">www.example.com</a>.<br />
  If you see any bugs, please
  <a href="mailto:webmaster@example.com">contact webmaster</a>.<br />
  You may also want to visit us:<br />
  Mozilla Foundation<br />
  331 E Evelyn Ave<br />
  Mountain View, CA 94041<br />
  USA
</address>
```

### Kết quả

{{EmbedLiveSample("Examples", "300", "200")}}

Mặc dù nó hiển thị văn bản với kiểu dáng mặc định giống như các phần tử {{HTMLElement("i")}} hoặc {{HTMLElement("em")}}, nhưng việc sử dụng `<address>` khi xử lý thông tin liên lạc là phù hợp hơn, vì nó truyền đạt thêm thông tin ngữ nghĩa.

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
          >Nội dung flow</a
        >, nội dung palpable.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung flow</a
        >, nhưng không có phần tử <code>&#x3C;address></code> lồng nhau, không có
        nội dung heading ({{HTMLElement("hgroup")}}, {{HTMLElement("Heading_Elements", "h1")}},
        {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}},
        {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}},
        {{HTMLElement("Heading_Elements", "h6")}}), không có nội dung sectioning
        ({{HTMLElement("article")}}, {{HTMLElement("aside")}},
        {{HTMLElement("section")}}, {{HTMLElement("nav")}}), và
        không có phần tử {{HTMLElement("header")}} hay {{HTMLElement("footer")}}.
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
          >nội dung flow</a
        >, nhưng luôn loại trừ các phần tử <code>&#x3C;address></code> (theo
        nguyên tắc logic của sự đối xứng, nếu
        thẻ <code>&#x3C;address></code>, với tư cách là cha, không thể có phần tử
        <code>&#x3C;address></code> lồng nhau, thì cùng một
        nội dung <code>&#x3C;address></code> không thể có
        thẻ <code>&#x3C;address></code> là cha của nó).
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/group_role"
            >group</a
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
      <td>
        {{domxref("HTMLElement")}} Trước Gecko 2.0 (Firefox 4),
        Gecko triển khai phần tử này bằng cách sử dụng giao diện
        {{domxref("HTMLSpanElement")}}
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử liên quan đến section khác: {{HTMLElement("body")}}, {{HTMLElement("nav")}}, {{HTMLElement("article")}}, {{HTMLElement("aside")}}, {{HTMLElement("Heading_Elements", "h1")}}, {{HTMLElement("Heading_Elements", "h2")}}, {{HTMLElement("Heading_Elements", "h3")}}, {{HTMLElement("Heading_Elements", "h4")}}, {{HTMLElement("Heading_Elements", "h5")}}, {{HTMLElement("Heading_Elements", "h6")}}, {{HTMLElement("hgroup")}}, {{HTMLElement("footer")}}, {{HTMLElement("section")}}, {{HTMLElement("header")}};
- [Các section và outline của tài liệu HTML](/en-US/docs/Web/HTML/Reference/Elements/Heading_Elements).
