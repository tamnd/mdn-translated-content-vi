---
title: Using shadow DOM
slug: Web/API/Web_components/Using_shadow_DOM
page-type: guide
---

{{DefaultAPISidebar("Web Components")}}

Một khía cạnh quan trọng của custom elements là tính đóng gói, vì theo định nghĩa, một custom element là một mẩu chức năng có thể tái sử dụng: nó có thể được đưa vào bất kỳ trang web nào và được kỳ vọng sẽ hoạt động. Vì vậy, điều quan trọng là mã chạy trong trang không thể vô tình phá vỡ custom element bằng cách sửa đổi cách triển khai nội bộ của nó. Shadow DOM cho phép bạn gắn một cây DOM vào một phần tử, và giữ các phần bên trong của cây này ẩn khỏi JavaScript và CSS đang chạy trong trang.

Bài viết này trình bày những điều cơ bản khi dùng shadow DOM.

## Cái nhìn tổng quan

Bài viết này giả định rằng bạn đã quen với khái niệm [DOM (Document Object Model)](/en-US/docs/Web/API/Document_Object_Model) - một cấu trúc dạng cây gồm các nút được kết nối với nhau, đại diện cho các phần tử và chuỗi văn bản khác nhau xuất hiện trong một tài liệu đánh dấu (thường là tài liệu HTML trong trường hợp web document). Ví dụ, hãy xem đoạn HTML sau:

```html
<html lang="en-US">
  <head>
    <meta charset="utf-8" />
    <title>DOM example</title>
  </head>
  <body>
    <section>
      <img src="dinosaur.png" alt="A red Tyrannosaurus Rex." />
      <p>
        Here we will add a link to the
        <a href="https://www.mozilla.org/">Mozilla homepage</a>
      </p>
    </section>
  </body>
</html>
```

Đoạn này tạo ra cấu trúc DOM sau (không tính các text node chỉ chứa khoảng trắng):

```plain
- HTML
    - HEAD
        - META charset="utf-8"
        - TITLE
            - #text: DOM example
    - BODY
        - SECTION
            - IMG src="dinosaur.png" alt="A red Tyrannosaurus Rex."
            - P
                - #text: Here we will add a link to the
                - A href="https://www.mozilla.org/"
                    - #text: Mozilla homepage
```

DOM _shadow_ cho phép gắn các cây DOM ẩn vào các phần tử trong cây DOM thông thường - cây shadow DOM này bắt đầu bằng một shadow root, bên dưới đó bạn có thể gắn bất kỳ phần tử nào, theo cùng cách như DOM bình thường.

![SVG version of the diagram showing the interaction of document, shadow root and shadow host.](shadowdom.svg)

Có một số thuật ngữ shadow DOM cần lưu ý:

- **Shadow host**: Nút DOM thông thường mà shadow DOM được gắn vào.
- **Shadow tree**: Cây DOM bên trong shadow DOM.
- **Shadow boundary**: nơi shadow DOM kết thúc, và DOM thông thường bắt đầu.
- **Shadow root**: Nút gốc của shadow tree.

Bạn có thể tác động lên các nút trong shadow DOM theo đúng cách như với các nút không phải shadow - ví dụ thêm con hoặc đặt thuộc tính, tạo style cho từng nút bằng `element.style.foo`, hoặc thêm style cho toàn bộ cây shadow DOM bên trong một phần tử {{htmlelement("style")}}. Điểm khác biệt là không có mã nào bên trong shadow DOM có thể ảnh hưởng ra ngoài nó, giúp đóng gói thuận tiện.

Trước khi shadow DOM được cung cấp cho nhà phát triển web, trình duyệt đã dùng nó để đóng gói cấu trúc bên trong của một phần tử. Hãy nghĩ đến phần tử {{htmlelement("video")}}, với các điều khiển mặc định của trình duyệt được hiển thị. Tất cả những gì bạn thấy trong DOM chỉ là phần tử `<video>`, nhưng nó chứa một loạt nút bấm và điều khiển khác bên trong shadow DOM của nó. Đặc tả shadow DOM cho phép bạn thao tác shadow DOM của các custom element do chính bạn tạo.

### Kế thừa thuộc tính

Shadow tree và các phần tử {{ HTMLElement("slot") }} kế thừa các thuộc tính [`dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir) và [`lang`](/en-US/docs/Web/HTML/Reference/Global_attributes/lang) từ shadow host của chúng.

## Tạo shadow DOM

### Tạo bằng JavaScript

Trang sau chứa hai phần tử, một phần tử {{htmlelement("div")}} với [`id`](/en-US/docs/Web/HTML/Reference/Global_attributes/id) là `"host"`, và một phần tử {{htmlelement("span")}} chứa một đoạn văn bản:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

Chúng ta sẽ dùng phần tử `"host"` làm shadow host. Gọi {{domxref("Element.attachShadow()", "attachShadow()")}} trên host để tạo shadow DOM, rồi có thể thêm nút vào shadow DOM giống như với DOM chính. Trong ví dụ này chúng ta thêm một phần tử `<span>`:

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

Kết quả trông như sau:

{{EmbedLiveSample("Imperatively with JavaScript")}}

### Tạo khai báo bằng HTML

Tạo shadow DOM qua JavaScript API có thể là một lựa chọn tốt cho ứng dụng render phía client. Với các ứng dụng khác, UI render phía server có thể có hiệu năng tốt hơn và nhờ đó mang lại trải nghiệm người dùng tốt hơn. Trong các trường hợp như vậy, bạn có thể dùng phần tử {{htmlelement("template")}} để định nghĩa shadow DOM theo kiểu khai báo. Chìa khóa của hành vi này là thuộc tính `shadowrootmode` {{glossary("enumerated")}}, có thể đặt thành `open` hoặc `closed`, cùng các giá trị với tùy chọn `mode` của phương thức {{domxref("Element.attachShadow()", "attachShadow()")}}.

```html
<div id="host">
  <template shadowrootmode="open">
    <span>I'm in the shadow DOM</span>
  </template>
</div>
```

{{EmbedGHLiveSample("dom-examples/shadow-dom/shadowrootmode/simple.html", "", "")}}

> [!NOTE]
> Theo mặc định, nội dung bên trong `<template>` không được hiển thị. Trong trường hợp này, vì có `shadowrootmode="open"`, shadow root sẽ được render. Ở các trình duyệt hỗ trợ, nội dung hiển thị bên trong shadow root đó sẽ xuất hiện.

Sau khi trình duyệt phân tích cú pháp HTML, nó thay thế phần tử {{htmlelement("template")}} bằng nội dung của nó được bọc trong một [shadow root](/en-US/docs/Glossary/Shadow_tree) gắn với phần tử cha, tức `<div id="host">` trong ví dụ của chúng ta. Cây DOM kết quả trông như sau (không có phần tử `<template>` trong cây DOM):

```plain
- DIV id="host"
  - #shadow-root
    - SPAN
      - #text: I'm in the shadow DOM
```

Lưu ý rằng ngoài `shadowrootmode`, bạn còn có thể dùng các thuộc tính của `<template>` như `shadowrootclonable` và `shadowrootdelegatesfocus` để chỉ định các thuộc tính khác của shadow root được tạo ra.

## Đóng gói từ JavaScript

Cho đến đây có thể chưa thấy gì đặc biệt. Nhưng hãy xem điều gì xảy ra nếu mã đang chạy trong trang cố truy cập các phần tử trong shadow DOM.

Trang này giống hệt trang trước, chỉ khác là chúng ta đã thêm hai phần tử {{htmlelement("button")}}.

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
<br />

<button id="upper" type="button">Uppercase span elements</button>
<button id="reload" type="button">Reload</button>
```

Nhấn nút "Uppercase span elements" sẽ tìm tất cả phần tử `<span>` trong trang và chuyển chữ của chúng sang dạng hoa.
Nhấn nút "Reload" chỉ tải lại trang, để bạn có thể thử lại.

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);

const upper = document.querySelector("button#upper");
upper.addEventListener("click", () => {
  const spans = Array.from(document.querySelectorAll("span"));
  for (const span of spans) {
    span.textContent = span.textContent.toUpperCase();
  }
});

const reload = document.querySelector("#reload");
reload.addEventListener("click", () => document.location.reload());
```

Nếu bạn nhấn "Uppercase span elements", bạn sẽ thấy rằng {{domxref("Document.querySelectorAll()")}} không tìm thấy các phần tử trong shadow DOM của chúng ta: chúng thực sự bị ẩn khỏi JavaScript trong trang.

{{EmbedLiveSample("Encapsulation from JavaScript")}}

## Element.shadowRoot và tùy chọn "mode"

Trong ví dụ trên, chúng ta truyền đối số `{ mode: "open" }` cho `attachShadow()`. Với `mode` đặt thành `"open"`, JavaScript trong trang có thể truy cập nội dung bên trong shadow DOM thông qua thuộc tính {{domxref("Element.shadowRoot", "shadowRoot")}} của shadow host.

Trong ví dụ này, như trước, HTML chứa shadow host, một phần tử `<span>` trong cây DOM chính, và hai nút:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
<br />

<button id="upper" type="button">Uppercase shadow DOM span elements</button>
<button id="reload" type="button">Reload</button>
```

Lần này nút "Uppercase" dùng `shadowRoot` để tìm các phần tử `<span>` trong DOM:

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);

const upper = document.querySelector("button#upper");
upper.addEventListener("click", () => {
  const spans = Array.from(host.shadowRoot.querySelectorAll("span"));
  for (const span of spans) {
    span.textContent = span.textContent.toUpperCase();
  }
});

const reload = document.querySelector("#reload");
reload.addEventListener("click", () => document.location.reload());
```

Lần này, JavaScript đang chạy trong trang có thể truy cập các phần bên trong shadow DOM:

{{EmbedLiveSample("Element.shadowRoot and the \"mode\" option")}}

Đối số `{mode: "open"}` cho trang một cách để phá vỡ tính đóng gói của shadow DOM. Nếu bạn không muốn trao cho trang khả năng đó, hãy dùng `{mode: "closed"}` thay thế, và khi đó `shadowRoot` sẽ trả về `null`.

Tuy nhiên, bạn không nên xem đây là một cơ chế bảo mật mạnh, vì có những cách để bỏ qua nó, chẳng hạn như extension trình duyệt chạy trong trang. Nó giống một tín hiệu cho thấy trang không nên truy cập nội dung bên trong cây shadow DOM của bạn hơn.

## Đóng gói từ CSS

Trong phiên bản trang này, HTML giống hệt bản gốc:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

Trong JavaScript, chúng ta tạo shadow DOM:

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

Lần này, chúng ta sẽ có CSS nhắm vào các phần tử `<span>` trong trang:

```css
span {
  color: blue;
  border: 1px solid black;
}
```

CSS của trang không ảnh hưởng đến các nút bên trong shadow DOM:

{{EmbedLiveSample("Encapsulation from CSS")}}

## Áp dụng style bên trong shadow DOM

Trong phần này, chúng ta sẽ xem hai cách khác nhau để áp dụng style bên trong cây shadow DOM:

- [_Programmatically_](#constructable_stylesheets), bằng cách tạo một đối tượng {{domxref("CSSStyleSheet")}} và gắn nó vào shadow root.
- [_Declaratively_](#adding_style_elements_in_template_declarations), bằng cách thêm một phần tử {{htmlelement("style")}} trong khai báo của một phần tử {{htmlelement("template")}}.

Trong cả hai trường hợp, các style được định nghĩa trong cây shadow DOM sẽ chỉ áp dụng trong phạm vi cây đó, nên cũng giống như style của trang không ảnh hưởng đến phần tử trong shadow DOM, style của shadow DOM cũng không ảnh hưởng đến phần còn lại của trang.

### Constructable stylesheets

Để tạo style cho phần tử trang trong shadow DOM bằng constructable stylesheet, chúng ta có thể:

1. Tạo một đối tượng {{domxref("CSSStyleSheet")}} rỗng
2. Đặt nội dung của nó bằng {{domxref("CSSStyleSheet.replace()")}} hoặc {{domxref("CSSStyleSheet.replaceSync()")}}
3. Thêm nó vào shadow root bằng cách gán nó cho {{domxref("ShadowRoot.adoptedStyleSheets")}}

Các quy tắc được định nghĩa trong `CSSStyleSheet` sẽ được giới hạn trong cây shadow DOM, cũng như bất kỳ cây DOM nào khác mà chúng ta đã gán nó cho.

Ở đây, một lần nữa, là HTML chứa host của chúng ta và một `<span>`:

```html
<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

Lần này chúng ta sẽ tạo shadow DOM và gán cho nó một đối tượng `CSSStyleSheet`:

```js
const sheet = new CSSStyleSheet();
sheet.replaceSync("span { color: red; border: 2px dotted black;}");

const host = document.querySelector("#host");

const shadow = host.attachShadow({ mode: "open" });
shadow.adoptedStyleSheets = [sheet];

const span = document.createElement("span");
span.textContent = "I'm in the shadow DOM";
shadow.appendChild(span);
```

Các style được định nghĩa trong cây shadow DOM không được áp dụng cho phần còn lại của trang:

{{EmbedLiveSample("Constructable stylesheets")}}

### Thêm phần tử `<style>` trong khai báo `<template>`

Một lựa chọn thay thế cho việc tạo đối tượng `CSSStyleSheet` là chèn một phần tử {{htmlelement("style")}} bên trong phần tử {{htmlelement("template")}} được dùng để định nghĩa web component.

Trong trường hợp này, HTML bao gồm khai báo `<template>`

```html
<template id="my-element">
  <style>
    span {
      color: red;
      border: 2px dotted black;
    }
  </style>
  <span>I'm in the shadow DOM</span>
</template>

<div id="host"></div>
<span>I'm not in the shadow DOM</span>
```

Trong JavaScript, chúng ta sẽ tạo shadow DOM và thêm nội dung của `<template>` vào đó:

```js
const host = document.querySelector("#host");
const shadow = host.attachShadow({ mode: "open" });
const template = document.getElementById("my-element");

shadow.appendChild(template.content);
```

Một lần nữa, các style được định nghĩa trong `<template>` chỉ được áp dụng bên trong cây shadow DOM, chứ không phải phần còn lại của trang:

{{EmbedLiveSample("adding_style_elements_in_template_declarations")}}

### Chọn giữa cách lập trình và cách khai báo

Chọn phương án nào phụ thuộc vào ứng dụng của bạn và sở thích cá nhân.

Tạo một `CSSStyleSheet` và gán nó cho shadow root bằng `adoptedStyleSheets` cho phép bạn tạo một stylesheet duy nhất rồi chia sẻ nó giữa nhiều cây DOM. Ví dụ, một thư viện component có thể tạo một stylesheet duy nhất rồi chia sẻ nó cho tất cả custom element thuộc thư viện đó. Trình duyệt sẽ phân tích stylesheet đó một lần. Ngoài ra, bạn có thể thay đổi stylesheet một cách động và các thay đổi đó sẽ lan sang mọi component dùng sheet này.

Cách gắn một phần tử `<style>` rất phù hợp nếu bạn muốn làm theo kiểu khai báo, có ít style, và không cần chia sẻ style giữa các component khác nhau.

## Shadow DOM và custom elements

Nếu không có tính đóng gói do shadow DOM cung cấp, [custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements) sẽ cực kỳ mong manh. Một trang web có thể rất dễ vô tình phá vỡ hành vi hoặc bố cục của custom element bằng cách chạy một ít JavaScript hoặc CSS của trang. Với tư cách là nhà phát triển custom element, bạn sẽ không bao giờ biết liệu các selector áp dụng bên trong custom element của mình có xung đột với những selector đang áp dụng trong trang sử dụng custom element đó hay không.

Custom element được triển khai dưới dạng một class mở rộng {{domxref("HTMLElement")}} cơ sở hoặc một phần tử HTML built-in như {{domxref("HTMLParagraphElement")}}. Thông thường, chính custom element là shadow host, và phần tử này tạo nhiều phần tử bên dưới root đó để cung cấp phần triển khai nội bộ của nó.

Ví dụ dưới đây tạo custom element `<filled-circle>` chỉ render một hình tròn được tô bằng một màu đơn.

```js
class FilledCircle extends HTMLElement {
  constructor() {
    super();
  }
  connectedCallback() {
    // Create a shadow root
    // The custom element itself is the shadow host
    const shadow = this.attachShadow({ mode: "open" });

    // create the internal implementation
    const svg = document.createElementNS("http://www.w3.org/2000/svg", "svg");
    const circle = document.createElementNS(
      "http://www.w3.org/2000/svg",
      "circle",
    );
    circle.setAttribute("cx", "50");
    circle.setAttribute("cy", "50");
    circle.setAttribute("r", "50");
    circle.setAttribute("fill", this.getAttribute("color"));
    svg.appendChild(circle);

    shadow.appendChild(svg);
  }
}

customElements.define("filled-circle", FilledCircle);
```

```html
<filled-circle color="blue"></filled-circle>
```

{{EmbedLiveSample("Shadow DOM and custom elements", 100, 160)}}

Để xem thêm ví dụ minh họa các khía cạnh khác nhau của việc triển khai custom element, hãy xem [hướng dẫn về custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements) của chúng tôi.

## Xem thêm

- [Using custom elements](/en-US/docs/Web/API/Web_components/Using_custom_elements)
- [Using templates and slots](/en-US/docs/Web/API/Web_components/Using_templates_and_slots)
- {{domxref("Element.attachShadow()")}}
- {{domxref("ShadowRoot.adoptedStyleSheets")}}
- {{domxref("CSSStyleSheet.replace()")}}
- {{domxref("CSSStyleSheet.replaceSync()")}}
- {{HTMLelement("template")}}
- [CSS scoping](/en-US/docs/Web/CSS/Guides/Scoping) module
- {{CSSXref(":host")}}
- {{cssxref(":host()")}}
- {{CSSXref(":host-context", ":host-context()")}}
- {{CSSXref("::slotted", "::slotted()")}}
- [CSS shadow parts](/en-US/docs/Web/CSS/Guides/Shadow_parts) module
- {{CSSXref("::part")}}
