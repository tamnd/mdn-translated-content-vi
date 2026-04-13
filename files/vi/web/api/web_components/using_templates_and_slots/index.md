---
title: Using templates and slots
slug: Web/API/Web_components/Using_templates_and_slots
page-type: guide
---

{{DefaultAPISidebar("Web Components")}}

Bài viết này giải thích cách bạn có thể dùng các phần tử {{htmlelement("template")}} và {{htmlelement("slot")}} để tạo một template linh hoạt, rồi dùng nó để điền vào shadow DOM của một web component.

## Sự thật về template

Khi bạn phải dùng đi dùng lại cùng một cấu trúc đánh dấu trên một trang web, việc dùng một dạng template nào đó sẽ hợp lý hơn là lặp lại cấu trúc ấy hết lần này đến lần khác.
Điều này vốn đã khả thi trước đây, nhưng được HTML {{htmlelement("template")}} làm cho dễ hơn rất nhiều.
Phần tử này và nội dung của nó không được render trong DOM, nhưng vẫn có thể được tham chiếu bằng JavaScript.

Hãy xem một ví dụ nhanh đơn giản:

```html
<template id="custom-paragraph">
  <p>My paragraph</p>
</template>
```

Nó sẽ không xuất hiện trên trang cho đến khi bạn lấy tham chiếu tới nó bằng JavaScript rồi append nó vào DOM, bằng cách như sau:

```js
let template = document.getElementById("custom-paragraph");
let templateContent = template.content;
document.body.appendChild(templateContent);
```

Dù đơn giản, bạn đã có thể bắt đầu thấy nó hữu ích như thế nào.

## Dùng template với web component

Template tự nó đã hữu ích, nhưng sẽ còn tốt hơn khi kết hợp với web component.
Hãy định nghĩa một web component dùng template của chúng ta làm nội dung cho shadow DOM của nó.
Chúng ta cũng sẽ gọi nó là `<my-paragraph>`:

```js
customElements.define(
  "my-paragraph",
  class extends HTMLElement {
    constructor() {
      super();
      let template = document.getElementById("custom-paragraph");
      let templateContent = template.content;

      const shadowRoot = this.attachShadow({ mode: "open" });
      shadowRoot.appendChild(document.importNode(templateContent, true));
    }
  },
);
```

Điểm quan trọng cần lưu ý ở đây là chúng ta append một bản sao của nội dung template vào shadow root, được tạo bằng phương thức {{domxref("Document.importNode()")}}.

Và vì chúng ta đang append nội dung của nó vào một shadow DOM, nên có thể đưa một ít thông tin tạo style bên trong template trong một phần tử {{htmlelement("style")}}, rồi phần này sẽ được đóng gói bên trong custom element.
Điều này sẽ không hoạt động nếu chúng ta chỉ append nó vào DOM chuẩn.

Ví dụ:

```html
<template id="custom-paragraph">
  <style>
    p {
      color: white;
      background-color: #666666;
      padding: 5px;
    }
  </style>
  <p>My paragraph</p>
</template>
```

Bây giờ chúng ta có thể dùng nó chỉ bằng cách thêm nó vào tài liệu HTML:

```html
<my-paragraph></my-paragraph>
```

## Tăng tính linh hoạt với slot

Đến đây thì ổn, nhưng phần tử vẫn chưa thật linh hoạt.
Chúng ta chỉ có thể hiển thị một mẩu văn bản bên trong nó, nghĩa là hiện tại nó còn ít hữu ích hơn cả một đoạn văn bình thường! Ta có thể làm cho nó hiển thị các đoạn text khác nhau trong mỗi thể hiện phần tử theo một cách khai báo đẹp đẽ bằng cách dùng phần tử {{htmlelement("slot")}}.

Các slot được nhận diện bằng thuộc tính `name`, và cho phép bạn định nghĩa các chỗ giữ trong template mà có thể được lấp bằng bất kỳ fragment đánh dấu nào bạn muốn khi phần tử được dùng trong markup.

Vì vậy, nếu muốn thêm một slot vào ví dụ đơn giản của chúng ta, ta có thể cập nhật phần tử paragraph trong template như sau:

```html
<p><slot name="my-text">My default text</slot></p>
```

Nếu nội dung của slot chưa được định nghĩa khi phần tử được đưa vào markup, hoặc nếu trình duyệt không hỗ trợ slot, `<my-paragraph>` chỉ chứa nội dung dự phòng "My default text".

Để định nghĩa nội dung của slot, chúng ta bao gồm một cấu trúc HTML bên trong phần tử `<my-paragraph>` với thuộc tính [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot) có giá trị bằng tên của slot mà ta muốn nó lấp vào. Như trước, đó có thể là bất kỳ thứ gì bạn thích, ví dụ:

```html
<my-paragraph>
  <span slot="my-text">Let's have some different text!</span>
</my-paragraph>
```

hoặc

```html
<my-paragraph>
  <ul slot="my-text">
    <li>Let's have some different text!</li>
    <li>In a list!</li>
  </ul>
</my-paragraph>
```

> [!NOTE]
> Các nút có thể được chèn vào slot được gọi là nút _Slottable_; khi một nút đã được chèn vào một slot, nó được gọi là _slotted_.

Và vậy là xong cho ví dụ đơn giản của chúng ta.
Nếu bạn muốn thử thêm, bạn có thể [tìm nó trên GitHub](https://github.com/mdn/web-components-examples/tree/main/simple-template) (và xem [bản chạy trực tiếp](https://mdn.github.io/web-components-examples/simple-template/) nữa).

Thuộc tính `name` nên là duy nhất trong mỗi shadow root: nếu bạn có hai slot cùng tên, tất cả phần tử có thuộc tính `slot` khớp sẽ được gán cho slot đầu tiên có tên đó. Nhưng thuộc tính `slot` thì không cần duy nhất: một `<slot>` có thể được lấp bởi nhiều phần tử cùng có thuộc tính `slot` khớp.

Các thuộc tính `name` và `slot` đều mặc định là chuỗi rỗng, vì vậy các phần tử không có thuộc tính `slot` sẽ được gán vào `<slot>` không có thuộc tính `name` (slot không đặt tên, hay slot mặc định). Dưới đây là ví dụ:

```html
<template id="custom-paragraph">
  <style>
    p {
      color: white;
      background-color: #666666;
      padding: 5px;
    }
  </style>
  <p>
    <slot name="my-text">My default text</slot>
    <slot></slot>
  </p>
</template>
```

Bạn có thể dùng nó như sau:

```html
<my-paragraph>
  <span slot="my-text">Let's have some different text!</span>
  <span>This will go into the unnamed slot</span>
  <span>This will also go into the unnamed slot</span>
</my-paragraph>
```

Trong ví dụ này:

- Nội dung với `slot="my-text"` đi vào slot có tên.
- Tất cả nội dung khác tự động đi vào slot không đặt tên.

## Một ví dụ chi tiết hơn

Để kết thúc bài viết, hãy xem một ví dụ ít đơn giản hơn một chút.

Chuỗi snippet mã sau cho thấy cách dùng {{HTMLElement("slot")}} cùng với {{HTMLElement("template")}} và một ít JavaScript để:

- tạo một phần tử **`<element-details>`** với [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) trong [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó
- thiết kế phần tử **`<element-details>`** sao cho khi dùng trong tài liệu, nó được render từ việc ghép nội dung của chính phần tử với nội dung từ [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó - tức là, các phần nội dung của phần tử được dùng để điền vào [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) trong [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó

Lưu ý rằng về mặt kỹ thuật, có thể dùng phần tử {{HTMLElement("slot")}} mà không cần phần tử {{HTMLElement("template")}}, ví dụ bên trong một phần tử {{HTMLElement("div")}} thông thường, và vẫn tận dụng được tính năng chỗ giữ của {{HTMLElement("slot")}} cho nội dung Shadow DOM, và làm như vậy có thể tránh được chút bất tiện là trước tiên phải truy cập thuộc tính `content` của template rồi clone nó.
Tuy nhiên, nhìn chung sẽ thực tế hơn khi đặt slot bên trong phần tử {{HTMLElement("template")}}, vì bạn thường không cần định nghĩa một pattern dựa trên một phần tử đã được render.

Ngoài ra, ngay cả khi nó chưa được render, mục đích của container như một template sẽ rõ nghĩa hơn về mặt ngữ nghĩa khi dùng {{HTMLElement("template")}}. Thêm nữa, {{HTMLElement("template")}} có thể được thêm trực tiếp các mục bên trong, như {{HTMLElement("td")}}, mà sẽ biến mất nếu thêm vào {{HTMLElement("div")}}.

> [!NOTE]
> Bạn có thể tìm ví dụ hoàn chỉnh này tại [element-details](https://github.com/mdn/web-components-examples/tree/main/element-details) (và xem [bản chạy trực tiếp](https://mdn.github.io/web-components-examples/element-details/) nữa).

### Tạo một template có một số slot

Trước hết, chúng ta dùng phần tử {{HTMLElement("slot")}} bên trong một phần tử {{HTMLElement("template")}} để tạo một "element-details-template" mới là một [document fragment](/en-US/docs/Web/API/DocumentFragment) chứa một số [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name):

```html
<template id="element-details-template">
  <style>
    details {
      font-family: "Open Sans Light", "Helvetica", "Arial";
    }
    .name {
      font-weight: bold;
      color: #217ac0;
      font-size: 120%;
    }
    h4 {
      margin: 10px 0 -8px 0;
    }
    h4 span {
      background: #217ac0;
      padding: 2px 6px;
    }
    h4 span {
      border: 1px solid #cee9f9;
      border-radius: 4px;
    }
    h4 span {
      color: white;
    }
    .attributes {
      margin-left: 22px;
      font-size: 90%;
    }
    .attributes p {
      margin-left: 16px;
      font-style: italic;
    }
  </style>
  <details>
    <summary>
      <span>
        <code class="name"
          >&lt;<slot name="element-name">NEED NAME</slot>&gt;</code
        >
        <span class="desc"
          ><slot name="description">NEED DESCRIPTION</slot></span
        >
      </span>
    </summary>
    <div class="attributes">
      <h4><span>Attributes</span></h4>
      <slot name="attributes"><p>None</p></slot>
    </div>
  </details>
  <hr />
</template>
```

Phần tử {{HTMLElement("template")}} này có vài đặc điểm:

- {{HTMLElement("template")}} có một phần tử {{HTMLElement("style")}} với một bộ style CSS chỉ được giới hạn trong document fragment mà {{HTMLElement("template")}} tạo ra. Các style này được giới hạn theo cách này vì fragment đó sẽ được chèn vào một shadow root.
- {{HTMLElement("template")}} dùng {{HTMLElement("slot")}} và thuộc tính [`name`](/en-US/docs/Web/HTML/Reference/Elements/slot#name) của nó để tạo ba [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name):
  - `<slot name="element-name">`
  - `<slot name="description">`
  - `<slot name="attributes">`

- {{HTMLElement("template")}} bọc các [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) trong một phần tử {{HTMLElement("details")}}.

### Tạo phần tử mới \<element-details> từ \<template>

Tiếp theo, hãy tạo một custom element mới tên là **`<element-details>`** và dùng {{DOMXref("Element.attachShadow")}} để gắn vào nó, với tư cách là [shadow root](/en-US/docs/Web/API/ShadowRoot), document fragment mà chúng ta đã tạo bằng phần tử {{HTMLElement("template")}} ở trên.
Điều này dùng chính xác cùng một pattern như chúng ta đã thấy ở ví dụ đơn giản trước đó.

```js
customElements.define(
  "element-details",
  class extends HTMLElement {
    constructor() {
      super();
      const template = document.getElementById(
        "element-details-template",
      ).content;
      const shadowRoot = this.attachShadow({ mode: "open" });
      shadowRoot.appendChild(document.importNode(template, true));
    }
  },
);
```

### Dùng custom element `<element-details>` với named slots

Bây giờ hãy lấy phần tử **`<element-details>`** đó và thực sự dùng nó trong tài liệu của chúng ta:

```html
<element-details>
  <span slot="element-name">slot</span>
  <span slot="description"
    >A placeholder inside a web component that users can fill with their own
    markup, with the effect of composing different DOM trees together.</span
  >
  <dl slot="attributes">
    <dt>name</dt>
    <dd>The name of the slot.</dd>
  </dl>
</element-details>

<element-details>
  <span slot="element-name">template</span>
  <span slot="description"
    >A mechanism for holding client- side content that is not to be rendered
    when a page is loaded but may subsequently be instantiated during runtime
    using JavaScript.</span
  >
</element-details>
```

Về đoạn mã đó, hãy chú ý các điểm sau:

- Đoạn mã có hai thể hiện của phần tử **`<element-details>`**, cả hai đều dùng thuộc tính [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot) để tham chiếu các [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"element-name"` và `"description"` mà chúng ta đặt trong [shadow root](/en-US/docs/Web/API/ShadowRoot) của `<element-details>`.
- Chỉ thể hiện đầu tiên trong hai phần tử **`<element-details>`** đó tham chiếu [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`. Phần tử `<element-details>` thứ hai không có tham chiếu nào đến [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`.
- Phần tử `<element-details>` đầu tiên tham chiếu [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` bằng một phần tử {{HTMLElement("dl")}} với các phần tử con {{HTMLElement("dt")}} và {{HTMLElement("dd")}}.

### Thêm chút style cuối cùng

Để hoàn thiện, chúng ta sẽ thêm một chút CSS nữa cho các phần tử {{HTMLElement("dl")}}, {{HTMLElement("dt")}} và {{HTMLElement("dd")}} trong tài liệu:

```css
dl {
  margin-left: 6px;
}
dt {
  color: #217ac0;
  font-family: "Consolas", "Liberation Mono", "Courier New";
  font-size: 110%;
  font-weight: bold;
}
dd {
  margin-left: 16px;
}
```

```css hidden
body {
  margin-top: 47px;
}
```

### Kết quả

Cuối cùng, hãy ghép tất cả các đoạn mã lại và xem kết quả được render trông như thế nào.

{{EmbedLiveSample('A_more_involved_example', '300','400')}}

Hãy chú ý các điểm sau về kết quả được render này:

- Mặc dù các thể hiện của phần tử **`<element-details>`** trong tài liệu không trực tiếp dùng phần tử {{HTMLElement("details")}}, chúng vẫn được render bằng {{HTMLElement("details")}} vì [shadow root](/en-US/docs/Web/API/ShadowRoot) làm cho chúng được điền nội dung tương ứng.
- Trong đầu ra {{HTMLElement("details")}} được render, nội dung trong các phần tử **`<element-details>`** lấp đầy các [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) từ [shadow root](/en-US/docs/Web/API/ShadowRoot). Nói cách khác, cây DOM từ các phần tử **`<element-details>`** được _composed_ cùng với nội dung của [shadow root](/en-US/docs/Web/API/ShadowRoot).
- Với cả hai phần tử **`<element-details>`**, một tiêu đề **Attributes** được tự động thêm từ [shadow root](/en-US/docs/Web/API/ShadowRoot) trước vị trí của [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`.
- Vì phần tử **`<element-details>`** đầu tiên có một phần tử {{HTMLElement("dl")}} tham chiếu rõ ràng tới [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó, nội dung của phần tử {{HTMLElement("dl")}} đó thay thế [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot).
- Vì phần tử **`<element-details>`** thứ hai không tham chiếu rõ ràng tới [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó, nội dung của [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) đó sẽ được lấp bằng nội dung mặc định của nó từ [shadow root](/en-US/docs/Web/API/ShadowRoot).
  );

````

### Dùng custom element `<element-details>` với named slots

Bây giờ hãy lấy phần tử **`<element-details>`** đó và thực sự dùng nó trong tài liệu của chúng ta:

```html
<element-details>
  <span slot="element-name">slot</span>
  <span slot="description"
    >A placeholder inside a web component that users can fill with their own
    markup, with the effect of composing different DOM trees together.</span
  >
  <dl slot="attributes">
    <dt>name</dt>
    <dd>The name of the slot.</dd>
  </dl>
</element-details>

<element-details>
  <span slot="element-name">template</span>
  <span slot="description"
    >A mechanism for holding client- side content that is not to be rendered
    when a page is loaded but may subsequently be instantiated during runtime
    using JavaScript.</span
  >
</element-details>
````

Về đoạn mã đó, hãy chú ý các điểm sau:

- Đoạn mã có hai thể hiện của phần tử **`<element-details>`**, cả hai đều dùng thuộc tính [`slot`](/en-US/docs/Web/HTML/Reference/Global_attributes/slot) để tham chiếu các [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"element-name"` và `"description"` mà chúng ta đặt trong [shadow root](/en-US/docs/Web/API/ShadowRoot) của `<element-details>`.
- Chỉ thể hiện đầu tiên trong hai phần tử **`<element-details>`** đó tham chiếu [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`. Phần tử `<element-details>` thứ hai không có tham chiếu nào đến [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`.
- Phần tử `<element-details>` đầu tiên tham chiếu [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` bằng một phần tử {{HTMLElement("dl")}} với các phần tử con {{HTMLElement("dt")}} và {{HTMLElement("dd")}}.

### Thêm chút style cuối cùng

Để hoàn thiện, chúng ta sẽ thêm một chút CSS nữa cho các phần tử {{HTMLElement("dl")}}, {{HTMLElement("dt")}} và {{HTMLElement("dd")}} trong tài liệu:

```css
dl {
  margin-left: 6px;
}
dt {
  color: #217ac0;
  font-family: "Consolas", "Liberation Mono", "Courier New";
  font-size: 110%;
  font-weight: bold;
}
dd {
  margin-left: 16px;
}
```

```css hidden
body {
  margin-top: 47px;
}
```

### Kết quả

Cuối cùng, hãy ghép tất cả các đoạn mã lại và xem kết quả được render trông như thế nào.

{{EmbedLiveSample('A_more_involved_example', '300','400')}}

Hãy chú ý các điểm sau về kết quả được render này:

- Mặc dù các thể hiện của phần tử **`<element-details>`** trong tài liệu không trực tiếp dùng phần tử {{HTMLElement("details")}}, chúng vẫn được render bằng {{HTMLElement("details")}} vì [shadow root](/en-US/docs/Web/API/ShadowRoot) làm cho chúng được điền nội dung tương ứng.
- Trong đầu ra {{HTMLElement("details")}} được render, nội dung trong các phần tử **`<element-details>`** lấp đầy các [named slots](/en-US/docs/Web/HTML/Reference/Elements/slot#name) từ [shadow root](/en-US/docs/Web/API/ShadowRoot). Nói cách khác, cây DOM từ các phần tử **`<element-details>`** được _composed_ cùng với nội dung của [shadow root](/en-US/docs/Web/API/ShadowRoot).
- Với cả hai phần tử **`<element-details>`**, một tiêu đề **Attributes** được tự động thêm từ [shadow root](/en-US/docs/Web/API/ShadowRoot) trước vị trí của [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"`.
- Vì phần tử **`<element-details>`** đầu tiên có một phần tử {{HTMLElement("dl")}} tham chiếu rõ ràng tới [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó, nội dung của phần tử {{HTMLElement("dl")}} đó thay thế [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot).
- Vì phần tử **`<element-details>`** thứ hai không tham chiếu rõ ràng tới [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) `"attributes"` từ [shadow root](/en-US/docs/Web/API/ShadowRoot) của nó, nội dung của [named slot](/en-US/docs/Web/HTML/Reference/Elements/slot#name) đó sẽ được lấp bằng nội dung mặc định của nó từ [shadow root](/en-US/docs/Web/API/ShadowRoot).
