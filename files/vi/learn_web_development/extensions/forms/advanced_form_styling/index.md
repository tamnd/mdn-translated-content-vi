---
title: Advanced form styling
slug: Learn_web_development/Extensions/Forms/Advanced_form_styling
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Styling_web_forms", "Learn_web_development/Extensions/Forms/Customizable_select", "Learn_web_development/Extensions/Forms")}}

Trong bài viết này, chúng ta sẽ xem những gì có thể làm với CSS để tạo kiểu cho các loại điều khiển biểu mẫu khó tạo kiểu hơn — danh mục "xấu" và "tệ". Như chúng ta đã thấy [trong bài viết trước](/en-US/docs/Learn_web_development/Extensions/Forms/Styling_web_forms), các trường văn bản và nút rất dễ tạo kiểu; bây giờ chúng ta sẽ đào sâu vào việc tạo kiểu cho các phần khó khăn hơn.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Hiểu biết cơ bản về
        <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và
        <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Mục tiêu:</th>
      <td>
        Hiểu những phần nào của biểu mẫu khó tạo kiểu và tại sao; học những gì có thể làm để tùy chỉnh chúng.
      </td>
    </tr>
  </tbody>
</table>

Để tóm tắt những gì chúng ta đã nói trong bài viết trước, chúng ta có:

**Xấu**: Một số phần tử khó tạo kiểu hơn, đòi hỏi CSS phức tạp hơn hoặc một số thủ thuật cụ thể hơn:

- Hộp kiểm và nút chọn
- [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search)

**Tệ**: Một số phần tử không thể được tạo kiểu một cách triệt để bằng CSS. Chúng bao gồm:

- Các phần tử liên quan đến tạo widget thả xuống, bao gồm {{HTMLElement("select")}}, {{HTMLElement("option")}}, {{HTMLElement("optgroup")}} và {{HTMLElement("datalist")}}.
  > [!NOTE]
  > Một số trình duyệt hiện hỗ trợ [Phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), một bộ tính năng HTML và CSS cùng nhau cho phép tùy chỉnh hoàn toàn các phần tử `<select>` và nội dung của chúng giống như bất kỳ phần tử DOM thông thường nào.
- [`<input type="color">`](/en-US/docs/Web/HTML/Reference/Elements/input/color)
- Các điều khiển liên quan đến ngày như [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local)
- [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range)
- [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file)
- {{HTMLElement("progress")}} và {{HTMLElement("meter")}}

Hãy đầu tiên nói về thuộc tính {{cssxref("appearance")}}, rất hữu ích để làm tất cả những thứ trên có thể tạo kiểu hơn.

## `appearance`: kiểm soát kiểu dáng cấp hệ điều hành

Trong bài viết trước, chúng ta đề cập rằng về mặt lịch sử, việc tạo kiểu cho các điều khiển biểu mẫu web phần lớn được lấy từ hệ điều hành cơ bản, đó là một phần lý do khó khăn trong việc tùy chỉnh giao diện của các điều khiển này.

Thuộc tính {{cssxref("appearance")}} được tạo ra như một cách để kiểm soát kiểu dáng cấp hệ điều hành hoặc hệ thống nào được áp dụng cho các điều khiển biểu mẫu web. Giá trị hữu ích nhất, và có lẽ là giá trị duy nhất bạn sẽ sử dụng, là `none`. Điều này ngăn bất kỳ điều khiển nào bạn áp dụng nó khỏi sử dụng kiểu dáng cấp hệ thống, tối đa có thể, và cho phép bạn tự tạo kiểu bằng CSS.

Ví dụ, hãy lấy các điều khiển sau:

```html
<form>
  <p>
    <label for="search">search: </label>
    <input id="search" name="search" type="search" />
  </p>
  <p>
    <label for="text">text: </label>
    <input id="text" name="text" type="text" />
  </p>
  <p>
    <label for="date">date: </label>
    <input id="date" name="date" type="datetime-local" />
  </p>
  <p>
    <label for="radio">radio: </label>
    <input id="radio" name="radio" type="radio" />
  </p>
  <p>
    <label for="checkbox">checkbox: </label>
    <input id="checkbox" name="checkbox" type="checkbox" />
  </p>
  <p><input type="submit" value="submit" /></p>
  <p><input type="button" value="button" /></p>
</form>
```

Áp dụng CSS sau cho chúng sẽ loại bỏ kiểu dáng cấp hệ thống.

```css
input {
  appearance: none;
}
```

Ví dụ trực tiếp sau cho bạn thấy chúng trông như thế nào trong hệ thống của bạn — mặc định bên trái, và với CSS trên được áp dụng bên phải.

```html hidden live-sample___appearance-tester
<div>
  <form>
    <div>
      <label for="search1">search: </label>
      <input id="search1" name="search1" type="search" />
    </div>
    <div>
      <label for="text1">text: </label>
      <input id="text1" name="text1" type="text" />
    </div>
    <div>
      <label for="date1">date: </label>
      <input id="date1" name="date1" type="datetime-local" />
    </div>
    <div>
      <label for="radio1">radio: </label>
      <input id="radio1" name="radio1" type="radio" />
    </div>
    <div>
      <label for="checkbox1">checkbox: </label>
      <input id="checkbox1" name="checkbox1" type="checkbox" />
    </div>
    <div><input type="submit" value="submit" /></div>
    <div><input type="button" value="button" /></div>
  </form>
</div>
<div class="appearance">
  <form>
    <div>
      <label for="search2">search: </label>
      <input id="search2" name="search2" type="search" />
    </div>
    <div>
      <label for="text2">text: </label>
      <input id="text2" name="text2" type="text" />
    </div>
    <div>
      <label for="date2">date: </label>
      <input id="date2" name="date2" type="datetime-local" />
    </div>
    <div>
      <label for="radio2">radio: </label>
      <input id="radio2" name="radio2" type="radio" />
    </div>
    <div>
      <label for="checkbox2">checkbox: </label>
      <input id="checkbox2" name="checkbox2" type="checkbox" />
    </div>
    <div><input type="submit" value="submit" /></div>
    <div><input type="button" value="button" /></div>
  </form>
</div>
```

```css hidden live-sample___appearance-tester
body {
  margin: 20px auto;
  max-width: 800px;
  justify-content: space-around;
}

body,
form > div {
  display: flex;
}

form > div {
  margin-bottom: 20px;
}

.appearance input {
  appearance: none;
}
```

{{EmbedLiveSample("appearance-tester", '100%', 350)}}

Trong hầu hết các trường hợp, hiệu ứng là loại bỏ đường viền được tạo kiểu, làm cho tạo kiểu CSS dễ hơn một chút, nhưng không cần thiết. Trong một số trường hợp, như nút chọn và hộp kiểm, nó trở nên hữu ích hơn nhiều. Chúng ta sẽ xem xét những thứ đó ngay bây giờ.

### Hộp tìm kiếm và `appearance`

Giá trị `appearance: none;` trước đây đặc biệt hữu ích để tạo kiểu nhất quán cho các phần tử [`<input type="search">`](/en-US/docs/Web/HTML/Reference/Elements/input/search). Nếu không có nó, Safari không cho phép đặt giá trị {{cssxref("height")}} hoặc {{cssxref("font-size")}} trên chúng. Tuy nhiên, điều này không còn là trường hợp trong Safari 16 trở lên. Bạn vẫn có thể muốn nhắm mục tiêu `input[type="search"]` một cách rõ ràng với `appearance: none;` nếu ma trận hỗ trợ trình duyệt của bạn bao gồm các phiên bản Safari cũ hơn 16.

Trong các trường nhập tìm kiếm, nút xóa "x", xuất hiện khi giá trị không null, biến mất khi trường nhập mất focus trong Edge và Chrome, nhưng vẫn ở trong Safari. Để xóa qua CSS, bạn có thể sử dụng quy tắc sau:

```css
input[type="search"]:not(:focus, :active)::-webkit-search-cancel-button {
  display: none;
}
```

### Tạo kiểu hộp kiểm và nút chọn bằng `appearance`

Tạo kiểu hộp kiểm hoặc nút chọn mặc định là khó. Kích thước của các kiểu mặc định hộp kiểm và nút chọn không được thiết kế để thay đổi, và các trình duyệt phản ứng rất khác nhau khi bạn cố gắng. Một số tăng kích thước điều khiển và một số giữ nguyên kích thước điều khiển và thêm thêm khoảng không gian xung quanh nó.

Một cách tiếp cận tốt hơn nhiều là loại bỏ hoàn toàn giao diện mặc định của hộp kiểm và nút chọn với {{cssxref("appearance", "appearance: none;")}}, và sau đó tự thêm kiểu dáng cho các trạng thái khác nhau của chúng.

Hãy lấy HTML ví dụ này:

```html live-sample___checkboxes-styled
<form>
  <fieldset>
    <legend>Fruit preferences</legend>

    <p>
      <label>
        <input type="checkbox" name="fruit" value="cherry" />
        I like cherry
      </label>
    </p>
    <p>
      <label>
        <input type="checkbox" name="fruit" value="banana" disabled />
        I can't like banana
      </label>
    </p>
    <p>
      <label>
        <input type="checkbox" name="fruit" value="strawberry" />
        I like strawberry
      </label>
    </p>
  </fieldset>
</form>
```

Hãy tạo kiểu chúng với thiết kế hộp kiểm tùy chỉnh. Chúng ta sẽ bắt đầu bằng cách loại bỏ các kiểu hộp kiểm gốc:

```css live-sample___checkboxes-styled
input[type="checkbox"] {
  appearance: none;
}
```

Sau đó chúng ta có thể sử dụng các lớp giả {{cssxref(":checked")}} và {{cssxref(":disabled")}} để thay đổi giao diện của hộp kiểm tùy chỉnh khi trạng thái của chúng thay đổi:

```css live-sample___checkboxes-styled
input[type="checkbox"] {
  position: relative;
  width: 1em;
  height: 1em;
  border: 1px solid gray;
  /* Adjusts the position of the checkboxes on the text baseline */
  vertical-align: -2px;
  /* Set here so that Windows' High-Contrast Mode can override */
  color: green;
}

input[type="checkbox"]::before {
  content: "✔";
  position: absolute;
  font-size: 1.2em;
  right: -1px;
  top: -0.3em;
  visibility: hidden;
}

input[type="checkbox"]:checked::before {
  /* Use `visibility` instead of `display` to avoid recalculating layout */
  visibility: visible;
}

input[type="checkbox"]:disabled {
  border-color: black;
  background: #dddddd;
  color: gray;
}
```

Bạn sẽ tìm hiểu thêm về các lớp giả như vậy và nhiều hơn nữa trong [bài viết tiếp theo](/en-US/docs/Learn_web_development/Extensions/Forms/UI_pseudo-classes); các lớp giả trên làm như sau:

- `:checked` — hộp kiểm (hoặc nút chọn) ở trạng thái được chọn — người dùng đã nhấp/kích hoạt nó.
- `:disabled` — hộp kiểm (hoặc nút chọn) ở trạng thái bị vô hiệu hóa — không thể tương tác với nó.

Bạn có thể xem kết quả trực tiếp:

{{EmbedLiveSample("checkboxes-styled", '100%', 200)}}

Chúng ta cũng đã tạo thêm một số ví dụ khác để cung cấp cho bạn nhiều ý tưởng hơn:

- [Nút chọn được tạo kiểu](https://mdn.github.io/learning-area/html/forms/styling-examples/radios-styled.html): Tạo kiểu nút chọn tùy chỉnh.
- [Ví dụ công tắc chuyển đổi](https://mdn.github.io/learning-area/html/forms/toggle-switch-example/): Một hộp kiểm được tạo kiểu để trông giống công tắc chuyển đổi.

## Những gì có thể làm với các phần tử "tệ"?

Bây giờ hãy chú ý đến các điều khiển "tệ" — những cái thực sự khó tạo kiểu một cách triệt để. Nói tóm lại, đây là các hộp thả xuống, các loại điều khiển phức tạp như [`color`](/en-US/docs/Web/HTML/Reference/Elements/input/color) và [`datetime-local`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), và các điều khiển định hướng phản hồi như {{HTMLElement("progress")}} và {{HTMLElement("meter")}}.

Vấn đề là các phần tử này có giao diện mặc định rất khác nhau trên các trình duyệt, và trong khi bạn có thể tạo kiểu cho chúng theo một số cách, một số phần nội bộ của chúng không thể tạo kiểu.

Nếu bạn sẵn lòng chấp nhận một số sự khác biệt về giao diện, bạn có thể sử dụng một số kiểu dáng đơn giản để cải thiện mọi thứ đáng kể. Điều này bao gồm kích thước nhất quán và tạo kiểu các thuộc tính như `background-color`, và sử dụng `appearance` để loại bỏ một số kiểu dáng cấp hệ thống.

Lấy ví dụ sau, hiển thị một số tính năng biểu mẫu "tệ" đang hoạt động:

```html hidden live-sample___ugly-styling
<form>
  <div>
    <label for="select">Select box:</label>
    <div class="select-wrapper">
      <select id="select" name="select">
        <option>Banana</option>
        <option>Cherry</option>
        <option>Lemon</option>
      </select>
    </div>
  </div>
  <div>
    <label for="myFruit">"Favorite fruit?" datalist:</label>
    <input type="text" name="myFruit" id="myFruit" list="mySuggestion" />
    <datalist id="mySuggestion">
      <option>Apple</option>
      <option>Banana</option>
      <option>Blackberry</option>
      <option>Blueberry</option>
      <option>Lemon</option>
      <option>Lychee</option>
      <option>Peach</option>
      <option>Pear</option>
    </datalist>
  </div>
  <div>
    <label for="date1">Datetime local: </label>
    <input id="date1" name="date1" type="datetime-local" />
  </div>
  <div>
    <label for="range">Range: </label>
    <input id="range" name="range" type="range" />
  </div>
  <div>
    <label for="color">Color: </label>
    <input id="color" name="color" type="color" />
  </div>
  <div>
    <label for="file">File picker: </label>
    <input id="file" name="file" type="file" multiple />
    <ul id="file-list"></ul>
  </div>
  <div>
    <label for="progress">Progress: </label>
    <progress max="100" value="75" id="progress">75/100</progress>
  </div>
  <div>
    <label for="meter">Meter: </label>
    <meter
      id="meter"
      min="0"
      max="100"
      value="75"
      low="33"
      high="66"
      optimum="50">
      75
    </meter>
  </div>
  <div><button>Submit?</button></div>
</form>
```

{{EmbedLiveSample("ugly-styling", '100%', 750)}}

Bạn cũng có thể nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn.

Ví dụ này có CSS sau được áp dụng cho nó:

```css live-sample___ugly-styling
body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 400px;
}

form > div {
  margin-bottom: 20px;
}

select {
  appearance: none;
  width: 100%;
  height: 100%;
}

.select-wrapper {
  position: relative;
}

.select-wrapper::after {
  content: "▼";
  font-size: 1rem;
  top: 3px;
  right: 10px;
  position: absolute;
}

button,
label,
input,
select,
progress,
meter {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input[type="text"],
input[type="datetime-local"],
input[type="color"],
select {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}

label {
  margin-bottom: 5px;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

Chúng ta đã thêm một số JavaScript vào trang liệt kê các tệp được chọn bởi bộ chọn tệp, bên dưới điều khiển chính. Đây là phiên bản đơn giản hóa của ví dụ trên trang tham chiếu [`<input type="file">`](/en-US/docs/Web/HTML/Reference/Elements/input/file#examples):

```js live-sample___ugly-styling
const fileInput = document.querySelector("#file");
const fileList = document.querySelector("#file-list");

fileInput.addEventListener("change", updateFileList);

function updateFileList() {
  while (fileList.firstChild) {
    fileList.removeChild(fileList.firstChild);
  }

  const curFiles = fileInput.files;

  if (!(curFiles.length === 0)) {
    for (const file of curFiles) {
      const listItem = document.createElement("li");
      listItem.textContent = `File name: ${file.name}; file size: ${returnFileSize(file.size)}.`;
      fileList.appendChild(listItem);
    }
  }
}

function returnFileSize(number) {
  if (number < 1e3) {
    return `${number} bytes`;
  } else if (number >= 1e3 && number < 1e6) {
    return `${(number / 1e3).toFixed(1)} KB`;
  }
  return `${(number / 1e6).toFixed(1)} MB`;
}
```

### Các kiểu "Toàn cục"

Trong ví dụ trước, chúng ta đã làm khá tốt trong việc làm cho các điều khiển xấu xí trông đồng nhất trên các trình duyệt hiện đại.

Chúng ta đã áp dụng một số CSS chuẩn hóa toàn cục cho tất cả các điều khiển và nhãn của chúng, để chúng có kích thước theo cùng một cách, kế thừa phông chữ cha, v.v., như đã đề cập trong bài viết trước:

```css
button,
label,
input,
select,
progress,
meter {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}
```

Chúng ta cũng đã thêm một số bóng đồng nhất và các góc tròn cho các điều khiển nơi có ý nghĩa:

```css
input[type="text"],
input[type="datetime-local"],
input[type="color"],
select {
  box-shadow: inset 1px 1px 3px #cccccc;
  border-radius: 5px;
}
```

Trên các điều khiển khác như thanh phạm vi, thanh tiến trình và đồng hồ đo, chúng chỉ thêm một hộp xấu xí xung quanh vùng điều khiển, vì vậy không có ý nghĩa gì.

Hãy nói về một số chi tiết cụ thể của từng loại điều khiển này, nêu bật những khó khăn trên đường đi.

### Select và datalist

Một số trình duyệt hiện hỗ trợ [Phần tử select tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select), một bộ tính năng HTML và CSS cùng nhau cho phép tùy chỉnh hoàn toàn các phần tử `<select>` và nội dung của chúng giống như bất kỳ phần tử DOM thông thường nào. Trong các trình duyệt hỗ trợ và codebase, bạn không còn cần lo lắng về các kỹ thuật kế thừa được mô tả bên dưới cho các phần tử `<select>`.

Tạo kiểu datalist và select (trong các trình duyệt không hỗ trợ select tùy chỉnh) cho phép mức độ tùy chỉnh chấp nhận được, miễn là bạn không muốn thay đổi giao diện và cảm giác quá nhiều so với mặc định. Chúng ta đã quản lý để làm cho các hộp trông khá đồng nhất và nhất quán. Điều khiển gọi datalist là `<input type="text">` dù sao, vì vậy chúng ta biết điều này sẽ không thành vấn đề.

Hai điều hơi có vấn đề hơn. Đầu tiên, biểu tượng "mũi tên" của select cho biết nó là một danh sách thả xuống khác nhau giữa các trình duyệt. Nó cũng có xu hướng thay đổi nếu bạn tăng kích thước hộp select hoặc thay đổi kích thước của nó theo cách xấu xí. Để khắc phục điều này trong ví dụ, chúng ta đã sử dụng `appearance: none` quen thuộc để loại bỏ biểu tượng hoàn toàn:

```css
select {
  appearance: none;
}
```

Sau đó chúng ta đã tạo biểu tượng của riêng mình bằng cách sử dụng nội dung được tạo ra. Chúng ta đặt một wrapper thêm xung quanh điều khiển, vì {{cssxref("::before")}}/{{cssxref("::after")}} không hoạt động trên các phần tử `<select>` (nội dung của chúng được kiểm soát hoàn toàn bởi trình duyệt):

```html
<label for="select">Select a fruit</label>
<div class="select-wrapper">
  <select id="select" name="select">
    <option>Banana</option>
    <option>Cherry</option>
    <option>Lemon</option>
  </select>
</div>
```

Sau đó chúng ta sử dụng nội dung được tạo ra để tạo một mũi tên xuống nhỏ và đặt nó vào đúng vị trí bằng định vị:

```css
.select-wrapper {
  position: relative;
}

.select-wrapper::after {
  content: "▼";
  font-size: 1rem;
  top: 6px;
  right: 10px;
  position: absolute;
}
```

Vấn đề thứ hai, quan trọng hơn một chút là bạn không có quyền kiểm soát hộp xuất hiện chứa các tùy chọn khi bạn nhấp vào hộp `<select>` để mở nó. Bạn có thể kế thừa phông chữ được đặt trên cha, nhưng bạn sẽ không thể đặt những thứ như khoảng cách và màu sắc. Điều tương tự cũng đúng với danh sách tự động hoàn thành xuất hiện với {{HTMLElement("datalist")}}.

Nếu bạn thực sự cần kiểm soát hoàn toàn việc tạo kiểu tùy chọn, bạn sẽ phải sử dụng thư viện để tạo điều khiển tùy chỉnh hoặc tự xây dựng. Trong trường hợp `<select>`, bạn cũng có thể sử dụng thuộc tính `multiple`, làm cho tất cả các tùy chọn xuất hiện trên trang, tránh được vấn đề cụ thể này:

```html
<label for="select">Select fruits</label>
<select id="select" name="select" multiple>
  …
</select>
```

Tất nhiên, điều này cũng có thể không phù hợp với thiết kế bạn đang theo đuổi, nhưng đáng lưu ý!

### Các loại trường nhập liệu ngày

Các loại trường nhập liệu ngày/giờ ([`datetime-local`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), [`time`](/en-US/docs/Web/HTML/Reference/Elements/input/time), [`week`](/en-US/docs/Web/HTML/Reference/Elements/input/week), [`month`](/en-US/docs/Web/HTML/Reference/Elements/input/month)) đều có cùng vấn đề chính liên quan. Hộp chứa thực sự dễ tạo kiểu như bất kỳ trường nhập văn bản nào, và những gì chúng ta có trong bản demo này trông ổn.

Tuy nhiên, các phần nội bộ của điều khiển (ví dụ: lịch popup bạn dùng để chọn ngày, con quay số bạn có thể dùng để tăng/giảm giá trị) hoàn toàn không thể tạo kiểu và bạn không thể loại bỏ chúng bằng `appearance: none;`. Nếu bạn thực sự cần kiểm soát hoàn toàn việc tạo kiểu, bạn sẽ phải sử dụng thư viện để tạo điều khiển tùy chỉnh hoặc tự xây dựng.

> [!NOTE]
> Đáng đề cập [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number) ở đây — đây cũng có con quay số mà bạn có thể dùng để tăng/giảm giá trị, vì vậy có khả năng gặp vấn đề tương tự. Tuy nhiên, trong trường hợp loại `number`, dữ liệu được thu thập đơn giản hơn và dễ dàng chỉ sử dụng loại trường nhập liệu `tel` thay thế, có giao diện của `text`, nhưng hiển thị bàn phím số trên các thiết bị có bàn phím cảm ứng.

### Các loại trường nhập liệu phạm vi

[`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) phiền toái để tạo kiểu. Bạn có thể sử dụng như sau để loại bỏ hoàn toàn đường ray thanh trượt mặc định và thay thế bằng kiểu tùy chỉnh (một đường ray màu đỏ mỏng, trong trường hợp này):

```css
input[type="range"] {
  appearance: none;
  background: red;
  height: 2px;
  padding: 0;
  outline: 1px solid transparent;
}
```

Tuy nhiên, rất khó để tùy chỉnh kiểu dáng của tay cầm kéo điều khiển phạm vi — để có toàn quyền kiểm soát tạo kiểu phạm vi, bạn sẽ cần sử dụng một số mã CSS phức tạp, bao gồm nhiều phần tử giả không chuẩn, dành riêng cho trình duyệt. Hãy xem [Tạo kiểu trường nhập phạm vi tương thích đa trình duyệt bằng CSS](https://css-tricks.com/styling-cross-browser-compatible-range-inputs-css/) trên CSS tricks để biết tài liệu chi tiết về những gì cần thiết.

### Các loại trường nhập liệu màu

Các điều khiển trường nhập liệu kiểu màu không quá tệ. Trong các trình duyệt hỗ trợ, chúng thường cung cấp cho bạn một khối màu đơn sắc với một đường viền nhỏ.

Bạn có thể loại bỏ đường viền, chỉ để lại khối màu, bằng cách sử dụng như sau:

```css
input[type="color"] {
  border: 0;
  padding: 0;
}
```

Tuy nhiên, một giải pháp tùy chỉnh là cách duy nhất để có được điều gì đó khác biệt đáng kể.

### Các loại trường nhập liệu tệp

Các trường nhập liệu kiểu tệp nhìn chung ổn — như bạn thấy trong ví dụ của chúng ta, khá dễ dàng tạo ra điều gì đó phù hợp với phần còn lại của trang — dòng đầu ra là một phần của điều khiển sẽ kế thừa phông chữ cha nếu bạn yêu cầu trường nhập liệu làm như vậy, và bạn có thể tạo kiểu danh sách tên và kích thước tệp tùy chỉnh theo bất kỳ cách nào bạn muốn; chúng ta đã tạo ra nó sau tất cả.

Vấn đề duy nhất với bộ chọn tệp là nút bạn nhấn để mở bộ chọn tệp hoàn toàn không thể tạo kiểu — nó không thể được định cỡ hoặc tô màu, và nó thậm chí sẽ không chấp nhận phông chữ khác.

Một cách để giải quyết điều này là tận dụng thực tế rằng nếu bạn có nhãn liên kết với điều khiển biểu mẫu, nhấp vào nhãn sẽ kích hoạt điều khiển. Vì vậy, bạn có thể ẩn trường nhập liệu thực tế bằng cách như sau:

```css
input[type="file"] {
  height: 0;
  padding: 0;
  opacity: 0;
}
```

Và sau đó tạo kiểu nhãn để hoạt động như một nút, khi được nhấn sẽ mở bộ chọn tệp như mong đợi:

```css
label[for="file"] {
  box-shadow: 1px 1px 3px #cccccc;
  background: linear-gradient(to bottom, #eeeeee, #cccccc);
  border: 1px solid darkgrey;
  border-radius: 5px;
  text-align: center;
  line-height: 1.5;
}

label[for="file"]:hover {
  background: linear-gradient(to bottom, white, #dddddd);
}

label[for="file"]:active {
  box-shadow: inset 1px 1px 3px #cccccc;
}
```

Bạn có thể xem kết quả của kiểu CSS trên trong ví dụ trực tiếp bên dưới.

```html hidden live-sample___styled-file-picker
<form>
  <div>
    <label for="file">Choose a file to upload</label>
    <input id="file" name="file" type="file" multiple />
    <ul id="file-list"></ul>
  </div>
  <div><button>Submit?</button></div>
</form>
```

```css hidden live-sample___styled-file-picker
@import "https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&display=swap";

body {
  font-family: "Josefin Sans", sans-serif;
  margin: 20px auto;
  max-width: 400px;
}

form > div {
  margin-bottom: 20px;
}

button,
label,
input {
  display: block;
  font-family: inherit;
  font-size: 100%;
  margin: 0;
  box-sizing: border-box;
  width: 100%;
  padding: 5px;
  height: 30px;
}

input[type="file"] {
  height: 0;
  padding: 0;
  opacity: 0;
}

label[for="file"] {
  box-shadow: 1px 1px 3px #cccccc;
  background: linear-gradient(to bottom, #eeeeee, #cccccc);
  border: 1px solid darkgrey;
  border-radius: 5px;
  text-align: center;
  line-height: 1.5;
}

label[for="file"]:hover {
  background: linear-gradient(to bottom, white, #dddddd);
}

label[for="file"]:active {
  box-shadow: inset 1px 1px 3px #cccccc;
}

button {
  width: 60%;
  margin: 0 auto;
}
```

```js hidden live-sample___styled-file-picker
const fileInput = document.querySelector("#file");
const fileList = document.querySelector("#file-list");

fileInput.addEventListener("change", updateFileList);

function updateFileList() {
  while (fileList.firstChild) {
    fileList.removeChild(fileList.firstChild);
  }

  let curFiles = fileInput.files;

  if (!(curFiles.length === 0)) {
    for (const file of curFiles) {
      const listItem = document.createElement("li");
      listItem.textContent = `File name: ${file.name}; file size: ${returnFileSize(file.size)}.`;
      fileList.appendChild(listItem);
    }
  }
}

function returnFileSize(number) {
  if (number < 1e3) {
    return `${number} bytes`;
  } else if (number >= 1e3 && number < 1e6) {
    return `${(number / 1e3).toFixed(1)} KB`;
  }
  return `${(number / 1e6).toFixed(1)} MB`;
}
```

{{EmbedLiveSample("styled-file-picker", '100%', 200)}}

Bạn cũng có thể nhấn nút **Play** để chạy ví dụ trong MDN Playground và chỉnh sửa mã nguồn.

### Đồng hồ đo và thanh tiến trình

[`<meter>`](/en-US/docs/Web/HTML/Reference/Elements/meter) và [`<progress>`](/en-US/docs/Web/HTML/Reference/Elements/progress) có thể là tệ nhất. Như bạn thấy trong ví dụ trước, chúng ta có thể đặt chúng thành chiều rộng mong muốn tương đối chính xác. Nhưng ngoài điều đó, chúng thực sự khó tạo kiểu theo bất kỳ cách nào. Chúng không xử lý các cài đặt chiều cao một cách nhất quán với nhau và giữa các trình duyệt, bạn có thể tô màu nền nhưng không tô thanh trước mặt, và việc đặt `appearance: none` trên chúng làm mọi thứ tệ hơn, không tốt hơn.

Dễ hơn là tạo giải pháp tùy chỉnh cho các tính năng này nếu bạn muốn kiểm soát tạo kiểu, hoặc sử dụng giải pháp bên thứ ba như [progressbar.js](https://kimmobrunfeldt.github.io/progressbar.js/#examples).

## Tóm tắt

Mặc dù vẫn còn khó khăn khi sử dụng CSS với biểu mẫu HTML, có nhiều cách để giải quyết nhiều vấn đề. Không có giải pháp sạch sẽ và toàn cầu, nhưng các trình duyệt hiện đại cung cấp các khả năng mới. Hiện tại, giải pháp tốt nhất là tìm hiểu thêm về cách các trình duyệt khác nhau hỗ trợ CSS khi áp dụng cho các điều khiển biểu mẫu HTML.

Trong bài viết tiếp theo của mô-đun này, chúng ta sẽ khám phá việc tạo [các phần tử `<select>` hoàn toàn tùy chỉnh](/en-US/docs/Learn_web_development/Extensions/Forms/Customizable_select) bằng cách sử dụng các tính năng HTML và CSS hiện đại chuyên dụng có sẵn cho mục đích này.

{{PreviousMenuNext("Learn_web_development/Extensions/Forms/Styling_web_forms", "Learn_web_development/Extensions/Forms/Customizable_select", "Learn_web_development/Extensions/Forms")}}
