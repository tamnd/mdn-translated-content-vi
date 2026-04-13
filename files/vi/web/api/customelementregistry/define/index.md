---
title: "CustomElementRegistry: define() method"
short-title: define()
slug: Web/API/CustomElementRegistry/define
page-type: web-api-instance-method
browser-compat: api.CustomElementRegistry.define
---

{{APIRef("Web Components")}}

Phương thức **`define()`** của giao diện {{domxref("CustomElementRegistry")}} thêm một định nghĩa cho custom element vào custom element registry, ánh xạ tên của nó tới constructor sẽ được dùng để tạo nó.

## Cú pháp

```js-nolint
define(name, constructor)
define(name, constructor, options)
```

### Tham số

- `name`
  - : Tên cho custom element mới. Phải là [tên custom element hợp lệ](#valid_custom_element_names).
- `constructor`
  - : Constructor cho custom element mới.
- `options` {{optional_inline}}
  - : Đối tượng điều khiển cách element được định nghĩa. Hiện tại hỗ trợ một tùy chọn:
    - `extends`
      - : Chuỗi chỉ định tên của một built-in element để mở rộng.
        Dùng để tạo một customized built-in element.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotSupportedError` {{domxref("DOMException")}}
  - : Ném ra nếu:
    - {{domxref("CustomElementRegistry")}} đã chứa một mục có cùng tên hoặc cùng constructor (hoặc đã được định nghĩa bằng cách khác).
    - Tùy chọn `extends` được chỉ định và nó là một [tên custom element hợp lệ](#valid_custom_element_names) (tức là bạn đang cố mở rộng một custom element).
    - Tùy chọn `extends` được chỉ định nhưng element mà nó đang cố mở rộng là một element không xác định.
- `SyntaxError` {{domxref("DOMException")}}
  - : Ném ra nếu [name](#name) được cung cấp không phải là [tên custom element hợp lệ](#valid_custom_element_names).
- {{jsxref("TypeError")}}
  - : Ném ra nếu constructor được tham chiếu không phải là một constructor.

## Mô tả

Phương thức `define()` thêm một định nghĩa cho custom element vào custom element registry, ánh xạ tên của nó tới constructor sẽ được dùng để tạo nó.

Có hai loại custom element bạn có thể tạo:

- _Autonomous custom elements_ là các phần tử độc lập, không kế thừa từ các phần tử HTML dựng sẵn.
- _Customized built-in elements_ là các phần tử kế thừa từ, và mở rộng, các phần tử HTML dựng sẵn.

Để định nghĩa một autonomous custom element, bạn nên bỏ qua tham số `options`.

Để định nghĩa một customized built-in element, bạn phải truyền tham số `options` với thuộc tính `extends` được đặt thành tên của phần tử dựng sẵn mà bạn đang mở rộng, và điều này phải khớp với interface mà định nghĩa lớp custom element của bạn kế thừa. Ví dụ, để tùy biến phần tử {{htmlelement("p")}}, bạn phải truyền `{extends: "p"}` cho `define()`, và định nghĩa lớp cho phần tử của bạn phải kế thừa từ {{domxref("HTMLParagraphElement")}}.

### Tên custom element hợp lệ

Tên custom element phải:

- bắt đầu bằng một chữ cái ASCII viết thường (a-z)
- chứa dấu gạch nối
- không chứa bất kỳ chữ cái ASCII viết hoa nào
- không chứa khoảng trắng ASCII, `NULL`, `/`, hoặc `>` (tương ứng là U+0000, U+002F, hoặc U+003E)
- không được là bất kỳ giá trị nào sau đây:
  - "annotation-xml"
  - "color-profile"
  - "font-face"
  - "font-face-src"
  - "font-face-uri"
  - "font-face-format"
  - "font-face-name"
  - "missing-glyph"

## Ví dụ

### Định nghĩa một autonomous custom element

Lớp sau triển khai một autonomous custom element tối thiểu:

```js
class MyAutonomousElement extends HTMLElement {
  constructor() {
    super();
  }
}
```

Element này không làm gì cả: một autonomous element thực sự sẽ triển khai chức năng của nó trong constructor và trong các callback vòng đời do tiêu chuẩn cung cấp.
Xem [Triển khai custom element](/en-US/docs/Web/API/Web_components/Using_custom_elements) trong hướng dẫn làm việc với custom element của chúng tôi.

Tuy nhiên, định nghĩa lớp ở trên đáp ứng các yêu cầu của phương thức `define()`, nên chúng ta có thể định nghĩa nó bằng mã sau:

```js
customElements.define("my-autonomous-element", MyAutonomousElement);
```

Sau đó, chúng ta có thể dùng nó trong một trang HTML như sau:

```html
<my-autonomous-element>Element contents</my-autonomous-element>
```

### Định nghĩa một customized built-in element

Lớp sau triển khai một customized built-in element:

```js
class MyCustomizedBuiltInElement extends HTMLParagraphElement {
  constructor() {
    super();
  }
}
```

Element này mở rộng phần tử dựng sẵn {{htmlelement("p")}}.

Trong ví dụ tối thiểu này, element không triển khai tùy biến nào, nên nó sẽ hoạt động giống như một phần tử `<p>` bình thường.
Tuy nhiên, nó vẫn đáp ứng yêu cầu của `define()`, nên chúng ta có thể định nghĩa nó như sau:

```js
customElements.define(
  "my-customized-built-in-element",
  MyCustomizedBuiltInElement,
  {
    extends: "p",
  },
);
```

Sau đó, chúng ta có thể dùng nó trong một trang HTML như sau:

```html
<p is="my-customized-built-in-element"></p>
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
