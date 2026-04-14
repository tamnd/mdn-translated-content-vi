---
title: <input type="password">
slug: Web/HTML/Reference/Elements/input/password
page-type: html-attribute-value
browser-compat: html.elements.input.type_password
sidebar: htmlsidebar
---

Các phần tử `<input>` kiểu **`password`** cung cấp cách cho người dùng nhập mật khẩu một cách an toàn.

Phần tử được hiển thị dưới dạng điều khiển trình soạn thảo văn bản thuần một dòng, trong đó văn bản bị che khuất để không thể đọc được, thường bằng cách thay thế mỗi ký tự bằng một ký hiệu như dấu hoa thị ("\*") hoặc dấu chấm ("•"). Ký tự này sẽ thay đổi tùy thuộc vào {{Glossary("user agent")}} và hệ điều hành.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;password&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<div>
  <label for="username">Username:</label>
  <input type="text" id="username" name="username" />
</div>

<div>
  <label for="pass">Password (8 characters minimum):</label>
  <input type="password" id="pass" name="password" minlength="8" required />
</div>

<input type="submit" value="Sign in" />
```

```css interactive-example
label {
  display: block;
}

input[type="submit"],
label {
  margin-top: 1rem;
}
```

Hành vi nhập chính xác có thể thay đổi từ trình duyệt này sang trình duyệt khác. Một số trình duyệt hiển thị ký tự được gõ trong một khoảnh khắc trước khi che khuất, trong khi các trình duyệt khác cho phép người dùng bật/tắt hiển thị văn bản thuần. Cả hai cách đều giúp người dùng kiểm tra rằng họ đã nhập đúng mật khẩu, điều này có thể đặc biệt khó khăn trên thiết bị di động.

> [!NOTE]
> Bất kỳ biểu mẫu nào liên quan đến thông tin nhạy cảm như mật khẩu (chẳng hạn biểu mẫu đăng nhập) phải được phục vụ qua HTTPS. Nhiều trình duyệt hiện nay triển khai các cơ chế cảnh báo về các biểu mẫu đăng nhập không an toàn.

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) chứa một chuỗi có giá trị là nội dung hiện tại của điều khiển chỉnh sửa văn bản được dùng để nhập mật khẩu. Nếu người dùng chưa nhập gì, giá trị này là chuỗi rỗng (`""`). Nếu thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được chỉ định, thì hộp nhập mật khẩu phải chứa giá trị khác chuỗi rỗng mới hợp lệ.

Nếu thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) được chỉ định, nội dung của điều khiển `password` chỉ được coi là hợp lệ nếu giá trị vượt qua xác thực; xem [Xác thực](#validation) để biết thêm thông tin.

> [!NOTE]
> Các ký tự xuống dòng (U+000A) và ký tự xuống hàng (U+000D) không được phép trong giá trị `password`. Khi đặt giá trị cho điều khiển mật khẩu, ký tự xuống dòng và xuống hàng bị loại bỏ khỏi giá trị.

## Thuộc tính bổ sung

Ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính áp dụng cho tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, ô nhập mật khẩu hỗ trợ các thuộc tính sau.

> [!NOTE]
> Thuộc tính toàn cục [`autocorrect`](/en-US/docs/Web/HTML/Reference/Global_attributes/autocorrect) có thể được thêm vào ô nhập mật khẩu, nhưng trạng thái được lưu trữ luôn là `off`.

### maxlength

Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường mật khẩu. Đây phải là giá trị nguyên từ 0 trở lên. Nếu không có `maxlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, trường mật khẩu không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### minlength

Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường nhập mật khẩu. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập mật khẩu không có độ dài tối thiểu.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường nhỏ hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### pattern

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của ô nhập phải khớp để vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được dùng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta; cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy, để mẫu được coi là chuỗi các điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này bị bỏ qua hoàn toàn.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết các trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích các yêu cầu để khớp mẫu. Bạn cũng nên bao gồm các văn bản giải thích khác ở gần đó.

Việc dùng mẫu được khuyến nghị mạnh mẽ cho ô nhập mật khẩu, nhằm giúp đảm bảo rằng mật khẩu hợp lệ sử dụng nhiều loại ký tự khác nhau được người dùng chọn và sử dụng. Với mẫu, bạn có thể yêu cầu quy tắc chữ hoa/thường, yêu cầu sử dụng một số chữ số và/hoặc ký tự dấu câu nhất định, v.v. Xem phần [Xác thực](#validation) để biết chi tiết và ví dụ.

### placeholder

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm thông tin.

### readonly

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi từ mã JavaScript trực tiếp đặt giá trị của thuộc tính {{domxref("HTMLInputElement","HTMLInputElement.value")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### size

Thuộc tính `size` là giá trị số chỉ định số ký tự rộng của trường ô nhập. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì độ rộng ký tự thay đổi, điều này có thể chính xác hoặc không và không nên dựa vào nó; ô nhập kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và font chữ (cài đặt {{cssxref("font")}} đang được sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên về độ dài dữ liệu nhập, hãy dùng thuộc tính [`maxlength`](#maxlength).

## Sử dụng ô nhập mật khẩu

Hộp nhập mật khẩu thường hoạt động giống như các hộp nhập văn bản khác; sự khác biệt chính là việc che khuất nội dung để ngăn những người gần người dùng đọc mật khẩu.

### Ô nhập mật khẩu cơ bản

Đây là ô nhập mật khẩu cơ bản nhất, với nhãn được thiết lập bằng phần tử {{HTMLElement("label")}}.

```html
<label for="userPassword">Password: </label>
<input id="userPassword" type="password" />
```

{{EmbedLiveSample("A_basic_password_input", 600, 40)}}

### Cho phép tự động hoàn thành

Để cho phép trình quản lý mật khẩu của người dùng tự động nhập mật khẩu, hãy chỉ định thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete). Đối với mật khẩu, điều này thường phải là một trong các giá trị sau:

- `on`
  - : Cho phép trình duyệt hoặc trình quản lý mật khẩu tự động điền vào trường mật khẩu. Điều này không có nhiều thông tin bằng `current-password` hoặc `new-password`.
- `off`
  - : Không cho phép trình duyệt hoặc trình quản lý mật khẩu tự động điền vào trường mật khẩu. Lưu ý rằng một số phần mềm bỏ qua giá trị này, vì nó thường gây hại cho khả năng người dùng duy trì thực hành mật khẩu an toàn.
- `current-password`
  - : Cho phép trình duyệt hoặc trình quản lý mật khẩu nhập mật khẩu hiện tại cho trang web. Điều này cung cấp nhiều thông tin hơn `on`, vì nó cho phép trình duyệt hoặc trình quản lý mật khẩu tự động nhập mật khẩu đã biết hiện tại cho trang web vào trường, nhưng không gợi ý mật khẩu mới.
- `new-password`
  - : Cho phép trình duyệt hoặc trình quản lý mật khẩu tự động nhập mật khẩu mới cho trang web; điều này được dùng trên các biểu mẫu "đổi mật khẩu" và "người dùng mới", trên trường yêu cầu người dùng nhập mật khẩu mới. Mật khẩu mới có thể được tạo theo nhiều cách, tùy thuộc vào trình quản lý mật khẩu đang sử dụng. Nó có thể điền vào mật khẩu gợi ý mới, hoặc hiển thị cho người dùng giao diện để tạo mật khẩu.

```html
<label for="userPassword">Password:</label>
<input id="userPassword" type="password" autocomplete="current-password" />
```

{{EmbedLiveSample("Allowing_autocomplete", 600, 40)}}

### Làm mật khẩu bắt buộc

Để yêu cầu trình duyệt của người dùng rằng trường mật khẩu phải có giá trị hợp lệ trước khi biểu mẫu có thể được gửi, hãy chỉ định thuộc tính Boolean [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required).

```html
<label for="userPassword">Password: </label>
<input id="userPassword" type="password" required />
<input type="submit" value="Submit" />
```

{{EmbedLiveSample("Making_the_password_mandatory", 600, 40)}}

### Chỉ định chế độ nhập

Nếu các quy tắc cú pháp mật khẩu khuyến nghị (hoặc bắt buộc) của bạn hưởng lợi từ giao diện nhập văn bản thay thế so với bàn phím tiêu chuẩn, bạn có thể dùng thuộc tính [`inputmode`](/en-US/docs/Web/HTML/Reference/Elements/input#inputmode) để yêu cầu một giao diện cụ thể. Trường hợp sử dụng rõ ràng nhất là nếu mật khẩu phải là số (chẳng hạn mã PIN). Các thiết bị di động có bàn phím ảo, ví dụ, có thể chọn chuyển sang bố cục bàn phím số thay vì bàn phím đầy đủ, để dễ nhập mật khẩu hơn. Nếu PIN dùng một lần, hãy đặt thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) thành `off` hoặc `one-time-code` để gợi ý rằng nó không được lưu.

```html
<label for="pin">PIN: </label>
<input id="pin" type="password" inputmode="numeric" />
```

{{EmbedLiveSample("Specifying_an_input_mode", 600, 40)}}

### Đặt yêu cầu độ dài

Như thường lệ, bạn có thể dùng các thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để thiết lập độ dài tối thiểu và tối đa chấp nhận được cho mật khẩu. Ví dụ này mở rộng ví dụ trước bằng cách chỉ định rằng PIN của người dùng phải có ít nhất bốn và không quá tám chữ số. Thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size) được dùng để đảm bảo điều khiển nhập mật khẩu rộng tám ký tự.

```html
<label for="pin">PIN:</label>
<input
  id="pin"
  type="password"
  inputmode="numeric"
  minlength="4"
  maxlength="8"
  size="8" />
```

{{EmbedLiveSample("Setting_length_requirements", 600, 40)}}

### Chọn văn bản

Như với các điều khiển nhập văn bản khác, bạn có thể dùng phương thức {{domxref("HTMLInputElement.select", "select()")}} để chọn tất cả văn bản trong trường mật khẩu.

#### HTML

```html
<label for="userPassword">Password: </label>
<input id="userPassword" type="password" size="12" />
<button id="selectAll">Select All</button>
```

#### JavaScript

```js
document.getElementById("selectAll").onclick = () => {
  document.getElementById("userPassword").select();
};
```

#### Kết quả

{{EmbedLiveSample("Selecting_text", 600, 40)}}

Bạn cũng có thể dùng {{domxref("HTMLInputElement.selectionStart", "selectionStart")}} và {{domxref("HTMLInputElement.selectionEnd", "selectionEnd")}} để lấy (hoặc đặt) phạm vi ký tự nào trong điều khiển đang được chọn, và {{domxref("HTMLInputElement.selectionDirection", "selectionDirection")}} để biết hướng chọn xảy ra (hoặc sẽ được mở rộng, tùy thuộc vào nền tảng của bạn; xem tài liệu của nó để biết giải thích). Tuy nhiên, do văn bản bị che khuất, tính hữu ích của chúng có phần hạn chế.

## Xác thực

Nếu ứng dụng của bạn có các hạn chế bộ ký tự hoặc bất kỳ yêu cầu nào khác cho nội dung thực tế của mật khẩu được nhập, bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để thiết lập biểu thức chính quy được dùng để tự động đảm bảo mật khẩu của bạn đáp ứng các yêu cầu đó.

Trong ví dụ này, chỉ các giá trị bao gồm ít nhất bốn và không quá tám chữ số thập lục phân mới hợp lệ.

```html
<label for="hexId">Hex ID: </label>
<input
  id="hexId"
  type="password"
  pattern="[0-9a-fA-F]{4,8}"
  title="Enter an ID consisting of 4-8 hexadecimal digits"
  autocomplete="new-password" />
```

{{EmbedLiveSample("Validation", 600, 40)}}

## Ví dụ

### Yêu cầu Số An Sinh Xã Hội

Ví dụ này chỉ chấp nhận đầu vào khớp với định dạng [Số An Sinh Xã Hội Hoa Kỳ hợp lệ](https://en.wikipedia.org/wiki/Social_Security_number#Structure). Các số này, được dùng cho mục đích thuế và nhận dạng ở Hoa Kỳ, có dạng "123-45-6789". Có nhiều quy tắc về giá trị nào được phép trong mỗi nhóm.

#### HTML

```html
<label for="ssn">SSN:</label>
<input
  type="password"
  id="ssn"
  inputmode="numeric"
  minlength="9"
  maxlength="12"
  pattern="(?!000)([0-6]\d{2}|7([0-6]\d|7[012]))([ -])?(?!00)\d\d\3(?!0000)\d{4}"
  required
  autocomplete="off" />
<br />
<label for="ssn">Value:</label>
<span id="current"></span>
```

Điều này dùng [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) giới hạn giá trị nhập thành các chuỗi đại diện cho Số An Sinh Xã Hội hợp lệ. Rõ ràng, regex này không đảm bảo SSN hợp lệ (vì chúng ta không có quyền truy cập vào cơ sở dữ liệu của Cơ quan An Sinh Xã Hội), nhưng nó đảm bảo số có thể là một số; nó thường tránh các giá trị không thể hợp lệ. Ngoài ra, nó cho phép ba nhóm chữ số được phân cách bằng dấu cách, dấu gạch ngang ("-"), hoặc không có gì.

[`inputmode`](/en-US/docs/Web/HTML/Reference/Elements/input#inputmode) được đặt thành `numeric` để khuyến khích các thiết bị có bàn phím ảo chuyển sang bố cục bàn phím số để dễ nhập hơn. [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength) và [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) được đặt lần lượt là 9 và 12, để yêu cầu giá trị có ít nhất chín và không quá 12 ký tự. Thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) được dùng để chỉ định rằng điều khiển này phải có giá trị. Cuối cùng, [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) được đặt thành `off` để tránh trình quản lý mật khẩu và tính năng khôi phục phiên cố đặt giá trị của nó, vì đây không phải là mật khẩu.

#### JavaScript

JavaScript hiển thị SSN đã nhập trên màn hình để bạn có thể xem nó. Điều này không có tác dụng của trường mật khẩu, nhưng nó giúp thử nghiệm với `pattern`.

```js
const ssn = document.getElementById("ssn");
const current = document.getElementById("current");

ssn.oninput = (event) => {
  current.textContent = ssn.value;
};
```

#### Kết quả

{{EmbedLiveSample("Requesting_a_Social_Security_number", 600, 60)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho mật khẩu, hoặc rỗng
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
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#inputmode"><code>inputmode</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#maxlength"><code>maxlength</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#minlength"><code>minlength</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#pattern"><code>pattern</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a>,
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#required"><code>required</code></a> và
         <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <code>selectionStart</code>, <code>selectionEnd</code>,
        <code>selectionDirection</code>, và <code>value</code>
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
        {{domxref("HTMLInputElement.setRangeText", "setRangeText()")}},
        và
        {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}
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
