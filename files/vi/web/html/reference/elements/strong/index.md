---
title: "<strong>: The Strong Importance element"
slug: Web/HTML/Reference/Elements/strong
page-type: html-element
browser-compat: html.elements.strong
sidebar: htmlsidebar
---

Phần tử **`<strong>`** trong [HTML](/en-US/docs/Web/HTML) chỉ ra rằng nội dung của nó có tầm quan trọng cao, sự nghiêm trọng hoặc tính cấp bách. Các trình duyệt thường hiển thị nội dung bằng chữ in đậm.

{{InteractiveExample("HTML Demo: &lt;strong&gt;", "tabbed-shorter")}}

```html interactive-example
<p>
  ... the most important rule, the rule you can never forget, no matter how much
  he cries, no matter how much he begs:
  <strong>never feed him after midnight</strong>.
</p>
```

```css interactive-example
p {
  font-size: 1rem;
}
```

## Thuộc tính

Phần tử này chỉ bao gồm các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

## Ghi chú sử dụng

Phần tử `<strong>` dành cho nội dung có "tầm quan trọng cao," bao gồm những điều có mức độ nghiêm trọng hoặc cấp bách lớn (chẳng hạn như cảnh báo). Đây có thể là một câu rất quan trọng với toàn bộ trang, hoặc bạn chỉ muốn chỉ ra rằng một số từ quan trọng hơn so với nội dung xung quanh.

Thông thường phần tử này được hiển thị mặc định bằng trọng lượng phông chữ đậm. Tuy nhiên, nó _không_ nên được dùng để áp dụng kiểu dáng in đậm; hãy dùng thuộc tính CSS {{cssxref("font-weight")}} cho mục đích đó. Hãy dùng phần tử {{HTMLElement("b")}} để thu hút sự chú ý vào một số văn bản mà không chỉ ra mức độ quan trọng cao hơn. Hãy dùng phần tử {{HTMLElement("em")}} để đánh dấu văn bản có nhấn mạnh về ngữ điệu.

Một cách sử dụng được chấp nhận khác cho `<strong>` là để biểu thị nhãn của các đoạn đại diện cho các ghi chú hoặc cảnh báo trong văn bản của trang.

### \<b> và \<strong>

Thường gây nhầm lẫn cho các nhà phát triển mới rằng tại sao có nhiều cách để diễn đạt cùng một điều trên một trang web được hiển thị. {{HTMLElement("b")}} và `<strong>` có lẽ là một trong những nguồn nhầm lẫn phổ biến nhất, khiến các nhà phát triển hỏi "Tôi nên dùng `<b>` hay `<strong>`? Chúng chẳng phải làm cùng một điều sao?"

Không hẳn. Phần tử `<strong>` dành cho nội dung có tầm quan trọng hơn, trong khi phần tử `<b>` được dùng để thu hút sự chú ý vào văn bản mà không chỉ ra tầm quan trọng cao hơn.

Có thể hữu ích khi nhận ra rằng cả hai đều là các phần tử HTML hợp lệ và có ngữ nghĩa, và đó là sự trùng hợp khi cả hai đều có kiểu dáng mặc định giống nhau (in đậm) trong hầu hết các trình duyệt (mặc dù một số trình duyệt cũ thực sự gạch chân `<strong>`). Mỗi phần tử được thiết kế để dùng trong các loại tình huống nhất định, và nếu bạn muốn in đậm văn bản để trang trí, bạn thực sự nên dùng thuộc tính CSS {{cssxref("font-weight")}} thay thế.

Ý nghĩa hoặc mục đích dự định của văn bản được bao quanh nên quyết định phần tử nào bạn sử dụng. Truyền đạt ý nghĩa là tất cả những gì ngữ nghĩa nói đến.

### \<em> và \<strong>

Thêm vào sự nhầm lẫn là việc trong khi HTML 4 định nghĩa `<strong>` là chỉ ra sự nhấn mạnh mạnh hơn, HTML 5 định nghĩa `<strong>` là đại diện cho "tầm quan trọng mạnh cho nội dung của nó." Đây là một sự phân biệt quan trọng.

Trong khi `<em>` được dùng để thay đổi ý nghĩa của một câu như nhấn mạnh khi nói ("I _love_ carrots" vs. "I love _carrots_"), `<strong>` được dùng để thêm tầm quan trọng cho các phần của câu (ví dụ: "**Warning!** This is **very dangerous.**") Cả `<strong>` và `<em>` đều có thể được lồng vào nhau để tăng mức độ tương đối của tầm quan trọng hoặc nhấn mạnh ngữ điệu.

## Ví dụ

### Ví dụ cơ bản

```html
<p>
  Before proceeding, <strong>make sure you put on your safety goggles</strong>.
</p>
```

#### Kết quả

{{EmbedLiveSample("Basic_example", 650, 80)}}

### Ghi nhãn cảnh báo

```html
<p>
  <strong>Important:</strong> Before proceeding, make sure you add plenty of
  butter.
</p>
```

#### Kết quả

{{EmbedLiveSample("Labeling_warnings", 650, 80)}}

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
      <th scope="row">Bỏ thẻ</th>
      <td>Không được phép; phải có cả thẻ mở và thẻ đóng.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >, hoặc bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >nội dung luồng</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <code
          ><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/structural_roles#structural_roles_with_html_equivalents">strong</a
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
      <td>{{domxref("HTMLElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("b")}}
- Phần tử {{HTMLElement("em")}}
- Thuộc tính {{cssxref("font-weight")}}
