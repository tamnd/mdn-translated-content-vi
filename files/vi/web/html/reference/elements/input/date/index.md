---
title: <input type="date">
slug: Web/HTML/Reference/Elements/input/date
page-type: html-attribute-value
browser-compat: html.elements.input.type_date
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có **`type="date"`** tạo ra các trường nhập liệu cho phép người dùng nhập một ngày. Giao diện của bộ chọn ngày thay đổi tùy theo trình duyệt và hệ điều hành. Giá trị được chuẩn hóa theo định dạng `yyyy-mm-dd`.

Giá trị kết quả bao gồm năm, tháng và ngày, nhưng _không_ bao gồm thời gian. Các kiểu đầu vào {{HTMLElement("input/time", "time")}} và {{HTMLElement("input/datetime-local", "datetime-local")}} hỗ trợ đầu vào thời gian và ngày+thời gian.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;date&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="start">Start date:</label>

<input
  type="date"
  id="start"
  name="trip-start"
  value="2018-07-22"
  min="2018-01-01"
  max="2018-12-31" />
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

## Giá trị

Một chuỗi đại diện cho ngày được nhập vào ô nhập liệu. Ngày được định dạng theo [Định dạng chuỗi ngày](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#date_strings).

Bạn có thể đặt giá trị mặc định cho đầu vào bằng một ngày trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) như sau:

```html
<input type="date" value="2017-06-01" />
```

{{EmbedLiveSample('Value', 600, 40)}}

> [!NOTE]
> Định dạng ngày hiển thị sẽ khác với `value` thực tế — ngày hiển thị được định dạng _dựa trên locale của trình duyệt của người dùng_, nhưng `value` được phân tích luôn được định dạng `yyyy-mm-dd`.

Bạn có thể lấy và đặt giá trị ngày trong JavaScript bằng các thuộc tính `value` và `valueAsNumber` của {{domxref("HTMLInputElement")}}. Ví dụ:

```js
const dateControl = document.querySelector('input[type="date"]');
dateControl.value = "2017-06-01";
console.log(dateControl.value); // prints "2017-06-01"
console.log(dateControl.valueAsNumber); // prints 1496275200000, a JavaScript timestamp (ms)
```

Mã này tìm phần tử {{HTMLElement("input")}} đầu tiên có `type` là `date`, và đặt giá trị thành `2017-06-01` (ngày 1 tháng 6 năm 2017). Sau đó đọc giá trị đó lại theo định dạng chuỗi và số.

## Thuộc tính bổ sung

Ngoài [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và [thuộc tính đầu vào](/en-US/docs/Web/HTML/Reference/Elements/input#attributes) chung cho tất cả các phần tử {{HTMLElement("input")}}, đầu vào `date` hỗ trợ các thuộc tính sau:

### max

Ngày mới nhất được chấp nhận. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử xảy ra sau đó, phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `max` không phải là chuỗi ngày hợp lệ theo định dạng `yyyy-mm-dd`, thì phần tử không có giá trị ngày tối đa.

Nếu cả thuộc tính `max` và `min` đều được đặt, giá trị này phải là chuỗi ngày **muộn hơn hoặc bằng** giá trị trong thuộc tính `min`.

### min

Ngày sớm nhất được chấp nhận. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử xảy ra trước đó, phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `min` không phải là chuỗi ngày hợp lệ theo định dạng `yyyy-mm-dd`, thì phần tử không có giá trị ngày tối thiểu.

Nếu cả thuộc tính `max` và `min` đều được đặt, giá trị này phải là chuỗi ngày **sớm hơn hoặc bằng** giá trị trong thuộc tính `max`.

### step

Thuộc tính `step` là một số chỉ định mức độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ các giá trị là bội số nguyên của bước từ step base mới hợp lệ. Step base là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` (Unix epoch, `1970-01-01`) nếu không có cả hai.

Đối với đầu vào `date`, giá trị của `step` được tính theo ngày và được coi là số mili giây bằng 86.400.000 lần giá trị `step` (giá trị số bên dưới tính bằng mili giây). Giá trị mặc định là 1, biểu thị 1 ngày.

Giá trị chuỗi `any` có nghĩa là không có bước nhảy nào và mọi giá trị đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)). Trong thực tế, nó có tác dụng giống như `1` đối với đầu vào `date` vì giao diện bộ chọn chỉ cho phép chọn ngày nguyên.

> [!NOTE]
> Khi dữ liệu người dùng nhập không tuân theo cấu hình bước nhảy, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Sử dụng đầu vào date

Đầu vào date cung cấp giao diện dễ dàng để chọn ngày và chuẩn hóa định dạng dữ liệu gửi lên máy chủ bất kể locale của người dùng.

Trong phần này, chúng ta sẽ xem xét cách sử dụng cơ bản và phức tạp hơn của `<input type="date">`.

### Sử dụng cơ bản date

Cách sử dụng cơ bản nhất của `<input type="date">` liên quan đến một `<input>` kết hợp với {{htmlelement("label")}}, như bên dưới:

```html
<form action="https://example.com">
  <label>
    Enter your birthday:
    <input type="date" name="bday" />
  </label>

  <p><button>Submit</button></p>
</form>
```

{{EmbedLiveSample('Basic_uses_of_date', 600, 40)}}

HTML này gửi ngày nhập vào với khóa `bday` đến `https://example.com` — dẫn đến URL như `https://example.com/?bday=1955-06-08`.

### Đặt ngày tối đa và tối thiểu

Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế ngày người dùng có thể chọn. Trong ví dụ sau, chúng ta đặt ngày tối thiểu là `2017-04-01` và ngày tối đa là `2017-04-30`:

```html
<form>
  <label>
    Choose your preferred party date:
    <input type="date" name="party" min="2017-04-01" max="2017-04-30" />
  </label>
</form>
```

{{EmbedLiveSample('Setting_maximum_and_minimum_dates', 600, 40)}}

Kết quả là chỉ có thể chọn các ngày trong tháng 4 năm 2017 — phần tháng và năm của hộp văn bản sẽ không thể chỉnh sửa, và các ngày ngoài tháng 4 năm 2017 không thể chọn trong widget bộ chọn.

Bạn có thể dùng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để thay đổi số ngày nhảy mỗi lần tăng ngày (ví dụ: chỉ cho phép chọn ngày thứ Bảy).

### Kiểm soát kích thước đầu vào

`<input type="date">` không hỗ trợ các thuộc tính kích thước biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Hãy dùng [CSS](/en-US/docs/Web/CSS) để điều chỉnh kích thước.

## Kiểm tra hợp lệ

Mặc định, `<input type="date">` không xác thực giá trị nhập vào ngoài định dạng của nó. Các giao diện thường không cho phép nhập bất cứ thứ gì không phải là ngày — điều này hữu ích.

Nếu bạn dùng [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế ngày có thể (xem [Đặt ngày tối đa và tối thiểu](#setting_maximum_and_minimum_dates)), điều khiển biểu mẫu vô hiệu hóa các ngày không hợp lệ và sẽ hiển thị lỗi nếu bạn cố gửi ngày ngoài phạm vi.

Bạn cũng có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để bắt buộc điền ngày — lỗi sẽ hiển thị nếu bạn cố gửi trường ngày trống.

Hãy xem ví dụ về ngày tối thiểu và tối đa, và cũng bắt buộc điền trường:

```html
<form>
  <label>
    Choose your preferred party date (required, April 1st to 20th):
    <input
      type="date"
      name="party"
      min="2017-04-01"
      max="2017-04-20"
      required />
    <span class="validity"></span>
  </label>

  <p>
    <button>Submit</button>
  </p>
</form>
```

Nếu bạn cố gửi biểu mẫu với ngày không đầy đủ (hoặc với ngày ngoài phạm vi được đặt), trình duyệt hiển thị lỗi. Hãy thử thực hành với ví dụ ngay bây giờ:

{{EmbedLiveSample('Validation', 600, 100)}}

Đây là CSS dùng trong ví dụ trên. Chúng ta sử dụng {{cssxref(":valid")}} và {{cssxref(":invalid")}} [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) để thêm biểu tượng bên cạnh đầu vào, dựa trên giá trị hiện tại có hợp lệ hay không. Chúng ta phải đặt biểu tượng trên {{htmlelement("span")}} bên cạnh đầu vào, không phải trên chính đầu vào, vì ít nhất ở Chrome, nội dung được tạo ra của đầu vào được đặt bên trong điều khiển biểu mẫu và không thể tạo kiểu hoặc hiển thị hiệu quả.

```css
label {
  display: flex;
  align-items: center;
}

span::after {
  padding-left: 5px;
}

input:invalid + span::after {
  content: "✖";
}

input:valid + span::after {
  content: "✓";
}
```

> [!WARNING]
> Kiểm tra hợp lệ biểu mẫu phía máy khách _không thể thay thế_ kiểm tra hợp lệ trên máy chủ. Rất dễ dàng cho ai đó sửa đổi HTML hoặc bỏ qua HTML hoàn toàn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu máy chủ của bạn không xác thực dữ liệu nhận được, có thể xảy ra thảm họa với dữ liệu định dạng sai, quá lớn, sai kiểu, v.v.

## Ví dụ

Trong ví dụ này, chúng ta tạo bộ chọn ngày bằng cách sử dụng bộ chọn `<input type="date">` gốc.

### HTML

HTML trông như thế này:

```html
<form>
  <div class="nativeDatePicker">
    <label for="bday">Enter your birthday:</label>
    <input type="date" id="bday" name="bday" />
    <span class="validity"></span>
  </div>
</form>
```

### CSS

CSS trông như thế này:

```css
input:invalid + span::after {
  content: " ✖";
}

input:valid + span::after {
  content: " ✓";
}
```

### Kết quả

{{EmbedLiveSample('Examples', 600, 100)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho ngày theo định dạng YYYY-MM-DD, hoặc rỗng
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
        <a href="/en-US/docs/Web/API/HTMLInputElement/value"><code>value</code></a>,
        <a href="/en-US/docs/Web/API/HTMLInputElement/valueAsDate"><code>valueAsDate</code></a>,
        <a href="/en-US/docs/Web/API/HTMLInputElement/valueAsNumber"><code>valueAsNumber</code></a>
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
        {{domxref("HTMLInputElement.stepUp", "stepUp()")}}
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
- [Hướng dẫn bộ chọn ngày và giờ](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types#date_and_time_pickers)
- [Định dạng ngày và giờ dùng trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
