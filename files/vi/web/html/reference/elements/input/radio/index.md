---
title: <input type="radio">
slug: Web/HTML/Reference/Elements/input/radio
page-type: html-attribute-value
browser-compat: html.elements.input.type_radio
sidebar: htmlsidebar
---

Các phần tử {{htmlelement("input")}} kiểu **`radio`** thường được dùng trong **nhóm radio**—tập hợp các nút radio mô tả một tập hợp các tùy chọn liên quan.

Chỉ có thể chọn một nút radio trong nhóm tại một thời điểm. Các nút radio thường được hiển thị dưới dạng các vòng tròn nhỏ, được tô đầy hoặc làm nổi bật khi được chọn.

{{InteractiveExample("HTML Demo: &lt;input type=&quot;radio&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<fieldset>
  <legend>Select a maintenance drone:</legend>

  <div>
    <input type="radio" id="huey" name="drone" value="huey" checked />
    <label for="huey">Huey</label>
  </div>

  <div>
    <input type="radio" id="dewey" name="drone" value="dewey" />
    <label for="dewey">Dewey</label>
  </div>

  <div>
    <input type="radio" id="louie" name="drone" value="louie" />
    <label for="louie">Louie</label>
  </div>
</fieldset>
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

Chúng được gọi là nút radio vì chúng trông và hoạt động tương tự như các nút nhấn trên đài radio kiểu cũ, như cái được hiển thị bên dưới.

![Cho thấy các nút radio trông như thế nào ngày xưa.](old-radio.jpg)

> [!NOTE]
> [Hộp kiểm](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) tương tự như nút radio, nhưng với một điểm khác biệt quan trọng: nút radio được thiết kế để chọn một giá trị từ một tập hợp, trong khi hộp kiểm cho phép bạn bật/tắt từng giá trị riêng lẻ. Khi có nhiều điều khiển, nút radio cho phép chọn một trong số chúng, trong khi hộp kiểm cho phép chọn nhiều giá trị.

## Giá trị

Thuộc tính `value` là chuỗi chứa giá trị của nút radio. Giá trị này không bao giờ được hiển thị cho người dùng bởi {{Glossary("user agent")}} của họ. Thay vào đó, nó được dùng để xác định nút radio nào trong nhóm được chọn.

### Định nghĩa nhóm radio

Một nhóm radio được định nghĩa bằng cách đặt cho mỗi nút radio trong nhóm cùng một [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name). Khi nhóm radio được thiết lập, việc chọn bất kỳ nút radio nào trong nhóm đó sẽ tự động bỏ chọn bất kỳ nút radio nào đang được chọn trong cùng nhóm.

Bạn có thể có nhiều nhóm radio trên trang tùy ý, miễn là mỗi nhóm có `name` duy nhất của riêng nó.

Ví dụ, nếu biểu mẫu của bạn cần hỏi người dùng về phương thức liên lạc ưa thích, bạn có thể tạo ba nút radio, mỗi nút có thuộc tính `name` được đặt thành `contact` nhưng một nút có giá trị `email`, một nút có giá trị `phone`, và một nút có giá trị `mail`. Người dùng không bao giờ thấy `value` hay `name` (trừ khi bạn thêm mã để hiển thị nó).

HTML kết quả trông như sau:

```html
<form>
  <fieldset>
    <legend>Please select your preferred contact method:</legend>
    <div>
      <input type="radio" id="contactChoice1" name="contact" value="email" />
      <label for="contactChoice1">Email</label>

      <input type="radio" id="contactChoice2" name="contact" value="phone" />
      <label for="contactChoice2">Phone</label>

      <input type="radio" id="contactChoice3" name="contact" value="mail" />
      <label for="contactChoice3">Mail</label>
    </div>
    <div>
      <button type="submit">Submit</button>
    </div>
  </fieldset>
</form>
```

Ở đây bạn thấy ba nút radio, mỗi nút có `name` được đặt thành `contact` và mỗi nút có `value` duy nhất xác định nút radio riêng lẻ đó trong nhóm. Mỗi nút cũng có {{domxref("Element.id", "id")}} duy nhất, được dùng bởi thuộc tính [`for`](/en-US/docs/Web/HTML/Reference/Elements/label#for) của phần tử {{HTMLElement("label")}} để liên kết nhãn với nút radio.

Bạn có thể thử ví dụ này ở đây:

{{EmbedLiveSample('Defining_a_radio_group', 600, 130)}}

### Biểu diễn dữ liệu của nhóm radio

Khi biểu mẫu trên được gửi với một nút radio được chọn, dữ liệu của biểu mẫu bao gồm một mục ở dạng `contact=value`. Ví dụ, nếu người dùng nhấp vào nút radio "Phone" rồi gửi biểu mẫu, dữ liệu của biểu mẫu sẽ bao gồm dòng `contact=phone`.

Nếu bạn bỏ thuộc tính `value` trong HTML, dữ liệu biểu mẫu được gửi gán giá trị `on` cho nhóm. Trong trường hợp này, nếu người dùng nhấp vào tùy chọn "Phone" và gửi biểu mẫu, dữ liệu biểu mẫu kết quả sẽ là `contact=on`, điều này không hữu ích. Vì vậy đừng quên đặt thuộc tính `value` của bạn!

> [!NOTE]
> Nếu không có nút radio nào được chọn khi biểu mẫu được gửi, nhóm radio không được bao gồm trong dữ liệu biểu mẫu được gửi vì không có giá trị nào để báo cáo.

Khá hiếm khi thực sự muốn cho phép biểu mẫu được gửi mà không có bất kỳ nút radio nào trong nhóm được chọn, vì vậy thường khôn ngoan khi có một nút mặc định ở trạng thái `checked`. Xem [Chọn nút radio theo mặc định](#selecting_a_radio_button_by_default) bên dưới.

Hãy thêm một chút mã vào ví dụ của chúng ta để có thể kiểm tra dữ liệu được tạo bởi biểu mẫu này. HTML được sửa đổi để thêm khối {{HTMLElement("pre")}} để xuất dữ liệu biểu mẫu vào:

```html
<form>
  <fieldset>
    <legend>Please select your preferred contact method:</legend>
    <div>
      <input type="radio" id="contactChoice1" name="contact" value="email" />
      <label for="contactChoice1">Email</label>
      <input type="radio" id="contactChoice2" name="contact" value="phone" />
      <label for="contactChoice2">Phone</label>
      <input type="radio" id="contactChoice3" name="contact" value="mail" />
      <label for="contactChoice3">Mail</label>
    </div>
    <div>
      <button type="submit">Submit</button>
    </div>
  </fieldset>
</form>
<pre id="log"></pre>
```

Sau đó chúng ta thêm một số [JavaScript](/en-US/docs/Web/JavaScript) để thiết lập trình lắng nghe sự kiện trên sự kiện {{domxref("HTMLFormElement/submit_event", "submit")}}, được gửi khi người dùng nhấp nút "Submit":

```js
const form = document.querySelector("form");
const log = document.querySelector("#log");

form.addEventListener("submit", (event) => {
  const data = new FormData(form);
  let output = "";
  for (const entry of data) {
    output = `${output}${entry[0]}=${entry[1]}\r`;
  }
  log.innerText = output;
  event.preventDefault();
});
```

Hãy thử ví dụ này và xem không bao giờ có nhiều hơn một kết quả cho nhóm `contact`.

{{EmbedLiveSample("Data_representation_of_a_radio_group", 600, 130)}}

## Thuộc tính bổ sung

Ngoài các thuộc tính chung được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, ô nhập `radio` hỗ trợ các thuộc tính sau.

- `checked`
  - : Thuộc tính Boolean, khi có mặt, chỉ ra rằng nút radio này là nút được chọn mặc định trong nhóm.

    Không giống các trình duyệt khác, Firefox theo mặc định [duy trì trạng thái checked động](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) của `<input>` qua các lần tải lại trang. Dùng thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) để kiểm soát tính năng này.

- `value`
  - : Thuộc tính `value` là thuộc tính mà tất cả {{HTMLElement("input")}}s chia sẻ; tuy nhiên, nó phục vụ mục đích đặc biệt cho các ô nhập kiểu `radio`: khi biểu mẫu được gửi, chỉ các nút radio hiện đang được chọn mới được gửi đến máy chủ, và giá trị được báo cáo là giá trị của thuộc tính `value`. Nếu `value` không được chỉ định khác, nó là chuỗi `on` theo mặc định. Điều này được minh họa trong phần [Giá trị](#value) ở trên.

- [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required)
  - : Thuộc tính `required` là thuộc tính mà hầu hết {{HTMLElement("input")}}s chia sẻ. Nếu bất kỳ nút radio nào trong nhóm nút radio cùng tên có thuộc tính `required`, một nút radio trong nhóm đó phải được chọn, mặc dù không nhất thiết phải là nút có thuộc tính được áp dụng.

## Sử dụng ô nhập radio

Chúng ta đã đề cập đến những kiến thức cơ bản về nút radio ở trên. Bây giờ hãy xem các tính năng và kỹ thuật liên quan đến nút radio phổ biến khác mà bạn có thể cần biết.

### Chọn nút radio theo mặc định

Để làm một nút radio được chọn theo mặc định, bạn thêm thuộc tính `checked`, như được hiển thị trong phiên bản sửa đổi này của ví dụ trước:

```html
<form>
  <fieldset>
    <legend>Please select your preferred contact method:</legend>
    <div>
      <input
        type="radio"
        id="contactChoice1"
        name="contact"
        value="email"
        checked />
      <label for="contactChoice1">Email</label>

      <input type="radio" id="contactChoice2" name="contact" value="phone" />
      <label for="contactChoice2">Phone</label>

      <input type="radio" id="contactChoice3" name="contact" value="mail" />
      <label for="contactChoice3">Mail</label>
    </div>
    <div>
      <button type="submit">Submit</button>
    </div>
  </fieldset>
</form>
```

{{EmbedLiveSample('Selecting_a_radio_button_by_default', 600, 130)}}

Trong trường hợp này, nút radio đầu tiên hiện được chọn theo mặc định.

> [!NOTE]
> Nếu bạn đặt thuộc tính `checked` trên nhiều hơn một nút radio, các phiên bản sau sẽ ghi đè các phiên bản trước; tức là, nút radio `checked` cuối cùng sẽ là nút được chọn. Điều này là vì chỉ có một nút radio trong nhóm có thể được chọn tại một thời điểm, và user agent tự động bỏ chọn các nút khác mỗi khi một nút mới được đánh dấu là checked.

### Cung cấp vùng nhấn lớn hơn cho nút radio

Trong các ví dụ trên, bạn có thể nhận thấy rằng bạn có thể chọn nút radio bằng cách nhấp vào phần tử {{htmlelement("label")}} liên quan, cũng như trên chính nút radio. Đây là tính năng thực sự hữu ích của nhãn biểu mẫu HTML giúp người dùng dễ nhấp vào tùy chọn họ muốn hơn, đặc biệt trên các thiết bị màn hình nhỏ như điện thoại thông minh.

Ngoài khả năng tiếp cận, đây là lý do chính đáng khác để thiết lập đúng các phần tử `<label>` trên biểu mẫu của bạn.

## Xác thực

Trong trường hợp nút radio có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Attributes/required) được đặt, hoặc nhóm nút radio cùng tên trong đó ít nhất một thành viên có `required` được đặt, một nút radio cần được chọn để điều khiển được coi là hợp lệ. Nếu không có nút radio nào được chọn, thuộc tính [`valueMissing`](/en-US/docs/Web/API/ValidityState/valueMissing) của đối tượng {{domxref("ValidityState")}} sẽ trả về `true` trong quá trình xác thực, và trình duyệt sẽ yêu cầu người dùng chọn một tùy chọn.

## Tạo kiểu ô nhập radio

Ví dụ sau đây là phiên bản đầy đủ hơn một chút của ví dụ chúng ta đã thấy trong bài viết, với một số kiểu dáng bổ sung và với ngữ nghĩa tốt hơn được thiết lập thông qua việc sử dụng các phần tử chuyên biệt. HTML trông như sau:

```html
<form>
  <fieldset>
    <legend>Please select your preferred contact method:</legend>
    <div>
      <input
        type="radio"
        id="contactChoice1"
        name="contact"
        value="email"
        checked />
      <label for="contactChoice1">Email</label>

      <input type="radio" id="contactChoice2" name="contact" value="phone" />
      <label for="contactChoice2">Phone</label>

      <input type="radio" id="contactChoice3" name="contact" value="mail" />
      <label for="contactChoice3">Mail</label>
    </div>
    <div>
      <button type="submit">Submit</button>
    </div>
  </fieldset>
</form>
```

CSS liên quan trong ví dụ này có phần quan trọng hơn:

```css
html {
  font-family: sans-serif;
}

div:first-of-type {
  display: flex;
  align-items: flex-start;
  margin-bottom: 5px;
}

label {
  margin-right: 15px;
  line-height: 32px;
}

input {
  appearance: none;

  border-radius: 50%;
  width: 16px;
  height: 16px;

  border: 2px solid #999999;
  transition: 0.2s all linear;
  margin-right: 5px;

  position: relative;
  top: 4px;
}

input:checked {
  border: 6px solid black;
}

button,
legend {
  color: white;
  background-color: black;
  padding: 5px 10px;
  border-radius: 0;
  border: 0;
  font-size: 14px;
}

button:hover,
button:focus {
  color: #999999;
}

button:active {
  background-color: white;
  color: black;
  outline: 1px solid black;
}
```

Đáng chú ý nhất ở đây là việc sử dụng thuộc tính {{cssxref("appearance")}} (với tiền tố cần thiết để hỗ trợ một số trình duyệt). Theo mặc định, nút radio (và [hộp kiểm](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox)) được tạo kiểu bằng các kiểu gốc của hệ điều hành cho các điều khiển đó. Bằng cách chỉ định `appearance: none`, bạn có thể xóa hoàn toàn kiểu dáng gốc và tạo kiểu dáng của riêng bạn. Ở đây chúng ta đã dùng {{cssxref("border")}} cùng với {{cssxref("border-radius")}} và {{cssxref("transition")}} để tạo ra hiệu ứng chọn radio đẹp mắt. Lưu ý cách lớp giả {{cssxref(":checked")}} được dùng để chỉ định kiểu dáng cho giao diện nút radio khi được chọn.

> [!NOTE]
> Nếu bạn muốn dùng thuộc tính {{cssxref("appearance")}}, bạn nên kiểm tra rất cẩn thận. Mặc dù nó được hỗ trợ trong hầu hết các trình duyệt hiện đại, việc triển khai của nó rất đa dạng. Trong các trình duyệt cũ hơn, ngay cả từ khóa `none` cũng không có cùng hiệu quả trên các trình duyệt khác nhau, và một số không hỗ trợ nó chút nào. Sự khác biệt nhỏ hơn trong các trình duyệt mới nhất.

{{EmbedLiveSample('Styling_radio_inputs', 600, 120)}}

Lưu ý rằng khi nhấp vào nút radio, có hiệu ứng mờ dần/mờ dần đẹp khi hai nút thay đổi trạng thái. Ngoài ra, kiểu dáng và màu sắc của legend và nút gửi được tùy chỉnh để có độ tương phản mạnh. Đây có thể không phải là giao diện bạn muốn trong ứng dụng web thực, nhưng nó chắc chắn thể hiện các khả năng.

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho giá trị của nút radio.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>{{domxref("HTMLElement/change_event", "change")}} và {{domxref("Element/input_event", "input")}}</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <code><a href="#checked">checked</a></code>,
        <code><a href="#value">value</a></code> và
        <code><a href="/en-US/docs/Web/HTML/Reference/Attributes/required">required</a></code>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td><code>checked</code> và <code>value</code></td>
    </tr>
    <tr>
      <td><strong>Giao diện DOM</strong></td>
      <td><p>{{domxref("HTMLInputElement")}}</p></td>
    </tr>
    <tr>
      <td><strong>Phương thức</strong></td>
      <td>
        {{domxref("HTMLInputElement.select", "select()")}}
      </td>
    </tr>
     <tr>
      <td><strong>Vai trò ARIA ngầm định</strong></td>
      <td>
        <code><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/radio_role">radio</a></code>
      </td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}} và giao diện {{domxref("HTMLInputElement")}} triển khai nó.
- {{domxref("RadioNodeList")}}: giao diện mô tả danh sách nút radio
