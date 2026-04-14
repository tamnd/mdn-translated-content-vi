---
title: <input type="number">
slug: Web/HTML/Reference/Elements/input/number
page-type: html-attribute-value
browser-compat: html.elements.input.type_number
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} có kiểu **`number`** được dùng để cho phép người dùng nhập một số. Chúng có sẵn tính năng xác thực để từ chối các giá trị không phải số.

Trình duyệt có thể hiển thị các mũi tên tăng/giảm để người dùng thay đổi giá trị bằng chuột hoặc bằng cách chạm ngón tay.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;number&quot;&gt;", "tabbed-shorter")}}

```html interactive-example
<label for="tentacles">Number of tentacles (10-100):</label>

<input type="number" id="tentacles" name="tentacles" min="10" max="100" />
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

Trên các trình duyệt không hỗ trợ kiểu nhập `number`, ô nhập kiểu `number` sẽ dự phòng sang kiểu `text`.

## Giá trị

Một số đại diện cho giá trị số được nhập vào ô nhập. Bạn có thể đặt giá trị mặc định cho ô nhập bằng cách thêm một số vào thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value), như sau:

```html
<input id="number" type="number" value="42" />
```

{{EmbedLiveSample('Value', 600, 40)}}

## Thuộc tính bổ sung

Ngoài các thuộc tính được hỗ trợ chung cho tất cả các kiểu {{HTMLElement("input")}}, ô nhập kiểu `number` còn hỗ trợ các thuộc tính sau.

### `list`

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### `max`

Giá trị tối đa được chấp nhận cho ô nhập này. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nhập vào phần tử vượt quá giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị của thuộc tính `max` không phải là số thì phần tử không có giá trị tối đa.

Giá trị này phải lớn hơn hoặc bằng giá trị của thuộc tính `min`.

### `min`

Giá trị tối thiểu được chấp nhận cho ô nhập này. Nếu [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử nhỏ hơn giá trị này, phần tử sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nếu giá trị được chỉ định cho `min` không phải là số hợp lệ, ô nhập không có giá trị tối thiểu.

Giá trị này phải nhỏ hơn hoặc bằng giá trị của thuộc tính `max`.

### `placeholder`

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm thông tin.

### `readonly`

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### `step`

Thuộc tính `step` là một số chỉ định độ chi tiết mà giá trị phải tuân theo, hoặc giá trị đặc biệt `any`, được mô tả bên dưới. Chỉ những giá trị là bội số nguyên của step từ giá trị cơ sở mới hợp lệ. Giá trị cơ sở là [`min`](#min) nếu được chỉ định, [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) nếu không, hoặc `0` nếu không có cái nào.

Giá trị bước mặc định cho ô nhập `number` là `1`, chỉ cho phép nhập số nguyên—_trừ khi_ giá trị cơ sở không phải là số nguyên.

Giá trị chuỗi `any` có nghĩa là không có bước cụ thể nào được áp dụng và bất kỳ giá trị nào đều được phép (trừ các ràng buộc khác như [`min`](#min) và [`max`](#max)).

> [!NOTE]
> Khi dữ liệu người dùng nhập không tuân theo cấu hình bước, {{Glossary("user agent")}} có thể làm tròn đến giá trị hợp lệ gần nhất, ưu tiên các số theo hướng dương khi có hai tùy chọn gần bằng nhau.

## Sử dụng ô nhập số

Kiểu nhập `number` chỉ nên được dùng cho các số có thể tăng dần, đặc biệt khi nút tăng/giảm hữu ích cho trải nghiệm người dùng. Kiểu nhập `number` không phù hợp với các giá trị chỉ bao gồm chữ số nhưng không thực sự là số, như mã bưu chính ở nhiều quốc gia hay số thẻ tín dụng. Đối với các ô nhập không phải số, hãy cân nhắc dùng kiểu nhập khác như [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel) hoặc kiểu {{HTMLElement('input')}} khác với thuộc tính [`inputmode`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode):

```html
<input type="text" inputmode="numeric" pattern="\d*" />
```

`<input type="number">` có thể giúp đơn giản hóa công việc của bạn khi xây dựng giao diện và logic nhập số vào biểu mẫu. Khi bạn tạo ô nhập số với giá trị `type` chính xác là `number`, bạn nhận được xác thực tự động rằng văn bản nhập là số, và thường có các nút lên/xuống để thay đổi giá trị.

> [!WARNING]
> Về mặt logic, bạn không nên có thể nhập các ký tự khác số vào ô nhập số. Một số trình duyệt cho phép ký tự không hợp lệ, một số thì không; xem [Firefox bug 1398528](https://bugzil.la/1398528).

> [!NOTE]
> Người dùng có thể can thiệp vào HTML của bạn, vì vậy trang web của bạn _không được_ dùng xác thực phía máy khách cho mục đích bảo mật. Bạn _phải_ xác minh phía máy chủ bất kỳ giao dịch nào mà giá trị được cung cấp có thể có các ảnh hưởng về bảo mật.

Các trình duyệt di động còn cải thiện trải nghiệm người dùng bằng cách hiển thị bàn phím đặc biệt phù hợp hơn để nhập số khi người dùng cố nhập giá trị.

### Ô nhập số cơ bản

Ở dạng cơ bản nhất, một ô nhập số có thể được triển khai như sau:

```html
<label for="ticketNum">Number of tickets you would like to buy:</label>
<input id="ticketNum" type="number" name="ticketNum" value="0" />
```

{{EmbedLiveSample('A_basic_number_input', 600, 40)}}

Ô nhập số được coi là hợp lệ khi để trống và khi nhập một số, nhưng không hợp lệ trong các trường hợp khác. Nếu thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được dùng, ô nhập không còn được coi là hợp lệ khi để trống.

> [!NOTE]
> Bất kỳ số nào đều là giá trị chấp nhận được, miễn là nó là một [số dấu phẩy động hợp lệ](https://html.spec.whatwg.org/multipage/infrastructure.html#valid-floating-point-number) (tức là không phải [NaN](/en-US/docs/Web/JavaScript/Reference/Global_Objects/NaN) hay [Infinity](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Infinity)).

### Placeholder

Đôi khi hữu ích khi cung cấp gợi ý theo ngữ cảnh về dạng dữ liệu đầu vào cần có. Điều này đặc biệt quan trọng nếu thiết kế trang không cung cấp nhãn mô tả cho mỗi {{HTMLElement("input")}}. Đây là lúc **placeholder** phát huy tác dụng. Placeholder là giá trị thường được dùng để cung cấp gợi ý về định dạng mà `value` nên có. Nó được hiển thị bên trong hộp chỉnh sửa khi `value` của phần tử là `""`. Khi dữ liệu được nhập, placeholder biến mất; nếu hộp được xóa trống, placeholder xuất hiện lại.

Ở đây, chúng ta có ô nhập `number` với placeholder "Multiple of 10". Lưu ý cách placeholder biến mất và xuất hiện lại khi bạn thao tác nội dung của trường chỉnh sửa.

```html
<input type="number" placeholder="Multiple of 10" />
```

{{EmbedLiveSample('Placeholders', 600, 40)}}

### Kiểm soát kích thước bước

Theo mặc định, các nút lên và xuống sẽ tăng/giảm giá trị theo 1. Bạn có thể thay đổi điều này bằng cách cung cấp thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step), có giá trị là một số chỉ định lượng bước. Ví dụ trên chứa placeholder nói rằng giá trị phải là bội số của 10, vì vậy việc thêm giá trị `step` là `10` là hợp lý:

```html
<input type="number" placeholder="multiple of 10" step="10" />
```

{{EmbedLiveSample('Controlling_step_size', 600, 40)}}

Trong ví dụ này, bạn sẽ thấy rằng các mũi tên tăng/giảm sẽ tăng/giảm giá trị theo 10 mỗi lần, không phải 1. Bạn vẫn có thể nhập thủ công một số không phải bội số của 10, nhưng nó sẽ được coi là không hợp lệ.

### Chỉ định giá trị tối thiểu và tối đa

Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để chỉ định giá trị tối thiểu và tối đa mà trường có thể có. Ví dụ, hãy đặt tối thiểu là `0` và tối đa là `100`:

```html
<input type="number" placeholder="multiple of 10" step="10" min="0" max="100" />
```

{{EmbedLiveSample('Specifying_minimum_and_maximum_values', 600, 40)}}

Trong phiên bản cập nhật này, bạn sẽ thấy rằng các nút bước tăng/giảm sẽ không cho phép bạn đi xuống dưới 0 hoặc trên 100. Bạn vẫn có thể nhập thủ công số ngoài các giới hạn này, nhưng nó sẽ được coi là không hợp lệ.

### Cho phép giá trị thập phân

Một vấn đề với ô nhập số là kích thước bước mặc định là 1. Nếu bạn cố nhập số có giá trị thập phân không phải số nguyên (chẳng hạn "1.1"), nó sẽ được coi là không hợp lệ. Lưu ý rằng các giá trị như "1.0" được coi là hợp lệ vì chúng tương đương số học với số nguyên. Nếu bạn muốn nhập các giá trị có phần thập phân, bạn cần phản ánh điều này trong giá trị `step` (ví dụ `step="0.01"` để cho phép số thập phân đến hai chữ số). Đây là ví dụ cơ bản:

```html
<input type="number" placeholder="1.0" step="0.01" min="0" max="10" />
```

{{EmbedLiveSample("Allowing_decimal_values", 600, 40)}}

Bạn thấy rằng ví dụ này cho phép bất kỳ giá trị nào giữa `0.0` và `10.0`, với phần thập phân đến hai chữ số. Ví dụ, "9.52" hợp lệ, nhưng "9.521" thì không.

Nếu bạn muốn cho phép các giá trị thập phân tùy ý, bạn có thể đặt giá trị `step` thành `"any"`.

### Kiểm soát kích thước ô nhập

Các phần tử {{HTMLElement("input")}} kiểu `number` không hỗ trợ các thuộc tính kích thước biểu mẫu như [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Bạn sẽ phải dùng [CSS](/en-US/docs/Web/CSS) để thay đổi kích thước các điều khiển này.

Ví dụ, để điều chỉnh chiều rộng của ô nhập chỉ vừa đủ để nhập số ba chữ số, chúng ta có thể thay đổi HTML để thêm [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) và rút ngắn placeholder:

```html
<input
  type="number"
  placeholder="x10"
  step="10"
  min="0"
  max="100"
  id="number" />
```

Sau đó chúng ta thêm CSS để thu hẹp chiều rộng của phần tử có selector `id` là `#number`:

```css
#number {
  width: 3em;
}
```

Kết quả trông như sau:

{{EmbedLiveSample('Controlling_input_size', 600, 40)}}

### Cung cấp giá trị gợi ý

Bạn có thể cung cấp danh sách các tùy chọn mặc định để người dùng chọn bằng cách chỉ định thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list), chứa giá trị là [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) của một {{HTMLElement("datalist")}}, trong đó có một phần tử {{HTMLElement("option")}} cho mỗi giá trị gợi ý. `value` của mỗi `option` là giá trị gợi ý tương ứng cho ô nhập số.

```html
<input id="ticketNum" type="number" name="ticketNum" list="defaultNumbers" />
<span class="validity"></span>

<datalist id="defaultNumbers">
  <option value="10045678"></option>
  <option value="103421"></option>
  <option value="11111111"></option>
  <option value="12345678"></option>
  <option value="12999922"></option>
</datalist>
```

{{EmbedLiveSample("Offering_suggested_values", 600, 40)}}

## Xác thực

Chúng ta đã đề cập đến một số tính năng xác thực của ô nhập `number`, hãy xem lại chúng:

- Các phần tử `<input type="number">` tự động làm mất hiệu lực bất kỳ giá trị nào không phải số (hoặc rỗng, trừ khi `required` được chỉ định).
- Bạn có thể dùng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) để làm mất hiệu lực giá trị rỗng.
- Bạn có thể dùng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để giới hạn giá trị hợp lệ thành một tập hợp các bước (ví dụ bội số của 10).
- Bạn có thể dùng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) để giới hạn giá trị hợp lệ trong khoảng thấp hơn và cao hơn.

Ví dụ sau đây thể hiện tất cả các tính năng trên, cùng với một số CSS để hiển thị biểu tượng hợp lệ/không hợp lệ tùy theo giá trị của `input`:

```html
<form>
  <div>
    <label for="balloons">Number of balloons to order (multiples of 10):</label>
    <input
      id="balloons"
      type="number"
      name="balloons"
      step="10"
      min="0"
      max="100"
      required />
    <span class="validity"></span>
  </div>
  <div>
    <input type="submit" />
  </div>
</form>
```

{{EmbedLiveSample("Validation", 600, 110)}}

Hãy thử gửi biểu mẫu với các giá trị không hợp lệ khác nhau — ví dụ: không có giá trị; giá trị dưới 0 hoặc trên 100; giá trị không phải bội số của 10; hoặc giá trị không phải số — và xem cách các thông báo lỗi của trình duyệt khác nhau.

CSS áp dụng cho ví dụ này như sau:

```css
div {
  margin-bottom: 10px;
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

Ở đây chúng ta dùng các lớp giả {{cssxref(":invalid")}} và {{cssxref(":valid")}} để hiển thị biểu tượng không hợp lệ hoặc hợp lệ tương ứng như nội dung được tạo trên phần tử {{htmlelement("span")}} liền kề, như chỉ báo trực quan về tính hợp lệ.

Chúng ta đặt nó trên một phần tử `<span>` riêng biệt để linh hoạt hơn. Một số trình duyệt không hiển thị nội dung được tạo hiệu quả trên một số loại ô nhập biểu mẫu.

> [!WARNING]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script phía máy chủ đảm bảo rằng dữ liệu nhập có định dạng phù hợp!
>
> Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn.
>
> Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai (hoặc quá lớn, sai loại, v.v.) được gửi.

### Xác thực mẫu

Các phần tử `<input type="number">` không hỗ trợ dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để làm cho các giá trị nhập tuân theo một mẫu regex cụ thể.

Lý do là vì ô nhập số sẽ không hợp lệ nếu chứa bất cứ thứ gì ngoài số, và bạn có thể ràng buộc số lượng chữ số hợp lệ tối thiểu và tối đa bằng các thuộc tính [`min`](/en-US/docs/Web/HTML/Reference/Elements/input#min) và [`max`](/en-US/docs/Web/HTML/Reference/Elements/input#max) (như đã giải thích ở trên).

## Khả năng tiếp cận

[Vai trò](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles) ngầm định cho phần tử `<input type="number">` là [`spinbutton`](/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role). Nếu spinbutton không phải là tính năng quan trọng cho điều khiển biểu mẫu của bạn, hãy cân nhắc _không_ dùng `type="number"`. Thay vào đó, hãy dùng [`inputmode="numeric"`](/en-US/docs/Web/HTML/Reference/Global_attributes/inputmode) kết hợp với thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Attributes/pattern) giới hạn ký tự chỉ là số và các ký tự liên quan. Với `<input type="number">`, có nguy cơ người dùng vô tình tăng số khi họ đang cố làm điều gì khác. Ngoài ra, nếu người dùng cố nhập điều gì đó không phải số, không có phản hồi rõ ràng về điều họ đang làm sai.

Cũng hãy cân nhắc dùng thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Attributes/autocomplete) để giúp người dùng hoàn thành biểu mẫu nhanh hơn và ít lỗi hơn. Ví dụ, để bật tự động điền cho trường mã bưu chính, hãy đặt `autocomplete="postal-code"`.

## Ví dụ

Chúng ta đã đề cập rằng mặc định bước tăng là `1`, và bạn có thể dùng thuộc tính [`step`](/en-US/docs/Web/HTML/Reference/Elements/input#step) để cho phép nhập số thập phân. Hãy xem kỹ hơn.

Trong ví dụ sau đây là biểu mẫu nhập chiều cao của người dùng. Mặc định nhận chiều cao theo mét, nhưng bạn có thể nhấp nút liên quan để thay đổi biểu mẫu sang nhận feet và inches. Ô nhập chiều cao theo mét chấp nhận số thập phân đến hai chữ số.

{{EmbedLiveSample("Examples", 600, 150)}}

HTML trông như sau:

```html
<form>
  <div class="metersInputGroup">
    <label for="meters">Enter your height — meters:</label>
    <input
      id="meters"
      type="number"
      name="meters"
      step="0.01"
      min="0"
      placeholder="e.g. 1.78"
      required />
    <span class="validity"></span>
  </div>
  <div class="feetInputGroup">
    <span>Enter your height — </span>
    <label for="feet">feet:</label>
    <input id="feet" type="number" name="feet" min="0" step="1" />
    <span class="validity"></span>
    <label for="inches">inches:</label>
    <input id="inches" type="number" name="inches" min="0" max="11" step="1" />
    <span class="validity"></span>
  </div>
  <div>
    <input
      type="button"
      class="meters"
      value="Enter height in feet and inches" />
  </div>
  <div>
    <input type="submit" value="Submit form" />
  </div>
</form>
```

Bạn thấy chúng ta đang dùng nhiều thuộc tính đã được đề cập trong bài viết trước đó. Vì chúng ta muốn nhận giá trị mét theo đơn vị centimet, chúng ta đã đặt giá trị `step` là `0.01`, để các giá trị như _1.78_ không bị coi là không hợp lệ. Chúng ta cũng cung cấp placeholder cho ô nhập đó.

Chúng ta đã ẩn ô nhập feet và inches ban đầu bằng `style="display: none;"`, để mét là kiểu nhập mặc định.

Bây giờ, đến CSS. Điều này trông rất giống với kiểu xác thực chúng ta đã thấy trước đó; không có gì đáng chú ý ở đây.

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

Và cuối cùng, JavaScript:

```js
const metersInputGroup = document.querySelector(".metersInputGroup");
const feetInputGroup = document.querySelector(".feetInputGroup");
const metersInput = document.querySelector("#meters");
const feetInput = document.querySelector("#feet");
const inchesInput = document.querySelector("#inches");
const switchBtn = document.querySelector('input[type="button"]');

feetInputGroup.style.display = "none"; // Hide feet/inches inputs initially

switchBtn.addEventListener("click", () => {
  if (switchBtn.getAttribute("class") === "meters") {
    switchBtn.setAttribute("class", "feet");
    switchBtn.value = "Enter height in meters";

    metersInputGroup.style.display = "none";
    feetInputGroup.style.display = "block";

    feetInput.setAttribute("required", "");
    inchesInput.setAttribute("required", "");
    metersInput.removeAttribute("required");

    metersInput.value = "";
  } else {
    switchBtn.setAttribute("class", "meters");
    switchBtn.value = "Enter height in feet and inches";

    metersInputGroup.style.display = "block";
    feetInputGroup.style.display = "none";

    feetInput.removeAttribute("required");
    inchesInput.removeAttribute("required");
    metersInput.setAttribute("required", "");

    feetInput.value = "";
    inchesInput.value = "";
  }
});
```

Sau khi khai báo một vài biến, một trình lắng nghe sự kiện được thêm vào `button` để kiểm soát cơ chế chuyển đổi. Điều này liên quan đến việc thay đổi `class` của nút và {{HTMLElement("label")}}, và cập nhật các giá trị hiển thị của hai bộ ô nhập khi nút được nhấn.

(Lưu ý rằng chúng ta không chuyển đổi qua lại giữa mét và feet/inches ở đây, điều mà một ứng dụng web thực tế có thể làm.)

> [!NOTE]
> Khi người dùng nhấp vào nút, các thuộc tính `required` được xóa khỏi (các) ô nhập đang được ẩn, và làm trống thuộc tính `value`. Điều này để biểu mẫu có thể được gửi nếu cả hai bộ ô nhập không được điền đầy. Nó cũng đảm bảo biểu mẫu sẽ không gửi dữ liệu mà người dùng không có ý định.
>
> Nếu bạn không làm điều này, bạn sẽ phải điền cả feet/inches **và** mét để gửi biểu mẫu!

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>Một {{jsxref("Number")}} đại diện cho số, hoặc rỗng</td>
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
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>
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
        {{domxref("HTMLInputElement.select", "select()")}},
        {{domxref("HTMLInputElement.stepUp", "stepUp()")}},
        {{domxref("HTMLInputElement.stepDown", "stepDown()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/spinbutton_role">spinbutton</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Hướng dẫn biểu mẫu HTML](/en-US/docs/Learn_web_development/Extensions/Forms)
- {{HTMLElement("input")}}
- [`<input type="tel">`](/en-US/docs/Web/HTML/Reference/Elements/input/tel)
