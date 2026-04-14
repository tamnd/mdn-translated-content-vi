---
title: <input type="week">
slug: Web/HTML/Reference/Elements/input/week
page-type: html-attribute-value
browser-compat: html.elements.input.type_week
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`week`** tạo ra các trường nhập liệu cho phép nhập dễ dàng một năm cùng với [số tuần theo ISO 8601](https://en.wikipedia.org/wiki/ISO_8601#Week_dates) trong năm đó (tức là tuần 1 đến [52 hoặc 53](https://en.wikipedia.org/wiki/ISO_8601#Week_dates)).

{{InteractiveExample("HTML Demo: &lt;input type=&quot;week&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="camp-week">Choose a week in May or June:</label>

<input
  type="week"
  name="week"
  id="camp-week"
  min="2018-W18"
  max="2018-W26"
  required />
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

Giao diện người dùng của điều khiển này khác nhau tùy theo trình duyệt; hỗ trợ đa trình duyệt hiện còn khá hạn chế, chỉ có Chrome/Opera và Microsoft Edge hỗ trợ tại thời điểm này. Trên các trình duyệt không hỗ trợ, điều khiển sẽ tự động xuống cấp và hoạt động giống như [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text).

![Ô nhập hiển thị 'week 01, 2017'. Nền của 2017 có màu xanh giống như vòng focus. Có 3 biểu tượng trong ô nhập: x hoặc xóa, một spinner với các mũi tên nhỏ lên và xuống, và một mũi tên xuống lớn hơn. Một lịch hiện ra phía dưới ô nhập được đặt vào tháng 1 năm 2017. Cột đầu tiên của lịch là tuần: 52, 1, 2, 3, 4, 5. Lịch đầy đủ trong tháng nằm ở bên phải đó. Hàng có Tuần 1 và ngày 2 đến 8 tháng 1 được tô sáng. Trên cùng dòng với tháng, có các nút để di chuyển sang phải và trái cho tháng tiếp theo và trước đó.](week-control-chrome.png)

## Giá trị

Một chuỗi đại diện cho giá trị tuần/năm được nhập vào ô nhập. Định dạng của giá trị ngày và giờ được sử dụng bởi kiểu nhập này được mô tả trong [Chuỗi tuần](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#week_strings).

Bạn có thể đặt giá trị mặc định cho ô nhập bằng cách bao gồm một giá trị trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value), như sau:

```html
<label for="week">What week would you like to start?</label>
<input id="week" type="week" name="week" value="2017-W01" />
```

{{EmbedLiveSample('Value', 600, 60)}}

Một điều cần lưu ý là định dạng hiển thị có thể khác với `value` thực tế, luôn được định dạng là `yyyy-Www`. Khi giá trị trên được gửi đến máy chủ, chẳng hạn, các trình duyệt có thể hiển thị nó là `Week 01, 2017`, nhưng giá trị được gửi sẽ luôn trông như `week=2017-W01`.

Bạn cũng có thể lấy và đặt giá trị trong JavaScript bằng cách sử dụng thuộc tính {{domxref("HTMLInputElement.value", "value")}} của phần tử nhập, ví dụ:

```js
const weekControl = document.querySelector('input[type="week"]');
weekControl.value = "2017-W45";
```

## Thuộc tính bổ sung

Ngoài các thuộc tính chung của các phần tử {{HTMLElement("input")}}, ô nhập tuần còn cung cấp các thuộc tính sau.

### max

Năm và số tuần muộn nhất (theo thời gian), theo định dạng chuỗi được thảo luận trong phần [Giá trị](#giá_trị) ở trên, được chấp nhận. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) được nhập vào phần tử vượt quá giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `max` không phải là một chuỗi tuần hợp lệ, thì phần tử không có giá trị tối đa.

Giá trị này phải lớn hơn hoặc bằng năm và tuần được chỉ định bởi thuộc tính `min`.

### min

Năm và tuần sớm nhất được chấp nhận. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử nhỏ hơn giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu một giá trị được chỉ định cho `min` mà không phải là một chuỗi tuần hợp lệ, ô nhập không có giá trị tối thiểu.

Giá trị này phải nhỏ hơn hoặc bằng giá trị của thuộc tính `max`.

### readonly

Một thuộc tính Boolean mà nếu có mặt, nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript bằng cách đặt trực tiếp thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì một trường chỉ đọc không thể có giá trị, `required` không có bất kỳ hiệu lực nào đối với các ô nhập có thuộc tính `readonly` cũng được chỉ định.

### step

Thuộc tính `step` là một số chỉ định độ phân giải mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ các giá trị là bội số nguyên của bước từ cơ sở bước mới hợp lệ. Cơ sở bước là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc −259,200,000 (bắt đầu của tuần `1970-W01`) nếu cả hai đều không được cung cấp.

Đối với ô nhập `week`, giá trị của `step` được tính bằng tuần và được coi là số mili giây bằng 604,800,000 nhân với giá trị `step` (giá trị số cơ bản tính bằng mili giây). Giá trị mặc định là 1, tương đương với 1 tuần.

Một giá trị chuỗi `any` có nghĩa là không có bước nào được ngụ ý, và bất kỳ giá trị nào đều được phép (trừ các ràng buộc khác, như [`min`](#min) và [`max`](#max)). Trong thực tế, nó có cùng hiệu lực như `1` đối với ô nhập `week` vì giao diện người dùng của picker chỉ cho phép chọn các tuần nguyên.

> [!NOTE]
> Khi dữ liệu được nhập bởi người dùng không tuân theo cấu hình bước, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Sử dụng ô nhập tuần

Ô nhập tuần nghe có vẻ tiện lợi khi nhìn lần đầu, vì chúng cung cấp giao diện người dùng dễ dàng để chọn tuần, và chúng chuẩn hóa định dạng dữ liệu được gửi đến máy chủ, bất kể trình duyệt hoặc ngôn ngữ của người dùng. Tuy nhiên, có các vấn đề với `<input type="week">` vì hỗ trợ trình duyệt không được đảm bảo trên tất cả các trình duyệt.

Chúng ta sẽ xem xét các cách sử dụng cơ bản và phức tạp hơn của `<input type="week">`, sau đó đưa ra lời khuyên về cách giảm thiểu vấn đề hỗ trợ trình duyệt sau này (xem [Xử lý hỗ trợ trình duyệt](#xử_lý_hỗ_trợ_trình_duyệt)).

### Sử dụng cơ bản của week

Cách sử dụng cơ bản nhất của `<input type="week">` bao gồm một `<input>` cơ bản và kết hợp phần tử {{htmlelement("label")}}, như thấy bên dưới:

```html
<form>
  <label for="week">What week would you like to start?</label>
  <input id="week" type="week" name="week" />
</form>
```

{{EmbedLiveSample('Basic_uses_of_week', 600, 40)}}

### Kiểm soát kích thước ô nhập

`<input type="week">` không hỗ trợ các thuộc tính định cỡ biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Bạn sẽ phải sử dụng [CSS](/en-US/docs/Web/CSS) cho nhu cầu định cỡ.

### Sử dụng thuộc tính step

Bạn có thể sử dụng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để thay đổi số tuần được nhảy mỗi khi chúng được tăng hoặc giảm, tuy nhiên nó có vẻ không có bất kỳ hiệu lực nào trên các trình duyệt hỗ trợ.

## Xác thực

Theo mặc định, `<input type="week">` không áp dụng bất kỳ xác thực nào cho các giá trị được nhập. Các triển khai giao diện người dùng thường không cho phép bạn chỉ định bất cứ điều gì không phải là tuần/năm hợp lệ, điều này hữu ích, nhưng vẫn có thể gửi với trường trống, và bạn có thể muốn giới hạn phạm vi các tuần có thể chọn.

### Đặt tuần tối đa và tối thiểu

Bạn có thể sử dụng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để giới hạn các tuần hợp lệ mà người dùng có thể chọn. Trong ví dụ sau, chúng ta đặt giá trị tối thiểu là `Week 01, 2017` và giá trị tối đa là `Week 52, 2017`:

```html
<form>
  <label for="week">What week would you like to start?</label>
  <input id="week" type="week" name="week" min="2017-W01" max="2017-W52" />
  <span class="validity"></span>
</form>
```

{{EmbedLiveSample('Setting_maximum_and_minimum_weeks', 600, 40)}}

Đây là CSS được sử dụng trong ví dụ trên. Ở đây chúng ta sử dụng các thuộc tính CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} để tạo kiểu cho ô nhập dựa trên việc giá trị hiện tại có hợp lệ hay không. Chúng ta phải đặt các biểu tượng trên một {{htmlelement("span")}} bên cạnh ô nhập, không phải trên chính ô nhập, vì trong Chrome nội dung được tạo ra được đặt bên trong điều khiển biểu mẫu, và không thể được tạo kiểu hoặc hiển thị hiệu quả.

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

Kết quả là chỉ các tuần từ W01 đến W52 trong năm 2017 mới được coi là hợp lệ và có thể chọn trong các trình duyệt hỗ trợ.

### Bắt buộc nhập giá trị tuần

Ngoài ra, bạn có thể sử dụng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để bắt buộc điền tuần. Kết quả là, các trình duyệt hỗ trợ sẽ hiển thị lỗi nếu bạn cố gắng gửi trường tuần trống.

Hãy xem một ví dụ; ở đây chúng ta đã đặt các tuần tối thiểu và tối đa, và cũng làm cho trường bắt buộc:

```html
<form>
  <div>
    <label for="week">What week would you like to start?</label>
    <input
      id="week"
      type="week"
      name="week"
      min="2017-W01"
      max="2017-W52"
      required />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" value="Submit form" />
  </div>
</form>
```

Nếu bạn cố gắng gửi biểu mẫu mà không có giá trị, trình duyệt sẽ hiển thị lỗi. Hãy thử với ví dụ bây giờ:

{{EmbedLiveSample('Making_week_values_required', 600, 120)}}

Đây là ảnh chụp màn hình dành cho những người không sử dụng trình duyệt hỗ trợ:

![Điều khiển biểu mẫu tuần có hai dấu gạch ngang ở nơi số tuần cần có. Một popup với biểu tượng cảnh báo màu vàng và 'Please fill out this field' hiện ra từ hai dấu gạch ngang, được tô sáng bằng màu xanh, cùng màu với vòng focus của ô nhập.](week-validation-chrome.png)

> [!WARNING]
> Xác thực biểu mẫu HTML _không_ thay thế cho các script đảm bảo rằng dữ liệu được nhập có đúng định dạng hay không. Sẽ rất dễ dàng cho ai đó thực hiện các điều chỉnh HTML để vượt qua xác thực, hoặc loại bỏ hoàn toàn. Cũng có thể cho ai đó bỏ qua HTML của bạn hoàn toàn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, thảm họa có thể xảy ra khi dữ liệu được định dạng không đúng được gửi (hoặc dữ liệu quá lớn, sai kiểu, v.v.).

## Xử lý hỗ trợ trình duyệt

Như đã đề cập ở trên, vấn đề lớn khi sử dụng ô nhập tuần hiện nay là hỗ trợ trình duyệt: Safari và Firefox không hỗ trợ nó trên máy tính để bàn, và các phiên bản cũ của IE cũng không hỗ trợ.

Các nền tảng di động như Android và iOS sử dụng hoàn hảo các kiểu nhập như vậy, cung cấp các điều khiển giao diện người dùng chuyên biệt giúp chọn giá trị dễ dàng hơn trong môi trường màn hình cảm ứng. Ví dụ, bộ chọn `week` trên Chrome cho Android trông như thế này:

![Một popup modal. Tiêu đề đọc 'set week'. Có hai cột: bên trái có 36 ở giữa với độ mờ đầy đủ, với 35 ở trên và 37 ở dưới có độ mờ bán phần. Ở phía bên phải, 2017 hoàn toàn mờ. Không có tùy chọn nào khác. Ba liên kết văn bản hoặc nút ở phía dưới bao gồm 'clear' ở 'bên trái' và 'cancel' và 'set' ở bên phải.](week-chrome-android.png)

Các trình duyệt không hỗ trợ sẽ tự động xuống cấp thành ô nhập văn bản, nhưng điều này tạo ra các vấn đề cả về tính nhất quán của giao diện người dùng (điều khiển được hiển thị sẽ khác nhau) và xử lý dữ liệu.

Vấn đề thứ hai nghiêm trọng hơn. Như đã đề cập trước đó, với ô nhập `week`, giá trị thực tế luôn được chuẩn hóa theo định dạng `yyyy-Www`. Khi trình duyệt chuyển sang ô nhập văn bản chung, không có gì hướng dẫn người dùng định dạng ô nhập đúng cách (và nó chắc chắn không trực quan). Có nhiều cách mà người ta có thể viết giá trị tuần; ví dụ:

- `Week 1 2017`
- `Jan 2-8 2017`
- `2017-W01`
- v.v.

Cách tốt nhất để xử lý tuần/năm trong biểu mẫu theo cách đa trình duyệt hiện tại là cho người dùng nhập số tuần và năm trong các điều khiển riêng biệt (các phần tử {{htmlelement("select")}} rất phổ biến; xem bên dưới để biết ví dụ), hoặc sử dụng các thư viện JavaScript như [jQuery date picker](https://jqueryui.com/datepicker/).

## Ví dụ

Trong ví dụ này, chúng ta tạo hai bộ phần tử giao diện người dùng để chọn tuần: một picker gốc được tạo bằng `<input type="week">`, và một bộ hai phần tử {{htmlelement("select")}} để chọn tuần/năm trong các trình duyệt cũ hơn không hỗ trợ kiểu nhập `week`.

{{EmbedLiveSample('Examples', 600, 140)}}

HTML trông như sau:

```html
<form>
  <div class="nativeWeekPicker">
    <label for="week">What week would you like to start?</label>
    <input
      id="week"
      type="week"
      name="week"
      min="2017-W01"
      max="2018-W52"
      required />
    <span class="validity"></span>
  </div>
  <p class="fallbackLabel">What week would you like to start?</p>
  <div class="fallbackWeekPicker">
    <div>
      <span>
        <label for="week">Week:</label>
        <select id="fallbackWeek" name="week"></select>
      </span>
      <span>
        <label for="year">Year:</label>
        <select id="year" name="year">
          <option value="2017" selected>2017</option>
          <option value="2018">2018</option>
        </select>
      </span>
    </div>
  </div>
</form>
```

Các giá trị tuần được tạo động bởi mã JavaScript bên dưới.

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

Phần khác của mã có thể được quan tâm là mã phát hiện tính năng. Để phát hiện xem trình duyệt có hỗ trợ `<input type="week">` hay không, chúng ta tạo một phần tử {{htmlelement("input")}} mới, thử đặt `type` của nó thành `week`, sau đó ngay lập tức kiểm tra xem `type` của nó được đặt thành gì. Các trình duyệt không hỗ trợ sẽ trả về `text`, vì kiểu `week` dự phòng về kiểu `text`. Nếu `<input type="week">` không được hỗ trợ, chúng ta ẩn picker gốc và hiển thị giao diện người dùng picker dự phòng (các phần tử {{htmlelement("select")}}) thay thế.

```js
// Get UI elements
const nativePicker = document.querySelector(".nativeWeekPicker");
const fallbackPicker = document.querySelector(".fallbackWeekPicker");
const fallbackLabel = document.querySelector(".fallbackLabel");

const yearSelect = document.querySelector("#year");
const weekSelect = document.querySelector("#fallbackWeek");

// Hide fallback initially
fallbackPicker.style.display = "none";
fallbackLabel.style.display = "none";

// Test whether a new date input falls back to a text input or not
const test = document.createElement("input");

try {
  test.type = "week";
} catch (e) {
  console.log(e.description);
}

// If it does, run the code inside the if () {} block
if (test.type === "text") {
  // Hide the native picker and show the fallback
  nativePicker.style.display = "none";
  fallbackPicker.style.display = "block";
  fallbackLabel.style.display = "block";

  // populate the weeks dynamically
  populateWeeks();
}

function populateWeeks() {
  // Populate the week select with 52 weeks
  for (let i = 1; i <= 52; i++) {
    const option = document.createElement("option");
    option.textContent = i < 10 ? `0${i}` : i;
    weekSelect.appendChild(option);
  }
}
```

> [!NOTE]
> Hãy nhớ rằng một số năm có 53 tuần trong đó (xem [Số tuần trong năm](https://en.wikipedia.org/wiki/ISO_week_date#Weeks_per_year))! Bạn cần tính đến điều này khi phát triển ứng dụng sản xuất.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#giá_trị">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho một tuần và năm, hoặc
        rỗng
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
      <td><strong>Các thuộc tính chung được hỗ trợ</strong></td>
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
        và {{domxref("HTMLInputElement.stepUp", "stepUp()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ẩn</strong></td>
      <td><a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role">không có vai trò tương ứng</a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Phần tử {{HTMLElement("input")}} chung và giao diện được sử dụng để thao tác với nó, {{domxref("HTMLInputElement")}}
- [Định dạng ngày và giờ được sử dụng trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
- [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local), [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date), [`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time), và [`<input type="month">`](/en-US/docs/Web/HTML/Reference/Elements/input/month)
