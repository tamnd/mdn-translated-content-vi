---
title: Bộ chọn thuộc tính
slug: Learn_web_development/Core/Styling_basics/Attribute_selectors
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Basic_selectors", "Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements", "Learn_web_development/Core/Styling_basics")}}

Như bạn biết từ nghiên cứu HTML, các phần tử có thể có các thuộc tính cung cấp thêm chi tiết về phần tử đang được đánh dấu. Trong CSS, bạn có thể sử dụng bộ chọn thuộc tính để nhắm mục tiêu các phần tử có thuộc tính nhất định. Bài học này sẽ chỉ cho bạn cách sử dụng những bộ chọn rất hữu ích này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Kiến thức cơ bản về HTML (học qua
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content/Basic_HTML_syntax"
          >Cú pháp HTML cơ bản</a
        >), <a href="/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors">Bộ chọn CSS cơ bản</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Khái niệm cơ bản về bộ chọn thuộc tính.</li>
          <li>Bộ chọn thuộc tính sự hiện diện và giá trị.</li>
          <li>Bộ chọn thuộc tính khớp chuỗi con.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Bộ chọn sự hiện diện và giá trị

Các bộ chọn này cho phép chọn phần tử dựa trên sự hiện diện của thuộc tính đơn thuần (ví dụ `href`), hoặc dựa trên các khớp khác nhau với giá trị của thuộc tính.

| Bộ chọn          | Ví dụ                           | Mô tả                                                                                                                                           |
| ---------------- | ------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `[attr]`         | `a[title]`                      | Khớp các phần tử có thuộc tính _attr_ (có tên là giá trị trong dấu ngoặc vuông).                                                                |
| `[attr=value]`   | `a[href="https://example.com"]` | Khớp các phần tử có thuộc tính _attr_ có giá trị chính xác là _value_ — chuỗi bên trong dấu ngoặc kép.                                          |
| `[attr~=value]`  | `p[class~="special"]`           | Khớp các phần tử có thuộc tính _attr_ có giá trị chính xác là _value_, hoặc chứa _value_ trong danh sách giá trị (phân tách bằng khoảng trắng). |
| `[attr\|=value]` | `div[lang\|="zh"]`              | Khớp các phần tử có thuộc tính _attr_ có giá trị chính xác là _value_ hoặc bắt đầu bằng _value_ ngay sau dấu gạch nối.                          |

Trong ví dụ bên dưới, bạn có thể thấy các bộ chọn này đang được sử dụng.

- Bằng cách sử dụng `li[class]` chúng ta có thể khớp bất kỳ mục danh sách nào có thuộc tính lớp. Điều này khớp với tất cả các mục danh sách trừ mục đầu tiên.
- `li[class="a"]` khớp bộ chọn có lớp là `a`, nhưng không phải bộ chọn có lớp là `a` với lớp khác phân tách bằng khoảng trắng là một phần của giá trị. Nó chọn mục danh sách thứ hai.
- `li[class~="a"]` sẽ khớp lớp là `a` nhưng cũng là giá trị chứa lớp `a` như một phần của danh sách phân tách bằng khoảng trắng. Nó chọn mục danh sách thứ hai và thứ ba.

```html live-sample___attribute
<h1>Attribute presence and value selectors</h1>
<ul>
  <li>Item 1</li>
  <li class="a">Item 2</li>
  <li class="a b">Item 3</li>
  <li class="ab">Item 4</li>
</ul>
```

```css live-sample___attribute
body {
  font-family: sans-serif;
}
li[class] {
  font-size: 120%;
}

li[class="a"] {
  background-color: yellow;
}

li[class~="a"] {
  color: red;
}
```

{{EmbedLiveSample("attribute", "", "200px")}}

Hãy thử chỉnh sửa CSS trên để thêm quy tắc chỉ chọn các mục danh sách có giá trị thuộc tính `class` là `ab`, và cho chúng màu văn bản `white` và `background-color` là `purple`.

## Bộ chọn khớp chuỗi con

Các bộ chọn này cho phép khớp nâng cao hơn các chuỗi con bên trong giá trị thuộc tính của bạn. Ví dụ, nếu bạn có các lớp `box-warning` và `box-error` và muốn khớp mọi thứ bắt đầu bằng chuỗi "box-", bạn có thể sử dụng `[class^="box-"]` để chọn cả hai (hoặc `[class|="box"]` như được mô tả trong phần trên).

| Bộ chọn         | Ví dụ               | Mô tả                                                                                   |
| --------------- | ------------------- | --------------------------------------------------------------------------------------- |
| `[attr^=value]` | `li[class^="box-"]` | Khớp các phần tử có thuộc tính _attr_ có giá trị bắt đầu bằng _value_.                  |
| `[attr$=value]` | `li[class$="-box"]` | Khớp các phần tử có thuộc tính _attr_ có giá trị kết thúc bằng _value_.                 |
| `[attr*=value]` | `li[class*="box"]`  | Khớp các phần tử có thuộc tính _attr_ có giá trị chứa _value_ ở bất kỳ đâu trong chuỗi. |

Ví dụ tiếp theo cho thấy cách sử dụng các bộ chọn này:

- `li[class^="a"]` khớp bất kỳ giá trị thuộc tính nào bắt đầu bằng `a`, vì vậy khớp với hai mục danh sách đầu tiên.
- `li[class$="a"]` khớp bất kỳ giá trị thuộc tính nào kết thúc bằng `a`, vì vậy khớp với mục danh sách thứ nhất và thứ ba.
- `li[class*="a"]` khớp bất kỳ giá trị thuộc tính nào mà `a` xuất hiện ở bất kỳ đâu trong chuỗi, vì vậy nó khớp với tất cả các mục danh sách của chúng ta.

```html live-sample___attribute-substring
<h1>Attribute substring matching selectors</h1>
<ul>
  <li class="a">Item 1</li>
  <li class="ab">Item 2</li>
  <li class="bca">Item 3</li>
  <li class="bcabc">Item 4</li>
</ul>
```

```css live-sample___attribute-substring
body {
  font-family: sans-serif;
}
li[class^="a"] {
  font-size: 120%;
}

li[class$="a"] {
  background-color: yellow;
}

li[class*="a"] {
  color: red;
}
```

{{EmbedLiveSample("attribute-substring", "", "200px")}}

Hãy thử chỉnh sửa CSS trên để thêm quy tắc chỉ chọn các mục danh sách có giá trị thuộc tính `class` kết thúc bằng `b` hoặc `c`, và cho chúng `border` `solid` rộng `2px` màu `black`. Bạn có thể phải sử dụng [danh sách bộ chọn](/en-US/docs/Learn_web_development/Core/Styling_basics/Basic_selectors#selector_lists) để giải quyết vấn đề này.

## Tóm tắt

Bây giờ chúng ta đã xong với bộ chọn thuộc tính, bạn có thể tiếp tục đến bài viết tiếp theo và đọc về bộ chọn lớp giả và phần tử giả.

{{PreviousMenuNext("Learn_web_development/Core/Styling_basics/Basic_selectors", "Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements", "Learn_web_development/Core/Styling_basics")}}
