---
title: <input type="range">
slug: Web/HTML/Reference/Elements/input/range
page-type: html-attribute-value
browser-compat: html.elements.input.type_range
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`range`** cho phép người dùng chỉ định một giá trị số không nhỏ hơn một giá trị nhất định và không lớn hơn một giá trị khác. Tuy nhiên, giá trị chính xác không được coi là quan trọng. Thông thường điều này được biểu diễn bằng điều khiển thanh trượt hoặc núm xoay thay vì hộp nhập văn bản như kiểu ô nhập {{HTMLElement('input/number', 'number')}}.

Vì loại widget này không chính xác, nó chỉ nên được dùng khi giá trị chính xác của điều khiển không quan trọng.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;range&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<p>Audio settings:</p>

<div>
  <input type="range" id="volume" name="volume" min="0" max="11" />
  <label for="volume">Volume</label>
</div>

<div>
  <input
    type="range"
    id="cowbell"
    name="cowbell"
    min="0"
    max="100"
    value="90"
    step="10" />
  <label for="cowbell">Cowbell</label>
</div>
```

```css interactive-example
p,
label {
  font:
    1rem "Fira Sans",
    sans-serif;
}

input {
  margin: 0.4rem;
}
```

Nếu trình duyệt của người dùng không hỗ trợ kiểu `range`, nó sẽ dự phòng và coi nó là ô nhập `{{HTMLElement('input/text', 'text')}}`.

## Giá trị

Giá trị của phần tử `<input type="range">` được đặt bằng thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) chấp nhận một chuỗi đại diện cho số được chọn. Giá trị không bao giờ là chuỗi rỗng (`""`). Giá trị mặc định là điểm giữa giữa tối thiểu và tối đa được chỉ định—trừ khi giá trị tối đa thực sự nhỏ hơn tối thiểu, trong trường hợp đó giá trị mặc định được đặt thành giá trị của thuộc tính `min`. Thuật toán xác định giá trị mặc định là:

```js
defaultValue =
  rangeElem.max < rangeElem.min
    ? rangeElem.min
    : rangeElem.min + (rangeElem.max - rangeElem.min) / 2;
```

Nếu cố đặt giá trị thấp hơn tối thiểu, nó được đặt thành tối thiểu. Tương tự, cố đặt giá trị cao hơn tối đa sẽ dẫn đến việc đặt nó thành tối đa.

### Xác thực

Không có xác thực mẫu nào; tuy nhiên, các hình thức xác thực tự động sau đây được thực hiện:

- Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) được đặt thành giá trị không thể chuyển đổi thành số dấu phẩy động hợp lệ, xác thực sẽ thất bại vì ô nhập đang gặp phải đầu vào xấu.
- Giá trị sẽ không nhỏ hơn [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min). Mặc định là 0.
- Giá trị sẽ không lớn hơn [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max). Mặc định là 100.
- Giá trị sẽ là bội số của [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step). Mặc định là 1.

## Thuộc tính bổ sung

Ngoài các thuộc tính được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, ô nhập range còn cung cấp các thuộc tính sau.

> [!NOTE]
> Các thuộc tính ô nhập sau không áp dụng cho ô nhập range: `accept`, `alt`, `checked`, `dirname`, `formaction`, `formenctype`, `formmethod`, `formnovalidate`, `formtarget`, `height`, `maxlength`, `minlength`, `multiple`, `pattern`, `placeholder`, `readonly`, `required`, `size`, và `src`. Bất kỳ thuộc tính nào trong số này, nếu được bao gồm, sẽ bị bỏ qua.

### list

Giá trị của thuộc tính `list` là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

Xem ví dụ [thêm dấu tích](#adding_tick_marks) bên dưới để biết ví dụ về cách các tùy chọn trên range được biểu thị trong các trình duyệt được hỗ trợ.

### max

Giá trị lớn nhất trong phạm vi các giá trị được phép. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử vượt quá giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max) không phải là số thì phần tử không có giá trị tối đa.

Giá trị này phải lớn hơn hoặc bằng giá trị của thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min). Xem thuộc tính HTML [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max).

### min

Giá trị thấp nhất trong phạm vi các giá trị được phép. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử nhỏ hơn giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị được chỉ định cho `min` không phải là số hợp lệ, ô nhập không có giá trị tối thiểu.

Giá trị này phải nhỏ hơn hoặc bằng giá trị của thuộc tính [`max`](/en-US/docs/Web/HTML/Reference/Attributes/max). Xem thuộc tính HTML [`min`](/en-US/docs/Web/HTML/Reference/Attributes/min).

> [!NOTE]
> Nếu giá trị `min` và `max` bằng nhau hoặc giá trị `max` thấp hơn giá trị `min`, người dùng sẽ không thể tương tác với range.

### step

Thuộc tính `step` là số chỉ định độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ những giá trị là bội số nguyên của step từ giá trị cơ sở mới hợp lệ. Giá trị cơ sở là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` nếu không có cái nào.

Giá trị bước mặc định cho ô nhập `step` là `1`, chỉ cho phép nhập số nguyên—_trừ khi_ giá trị cơ sở không phải là số nguyên.

Giá trị chuỗi `any` có nghĩa là không có bước cụ thể nào được áp dụng và bất kỳ giá trị nào đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)). Xem ví dụ [Đặt step thành giá trị `any`](#setting_step_to_any) để biết cách điều này hoạt động trong các trình duyệt được hỗ trợ.

> [!NOTE]
> Khi giá trị người dùng nhập không tuân theo cấu hình bước, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên làm tròn lên khi có hai tùy chọn gần bằng nhau.

## Thuộc tính không chuẩn

### orient

Tương tự thuộc tính CSS không chuẩn -moz-orient ảnh hưởng đến các phần tử {{htmlelement('progress')}} và {{htmlelement('meter')}}, thuộc tính `orient` xác định hướng của thanh trượt range. Các giá trị bao gồm `horizontal`, nghĩa là range được hiển thị theo chiều ngang, và `vertical`, trong đó range được hiển thị theo chiều dọc.

## Ví dụ

Trong khi kiểu `number` cho phép người dùng nhập số với các ràng buộc tùy chọn để buộc giá trị của họ nằm giữa tối thiểu và tối đa, nó yêu cầu họ nhập một giá trị cụ thể. Kiểu ô nhập `range` cho phép bạn hỏi người dùng về một giá trị trong các trường hợp người dùng có thể không quan tâm—hoặc không biết—giá trị số cụ thể được chọn là gì.

Một vài ví dụ về tình huống mà ô nhập range thường được dùng:

- Các điều khiển âm thanh như âm lượng và cân bằng, hoặc các điều khiển bộ lọc.
- Các điều khiển cấu hình màu như kênh màu, độ trong suốt, độ sáng, v.v.
- Các điều khiển cấu hình trò chơi như độ khó, khoảng cách nhìn, kích thước thế giới, v.v.
- Độ dài mật khẩu cho mật khẩu được tạo bởi trình quản lý mật khẩu.

Theo quy tắc, nếu người dùng có nhiều khả năng quan tâm đến phần trăm khoảng cách giữa giá trị tối thiểu và tối đa hơn là số thực tế, một ô nhập range là ứng viên tuyệt vời. Ví dụ, trong trường hợp điều khiển âm lượng hệ thống âm thanh gia đình, người dùng thường nghĩ "đặt âm lượng ở giữa tối đa" thay vì "đặt âm lượng thành 0.5".

### Chỉ định tối thiểu và tối đa

Theo mặc định, tối thiểu là 0 và tối đa là 100. Nếu đó không phải là điều bạn muốn, bạn có thể dễ dàng chỉ định các giới hạn khác bằng cách thay đổi giá trị của các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và/hoặc [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max). Chúng có thể là bất kỳ giá trị dấu phẩy động nào.

Ví dụ, để yêu cầu người dùng nhập giá trị từ -10 đến 10, bạn có thể dùng:

```html
<input type="range" min="-10" max="10" />
```

{{EmbedLiveSample("Specifying_the_minimum_and_maximum", 600, 40)}}

### Đặt độ chi tiết của giá trị

Theo mặc định, độ chi tiết là 1, nghĩa là giá trị luôn là số nguyên. Để kiểm soát độ chi tiết, bạn có thể thay đổi thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step). Ví dụ, nếu bạn cần giá trị nằm giữa 5 và 10, bạn nên đặt giá trị `step` thành 0.5:

#### Đặt thuộc tính step

```html
<input type="range" min="5" max="10" step="0.5" />
```

{{EmbedLiveSample("Setting_the_step_attribute", 600, 40)}}

#### Đặt step thành `any`

Nếu bạn muốn chấp nhận bất kỳ giá trị nào bất kể có bao nhiêu chữ số thập phân, bạn có thể chỉ định giá trị `any` cho thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step):

##### HTML

```html
<input id="pi_input" type="range" min="0" max="3.14" step="any" />
<p>Value: <output id="value"></output></p>
```

##### JavaScript

```js
const value = document.querySelector("#value");
const input = document.querySelector("#pi_input");
value.textContent = input.value;
input.addEventListener("input", (event) => {
  value.textContent = event.target.value;
});
```

{{EmbedLiveSample("Setting_step_to_any", 600, 75)}}

Ví dụ này cho phép người dùng chọn bất kỳ giá trị nào từ 0 đến π mà không có bất kỳ hạn chế nào về phần thập phân của giá trị được chọn. JavaScript được dùng để hiển thị giá trị thay đổi như thế nào khi người dùng tương tác với range.

### Thêm dấu tích

Để thêm dấu tích vào điều khiển range, hãy thêm thuộc tính `list`, cung cấp `id` của phần tử {{HTMLElement("datalist")}} định nghĩa một loạt dấu tích trên điều khiển. Mỗi điểm được biểu diễn bằng phần tử {{HTMLElement("option")}} với [`value`](/en-US/docs/Web/HTML/Reference/Elements/option#value) được đặt thành giá trị range mà tại đó cần vẽ dấu.

#### HTML

```html
<label for="temp">Choose a comfortable temperature:</label><br />
<input type="range" id="temp" name="temp" list="markers" />

<datalist id="markers">
  <option value="0"></option>
  <option value="25"></option>
  <option value="50"></option>
  <option value="75"></option>
  <option value="100"></option>
</datalist>
```

#### Kết quả

{{EmbedLiveSample("Adding tick marks", 600, 50)}}

### Dùng cùng datalist cho nhiều điều khiển range

Để giúp bạn không phải lặp mã, bạn có thể tái sử dụng cùng một {{HTMLElement("datalist")}} cho nhiều phần tử `<input type="range">`, và các kiểu {{HTMLElement("input")}} khác.

> [!NOTE]
> Nếu bạn cũng muốn [hiển thị nhãn](#adding_labels) như trong ví dụ bên dưới, bạn sẽ cần một `datalist` cho mỗi ô nhập range.

#### HTML

```html
<p>
  <label for="temp1">Temperature for room 1:</label>
  <input type="range" id="temp1" name="temp1" list="values" />
</p>
<p>
  <label for="temp2">Temperature for room 2:</label>
  <input type="range" id="temp2" name="temp2" list="values" />
</p>

<p>
  <label for="temp3">Temperature for room 3:</label>
  <input type="range" id="temp3" name="temp3" list="values" />
</p>

<datalist id="values">
  <option value="0" label="0"></option>
  <option value="25" label="25"></option>
  <option value="50" label="50"></option>
  <option value="75" label="75"></option>
  <option value="100" label="100"></option>
</datalist>
```

#### Kết quả

{{EmbedLiveSample("Using the same datalist for multiple range controls")}}

### Thêm nhãn

Bạn có thể gán nhãn cho các dấu tích bằng cách đặt thuộc tính `label` cho các phần tử `<option>`. Tuy nhiên, nội dung nhãn sẽ không được hiển thị theo mặc định. Bạn có thể dùng CSS để hiển thị nhãn và định vị chúng đúng cách. Đây là một cách bạn có thể làm điều này.

#### HTML

```html
<label for="tempB">Choose a comfortable temperature:</label><br />
<input type="range" id="tempB" name="temp" list="values" />

<datalist id="values">
  <option value="0" label="very cold!"></option>
  <option value="25" label="cool"></option>
  <option value="50" label="medium"></option>
  <option value="75" label="getting warm!"></option>
  <option value="100" label="hot!"></option>
</datalist>
```

#### CSS

```css
datalist {
  display: flex;
  flex-direction: column;
  justify-content: space-between;
  writing-mode: vertical-lr;
  width: 200px;
}

option {
  padding: 0;
}

input[type="range"] {
  width: 200px;
  margin: 0;
}
```

#### Kết quả

{{EmbedLiveSample("Adding labels")}}

### Tạo điều khiển range dọc

Theo mặc định, các trình duyệt hiển thị ô nhập range dưới dạng thanh trượt với núm trượt sang trái và phải.

Để tạo range dọc trong đó núm trượt lên xuống, hãy đặt thuộc tính {{cssxref("writing-mode")}} với giá trị `vertical-rl` hoặc `vertical-lr`:

```html hidden
<input type="range" min="0" max="10" value="8" />
```

```css
input[type="range"] {
  writing-mode: vertical-lr;
}
```

Điều này làm cho thanh trượt range hiển thị theo chiều dọc:

{{EmbedLiveSample("Creating vertical range controls", 200, 200)}}

Bạn cũng có thể đặt thuộc tính CSS {{cssxref('appearance')}} thành giá trị không chuẩn `slider-vertical` nếu bạn muốn hỗ trợ các phiên bản Chrome và Safari cũ hơn, và thêm thuộc tính không chuẩn `orient="vertical"` để hỗ trợ các phiên bản Firefox cũ hơn.

Xem [Tạo điều khiển biểu mẫu dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls) để biết các ví dụ.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi chứa biểu diễn chuỗi của giá trị số được chọn; dùng
        {{domxref("HTMLInputElement.valueAsNumber", "valueAsNumber")}}
        để lấy giá trị dưới dạng số.
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
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#max"><code>max</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#min"><code>min</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#step"><code>step</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#list"><code>list</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#value"><code>value</code></a>,
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
        {{domxref("HTMLInputElement.stepDown", "stepDown()")}}
        và {{domxref("HTMLInputElement.stepUp", "stepUp()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/slider_role">slider</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} nó dựa trên
- [`<input type="number">`](/en-US/docs/Web/HTML/Reference/Elements/input/number)
- {{domxref('validityState.rangeOverflow')}} và {{domxref('validityState.rangeUnderflow')}}
- [Kiểm soát nhiều tham số với ConstantSourceNode](/en-US/docs/Web/API/Web_Audio_API/Controlling_multiple_parameters_with_ConstantSourceNode)
- [Tạo điều khiển biểu mẫu dọc](/en-US/docs/Web/CSS/Guides/Writing_modes/Vertical_controls)
- [Tạo kiểu phần tử range](https://css-tricks.com/sliding-nightmare-understanding-range-input/)
