---
title: <input type="datetime-local">
slug: Web/HTML/Reference/Elements/input/datetime-local
page-type: html-attribute-value
browser-compat: html.elements.input.type_datetime-local
sidebar: htmlsidebar
---

Các phần tử {{htmlelement("input")}} có kiểu **`datetime-local`** tạo ra các điều khiển đầu vào cho phép người dùng dễ dàng nhập cả ngày và giờ, bao gồm năm, tháng, ngày cũng như giờ và phút.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;datetime-local&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="meeting-time">Choose a time for your appointment:</label>

<input
  type="datetime-local"
  id="meeting-time"
  name="meeting-time"
  value="2018-06-12T19:30"
  min="2018-06-07T00:00"
  max="2018-06-14T00:00" />
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

Giao diện của điều khiển thay đổi tùy theo trình duyệt. Điều khiển nhằm biểu diễn _ngày và giờ địa phương_, không nhất thiết là _ngày và giờ địa phương của người dùng_. Nói cách khác, đầu vào cho phép bất kỳ tổ hợp hợp lệ nào của năm, tháng, ngày, giờ và phút — ngay cả khi tổ hợp đó không hợp lệ trong múi giờ địa phương của người dùng (chẳng hạn như một giờ trong khoảng lỗ hổng chuyển đổi mùa hè).

## Giá trị

Một chuỗi đại diện cho giá trị của ngày được nhập vào đầu vào. Định dạng của giá trị ngày và giờ được sử dụng bởi kiểu đầu vào này được mô tả trong [Chuỗi ngày và giờ địa phương](/en-US/docs/Web/HTML/Guides/Date_and_time_formats#local_date_and_time_strings).

Bạn có thể đặt giá trị mặc định cho đầu vào bằng cách bao gồm ngày và giờ trong thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) như sau:

```html
<label for="party">Enter a date and time for your party booking:</label>
<input
  id="party"
  type="datetime-local"
  name="party-date"
  value="2017-06-01T08:30" />
```

{{ EmbedLiveSample('Value', 600, 60) }}

Một điều cần lưu ý là định dạng ngày và giờ hiển thị khác với `value` thực tế; ngày và giờ hiển thị được định dạng theo locale của người dùng như được báo cáo bởi hệ điều hành, trong khi ngày/giờ `value` luôn được định dạng `YYYY-MM-DDTHH:mm`. Khi giá trị trên được gửi lên máy chủ, chẳng hạn, nó sẽ trông như `party-date=2024-06-01T08:30`.

> [!NOTE]
> Cũng lưu ý rằng nếu dữ liệu như vậy được gửi qua HTTP [`GET`](/en-US/docs/Web/HTTP/Reference/Methods/GET), ký tự dấu hai chấm cần được mã hóa để đưa vào tham số URL, ví dụ: `party-date=2024-06-01T08%3A30`. Xem {{jsxref("Global_Objects/encodeURI", "encodeURI()")}} để biết một cách thực hiện điều này.

Bạn cũng có thể lấy và đặt giá trị ngày trong JavaScript bằng thuộc tính `value` của {{domxref("HTMLInputElement")}}, ví dụ:

```js
const dateControl = document.querySelector('input[type="datetime-local"]');
dateControl.value = "2017-06-01T08:30";
```

## Thuộc tính bổ sung

Ngoài các thuộc tính chung cho tất cả các phần tử {{HTMLElement("input")}}, đầu vào `datetime-local` cung cấp các thuộc tính sau.

### max

Ngày và giờ mới nhất được chấp nhận. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử muộn hơn dấu thời gian này, phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `max` không phải là chuỗi hợp lệ theo định dạng `YYYY-MM-DDTHH:mm`, thì phần tử không có giá trị tối đa.

Giá trị này phải chỉ định chuỗi ngày muộn hơn hoặc bằng chuỗi được chỉ định bởi thuộc tính `min`.

### min

Ngày và giờ sớm nhất được chấp nhận; các dấu thời gian sớm hơn sẽ khiến phần tử thất bại [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `min` không phải là chuỗi hợp lệ theo định dạng `YYYY-MM-DDTHH:mm`, thì phần tử không có giá trị tối thiểu.

Giá trị này phải chỉ định chuỗi ngày sớm hơn hoặc bằng chuỗi được chỉ định bởi thuộc tính `max`.

### step

Thuộc tính `step` là một số chỉ định mức độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ các giá trị là bội số nguyên của bước từ step base mới hợp lệ. Step base là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` (Unix epoch, `1970-01-01T00:00`) nếu không có cả hai.

Đối với đầu vào `datetime-local`, giá trị của `step` được tính theo giây và được coi là số mili giây bằng 1000 lần giá trị `step` (giá trị số bên dưới tính bằng mili giây). Giá trị mặc định là 60, biểu thị 1 phút.

Giá trị chuỗi `any` có nghĩa là không có bước nhảy nào và mọi giá trị đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)). Trong thực tế, nó có tác dụng giống như `60` đối với đầu vào `datetime-local` vì giao diện bộ chọn trong trường hợp này chỉ cho phép chọn phút nguyên.

> [!NOTE]
> Khi dữ liệu người dùng nhập không tuân theo cấu hình bước nhảy, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Sử dụng đầu vào datetime-local

Đầu vào ngày/giờ rất tiện lợi cho nhà phát triển; chúng cung cấp giao diện người dùng dễ dàng để chọn ngày và giờ, và chúng chuẩn hóa định dạng dữ liệu gửi lên máy chủ, bất kể locale của người dùng. Tuy nhiên, điều quan trọng là xem xét người dùng của bạn. Đừng yêu cầu người dùng nhập dữ liệu không cần thiết cho ứng dụng của bạn hoạt động.

### Kiểm soát kích thước đầu vào

`<input type="datetime-local">` không hỗ trợ các thuộc tính kích thước điều khiển biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Bạn sẽ phải dùng [CSS](/en-US/docs/Web/CSS) để tùy chỉnh kích thước của các phần tử này.

### Đặt múi giờ

Một điều kiểu đầu vào `datetime-local` không cung cấp là cách đặt múi giờ và/hoặc locale của điều khiển ngày/giờ. Điều này đã có sẵn trong kiểu đầu vào `datetime`, nhưng kiểu này hiện đã lỗi thời, đã bị loại bỏ khỏi đặc tả. Lý do chính là thiếu triển khai trong trình duyệt và lo ngại về giao diện/trải nghiệm người dùng. Dễ hơn là chỉ có một điều khiển (hoặc các điều khiển) để đặt ngày/giờ và sau đó xử lý locale trong một điều khiển riêng biệt.

Ví dụ: nếu bạn đang tạo hệ thống mà người dùng có thể đã đăng nhập với locale đã được đặt, bạn có thể cung cấp múi giờ trong kiểu đầu vào [`hidden`](/en-US/docs/Web/HTML/Reference/Elements/input/hidden). Ví dụ:

```html
<input type="hidden" id="timezone" name="timezone" value="-08:00" />
```

Mặt khác, nếu bạn cần cho phép người dùng nhập múi giờ cùng với đầu vào ngày/giờ, bạn có thể có phần tử {{htmlelement("select")}} để người dùng đặt múi giờ đúng bằng cách chọn vị trí cụ thể:

```html
<select name="timezone" id="timezone">
  <option value="Pacific/Kwajalein">Eniwetok, Kwajalein</option>
  <option value="Pacific/Midway">Midway Island, Samoa</option>
  <option value="Pacific/Honolulu">Hawaii</option>
  <option value="Pacific/Marquesas">Taiohae</option>
  <!-- and so on -->
</select>
```

Trong cả hai trường hợp, các giá trị ngày/giờ và múi giờ sẽ được gửi lên máy chủ như các điểm dữ liệu riêng biệt, và sau đó bạn cần lưu trữ chúng phù hợp trong cơ sở dữ liệu phía máy chủ.

## Kiểm tra hợp lệ

Theo mặc định, `<input type="datetime-local">` không áp dụng bất kỳ xác thực nào cho các giá trị đã nhập. Các triển khai giao diện người dùng thường không cho phép nhập bất cứ thứ gì không phải là ngày/giờ — điều này hữu ích — nhưng người dùng vẫn có thể không điền gì và gửi, hoặc nhập ngày và/hoặc giờ không hợp lệ (ví dụ: ngày 32 tháng 4).

Bạn có thể dùng [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế ngày có thể (xem [Đặt ngày và giờ tối đa và tối thiểu](#setting_maximum_and_minimum_dates_and_times)), và bạn có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để bắt buộc điền ngày/giờ. Kết quả là, trình duyệt sẽ hiển thị lỗi nếu bạn cố gửi ngày ngoài phạm vi hoặc trường ngày trống.

Hãy xem ví dụ; ở đây chúng ta đã đặt giá trị ngày/giờ tối thiểu và tối đa, và cũng bắt buộc điền trường:

```html
<form>
  <div>
    <label for="party">
      Choose your preferred party date and time (required, June 1st 8.30am to
      June 30th 4.30pm):
    </label>
    <input
      id="party"
      type="datetime-local"
      name="party-date"
      min="2017-06-01T08:30"
      max="2017-06-30T16:30"
      required />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" value="Book party!" />
  </div>
</form>
```

Nếu bạn cố gửi biểu mẫu với ngày không đầy đủ (hoặc với ngày ngoài phạm vi được đặt), trình duyệt hiển thị lỗi. Hãy thử thực hành với ví dụ ngay bây giờ:

{{ EmbedLiveSample('Validation', 600, 120) }}

Đây là CSS dùng trong ví dụ trên. Chúng ta sử dụng các thuộc tính CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}} để tạo kiểu cho đầu vào dựa trên giá trị hiện tại có hợp lệ hay không. Chúng ta đặt các biểu tượng trên {{htmlelement("span")}} bên cạnh đầu vào.

```css
div {
  margin-bottom: 10px;
  display: flex;
  align-items: center;
}

label {
  display: inline-block;
  width: 300px;
}

input:invalid + span::after {
  content: "✖";
  padding-left: 5px;
}

input:valid + span::after {
  content: "✓";
  padding-left: 5px;
}
```

> [!WARNING]
> Kiểm tra hợp lệ biểu mẫu HTML _không phải_ là sự thay thế cho các script đảm bảo dữ liệu nhập có đúng định dạng. Quá dễ dàng để ai đó điều chỉnh HTML cho phép bỏ qua xác thực, hoặc xóa hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn hoàn toàn và gửi dữ liệu trực tiếp đến máy chủ. Nếu mã phía máy chủ không xác thực dữ liệu nhận được, sự cố có thể phát sinh khi dữ liệu không đúng định dạng được gửi (hoặc dữ liệu quá lớn, sai kiểu, v.v.).

> [!NOTE]
> Với đầu vào `datetime-local`, giá trị ngày luôn được chuẩn hóa theo định dạng `YYYY-MM-DDTHH:mm`.

## Ví dụ

### Sử dụng cơ bản datetime-local

Cách sử dụng cơ bản nhất của `<input type="datetime-local">` liên quan đến sự kết hợp cơ bản giữa phần tử `<input>` và {{htmlelement("label")}}, như bên dưới:

```html
<form>
  <label for="party">Enter a date and time for your party booking:</label>
  <input id="party" type="datetime-local" name="party-date" />
</form>
```

{{ EmbedLiveSample('Basic_uses_of_datetime-local', 600, 40) }}

### Đặt ngày và giờ tối đa và tối thiểu

Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để hạn chế ngày/giờ người dùng có thể chọn. Trong ví dụ sau, chúng ta đặt ngày/giờ tối thiểu là `2025-06-01T08:30` và tối đa là `2025-06-30T16:30`:

```html
<form>
  <label for="party">Enter a date and time for your party booking:</label>
  <input
    id="party"
    type="datetime-local"
    name="party-date"
    min="2025-06-01T08:30"
    max="2025-06-30T16:30" />
</form>
```

{{ EmbedLiveSample('Setting_maximum_and_minimum_dates_and_times', 600, 40) }}

Chỉ có thể chọn các ngày trong tháng 6 năm 2025. Tùy thuộc vào trình duyệt bạn đang sử dụng, các giờ ngoài các giá trị được chỉ định có thể không thể chọn. Ở các trình duyệt khác, ngày và giờ không hợp lệ có thể chọn được nhưng sẽ khớp với {{CSSXref(":invalid")}} và {{CSSXref(":out-of-range")}} và thất bại [kiểm tra hợp lệ](#validation).

Ở một số trình duyệt (Safari), bộ chọn ngày có thể xuất hiện để cho phép bất kỳ ngày nào, nhưng giá trị sẽ bị kẹp vào phạm vi hợp lệ khi ngày được chọn.

Phạm vi hợp lệ bao gồm tất cả các giờ giữa các giá trị `min` và `max`; giờ trong ngày chỉ bị ràng buộc vào ngày đầu tiên và ngày cuối cùng trong phạm vi.

> [!NOTE]
> Bạn sẽ có thể dùng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để thay đổi số ngày nhảy mỗi lần ngày được tăng (ví dụ: chỉ có thể chọn ngày thứ Bảy). Tuy nhiên, điều này dường như không hoạt động hiệu quả trong bất kỳ triển khai nào tại thời điểm viết.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho ngày và giờ (trong múi giờ địa phương), hoặc rỗng.
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
- [`<input type="date">`](/en-US/docs/Web/HTML/Reference/Elements/input/date) và [`<input type="time">`](/en-US/docs/Web/HTML/Reference/Elements/input/time)
- [Định dạng ngày và giờ dùng trong HTML](/en-US/docs/Web/HTML/Guides/Date_and_time_formats)
- [Hướng dẫn bộ chọn ngày và giờ](/en-US/docs/Learn_web_development/Extensions/Forms/HTML5_input_types#date_and_time_pickers)
