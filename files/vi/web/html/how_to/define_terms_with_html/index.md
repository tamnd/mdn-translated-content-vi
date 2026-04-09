---
title: Define terms with HTML
slug: Web/HTML/How_to/Define_terms_with_HTML
page-type: how-to
sidebar: htmlsidebar
---

HTML cung cấp một số cách để truyền đạt ngữ nghĩa mô tả, dù là inline hay dưới dạng bảng chú giải có cấu trúc. Trong bài viết này, chúng ta sẽ đề cập đến cách đánh dấu từ khóa đúng cách khi bạn đang định nghĩa chúng.

<table class="standard-table">
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Bạn cần quen thuộc với cách
        <a href="/en-US/docs/Learn_web_development/Getting_started/Your_first_website"
          >tạo một tài liệu HTML cơ bản</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Tìm hiểu cách giới thiệu các từ khóa mới và cách xây dựng danh sách mô tả.
      </td>
    </tr>
  </tbody>
</table>

Khi bạn cần một thuật ngữ được định nghĩa, bạn có thể trực tiếp đến một từ điển hay bảng chú giải. Từ điển và bảng chú giải _chính thức_ liên kết các từ khóa với một hoặc nhiều mô tả, như trong trường hợp này:

> - Blue (_Tính từ_)
>   - : Có màu như bầu trời trong một ngày nắng đẹp.
>     _"Bầu trời xanh trong vắt"_

Nhưng chúng ta liên tục định nghĩa các từ khóa một cách không chính thức, như ở đây:

> **Firefox** là trình duyệt web do Mozilla Foundation tạo ra.

Để xử lý các trường hợp sử dụng này, {{Glossary("HTML")}} cung cấp {{Glossary("tag","thẻ")}} để đánh dấu mô tả và từ được mô tả, để ý nghĩa của bạn được truyền đạt đúng cách đến người đọc.

## Cách đánh dấu mô tả không chính thức

Trong sách giáo khoa, lần đầu tiên một từ khóa xuất hiện, thường được in đậm và định nghĩa ngay lập tức.

Chúng ta làm điều đó trong HTML cũng vậy, ngoại trừ HTML không phải là một phương tiện trực quan và vì vậy chúng ta không sử dụng in đậm. Chúng ta sử dụng {{htmlelement("dfn")}}, là một phần tử đặc biệt chỉ dùng để đánh dấu lần xuất hiện đầu tiên của từ khóa. Lưu ý rằng thẻ `<dfn>` bao quanh _từ cần định nghĩa_, không phải định nghĩa (định nghĩa bao gồm toàn bộ đoạn văn):

```html
<p><dfn>Firefox</dfn> là trình duyệt web do Mozilla Foundation tạo ra.</p>
```

> [!NOTE]
> Một cách sử dụng khác của in đậm là để nhấn mạnh nội dung. Bản thân in đậm là một khái niệm xa lạ với HTML, nhưng có [các thẻ để chỉ ra sự nhấn mạnh.](/en-US/docs/Learn_web_development/Core/Structuring_content/Emphasis_and_importance)

### Trường hợp đặc biệt: Viết tắt

Tốt nhất nên [đánh dấu viết tắt một cách đặc biệt](/en-US/docs/Learn_web_development/Core/Structuring_content/Advanced_text_features#abbreviations) bằng {{htmlelement("abbr")}}, để trình đọc màn hình đọc chúng một cách phù hợp và để bạn có thể thao tác trên tất cả các viết tắt một cách đồng nhất. Cũng như bất kỳ từ khóa mới nào, bạn nên định nghĩa viết tắt khi chúng xuất hiện lần đầu tiên.

```html
<p>
  <dfn><abbr>HTML</abbr> (hypertext markup language)</dfn>
  là ngôn ngữ mô tả được sử dụng để cấu trúc tài liệu trên web.
</p>
```

> [!NOTE]
> Đặc tả HTML thực sự [dành riêng thuộc tính `title`](https://html.spec.whatwg.org/multipage/text-level-semantics.html#the-abbr-element) để mở rộng viết tắt. Tuy nhiên, đây không phải là giải pháp thay thế chấp nhận được để cung cấp mở rộng inline. Nội dung của `title` hoàn toàn ẩn khỏi người dùng của bạn, trừ khi họ đang sử dụng chuột và tình cờ di chuột qua viết tắt. Đặc tả [thừa nhận điều này cũng vậy.](https://html.spec.whatwg.org/multipage/dom.html#attr-title)

### Cải thiện khả năng tiếp cận

{{HTMLElement('dfn')}} đánh dấu từ khóa được định nghĩa và chỉ ra rằng đoạn văn hiện tại định nghĩa từ khóa. Nói cách khác, có một mối quan hệ ngầm giữa phần tử `<dfn>` và container của nó. Nếu bạn muốn một mối quan hệ chính thức hơn, hoặc định nghĩa của bạn chỉ bao gồm một câu thay vì toàn bộ đoạn văn, bạn có thể sử dụng thuộc tính [`aria-describedby`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby) để liên kết chính thức hơn một thuật ngữ với định nghĩa của nó:

```html
<p>
  <span id="ff">
    <dfn aria-describedby="ff">Firefox</dfn>
    là trình duyệt web do Mozilla Foundation tạo ra.
  </span>
  Bạn có thể tải xuống tại <a href="https://www.mozilla.org">mozilla.org</a>
</p>
```

Công nghệ hỗ trợ thường có thể sử dụng thuộc tính này để tìm một lựa chọn thay thế văn bản cho một thuật ngữ nhất định. Bạn có thể sử dụng `aria-describedby` trên bất kỳ thẻ nào bao quanh một từ khóa cần được định nghĩa (không chỉ phần tử `<dfn>`). `aria-describedby` tham chiếu đến [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của phần tử chứa mô tả.

## Cách xây dựng danh sách mô tả

Danh sách mô tả chính là như tên gọi: danh sách các thuật ngữ và mô tả khớp của chúng (ví dụ, danh sách định nghĩa, mục từ điển, FAQ và các cặp khóa-giá trị).

> [!NOTE]
> Danh sách mô tả [không phù hợp để đánh dấu hội thoại,](https://html.spec.whatwg.org/multipage/grouping-content.html#the-dl-element) vì cuộc trò chuyện không trực tiếp mô tả người nói. Đây là [các khuyến nghị để đánh dấu hội thoại](https://html.spec.whatwg.org/multipage/semantics-other.html#conversations).

Các thuật ngữ được mô tả nằm bên trong các phần tử {{htmlelement("dt")}}. Mô tả khớp theo ngay sau, chứa trong một hoặc nhiều phần tử {{htmlelement("dd")}}. Bao gồm toàn bộ danh sách mô tả bằng một phần tử {{htmlelement("dl")}}.

### Ví dụ đơn giản

Đây là ví dụ mô tả các loại thức ăn và đồ uống:

```html
<dl>
  <dt>jambalaya</dt>
  <dd>
    rice-based entree typically containing chicken, sausage, seafood, and spices
  </dd>

  <dt>sukiyaki</dt>
  <dd>
    Japanese specialty consisting of thinly sliced meat, vegetables, and
    noodles, cooked in sake and soy sauce
  </dd>

  <dt>chianti</dt>
  <dd>dry Italian red wine originating in Tuscany</dd>
</dl>
```

> [!NOTE]
> Mẫu cơ bản, như bạn có thể thấy, là xen kẽ các thuật ngữ `<dt>` với mô tả `<dd>`. Nếu hai hoặc nhiều thuật ngữ xuất hiện liên tiếp, mô tả sau áp dụng cho tất cả chúng. Nếu hai hoặc nhiều mô tả xuất hiện liên tiếp, tất cả đều áp dụng cho thuật ngữ cuối cùng được đưa ra.

### Cải thiện đầu ra trực quan

Đây là cách một trình duyệt đồ họa hiển thị danh sách trên:

{{EmbedLiveSample("A_simple_example", 600, 180)}}

Nếu bạn muốn các từ khóa nổi bật hơn, bạn có thể thử in đậm chúng. Hãy nhớ, HTML không phải là phương tiện trực quan; chúng ta cần {{glossary("CSS")}} cho tất cả các hiệu ứng trực quan. Thuộc tính CSS {{cssxref("font-weight")}} là những gì bạn cần ở đây:

```css
dt {
  font-weight: bold;
}
```

Điều này tạo ra kết quả dễ đọc hơn một chút dưới đây:

{{EmbedLiveSample("How_to_build_a_description_list", 600, 180)}}

## Tìm hiểu thêm

- {{htmlelement("dfn")}}
- {{htmlelement("dl")}}
- {{htmlelement("dt")}}
- {{htmlelement("dd")}}
- [Cách sử dụng thuộc tính aria-describedby](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-describedby)
