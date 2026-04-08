---
title: position-anchor
slug: Web/CSS/Reference/Properties/position-anchor
page-type: css-property
browser-compat: css.properties.position-anchor
sidebar: cssref
---

Thuộc tính [CSS](/en-US/docs/Web/CSS) **`position-anchor`** chỉ định tên neo của **phần tử neo** (tức là, một phần tử có **tên neo** được đặt trên nó thông qua thuộc tính {{cssxref("anchor-name")}}) mà một phần tử có vị trí liên kết với.

## Cú pháp

```css
/* Giá trị đơn */
position-anchor: auto;
position-anchor: none;
position-anchor: --anchor-name;

/* Giá trị toàn cục */
position-anchor: inherit;
position-anchor: initial;
position-anchor: revert;
position-anchor: revert-layer;
position-anchor: unset;
```

### Các giá trị

- `auto`
  - : Liên kết phần tử có vị trí với phần tử neo ẩn của nó, nếu có — ví dụ như được đặt bởi thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor) không chuẩn.

- `none`
  - : Giá trị ban đầu (mặc định). Phần tử có vị trí không liên kết với phần tử neo nào.

- {{cssxref("dashed-ident")}}
  - : Tên của phần tử neo để liên kết với phần tử có vị trí, như được liệt kê trong thuộc tính {{cssxref("anchor-name")}} của phần tử neo. Đây được gọi là **bộ chỉ định neo mặc định**.

## Mô tả

Thuộc tính này chỉ liên quan đến các phần tử "có vị trí" — các phần tử và pseudo-element có {{cssxref("position")}} là `absolute` hoặc `fixed`.

Để định vị một phần tử tương đối với phần tử neo, phần tử có vị trí cần ba tính năng: một liên kết, một vị trí và một vị trí địa điểm. Các thuộc tính `position-anchor` và {{cssxref("anchor-name")}} cung cấp một liên kết rõ ràng.

Phần tử neo chấp nhận một hoặc nhiều tên neo `<dashed-ident>` được đặt trên nó thông qua thuộc tính `anchor-name`. Khi một trong những tên đó được đặt làm giá trị của thuộc tính `position-anchor` của phần tử có vị trí, hai phần tử sẽ được liên kết với nhau.

Nếu có nhiều phần tử neo với tên neo được liệt kê trong thuộc tính `position-anchor`, phần tử có vị trí sẽ liên kết với phần tử neo cuối cùng theo thứ tự nguồn có tên neo đó.

Để hủy bỏ liên kết đã tạo trước đó giữa phần tử có vị trí neo và phần tử neo, bạn có thể đặt giá trị `position-anchor` của phần tử có vị trí neo thành `none`.

Để buộc phần tử có vị trí vào neo của nó, nó phải được đặt tương đối với phần tử neo bằng cách dùng tính năng định vị neo, chẳng hạn như hàm {{cssxref("anchor()")}} (đặt làm giá trị trên {{glossary("inset properties")}}) hoặc thuộc tính {{cssxref("position-area")}}.

Nếu neo liên kết bị ẩn, ví dụ với {{cssxref("display", "display: none")}} hoặc {{cssxref("visibility", "visibility: hidden")}}, hoặc nếu nó là một phần của [nội dung bị bỏ qua](/en-US/docs/Web/CSS/Guides/Containment/Using#skips_its_contents) của phần tử khác do phần tử đó có {{cssxref("content-visibility", "content-visibility: hidden")}} được đặt, phần tử có vị trí neo sẽ không được hiển thị.

Thuộc tính `position-anchor` được hỗ trợ trên tất cả các phần tử có vị trí, bao gồm [pseudo-element](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) như {{cssxref("::before")}} và {{cssxref("::after")}}. Pseudo-element được neo ẩn vào cùng phần tử như phần tử gốc của pseudo-element, trừ khi được chỉ định khác.

Để biết thêm thông tin về các tính năng neo và cách dùng, xem mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning) và hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using).

## Định nghĩa chính thức

{{cssinfo}}

## Cú pháp chính thức

{{csssyntax}}

## Ví dụ

Xem tài liệu `anchor-name` để biết [cách dùng cơ bản](/en-US/docs/Web/CSS/Reference/Properties/anchor-name#basic_usage) và các [ví dụ `position-anchor`](/en-US/docs/Web/CSS/Reference/Properties/anchor-name#examples) khác.

### Nhiều phần tử có vị trí và các neo

Trong ví dụ này, bạn có thể di chuyển nhiều phần tử có vị trí, liên kết chúng với các neo khác nhau. Ví dụ này minh họa cách một neo có thể liên kết với nhiều phần tử có vị trí, nhưng phần tử có vị trí neo chỉ có thể liên kết với một neo tại một thời điểm, neo được xác định bởi thuộc tính `anchor-position`.

#### HTML

Chúng ta có bốn neo và hai phần tử có vị trí, được phân biệt bằng các giá trị `id` khác nhau. Các phần tử có vị trí chứa các hộp {{htmlelement("select")}} cho phép bạn chọn neo nào bạn muốn liên kết với chúng.

```html
<div id="anchor-container">
  <div class="anchor" id="anchor1">⚓︎</div>
  <div class="anchor" id="anchor2">⚓︎</div>
  <div class="anchor" id="anchor3">⚓︎</div>
  <div class="anchor" id="anchor4">⚓︎</div>
</div>

<div class="infobox" id="infobox1">
  <form>
    <label for="anchor1-anchor-select">Place infobox on:</label>
    <select id="anchor1-anchor-select">
      <option value="1">Anchor 1</option>
      <option value="2">Anchor 2</option>
      <option value="3">Anchor 3</option>
      <option value="4">Anchor 4</option>
    </select>
  </form>
</div>

<div class="infobox" id="infobox2">
  <form>
    <label for="anchor2-anchor-select">Place infobox on:</label>
    <select id="anchor2-anchor-select">
      <option value="1">Anchor 1</option>
      <option value="2">Anchor 2</option>
      <option value="3">Anchor 3</option>
      <option value="4">Anchor 4</option>
    </select>
  </form>
</div>
```

#### CSS

Chúng ta khai báo `<div>` đầu tiên với class `anchor` là phần tử neo bằng thuộc tính `anchor-name`, được gán hai tên neo cách nhau bởi dấu phẩy, một cho mỗi phần tử có vị trí. Đây là trạng thái ban đầu của demo — cả hai phần tử có vị trí sẽ được buộc vào neo đầu tiên.

```css hidden
body {
  height: 100vh;
}

#anchor-container {
  display: grid;
  height: 100%;
  grid-template-columns: 1fr 1fr;
  grid-auto-rows: 1fr 1fr;
  justify-items: center;
  align-items: center;
}

.anchor {
  font-size: 1.8rem;
  color: white;
  text-shadow: 1px 1px 1px black;
  background-color: hsl(240 100% 75%);
  width: fit-content;
  border-radius: 10px;
  border: 1px solid black;
  padding: 3px;
}
```

```css
#anchor1 {
  anchor-name: --my-anchor1, --my-anchor2;
}
```

Mỗi phần tử có vị trí được gán thuộc tính `position-anchor` với giá trị khớp với một trong hai tên neo. Các phần tử có vị trí sau đó được gán thông tin định vị tương đối với neo bằng cách kết hợp các thuộc tính inset, căn chỉnh và lề.

```css hidden
.infobox {
  color: darkblue;
  background-color: azure;
  border: 1px solid #dddddd;
  padding: 10px;
  border-radius: 10px;
  font-size: 1rem;
  width: 120px;
}
```

```css
#infobox1 {
  position-anchor: --my-anchor1;
  position: fixed;
  left: anchor(right);
  align-self: anchor-center;
  margin-left: 10px;
}

#infobox2 {
  position-anchor: --my-anchor2;
  position: fixed;
  bottom: anchor(top);
  justify-self: anchor-center;
  margin-bottom: 15px;
}
```

#### JavaScript

Chúng ta thay đổi động phần tử neo nào có các giá trị `anchor-name` được đặt lên đó để phản hồi các neo khác nhau được chọn trong menu `<select>` của các phần tử có vị trí. Chức năng chính ở đây là trình xử lý sự kiện [`change`](/en-US/docs/Web/API/HTMLElement/change_event), `updateAnchorNames()`. Nó đặt cả hai tên neo trên một neo, nếu các neo được chọn trong hai menu `<select>` là giống nhau. Nếu không, nó đặt một tên neo riêng lẻ trên hai neo riêng biệt tương ứng.

```js
// Get references to the two select menus
const select1 = document.querySelector("#anchor1-anchor-select");
const select2 = document.querySelector("#anchor2-anchor-select");
// Store references to all the anchors in a NodeList (array-like)
const anchors = document.querySelectorAll("#anchor-container > div");

// Set the same change event handler on both select menus
select1.addEventListener("change", updateAnchorNames);
select2.addEventListener("change", updateAnchorNames);

function updateAnchorNames() {
  // Remove all anchor names from all anchors
  for (const anchor of anchors) {
    anchor.style.anchorName = "none";
  }

  // convert the select menu values to numbers, and remove one to
  // make them match the selected anchors' index positions in the NodeList
  const value1 = Number(select1.value) - 1;
  const value2 = Number(select2.value) - 1;

  if (value1 === value2) {
    // If the chosen anchors are both the same, set both anchor
    // names on the same anchor
    anchors[value1].style.anchorName = "--my-anchor1, --my-anchor2";
  } else {
    // If they are not the same, set the anchor names separately
    // on each selected anchor
    anchors[value1].style.anchorName = "--my-anchor1";
    anchors[value2].style.anchorName = "--my-anchor2";
  }
}
```

#### Kết quả

Chọn các giá trị khác nhau từ menu thả xuống để thay đổi các neo mà phần tử được định vị tương đối với.

{{ EmbedLiveSample("Multiple positioned elements and anchors", "100%", "400") }}

### Dùng thanh trượt thumb làm neo

Trong ví dụ này, một {{htmlelement("output")}} được định vị tương đối với neo là thumb của thanh trượt phạm vi.

#### HTML

Chúng ta thêm phần tử [`<input type="range">`](/en-US/docs/Web/HTML/Reference/Elements/input/range) và phần tử {{htmlelement("output")}} để hiển thị giá trị của phạm vi. Giá trị hiển thị trong phần tử `<output>` được cập nhật thông qua JavaScript khi giá trị thanh trượt thay đổi.

```html
<label for="slider">Change the value:</label>
<input type="range" min="0" max="100" value="25" id="slider" />
<output>25</output>
```

#### CSS

Chúng ta gán thumb, được biểu diễn bởi pseudo-element {{cssxref("::-webkit-slider-thumb")}} và {{cssxref("::-moz-range-thumb")}}, một tên neo là `--thumb`. Sau đó chúng ta đặt tên đó làm giá trị của thuộc tính `position-anchor` của phần tử `<output>`, và gán cho nó giá trị {{cssxref("position")}} là `fixed`. Các bước này liên kết `<output>` với thumb.

Cuối cùng, chúng ta dùng các thuộc tính {{cssxref("left")}} và {{cssxref("top")}} với các giá trị {{cssxref("anchor()")}} để định vị `<output>` tương đối với thumb.

```css hidden
body {
  display: grid;
  place-items: center;
  height: 100vh;
  font-size: 1.4rem;
  font-family: sans-serif;
}
input {
  width: 33vw;
}
output {
  background: cyan;
  border: 2px solid darkblue;
  padding: 3px 6px;
  border-radius: 10px;
  font-size: 1.2rem;
}
```

```css
input::-webkit-slider-thumb {
  anchor-name: --thumb;
}

input::-moz-range-thumb {
  anchor-name: --thumb;
}

output {
  position-anchor: --thumb;
  position: absolute;
  left: anchor(right);
  bottom: anchor(top);
}
```

#### JavaScript

Chúng ta thêm trình lắng nghe sự kiện cập nhật nội dung của phần tử `<output>` khi giá trị của `<input>` thay đổi:

```js
const input = document.querySelector("input");
const output = document.querySelector("output");

input.addEventListener("input", (event) => {
  output.innerText = `${input.value}`;
});
```

#### Kết quả

Output được neo vào thumb. Thay đổi giá trị và output sẽ vẫn ở phía trên và bên phải của thumb, bất kể nó ở đâu trên thanh trượt.

{{ EmbedLiveSample("A range thumb as anchor", "100%", "225") }}

> [!NOTE]
> CSS định vị neo trong demo này hiện không hoạt động trong Firefox. Thumb của thanh trượt có thể được nhắm đến thông qua pseudo-element {{cssxref("::-moz-range-thumb")}} trong Firefox, nhưng hiện không khả dụng như một neo (xem [Firefox bug 1993699](https://bugzil.la/1993699)).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{cssxref("anchor-name")}}
- {{cssxref("anchor-scope")}}
- Thuộc tính HTML [`anchor`](/en-US/docs/Web/HTML/Reference/Global_attributes/anchor)
- Mô-đun [CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning)
- Hướng dẫn [Using CSS anchor positioning](/en-US/docs/Web/CSS/Guides/Anchor_positioning/Using)
