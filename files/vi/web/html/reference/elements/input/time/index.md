---
title: <input type="time">
slug: Web/HTML/Reference/Elements/input/time
page-type: html-attribute-value
browser-compat: html.elements.input.type_time
sidebar: htmlsidebar
---

Các phần tử {{htmlelement("input")}} kiểu **`time`** tạo ra các trường ô nhập được thiết kế để người dùng dễ dàng nhập thời gian (giờ và phút, và tùy chọn giây).

Trong khi giao diện người dùng của điều khiển dựa trên trình duyệt và hệ điều hành, các tính năng là giống nhau. Giá trị luôn ở định dạng thời gian `HH:mm` hoặc `HH:mm:ss` 24 giờ với số không ở đầu, bất kể định dạng nhập của giao diện người dùng.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;time&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<label for="appointment">Choose a time for your meeting:</label>

<input
  type="time"
  id="appointment"
  name="appointment"
  min="09:00"
  max="18:00"
  required />

<small>Office hours are 9am to 6pm</small>
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

## Thuộc tính bổ sung

Ngoài các thuộc tính chung cho tất cả các phần tử {{HTMLElement("input")}}, ô nhập `time` cung cấp các thuộc tính sau.

> [!NOTE]
> Không giống nhiều kiểu dữ liệu, giá trị thời gian có **miền tuần hoàn**, nghĩa là các giá trị đạt đến giá trị cao nhất có thể, rồi quay vòng lại từ đầu. Ví dụ, chỉ định `min` là `14:00` và `max` là `2:00` có nghĩa là các giá trị thời gian được phép bắt đầu lúc 2 giờ chiều, chạy qua nửa đêm sang ngày hôm sau, kết thúc lúc 2 giờ sáng. Xem thêm trong phần [làm cho min và max vượt qua nửa đêm](#making_min_and_max_cross_midnight) của bài viết này.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### max

Một chuỗi chỉ ra thời gian muộn nhất được chấp nhận, được chỉ định theo [định dạng giá trị thời gian](#time_value_format) được mô tả ở trên. Nếu chuỗi được chỉ định không phải là thời gian hợp lệ, không có giá trị tối đa nào được đặt.

### min

Một chuỗi chỉ định thời gian sớm nhất được chấp nhận, được đưa ra theo [định dạng giá trị thời gian](#time_value_format) đã mô tả trước đó. Nếu giá trị được chỉ định không phải là chuỗi thời gian hợp lệ, không có giá trị tối thiểu nào được đặt.

### readonly

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### step

Thuộc tính `step` là số chỉ định độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ những giá trị là bội số nguyên của step từ giá trị cơ sở mới hợp lệ. Giá trị cơ sở là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` (`00:00:00`) nếu không có cái nào.

Đối với ô nhập `time`, giá trị `step` được đưa ra theo giây và được coi là số mili giây bằng 1000 lần giá trị `step` (giá trị số cơ bản tính bằng mili giây). Giá trị mặc định là 60, tương đương 1 phút.

Giá trị chuỗi `any` có nghĩa là không có bước cụ thể nào được áp dụng và bất kỳ giá trị nào đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)). Trên thực tế, nó có cùng hiệu quả như `60` cho ô nhập `time` vì giao diện bộ chọn trong trường hợp này chỉ cho phép chọn phút nguyên.

> [!NOTE]
> Khi dữ liệu người dùng nhập không tuân theo cấu hình bước, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Xác thực

Theo mặc định, `<input type="time">` không áp dụng bất kỳ xác thực nào cho các giá trị nhập, ngoài việc giao diện user agent thường không cho phép bạn nhập bất cứ thứ gì khác ngoài giá trị thời gian. Điều này hữu ích, nhưng bạn không thể hoàn toàn dựa vào giá trị để là chuỗi thời gian đúng, vì nó có thể là chuỗi rỗng (`""`), điều này được phép. Để biết ví dụ về xác thực ràng buộc bằng các thuộc tính `min`, `max`, `step` và `required`, xem phần [đặt thời gian tối đa và tối thiểu](#setting_maximum_and_minimum_times).

## Ví dụ

### Cách dùng cơ bản của time

Cách dùng cơ bản nhất của `<input type="time">` bao gồm kết hợp `<input>` cơ bản và phần tử {{htmlelement("label")}}, như thấy bên dưới:

```html
<form>
  <label for="appointment-time">Choose an appointment time: </label>
  <input id="appointment-time" type="time" name="appointment-time" />
</form>
```

{{EmbedLiveSample('Basic_uses_of_time', 600, 40)}}

### Tạo giao diện bộ chọn thời gian

Trong ví dụ này, chúng ta tạo phần tử giao diện để chọn thời gian bằng bộ chọn gốc được tạo bằng `<input type="time">`:

```html
<form>
  <label for="appointment-time">
    Choose an appointment time (opening hours 12:00 to 18:00):
  </label>
  <input
    id="appointment-time"
    type="time"
    name="appointment-time"
    min="12:00"
    max="18:00"
    required />
  <span class="validity"></span>
</form>
```

```css
input[type="time"] {
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

{{ EmbedLiveSample('creating a time picker interface', 600, 140) }}

### Kiểm soát kích thước ô nhập

`<input type="time">` không hỗ trợ các thuộc tính kích thước biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size), vì thời gian luôn có cùng số ký tự. Bạn sẽ phải dùng [CSS](/en-US/docs/Web/CSS) cho các nhu cầu kích thước.

### Đặt thuộc tính value

Bạn có thể đặt giá trị mặc định cho ô nhập bằng cách bao gồm thời gian hợp lệ trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) khi tạo phần tử `<input>`, như sau:

```html
<label for="appointment-time">Choose an appointment time: </label>
<input
  id="appointment-time"
  type="time"
  name="appointment-time"
  value="13:30" />
```

{{ EmbedLiveSample('Setting_the_value_attribute', 600, 60) }}

### Đặt giá trị bằng JavaScript

Bạn cũng có thể lấy và đặt giá trị thời gian trong JavaScript bằng thuộc tính `value` của {{domxref("HTMLInputElement")}}, ví dụ:

```js
const timeControl = document.querySelector('input[type="time"]');
timeControl.value = "15:30";
```

### Định dạng giá trị thời gian

`value` của ô nhập `time` luôn ở định dạng 24 giờ có số không ở đầu: `HH:mm`, bất kể định dạng nhập, thường được chọn dựa trên vùng địa phương của người dùng (hoặc bởi user agent). Nếu thời gian bao gồm giây (xem [Sử dụng thuộc tính step](#using_the_step_attribute)), định dạng luôn là `HH:mm:ss`. Bạn có thể tìm hiểu thêm về định dạng giá trị thời gian được dùng bởi kiểu ô nhập này trong [Chuỗi thời gian](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#time_strings).

Trong ví dụ này, bạn có thể thấy giá trị của ô nhập thời gian bằng cách nhập thời gian và xem nó thay đổi như thế nào sau đó.

Đầu tiên, hãy xem HTML. Chúng ta bao gồm nhãn và ô nhập, và thêm phần tử {{HTMLElement("p")}} với {{HTMLElement("span")}} để hiển thị giá trị của ô nhập `time`:

```html
<form>
  <label for="startTime">Start time: </label>
  <input type="time" id="startTime" />
  <p>
    Value of the <code>time</code> input:
    <code>"<span id="value">n/a</span>"</code>.
  </p>
</form>
```

Mã JavaScript thêm mã vào ô nhập thời gian để theo dõi sự kiện {{domxref("Element/input_event", "input")}}, được kích hoạt mỗi khi nội dung của phần tử ô nhập thay đổi. Khi điều này xảy ra, nội dung của `<span>` được thay thế bằng giá trị mới của phần tử ô nhập.

```js
const startTime = document.getElementById("startTime");
const valueSpan = document.getElementById("value");

startTime.addEventListener("input", () => {
  valueSpan.innerText = startTime.value;
});
```

{{EmbedLiveSample("Time_value_format", 600, 80)}}

Khi biểu mẫu bao gồm ô nhập `time` được gửi, giá trị được mã hóa trước khi được bao gồm trong dữ liệu của biểu mẫu. Mục dữ liệu biểu mẫu cho ô nhập thời gian sẽ luôn ở dạng `name=HH%3Amm`, hoặc `name=HH%3Amm%3Ass` nếu giây được bao gồm (xem [Sử dụng thuộc tính step](#using_the_step_attribute)).

### Sử dụng thuộc tính step

Bạn có thể dùng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để thay đổi lượng thời gian nhảy mỗi khi thời gian được tăng hoặc giảm (ví dụ thời gian di chuyển 10 phút mỗi lần khi nhấp vào các widget mũi tên nhỏ).

Nó nhận giá trị nguyên xác định số giây bạn muốn tăng thêm; giá trị mặc định là 60 giây. Với mặc định này, hầu hết giao diện người dùng thời gian của user agent hiển thị giờ và phút nhưng không hiển thị giây. Bao gồm thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) với bất kỳ giá trị số nào không chia hết cho `60` sẽ thêm giây vào giao diện, nếu giá trị `min` hoặc `max` chưa khiến giây hiển thị.

```html
<form>
  <label for="appointment-time">Choose an appointment time: </label>
  <input id="appointment-time" type="time" name="appointment-time" step="2" />
</form>
```

{{EmbedLiveSample('Using_the_step_attribute', 600, 40)}}

Để chỉ định phút hoặc giờ làm bước, hãy chỉ định số phút hoặc giờ theo giây, chẳng hạn 120 cho 2 phút, hoặc 7200 cho 2 giờ.

### Đặt thời gian tối đa và tối thiểu

Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để giới hạn các thời gian hợp lệ mà người dùng có thể chọn. Trong ví dụ sau chúng ta đặt thời gian tối thiểu là `12:00` và thời gian tối đa là `18:00`:

```html
<form>
  <label for="appointment-time">
    Choose an appointment time (opening hours 12:00 to 18:00):
  </label>
  <input
    id="appointment-time"
    type="time"
    name="appointment-time"
    min="12:00"
    max="18:00" />
  <span class="validity"></span>
</form>
```

{{ EmbedLiveSample('Setting_maximum_and_minimum_times', 600, 40) }}

Đây là CSS được dùng trong ví dụ trên. Ở đây chúng ta sử dụng các thuộc tính CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} để tạo kiểu cho ô nhập dựa trên giá trị hiện tại có hợp lệ hay không. Chúng ta thêm biểu tượng như nội dung được tạo trên {{htmlelement("span")}} bên cạnh ô nhập.

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

Kết quả ở đây là:

- Chỉ các thời gian từ 12:00 đến 18:00 sẽ được coi là hợp lệ; các thời gian ngoài phạm vi đó sẽ được biểu thị là không hợp lệ.

#### Làm cho min và max vượt qua nửa đêm

Bằng cách đặt thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) lớn hơn thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max), phạm vi thời gian hợp lệ sẽ bao quanh nửa đêm để tạo ra phạm vi thời gian hợp lệ. Chức năng này không được hỗ trợ bởi bất kỳ loại ô nhập nào khác.

```js
const input = document.createElement("input");
input.type = "time";
input.min = "23:00";
input.max = "01:00";
input.value = "23:59";

if (input.validity.valid && input.type === "time") {
  // <input type=time> reversed range supported
} else {
  // <input type=time> reversed range unsupported
}
```

### Làm thời gian bắt buộc

Ngoài ra, bạn có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để làm cho việc điền thời gian là bắt buộc. Các trình duyệt sẽ hiển thị lỗi nếu bạn cố gửi thời gian ngoài giới hạn được đặt, hoặc trường thời gian rỗng.

Hãy xem ví dụ; ở đây chúng ta đã đặt thời gian tối thiểu và tối đa, và cũng làm cho trường bắt buộc:

```html
<form>
  <div>
    <label for="appointment-time">
      Choose an appointment time (opening hours 12:00 to 18:00):
    </label>
    <input
      id="appointment-time"
      type="time"
      name="appointment-time"
      min="12:00"
      max="18:00"
      required />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" value="Submit form" />
  </div>
</form>
```

Nếu bạn cố gửi biểu mẫu với thời gian chưa hoàn chỉnh (hoặc với thời gian ngoài giới hạn được đặt), trình duyệt hiển thị lỗi. Hãy thử chơi với ví dụ ngay bây giờ:

{{ EmbedLiveSample('Making_times_required', 600, 120) }}

> [!WARNING]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script đảm bảo rằng dữ liệu nhập có định dạng phù hợp. Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai được gửi (hoặc dữ liệu quá lớn, sai loại, v.v.).

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="/en-US/docs/Web/HTML/Reference/Elements/input#value">Giá trị</a></strong></td>
      <td>Một chuỗi đại diện cho thời gian, hoặc rỗng.</td>
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
        và
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

- [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date)
- [`<input type="datetime-local">`](/en-US/docs/Web/HTML/Reference/Elements/input/datetime-local)
- [`<input type="week">`](/en-US/docs/Web/HTML/Reference/Elements/input/week)
- [`<input type="month">`](/en-US/docs/Web/HTML/Reference/Elements/input/month)
- Phần tử chung {{HTMLElement("input")}} và giao diện dùng để thao tác nó, {{domxref("HTMLInputElement")}}
- [Định dạng ngày và giờ dùng trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
- [Hướng dẫn bộ chọn Ngày và Giờ](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types#date_and_time_pickers)
