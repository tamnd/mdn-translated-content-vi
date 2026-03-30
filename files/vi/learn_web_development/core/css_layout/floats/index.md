---
title: Floats (Thả nổi)
slug: Learn_web_development/Core/CSS_layout/Floats
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Introduction", "Learn_web_development/Core/CSS_layout/Test_your_skills/Floats", "Learn_web_development/Core/CSS_layout")}}

Ban đầu được dùng để thả nổi hình ảnh bên trong các khối văn bản, thuộc tính {{cssxref("float")}} đã trở thành một trong những công cụ được sử dụng phổ biến nhất để tạo bố cục nhiều cột trên trang web. Với sự xuất hiện của flexbox và lưới, nó đã quay về mục đích ban đầu, như bài viết này giải thích.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        >,
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>,
        <a href="/en-US/docs/Learn_web_development/Core/Text_styling/Fundamentals">Tạo kiểu văn bản và phông chữ cơ bản</a>,
        quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/CSS_layout/Introduction">các khái niệm cơ bản về bố cục CSS</a>.
      </td>
    </tr>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu mục đích của floats — để thả nổi hình ảnh bên trong các cột văn bản, và các kỹ thuật khác như chữ hoa đầu dòng và hộp thông tin thả nổi.</li>
          <li>Hiểu rằng floats từng được sử dụng cho bố cục nhiều cột, nhưng điều đó không còn đúng nữa khi có các công cụ tốt hơn.</li>
          <li>Sử dụng thuộc tính <code>float</code> để tạo floats.</li>
          <li>Xóa floats bằng <code>clear</code> và giá trị <code>display: flow-root</code>.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Nguồn gốc của floats

Thuộc tính {{cssxref("float")}} được giới thiệu để cho phép các nhà phát triển web triển khai các bố cục liên quan đến hình ảnh nổi bên trong một cột văn bản, với văn bản bao quanh bên trái hoặc bên phải của nó. Kiểu thứ bạn có thể thấy trong bố cục tờ báo.

Nhưng các nhà phát triển web nhanh chóng nhận ra rằng bạn có thể thả nổi bất cứ thứ gì, không chỉ hình ảnh, vì vậy việc sử dụng float đã mở rộng, ví dụ: đến các hiệu ứng bố cục thú vị như [chữ hoa đầu dòng](https://css-tricks.com/snippets/css/drop-caps/).

Floats thường được sử dụng để tạo toàn bộ bố cục trang web với nhiều cột thông tin thả nổi để chúng nằm cạnh nhau (hành vi mặc định sẽ là các cột nằm bên dưới nhau theo cùng thứ tự xuất hiện trong nguồn). Hiện có các kỹ thuật bố cục mới và tốt hơn. Sử dụng floats theo cách này nên được coi là kỹ thuật kế thừa.

Trong bài viết này, chúng ta sẽ chỉ tập trung vào các cách sử dụng đúng đắn của floats.

## Ví dụ về float

Hãy cùng khám phá cách sử dụng floats. Chúng ta sẽ bắt đầu với một ví dụ liên quan đến việc thả nổi một khối văn bản xung quanh một phần tử. Bạn có thể theo dõi bằng cách tạo một tệp `index.html` mới trên máy tính của mình, điền vào đó [mẫu HTML](https://github.com/mdn/learning-area/blob/main/html/introduction-to-html/getting-started/index.html) và chèn mã bên dưới vào đúng vị trí. Ở cuối phần, bạn có thể thấy ví dụ trực tiếp về giao diện cuối cùng của mã sẽ trông như thế nào.

Đầu tiên, chúng ta sẽ bắt đầu với một số HTML. Thêm nội dung sau vào phần thân HTML của bạn, xóa bất cứ thứ gì đang ở đó trước:

```html
<h1>Float example</h1>

<div class="box">Float</div>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet.
</p>

<p>
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

Bây giờ hãy áp dụng CSS sau vào HTML của bạn (sử dụng phần tử {{htmlelement("style")}} hoặc {{htmlelement("link")}} đến một tệp `.css` riêng — tùy bạn chọn):

```css
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
  font:
    0.9em/1.2 "Helvetica",
    "Arial",
    sans-serif;
}

.box {
  width: 150px;
  height: 100px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
}
```

Nếu bạn lưu và làm mới, bạn sẽ thấy thứ gì đó giống như những gì bạn mong đợi: hộp đang nằm phía trên văn bản, trong luồng thông thường.

### Thả nổi hộp

Để thả nổi hộp, hãy thêm các thuộc tính {{cssxref("float")}} và {{cssxref("margin-right")}} vào quy tắc `.box`:

```html hidden
<h1>Float example</h1>

<div class="box">Float</div>

<p>
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet.
</p>

<p>
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

```css
.box {
  float: left;
  margin-right: 15px;
  width: 150px;
  height: 100px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
}
```

Bây giờ nếu bạn lưu và làm mới, bạn sẽ thấy thứ gì đó như sau:

{{EmbedLiveSample('Floating_the_box', '100%', 500)}}

Hãy suy nghĩ về cách float hoạt động. Phần tử có float được đặt (phần tử {{htmlelement("div")}} trong trường hợp này) được lấy ra khỏi luồng bố cục thông thường của tài liệu và dính vào phía bên trái của vùng chứa cha của nó ({{htmlelement("body")}}, trong trường hợp này). Bất kỳ nội dung nào đến bên dưới phần tử thả nổi trong luồng bố cục thông thường sẽ bao quanh nó, lấp đầy không gian bên phải của nó từ trên xuống đến đỉnh của phần tử thả nổi. Ở đó, nó sẽ dừng lại.

Thả nổi nội dung sang phải có cùng hiệu ứng, nhưng ngược lại: phần tử thả nổi sẽ dính vào bên phải, và nội dung sẽ bao quanh nó bên trái. Hãy thử thay đổi giá trị float thành `right` và thay {{cssxref("margin-right")}} bằng {{cssxref("margin-left")}} trong tập quy tắc cuối cùng để xem kết quả là gì.

### Trực quan hóa float

Trong khi chúng ta có thể thêm lề vào float để đẩy văn bản ra xa, chúng ta không thể thêm lề vào văn bản để di chuyển nó ra khỏi float. Điều này là vì phần tử thả nổi được lấy ra khỏi luồng thông thường và các hộp của các mục theo sau thực sự chạy phía sau float. Bạn có thể thấy điều này bằng cách thực hiện một số thay đổi đối với ví dụ của mình.

Thêm một class `special` vào đoạn văn đầu tiên, đoạn ngay sau hộp thả nổi, sau đó trong CSS của bạn hãy thêm các quy tắc sau. Những quy tắc này sẽ cho đoạn văn tiếp theo của chúng ta một màu nền.

```css
.special {
  background-color: rgb(148 255 172);
  padding: 10px;
  color: purple;
}
```

Để dễ nhìn hơn, hãy thay đổi `margin-right` trên float của bạn thành `margin` để bạn có không gian xung quanh float. Bạn sẽ có thể thấy nền trên đoạn văn chạy ngay bên dưới hộp thả nổi, như trong ví dụ dưới đây.

```html hidden
<h1>Float example</h1>

<div class="box">Float</div>

<p class="special">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet.
</p>

<p>
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

```css hidden
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
  font:
    0.9em/1.2 "Helvetica",
    "Arial",
    sans-serif;
}

.box {
  float: left;
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
}
```

{{EmbedLiveSample('Visualizing_the_float', '100%', 500)}}

Các [hộp dòng](/en-US/docs/Web/CSS/Guides/Display/Visual_formatting_model#line_boxes) của phần tử tiếp theo của chúng ta đã được rút ngắn lại để văn bản bao quanh float, nhưng do float bị xóa khỏi luồng thông thường nên hộp xung quanh đoạn văn vẫn giữ toàn bộ chiều rộng.

## Xóa floats

Chúng ta đã thấy rằng một float bị xóa khỏi luồng thông thường và các phần tử khác sẽ hiển thị bên cạnh nó. Nếu chúng ta muốn ngăn phần tử tiếp theo di chuyển lên, chúng ta cần _xóa_ nó; điều này được thực hiện bằng thuộc tính {{cssxref("clear")}}.

Trong HTML từ ví dụ trước, hãy thêm class `cleared` vào đoạn văn thứ hai bên dưới mục thả nổi. Sau đó thêm nội dung sau vào CSS của bạn:

```css
.cleared {
  clear: left;
}
```

```html hidden
<h1>Float example</h1>

<div class="box">Float</div>

<p class="special">
  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus aliquam
  dolor, eu lacinia lorem placerat vulputate. Duis felis orci, pulvinar id metus
  ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at ultricies tellus
  laoreet sit amet.
</p>

<p class="cleared">
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

```css hidden
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
  font:
    0.9em/1.2 "Helvetica",
    "Arial",
    sans-serif;
}

.box {
  float: left;
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
}

.special {
  background-color: rgb(148 255 172);
  padding: 10px;
  color: purple;
}

.cleared {
  clear: left;
}
```

{{EmbedLiveSample('Clearing_floats', '100%', 600)}}

Bạn sẽ thấy rằng đoạn văn thứ hai bây giờ đã xóa phần tử thả nổi và không còn xuất hiện cạnh nó nữa. Thuộc tính `clear` chấp nhận các giá trị sau:

- `left`: Xóa các mục thả nổi về phía trái.
- `right`: Xóa các mục thả nổi về phía phải.
- `both`: Xóa bất kỳ mục thả nổi nào, trái hoặc phải.

## Xóa hộp bao quanh float

Bây giờ bạn biết cách xóa thứ gì đó theo sau một phần tử thả nổi, nhưng hãy xem điều gì xảy ra nếu bạn có một float cao và một đoạn văn ngắn, với một hộp chứa _cả hai_ phần tử.

### Vấn đề

Thay đổi tài liệu của bạn để đoạn văn đầu tiên và hộp thả nổi được bọc chung trong một {{htmlelement("div")}}, có class là `wrapper`.

```html live-sample___the_problem
<div class="wrapper">
  <div class="box">Float1</div>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
</div>
```

Trong CSS của bạn, hãy thêm quy tắc sau cho class `.wrapper` rồi tải lại trang:

```css live-sample___the_problem
.wrapper {
  background-color: rgb(148 255 172);
  padding: 10px;
  color: purple;
}
```

Ngoài ra, hãy xóa class `.cleared` gốc:

```css
.cleared {
  clear: left;
}
```

Bạn sẽ thấy rằng, giống như ví dụ về việc đặt màu nền trên đoạn văn, màu nền chạy phía sau float.

```html hidden live-sample___the_problem
<p>
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

```css hidden live-sample___the_problem
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
  font:
    0.9em/1.2 "Helvetica",
    "Arial",
    sans-serif;
}

.box {
  float: left;
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
  color: black;
}
```

{{EmbedLiveSample('the_problem', '100%', 600)}}

Một lần nữa, điều này là vì float đã được lấy ra khỏi luồng thông thường. Bạn có thể mong đợi rằng bằng cách bọc hộp thả nổi và văn bản của đoạn văn đầu tiên bao quanh float lại với nhau, nội dung tiếp theo sẽ được xóa khỏi hộp. Nhưng điều này không phải như vậy.

### display: flow-root

Để giải quyết vấn đề này là sử dụng giá trị `flow-root` của thuộc tính `display`. Điều này chỉ tồn tại để giải quyết vấn đề cụ thể này mà không sử dụng các thủ thuật — sẽ không có hậu quả không mong muốn khi bạn sử dụng nó.

```css
.wrapper {
  background-color: rgb(148 255 172);
  padding: 10px;
  color: purple;
  display: flow-root;
}
```

```html hidden
<h1>Float example</h1>
<div class="wrapper">
  <div class="box">Float</div>

  <p>
    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla luctus
    aliquam dolor, eu lacinia lorem placerat vulputate. Duis felis orci,
    pulvinar id metus ut, rutrum luctus orci. Cras porttitor imperdiet nunc, at
    ultricies tellus laoreet sit amet.
  </p>
</div>
<p class="cleared">
  Sed auctor cursus massa at porta. Integer ligula ipsum, tristique sit amet
  orci vel, viverra egestas ligula. Curabitur vehicula tellus neque, ac ornare
  ex malesuada et. In vitae convallis lacus. Aliquam erat volutpat. Suspendisse
  ac imperdiet turpis. Aenean finibus sollicitudin eros pharetra congue. Duis
  ornare egestas augue ut luctus. Proin blandit quam nec lacus varius commodo et
  a urna. Ut id ornare felis, eget fermentum sapien.
</p>

<p>
  Nam vulputate diam nec tempor bibendum. Donec luctus augue eget malesuada
  ultrices. Phasellus turpis est, posuere sit amet dapibus ut, facilisis sed
  est. Nam id risus quis ante semper consectetur eget aliquam lorem. Vivamus
  tristique elit dolor, sed pretium metus suscipit vel. Mauris ultricies lectus
  sed lobortis finibus. Vivamus eu urna eget velit cursus viverra quis
  vestibulum sem. Aliquam tincidunt eget purus in interdum. Cum sociis natoque
  penatibus et magnis dis parturient montes, nascetur ridiculus mus.
</p>
```

```css hidden
body {
  width: 90%;
  max-width: 900px;
  margin: 0 auto;
  font:
    0.9em/1.2 "Helvetica",
    "Arial",
    sans-serif;
}

.box {
  float: left;
  margin: 15px;
  width: 150px;
  height: 150px;
  border-radius: 5px;
  background-color: rgb(207 232 220);
  padding: 1em;
  color: black;
}
```

{{EmbedLiveSample('display_flow-root', '100%', 600)}}

## Tóm tắt

Đó là tất cả những gì bạn cần biết về floats. Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra để kiểm tra mức độ hiểu và ghi nhớ tất cả thông tin này của bạn.

{{PreviousMenuNext("Learn_web_development/Core/CSS_layout/Introduction", "Learn_web_development/Core/CSS_layout/Test_your_skills/Floats", "Learn_web_development/Core/CSS_layout")}}
