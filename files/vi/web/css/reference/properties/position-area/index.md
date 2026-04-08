---
title: position-area
slug: Web/CSS/Reference/Properties/position-area
page-type: css-property
browser-compat: css.properties.position-area
sidebar: cssref
---

Thuộc tính **`position-area`** [CSS](/en-US/docs/Web/CSS) cho phép một phần tử được định vị neo được đặt tương đối với các cạnh của phần tử neo liên kết bằng cách đặt phần tử được định vị trên một hoặc nhiều ô của một lưới 3x3 ngầm định, trong đó phần tử neo là ô trung tâm.

`position-area` cung cấp một giải pháp thay thế thuận tiện cho việc gắn kết và định vị một phần tử tương đối với neo thông qua {{glossary("inset properties")}} và hàm {{cssxref("anchor()")}}. Khái niệm dựa trên lưới giải quyết trường hợp sử dụng phổ biến là định vị các cạnh của khối chứa của phần tử được định vị tương đối với các cạnh của phần tử neo mặc định của nó.

Nếu một phần tử không có phần tử neo mặc định, hoặc không phải là phần tử được định vị tuyệt đối, thuộc tính này không có hiệu lực.

> [!NOTE]
> Thuộc tính này ban đầu được đặt tên và hỗ trợ trong các trình duyệt Chromium là `inset-area`, với các giá trị thuộc tính giống nhau. Cả hai tên thuộc tính sẽ được hỗ trợ trong một thời gian ngắn, cho mục đích tương thích ngược.

## Cú pháp

```css
/* Giá trị mặc định */
position-area: none;

/* Hai từ khóa <position-area> xác định một ô cụ thể */
position-area: top left;
position-area: start end;
position-area: block-start center;
position-area: inline-start block-end;
position-area: x-start y-end;
position-area: center self-y-end;

/* Hai từ khóa <position-area> trải rộng hai ô */
position-area: top span-left;
position-area: center span-start;
position-area: inline-start span-block-end;
position-area: y-start span-x-end;

/* Hai từ khóa <position-area> trải rộng ba ô */
position-area: top span-all;
position-area: block-end span-all;
position-area: self-x-start span-all;

/* Một từ khóa <position-area> với từ khóa thứ hai ngầm định  */
position-area: top; /* equiv: top span-all */
position-area: inline-start; /* equiv: inline-start span-all */
position-area: center; /* equiv: center center */
position-area: span-all; /* equiv: center center */
position-area: end; /* equiv: end end */

/* Giá trị toàn cục */
position-area: inherit;
position-area: initial;
position-area: revert;
position-area: revert-layer;
position-area: unset;
```

### Giá trị

Giá trị thuộc tính là hai từ khóa `<position-area>`, hoặc từ khóa `none`. Nếu chỉ cung cấp một từ khóa `<position-area>`, từ khóa thứ hai được suy ra.

- [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value)
  - : Xác định vùng của lưới vùng vị trí để đặt các phần tử được định vị đã chọn.

- `none`
  - : Không có vùng vị trí nào được đặt.

## Mô tả

Thuộc tính `position-area` cung cấp một giải pháp thay thế cho hàm `anchor()` để định vị các phần tử tương đối với các neo. `position-area` hoạt động dựa trên khái niệm lưới 3x3 của các ô, được gọi là **lưới vùng vị trí**, với phần tử neo là ô trung tâm:

![Lưới vùng vị trí, như được mô tả bên dưới](/shared-assets/images/diagrams/css/anchor-positioning/position-area.svg)

Các ô lưới được chia thành các hàng và cột:

- Ba hàng được biểu diễn bởi các [giá trị vật lý](/en-US/docs/Web/CSS/Reference/Values/position-area_value#physical_grid_keywords) `top`, `center` và `bottom`. Chúng cũng có [các tương đương logic](/en-US/docs/Web/CSS/Reference/Values/position-area_value#logical_grid_keywords) như `block-start`, `center` và `block-end`, và [các tương đương tọa độ](/en-US/docs/Web/CSS/Reference/Values/position-area_value#coordinate_grid_keywords) — `y-start`, `center` và `y-end`.
- Ba cột được biểu diễn bởi các giá trị vật lý `left`, `center` và `right`. Chúng cũng có các tương đương logic như `inline-start`, `center` và `inline-end`, và các tương đương tọa độ — `x-start`, `center` và `x-end`.

Kích thước của ô trung tâm được xác định bởi [khối chứa](/en-US/docs/Web/CSS/Guides/Display/Containing_block) của phần tử neo, trong khi kích thước của cạnh ngoài của lưới được xác định bởi khối chứa của phần tử được định vị.

Giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value) được tạo thành từ một hoặc hai từ khóa, xác định vùng lưới mà phần tử được định vị cần được đặt vào. Cụ thể, khối chứa của phần tử được định vị được đặt thành vùng lưới đó.

Ví dụ:

- Bạn có thể chỉ định giá trị hàng và giá trị cột để đặt phần tử được định vị vào một ô lưới cụ thể — ví dụ, `top left` (tương đương logic `start start`) hoặc `bottom center` (tương đương logic `end center`) sẽ đặt phần tử được định vị vào ô trên phải hoặc ô dưới giữa.
- Bạn có thể chỉ định giá trị hàng hoặc cột cộng với giá trị `span-*` để trải rộng hai hoặc ba ô. Giá trị đầu tiên xác định hàng hoặc cột để đặt phần tử được định vị, ban đầu đặt nó vào trung tâm, và giá trị kia xác định các ô khác của hàng hoặc cột đó để trải rộng. Ví dụ:
  - `top span-left` khiến phần tử được định vị được đặt vào trung tâm của hàng trên, và trải rộng qua các ô trung tâm và bên trái của hàng đó.
  - `block-end span-inline-end` khiến phần tử được định vị được đặt vào trung tâm của hàng cuối khối, và trải rộng qua các ô trung tâm và cuối inline của hàng đó.
  - `bottom span-all` và `y-end span-all` khiến phần tử được định vị được đặt vào trung tâm của hàng dưới, và trải rộng qua ba ô, trong trường hợp này là các ô trái, giữa và phải của hàng dưới.

Để biết thông tin chi tiết về các tính năng neo, cách sử dụng và thuộc tính `position-area`, hãy xem mô-đun [Định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Sử dụng định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using), cụ thể là phần về [thiết lập `position-area`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#setting_a_position-area).

### Hành vi mặc định đã điều chỉnh

Khi giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value) được đặt trên một phần tử được định vị, một số thuộc tính của nó sẽ có hành vi mặc định được điều chỉnh để cung cấp căn chỉnh mặc định tốt.

#### Giá trị `normal` của thuộc tính tự căn chỉnh

Giá trị `normal` của các thuộc tính tự căn chỉnh, bao gồm {{cssxref("align-items")}}, {{cssxref("align-self")}}, {{cssxref("justify-items")}} và {{cssxref("justify-self")}}, hoạt động như `start`, `end` hoặc [`anchor-center`](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using#centering_on_the_anchor_using_anchor-center). Giá trị mà thuộc tính tự căn chỉnh mặc định phụ thuộc vào vị trí của phần tử:

- Nếu giá trị `position-area` chỉ định vùng trung tâm trong một trục, căn chỉnh mặc định trong trục đó là `anchor-center`.
- Nếu không, hành vi sẽ ngược lại với vùng được chỉ định bởi thuộc tính `position-area`. Ví dụ, nếu giá trị `position-area` chỉ định vùng bắt đầu của trục của nó, căn chỉnh mặc định trong trục đó là `end`.

Ví dụ, nếu `writing-mode` được đặt là `horizontal-tb`, `position-area: top span-x-start` khiến phần tử được định vị được đặt vào trung tâm của hàng trên, và trải rộng qua các ô trung tâm và bắt đầu của hàng đó. Trong trường hợp này, các thuộc tính tự căn chỉnh sẽ mặc định là `align-self: end` và `justify-self: anchor-center`.

#### Thuộc tính và giá trị inset

Khi một phần tử được định vị neo được định vị bằng thuộc tính `position-area`, bất kỳ {{glossary("inset properties")}} nào được đặt, chẳng hạn như {{cssxref("top")}} hoặc {{cssxref("inset-inline-end")}}, sẽ xác định độ lệch từ vùng vị trí. Một số giá trị thuộc tính khác, như [`max-block-size: 100%`](/en-US/docs/Web/CSS/Reference/Properties/max-block-size), cũng sẽ tương đối với vùng vị trí. Bất kỳ thuộc tính inset nào được đặt hoặc mặc định là `auto` sẽ hoạt động như thể giá trị của chúng được đặt là `0`.

### Về chiều rộng của phần tử được định vị

Nếu phần tử được định vị không có kích thước cụ thể được đặt trên nó, kích thước của nó sẽ mặc định là [kích thước nội tại](/en-US/docs/Glossary/Intrinsic_Size) của nó, nhưng nó cũng sẽ bị ảnh hưởng bởi kích thước của lưới vùng vị trí.

Nếu phần tử được định vị được đặt trong một ô đơn trên-giữa, dưới-giữa hoặc giữa-giữa, kích thước khối của nó sẽ bằng kích thước khối chứa của neo, lớn lên, xuống hoặc cả hai hướng tương ứng. Phần tử được định vị sẽ căn chỉnh với ô lưới đã chỉ định nhưng áp dụng cùng chiều rộng như phần tử neo. Tuy nhiên, nó sẽ không cho phép nội dung tràn ra — chiều rộng tối thiểu của nó sẽ là `min-content` của nó (như được xác định bởi chiều rộng của từ dài nhất của nó).

Nếu phần tử được định vị được đặt trong bất kỳ ô lưới đơn nào khác (chẳng hạn với `position-area: top left`) hoặc được đặt để trải rộng hai hoặc nhiều ô lưới (ví dụ sử dụng `position-area: bottom span-all`), nó sẽ căn chỉnh với vùng lưới đã chỉ định nhưng hoạt động như thể nó có {{cssxref("width")}} là `max-content` được đặt trên nó. Nó đang được định kích thước theo kích thước khối chứa của nó, là kích thước được áp đặt lên nó khi được đặt là `position: fixed`. Nó sẽ kéo dài rộng như nội dung văn bản, mặc dù nó cũng có thể bị giới hạn bởi cạnh của `<body>`.

### Sử dụng `position-area` để định vị popover

Khi sử dụng `position-area` để định vị [popover](/en-US/docs/Web/HTML/Reference/Global_attributes/popover), hãy lưu ý rằng [các kiểu mặc định cho popover](https://html.spec.whatwg.org/multipage/rendering.html#flow-content-3:~:text=%5Bpopover%5D%20%7B) có thể xung đột với vị trí bạn đang cố đạt được. Các thủ phạm thường gặp là các kiểu mặc định cho `margin` và `inset`, vì vậy nên đặt lại những kiểu đó:

```css
.my-popover {
  margin: 0;
  inset: auto;
}
```

Nhóm làm việc CSS đang [xem xét các cách để tránh yêu cầu cách giải quyết này](https://github.com/w3c/csswg-drafts/issues/10258).

## Định nghĩa hình thức

{{cssinfo}}

## Cú pháp hình thức

{{csssyntax}}

## Ví dụ

### Ví dụ cơ bản

Trong ví dụ này, một phần tử được định vị được gắn kết và định vị tương đối với neo liên kết của nó bằng thuộc tính `position-area`.

#### HTML

HTML bao gồm một {{htmlelement("div")}} và một {{htmlelement("p")}}. `<p>` sẽ được định vị tương đối với `<div>` bằng CSS. Chúng ta cũng bao gồm một khối style sẽ được hiển thị. Tất cả các phần tử được đặt để có thể chỉnh sửa trực tiếp thông qua thuộc tính [`contenteditable`](/en-US/docs/Web/HTML/Reference/Global_attributes/contenteditable).

```html-nolint
<div class="anchor" contenteditable="true">⚓︎</div>

<p class="positionedElement" contenteditable="true">This can be edited.</p>

<style contenteditable="true">.positionedElement {
    position-area: top center;
  }
</style>
```

#### CSS

Chúng ta chuyển `<div>` thành một phần tử neo với thuộc tính {{cssxref("anchor-name")}}. Sau đó chúng ta liên kết `<p>` được định vị tuyệt đối với nó bằng cách đặt giá trị {{cssxref("position-anchor")}} của nó thành cùng tên neo.

Chúng ta đặt giá trị `position-area` ban đầu là `top center`. Giá trị này được đặt trên bộ chọn `p`, vì vậy giá trị có [độ đặc hiệu](/en-US/docs/Web/CSS/Guides/Cascade/Specificity) thấp hơn bất kỳ giá trị nào được thêm vào [bộ chọn lớp](/en-US/docs/Web/CSS/Reference/Selectors/Class_selectors) `.positionedElement` của khối `<style>`. Do đó, bạn có thể ghi đè giá trị `position-area` ban đầu bằng cách đặt giá trị `position-area` bên trong khối style.

```css
.anchor {
  anchor-name: --infobox;
  background: palegoldenrod;
  font-size: 3em;
  width: fit-content;
  border: 1px solid goldenrod;
  margin: 100px auto;
}

p {
  position: absolute;
  position-anchor: --infobox;
  position-area: top center;
  margin: 0;
  background-color: darkkhaki;
  border: 1px solid darkolivegreen;
}

style {
  display: block;
  white-space: pre;
  font-family: monospace;
  background-color: #ededed;
  -webkit-user-modify: read-write-plaintext-only;
  line-height: 1.5;
  padding: 10px;
}
```

#### Kết quả

{{ EmbedLiveSample("Basic example", "100%", "360") }}

Thử thay đổi lượng văn bản trong phần tử được định vị neo để xem nó lớn lên như thế nào. Ngoài ra, thử thay đổi giá trị của thuộc tính `position-area` thành một giá trị khác, như `center`.

### So sánh giá trị `position-area`

Bản demo này tạo ra một neo và gắn kết một phần tử được định vị với nó. Nó cũng cung cấp một menu thả xuống cho phép bạn chọn các giá trị `position-area` khác nhau để áp dụng cho phần tử được định vị, để xem hiệu ứng của chúng. Một trong các tùy chọn khiến một trường văn bản xuất hiện cho phép bạn nhập giá trị tùy chỉnh. Cuối cùng, một hộp kiểm được cung cấp để bật và tắt `writing-mode: vertical-lr`, cho phép bạn quan sát cách các hiệu ứng của giá trị `position-area` khác nhau giữa các chế độ viết.

#### HTML

Trong HTML, chúng ta chỉ định hai phần tử {{htmlelement("div")}}, một với lớp `anchor` và một với lớp `infobox`. Những phần tử này được dự định là phần tử neo và phần tử được định vị mà chúng ta sẽ liên kết với nhau. Chúng ta đã bao gồm thuộc tính `contenteditable` trên cả hai, làm cho chúng có thể chỉnh sửa trực tiếp.

Chúng ta cũng đã bao gồm hai biểu mẫu chứa các phần tử {{htmlelement("select")}} và [`<input type="text">`](/en-US/docs/Web/HTML/Reference/Elements/input/text) để đặt các giá trị `position-area` khác nhau, và phần tử [`<input type="checkbox">`](/en-US/docs/Web/HTML/Reference/Elements/input/checkbox) để bật/tắt {{cssxref("writing-mode")}} dọc. Mã cho những phần tử này, cùng với JavaScript, đã được ẩn đi để ngắn gọn.

```html
<div class="anchor" contenteditable>⚓︎</div>

<div class="infobox">
  <p contenteditable>You can edit this text.</p>
</div>
```

```html hidden
<form id="position-area-form">
  <div>
    <label for="position-area-select">Choose a position-area:</label>
    <select id="position-area-select" name="position-area-select">
      <optgroup label="Enter custom value">
        <option>Custom</option>
      </optgroup>
      <optgroup label="Physical, single tile">
        <option selected>top left</option>
        <option>bottom right</option>
      </optgroup>
      <optgroup label="Physical, span two">
        <option>bottom span-right</option>
        <option>left span-top</option>
      </optgroup>
      <optgroup label="Physical, span all">
        <option>top</option>
        <option>left</option>
      </optgroup>
      <optgroup label="Logical, single tile">
        <option>start center</option>
        <option>inline-start block-end</option>
      </optgroup>
      <optgroup label="Logical, span two">
        <option>start span-end</option>
        <option>center span-start</option>
        <option>inline-start span-block-end</option>
        <option>span-block-start center</option>
      </optgroup>
      <optgroup label="Logical, span all">
        <option>start span-all</option>
        <option>block-end</option>
      </optgroup>
      <optgroup label="Coordinates, single tile">
        <option>x-start center</option>
        <option>x-end y-end</option>
      </optgroup>
      <optgroup label="Coordinates, span two">
        <option>center span-y-start</option>
        <option>y-start span-x-end</option>
      </optgroup>
      <optgroup label="Coordinates, span all">
        <option>x-start span-all</option>
        <option>y-end</option>
      </optgroup>
    </select>
  </div>
  <div id="position-area-custom-container">
    <label for="position-area-custom">Enter a custom position-area:</label
    ><br />
    <input type="text" id="position-area-custom" name="position-area-custom" />
  </div>
</form>

<form id="writing-mode-form">
  <label for="writing-mode-checkbox">writing-mode: vertical-lr</label><br />
  <input
    type="checkbox"
    id="writing-mode-checkbox"
    name="writing-mode-checkbox" />
</form>
```

#### CSS

Trong CSS, trước tiên chúng ta khai báo `<div>` `anchor` là phần tử neo bằng cách đặt tên neo trên nó thông qua thuộc tính {{cssxref("anchor-name")}}.

Phần tử được định vị được liên kết với phần tử neo bằng cách đặt tên neo của nó làm giá trị của thuộc tính {{cssxref("position-anchor")}} của phần tử được định vị. Chúng ta cũng cung cấp cho nó một vị trí ban đầu với `position-area: top left`; giá trị này sẽ bị ghi đè khi các giá trị mới được chọn từ menu `<select>`. Cuối cùng, chúng ta đặt {{cssxref("opacity")}} của nó là `0.8`, để khi phần tử được định vị được cung cấp giá trị `position-area` đặt nó lên trên neo, bạn vẫn có thể thấy vị trí tương đối của các phần tử.

```css hidden
.anchor {
  font-size: 1.8rem;
  text-align: center;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  min-width: 50px;
  min-height: 50px;
  line-height: 50px;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}

html {
  height: 100%;
}

body {
  margin: 0;
  width: 100vw;
  height: 100vh;
  display: flex;
  justify-content: center;
  align-items: center;
}

form {
  background: white;
  border: 1px solid black;
  padding: 5px;
  position: fixed;
}

#position-area-form {
  top: 0;
  right: 2px;
}

#position-area-form div:last-child {
  margin-top: 10px;
}

#position-area-form div :last-child {
  margin-top: 5px;
}

#writing-mode-form {
  bottom: 0;
  left: 2px;
  writing-mode: horizontal-tb;
}

#position-area-custom-container {
  display: none;
}

.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 5px 2px;
  border-radius: 5px;
  font-size: 1rem;
  box-sizing: border-box;
}
```

```css
.anchor {
  anchor-name: --my-anchor;
}

.infobox {
  position-anchor: --my-anchor;
  position: fixed;
  opacity: 0.8;
  position-area: top left;
}
```

```js hidden
const anchorContainer = document.querySelector("body");
const infobox = document.querySelector(".infobox");

const positionAreaForm = document.querySelector("#position-area-form");
const selectElem = document.querySelector("select");
const inputElemContainer = document.querySelector(
  "#position-area-custom-container",
);
const inputElem = document.querySelector("#position-area-custom");
const checkboxElem = document.querySelector("#writing-mode-checkbox");

// Stop form from submitting when enter is pressed on it
positionAreaForm.addEventListener("submit", (e) => {
  e.preventDefault();
});

// Update positioned element position-area to value selected in drop-down
selectElem.addEventListener("change", () => {
  const area = selectElem.value;

  if (area === "Custom") {
    // Show the custom value input field
    inputElemContainer.style.display = "block";
  } else {
    // Hide the custom value input field
    inputElemContainer.style.display = "none";
    // Set the position-area to the value chosen in the select box
    infobox.style.positionArea = area;
  }
});

// Update positioned element position-area to entered custom value
inputElem.addEventListener("change", () => {
  const customArea = inputElem.value;

  // Set the position-area to the value in the input box
  infobox.style.positionArea = customArea;
});

// Change writing-mode to match checkbox setting
checkboxElem.addEventListener("change", () => {
  if (checkboxElem.checked) {
    anchorContainer.style.writingMode = "vertical-lr";
  } else {
    anchorContainer.style.writingMode = "horizontal-tb";
  }
});
```

#### Kết quả

Kết quả như sau:

{{ EmbedLiveSample("`position-area` value comparison", "100%", "360") }}

Hãy thử chọn các giá trị `position-area` mới từ menu `<select>` để xem hiệu ứng của chúng đối với vị trí của infobox. Chọn giá trị "Custom" và thử nhập một số giá trị `position-area` tùy chỉnh vào trường nhập văn bản để xem hiệu ứng của chúng. Thêm văn bản vào phần tử neo và phần tử được định vị neo để xem phần tử được định vị neo lớn lên như thế nào dựa trên giá trị `position-area`. Cuối cùng, đánh dấu hộp kiểm và sau đó thử nghiệm với các giá trị `position-area` khác nhau để xem giá trị nào cho kết quả giống nhau giữa các chế độ viết và giá trị nào cho kết quả khác nhau.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("anchor-name")}}
- {{cssxref("position-anchor")}}
- {{cssxref("position-try-fallbacks")}}
- Hàm [`anchor()`](/en-US/docs/Web/CSS/Reference/Values/anchor)
- Giá trị [`<position-area>`](/en-US/docs/Web/CSS/Reference/Values/position-area_value)
- Hướng dẫn [Sử dụng định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
- Hướng dẫn [Tùy chọn dự phòng và ẩn có điều kiện khi tràn](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Try_options_hiding)
- Mô-đun [Định vị neo CSS](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
