---
title: Using custom elements
slug: Web/API/Web_components/Using_custom_elements
page-type: guide
---

{{DefaultAPISidebar("Web Components")}}

Một trong những tính năng chính của web component là khả năng tạo _custom element_: tức là các phần tử HTML có hành vi do nhà phát triển web định nghĩa, mở rộng tập hợp phần tử có sẵn trong trình duyệt.

Bài viết này giới thiệu custom elements và đi qua một số ví dụ.

## Các kiểu custom element

Có hai kiểu custom element:

- **Autonomous custom elements** kế thừa từ class cơ sở của phần tử HTML là {{domxref("HTMLElement")}}. Bạn phải tự triển khai hành vi của chúng từ đầu.

- **Customized built-in elements** kế thừa từ các phần tử HTML chuẩn như {{domxref("HTMLImageElement")}} hoặc {{domxref("HTMLParagraphElement")}}. Việc triển khai của chúng mở rộng hành vi của một số thể hiện chọn lọc của phần tử chuẩn.

  > [!NOTE]
  > Safari không có kế hoạch hỗ trợ customized built-in elements. Xem thêm [`is` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/is) để biết thêm thông tin.

Với cả hai kiểu custom element, các bước cơ bản để tạo và dùng chúng là giống nhau:

- Trước hết bạn [triển khai hành vi của nó](#implementing_a_custom_element) bằng cách định nghĩa một JavaScript class.
- Sau đó bạn [đăng ký custom element](#registering_a_custom_element) cho trang hiện tại. Bạn cũng có thể tạo [scoped registries](#scoped_custom_element_registries) để giới hạn định nghĩa trong một DOM subtree cụ thể.
- Cuối cùng, bạn có thể [dùng custom element](#using_a_custom_element) trong HTML hoặc JavaScript của mình.

## Triển khai một custom element

Custom element được triển khai dưới dạng một [class](/en-US/docs/Web/JavaScript/Reference/Classes) mở rộng {{domxref("HTMLElement")}} (đối với autonomous elements) hoặc interface mà bạn muốn tùy biến (đối với customized built-in elements). Class này sẽ không được bạn gọi trực tiếp, mà được trình duyệt gọi. Ngay sau khi định nghĩa class, bạn nên [đăng ký](#registering_a_custom_element) custom element, để có thể tạo thể hiện của nó bằng các thực hành DOM chuẩn, như viết phần tử trong HTML markup, gọi {{domxref("document.createElement()")}}, v.v.

Dưới đây là triển khai của một custom element tối thiểu, tùy biến phần tử {{HTMLElement("p")}}:

```js
class WordCount extends HTMLParagraphElement {
  constructor() {
    super();
  }
  // Chức năng của phần tử được viết ở đây
}
```

Dưới đây là triển khai của một autonomous custom element tối thiểu:

```js
class PopupInfo extends HTMLElement {
  constructor() {
    super();
  }
  // Chức năng của phần tử được viết ở đây
}
```

Trong [constructor](/en-US/docs/Web/JavaScript/Reference/Classes/constructor) của class, bạn có thể thiết lập trạng thái ban đầu và giá trị mặc định, đăng ký event listener và có thể tạo một shadow root. Ở thời điểm này, bạn không nên kiểm tra các thuộc tính hoặc phần tử con của phần tử, cũng như không nên thêm thuộc tính hay phần tử con mới. Xem [Requirements for custom element constructors and reactions](https://html.spec.whatwg.org/multipage/custom-elements.html#custom-element-conformance) để biết đầy đủ các yêu cầu.

### Lifecycle callback của custom element

Khi custom element của bạn đã được đăng ký, trình duyệt sẽ gọi một số phương thức của class khi mã trong trang tương tác với custom element theo những cách nhất định. Bằng cách triển khai các phương thức này, mà đặc tả gọi là _lifecycle callbacks_, bạn có thể chạy mã để phản hồi các sự kiện đó.

Các lifecycle callback của custom element bao gồm:

- `connectedCallback()`: Được gọi mỗi khi phần tử được thêm vào tài liệu. Đặc tả khuyến nghị rằng, nếu có thể, nhà phát triển nên triển khai phần thiết lập custom element trong callback này thay vì trong constructor.
- `disconnectedCallback()`: Được gọi mỗi khi phần tử bị xóa khỏi tài liệu.
- `connectedMoveCallback()`: Khi được định nghĩa, callback này được gọi _thay cho_ `connectedCallback()` và `disconnectedCallback()` mỗi khi phần tử được di chuyển sang vị trí khác trong DOM qua {{domxref("Element.moveBefore()")}}. Dùng cách này để tránh chạy mã khởi tạo/dọn dẹp trong `connectedCallback()` và `disconnectedCallback()` khi phần tử thực ra không được thêm vào hay xóa khỏi DOM. Xem [Lifecycle callbacks and state-preserving moves](#lifecycle_callbacks_and_state-preserving_moves) để biết thêm chi tiết.
- `adoptedCallback()`: Được gọi mỗi khi phần tử được chuyển sang tài liệu mới.
- `attributeChangedCallback()`: Được gọi khi các thuộc tính bị thay đổi, thêm, xóa hoặc thay thế. Xem [Responding to attribute changes](#responding_to_attribute_changes) để biết thêm về callback này.

Dưới đây là một custom element tối thiểu ghi lại các sự kiện lifecycle này:

```js
// Tạo một class cho phần tử
class MyCustomElement extends HTMLElement {
  static observedAttributes = ["color", "size"];

  constructor() {
    // Luôn gọi super trước trong constructor
    super();
  }

  connectedCallback() {
    console.log("Custom element đã được thêm vào trang.");
  }

  disconnectedCallback() {
    console.log("Custom element đã bị xóa khỏi trang.");
  }

  connectedMoveCallback() {
    console.log("Custom element được di chuyển bằng moveBefore()");
  }

  adoptedCallback() {
    console.log("Custom element được chuyển sang trang mới.");
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(`Thuộc tính ${name} đã thay đổi.`);
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

#### Lifecycle callbacks và các lần di chuyển giữ nguyên trạng thái

Vị trí của một custom element trong DOM có thể được thao tác giống như bất kỳ phần tử HTML nào khác, nhưng có các tác động phụ ở lifecycle cần cân nhắc.

Mỗi khi một custom element được di chuyển (qua các phương thức như {{domxref("Element.moveBefore()")}} hoặc {{domxref("Node.insertBefore()")}}), các lifecycle callback `disconnectedCallback()` và `connectedCallback()` sẽ được kích hoạt, vì phần tử bị ngắt kết nối rồi kết nối lại với DOM.

Điều này có thể đúng với ý định của bạn. Tuy nhiên, vì các callback này thường được dùng để triển khai mọi mã khởi tạo hoặc dọn dẹp cần thiết ở đầu hoặc cuối lifecycle của phần tử, việc chạy chúng khi phần tử được di chuyển (thay vì bị xóa hoặc chèn) có thể gây ra vấn đề với trạng thái của nó. Ví dụ, bạn có thể vô tình xóa dữ liệu đã lưu mà phần tử vẫn cần.

Nếu muốn giữ nguyên trạng thái của phần tử, bạn có thể làm vậy bằng cách định nghĩa lifecycle callback `connectedMoveCallback()` bên trong class của phần tử, rồi dùng phương thức {{domxref("Element.moveBefore()")}} để di chuyển phần tử (thay vì các phương thức tương tự như {{domxref("Node.insertBefore()")}}). Cách này khiến `connectedMoveCallback()` chạy thay cho `connectedCallback()` và `disconnectedCallback()`.

Bạn có thể thêm một `connectedMoveCallback()` rỗng để ngăn hai callback còn lại chạy, hoặc thêm logic riêng để xử lý việc di chuyển:

```js
class MyComponent {
  // ...
  connectedMoveCallback() {
    console.log("Custom logic xử lý di chuyển ở đây.");
  }
  // ...
}
```

## Đăng ký một custom element

Để làm cho custom element có sẵn trên một trang, hãy gọi phương thức {{domxref("CustomElementRegistry.define()", "define()")}} của {{domxref("Window.customElements")}}.

Phương thức `define()` nhận các đối số sau:

- `name`
  - : Tên của phần tử. Tên này phải bắt đầu bằng một chữ cái thường, chứa dấu gạch ngang, và đáp ứng các quy tắc khác được liệt kê trong [định nghĩa tên hợp lệ](https://html.spec.whatwg.org/multipage/custom-elements.html#valid-custom-element-name) của đặc tả.
- `constructor`
  - : Hàm tạo của custom element.
- `options`
  - : Chỉ dùng cho customized built-in elements, đây là một object chứa một thuộc tính duy nhất `extends`, là chuỗi chỉ tên phần tử built-in được mở rộng.

Ví dụ, đoạn mã sau đăng ký customized built-in element `WordCount`:

```js
customElements.define("word-count", WordCount, { extends: "p" });
```

Đoạn mã này đăng ký autonomous custom element `PopupInfo`:

```js
customElements.define("popup-info", PopupInfo);
```

## Dùng một custom element

Khi đã định nghĩa và đăng ký custom element, bạn có thể dùng nó trong mã của mình.

Để dùng customized built-in element, hãy dùng phần tử built-in nhưng với tên custom làm giá trị của thuộc tính [`is`](/en-US/docs/Web/HTML/Reference/Global_attributes/is):

```html
<p is="word-count"></p>
```

Để dùng autonomous custom element, hãy dùng tên custom giống như một phần tử HTML built-in:

```html
<popup-info>
  <!-- nội dung của phần tử -->
</popup-info>
```

## Scoped custom element registries

Các ví dụ ở trên đăng ký custom elements trên global {{domxref("CustomElementRegistry")}} được truy cập qua {{domxref("Window.customElements")}}. Điều này có nghĩa là mỗi tên custom element bạn đăng ký phải là duy nhất trên toàn bộ trang. Khi ứng dụng phát triển và bắt đầu kết hợp component từ nhiều thư viện, xung đột tên toàn cục có thể trở thành vấn đề - nếu hai thư viện cùng cố định nghĩa `<my-button>`, một trong số đó sẽ thất bại.

**Scoped custom element registries** giải quyết điều này bằng cách cho phép bạn tạo một registry độc lập, mà các định nghĩa của nó chỉ áp dụng cho một DOM subtree cụ thể, như một {{domxref("ShadowRoot")}}. Các shadow tree khác nhau có thể mỗi cái dùng registry riêng với các định nghĩa riêng, kể cả khi tên phần tử trùng nhau.

### Tạo một scoped registry

Tạo scoped registry bằng constructor {{domxref("CustomElementRegistry.CustomElementRegistry()", "CustomElementRegistry()")}} và đăng ký phần tử trên đó bằng {{domxref("CustomElementRegistry.define()", "define()")}}, giống như registry toàn cục:

```js
const myRegistry = new CustomElementRegistry();

myRegistry.define(
  "my-element",
  class extends HTMLElement {
    connectedCallback() {
      this.textContent = "Xin chào từ scoped registry!";
    }
  },
);
```

> [!NOTE]
> Scoped registries không hỗ trợ tùy chọn `extends` trong `define()` (dùng để tạo [customized built-in elements](#types_of_custom_element)). Việc cố dùng `extends` với scoped registry sẽ ném ra `NotSupportedError` {{domxref("DOMException")}}.

### Gắn một scoped registry với shadow root

Một cách dùng scoped registry là truyền nó vào {{domxref("Element.attachShadow()")}} qua tùy chọn `customElementRegistry`. Các phần tử được phân tích cú pháp hoặc tạo bên trong shadow tree đó sẽ dùng định nghĩa từ scoped registry thay vì registry toàn cục:

```js
const host = document.createElement("div");
document.body.appendChild(host);

const shadow = host.attachShadow({
  mode: "open",
  customElementRegistry: myRegistry,
});

// <my-element> được nâng cấp bằng định nghĩa từ myRegistry
shadow.innerHTML = "<my-element></my-element>";
```

Bạn cũng có thể gắn scoped registry sau khi shadow root đã được tạo bằng cách gọi {{domxref("CustomElementRegistry.initialize()", "initialize()")}}. Cách này hữu ích khi bạn cần thiết lập cấu trúc DOM trước rồi mới gắn registry sau:

```js
const shadow = host.attachShadow({
  mode: "open",
  customElementRegistry: null, // chưa có registry
});
shadow.innerHTML = "<my-element></my-element>";

// Sau đó, gắn scoped registry và nâng cấp các phần tử
myRegistry.initialize(shadow);
```

### Declarative shadow DOM với scoped registry

Với [declarative shadow DOM](/en-US/docs/Web/API/Web_components/Using_shadow_DOM#declaratively_with_html), bạn có thể dùng thuộc tính `shadowrootcustomelementregistry` trên phần tử {{HTMLElement("template")}}. Điều này báo cho trình phân tích HTML để lại {{domxref("ShadowRoot.customElementRegistry", "customElementRegistry")}} của shadow root là `null`, để sau đó có thể gắn scoped registry bằng `initialize()`:

```html
<my-host>
  <template shadowrootmode="open" shadowrootcustomelementregistry>
    <my-element></my-element>
  </template>
</my-host>
```

## Phản hồi khi thuộc tính thay đổi

Giống như phần tử built-in, custom element có thể dùng thuộc tính HTML để cấu hình hành vi của phần tử. Để dùng thuộc tính hiệu quả, một phần tử phải có thể phản hồi khi giá trị của thuộc tính thay đổi. Để làm được điều này, custom element cần thêm các thành viên sau vào class triển khai nó:

- Một thuộc tính tĩnh tên là `observedAttributes`. Đây phải là một mảng chứa tên của tất cả các thuộc tính mà phần tử cần nhận thông báo khi thay đổi.
- Một triển khai của lifecycle callback `attributeChangedCallback()`.

Callback `attributeChangedCallback()` sau đó được gọi bất cứ khi nào một thuộc tính có tên nằm trong `observedAttributes` của phần tử được thêm, sửa, xóa hoặc thay thế.

Callback nhận ba đối số:

- Tên của thuộc tính đã thay đổi.
- Giá trị cũ của thuộc tính.
- Giá trị mới của thuộc tính.

Ví dụ, autonomous element này sẽ quan sát thuộc tính `size`, và ghi log giá trị cũ và mới khi chúng thay đổi:

```js
// Tạo một class cho phần tử
class MyCustomElement extends HTMLElement {
  static observedAttributes = ["size"];

  constructor() {
    super();
  }

  attributeChangedCallback(name, oldValue, newValue) {
    console.log(
      `Thuộc tính ${name} đã thay đổi từ ${oldValue} sang ${newValue}.`,
    );
  }
}

customElements.define("my-custom-element", MyCustomElement);
```

Lưu ý rằng nếu khai báo HTML của phần tử bao gồm một thuộc tính đang được quan sát, thì `attributeChangedCallback()` sẽ được gọi sau khi thuộc tính được khởi tạo, khi khai báo phần tử được phân tích lần đầu tiên. Vì vậy, trong ví dụ sau, `attributeChangedCallback()` sẽ được gọi khi DOM được phân tích, ngay cả khi thuộc tính không bao giờ thay đổi nữa:

```html
<my-custom-element size="100"></my-custom-element>
```

Để xem ví dụ hoàn chỉnh về cách dùng `attributeChangedCallback()`, hãy xem [Lifecycle callbacks](#lifecycle_callbacks) trong trang này.

### Custom states và bộ chọn pseudo-class CSS cho custom state

Phần tử HTML built-in có thể có các _state_ khác nhau, chẳng hạn như "hover", "disabled", và "read only".
Một số state này có thể được đặt bằng thuộc tính qua HTML hoặc JavaScript, trong khi những state khác là nội bộ và không thể.
Dù là bên ngoài hay nội bộ, các state này thường có các CSS [pseudo-class](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-classes) tương ứng có thể dùng để chọn và tạo style cho phần tử khi nó ở một state nhất định.

Autonomous custom elements (nhưng không phải phần tử dựa trên built-in elements) cũng cho phép bạn định nghĩa state và chọn chúng bằng hàm pseudo-class {{cssxref(":state()")}}.
Đoạn mã dưới đây cho thấy cách điều này hoạt động với ví dụ một autonomous custom element có state nội bộ `"collapsed"`.

State `collapsed` được biểu diễn dưới dạng một property boolean (với setter và getter) không hiển thị ra bên ngoài phần tử.
Để làm cho state này có thể chọn được trong CSS, custom element trước hết gọi {{domxref("HTMLElement.attachInternals()")}} trong constructor của nó để gắn một object {{domxref("ElementInternals")}}, object này lại cung cấp quyền truy cập vào {{domxref("CustomStateSet")}} thông qua thuộc tính {{domxref("ElementInternals.states")}}.
Setter cho state `collapsed` (nội bộ) sẽ thêm _identifier_ `hidden` vào `CustomStateSet` khi state là `true`, và xóa nó khi state là `false`.
Identifier chỉ là một chuỗi: trong trường hợp này chúng ta gọi nó là `hidden`, nhưng cũng có thể gọi là `collapsed`.

```js
class MyCustomElement extends HTMLElement {
  constructor() {
    super();
    this._internals = this.attachInternals();
  }

  get collapsed() {
    return this._internals.states.has("hidden");
  }

  set collapsed(flag) {
    if (flag) {
      // Việc tồn tại identifier tương ứng với "true"
      this._internals.states.add("hidden");
    } else {
      // Việc không có identifier tương ứng với "false"
      this._internals.states.delete("hidden");
    }
  }
}

// Đăng ký custom element
customElements.define("my-custom-element", MyCustomElement);
```

Chúng ta có thể dùng identifier được thêm vào `CustomStateSet` của custom element (`this._internals.states`) để khớp với custom state của phần tử.
Điều này được khớp bằng cách truyền identifier đó vào pseudo-class {{cssxref(":state()")}}.
Ví dụ, bên dưới chúng ta chọn state `hidden` là true (và do đó là state `collapsed` của phần tử) bằng selector `:hidden`, rồi xóa đường viền.

```css
my-custom-element {
  border: dashed red;
}
my-custom-element:state(hidden) {
  border: none;
}
```

Pseudo-class `:state()` cũng có thể được dùng bên trong hàm pseudo-class {{cssxref(":host()")}} để khớp một custom state [bên trong shadow DOM của custom element](/en-US/docs/Web/CSS/Reference/Selectors/:state#matching_a_custom_state_in_a_custom_elements_shadow_dom). Ngoài ra, pseudo-class `:state()` có thể được dùng sau pseudo-element {{cssxref("::part()")}} để khớp các [shadow part](/en-US/docs/Web/CSS/Guides/Shadow_parts) của một custom element đang ở một state cụ thể.

Có một số ví dụ trực tiếp trong {{domxref("CustomStateSet")}} cho thấy cách thức hoạt động này.

## Ví dụ

Trong phần còn lại của hướng dẫn này, chúng ta sẽ xem một vài custom element ví dụ. Bạn có thể tìm mã nguồn của tất cả các ví dụ này, và nhiều ví dụ khác, trong repository [web-components-examples](https://github.com/mdn/web-components-examples), và có thể xem chúng chạy trực tiếp tại <https://mdn.github.io/web-components-examples/>.

### Một autonomous custom element

Trước hết, chúng ta sẽ xem một autonomous custom element. Custom element `<popup-info>` nhận một biểu tượng ảnh và một chuỗi văn bản làm thuộc tính, rồi nhúng biểu tượng đó vào trang. Khi biểu tượng được focus, nó hiển thị văn bản trong một hộp thông tin bật lên để cung cấp thêm ngữ cảnh.

- [Xem ví dụ chạy trực tiếp](https://mdn.github.io/web-components-examples/popup-info-box-web-component/)
- [Xem mã nguồn](https://github.com/mdn/web-components-examples/tree/main/popup-info-box-web-component)

Đầu tiên, tệp JavaScript định nghĩa một class tên `PopupInfo`, mở rộng class {{domxref("HTMLElement")}}.

```js
// Tạo một class cho phần tử
class PopupInfo extends HTMLElement {
  constructor() {
    // Luôn gọi super trước trong constructor
    super();
  }

  connectedCallback() {
    // Tạo một shadow root
    const shadow = this.attachShadow({ mode: "open" });

    // Tạo các span
    const wrapper = document.createElement("span");
    wrapper.setAttribute("class", "wrapper");

    const icon = document.createElement("span");
    icon.setAttribute("class", "icon");
    icon.setAttribute("tabindex", 0);

    const info = document.createElement("span");
    info.setAttribute("class", "info");

    // Lấy nội dung thuộc tính và đặt nó vào span info
    const text = this.getAttribute("data-text");
    info.textContent = text;

    // Chèn icon
    let imgUrl;
    if (this.hasAttribute("img")) {
      imgUrl = this.getAttribute("img");
    } else {
      imgUrl = "img/default.png";
    }

    const img = document.createElement("img");
    img.src = imgUrl;
    icon.appendChild(img);

    // Tạo một ít CSS để áp dụng cho shadow dom
    const style = document.createElement("style");
    console.log(style.isConnected);

    style.textContent = `
      .wrapper {
        position: relative;
      }

      .info {
        font-size: 0.8rem;
        width: 200px;
        display: inline-block;
        border: 1px solid black;
        padding: 10px;
        background: white;
        border-radius: 10px;
        opacity: 0;
        transition: 0.6s all;
        position: absolute;
        bottom: 20px;
        left: 10px;
        z-index: 3;
      }

      img {
        width: 1.2rem;
      }

      .icon:hover + .info, .icon:focus + .info {
        opacity: 1;
      }
    `;

    // Gắn các phần tử đã tạo vào shadow dom
    shadow.appendChild(style);
    console.log(style.isConnected);
    shadow.appendChild(wrapper);
    wrapper.appendChild(icon);
    wrapper.appendChild(info);
  }
}
```

Định nghĩa class chứa [`constructor()`](/en-US/docs/Web/JavaScript/Reference/Classes/constructor) của class, luôn bắt đầu bằng việc gọi [`super()`](/en-US/docs/Web/JavaScript/Reference/Operators/super) để thiết lập đúng chuỗi prototype.

Bên trong phương thức `connectedCallback()`, chúng ta định nghĩa toàn bộ chức năng mà phần tử sẽ có khi nó được kết nối với DOM. Trong trường hợp này, chúng ta gắn một shadow root vào custom element, dùng một ít thao tác DOM để tạo cấu trúc shadow DOM nội bộ của phần tử - sau đó được gắn vào shadow root - và cuối cùng gắn một ít CSS vào shadow root để tạo style cho nó. Chúng ta không làm việc này trong constructor vì các thuộc tính của phần tử chưa sẵn có cho đến khi nó được kết nối với DOM.

Cuối cùng, chúng ta đăng ký custom element trong `CustomElementRegistry` bằng phương thức `define()` đã nhắc tới ở trên - trong các tham số, ta chỉ định tên phần tử, rồi tên class định nghĩa chức năng của nó:

```js
customElements.define("popup-info", PopupInfo);
```

Bây giờ nó đã sẵn sàng để dùng trên trang của chúng ta. Trong HTML, ta dùng nó như sau:

```html
<popup-info
  img="img/alt.png"
  data-text="Your card validation code (CVC)
  is an extra security feature — it is the last 3 or 4 numbers on the
  back of your card."></popup-info>
```

### Tham chiếu style bên ngoài

Trong ví dụ trên, chúng ta áp dụng style cho shadow DOM bằng phần tử {{htmlelement("style")}}, nhưng bạn cũng có thể tham chiếu một stylesheet bên ngoài từ phần tử {{htmlelement("link")}}. Trong ví dụ này, chúng ta sẽ sửa custom element `<popup-info>` để dùng stylesheet bên ngoài.

- [Xem ví dụ chạy trực tiếp](https://mdn.github.io/web-components-examples/popup-info-box-external-stylesheet/)
- [Xem mã nguồn](https://github.com/mdn/web-components-examples/tree/main/popup-info-box-external-stylesheet)

Đây là định nghĩa class:

```js
// Tạo một class cho phần tử
class PopupInfo extends HTMLElement {
  constructor() {
    // Luôn gọi super trước trong constructor
    super();
  }

  connectedCallback() {
    // Tạo một shadow root
    const shadow = this.attachShadow({ mode: "open" });

    // Tạo các span
    const wrapper = document.createElement("span");
    wrapper.setAttribute("class", "wrapper");

    const icon = document.createElement("span");
    icon.setAttribute("class", "icon");
    icon.setAttribute("tabindex", 0);

    const info = document.createElement("span");
    info.setAttribute("class", "info");

    // Lấy nội dung thuộc tính và đặt nó vào span info
    const text = this.getAttribute("data-text");
    info.textContent = text;

    // Chèn icon
    let imgUrl;
    if (this.hasAttribute("img")) {
      imgUrl = this.getAttribute("img");
    } else {
      imgUrl = "img/default.png";
    }

    const img = document.createElement("img");
    img.src = imgUrl;
    icon.appendChild(img);

    // Áp dụng style bên ngoài cho shadow dom
    const linkElem = document.createElement("link");
    linkElem.setAttribute("rel", "stylesheet");
    linkElem.setAttribute("href", "style.css");

    // Gắn các phần tử đã tạo vào shadow dom
    shadow.appendChild(linkElem);
    shadow.appendChild(wrapper);
    wrapper.appendChild(icon);
    wrapper.appendChild(info);
  }
}
```

Nó giống hệt ví dụ `<popup-info>` ban đầu, chỉ khác là chúng ta liên kết đến một stylesheet bên ngoài bằng phần tử {{HTMLElement("link")}}, rồi thêm phần tử đó vào shadow DOM.

Lưu ý rằng các phần tử {{htmlelement("link")}} không chặn việc vẽ của shadow root, nên có thể xuất hiện flash of unstyled content (FOUC) trong lúc stylesheet đang tải.
