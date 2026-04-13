---
title: CustomStateSet
slug: Web/API/CustomStateSet
page-type: web-api-interface
browser-compat: api.CustomStateSet
---

{{APIRef("Web Components")}}

Giao diện **`CustomStateSet`** của [Document Object Model](/en-US/docs/Web/API/Document_Object_Model) lưu trữ danh sách các trạng thái cho một [phần tử tùy chỉnh tự trị](/en-US/docs/Web/API/Web_components/Using_custom_elements#types_of_custom_element), và cho phép thêm hoặc xóa các trạng thái khỏi tập hợp.

Giao diện này có thể được sử dụng để hiển thị các trạng thái nội bộ của một phần tử tùy chỉnh, cho phép sử dụng chúng trong các bộ chọn CSS bởi code sử dụng phần tử đó.

## Thuộc tính phiên bản

- {{domxref("CustomStateSet.size")}}
  - : Trả về số lượng giá trị trong `CustomStateSet`.

## Phương thức phiên bản

- {{domxref("CustomStateSet.add()")}}
  - : Thêm một giá trị vào tập hợp.
- {{domxref("CustomStateSet.clear()")}}
  - : Xóa tất cả phần tử khỏi đối tượng `CustomStateSet`.
- {{domxref("CustomStateSet.delete()")}}
  - : Xóa một giá trị khỏi đối tượng `CustomStateSet`.
- {{domxref("CustomStateSet.entries()")}}
  - : Trả về một iterator mới chứa các giá trị cho mỗi phần tử trong `CustomStateSet` theo thứ tự chèn vào.
- {{domxref("CustomStateSet.forEach()")}}
  - : Thực thi hàm được cung cấp cho mỗi giá trị trong đối tượng `CustomStateSet`.
- {{domxref("CustomStateSet.has()")}}
  - : Trả về {{jsxref("Boolean")}} xác nhận xem phần tử có mặt với giá trị đã cho hay không.
- {{domxref("CustomStateSet.keys()")}}
  - : Tên gọi khác của {{domxref("CustomStateSet.values()")}}.
- {{domxref("CustomStateSet.values()")}}
  - : Trả về một đối tượng iterator mới tạo ra các giá trị cho mỗi phần tử trong đối tượng `CustomStateSet` theo thứ tự chèn vào.

## Mô tả

Các phần tử HTML tích hợp có thể có các _trạng thái_ khác nhau, chẳng hạn như "enabled" và "disabled", "checked" và "unchecked", "initial", "loading" và "ready".
Một số trạng thái này là công khai và có thể được đặt hoặc truy vấn bằng thuộc tính/attribute, trong khi các trạng thái khác là nội bộ và không thể đặt trực tiếp.
Dù là bên ngoài hay bên trong, các trạng thái phần tử thường có thể được chọn và tạo kiểu bằng [CSS pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) làm bộ chọn.

`CustomStateSet` cho phép các nhà phát triển thêm và xóa trạng thái cho các phần tử tùy chỉnh tự trị (nhưng không phải các phần tử dẫn xuất từ phần tử tích hợp).
Các trạng thái này sau đó có thể được sử dụng làm bộ chọn pseudo-class trạng thái tùy chỉnh tương tự như các pseudo-class cho phần tử tích hợp.

### Đặt trạng thái phần tử tùy chỉnh

Để `CustomStateSet` có sẵn, một phần tử tùy chỉnh trước tiên phải gọi {{domxref("HTMLElement.attachInternals()")}} để gắn đối tượng {{domxref("ElementInternals")}}.
`CustomStateSet` sau đó được trả về bởi {{domxref("ElementInternals.states")}}.
Lưu ý rằng `ElementInternals` không thể gắn vào phần tử tùy chỉnh dựa trên phần tử tích hợp, vì vậy tính năng này chỉ hoạt động cho các phần tử tùy chỉnh tự trị (xem [github.com/whatwg/html/issues/5166](https://github.com/whatwg/html/issues/5166)).

Phiên bản `CustomStateSet` là một [đối tượng giống `Set`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Set#set-like_browser_apis) có thể giữ một tập hợp có thứ tự các giá trị trạng thái.
Mỗi giá trị là một định danh tùy chỉnh.
Các định danh có thể được thêm vào tập hợp hoặc xóa khỏi tập hợp.
Nếu một định danh có trong tập hợp thì trạng thái cụ thể đó là `true`, còn nếu bị xóa thì trạng thái đó là `false`.

Các phần tử tùy chỉnh có trạng thái với nhiều hơn hai giá trị có thể biểu diễn chúng bằng nhiều trạng thái boolean, trong đó chỉ một trạng thái là `true` (có trong `CustomStateSet`) tại một thời điểm.

Các trạng thái có thể được sử dụng trong phần tử tùy chỉnh nhưng không thể truy cập trực tiếp bên ngoài thành phần tùy chỉnh.

### Tương tác với CSS

Bạn có thể chọn một phần tử tùy chỉnh đang ở một trạng thái cụ thể bằng cách sử dụng _pseudo-class trạng thái tùy chỉnh_ {{cssxref(":state()")}}.
Định dạng của pseudo-class này là `:state(my-state-name)`, trong đó `my-state-name` là trạng thái được định nghĩa trong phần tử.
Pseudo-class trạng thái tùy chỉnh chỉ khớp với phần tử tùy chỉnh nếu trạng thái là `true` (tức là nếu `my-state-name` có trong `CustomStateSet`).

Ví dụ, CSS sau khớp với phần tử tùy chỉnh `labeled-checkbox` khi `CustomStateSet` của phần tử chứa trạng thái `checked`, và áp dụng border `solid` cho checkbox:

```css
labeled-checkbox:state(checked) {
  border: solid;
}
```

CSS cũng có thể được dùng để khớp trạng thái tùy chỉnh [trong shadow DOM của phần tử tùy chỉnh](/en-US/docs/Web/CSS/Reference/Selectors/:state#matching_a_custom_state_in_a_custom_elements_shadow_dom) bằng cách chỉ định `:state()` trong hàm pseudo-class {{cssxref(":host()")}}.

Ngoài ra, pseudo-class `:state()` có thể được dùng sau pseudo-element {{cssxref("::part()")}} để khớp với [shadow part](/en-US/docs/Web/CSS/Guides/Shadow_parts) của phần tử tùy chỉnh đang ở một trạng thái cụ thể.

> [!WARNING]
> Các trình duyệt chưa hỗ trợ {{cssxref(":state()")}} sẽ sử dụng `<dashed-ident>` CSS để chọn các trạng thái tùy chỉnh, và cú pháp này hiện đã lỗi thời.
> Để biết cách hỗ trợ cả hai cách tiếp cận, hãy xem phần [Tương thích với cú pháp `<dashed-ident>`](#compatibility_with_dashed-ident_syntax) bên dưới.

## Ví dụ

### Khớp trạng thái tùy chỉnh của phần tử checkbox tùy chỉnh

Ví dụ này, được điều chỉnh từ thông số kỹ thuật, minh họa một phần tử checkbox tùy chỉnh có trạng thái nội bộ "checked".
Trạng thái này được ánh xạ đến trạng thái tùy chỉnh `checked`, cho phép áp dụng kiểu dáng bằng pseudo-class trạng thái tùy chỉnh `:state(checked)`.

#### JavaScript

Đầu tiên chúng ta định nghĩa lớp `LabeledCheckbox` kế thừa từ `HTMLElement`.
Trong hàm khởi tạo, chúng ta gọi phương thức `super()`, thêm listener cho sự kiện click, và gọi {{domxref("HTMLElement.attachInternals()", "this.attachInternals()")}} để gắn một đối tượng {{domxref("ElementInternals", "ElementInternals")}}.

Phần lớn công việc còn lại được để lại cho `connectedCallback()`, được gọi khi phần tử tùy chỉnh được thêm vào trang.
Nội dung của phần tử được định nghĩa bằng phần tử `<style>` hiển thị văn bản `[]` hoặc `[x]` theo sau bởi nhãn.
Điểm đáng chú ý ở đây là pseudo-class trạng thái tùy chỉnh được sử dụng để chọn văn bản cần hiển thị: `:host(:state(checked))`.

```js
class LabeledCheckbox extends HTMLElement {
  constructor() {
    super();
    this._boundOnClick = this._onClick.bind(this);
    this.addEventListener("click", this._boundOnClick);

    // Attach an ElementInternals to get states property
    this._internals = this.attachInternals();
  }

  connectedCallback() {
    const shadowRoot = this.attachShadow({ mode: "open" });
    shadowRoot.innerHTML = `<style>
  :host {
    display: block;
  }
  :host::before {
    content: "[ ]";
    white-space: pre;
    font-family: monospace;
  }
  :host(:state(checked))::before {
    content: "[x]";
  }
</style>
<slot>Label</slot>
`;
  }

  get checked() {
    return this._internals.states.has("checked");
  }

  set checked(flag) {
    if (flag) {
      this._internals.states.add("checked");
    } else {
      this._internals.states.delete("checked");
    }
  }

  _onClick(event) {
    // Toggle the 'checked' property when the element is clicked
    this.checked = !this.checked;
  }

  static isStateSyntaxSupported() {
    return CSS.supports("selector(:state(checked))");
  }
}

customElements.define("labeled-checkbox", LabeledCheckbox);

// Display a warning to unsupported browsers
if (!LabeledCheckbox.isStateSyntaxSupported()) {
  if (!document.getElementById("state-warning")) {
    const warning = document.createElement("div");
    warning.id = "state-warning";
    warning.style.color = "red";
    warning.textContent = "This feature is not supported by your browser.";
    document.body.insertBefore(warning, document.body.firstChild);
  }
}
```

Trong lớp `LabeledCheckbox`:

- Trong `get checked()` và `set checked()` chúng ta sử dụng `ElementInternals.states` để lấy `CustomStateSet`.
- Phương thức `set checked(flag)` thêm định danh `"checked"` vào `CustomStateSet` nếu flag được đặt và xóa định danh nếu flag là `false`.
- Phương thức `get checked()` chỉ kiểm tra xem thuộc tính `checked` có được định nghĩa trong tập hợp hay không.
- Giá trị thuộc tính được bật/tắt khi phần tử được click.

Sau đó chúng ta gọi phương thức {{domxref("CustomElementRegistry/define", "define()")}} trên đối tượng trả về bởi {{domxref("Window.customElements")}} để đăng ký phần tử tùy chỉnh:

```js
customElements.define("labeled-checkbox", LabeledCheckbox);
```

#### HTML

Sau khi đăng ký phần tử tùy chỉnh, chúng ta có thể sử dụng phần tử trong HTML như sau:

```html
<labeled-checkbox>You need to check this</labeled-checkbox>
```

#### CSS

Cuối cùng chúng ta sử dụng pseudo-class trạng thái tùy chỉnh `:state(checked)` để chọn CSS khi checkbox được tích.

```css
labeled-checkbox {
  border: dashed red;
}
labeled-checkbox:state(checked) {
  border: solid;
}
```

#### Kết quả

Click vào phần tử để thấy border khác nhau được áp dụng khi trạng thái `checked` của checkbox được bật/tắt.

{{EmbedLiveSample("Labeled Checkbox", "100%", 50)}}

### Khớp trạng thái tùy chỉnh trong shadow part của phần tử tùy chỉnh

Ví dụ này, được điều chỉnh từ thông số kỹ thuật, minh họa rằng các trạng thái tùy chỉnh có thể được dùng để nhắm vào [shadow part](/en-US/docs/Web/CSS/Guides/Shadow_parts) của phần tử tùy chỉnh để tạo kiểu.
Shadow part là các phần của shadow tree được hiển thị có chủ đích cho các trang sử dụng phần tử tùy chỉnh.

Ví dụ tạo ra phần tử tùy chỉnh `<question-box>` hiển thị một câu hỏi kèm theo checkbox có nhãn "Yes".
Phần tử sử dụng `<labeled-checkbox>` được định nghĩa trong [ví dụ trước](#matching_the_custom_state_of_a_custom_checkbox_element) cho checkbox.

#### JavaScript

```js hidden
class LabeledCheckbox extends HTMLElement {
  constructor() {
    super();
    this._boundOnClick = this._onClick.bind(this);
    this.addEventListener("click", this._boundOnClick);

    // Attach an ElementInternals to get states property
    this._internals = this.attachInternals();
  }

  connectedCallback() {
    const shadowRoot = this.attachShadow({ mode: "open" });
    shadowRoot.innerHTML = `<style>
  :host {
    display: block;
  }
  :host::before {
    content: "[ ]";
    white-space: pre;
    font-family: monospace;
  }
  :host(:state(checked))::before {
    content: "[x]";
  }
</style>
<slot>Label</slot>
`;
  }

  get checked() {
    return this._internals.states.has("checked");
  }

  set checked(flag) {
    if (flag) {
      this._internals.states.add("checked");
    } else {
      this._internals.states.delete("checked");
    }
  }

  _onClick(event) {
    // Toggle the 'checked' property when the element is clicked
    this.checked = !this.checked;
  }

  static isStateSyntaxSupported() {
    return CSS.supports("selector(:state(checked))");
  }
}

customElements.define("labeled-checkbox", LabeledCheckbox);

if (!LabeledCheckbox.isStateSyntaxSupported()) {
  if (!document.getElementById("state-warning")) {
    const warning = document.createElement("div");
    warning.id = "state-warning";
    warning.style.color = "red";
    warning.textContent = "This feature is not supported by your browser.";
    document.body.insertBefore(warning, document.body.firstChild);
  }
}
```

Đầu tiên, chúng ta định nghĩa lớp phần tử tùy chỉnh `QuestionBox`, kế thừa từ `HTMLElement`.
Như thường lệ, hàm khởi tạo trước tiên gọi phương thức `super()`.
Tiếp theo, chúng ta gắn một shadow DOM tree vào phần tử tùy chỉnh bằng cách gọi [`attachShadow()`](/en-US/docs/Web/API/Element/attachShadow).

```js
class QuestionBox extends HTMLElement {
  constructor() {
    super();
    const shadowRoot = this.attachShadow({ mode: "open" });
    shadowRoot.innerHTML = `<div><slot>Question</slot></div>
<labeled-checkbox part="checkbox">Yes</labeled-checkbox>
`;
  }
}
```

Nội dung của shadow root được đặt bằng [`innerHTML`](/en-US/docs/Web/API/ShadowRoot/innerHTML).
Điều này định nghĩa một phần tử {{HTMLElement("slot")}} chứa văn bản nhắc mặc định "Question" cho phần tử.
Sau đó chúng ta định nghĩa một phần tử tùy chỉnh `<labeled-checkbox>` với văn bản mặc định `"Yes"`.
Checkbox này được hiển thị như một shadow part của question box với tên `checkbox` bằng thuộc tính [`part`](/en-US/docs/Web/HTML/Reference/Global_attributes/part).

Lưu ý rằng code và kiểu dáng cho phần tử `<labeled-checkbox>` hoàn toàn giống như trong [ví dụ trước](#matching_the_custom_state_of_a_custom_checkbox_element), và do đó không được lặp lại ở đây.

Tiếp theo, chúng ta gọi phương thức {{domxref("CustomElementRegistry/define", "define()")}} trên đối tượng trả về bởi {{domxref("Window.customElements")}} để đăng ký phần tử tùy chỉnh với tên `question-box`:

```js
customElements.define("question-box", QuestionBox);
```

#### HTML

Sau khi đăng ký phần tử tùy chỉnh, chúng ta có thể sử dụng phần tử trong HTML như sau.

```html
<!-- Question box with default prompt "Question" -->
<question-box></question-box>

<!-- Question box with custom prompt "Continue?" -->
<question-box>Continue?</question-box>
```

#### CSS

Khối CSS đầu tiên khớp với shadow part được hiển thị có tên `checkbox` bằng bộ chọn {{cssxref("::part()")}}, tạo kiểu màu `red` theo mặc định.

```css
question-box::part(checkbox) {
  color: red;
}
```

Khối thứ hai theo `::part()` với `:state()`, để khớp với các `checkbox` part đang ở trạng thái `checked`:

```css
question-box::part(checkbox):state(checked) {
  color: green;
  outline: dashed 1px green;
}
```

#### Kết quả

Click vào bất kỳ checkbox nào để thấy màu thay đổi từ `red` sang `green` với đường viền khi trạng thái `checked` bật.

{{EmbedLiveSample("Question box", "100%", 100)}}

### Trạng thái nội bộ không phải boolean

Ví dụ này cho thấy cách xử lý trường hợp phần tử tùy chỉnh có thuộc tính nội bộ với nhiều giá trị có thể.

Phần tử tùy chỉnh trong trường hợp này có thuộc tính `state` với các giá trị cho phép: "loading", "interactive" và "complete".
Để thực hiện điều này, chúng ta ánh xạ mỗi giá trị đến trạng thái tùy chỉnh của nó và tạo code để đảm bảo chỉ có định danh tương ứng với trạng thái nội bộ được đặt.
Bạn có thể thấy điều này trong triển khai của phương thức `set state()`: chúng ta đặt trạng thái nội bộ, thêm định danh cho trạng thái tùy chỉnh khớp vào `CustomStateSet`, và xóa các định danh liên quan đến tất cả các giá trị khác.

#### JavaScript

```js
class ManyStateElement extends HTMLElement {
  constructor() {
    super();
    this._boundOnClick = this._onClick.bind(this);
    this.addEventListener("click", this._boundOnClick);
    // Attach an ElementInternals to get states property
    this._internals = this.attachInternals();
  }

  connectedCallback() {
    this.state = "loading";

    const shadowRoot = this.attachShadow({ mode: "open" });
    shadowRoot.innerHTML = `<style>
  :host {
    display: block;
    font-family: monospace;
  }
  :host::before {
    content: "[ unknown ]";
    white-space: pre;
  }
  :host(:state(loading))::before {
    content: "[ loading ]";
  }
  :host(:state(interactive))::before {
    content: "[ interactive ]";
  }
  :host(:state(complete))::before {
    content: "[ complete ]";
  }
</style>
<slot>Click me</slot>
`;
  }

  get state() {
    return this._state;
  }

  set state(stateName) {
    // Set internal state to passed value
    // Add identifier matching state and delete others
    if (stateName === "loading") {
      this._state = "loading";
      this._internals.states.add("loading");
      this._internals.states.delete("interactive");
      this._internals.states.delete("complete");
    } else if (stateName === "interactive") {
      this._state = "interactive";
      this._internals.states.delete("loading");
      this._internals.states.add("interactive");
      this._internals.states.delete("complete");
    } else if (stateName === "complete") {
      this._state = "complete";
      this._internals.states.delete("loading");
      this._internals.states.delete("interactive");
      this._internals.states.add("complete");
    }
  }

  _onClick(event) {
    // Cycle the state when element clicked
    if (this.state === "loading") {
      this.state = "interactive";
    } else if (this.state === "interactive") {
      this.state = "complete";
    } else if (this.state === "complete") {
      this.state = "loading";
    }
  }

  static isStateSyntaxSupported() {
    return CSS.supports("selector(:state(loading))");
  }
}

customElements.define("many-state-element", ManyStateElement);

if (!LabeledCheckbox.isStateSyntaxSupported()) {
  if (!document.getElementById("state-warning")) {
    const warning = document.createElement("div");
    warning.id = "state-warning";
    warning.style.color = "red";
    warning.textContent = "This feature is not supported by your browser.";
    document.body.insertBefore(warning, document.body.firstChild);
  }
}
```

#### HTML

Sau khi đăng ký phần tử mới, chúng ta thêm nó vào HTML.
Điều này tương tự như ví dụ minh họa trạng thái boolean đơn, ngoại trừ chúng ta không chỉ định giá trị và sử dụng giá trị mặc định từ slot (`<slot>Click me</slot>`).

```html
<many-state-element></many-state-element>
```

#### CSS

Trong CSS chúng ta sử dụng ba pseudo-class trạng thái tùy chỉnh để chọn CSS cho mỗi giá trị trạng thái nội bộ: `:state(loading)`, `:state(interactive)`, `:state(complete)`.
Lưu ý rằng code phần tử tùy chỉnh đảm bảo chỉ một trong các trạng thái tùy chỉnh này có thể được định nghĩa tại một thời điểm.

```css
many-state-element:state(loading) {
  border: dotted grey;
}
many-state-element:state(interactive) {
  border: dashed blue;
}
many-state-element:state(complete) {
  border: solid green;
}
```

#### Kết quả

Click vào phần tử để thấy border khác nhau được áp dụng khi trạng thái thay đổi.

{{EmbedLiveSample("Non-boolean internal states", "100%", 50)}}

## Tương thích với cú pháp `<dashed-ident>`

Trước đây, các phần tử tùy chỉnh có trạng thái tùy chỉnh được chọn bằng `<dashed-ident>` thay vì hàm {{cssxref(":state()")}}.
Các phiên bản trình duyệt không hỗ trợ `:state()` sẽ ném ra lỗi khi nhận được ident không có tiền tố gạch đôi.
Nếu cần hỗ trợ các trình duyệt này, hãy sử dụng khối [try...catch](/en-US/docs/Web/JavaScript/Reference/Statements/try...catch) để hỗ trợ cả hai cú pháp, hoặc sử dụng `<dashed-ident>` làm giá trị trạng thái và chọn nó bằng cả bộ chọn CSS `:--my-state` và `:state(--my-state)`.

### Sử dụng khối try...catch

Code này cho thấy cách dùng `try...catch` để cố gắng thêm định danh trạng thái không sử dụng `<dashed-ident>`, và fallback sang `<dashed-ident>` nếu có lỗi xảy ra.

#### JavaScript

```js
class CompatibleStateElement extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
  }

  connectedCallback() {
    // The double dash is required in browsers with the
    // legacy syntax, not supplying it will throw
    try {
      this._internals.states.add("loaded");
    } catch {
      this._internals.states.add("--loaded");
    }
  }
}
```

#### CSS

```css
compatible-state-element:is(:--loaded, :state(loaded)) {
  border: solid green;
}
```

### Sử dụng định danh có tiền tố gạch đôi

Một giải pháp thay thế là sử dụng `<dashed-ident>` trong JavaScript.
Nhược điểm của cách này là các dấu gạch phải được đưa vào khi sử dụng cú pháp CSS `:state()`.

#### JavaScript

```js
class CompatibleStateElement extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
  }
  connectedCallback() {
    // The double dash is required in browsers with the
    // legacy syntax, but works with the modern syntax
    this._internals.states.add("--loaded");
  }
}
```

#### CSS

```css
compatible-state-element:is(:--loaded, :state(--loaded)) {
  border: solid green;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

[Sử dụng phần tử tùy chỉnh](/en-US/docs/Web/API/Web_components/Using_custom_elements)
