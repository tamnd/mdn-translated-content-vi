---
title: <input type="tel">
slug: Web/HTML/Reference/Elements/input/tel
page-type: html-attribute-value
browser-compat: html.elements.input.type_tel
sidebar: htmlsidebar
---

Các phần tử {{HTMLElement("input")}} kiểu **`tel`** được dùng để cho phép người dùng nhập và chỉnh sửa số điện thoại. Không giống như [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email) và [`<input type="url">`](/en-US/docs/Web/HTML/Reference/Elements/input/url), giá trị ô nhập không được tự động xác thực theo định dạng cụ thể trước khi biểu mẫu có thể được gửi, vì định dạng số điện thoại rất đa dạng trên toàn thế giới.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;tel&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<label for="phone">
  Enter your phone number:<br />
  <small>Format: 123-456-7890</small>
</label>

<input
  type="tel"
  id="phone"
  name="phone"
  pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}"
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

Mặc dù các ô nhập kiểu `tel` về mặt chức năng giống với ô nhập `text` tiêu chuẩn, nhưng chúng phục vụ các mục đích hữu ích; điều rõ ràng nhất là các trình duyệt di động—đặc biệt trên điện thoại di động—có thể hiển thị bàn phím tùy chỉnh được tối ưu hóa để nhập số điện thoại. Sử dụng loại ô nhập cụ thể cho số điện thoại cũng giúp thêm xác thực tùy chỉnh và xử lý số điện thoại thuận tiện hơn.

> [!NOTE]
> Các trình duyệt không hỗ trợ kiểu `tel` sẽ dự phòng sang ô nhập {{HTMLElement("input/text", "text")}} tiêu chuẩn.

## Giá trị

Thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của phần tử {{HTMLElement("input")}} chứa một chuỗi đại diện cho số điện thoại hoặc là chuỗi rỗng (`""`).

## Thuộc tính bổ sung

Ngoài các [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes) và các thuộc tính áp dụng cho tất cả các phần tử {{HTMLElement("input")}} bất kể kiểu, ô nhập số điện thoại hỗ trợ các thuộc tính sau.

### list

Giá trị của thuộc tính list là {{domxref("Element.id", "id")}} của một phần tử {{HTMLElement("datalist")}} nằm trong cùng tài liệu. {{HTMLElement("datalist")}} cung cấp danh sách các giá trị được xác định trước để gợi ý cho người dùng. Bất kỳ giá trị nào trong danh sách không tương thích với [`type`](/en-US/docs/Web/HTML/Reference/Elements/input#type) sẽ không được đưa vào các tùy chọn gợi ý. Các giá trị được cung cấp là gợi ý, không phải yêu cầu: người dùng có thể chọn từ danh sách này hoặc cung cấp giá trị khác.

### maxlength

Độ dài chuỗi tối đa (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường số điện thoại. Đây phải là giá trị nguyên từ 0 trở lên. Nếu không có `maxlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, trường số điện thoại không có độ dài tối đa. Giá trị này cũng phải lớn hơn hoặc bằng giá trị của `minlength`.

Ô nhập sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường lớn hơn `maxlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### minlength

Độ dài chuỗi tối thiểu (đo bằng {{glossary("UTF-16", "đơn vị mã UTF-16")}}) mà người dùng có thể nhập vào trường số điện thoại. Đây phải là giá trị nguyên không âm nhỏ hơn hoặc bằng giá trị được chỉ định bởi `maxlength`. Nếu không có `minlength` được chỉ định, hoặc một giá trị không hợp lệ được chỉ định, ô nhập số điện thoại không có độ dài tối thiểu.

Trường số điện thoại sẽ không vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) nếu độ dài văn bản nhập vào trường nhỏ hơn `minlength` {{glossary("UTF-16", "đơn vị mã UTF-16")}}. Xác thực ràng buộc chỉ được áp dụng khi giá trị được thay đổi bởi người dùng.

### pattern

Thuộc tính `pattern`, khi được chỉ định, là biểu thức chính quy mà [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value) của ô nhập phải khớp để vượt qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation). Nó phải là biểu thức chính quy JavaScript hợp lệ, như được dùng bởi kiểu {{jsxref("RegExp")}}, và được ghi lại trong [hướng dẫn biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions) của chúng ta; cờ `'u'` được chỉ định khi biên dịch biểu thức chính quy để mẫu được coi là chuỗi các điểm mã Unicode, thay vì {{Glossary("ASCII")}}. Không nên chỉ định dấu gạch chéo xung quanh văn bản mẫu.

Nếu mẫu được chỉ định không hợp lệ, không có biểu thức chính quy nào được áp dụng và thuộc tính này bị bỏ qua hoàn toàn.

> [!NOTE]
> Dùng thuộc tính [`title`](/en-US/docs/Web/HTML/Reference/Elements/input#title) để chỉ định văn bản mà hầu hết các trình duyệt sẽ hiển thị dưới dạng tooltip để giải thích các yêu cầu để khớp mẫu. Bạn cũng nên bao gồm các văn bản giải thích khác ở gần đó.

Xem [Xác thực mẫu](#pattern_validation) bên dưới để biết chi tiết và ví dụ.

### placeholder

Thuộc tính `placeholder` là một chuỗi cung cấp gợi ý ngắn gọn cho người dùng về loại thông tin cần nhập vào trường. Nó phải là một từ hoặc cụm từ ngắn thể hiện kiểu dữ liệu mong đợi, thay vì một thông báo giải thích. Văn bản _không được_ chứa ký tự xuống dòng hay dòng mới.

Nếu nội dung của điều khiển có một hướng ({{Glossary("LTR")}} hoặc {{Glossary("RTL")}}) nhưng cần hiển thị placeholder theo hướng ngược lại, bạn có thể dùng ký tự định dạng thuật toán bidirectional Unicode để ghi đè hướng trong placeholder; xem [Cách sử dụng điều khiển Unicode cho văn bản bidi](https://www.w3.org/International/questions/qa-bidi-unicode-controls) để biết thêm.

> [!NOTE]
> Hãy tránh dùng thuộc tính `placeholder` nếu có thể. Nó không có giá trị ngữ nghĩa bằng các cách khác để giải thích biểu mẫu và có thể gây ra các sự cố kỹ thuật không mong muốn với nội dung của bạn. Xem [`<input>` labels](/en-US/docs/Web/HTML/Reference/Elements/input#labels) để biết thêm thông tin.

### readonly

Thuộc tính Boolean, khi có mặt, có nghĩa là trường này không thể được chỉnh sửa bởi người dùng. Tuy nhiên, `value` của nó vẫn có thể được thay đổi bằng mã JavaScript trực tiếp đặt thuộc tính `value` của {{domxref("HTMLInputElement")}}.

> [!NOTE]
> Vì trường chỉ đọc không thể có giá trị, `required` không có tác dụng trên các ô nhập cũng có thuộc tính `readonly`.

### size

Thuộc tính `size` là giá trị số chỉ định số ký tự rộng của trường ô nhập. Giá trị phải là số lớn hơn không, và giá trị mặc định là 20. Vì độ rộng ký tự thay đổi, điều này có thể chính xác hoặc không và không nên dựa vào nó; ô nhập kết quả có thể hẹp hơn hoặc rộng hơn số ký tự được chỉ định, tùy thuộc vào ký tự và font chữ (cài đặt {{cssxref("font")}} đang được sử dụng).

Điều này _không_ đặt giới hạn về số ký tự người dùng có thể nhập vào trường. Nó chỉ chỉ định xấp xỉ bao nhiêu ký tự có thể được nhìn thấy cùng một lúc. Để đặt giới hạn trên về độ dài dữ liệu nhập, hãy dùng thuộc tính [`maxlength`](#maxlength).

## Sử dụng ô nhập tel

Số điện thoại là loại dữ liệu được thu thập rất phổ biến trên web. Khi tạo bất kỳ loại trang web đăng ký hoặc thương mại điện tử nào, ví dụ, bạn có thể cần hỏi người dùng về số điện thoại, dù cho mục đích kinh doanh hoặc liên hệ khẩn cấp. Vì số điện thoại được nhập thường xuyên, thật đáng tiếc rằng giải pháp "một cho tất cả" để xác thực số điện thoại không thực tế.

May mắn thay, bạn có thể xem xét các yêu cầu của trang web của mình và tự triển khai mức độ xác thực phù hợp. Xem [Xác thực](#validation) bên dưới để biết chi tiết.

### Bàn phím tùy chỉnh

Một trong những lợi thế chính của `<input type="tel">` là nó khiến các trình duyệt di động hiển thị bàn phím đặc biệt để nhập số điện thoại. Ví dụ, đây là giao diện bàn phím trông như thế nào trên một số thiết bị.

| Firefox cho Android                                          | WebKit iOS (Safari/Chrome/Firefox)                                  |
| ------------------------------------------------------------ | ------------------------------------------------------------------- |
| ![Ảnh chụp màn hình Firefox cho Android](fx-android-tel.png) | ![Ảnh chụp màn hình Firefox cho iOS](iphone-tel-keyboard-50pct.png) |

### Ô nhập tel cơ bản

Ở dạng cơ bản nhất, một ô nhập tel có thể được triển khai như sau:

```html
<label for="telNo">Phone number:</label>
<input id="telNo" name="telNo" type="tel" />
```

{{ EmbedLiveSample('A_basic_tel_input', 600, 40) }}

Không có gì đặc biệt ở đây. Khi được gửi đến máy chủ, dữ liệu của ô nhập trên sẽ được biểu diễn, ví dụ là `telNo=+12125553151`.

### Placeholder

Đôi khi hữu ích khi cung cấp gợi ý theo ngữ cảnh về dạng dữ liệu đầu vào cần có. Điều này đặc biệt quan trọng nếu thiết kế trang không cung cấp nhãn mô tả cho mỗi {{HTMLElement("input")}}. Đây là lúc **placeholder** phát huy tác dụng. Placeholder là giá trị thể hiện dạng mà `value` nên có bằng cách trình bày ví dụ về giá trị hợp lệ, được hiển thị bên trong hộp chỉnh sửa khi `value` của phần tử là `""`. Khi dữ liệu được nhập vào hộp, placeholder biến mất; nếu hộp được xóa trống, placeholder xuất hiện lại.

Ở đây, chúng ta có ô nhập `tel` với placeholder `123-4567-8901`. Lưu ý cách placeholder biến mất và xuất hiện lại khi bạn thao tác nội dung của trường chỉnh sửa.

```html
<input id="telNo" name="telNo" type="tel" placeholder="123-4567-8901" />
```

{{ EmbedLiveSample('Placeholders', 600, 40) }}

### Kiểm soát kích thước ô nhập

Bạn có thể kiểm soát không chỉ kích thước vật lý của hộp ô nhập, mà còn cả độ dài tối thiểu và tối đa được phép cho văn bản nhập.

#### Kích thước vật lý của phần tử ô nhập

Kích thước vật lý của hộp ô nhập có thể được kiểm soát bằng thuộc tính [`size`](/en-US/docs/Web/HTML/Reference/Elements/input#size). Với nó, bạn có thể chỉ định số ký tự mà hộp ô nhập có thể hiển thị cùng một lúc. Trong ví dụ này, hộp chỉnh sửa `tel` rộng 20 ký tự:

```html
<input id="telNo" name="telNo" type="tel" size="20" />
```

{{ EmbedLiveSample('Physical_input_element_size', 600, 40) }}

#### Độ dài giá trị phần tử

`size` tách biệt với giới hạn độ dài trên số điện thoại được nhập. Bạn có thể chỉ định độ dài tối thiểu, tính bằng ký tự, cho số điện thoại được nhập bằng thuộc tính [`minlength`](/en-US/docs/Web/HTML/Reference/Elements/input#minlength); tương tự, dùng [`maxlength`](/en-US/docs/Web/HTML/Reference/Elements/input#maxlength) để đặt độ dài tối đa của số điện thoại được nhập.

Ví dụ dưới đây tạo hộp nhập số điện thoại rộng 20 ký tự, yêu cầu nội dung không ngắn hơn 9 ký tự và không dài hơn 14 ký tự.

```html
<input
  id="telNo"
  name="telNo"
  type="tel"
  size="20"
  minlength="9"
  maxlength="14" />
```

{{EmbedLiveSample("Element_value_length", 600, 40) }}

> [!NOTE]
> Các thuộc tính trên ảnh hưởng đến [Xác thực](#validation)—các ô nhập trong ví dụ trên sẽ được coi là không hợp lệ nếu độ dài của giá trị nhỏ hơn 9 ký tự, hoặc nhiều hơn 14. Hầu hết các trình duyệt thậm chí sẽ không cho phép bạn nhập giá trị vượt quá độ dài tối đa.

### Cung cấp tùy chọn mặc định

#### Cung cấp một giá trị mặc định bằng thuộc tính value

Như thường lệ, bạn có thể cung cấp giá trị mặc định cho hộp ô nhập `tel` bằng cách đặt thuộc tính [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value):

```html
<input id="telNo" name="telNo" type="tel" value="333-4444-4444" />
```

{{EmbedLiveSample("Providing_a_single_default_using_the_value_attribute", 600, 40)}}

#### Cung cấp giá trị gợi ý

Tiến thêm một bước, bạn có thể cung cấp danh sách các giá trị số điện thoại mặc định mà người dùng có thể chọn. Để làm điều này, dùng thuộc tính [`list`](/en-US/docs/Web/HTML/Reference/Elements/input#list). Điều này không giới hạn người dùng vào những tùy chọn đó, nhưng cho phép họ chọn các số điện thoại thường dùng nhanh hơn. Điều này cũng cung cấp gợi ý cho [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete). Thuộc tính `list` chỉ định ID của phần tử {{HTMLElement("datalist")}}, lần lượt chứa một phần tử {{HTMLElement("option")}} cho mỗi giá trị gợi ý; `value` của mỗi `option` là giá trị gợi ý tương ứng cho hộp nhập số điện thoại.

```html
<label for="telNo">Phone number: </label>
<input id="telNo" name="telNo" type="tel" list="defaultTels" />

<datalist id="defaultTels">
  <option value="111-1111-1111"></option>
  <option value="122-2222-2222"></option>
  <option value="333-3333-3333"></option>
  <option value="344-4444-4444"></option>
</datalist>
```

{{EmbedLiveSample("Offering_suggested_values", 600, 40)}}

Với phần tử {{HTMLElement("datalist")}} và các {{HTMLElement("option")}} của nó, trình duyệt sẽ cung cấp các giá trị được chỉ định là các giá trị tiềm năng cho số điện thoại; điều này thường được hiển thị dưới dạng menu bật lên hoặc thả xuống chứa các gợi ý. Khi người dùng gõ, danh sách được điều chỉnh để chỉ hiển thị các giá trị khớp được lọc. Mỗi ký tự được gõ thu hẹp danh sách cho đến khi người dùng thực hiện lựa chọn hoặc gõ giá trị tùy chỉnh.

Đây là ảnh chụp màn hình về những gì có thể trông như thế này:

![Hộp ô nhập đang được tập trung với vòng tập trung màu xanh lam. Ô nhập có menu thả xuống hiển thị bốn số điện thoại mà người dùng có thể chọn.](phone-number-with-options.png)

## Xác thực

Như chúng ta đã đề cập trước đây, khá khó để cung cấp giải pháp xác thực phía máy khách cho mọi trường hợp. Vậy chúng ta có thể làm gì? Hãy xem xét một số tùy chọn.

> [!WARNING]
> Xác thực biểu mẫu HTML _không_ phải là thay thế cho các script phía máy chủ đảm bảo dữ liệu nhập có định dạng phù hợp trước khi được phép vào cơ sở dữ liệu. Rất dễ dàng để ai đó điều chỉnh HTML để vượt qua xác thực hoặc xóa nó hoàn toàn. Cũng có thể ai đó bỏ qua HTML của bạn và gửi dữ liệu trực tiếp đến máy chủ của bạn. Nếu mã phía máy chủ của bạn không xác thực dữ liệu nhận được, sẽ xảy ra thảm họa khi dữ liệu định dạng sai (hoặc quá lớn, sai loại, v.v.) được nhập vào cơ sở dữ liệu của bạn.

### Làm số điện thoại bắt buộc

Bạn có thể làm cho ô nhập rỗng không hợp lệ và không được gửi đến máy chủ bằng thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required). Ví dụ, hãy dùng HTML này:

```html
<form>
  <div>
    <label for="telNo">Enter a telephone number (required): </label>
    <input id="telNo" name="telNo" type="tel" required />
    <span class="validity"></span>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

Và hãy thêm CSS sau để đánh dấu các mục hợp lệ bằng dấu kiểm và mục không hợp lệ bằng dấu chéo:

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
  color: darkred;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
  color: #009000;
}
```

Kết quả trông như sau:

{{EmbedLiveSample("Making_telephone_numbers_required", 700, 70)}}

### Xác thực mẫu

Nếu bạn muốn hạn chế thêm các số được nhập để chúng cũng phải tuân theo một mẫu cụ thể, bạn có thể dùng thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern), nhận giá trị là {{Glossary("regular expression")}} mà các giá trị nhập phải khớp.

Trong ví dụ này chúng ta sẽ dùng cùng CSS như trước, nhưng HTML được thay đổi như sau:

```html
<form>
  <div>
    <label for="telNo">
      Enter a telephone number (in the form xxx-xxx-xxxx):
    </label>
    <input
      id="telNo"
      name="telNo"
      type="tel"
      required
      pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" />
    <span class="validity"></span>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

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
  color: darkred;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
  color: #009000;
}
```

{{EmbedLiveSample("Pattern_validation", 700, 70)}}

Lưu ý rằng giá trị nhập được báo cáo là không hợp lệ trừ khi mẫu xxx-xxx-xxxx được khớp; ví dụ, 41-323-421 sẽ không được chấp nhận. 800-MDN-ROCKS cũng không. Tuy nhiên, 865-555-6502 sẽ được chấp nhận. Mẫu cụ thể này rõ ràng chỉ hữu ích cho một số vùng địa phương nhất định—trong ứng dụng thực, bạn có thể sẽ phải thay đổi mẫu được sử dụng tùy thuộc vào vùng địa phương của người dùng.

## Ví dụ

Trong ví dụ này, chúng ta trình bày phần tử {{htmlelement("select")}} cho phép người dùng chọn quốc gia họ ở, và một tập hợp các phần tử `<input type="tel">` cho phép họ nhập từng phần của số điện thoại; không có lý do gì bạn không thể có nhiều ô nhập `tel`.

Mỗi ô nhập có thuộc tính [`placeholder`](/en-US/docs/Web/HTML/Reference/Elements/input#placeholder) để hiển thị gợi ý cho người dùng nhìn thấy về những gì cần nhập, thuộc tính [`pattern`](/en-US/docs/Web/HTML/Reference/Elements/input#pattern) để thực thi số ký tự cụ thể cho phần mong muốn, và thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) để chứa gợi ý được đọc cho người dùng trình đọc màn hình về những gì cần nhập.

```html
<form>
  <div>
    <label for="country">Choose your country:</label>
    <select id="country" name="country">
      <option>UK</option>
      <option selected>US</option>
      <option>Germany</option>
    </select>
  </div>
  <div>
    <p>Enter your telephone number:</p>
    <span class="areaDiv">
      <input
        id="areaNo"
        name="areaNo"
        type="tel"
        required
        placeholder="Area code"
        pattern="[0-9]{3}"
        aria-label="Area code" />
      <span class="validity"></span>
    </span>
    <span class="number1Div">
      <input
        id="number1"
        name="number1"
        type="tel"
        required
        placeholder="First part"
        pattern="[0-9]{3}"
        aria-label="First part of number" />
      <span class="validity"></span>
    </span>
    <span class="number2Div">
      <input
        id="number2"
        name="number2"
        type="tel"
        required
        placeholder="Second part"
        pattern="[0-9]{4}"
        aria-label="Second part of number" />
      <span class="validity"></span>
    </span>
  </div>
  <div>
    <button>Submit</button>
  </div>
</form>
```

JavaScript chứa trình xử lý sự kiện {{domxref("HTMLElement.change_event", "onchange")}}, khi giá trị `<select>` được thay đổi, sẽ cập nhật `pattern`, `placeholder` và `aria-label` của phần tử `<input>` để phù hợp với định dạng số điện thoại ở quốc gia/vùng lãnh thổ đó.

```js
const selectElem = document.querySelector("select");
const inputElems = document.querySelectorAll("input");

selectElem.onchange = () => {
  for (const e of inputElems) {
    e.value = "";
  }

  if (selectElem.value === "US") {
    inputElems[2].parentNode.style.display = "inline";

    inputElems[0].placeholder = "Area code";
    inputElems[0].pattern = "[0-9]{3}";

    inputElems[1].placeholder = "First part";
    inputElems[1].pattern = "[0-9]{3}";
    inputElems[1].setAttribute("aria-label", "First part of number");

    inputElems[2].placeholder = "Second part";
    inputElems[2].pattern = "[0-9]{4}";
    inputElems[2].setAttribute("aria-label", "Second part of number");
  } else if (selectElem.value === "UK") {
    inputElems[2].parentNode.style.display = "none";

    inputElems[0].placeholder = "Area code";
    inputElems[0].pattern = "[0-9]{3,6}";

    inputElems[1].placeholder = "Local number";
    inputElems[1].pattern = "[0-9]{4,8}";
    inputElems[1].setAttribute("aria-label", "Local number");
  } else if (selectElem.value === "Germany") {
    inputElems[2].parentNode.style.display = "inline";

    inputElems[0].placeholder = "Area code";
    inputElems[0].pattern = "[0-9]{3,5}";

    inputElems[1].placeholder = "First part";
    inputElems[1].pattern = "[0-9]{2,4}";
    inputElems[1].setAttribute("aria-label", "First part of number");

    inputElems[2].placeholder = "Second part";
    inputElems[2].pattern = "[0-9]{4}";
    inputElems[2].setAttribute("aria-label", "Second part of number");
  }
};
```

Ví dụ trông như sau:

{{EmbedLiveSample('Examples', 600, 140)}}

Đây là ý tưởng thú vị, cho thấy giải pháp tiềm năng cho vấn đề xử lý số điện thoại quốc tế. Tất nhiên bạn sẽ phải mở rộng ví dụ để cung cấp mẫu đúng cho mọi quốc gia có thể, điều đó sẽ là rất nhiều công việc, và vẫn không có đảm bảo chắc chắn rằng người dùng sẽ nhập số của họ đúng cách.

Nó khiến bạn tự hỏi liệu có đáng công làm tất cả điều này trên phía máy khách không, khi bạn có thể chỉ cần để người dùng nhập số của họ ở bất kỳ định dạng nào họ muốn trên phía máy khách rồi xác thực và làm sạch nó trên máy chủ. Nhưng lựa chọn này là của bạn.

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
  color: darkred;
}

input:valid + span::after {
  position: absolute;
  content: "✓";
  padding-left: 5px;
  color: #009000;
}
```

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho số điện thoại, hoặc rỗng
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
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#maxlength"><code>maxlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#minlength"><code>minlength</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#pattern"><code>pattern</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#placeholder"><code>placeholder</code></a>,
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#readonly"><code>readonly</code></a> và
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#size"><code>size</code></a>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <code>list</code>, <code>selectionStart</code>,
        <code>selectionEnd</code>, <code>selectionDirection</code> và
        <code>value</code>
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
        {{domxref("HTMLInputElement.setSelectionRange", "setSelectionRange()")}}
      </td>
    </tr>
    <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        không có thuộc tính <code>list</code>:
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/textbox_role">textbox</a></code><br />
        có thuộc tính <code>list</code>: <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/combobox_role">combobox</a></code>
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
  - [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text)
  - [`<input type="email">`](/en-US/docs/Web/HTML/Reference/Elements/input/email)
