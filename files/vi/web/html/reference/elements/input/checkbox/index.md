---
title: <input type="checkbox">
slug: Web/HTML/Reference/Elements/input/checkbox
page-type: html-attribute-value
browser-compat:
  - html.elements.input.type_checkbox
  - html.elements.input.switch
sidebar: htmlsidebar
---

Các phần tử {{htmlelement("input")}} có kiểu **`checkbox`** mặc định được hiển thị dưới dạng ô vuông được đánh dấu (tích) khi được kích hoạt, giống như bạn thấy trên các biểu mẫu giấy chính thức. Giao diện chính xác phụ thuộc vào cấu hình hệ điều hành mà trình duyệt đang chạy. Thông thường đây là ô vuông nhưng có thể có góc bo tròn. Hộp kiểm cho phép bạn chọn các giá trị đơn lẻ để gửi trong biểu mẫu (hoặc không).

{{InteractiveExample("HTML Demo: &lt;input type=&quot;checkbox&quot;&gt;", "tabbed-standard")}}

```html interactive-example
<fieldset>
  <legend>Choose your monster's features:</legend>

  <div>
    <input type="checkbox" id="scales" name="scales" checked />
    <label for="scales">Scales</label>
  </div>

  <div>
    <input type="checkbox" id="horns" name="horns" />
    <label for="horns">Horns</label>
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

> [!NOTE]
> [Nút radio](/en-US/docs/Web/HTML/Reference/Elements/input/radio) tương tự hộp kiểm, nhưng có một điểm khác biệt quan trọng — [các nút radio cùng tên](/en-US/docs/Web/HTML/Reference/Elements/input/radio#defining_a_radio_group) được nhóm lại thành một tập hợp mà chỉ có thể chọn một nút tại một thời điểm, trong khi hộp kiểm cho phép bật/tắt các giá trị đơn lẻ. Khi có nhiều điều khiển cùng tên, nút radio cho phép chọn một trong số chúng, còn hộp kiểm cho phép chọn nhiều giá trị.

## Giá trị

Một chuỗi đại diện cho giá trị của hộp kiểm. Giá trị này không hiển thị phía máy khách, nhưng trên máy chủ đây là `value` được gửi cùng với `name` của hộp kiểm. Xem ví dụ sau:

```html
<form>
  <div>
    <input
      type="checkbox"
      id="subscribeNews"
      name="subscribe"
      value="newsletter" />
    <label for="subscribeNews">Subscribe to newsletter?</label>
  </div>
  <div>
    <button type="submit">Subscribe</button>
  </div>
</form>
```

Trong ví dụ này, chúng ta có tên là `subscribe` và giá trị là `newsletter`. Khi biểu mẫu được gửi, cặp tên/giá trị sẽ là `subscribe=newsletter`.

Nếu thuộc tính `value` bị bỏ qua, giá trị mặc định của hộp kiểm là `on`, nên dữ liệu gửi đi trong trường hợp đó sẽ là `subscribe=on`.

> [!NOTE]
> Nếu hộp kiểm không được chọn khi biểu mẫu được gửi, cả tên lẫn giá trị đều không được gửi lên máy chủ. Không có phương pháp chỉ dùng HTML để biểu diễn trạng thái bỏ chọn của hộp kiểm (ví dụ: `value=unchecked`). Nếu bạn muốn gửi giá trị mặc định khi hộp kiểm không được chọn, bạn có thể dùng JavaScript để tạo một {{HTMLElement("input/hidden", '&lt;input type="hidden"&gt;')}} trong biểu mẫu với giá trị biểu thị trạng thái bỏ chọn.

## Thuộc tính bổ sung

Ngoài các [thuộc tính chung](/en-US/docs/Web/HTML/Reference/Elements/input#attributes) được chia sẻ bởi tất cả các phần tử {{HTMLElement("input")}}, đầu vào `checkbox` hỗ trợ các thuộc tính sau.

- `checked`
  - : Thuộc tính [boolean](/en-US/docs/Glossary/Boolean/HTML) cho biết liệu hộp kiểm này có được chọn mặc định không (khi trang tải). Nó _không_ cho biết liệu hộp kiểm có đang được chọn hay không: nếu trạng thái hộp kiểm thay đổi, thuộc tính nội dung này không phản ánh sự thay đổi. (Chỉ thuộc tính IDL `checked` của {{domxref("HTMLInputElement")}} mới được cập nhật.)
    > [!NOTE]
    > Không giống các điều khiển đầu vào khác, giá trị của hộp kiểm chỉ được bao gồm trong dữ liệu gửi nếu hộp kiểm đang được `checked`. Nếu có, giá trị của thuộc tính `value` của hộp kiểm được báo cáo là giá trị đầu vào, hoặc `on` nếu không có `value` nào được đặt.
    > Không giống các trình duyệt khác, Firefox mặc định [duy trì trạng thái checked động](https://stackoverflow.com/questions/5985839/bug-with-firefox-disabled-attribute-of-input-not-resetting-when-refreshing) của `<input>` giữa các lần tải trang. Dùng thuộc tính [`autocomplete`](/en-US/docs/Web/HTML/Reference/Elements/input#autocomplete) để kiểm soát tính năng này.

- `value`
  - : Thuộc tính `value` là thuộc tính chung của tất cả {{HTMLElement("input")}}; tuy nhiên nó có mục đích đặc biệt với kiểu `checkbox`: khi biểu mẫu được gửi, chỉ các hộp kiểm đang được chọn mới được gửi lên máy chủ, và giá trị báo cáo là giá trị của thuộc tính `value`. Nếu `value` không được chỉ định, mặc định là chuỗi `on`. Điều này được trình bày trong phần [Giá trị](#value) ở trên.

- `switch`
  - : Thuộc tính [boolean](/en-US/docs/Glossary/Boolean/HTML) chỉ áp dụng cho đầu vào `checkbox`. Khi có mặt, nó cho biết `checkbox` đại diện cho công tắc bật/tắt thay vì hộp kiểm thông thường. Nó thay đổi giao diện của điều khiển `checkbox`, nhưng hành vi bên dưới vẫn giống như hộp kiểm thông thường.

    > [!NOTE]
    > Thuộc tính này cho phép các user agent hiển thị ngữ nghĩa ARIA `switch` cho công nghệ hỗ trợ — mà không yêu cầu tài liệu phải chỉ định rõ `role="switch"`. Đánh dấu và API tương tự như hộp kiểm, ngoại trừ pseudo-class `:indeterminate` không bao giờ khớp.

    > [!WARNING]
    > Thuộc tính này vẫn còn thử nghiệm và có hỗ trợ trình duyệt hạn chế. Thuộc tính bị bỏ qua trên các trình duyệt không hỗ trợ.

## Sử dụng đầu vào checkbox

Chúng ta đã đề cập đến cách sử dụng cơ bản nhất của hộp kiểm ở trên. Bây giờ hãy xem các tính năng và kỹ thuật liên quan đến hộp kiểm phổ biến khác mà bạn cần biết.

### Xử lý nhiều hộp kiểm

Ví dụ chúng ta thấy ở trên chỉ chứa một hộp kiểm; trong thực tế bạn có thể gặp nhiều hộp kiểm. Nếu chúng hoàn toàn không liên quan, bạn có thể xử lý chúng riêng biệt như đã thấy ở trên. Tuy nhiên, nếu chúng có liên quan với nhau thì mọi thứ không đơn giản như vậy.

Ví dụ, trong bản demo sau chúng ta bao gồm nhiều hộp kiểm để người dùng chọn sở thích (xem phiên bản đầy đủ trong phần [Ví dụ](#examples)).

```html
<fieldset>
  <legend>Choose your interests</legend>
  <div>
    <input type="checkbox" id="coding" name="interest" value="coding" />
    <label for="coding">Coding</label>
  </div>
  <div>
    <input type="checkbox" id="music" name="interest" value="music" />
    <label for="music">Music</label>
  </div>
</fieldset>
```

{{EmbedLiveSample('Handling_multiple_checkboxes', 600, 100)}}

Trong ví dụ này, chúng ta đặt cùng `name` cho mỗi hộp kiểm. Nếu cả hai hộp kiểm được chọn và biểu mẫu được gửi, bạn sẽ nhận được chuỗi cặp tên/giá trị như: `interest=coding&interest=music`. Khi chuỗi này đến máy chủ, bạn cần phân tích nó khác với mảng kết hợp, để tất cả các giá trị của `interest` đều được lấy, không chỉ giá trị cuối cùng.

### Chọn hộp kiểm mặc định

Để làm cho hộp kiểm được chọn mặc định, bạn đặt thuộc tính `checked`. Xem ví dụ dưới đây:

```html
<fieldset>
  <legend>Choose your interests</legend>
  <div>
    <input type="checkbox" id="coding" name="interest" value="coding" checked />
    <label for="coding">Coding</label>
  </div>
  <div>
    <input type="checkbox" id="music" name="interest" value="music" />
    <label for="music">Music</label>
  </div>
</fieldset>
```

{{EmbedLiveSample('Checking_boxes_by_default', 600, 100)}}

### Công tắc dạng hộp kiểm

Ví dụ sau đây cho thấy cách làm cho hộp kiểm trông và hoạt động như công tắc bật/tắt.

```html
<form>
  <fieldset>
    <legend>Adjust your setting</legend>
    <div>
      <label for="theme">Dark mode</label>
      <input type="checkbox" name="theme" id="theme" switch checked />
    </div>
    <div>
      <label for="notifications">Notifications</label>
      <input type="checkbox" name="notifications" id="notifications" switch />
    </div>
    <button type="submit">Submit</button>
  </fieldset>
</form>
```

> [!NOTE]
> Mặc dù chỉ một số trình duyệt hiển thị hộp kiểm dưới dạng công tắc, hành vi vẫn giống nhau trên tất cả trình duyệt.

{{EmbedLiveSample('Switch_as_a_checkbox', 600, 100)}}

### Cung cấp vùng nhấn lớn hơn cho hộp kiểm

Trong các ví dụ trên, bạn có thể nhận thấy rằng bạn có thể chuyển trạng thái hộp kiểm bằng cách nhấn vào phần tử {{htmlelement("label")}} liên kết cũng như trên chính hộp kiểm. Đây là tính năng rất hữu ích của nhãn biểu mẫu HTML giúp dễ nhấn vào tùy chọn mong muốn, đặc biệt trên thiết bị màn hình nhỏ như điện thoại thông minh.

Ngoài khả năng tiếp cận, đây là lý do tốt để thiết lập đúng các phần tử `<label>` trong biểu mẫu.

### Hộp kiểm ở trạng thái không xác định

Hộp kiểm có thể ở trạng thái **không xác định** (indeterminate). Trạng thái này được đặt thông qua thuộc tính [`indeterminate`](/en-US/docs/Web/API/HTMLInputElement/indeterminate) của đối tượng {{domxref("HTMLInputElement")}} qua JavaScript (không thể đặt bằng thuộc tính HTML):

```js
inputInstance.indeterminate = true;
```

Khi `indeterminate` là `true`, hộp kiểm có một đường ngang trong ô (trông giống như dấu gạch ngang hoặc dấu trừ) thay vì dấu tích trong hầu hết trình duyệt.

> [!NOTE]
> Đây chỉ là thay đổi hình thức. Nó không ảnh hưởng đến việc liệu `value` của hộp kiểm có được sử dụng trong lần gửi biểu mẫu hay không. Điều đó được quyết định bởi trạng thái `checked`, bất kể trạng thái `indeterminate`.

Có không nhiều trường hợp sử dụng cho thuộc tính này. Phổ biến nhất là khi có một hộp kiểm "sở hữu" một số tùy chọn con (cũng là hộp kiểm). Nếu tất cả tùy chọn con được chọn, hộp kiểm cha cũng được chọn, và nếu tất cả không được chọn, hộp kiểm cha không được chọn. Nếu một hoặc nhiều tùy chọn con có trạng thái khác với những cái còn lại, hộp kiểm cha ở trạng thái không xác định.

Điều này có thể thấy trong ví dụ dưới đây (cảm ơn [CSS Tricks](https://css-tricks.com/indeterminate-checkboxes/) vì nguồn cảm hứng). Trong ví dụ này chúng ta theo dõi các nguyên liệu đang thu thập cho một công thức. Khi bạn chọn hoặc bỏ chọn hộp kiểm của một nguyên liệu, hàm JavaScript kiểm tra tổng số nguyên liệu được chọn:

- Nếu không có nguyên liệu nào được chọn, hộp kiểm tên công thức được đặt thành không chọn.
- Nếu một hoặc hai nguyên liệu được chọn, hộp kiểm tên công thức được đặt thành `indeterminate`.
- Nếu cả ba nguyên liệu được chọn, hộp kiểm tên công thức được đặt thành `checked`.

Vì vậy trong trường hợp này trạng thái `indeterminate` được dùng để cho biết rằng việc thu thập nguyên liệu đã bắt đầu, nhưng công thức chưa hoàn chỉnh.

```js live-sample___indeterminate_state
const overall = document.querySelector("#enchantment");
const ingredients = document.querySelectorAll("ul input");

overall.addEventListener("click", (e) => {
  e.preventDefault();
});

for (const ingredient of ingredients) {
  ingredient.addEventListener("click", updateDisplay);
}

function updateDisplay() {
  let checkedCount = 0;
  for (const ingredient of ingredients) {
    if (ingredient.checked) {
      checkedCount++;
    }
  }

  if (checkedCount === 0) {
    overall.checked = false;
    overall.indeterminate = false;
  } else if (checkedCount === ingredients.length) {
    overall.checked = true;
    overall.indeterminate = false;
  } else {
    overall.checked = false;
    overall.indeterminate = true;
  }
}
```

```html live-sample___indeterminate_state
<form>
  <fieldset>
    <legend>Complete the recipe</legend>
    <div>
      <input type="checkbox" id="enchantment" name="enchantment" />
      <label for="enchantment">Enchantment table</label>
      <ul>
        <li>
          <input type="checkbox" id="book" name="ingredient" value="book" />
          <label for="book">Book</label>
        </li>
        <li>
          <input
            type="checkbox"
            id="diamonds"
            name="ingredient"
            value="diamonds" />
          <label for="diamonds">Diamonds (x2)</label>
        </li>
        <li>
          <input
            type="checkbox"
            id="obsidian"
            name="ingredient"
            value="obsidian" />
          <label for="obsidian">Obsidian (x4)</label>
        </li>
      </ul>
    </div>
  </fieldset>
</form>
```

{{EmbedLiveSample("indeterminate_state", "", 200)}}

## Kiểm tra hợp lệ

Hộp kiểm có hỗ trợ [kiểm tra hợp lệ](/en-US/docs/Web/HTML/Guides/Constraint_validation) (cung cấp cho tất cả {{HTMLElement("input")}}). Tuy nhiên, hầu hết {{domxref("ValidityState")}} sẽ luôn là `false`. Nếu hộp kiểm có thuộc tính [`required`](/en-US/docs/Web/HTML/Reference/Elements/input#required) nhưng không được chọn, thì {{domxref("ValidityState.valueMissing")}} sẽ là `true`.

## Ví dụ

Ví dụ sau là phiên bản mở rộng của ví dụ "nhiều hộp kiểm" chúng ta thấy ở trên — có nhiều tùy chọn hơn, cộng với hộp kiểm "other" khi được chọn sẽ hiện một trường văn bản để nhập giá trị cho tùy chọn "other". Điều này được thực hiện bằng một đoạn JavaScript ngắn. Ví dụ bao gồm nhãn ẩn, với `<input>` trực tiếp bên trong `<label>`. Đầu vào văn bản, không có nhãn hiển thị, bao gồm thuộc tính [`aria-label`](/en-US/docs/Web/Accessibility/ARIA/Reference/Attributes/aria-label) cung cấp tên tiếp cận. Ví dụ này cũng bao gồm một số CSS để cải thiện kiểu dáng.

### HTML

```html
<form>
  <fieldset>
    <legend>Choose your interests</legend>
    <div>
      <label>
        <input type="checkbox" id="coding" name="interest" value="coding" />
        Coding
      </label>
    </div>
    <div>
      <label>
        <input type="checkbox" id="music" name="interest" value="music" />
        Music
      </label>
    </div>
    <div>
      <label>
        <input type="checkbox" id="art" name="interest" value="art" />
        Art
      </label>
    </div>
    <div>
      <label>
        <input type="checkbox" id="sports" name="interest" value="sports" />
        Sports
      </label>
    </div>
    <div>
      <label>
        <input type="checkbox" id="cooking" name="interest" value="cooking" />
        Cooking
      </label>
    </div>
    <div>
      <label>
        <input type="checkbox" id="other" name="interest" value="other" />
        Other
      </label>
      <input
        type="text"
        id="otherValue"
        name="other"
        aria-label="Other interest" />
    </div>
    <div>
      <button type="submit">Submit form</button>
    </div>
  </fieldset>
</form>
```

### CSS

```css
html {
  font-family: sans-serif;
}

form {
  width: 600px;
  margin: 0 auto;
}

div {
  margin-bottom: 10px;
}

fieldset {
  background: cyan;
  border: 5px solid blue;
}

legend {
  padding: 10px;
  background: blue;
  color: cyan;
}
```

### JavaScript

```js
const otherCheckbox = document.querySelector("#other");
const otherText = document.querySelector("#otherValue");
otherText.style.visibility = "hidden";

otherCheckbox.addEventListener("change", () => {
  if (otherCheckbox.checked) {
    otherText.style.visibility = "visible";
    otherText.value = "";
  } else {
    otherText.style.visibility = "hidden";
  }
});
```

{{EmbedLiveSample('Examples', '100%', 300)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <td><strong><a href="#value">Giá trị</a></strong></td>
      <td>
        Một chuỗi đại diện cho giá trị của hộp kiểm.
      </td>
    </tr>
    <tr>
      <td><strong>Sự kiện</strong></td>
      <td>{{domxref("HTMLElement/change_event", "change")}} và {{domxref("Element/input_event", "input")}}</td>
    </tr>
    <tr>
      <td><strong>Thuộc tính chung được hỗ trợ</strong></td>
      <td>
        <code><a href="#checked">checked</a></code> và
        <code><a href="#switch">switch</a></code>
      </td>
    </tr>
    <tr>
      <td><strong>Thuộc tính IDL</strong></td>
      <td>
        <code><a href="/en-US/docs/Web/API/HTMLInputElement/checked">checked</a></code>,
        <code><a href="/en-US/docs/Web/API/HTMLInputElement/indeterminate">indeterminate</a></code> và
        <code><a href="/en-US/docs/Web/API/HTMLInputElement/value">value</a></code>
      </td>
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
      <td><a href="/en-US/docs/Web/Accessibility/ARIA/Reference/Roles/checkbox_role"><code>checkbox</code></a></td>
    </tr>
  </tbody>
</table>

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref(":checked")}}, {{cssxref(":indeterminate")}}: Bộ chọn CSS cho phép tạo kiểu cho hộp kiểm dựa trên trạng thái hiện tại của chúng
- {{domxref("HTMLInputElement")}}: HTML DOM API thực thi phần tử `<input>`
