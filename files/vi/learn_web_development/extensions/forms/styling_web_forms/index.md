---
title: Styling web forms
slug: Learn_web_development/Extensions/Forms/Styling_web_forms
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Other_form_controls","Learn_web_development/Extensions/Forms/Advanced_form_styling","Learn_web_development/Extensions/Forms")}}

Trong vài bài viết trước, chúng ta đã trình bày cách tạo biểu mẫu web trong HTML. Bây giờ, chúng ta sẽ trình bày cách tạo kiểu cho chúng bằng [CSS](/en-US/docs/Web/CSS).

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">Cơ bản về tạo kiểu CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu các vấn đề đằng sau việc tạo kiểu biểu mẫu, và học một số kỹ thuật tạo kiểu cơ bản sẽ hữu ích cho bạn.
      </td>
    </tr>
  </tbody>
</table>

## Những thách thức trong việc tạo kiểu widget biểu mẫu

### Lịch sử

Năm 1995, [đặc tả HTML 2](https://datatracker.ietf.org/doc/html/rfc1866) giới thiệu các điều khiển biểu mẫu (còn được gọi là "widget biểu mẫu", hoặc "phần tử biểu mẫu"). Nhưng CSS không được phát hành cho đến cuối năm 1996, và không được hỗ trợ bởi hầu hết các trình duyệt trong nhiều năm sau; vì vậy, trong thời gian chờ đợi, các trình duyệt dựa vào hệ điều hành cơ bản để hiển thị widget biểu mẫu.

Ngay cả khi CSS có sẵn, các nhà cung cấp trình duyệt ban đầu không muốn làm cho các phần tử biểu mẫu có thể tạo kiểu, vì người dùng đã quen với giao diện của các trình duyệt tương ứng. Nhưng mọi thứ đã thay đổi, và widget biểu mẫu bây giờ hầu hết có thể tạo kiểu, với một số ngoại lệ.

### Các loại widget

#### Dễ tạo kiểu

1. {{HTMLElement("form")}}
2. {{HTMLElement("fieldset")}} và {{HTMLElement("legend")}}
3. {{HTMLElement("input")}} văn bản một dòng (ví dụ, kiểu text, url, email), ngoại trừ [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search).
4. {{HTMLElement("textarea")}} nhiều dòng
5. Các nút (cả {{HTMLElement("input")}} và {{HTMLElement("button")}})
6. {{HTMLElement("label")}}
7. {{HTMLElement("output")}}

#### Khó tạo kiểu hơn

- Hộp kiểm và nút chọn
- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)

Bài viết [Tạo kiểu biểu mẫu nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling) trình bày cách tạo kiểu cho những phần tử này.

#### Có phần nội bộ không thể tạo kiểu chỉ bằng CSS

- [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color)
- Các điều khiển liên quan đến ngày như [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local)
- [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)
- [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file)
- Các phần tử liên quan đến tạo widget thả xuống, bao gồm {{HTMLElement("select")}}, {{HTMLElement("option")}}, {{HTMLElement("optgroup")}} và {{HTMLElement("datalist")}}.
  > [!NOTE]
  > Một số trình duyệt hiện hỗ trợ [Phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), một bộ tính năng HTML và CSS cùng nhau cho phép tùy chỉnh hoàn toàn các phần tử `<select>` và nội dung của chúng giống như bất kỳ phần tử DOM thông thường nào.
- {{HTMLElement("progress")}} và {{HTMLElement("meter")}}

Ví dụ, lịch bộ chọn ngày và nút trên \<select> hiển thị danh sách tùy chọn khi được nhấp không thể tạo kiểu chỉ bằng CSS.

Các bài viết [Tạo kiểu biểu mẫu nâng cao](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling) và [Cách xây dựng điều khiển biểu mẫu tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/How_to_build_custom_form_controls) mô tả cách tạo kiểu cho những thứ này.

> [!NOTE]
> Một số lớp giả CSS độc quyền, như {{cssxref('::-moz-range-track')}}, có khả năng tạo kiểu các thành phần nội bộ như vậy, nhưng chúng không nhất quán giữa các trình duyệt, vì vậy không đáng tin cậy lắm. Chúng ta sẽ đề cập đến những thứ này sau.

## Tạo kiểu widget biểu mẫu đơn giản

Các widget "dễ tạo kiểu" trong phần trước có thể được tạo kiểu bằng các kỹ thuật từ các bài viết [Biểu mẫu đầu tiên của bạn](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form) và [Các khối xây dựng CSS](/en-US/docs/Learn_web_development/Core/Styling_basics). Ngoài ra còn có các bộ chọn đặc biệt — [lớp giả giao diện người dùng](/en-US/docs/Learn_web_development/Extensions/Forms/UI_pseudo-classes) — cho phép tạo kiểu dựa trên trạng thái hiện tại của giao diện người dùng.

Chúng ta sẽ đi qua một ví dụ ở cuối bài viết này — nhưng trước tiên, đây là một số khía cạnh đặc biệt của tạo kiểu biểu mẫu đáng biết.

### Phông chữ và văn bản

Các tính năng phông chữ và văn bản CSS có thể được sử dụng dễ dàng với bất kỳ widget nào (và có, bạn có thể sử dụng {{cssxref("@font-face")}} với widget biểu mẫu). Tuy nhiên, hành vi của trình duyệt thường không nhất quán. Theo mặc định, một số widget không kế thừa {{cssxref("font-family")}} và {{cssxref("font-size")}} từ cha của chúng. Nhiều trình duyệt sử dụng giao diện mặc định của hệ thống thay thế. Để làm cho giao diện biểu mẫu của bạn nhất quán với phần còn lại của nội dung, bạn có thể thêm các quy tắc sau vào stylesheet của mình:

```css
button,
input,
select,
textarea {
  font-family: inherit;
  font-size: 100%;
}
```

Giá trị thuộc tính {{cssxref('inherit')}} khiến giá trị thuộc tính khớp với giá trị đã tính toán của thuộc tính của phần tử cha của nó; kế thừa giá trị của cha.

Các ảnh chụp màn hình bên dưới cho thấy sự khác biệt. Bên trái là hiển thị mặc định của `<input type="text">`, `<input type="date">`, {{htmlelement('select')}}, {{htmlelement('textarea')}}, `<input type="submit">`, và `<button>` trong Chrome trên macOS, với kiểu phông mặc định của nền tảng đang được sử dụng. Bên phải là các phần tử tương tự, với quy tắc kiểu của chúng ta được áp dụng.

![Form controls with default and inherited font families. By default, some types are serif and others are sans serif. Inheriting should change the fonts of all to the parent's font family - in this case a paragraph. Oddly, input of type submit does not inherit from the parent paragraph.](forms_fontfamily.png)

Các giá trị mặc định khác nhau theo nhiều cách. Kế thừa sẽ thay đổi phông chữ của chúng thành font của gia đình phông chữ cha — trong trường hợp này là phông chữ serif mặc định của phần tử chứa cha. Tất cả đều làm như vậy, với một ngoại lệ kỳ lạ — `<input type="submit">` không kế thừa từ đoạn văn cha trong Chrome. Thay vào đó, nó sử dụng {{cssxref('font-family#Values', 'font-family: system-ui')}}. Đây là một lý do nữa để sử dụng các phần tử `<button>` thay vì các loại đầu vào tương đương!

Có nhiều tranh luận về việc biểu mẫu trông đẹp hơn khi sử dụng kiểu mặc định của hệ thống, hay kiểu tùy chỉnh được thiết kế để khớp với nội dung của bạn. Quyết định này là của bạn, với tư cách là nhà thiết kế trang web hoặc ứng dụng web.

### Định cỡ hộp

Tất cả các trường văn bản đều có hỗ trợ hoàn toàn cho mọi thuộc tính liên quan đến mô hình hộp CSS, như {{cssxref("width")}}, {{cssxref("height")}}, {{cssxref("padding")}}, {{cssxref("margin")}} và {{cssxref("border")}}. Tuy nhiên, như trước, các trình duyệt dựa vào kiểu mặc định của hệ thống khi hiển thị các widget này. Tùy bạn để xác định cách bạn muốn kết hợp chúng vào nội dung của mình. Nếu bạn muốn giữ giao diện gốc của các widget, bạn sẽ gặp khó khăn nhỏ nếu muốn cung cấp cho chúng kích thước nhất quán.

**Điều này là vì mỗi widget có các quy tắc riêng cho đường viền, khoảng đệm và lề.** Để cung cấp kích thước giống nhau cho một số widget khác nhau, bạn có thể sử dụng thuộc tính {{cssxref("box-sizing")}} cùng với một số giá trị nhất quán cho các thuộc tính khác:

```css
input,
textarea,
select,
button {
  width: 150px;
  padding: 0;
  margin: 0;
  box-sizing: border-box;
}
```

Trong ảnh chụp màn hình bên dưới, cột bên trái cho thấy hiển thị mặc định của `<input type="radio">`, `<input type="checkbox">`, `<input type="range">`, `<input type="text">`, `<input type="date">`, {{htmlelement('select')}}, {{htmlelement('textarea')}}, `<input type="submit">` và {{htmlelement('button')}}. Cột bên phải mặt khác cho thấy các phần tử tương tự với quy tắc trên được áp dụng cho chúng. Lưu ý cách điều này cho phép chúng ta đảm bảo tất cả các phần tử chiếm cùng lượng không gian, mặc dù các quy tắc mặc định của nền tảng cho mỗi loại widget.

![box model properties effect most input types.](boxmodel_formcontrols1.png)

Điều có thể không rõ ràng qua ảnh chụp màn hình là các điều khiển nút chọn và hộp kiểm vẫn trông giống nhau, nhưng chúng được căn giữa trong 150px không gian ngang được cung cấp bởi thuộc tính {{cssxref('width')}}. Các trình duyệt khác có thể không căn giữa các widget, nhưng chúng tuân thủ không gian được phân bổ.

### Vị trí của legend

Phần tử {{HTMLElement("legend")}} có thể tạo kiểu, nhưng có thể hơi khó kiểm soát vị trí của nó. Theo mặc định, nó luôn được định vị trên đường viền trên cùng của cha {{HTMLElement("fieldset")}} của nó, gần góc trên bên trái. Để đặt nó ở nơi khác, ví dụ bên trong fieldset ở đâu đó, hoặc gần góc dưới bên trái, bạn cần dựa vào định vị.

Lấy ví dụ sau:

```html hidden live-sample___positioned-legend
<form>
  <fieldset>
    <legend>Choose all the vegetables you like to eat</legend>
    <ul>
      <li>
        <label for="carrots">Carrots</label>
        <input
          type="checkbox"
          checked
          id="carrots"
          name="carrots"
          value="carrots" />
      </li>
      <li>
        <label for="peas">Peas</label>
        <input type="checkbox" id="peas" name="peas" value="peas" />
      </li>
      <li>
        <label for="cabbage">Cabbage</label>
        <input type="checkbox" id="cabbage" name="cabbage" value="cabbage" />
      </li>
      <li>
        <label for="cauliflower">Cauliflower</label>
        <input
          type="checkbox"
          id="cauliflower"
          name="cauliflower"
          value="cauliflower" />
      </li>
      <li>
        <label for="broccoli">Broccoli</label>
        <input type="checkbox" id="broccoli" name="broccoli" value="broccoli" />
      </li>
    </ul>
  </fieldset>
  <fieldset>
    <legend>What is your favorite meal?</legend>
    <ul>
      <li>
        <label for="soup">Soup</label>
        <input type="radio" checked id="soup" name="meal" value="soup" />
      </li>
      <li>
        <label for="curry">Curry</label>
        <input type="radio" id="curry" name="meal" value="curry" />
      </li>
      <li>
        <label for="pizza">Pizza</label>
        <input type="radio" id="pizza" name="meal" value="pizza" />
      </li>
      <li>
        <label for="tacos">Tacos</label>
        <input type="radio" id="tacos" name="meal" value="tacos" />
      </li>
      <li>
        <label for="bolognese">Bolognese</label>
        <input type="radio" id="bolognese" name="meal" value="bolognese" />
      </li>
    </ul>
  </fieldset>
</form>
```

```css hidden live-sample___positioned-legend
form {
  width: 500px;
  margin: 0 auto;
}

fieldset {
  position: relative;
  margin-bottom: 20px;
}

legend {
  position: absolute;
  color: white;
  background-color: black;
  padding: 3px;
  bottom: 0;
  right: 0;
}
```

{{EmbedLiveSample("positioned-legend", '100%', 400)}}

Để định vị legend theo cách này, chúng ta đã sử dụng CSS sau (các khai báo khác đã được bỏ để ngắn gọn):

```css
fieldset {
  position: relative;
}

legend {
  position: absolute;
  bottom: 0;
  right: 0;
}
```

`<fieldset>` cũng cần được định vị, để `<legend>` được định vị tương đối với nó (nếu không `<legend>` sẽ được định vị tương đối với `<body>`).

Phần tử {{HTMLElement("legend")}} rất quan trọng cho khả năng tiếp cận — nó sẽ được đọc bởi công nghệ hỗ trợ như một phần của nhãn của mỗi phần tử biểu mẫu bên trong fieldset — nhưng sử dụng kỹ thuật như trên là ổn. Nội dung legend vẫn sẽ được đọc theo cùng cách; chỉ là vị trí trực quan đã thay đổi.

> [!NOTE]
> Bạn cũng có thể sử dụng thuộc tính {{cssxref("transform")}} để giúp bạn định vị `<legend>`. Tuy nhiên, khi bạn định vị nó bằng ví dụ `transform: translateY();`, nó di chuyển nhưng để lại một khoảng hở xấu xí trong đường viền `<fieldset>`, không dễ loại bỏ.

## Ví dụ tạo kiểu cụ thể

Hãy xem một ví dụ cụ thể về cách tạo kiểu biểu mẫu HTML. Chúng ta sẽ xây dựng biểu mẫu liên hệ kiểu "bưu thiếp" trông đẹp mắt; [xem phiên bản hoàn chỉnh tại đây](https://mdn.github.io/learning-area/html/forms/postcard-example/).

Nếu bạn muốn làm theo ví dụ này, hãy tạo một bản sao cục bộ của [tệp postcard-start.html](https://github.com/mdn/learning-area/blob/main/html/forms/postcard-example/postcard-start.html) của chúng ta, và làm theo các hướng dẫn bên dưới.

### HTML

HTML chỉ phức tạp hơn một chút so với ví dụ chúng ta đã dùng trong [Biểu mẫu đầu tiên của bạn](/en-US/docs/Learn_web_development/Extensions/Forms/Your_first_form); nó chỉ có thêm vài ID và tiêu đề.

```html
<form>
  <h1>to: Mozilla</h1>

  <div id="from">
    <label for="name">from:</label>
    <input type="text" id="name" name="user_name" />
  </div>

  <div id="reply">
    <label for="mail">reply:</label>
    <input type="email" id="mail" name="user_email" />
  </div>

  <div id="message">
    <label for="msg">Your message:</label>
    <textarea id="msg" name="user_message"></textarea>
  </div>

  <div class="button">
    <button type="submit">Send your message</button>
  </div>
</form>
```

Thêm mã trên vào phần body của HTML.

### Tổ chức tài nguyên của bạn

Đây là nơi vui bắt đầu! Trước khi bắt đầu lập trình, chúng ta cần ba tài nguyên bổ sung:

1. [Ảnh nền bưu thiếp](https://github.com/mdn/learning-area/blob/main/html/forms/postcard-example/background.jpg) — tải ảnh này xuống và lưu vào cùng thư mục với tệp HTML đang làm việc.
2. Phông chữ máy đánh chữ: [Phông chữ "Mom's Typewriter" từ dafont.com](https://www.dafont.com/moms-typewriter.font?back=theme) — tải tệp TTF vào cùng thư mục.
3. Phông chữ viết tay: [Phông chữ "Journal" từ dafont.com](https://www.dafont.com/journal.font) — tải tệp TTF vào cùng thư mục.

Phông chữ của bạn cần xử lý thêm trước khi bắt đầu:

1. Truy cập fontsquirrel.com [Webfont Generator](https://www.fontsquirrel.com/tools/webfont-generator).
2. Sử dụng biểu mẫu, tải lên cả hai tệp phông chữ và tạo bộ webfont. Tải bộ xuống máy tính.
3. Giải nén tệp zip đã cung cấp.
4. Bên trong nội dung đã giải nén bạn sẽ tìm thấy một số tệp phông chữ (tại thời điểm viết, hai tệp `.woff` và hai tệp `.woff2`; chúng có thể thay đổi trong tương lai.) Sao chép các tệp này vào thư mục có tên fonts, trong cùng thư mục như trước. Chúng ta đang sử dụng hai tệp khác nhau cho mỗi phông chữ để tối đa hóa khả năng tương thích trình duyệt; xem bài viết [Phông chữ web](/en-US/docs/Learn_web_development/Core/Text_styling/Web_fonts) của chúng ta để biết thêm thông tin.

### CSS

Bây giờ chúng ta có thể tìm hiểu CSS cho ví dụ. Thêm tất cả các khối mã được hiển thị bên dưới vào bên trong phần tử {{htmlelement("style")}}, lần lượt.

#### Bố cục tổng thể

Đầu tiên, chúng ta chuẩn bị bằng cách định nghĩa các quy tắc {{cssxref("@font-face")}} của chúng ta, và tất cả các kiểu cơ bản được đặt trên các phần tử {{HTMLElement("body")}} và {{HTMLElement("form")}}. Nếu đầu ra fontsquirrel khác với những gì chúng ta mô tả ở trên, bạn có thể tìm thấy các khối `@font-face` đúng bên trong bộ webfont đã tải xuống, trong tệp `stylesheet.css` (bạn sẽ cần thay thế các khối `@font-face` bên dưới bằng chúng, và cập nhật các đường dẫn đến tệp phông chữ):

```css
@font-face {
  font-family: "handwriting";
  src:
    url("fonts/journal-webfont.woff2") format("woff2"),
    url("fonts/journal-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

@font-face {
  font-family: "typewriter";
  src:
    url("fonts/momot___-webfont.woff2") format("woff2"),
    url("fonts/momot___-webfont.woff") format("woff");
  font-weight: normal;
  font-style: normal;
}

body {
  font: 1.3rem sans-serif;
  padding: 0.5em;
  margin: 0;
  background: #222222;
}

form {
  position: relative;
  width: 740px;
  height: 498px;
  margin: 0 auto;
  padding: 1em;
  box-sizing: border-box;
  background: white url("background.jpg");

  /* we create our grid */
  display: grid;
  grid-gap: 20px;
  grid-template-columns: repeat(2, 1fr);
  grid-template-rows: 10em 1em 1em 1em;
}
```

Lưu ý rằng chúng ta đã sử dụng [CSS grid](/en-US/docs/Web/CSS/Guides/Grid_layout) và [Flexbox](/en-US/docs/Web/CSS/Guides/Flexible_box_layout) để bố cục biểu mẫu. Sử dụng điều này chúng ta có thể dễ dàng định vị các phần tử của mình, bao gồm tiêu đề và tất cả các phần tử biểu mẫu:

```css
h1 {
  font:
    1em "typewriter",
    monospace;
  align-self: end;
}

#message {
  grid-row: 1 / 5;
}

#from,
#reply {
  display: flex;
}
```

#### Nhãn và điều khiển

Bây giờ chúng ta có thể bắt đầu làm việc trên các phần tử biểu mẫu. Đầu tiên, hãy đảm bảo rằng các {{HTMLElement("label")}} được cung cấp phông chữ đúng:

```css
label {
  font:
    0.8em "typewriter",
    sans-serif;
}
```

Các trường văn bản yêu cầu một số quy tắc phổ biến. Nói cách khác, chúng ta loại bỏ {{cssxref("border","đường viền")}} và {{cssxref("background","nền")}} của chúng, và xác định lại {{cssxref("padding")}} và {{cssxref("margin")}} của chúng:

```css
input,
textarea {
  font:
    1.4em/1.5em "handwriting",
    cursive,
    sans-serif;
  border: none;
  padding: 0 10px;
  margin: 0;
  width: 80%;
  background: none;
}
```

Khi một trong các trường này nhận được focus, chúng ta làm nổi bật chúng bằng nền xám nhạt, trong suốt (luôn quan trọng là có kiểu focus, cho khả năng sử dụng và khả năng tiếp cận bàn phím):

```css
input:focus,
textarea:focus {
  background: rgb(0 0 0 / 10%);
  border-radius: 5px;
}
```

Bây giờ các trường văn bản của chúng ta đã hoàn thành, chúng ta cần điều chỉnh hiển thị của trường văn bản một dòng và nhiều dòng để khớp, vì chúng thường không trông giống nhau khi sử dụng giá trị mặc định.

#### Tinh chỉnh vùng văn bản

Các phần tử {{HTMLElement("textarea")}} theo mặc định được hiển thị dưới dạng phần tử inline-block. Hai điều quan trọng ở đây là các thuộc tính {{cssxref("resize")}} và {{cssxref("overflow")}}. Mặc dù thiết kế của chúng ta là thiết kế kích thước cố định và chúng ta có thể sử dụng thuộc tính `resize` để ngăn người dùng thay đổi kích thước trường văn bản nhiều dòng, nhưng tốt hơn là không ngăn người dùng thay đổi kích thước textarea nếu họ muốn. Thuộc tính {{cssxref("overflow")}} được sử dụng để làm cho trường hiển thị nhất quán hơn trên các trình duyệt. Một số trình duyệt mặc định là giá trị `auto`, trong khi một số mặc định là giá trị `scroll`. Trong trường hợp của chúng ta, tốt hơn là đảm bảo mọi người sẽ dùng `auto`:

```css
textarea {
  display: block;

  padding: 10px;
  margin: 10px 0 0 -10px;
  width: 100%;
  height: 90%;

  border-right: 1px solid;

  /* resize  : none; */
  overflow: auto;
}
```

#### Tạo kiểu nút gửi

Phần tử {{HTMLElement("button")}} thực sự rất tiện lợi để tạo kiểu bằng CSS; bạn có thể làm bất cứ điều gì bạn muốn, thậm chí sử dụng [phần tử giả](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements):

```css
button {
  padding: 5px;
  font: bold 0.6em sans-serif;
  border: 2px solid #333333;
  border-radius: 5px;
  background: none;
  cursor: pointer;
  transform: rotate(-1.5deg);
}

button::after {
  content: " >>>";
}

button:hover,
button:focus {
  background: black;
  color: white;
}
```

### Kết quả cuối cùng

Và voilà! Biểu mẫu của bạn bây giờ trông như thế này:

![The final look and layout of the form after applying all styling and tweaking to it as described above](updated-form-screenshot.jpg)

> [!NOTE]
> Nếu ví dụ của bạn không hoạt động đúng như mong đợi và bạn muốn so sánh với phiên bản của chúng ta, bạn có thể tìm thấy nó trên GitHub — xem [chạy trực tiếp](https://mdn.github.io/learning-area/html/forms/postcard-example/) (cũng xem [mã nguồn](https://github.com/mdn/learning-area/tree/main/html/forms/postcard-example)).

## Tóm tắt

Như bạn có thể thấy, miễn là chúng ta muốn xây dựng biểu mẫu chỉ với trường văn bản và nút, thì dễ dàng tạo kiểu chúng bằng CSS. [Trong bài viết tiếp theo](/en-US/docs/Learn_web_development/Extensions/Forms/Advanced_form_styling), chúng ta sẽ xem cách xử lý các widget biểu mẫu thuộc danh mục "xấu" và "tệ".

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Other_form_controls","Learn_web_development/Extensions/Forms/Advanced_form_styling","Learn_web_development/Extensions/Forms")}}
