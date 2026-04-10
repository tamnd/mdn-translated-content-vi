---
title: "MutationRecord: thuộc tính type"
short-title: type
slug: Web/API/MutationRecord/type
page-type: web-api-instance-property
browser-compat: api.MutationRecord.type
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`type`** của {{domxref("MutationRecord")}} là kiểu của {{domxref("MutationRecord")}} được quan sát bởi {{domxref("MutationObserver")}}.

## Giá trị

Thuộc tính được đặt thành kiểu của biến đổi dưới dạng một chuỗi. Giá trị có thể là một trong các giá trị sau:

- `attributes` nếu biến đổi là một biến đổi thuộc tính.

- `characterData` nếu đó là một biến đổi trên nút {{domxref("CharacterData")}}.

- `childList` nếu biến đổi là một biến đổi đối với cây nút.

## Ví dụ

### Ghi lại kiểu của một biến đổi

Ví dụ sau cung cấp cho bạn hai nút bấm để thao tác DOM. Nút đầu tiên thêm một nút mới vào ví dụ, và nút thứ hai thay đổi thuộc tính `color` của tất cả các nút đã thêm. Một {{domxref("MutationObserver")}} được tạo để quan sát tất cả, và observer được đặt để ghi `type` của bản ghi biến đổi vào `#log`.

Bạn sẽ nhận thấy rằng khi bạn thêm một nút, `type` là `childList`, và khi bạn thay đổi thuộc tính `color`, `type` là `attributes`.

#### HTML

```html
<button id="add-nodes">Add a node</button>
<button id="set-attribute">Change the color</button>

<button id="reset">Reset</button>

<pre id="log">Mutation type:</pre>
<div id="target"><p>Node #0</p></div>
```

```css hidden
#log {
  border: 1px dotted black;
  padding: 0.5rem;
}

.blue {
  color: blue;
}

.red {
  color: red;
}
```

#### JavaScript

```js
const addNodes = document.querySelector("#add-nodes");
const setAttribute = document.querySelector("#set-attribute");
const reset = document.querySelector("#reset");
const log = document.querySelector("#log");
const target = document.querySelector("#target");
let nodeNumber = 1;

addNodes.addEventListener("click", () => {
  const newPara = document.createElement("p");
  newPara.textContent = `Node #${nodeNumber}`;
  nodeNumber++;
  target.appendChild(newPara);
});

setAttribute.addEventListener("click", () => {
  if (target.getAttribute("class") === "red") {
    target.setAttribute("class", "blue");
  } else {
    target.setAttribute("class", "red");
  }
});

reset.addEventListener("click", () => self.location.reload());

function logMutationType(records) {
  for (const record of records) {
    log.textContent = `Mutation type: ${record.type}`;
  }
}

const observer = new MutationObserver(logMutationType);
observer.observe(target, { childList: true, attributes: true, subtree: true });
```

#### Kết quả

{{EmbedLiveSample("Log the type of a mutation", "", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
