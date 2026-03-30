---
title: Tạo kiểu liên kết
slug: Learn_web_development/Core/Text_styling/Styling_links
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Styling_lists", "Learn_web_development/Core/Text_styling/Web_fonts", "Learn_web_development/Core/Text_styling")}}

Khi tạo kiểu [liên kết](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links), điều quan trọng là hiểu tại sao kiểu liên kết mặc định lại quan trọng, cách sử dụng lớp giả để tạo kiểu các trạng thái liên kết một cách hiệu quả, và cách tạo kiểu liên kết để dùng trong các thành phần giao diện phổ biến và đa dạng như menu điều hướng và các tab. Chúng ta sẽ xem xét tất cả các chủ đề này trong bài viết này.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content"
          >Cấu trúc nội dung với HTML</a
        > và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Kiến thức cơ bản về tạo kiểu CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu tại sao kiểu liên kết mặc định quan trọng đối với khả năng sử dụng trên web — chúng quen thuộc và giúp người dùng nhận ra các liên kết.</li>
          <li>Tạo kiểu các trạng thái liên kết: <code>:hover</code>, <code>:focus</code>, <code>:visited</code>, và <code>:active</code>.</li>
          <li>Hiểu tại sao các trạng thái liên kết cần thiết cho khả năng tiếp cận và khả năng sử dụng.</li>
          <li>Bao gồm các biểu tượng trên các liên kết.</li>
          <li>Tạo menu điều hướng với danh sách và liên kết.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Các trạng thái liên kết

Điều đầu tiên cần hiểu là khái niệm về các trạng thái liên kết — các trạng thái khác nhau mà liên kết có thể tồn tại. Những thứ này có thể được tạo kiểu bằng các [lớp giả](/en-US/docs/Learn_web_development/Core/Styling_basics/Pseudo_classes_and_elements) khác nhau:

- **Link**: Một liên kết có đích đến (tức là không chỉ là neo có tên), được tạo kiểu bằng lớp giả {{cssxref(":link")}}.
- **Visited**: Một liên kết đã được truy cập trước đó (tồn tại trong lịch sử trình duyệt), được tạo kiểu bằng lớp giả {{cssxref(":visited")}}.
- **Hover**: Một liên kết đang được con trỏ chuột của người dùng di chuột lên, được tạo kiểu bằng lớp giả {{cssxref(":hover")}}.
- **Focus**: Một liên kết đang được focus (ví dụ: được di chuyển đến bằng bàn phím của người dùng sử dụng phím <kbd>Tab</kbd> hoặc tương tự, hoặc được focus theo chương trình bằng {{domxref("HTMLElement.focus()")}}) — điều này được tạo kiểu bằng lớp giả {{cssxref(":focus")}}.
- **Active**: Một liên kết đang được kích hoạt (ví dụ: nhấp vào), được tạo kiểu bằng lớp giả {{cssxref(":active")}}.

## Kiểu mặc định

Ví dụ dưới đây minh họa một liên kết sẽ trông và hoạt động như thế nào theo mặc định, mặc dù CSS đang phóng to và căn giữa văn bản để làm nó nổi bật hơn. Bạn có thể so sánh giao diện và hành vi của kiểu mặc định trong ví dụ với các liên kết khác trên trang này, có nhiều kiểu CSS hơn được áp dụng. Các liên kết mặc định có các thuộc tính sau:

- Liên kết được gạch chân.
- Liên kết chưa truy cập có màu xanh lam.
- Liên kết đã truy cập có màu tím.
- Di chuột qua liên kết làm con trỏ chuột thay đổi thành biểu tượng tay nhỏ.
- Liên kết được focus có viền xung quanh chúng — bạn sẽ có thể focus vào các liên kết trên trang này bằng bàn phím bằng cách nhấn phím tab.
- Liên kết đang hoạt động có màu đỏ. Hãy thử giữ nút chuột khi bạn nhấp vào liên kết.

```html
<p><a href="#">A simple link</a></p>
```

```css
p {
  font-size: 2rem;
  text-align: center;
}
```

{{ EmbedLiveSample('Default_styles', '100%', 130) }}

> [!NOTE]
> Tất cả các ví dụ liên kết trên trang này đều liên kết đến đầu cửa sổ nhúng của chúng. Fragment rỗng (`href="#"`) được sử dụng để tạo các ví dụ đơn giản và đảm bảo các ví dụ trực tiếp, mỗi cái được chứa trong một {{HTMLElement("iframe")}}, không bị hỏng.

Thú vị thay, các kiểu mặc định gần như giống nhau như chúng vào những ngày đầu của trình duyệt vào giữa những năm 1990. Điều này là vì người dùng biết và đã quen với hành vi này — nếu liên kết được tạo kiểu khác đi, nó sẽ làm người dùng bối rối. Điều này không có nghĩa là bạn không nên tạo kiểu liên kết chút nào. Nó chỉ có nghĩa là bạn không nên đi quá xa so với hành vi mong đợi. Bạn ít nhất nên:

- Sử dụng gạch chân cho liên kết, nhưng không cho các thứ khác. Nếu bạn không muốn gạch chân liên kết, ít nhất hãy tô sáng chúng theo cách nào đó khác.
- Làm cho chúng phản ứng theo một cách nào đó khi di chuột/focus, và theo cách hơi khác một chút khi được kích hoạt.

Các kiểu mặc định có thể được tắt/thay đổi bằng các thuộc tính CSS sau:

- {{cssxref("color")}} cho màu văn bản.
- {{cssxref("cursor")}} cho kiểu con trỏ chuột — bạn không nên tắt điều này trừ khi bạn có lý do rất chính đáng.
- {{cssxref("outline")}} cho viền văn bản. Viền tương tự như đường viền. Sự khác biệt duy nhất là đường viền chiếm không gian trong hộp, và viền thì không: viền nằm trên nền. Viền là trợ giúp khả năng tiếp cận hữu ích, vì vậy nó không nên được xóa mà không thêm một phương pháp khác để chỉ ra liên kết đang được focus.

> [!NOTE]
> Bạn không chỉ bị giới hạn với các thuộc tính trên để tạo kiểu liên kết của bạn — bạn có thể sử dụng bất kỳ thuộc tính nào bạn thích.

## Tạo kiểu liên kết

Bây giờ chúng ta đã khám phá các trạng thái mặc định một cách chi tiết, hãy xem xét một tập hợp kiểu liên kết điển hình.

Để bắt đầu, chúng ta sẽ viết ra các bộ quy tắc trống của chúng ta:

```css
a {
}

a:link {
}

a:visited {
}

a:focus {
}

a:hover {
}

a:active {
}
```

Thứ tự này quan trọng vì các kiểu liên kết xây dựng lên nhau. Ví dụ: các kiểu trong quy tắc đầu tiên sẽ áp dụng cho tất cả các quy tắc tiếp theo. Khi một liên kết được kích hoạt, nó thường cũng đang được di chuột lên. Nếu bạn đặt chúng theo thứ tự sai, và bạn đang thay đổi các thuộc tính giống nhau trong mỗi bộ quy tắc, mọi thứ sẽ không hoạt động như bạn mong đợi. Để nhớ thứ tự, bạn có thể thử sử dụng một ký hiệu ghi nhớ như **L**o**V**e **F**ears **HA**te.

Bây giờ hãy thêm thêm thông tin để tạo kiểu cho nó đúng cách:

```css
body {
  width: 300px;
  margin: 0 auto;
  font-size: 1.2rem;
  font-family: sans-serif;
}

p {
  line-height: 1.4;
}

a {
  outline-color: transparent;
}

a:link {
  color: #6900ff;
}

a:visited {
  color: #a5c300;
}

a:focus {
  text-decoration: none;
  background: #bae498;
}

a:hover {
  text-decoration: none;
  background: #cdfeaa;
}

a:active {
  background: #6900ff;
  color: #cdfeaa;
}
```

Chúng ta cũng sẽ cung cấp một số HTML mẫu để áp dụng CSS vào:

```html
<p>
  There are several browsers available, such as <a href="#">Mozilla Firefox</a>,
  <a href="#">Google Chrome</a>, and <a href="#">Microsoft Edge</a>.
</p>
```

Kết hợp hai lại với nhau cho chúng ta kết quả này:

{{ EmbedLiveSample('Styling_some_links', '100%', 200) }}

Vậy chúng ta đã làm gì ở đây? Điều này chắc chắn trông khác so với kiểu mặc định, nhưng nó vẫn cung cấp trải nghiệm đủ quen thuộc để người dùng biết chuyện gì đang xảy ra:

- Hai quy tắc đầu tiên không thú vị nhiều trong cuộc thảo luận này.
- Quy tắc thứ ba sử dụng bộ chọn `a` để loại bỏ viền focus (thay đổi giữa các trình duyệt dù sao).
- Tiếp theo, chúng ta sử dụng các bộ chọn `a:link` và `a:visited` để thiết lập một vài biến thể màu trên các liên kết chưa truy cập và đã truy cập, để chúng khác biệt.
- Hai quy tắc tiếp theo sử dụng `a:focus` và `a:hover` để thiết lập liên kết được focus và liên kết đang di chuột không có gạch chân và có màu nền khác nhau.
- Cuối cùng, `a:active` được sử dụng để cho liên kết một sơ đồ màu đảo ngược trong khi chúng đang được kích hoạt, để làm rõ điều gì đó quan trọng đang xảy ra!

## Tự tạo kiểu liên kết của bạn

Với nhiệm vụ này, chúng ta muốn bạn lấy tập hợp quy tắc trống của chúng ta và thêm các khai báo của riêng bạn để làm cho các liên kết trông thực sự ấn tượng. Hãy sử dụng trí tưởng tượng của bạn, tự do sáng tạo. Chúng tôi chắc chắn bạn có thể tạo ra thứ gì đó ấn tượng hơn và cũng có tính chức năng như ví dụ của chúng tôi ở trên.

1. Nhấp vào **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Cho các liên kết một số kiểu mặc định sẽ được áp dụng cho chúng mọi lúc. Bạn không nhất thiết phải chỉ dùng màu văn bản, nhưng hãy đảm bảo các liên kết vẫn có thể nhận ra là liên kết.
3. Cho các liên kết _đã truy cập_ màu hơi khác so với kiểu liên kết mặc định bạn đã thiết lập.
4. Cho các trạng thái _focus_ và _hover_ của liên kết một kiểu riêng biệt làm nổi bật chúng hơn các liên kết khác. Ngoài ra, xóa gạch chân mặc định khi liên kết đang được focus/hover.
5. Cho trạng thái _active_ một kiểu khác nữa.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem ví dụ giải pháp bên dưới đầu ra ví dụ.

```html-nolint live-sample___link_styling
<p>
  There are several browsers available, such as
  <a href="https://www.mozilla.org/firefox/new/" target="_blank">Mozilla Firefox</a>,
  <a href="https://www.google.co.uk/chrome/" target="_blank">Google Chrome</a>, and
  <a href="https://www.microsoft.com/edge" target="_blank">Microsoft Edge</a>.
</p>
```

```css-nolint hidden live-sample___link_styling
p {
  font-size: 1.2rem;
  font-family: sans-serif;
  line-height: 1.4;
}

```

```css live-sample___link_styling
a {
}

a:visited {
}

a:focus,
a:hover {
}

a:active {
}
```

{{ EmbedLiveSample('link_styling', "100%", 100) }}

<details>
<summary>Nhấp vào đây để xem lời giải</summary>

CSS đã hoàn chỉnh của bạn có thể trông như sau:

```css
a {
  outline-color: transparent;
  padding: 2px 1px 0;
  color: #265301;
}

a:visited {
  color: #437a16;
}

a:hover,
a:focus {
  background: #bae498;
  text-decoration: none;
}

a:active {
  background: #265301;
  color: #cdfeaa;
}
```

</details>

## Bao gồm biểu tượng trên liên kết

Thực hành phổ biến là bao gồm các biểu tượng trên liên kết để chỉ ra loại nội dung mà liên kết trỏ tới. Hãy xem xét một ví dụ cơ bản thêm biểu tượng vào các liên kết bên ngoài (liên kết dẫn đến các trang web khác). Các biểu tượng liên kết bên ngoài thường là mũi tên chỉ ra khỏi các hộp. Cho ví dụ này, chúng ta sẽ sử dụng [biểu tượng liên kết bên ngoài từ icons8.com](https://icons8.com/icon/741/external-link).

Đầu tiên, một số HTML đơn giản để tạo kiểu:

```html-nolint
<p>
  For more information on the weather, visit our <a href="#">weather page</a>,
  look at <a href="https://en.wikipedia.org/">weather on Wikipedia</a>, or check
  out
  <a href="https://www.nationalgeographic.org/topics/resource-library-weather/">
    weather on National Geographic</a>.
</p>
```

Tiếp theo, đây là một số CSS sẽ cho chúng ta hiệu ứng chúng ta muốn:

```css
body {
  width: 300px;
  margin: 0 auto;
  font-family: sans-serif;
}

a[href^="http"]::after {
  content: "";
  display: inline-block;
  width: 0.8em;
  height: 0.8em;
  margin-left: 0.25em;

  background-size: 100%;
  background-image: url("external-link-52.png");
}
```

{{ EmbedLiveSample('Including_icons_on_links', '100%', 150) }}

Vậy chuyện gì đang xảy ra ở đây? Chúng ta sẽ bỏ qua hầu hết CSS, vì nó giống như trong các ví dụ trước. Tuy nhiên, quy tắc cuối cùng thú vị: chúng ta đang sử dụng bộ chọn phần tử giả {{cssxref("::after")}}. Phần tử giả `0.8em x 0.8em` được hiển thị sau văn bản neo dưới dạng một inline block, và biểu tượng được tham chiếu trong thuộc tính {{cssxref("background-image")}} của nó được đặt trong nền của phần tử giả. Chúng ta cũng đã bao gồm một số {{cssxref("margin-left")}} để tạo khoảng cách giữa biểu tượng và từ đứng trước nó.

Chúng ta đã sử dụng một [đơn vị tương đối](/en-US/docs/Learn_web_development/Core/Styling_basics/Values_and_units#relative_length_units): `em`. Nó định cỡ biểu tượng theo tỷ lệ với kích thước văn bản của neo. Nếu kích thước văn bản của neo thay đổi, kích thước biểu tượng cũng điều chỉnh theo.

Cuối cùng: làm thế nào chúng ta chỉ chọn các liên kết bên ngoài? Vậy, nếu bạn viết các [liên kết HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/Creating_links) đúng cách, bạn chỉ nên sử dụng URL tuyệt đối cho các liên kết bên ngoài — sử dụng liên kết tương đối để liên kết đến các phần khác của trang web của bạn hiệu quả hơn (như với liên kết đầu tiên). Do đó văn bản "http" chỉ nên xuất hiện trong các liên kết bên ngoài (như liên kết thứ hai và thứ ba), và chúng ta có thể chọn điều này với [bộ chọn thuộc tính](/en-US/docs/Learn_web_development/Core/Styling_basics/Attribute_selectors): `a[href^="http"]` chọn các phần tử {{htmlelement("a")}}, nhưng chỉ khi chúng có thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/a#href) với giá trị bắt đầu bằng "http".

Vậy là xong rồi. Hãy thử xem lại phần nhiệm vụ ở trên và thử kỹ thuật mới này nhé!

> [!NOTE]
> Đừng lo lắng nếu bạn chưa quen với [nền](/en-US/docs/Learn_web_development/Core/Styling_basics/Backgrounds_and_borders) và [thiết kế web responsive](/en-US/docs/Learn_web_development/Core/CSS_layout/Responsive_Design); những điều này được giải thích ở những nơi khác.

## Tạo kiểu liên kết như nút

Các công cụ bạn đã khám phá cho đến nay trong bài viết này cũng có thể được sử dụng theo những cách khác. Ví dụ, các trạng thái như hover có thể được sử dụng để tạo kiểu cho nhiều phần tử khác nhau, không chỉ liên kết — bạn có thể muốn tạo kiểu trạng thái hover của các đoạn văn, các mục danh sách, hoặc các thứ khác.

Ngoài ra, liên kết thường được tạo kiểu để hoạt động như các nút. Menu điều hướng của trang web có thể được đánh dấu như một tập hợp liên kết, và nó có thể được tạo kiểu để trông như một tập hợp các nút điều khiển hoặc tab cung cấp cho người dùng quyền truy cập vào các phần khác của trang. Hãy khám phá cách.

Đầu tiên, một số HTML:

```html
<nav class="container">
  <a href="#">Home</a>
  <a href="#">Pizza</a>
  <a href="#">Music</a>
  <a href="#">Wombats</a>
  <a href="#">Finland</a>
</nav>
```

Và bây giờ là CSS:

```css
body,
html {
  margin: 0;
  font-family: sans-serif;
}

.container {
  display: flex;
  gap: 0.625%;
}

a {
  flex: 1;
  text-decoration: none;
  outline-color: transparent;
  text-align: center;
  line-height: 3;
  color: black;
}

a:link,
a:visited,
a:focus {
  background: palegoldenrod;
  color: black;
}

a:hover {
  background: orange;
}

a:active {
  background: darkred;
  color: white;
}
```

Điều này cho chúng ta kết quả sau:

{{ EmbedLiveSample('Styling_links_as_buttons', '100%', 120) }}

HTML định nghĩa một phần tử {{HTMLElement("nav")}} với class `"container"`. `<nav>` chứa các liên kết của chúng ta.

CSS bao gồm tạo kiểu cho container và các liên kết mà nó chứa.

- Quy tắc thứ hai nói:
  - Container là một [flexbox](/en-US/docs/Learn_web_development/Core/CSS_layout/Flexbox). Các mục nó chứa — các liên kết, trong trường hợp này — sẽ là _flex items_.
  - Khoảng cách giữa các flex items sẽ là `0.625%` chiều rộng của container.
- Quy tắc thứ ba tạo kiểu các liên kết:
  - Khai báo đầu tiên, `flex: 1`, có nghĩa là chiều rộng của các mục sẽ được điều chỉnh để chúng sử dụng tất cả không gian khả dụng trong container.
  - Tiếp theo, chúng ta tắt {{cssxref("text-decoration")}} và {{cssxref("outline")}} mặc định — chúng ta không muốn chúng làm hỏng giao diện của mình.
  - Ba khai báo cuối cùng là để căn giữa văn bản bên trong mỗi liên kết, thiết lập {{cssxref("line-height")}} là 3 để cho các nút một chiều cao (điều này cũng có lợi ích căn giữa văn bản theo chiều dọc), và thiết lập màu văn bản thành đen.

## Tóm tắt

Hy vọng bài viết này đã cung cấp cho bạn tất cả những gì bạn cần biết về liên kết — vì bây giờ! Bài viết cuối cùng trong mô-đun Tạo kiểu văn bản của chúng ta trình bày cách sử dụng phông chữ web tùy chỉnh trên các trang web của bạn.

{{PreviousMenuNext("Learn_web_development/Core/Text_styling/Styling_lists", "Learn_web_development/Core/Text_styling/Web_fonts", "Learn_web_development/Core/Text_styling")}}
