---
title: "@starting-style"
slug: Web/CSS/Reference/At-rules/@starting-style
page-type: css-at-rule
browser-compat: css.at-rules.starting-style
sidebar: cssref
---

**`@starting-style`** là một [quy tắc at](/en-US/docs/Web/CSS/Guides/Syntax/At-rules) của [CSS](/en-US/docs/Web/CSS) được dùng để xác định các giá trị khởi đầu cho các thuộc tính được đặt trên một phần tử mà bạn muốn chuyển tiếp từ đó khi phần tử nhận bản cập nhật kiểu đầu tiên, tức là khi một phần tử được hiển thị lần đầu trên một trang đã được tải.

## Cú pháp

Quy tắc at `@starting-style` có thể được dùng theo hai cách:

1. Là một khối độc lập, trong đó nó chứa một hoặc nhiều tập hợp quy tắc xác định các khai báo kiểu khởi đầu và chọn các phần tử mà chúng áp dụng:

   ```css
   @starting-style {
     /* rulesets */
   }
   ```

2. Lồng trong một tập hợp quy tắc hiện có, trong đó nó chứa một hoặc nhiều khai báo xác định các giá trị thuộc tính khởi đầu cho các phần tử đã được chọn bởi tập hợp quy tắc đó:

   ```css
   selector {
     /* existing ruleset */
     /* ... */

     @starting-style {
       /* declarations */
     }
   }
   ```

## Mô tả

Để tránh hành vi không mong muốn, [các chuyển tiếp CSS](/en-US/docs/Web/CSS/Guides/Transitions) theo mặc định không được kích hoạt trên bản cập nhật kiểu khởi đầu của phần tử, hoặc khi loại {{CSSxRef("display")}} của nó thay đổi từ `none` sang giá trị khác. Để bật các chuyển tiếp kiểu đầu tiên, các quy tắc `@starting-style` là cần thiết. Chúng cung cấp các kiểu khởi đầu cho các phần tử không có trạng thái trước đó, xác định các giá trị thuộc tính để chuyển tiếp từ đó.

`@starting-style` đặc biệt hữu ích khi tạo các hoạt ảnh vào và ra cho các phần tử hiển thị trong {{glossary("top layer")}} (như [popover](/en-US/docs/Web/API/Popover_API) và {{htmlelement("dialog")}} modal), các phần tử đang thay đổi đến và từ `display: none`, và các phần tử khi lần đầu được thêm vào hoặc xóa khỏi DOM.

> [!NOTE]
> `@starting-style` chỉ liên quan đến các chuyển tiếp CSS. Khi dùng [các hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations) để triển khai các hiệu ứng như vậy, `@starting-style` không cần thiết. Xem [Sử dụng hoạt ảnh CSS](/en-US/docs/Web/CSS/Guides/Animations/Using) để có ví dụ.

Có hai cách để dùng `@starting-style`: như một quy tắc độc lập hoặc lồng trong một tập hợp quy tắc.

Hãy xem xét một tình huống trong đó chúng ta muốn tạo hoạt ảnh cho một [popover](/en-US/docs/Web/API/Popover_API) khi hiển thị (tức là khi được thêm vào lớp trên cùng). "Quy tắc gốc" chỉ định các kiểu cho popover đang mở có thể trông như thế này (xem [ví dụ popover](#animating_a_popover) bên dưới):

```css
[popover]:popover-open {
  opacity: 1;
  transform: scaleX(1);
}
```

Để chỉ định các giá trị khởi đầu của các thuộc tính popover sẽ được hoạt ảnh bằng phương pháp đầu tiên, bạn đặt một khối `@starting-style` độc lập trong CSS:

```css
@starting-style {
  [popover]:popover-open {
    opacity: 0;
    transform: scaleX(0);
  }
}
```

> [!NOTE]
> Quy tắc at `@starting-style` và "quy tắc gốc" có cùng [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity). Để đảm bảo các kiểu khởi đầu được áp dụng, hãy đặt quy tắc at `@starting-style` _sau_ "quy tắc gốc". Nếu bạn chỉ định quy tắc at `@starting-style` trước "quy tắc gốc", các kiểu gốc sẽ ghi đè các kiểu khởi đầu.

Để chỉ định kiểu khởi đầu cho popover bằng phương pháp lồng, bạn có thể lồng khối `@starting-style` trong "quy tắc gốc":

```css
[popover]:popover-open {
  opacity: 1;
  transform: scaleX(1);

  @starting-style {
    opacity: 0;
    transform: scaleX(0);
  }
}
```

### Khi nào thì các kiểu khởi đầu được dùng?

Điều quan trọng cần hiểu là một phần tử sẽ chuyển tiếp từ các kiểu `@starting-style` của nó khi nó được hiển thị lần đầu trong DOM, hoặc khi nó chuyển tiếp từ {{cssxref("display", "display: none")}} sang giá trị hiển thị. Khi nó chuyển tiếp trở lại từ trạng thái hiển thị ban đầu, nó sẽ không còn dùng các kiểu `@starting-style` vì nó hiện đang hiển thị trong DOM. Thay vào đó, nó sẽ chuyển tiếp trở lại bất kỳ kiểu nào tồn tại cho trạng thái mặc định của phần tử đó.

Thực tế, có ba trạng thái kiểu cần quản lý trong các tình huống này — trạng thái kiểu khởi đầu, trạng thái đã chuyển tiếp, và trạng thái mặc định. Có thể có sự khác nhau giữa các chuyển tiếp "đến" và "từ" trong các trường hợp như vậy. Bạn có thể thấy bằng chứng về điều này trong ví dụ [Minh họa khi nào kiểu khởi đầu được dùng](#demonstration_of_when_starting_styles_are_used) của chúng ta, bên dưới.

## Cú pháp chính thức

{{CSSSyntaxRaw(`@starting-style = @starting-style { <rule-list> }`)}}

## Ví dụ

### Cách dùng `@starting-style` cơ bản

Chuyển tiếp {{cssxref("background-color")}} của phần tử từ trong suốt sang xanh lá cây khi nó được hiển thị lần đầu:

```css
#target {
  transition: background-color 1.5s;
  background-color: green;
}

@starting-style {
  #target {
    background-color: transparent;
  }
}
```

Chuyển tiếp {{cssxref("opacity")}} của phần tử khi nó thay đổi giá trị {{cssxref("display")}} sang hoặc từ `none`:

```css
#target {
  transition-property: opacity, display;
  transition-duration: 0.5s;
  display: block;
  opacity: 1;
  @starting-style {
    opacity: 0;
  }
}

#target.hidden {
  display: none;
  opacity: 0;
}
```

### Minh họa khi nào kiểu khởi đầu được dùng

Trong ví dụ này, một nút được nhấn để tạo phần tử {{htmlelement("div")}}, gán cho nó `class` là `showing`, và thêm nó vào DOM.

`showing` được gán `@starting-style` là `background-color: red` và kiểu `background-color: blue` để chuyển tiếp đến. Tập hợp quy tắc `div` mặc định chứa `background-color: yellow`, và cũng là nơi đặt `transition`.

Khi `<div>` được thêm lần đầu vào DOM, bạn sẽ thấy nền chuyển từ đỏ sang xanh lam. Sau một khoảng thời gian chờ, chúng ta xóa class `showing` khỏi `<div>` qua JavaScript. Lúc đó nó chuyển từ xanh lam trở lại vàng, không phải đỏ. Điều này chứng minh rằng các kiểu khởi đầu chỉ được dùng khi phần tử được hiển thị lần đầu trong DOM. Một khi nó đã xuất hiện, phần tử chuyển tiếp trở lại kiểu mặc định được đặt cho nó.

Sau một khoảng thời gian chờ khác, chúng ta loại bỏ `<div>` hoàn toàn khỏi DOM, đặt lại trạng thái ban đầu của ví dụ để có thể chạy lại.

#### HTML

```html
<button>Display <code>&lt;div&gt;</code></button>
```

#### CSS

```css hidden
div {
  width: 200px;
  height: 100px;
  border: 1px solid black;
  margin-top: 10px;
}

div::after {
  content: "class: " attr(class);
  position: relative;
  top: 3px;
  left: 3px;
}
```

```css
div {
  background-color: yellow;
  transition: background-color 3s;
}

div.showing {
  background-color: skyblue;
}

@starting-style {
  div.showing {
    background-color: red;
  }
}
```

#### JavaScript

```js
const btn = document.querySelector("button");

btn.addEventListener("click", () => {
  btn.disabled = true;
  const divElem = document.createElement("div");
  divElem.classList.add("showing");
  document.body.append(divElem);

  setTimeout(() => {
    divElem.classList.remove("showing");

    setTimeout(() => {
      divElem.remove();
      btn.disabled = false;
    }, 3000);
  }, 3000);
});
```

#### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("Demonstration of when starting styles are used", "100%", "150") }}

### Tạo hoạt ảnh cho popover

Trong ví dụ này, một [popover](/en-US/docs/Web/API/Popover_API) được tạo hoạt ảnh bằng [các chuyển tiếp CSS](/en-US/docs/Web/CSS/Guides/Transitions). Các hoạt ảnh vào và ra cơ bản được cung cấp bằng thuộc tính {{CSSxRef("transition")}}.

#### HTML

HTML bao gồm một phần tử {{htmlelement("div")}} được khai báo là popover bằng thuộc tính [popover](/en-US/docs/Web/HTML/Reference/Global_attributes/popover) và một phần tử {{htmlelement("button")}} được chỉ định là nút điều khiển hiển thị popover bằng thuộc tính [popovertarget](/en-US/docs/Web/HTML/Reference/Elements/button#popovertarget).

```html
<button popovertarget="mypopover">Show the popover</button>
<div popover="auto" id="mypopover">I'm a Popover! I should animate.</div>
```

#### CSS

Trong ví dụ này, chúng ta muốn tạo hoạt ảnh cho hai thuộc tính, {{cssxref("opacity")}} và {{cssxref("transform")}} (cụ thể là một biến đổi thu phóng theo chiều ngang), để làm cho popover mờ dần vào và ra cũng như thu phóng theo chiều ngang.

```css
html {
  font-family: "Helvetica", "Arial", sans-serif;
}

[popover]:popover-open {
  opacity: 1;
  transform: scaleX(1);
}

[popover] {
  font-size: 1.2rem;
  padding: 10px;

  /* Final state of the exit animation */
  opacity: 0;
  transform: scaleX(0);

  transition:
    opacity 0.7s,
    transform 0.7s,
    overlay 0.7s allow-discrete,
    display 0.7s allow-discrete;
  /* Equivalent to
  transition: all 0.7s allow-discrete; */
}

/* Include after the [popover]:popover-open rule */
@starting-style {
  [popover]:popover-open {
    opacity: 0;
    transform: scaleX(0);
  }
}

/* Transition for the popover's backdrop */
[popover]::backdrop {
  background-color: transparent;
  transition:
    display 0.7s allow-discrete,
    overlay 0.7s allow-discrete,
    background-color 0.7s;
  /* Equivalent to
  transition: all 0.7s allow-discrete; */
}

[popover]:popover-open::backdrop {
  background-color: rgb(0 0 0 / 25%);
}

/* Nesting (&) is not supported for pseudo-elements
so specify a standalone starting-style block. */
@starting-style {
  [popover]:popover-open::backdrop {
    background-color: transparent;
  }
}
```

Để đạt được điều này, chúng ta đã đặt trạng thái khởi đầu cho các thuộc tính này trên trạng thái ẩn mặc định của phần tử popover (được chọn qua `[popover]`), và trạng thái kết thúc trên trạng thái mở của popover (được chọn qua lớp giả {{cssxref(":popover-open")}}).

Chúng ta sau đó đặt thuộc tính {{cssxref("transition")}} để tạo hoạt ảnh giữa hai trạng thái. Trạng thái khởi đầu cho hoạt ảnh được đặt trong quy tắc at `@starting-style` để bật hoạt ảnh vào.

Vì phần tử được hoạt ảnh được đưa lên {{glossary("top layer")}} khi hiển thị và bị xóa khỏi lớp trên cùng khi ẩn (với {{cssxref("display", "display: none")}}), một số bước bổ sung là cần thiết để đảm bảo hoạt ảnh hoạt động theo cả hai chiều:

- `display` được thêm vào danh sách các phần tử chuyển tiếp để đảm bảo phần tử được hoạt ảnh hiển thị (được đặt thành `display: block` hoặc giá trị `display` hiển thị khác) trong suốt cả hoạt ảnh vào và ra. Không có điều này, hoạt ảnh ra sẽ không hiển thị; thực tế, popover sẽ chỉ biến mất. Lưu ý rằng giá trị {{cssxref("transition-behavior", "transition-behavior: allow-discrete")}} cũng được đặt trong tốc ký để kích hoạt hoạt ảnh.
- {{cssxref("overlay")}} được thêm vào danh sách các phần tử chuyển tiếp để đảm bảo rằng việc xóa phần tử khỏi lớp trên cùng bị trì hoãn cho đến khi hoạt ảnh kết thúc. Điều này không tạo ra sự khác biệt lớn cho các hoạt ảnh như thế này, nhưng trong các trường hợp phức tạp hơn, không làm điều này có thể dẫn đến phần tử bị xóa khỏi overlay quá nhanh, có nghĩa là hoạt ảnh không mượt mà hoặc hiệu quả. Một lần nữa, `transition-behavior: allow-discrete` là cần thiết trong trường hợp này để hoạt ảnh xảy ra.

> [!NOTE]
> Chúng ta cũng đã đặt chuyển tiếp trên {{cssxref("::backdrop")}} xuất hiện phía sau popover khi nó mở, để cung cấp hoạt ảnh tối đẹp. `[popover]:popover-open::backdrop` được dùng để chọn backdrop khi popover đang mở.

#### Kết quả

Mã hiển thị như sau:

{{ EmbedLiveSample("Animating a popover", "100%", "200") }}

> [!NOTE]
> Vì các popover thay đổi từ `display: none` sang `display: block` mỗi khi chúng được hiển thị, popover chuyển tiếp từ các kiểu `@starting-style` sang các kiểu `[popover]:popover-open` mỗi lần hoạt ảnh vào xảy ra. Khi popover đóng, nó chuyển tiếp từ trạng thái `[popover]:popover-open` sang trạng thái `[popover]` mặc định.

> [!NOTE]
> Bạn có thể tìm thấy ví dụ minh họa chuyển tiếp phần tử {{htmlelement("dialog")}} và backdrop của nó khi nó được hiển thị và ẩn trên trang tham chiếu `<dialog>` — xem [Transitioning dialog elements](/en-US/docs/Web/HTML/Reference/Elements/dialog#transitioning_dialog_elements).

### Chuyển tiếp phần tử khi thêm và xóa khỏi DOM

Ví dụ này chứa một nút mà khi được nhấn, sẽ thêm các phần tử mới vào bộ chứa {{htmlelement("section")}}. Mỗi phần tử, lần lượt, chứa một nút lồng, khi được nhấn, xóa phần tử đó. Ví dụ này minh họa cách dùng các chuyển tiếp để tạo hoạt ảnh cho các phần tử khi chúng được thêm vào hoặc xóa khỏi DOM.

#### HTML

```html
<button>Create new column</button>
<section></section>
```

#### JavaScript

JavaScript cho phép thêm và xóa các phần tử:

```js
const btn = document.querySelector("button");
const sectionElem = document.querySelector("section");

btn.addEventListener("click", createColumn);

function randomBackground() {
  function randomNum() {
    return Math.floor(Math.random() * 255);
  }
  const baseColor = `${randomNum()} ${randomNum()} ${randomNum()}`;

  return `linear-gradient(to right, rgb(${baseColor} / 0), rgb(${baseColor} / 0.5))`;
}

function createColumn() {
  const divElem = document.createElement("div");
  divElem.style.background = randomBackground();

  const closeBtn = document.createElement("button");
  closeBtn.textContent = "✖";
  closeBtn.setAttribute("aria-label", "close");
  divElem.append(closeBtn);
  sectionElem.append(divElem);

  closeBtn.addEventListener("click", () => {
    divElem.classList.add("fade-out");

    setTimeout(() => {
      divElem.remove();
    }, 1000);
  });
}
```

Khi nút "Create new column" được nhấn, hàm `createColumn()` được gọi. Hàm này tạo phần tử {{htmlelement("div")}} với màu nền được tạo ngẫu nhiên và phần tử {{htmlelement("button")}} để đóng `<div>`. Sau đó nó thêm `<button>` vào `<div>` và `<div>` vào bộ chứa `<section>`.

Chúng ta sau đó thêm event listener vào nút đóng qua {{domxref("EventTarget.addEventListener", "addEventListener()")}}. Nhấn nút đóng thực hiện hai việc:

- Thêm class `fade-out` vào `<div>`. Việc thêm class kích hoạt hoạt ảnh ra được đặt trên class đó.
- Xóa `<div>` sau độ trễ 1000ms. {{domxref("Window.setTimeout", "setTimeout()")}} trì hoãn việc xóa `<div>` khỏi DOM (qua {{domxref("Element.remove()")}}) cho đến khi hoạt ảnh kết thúc.

#### CSS

Chúng ta đặt {{cssxref("transition")}} tạo hoạt ảnh cho {{cssxref("opacity")}} và {{cssxref("scale")}} của mỗi cột khi chúng được thêm vào và xóa:

```css hidden
html * {
  box-sizing: border-box;
  font-family: sans-serif;
}

body {
  margin: 0;
  display: flex;
  flex-direction: column;
  height: 100vh;
  gap: 10px;
}

body > button {
  margin: 10px 10px 0 10px;
}

section {
  display: flex;
  flex: 1;
  gap: 10px;
  margin: 10px;
}
```

```css
div {
  flex: 1;
  border: 1px solid gray;
  position: relative;
  opacity: 1;
  scale: 1 1;

  transition:
    opacity 0.7s,
    scale 0.7s,
    display 0.7s allow-discrete,
    all 0.7s allow-discrete;
  /* Equivalent to
  transition: all 0.7s allow-discrete; */
}

/* Include after the `div` rule */
@starting-style {
  div {
    opacity: 0;
    scale: 1 0;
  }
}

.fade-out {
  opacity: 0;
  display: none;
  scale: 1 0;
}

div > button {
  font-size: 1.6rem;
  background: none;
  border: 0;
  text-shadow: 2px 1px 1px white;
  border-radius: 15px;
  position: absolute;
  top: 1px;
  right: 1px;
  cursor: pointer;
}
```

Để tạo hoạt ảnh cho {{cssxref("opacity")}} và {{cssxref("scale")}} của mỗi `<div>` khi nó được thêm vào DOM và sau đó đảo ngược hoạt ảnh khi nó được xóa khỏi DOM, chúng ta:

- Chỉ định trạng thái kết thúc của các thuộc tính chúng ta muốn chuyển tiếp trên quy tắc `div { ... }`.
- Chỉ định trạng thái khởi đầu để chuyển tiếp các thuộc tính từ đó bên trong khối `@starting-style`.
- Chỉ định hoạt ảnh ra bên trong quy tắc `.fade-out` — đây là class mà JavaScript gán cho các phần tử `<div>` khi các nút đóng được nhấn. Ngoài việc đặt trạng thái kết thúc `opacity` và `scale`, chúng ta cũng đặt [`display: none`](/en-US/docs/Web/CSS/Reference/Properties/display) trên các `<div>` — chúng ta muốn chúng trở nên không khả dụng ngay lập tức khi bị xóa khỏi giao diện.
- Chỉ định danh sách {{cssxref("transition")}} bên trong quy tắc `div { ... }` để tạo hoạt ảnh cho `opacity`, `scale`, và `display`. Lưu ý rằng đối với `display`, giá trị {{cssxref("transition-behavior", "transition-behavior: allow-discrete")}} cũng được đặt trong tốc ký để nó có thể tạo hoạt ảnh.

#### Kết quả

Kết quả cuối cùng trông như thế này:

{{ EmbedLiveSample("Transitioning elements on DOM addition and removal", "100%", "400") }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Các chuyển tiếp CSS](/en-US/docs/Web/CSS/Guides/Transitions) module
- {{cssxref("overlay")}}
- {{cssxref("transition-behavior")}}
- {{domxref("CSSStartingStyleRule")}}
- [Four new CSS features for smooth entry and exit animations](https://developer.chrome.com/blog/entry-exit-animations/) on developer.chrome.com (2023)
