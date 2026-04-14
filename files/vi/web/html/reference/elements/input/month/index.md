---
title: <input type="month">
slug: Web/HTML/Reference/Elements/input/month
page-type: html-attribute-value
browser-compat: html.elements.input.type_month
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`month`** tạo ra các trường nhập liệu cho phép người dùng nhập tháng và năm.
Giá trị là chuỗi có giá trị theo định dạng `YYYY-MM`, trong đó `YYYY` là năm bốn chữ số và `MM` là số tháng.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;month&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="start">Start month:</label>

<input type="month" id="start" name="start" min="2018-03" value="2018-05" />
```

```css interactive-example
label {
  display: block;
  font:
    1rem "Fira Sans",
    sans-serif;
}

input,
label {
  margin: 0.4rem 0;
}
```

Giao diện của điều khiển nói chung thay đổi tùy theo trình duyệt; hiện tại hỗ trợ không đều, với chỉ Chrome/Opera và Edge trên máy tính — và hầu hết các phiên bản trình duyệt di động hiện đại — có triển khai có thể sử dụng được.
Trong các trình duyệt không hỗ trợ đầu vào `month`, điều khiển xuống cấp duyên dáng thành [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text), mặc dù có thể có xác thực tự động của văn bản đã nhập để đảm bảo nó được định dạng như mong đợi.

Đối với những người sử dụng trình duyệt không hỗ trợ `month`, ảnh chụp màn hình bên dưới cho thấy nó trông như thế nào trong Chrome và Opera.
Nhấp vào mũi tên xuống ở phía bên phải sẽ mở ra bộ chọn ngày cho phép bạn chọn tháng và năm.

![Month control on Chrome browser](month-control-chrome.png)

Điều khiển `month` của Microsoft Edge trông như thế này:

![Month control on Edge browser](month-control-edge.png)

## Giá trị

Chuỗi đại diện cho giá trị của tháng và năm được nhập vào đầu vào, theo dạng YYYY-MM (bốn hoặc nhiều chữ số năm, sau đó gạch ngang (`-`), theo sau là hai chữ số tháng).
Định dạng của chuỗi tháng được sử dụng bởi kiểu đầu vào này được mô tả trong [Chuỗi tháng](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#month_strings).

### Đặt giá trị mặc định

Bạn có thể đặt giá trị mặc định cho điều khiển đầu vào bằng cách bao gồm tháng và năm trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) như sau:

```html
<label for="bday-month">What month were you born in?</label>
<input id="bday-month" type="month" name="bday-month" value="2001-06" />
```

{{EmbedLiveSample('Setting_a_default_value', 600, 60)}}

Một điều cần lưu ý là định dạng ngày hiển thị khác với `value` thực tế; hầu hết {{Glossary("user agent", "user agents")}} hiển thị tháng và năm theo dạng phù hợp với locale, dựa trên locale đã đặt của hệ điều hành người dùng, trong khi `value` ngày luôn được định dạng `yyyy-MM`.

Khi giá trị trên được gửi lên máy chủ, chẳng hạn, nó sẽ trông như `bday-month=1978-06`.

### Đặt giá trị bằng JavaScript

Bạn cũng có thể lấy và đặt giá trị ngày trong JavaScript bằng cách sử dụng thuộc tính {{domxref("HTMLInputElement.value")}}, ví dụ:

```html
<label for="bday-month">What month were you born in?</label>
<input id="bday-month" type="month" name="bday-month" />
```

```js
const monthControl = document.querySelector('input[type="month"]');
monthControl.value = "2001-06";
```

{{EmbedLiveSample("Setting_the_value_using_JavaScript", 600, 60)}}

## Thuộc tính bổ sung

Ngoài các thuộc tính chung cho các phần tử {{HTMLElement("input")}}, đầu vào month cung cấp các thuộc tính sau.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu.
{{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng cho đầu vào này.
Mọi giá trị trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) đều không được đưa vào các tùy chọn gợi ý.
Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách được xác định trước này hoặc cung cấp giá trị khác.

### max

Năm và tháng mới nhất, theo định dạng chuỗi được thảo luận trong phần [Giá trị](#value) ở trên, để chấp nhận.
Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử vượt quá giá trị này, phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).
Nếu giá trị của thuộc tính `max` không phải là chuỗi hợp lệ theo định dạng `yyyy-MM`, thì phần tử không có giá trị tối đa.

Giá trị này phải chỉ định cặp năm-tháng muộn hơn hoặc bằng cặp được chỉ định bởi thuộc tính `min`.

### min

Năm và tháng sớm nhất để chấp nhận, theo cùng định dạng `yyyy-MM` được mô tả ở trên.
Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử nhỏ hơn giá trị này, phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation).
Nếu một giá trị được chỉ định cho `min` không phải là chuỗi năm và tháng hợp lệ, đầu vào không có giá trị tối thiểu.

Giá trị này phải là cặp năm-tháng sớm hơn hoặc bằng cặp được chỉ định bởi thuộc tính `max`.

### readonly

Thuộc tính Boolean mà khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng.
Tuy nhiên `value` của nó vẫn có thể được thay đổi từ mã JavaScript đặt trực tiếp giá trị của thuộc tính {{domxref("HTMLInputElement.value")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các đầu vào có thuộc tính `readonly` cũng được chỉ định.

### step

Thuộc tính `step` là số chỉ định mức độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ các giá trị là bội số nguyên của bước từ step base mới hợp lệ. Step base là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` (Unix epoch, `1970-01`) nếu không có cả hai.

Đối với đầu vào `month`, giá trị của `step` được tính theo tháng. Giá trị mặc định của `step` là 1, biểu thị 1 tháng.

Giá trị chuỗi `any` có nghĩa là không có bước nhảy nào và mọi giá trị đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)). Trong thực tế, nó có tác dụng giống như `1` đối với đầu vào `month` vì giao diện bộ chọn chỉ cho phép chọn tháng nguyên.

> [!NOTE]
> Khi dữ liệu người dùng nhập không tuân theo cấu hình bước nhảy, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Sử dụng đầu vào month

Đầu vào liên quan đến ngày (bao gồm `month`) nghe có vẻ thuận tiện khi xem xét lần đầu; chúng hứa hẹn giao diện người dùng dễ dàng để chọn ngày và chuẩn hóa định dạng dữ liệu gửi lên máy chủ, bất kể locale của người dùng.
Tuy nhiên, có các vấn đề với `<input type="month">` vì tại thời điểm này, nhiều trình duyệt lớn chưa hỗ trợ nó.

Chúng ta sẽ xem xét cách sử dụng cơ bản và phức tạp hơn của `<input type="month">`, sau đó đưa ra lời khuyên về việc giảm thiểu vấn đề hỗ trợ trình duyệt trong phần [Xử lý hỗ trợ trình duyệt](#handling_browser_support)).

### Sử dụng cơ bản month

Cách sử dụng cơ bản nhất của `<input type="month">` liên quan đến sự kết hợp cơ bản giữa {{HTMLElement("input")}} và phần tử {{htmlelement("label")}}, như bên dưới:

```html
<form>
  <label for="bday-month">What month were you born in?</label>
  <input id="bday-month" type="month" name="bday-month" />
</form>
```

{{EmbedLiveSample('Basic_uses_of_month', 600, 40)}}

### Đặt ngày tối đa và tối thiểu

Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế phạm vi ngày người dùng có thể chọn.
Trong ví dụ sau, chúng ta chỉ định tháng tối thiểu là `1900-01` và tháng tối đa là `2013-12`:

```html
<form>
  <label for="bday-month">What month were you born in?</label>
  <input
    id="bday-month"
    type="month"
    name="bday-month"
    min="1900-01"
    max="2013-12" />
</form>
```

{{EmbedLiveSample('Setting_maximum_and_minimum_dates', 600, 40)}}

Kết quả ở đây là:

- Chỉ có thể chọn các tháng từ tháng 1 năm 1900 đến tháng 12 năm 2013; các tháng ngoài phạm vi đó không thể cuộn tới trong điều khiển.
- Tùy thuộc vào trình duyệt bạn đang sử dụng, bạn có thể thấy rằng các tháng ngoài phạm vi được chỉ định có thể không thể chọn trong bộ chọn tháng (ví dụ: Edge), hoặc không hợp lệ (xem [Kiểm tra hợp lệ](#validation)) nhưng vẫn có thể chọn (ví dụ: Chrome).

### Kiểm soát kích thước đầu vào

`<input type="month">` không hỗ trợ các thuộc tính kích thước biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size).
Bạn sẽ phải dùng [CSS](/en-US/docs/Web/CSS) để điều chỉnh kích thước.

## Kiểm tra hợp lệ

Theo mặc định, `<input type="month">` không áp dụng bất kỳ xác thực nào cho các giá trị đã nhập.
Các triển khai giao diện người dùng thường không cho phép nhập bất cứ thứ gì không phải là ngày — điều này hữu ích — nhưng bạn vẫn có thể gửi biểu mẫu với đầu vào `month` trống, hoặc nhập ngày không hợp lệ (ví dụ: ngày 32 tháng 4).

Để giúp tránh điều này, bạn có thể dùng [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế ngày có thể (xem [Đặt ngày tối đa và tối thiểu](#setting_maximum_and_minimum_dates)), và ngoài ra dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để bắt buộc điền ngày.
Kết quả là, các trình duyệt hỗ trợ sẽ hiển thị lỗi nếu bạn cố gửi ngày ngoài phạm vi được đặt, hoặc trường ngày trống.

Hãy xem ví dụ; ở đây chúng ta đã đặt ngày tối thiểu và tối đa, và cũng bắt buộc điền trường:

```html
<form>
  <div>
    <label for="month">
      What month would you like to visit (June to Sept.)?
    </label>
    <input
      id="month"
      type="month"
      name="month"
      min="2022-06"
      max="2022-09"
      required />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" value="Submit form" />
  </div>
</form>
```

Nếu bạn cố gửi biểu mẫu mà không có cả tháng và năm được chỉ định (hoặc với ngày ngoài phạm vi được đặt), trình duyệt sẽ hiển thị lỗi.
Hãy thử thực hành với ví dụ ngay bây giờ:

{{ EmbedLiveSample('Validation', 600, 120) }}

Đây là ảnh chụp màn hình dành cho những ai không sử dụng trình duyệt hỗ trợ:

![Month required prompt on Chrome browser](month-required.png)

Đây là CSS dùng trong ví dụ trên.
Ở đây chúng ta sử dụng các thuộc tính CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} để tạo kiểu cho đầu vào dựa trên giá trị hiện tại có hợp lệ hay không.
Chúng ta phải đặt các biểu tượng trên {{htmlelement("span")}} bên cạnh đầu vào, không phải trên chính đầu vào, vì trong Chrome, nội dung được tạo ra được đặt bên trong điều khiển biểu mẫu và không thể tạo kiểu hoặc hiển thị hiệu quả.

```css
div {
  margin-bottom: 10px;
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

> [!WARNING]
> Kiểm tra hợp lệ biểu mẫu HTML _không phải_ là sự thay thế cho các script đảm bảo dữ liệu nhập có đúng định dạng.
> Quá dễ dàng để ai đó điều chỉnh HTML cho phép bỏ qua xác thực, hoặc xóa hoàn toàn.
> Cũng có thể ai đó bỏ qua HTML của bạn hoàn toàn và gửi dữ liệu trực tiếp đến máy chủ.
> Nếu mã phía máy chủ không xác thực dữ liệu nhận được, thảm họa có thể xảy ra khi dữ liệu không đúng định dạng được gửi (hoặc dữ liệu quá lớn, sai kiểu, v.v.).

## Xử lý hỗ trợ trình duyệt

Như đã đề cập ở trên, vấn đề chính khi sử dụng đầu vào ngày tại thời điểm viết là nhiều trình duyệt lớn chưa triển khai chúng tất cả; chỉ Chrome/Opera và Edge hỗ trợ nó trên máy tính, và hầu hết các trình duyệt hiện đại trên điện thoại.
Ví dụ: bộ chọn `month` trên Chrome cho Android trông như thế này:

![Month picker on Chrome for Android](month-android.png)

Các trình duyệt không hỗ trợ sẽ xuống cấp duyên dáng thành đầu vào văn bản, nhưng điều này tạo ra vấn đề cả về tính nhất quán của giao diện người dùng (điều khiển được trình bày sẽ khác nhau) và xử lý dữ liệu.

Vấn đề thứ hai nghiêm trọng hơn trong hai vấn đề.
Như đã đề cập trước đó, với đầu vào `month` giá trị thực tế luôn được chuẩn hóa theo định dạng `yyyy-mm`.
Mặt khác, theo cấu hình mặc định, đầu vào `text` không biết ngày nên ở định dạng nào và điều này là vấn đề vì có nhiều cách khác nhau mà mọi người viết ngày.
Ví dụ:

- `mmyyyy` (072022)
- `mm/yyyy` (07/2022)
- `mm-yyyy` (07-2022)
- `yyyy-mm` (2022-07)
- `Month yyyy` (July 2022)
- và nhiều hơn nữa…

Một cách để giải quyết điều này là đặt thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) trên đầu vào `month` của bạn.
Mặc dù đầu vào `month` không sử dụng nó, nếu trình duyệt quay lại xử lý nó như đầu vào `text`, mẫu sẽ được sử dụng.
Ví dụ: hãy thử xem demo sau trong trình duyệt không hỗ trợ đầu vào `month`:

```html
<form>
  <div>
    <label for="month">
      What month would you like to visit (June to Sept.)?
    </label>
    <input
      id="month"
      type="month"
      name="month"
      min="2022-06"
      max="2022-09"
      required
      pattern="[0-9]{4}-[0-9]{2}" />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" value="Submit form" />
  </div>
</form>
```

{{ EmbedLiveSample('Handling_browser_support', 600, 100) }}

Nếu bạn cố gửi nó, bạn sẽ thấy rằng trình duyệt hiện hiển thị thông báo lỗi (và đánh dấu đầu vào là không hợp lệ) nếu mục nhập của bạn không khớp với mẫu `nnnn-nn`, trong đó `n` là số từ 0 đến 9.
Tất nhiên, điều này không ngăn mọi người nhập ngày không hợp lệ (chẳng hạn như `0000-42`), hoặc ngày được định dạng không đúng nhưng tuân theo mẫu.

Ngoài ra còn có vấn đề là người dùng không nhất thiết biết định dạng ngày nào trong số nhiều định dạng được mong đợi.
Chúng ta vẫn có công việc cần làm.

```css hidden
div {
  margin-bottom: 10px;
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

Cách tốt nhất để xử lý ngày trong biểu mẫu theo cách đa trình duyệt (cho đến khi tất cả các trình duyệt lớn đã hỗ trợ chúng một thời gian) là yêu cầu người dùng nhập tháng và năm trong các điều khiển riêng biệt (phần tử {{htmlelement("select")}} khá phổ biến; xem bên dưới để biết triển khai), hoặc sử dụng các thư viện JavaScript như plugin [jQuery date picker](https://jqueryui.com/datepicker/).

## Ví dụ

Trong ví dụ này, chúng ta tạo hai bộ phần tử UI, mỗi bộ được thiết kế để cho phép người dùng chọn tháng và năm.
Bộ đầu tiên là đầu vào `month` gốc, và bộ kia là một cặp phần tử {{HTMLElement("select")}} cho phép chọn tháng và năm độc lập, cho khả năng tương thích với các trình duyệt chưa hỗ trợ `<input type="month">`.

{{EmbedLiveSample('Examples', 600, 140)}}

### HTML

Biểu mẫu yêu cầu tháng và năm trông như thế này:

```html
<form>
  <div class="nativeDatePicker">
    <label for="month-visit">What month would you like to visit us?</label>
    <input type="month" id="month-visit" name="month-visit" />
    <span class="validity"></span>
  </div>
  <p class="fallbackLabel">What month would you like to visit us?</p>
  <div class="fallbackDatePicker">
    <div>
      <span>
        <label for="month">Month:</label>
        <select id="month" name="month">
          <option selected>January</option>
          <option>February</option>
          <option>March</option>
          <option>April</option>
          <option>May</option>
          <option>June</option>
          <option>July</option>
          <option>August</option>
          <option>September</option>
          <option>October</option>
          <option>November</option>
          <option>December</option>
        </select>
      </span>
      <span>
        <label for="year">Year:</label>
        <select id="year" name="year"></select>
      </span>
    </div>
  </div>
</form>
```

{{HTMLElement("div")}} với ID `nativeDatePicker` sử dụng kiểu đầu vào `month` để yêu cầu tháng và năm, trong khi `<div>` với ID `fallbackDatePicker` thay vào đó sử dụng cặp phần tử `<select>`.
Phần tử đầu tiên yêu cầu tháng, và phần tử thứ hai yêu cầu năm.

`<select>` để chọn tháng được mã hóa cứng với tên các tháng, vì chúng không thay đổi (bỏ qua việc địa phương hóa).
Danh sách các giá trị năm có sẵn được tạo động tùy thuộc vào năm hiện tại (xem nhận xét mã bên dưới để biết giải thích chi tiết về cách các hàm này hoạt động).

```css hidden
div {
  margin-bottom: 10px;
  position: relative;
}

input[type="number"] {
  width: 100px;
}

input + span {
  padding-right: 30px;
}

input:invalid + span::after {
  position: absolute;
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
}
```

### JavaScript

Mã JavaScript xử lý việc chọn phương thức nào sẽ sử dụng và thiết lập danh sách các năm để đưa vào `<select>` năm không gốc như sau.

Phần của ví dụ có thể thú vị nhất là mã phát hiện tính năng.
Để phát hiện xem trình duyệt có hỗ trợ `<input type="month">` không, chúng ta tạo phần tử {{htmlelement("input")}} mới, thử đặt `type` của nó thành `month`, sau đó kiểm tra ngay loại của nó.
Các trình duyệt không hỗ trợ kiểu `month` sẽ trả về `text`, vì đó là điều month quay lại khi không được hỗ trợ.
Nếu `<input type="month">` không được hỗ trợ, chúng ta ẩn bộ chọn gốc và hiển thị giao diện bộ chọn dự phòng thay thế.

```js
// Get UI elements
const nativePicker = document.querySelector(".nativeDatePicker");
const fallbackPicker = document.querySelector(".fallbackDatePicker");
const fallbackLabel = document.querySelector(".fallbackLabel");

const yearSelect = document.querySelector("#year");
const monthSelect = document.querySelector("#month");

// Hide fallback initially
fallbackPicker.style.display = "none";
fallbackLabel.style.display = "none";

// Test whether a new date input falls back to a text input or not
const test = document.createElement("input");

try {
  test.type = "month";
} catch (e) {
  console.log(e.description);
}

// If it does, run the code inside the if () {} block
if (test.type === "text") {
  // Hide the native picker and show the fallback
  nativePicker.style.display = "none";
  fallbackPicker.style.display = "block";
  fallbackLabel.style.display = "block";

  // Populate the years dynamically
  // (the months are always the same, therefore hardcoded)
  populateYears();
}

function populateYears() {
  // Get the current year as a number
  const date = new Date();
  const year = date.getFullYear();

  // Make this year, and the 100 years before it available in the year <select>
  for (let i = 0; i <= 100; i++) {
    const option = document.createElement("option");
    option.textContent = year - i;
    yearSelect.appendChild(option);
  }
}
```

> [!NOTE]
> Nhớ rằng một số năm có 53 tuần trong đó (xem [Tuần mỗi năm](https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year))!
> Bạn sẽ cần tính đến điều này khi phát triển ứng dụng sản xuất.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho tháng và năm, hoặc rỗng.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>
        {{domxref("HTMLElement/change_event", "change")}} và
        {{domxref("Element/input_event", "input")}}
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete"><code>autocomplete</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#step"><code>step</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#value"><code>value</code></a>,
        <code>valueAsDate</code>,
        <code>valueAsNumber</code>
      </td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}},
        {{domxref("HTMLInputElement.stepDown", "stepDown()")}},
        {{domxref("HTMLInputElement.stepUp", "stepUp()")}}.
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td><a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("input")}} chung và giao diện dùng để thao tác nó, {{domxref("HTMLInputElement")}}
- [Định dạng ngày và giờ dùng trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
- [Hướng dẫn bộ chọn ngày và giờ](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types#date_and_time_pickers)
- [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date), [`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time), và [`<input type="week">`](/en-US/docs/Web/HTML/Reference/Elements/input/week)
