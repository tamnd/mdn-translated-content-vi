---
title: "Element: insertAdjacentElement() method"
short-title: insertAdjacentElement()
slug: Web/API/Element/insertAdjacentElement
page-type: web-api-instance-method
browser-compat: api.Element.insertAdjacentElement
---

{{APIRef("DOM")}}

Thuộc tính **`insertAdjacentElement()`** method of the
{{domxref("Element")}} interface inserts a given element node at a given position
relative to the element it is invoked upon.

## Cú pháp

```js-nolint
insertAdjacentElement(position, element)
```

### Tham số

- `position`
  - : Một chuỗi representing the position relative to the
    `targetElement`; must match (case-insensitively) một trong các giá trị sau
    strings:
    - `'beforebegin'`: Before the
      `targetElement` itself.
    - `'afterbegin'`: Just inside the
      `targetElement`, before its first child.
    - `'beforeend'`: Just inside the
      `targetElement`, after its last child.
    - `'afterend'`: After the
      `targetElement` itself.

- `element`
  - : The element to be inserted into the tree.

### Giá trị trả về

The element that was inserted, or `null`, if the insertion failed.

### Ngoại lệ

- `SyntaxError` {{domxref("DOMException")}}
  - : Thrown if the `position` specified is not a recognized value.
- {{jsxref("TypeError")}}
  - : Thrown if the `element` specified is not a valid element.

### Visualization of position names

```html
<!-- beforebegin -->
<p>
  <!-- afterbegin -->
  foo
  <!-- beforeend -->
</p>
<!-- afterend -->
```

> [!NOTE]
> The `beforebegin` and
> `afterend` positions work only if the node is in a tree and has an element
> parent.

## Ví dụ

### Inserting before and after

Trong ví dụ này we have a row of square boxes. The user can select a box by clicking on it: this gives the box a different border, to show that it is selected.

If a box is selected, and the user presses the "Insert before" or "Insert after" buttons, then the code creates a new box, gives it a random color, and inserts it before or after the selected box.

#### HTML

```html
<p>
  Click colored box to select it, then use the first two buttons below to insert
  elements before and after your selection.
</p>

<section>
  <div></div>
  <div></div>
  <div></div>
  <div></div>
</section>

<button class="before">Insert before</button>
<button class="after">Insert after</button>
<button class="reset">Reset demo</button>
```

#### CSS

```css
div {
  width: 50px;
  height: 50px;
  margin: 3px;
  border: 3px solid black;
  display: inline-block;
  background-color: red;
}

.selected {
  border-color: aqua;
}
```

#### JavaScript

```js
let selectedElem;

// Function to select a new element
function selectElement(newSelection) {
  if (selectedElem !== newSelection) {
    if (selectedElem) {
      selectedElem.classList.remove("selected");
    }
    selectedElem = newSelection;
    newSelection.classList.add("selected");
  }
}

// Add click handlers that select the clicked element
const initElems = Array.from(document.querySelectorAll("section div"));
for (const initElem of initElems) {
  initElem.addEventListener("click", (e) => selectElement(e.target));
}

// Add click handlers to "beforeBtn" and "afterBtn"
// to insert a new element before/after the selected element
const beforeBtn = document.querySelector(".before");
const afterBtn = document.querySelector(".after");
beforeBtn.addEventListener("click", () => insertNewElement("beforebegin"));
afterBtn.addEventListener("click", () => insertNewElement("afterend"));

function insertNewElement(position) {
  function random() {
    return Math.floor(Math.random() * 255);
  }

  if (!selectedElem) {
    return;
  }

  const newElement = document.createElement("div");
  const randomColor = `rgb(${random(255)} ${random(255)} ${random(255)})`;
  newElement.style.backgroundColor = randomColor;
  newElement.addEventListener("click", (e) => selectElement(e.target));

  selectedElem.insertAdjacentElement(position, newElement);
}

// Reset the example
const resetBtn = document.querySelector(".reset");
resetBtn.addEventListener("click", () => window.location.reload(true));
```

#### Result

{{embedlivesample("Inserting before and after", "", "200")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.insertAdjacentHTML()")}}
- {{domxref("Element.insertAdjacentText()")}}
- {{domxref("Node.insertBefore()")}} (similar to `beforebegin`, with
  different arguments)
- {{domxref("Node.appendChild()")}} (same effect as `beforeend`)
