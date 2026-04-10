---
title: "MutationRecord: thuộc tính target"
short-title: target
slug: Web/API/MutationRecord/target
page-type: web-api-instance-property
browser-compat: api.MutationRecord.target
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`target`** của {{domxref("MutationRecord")}} là mục tiêu (tức nút đã bị biến đổi/thay đổi) của một biến đổi được quan sát bằng {{domxref("MutationObserver")}}.

## Giá trị

{{domxref("Node")}} mà biến đổi tác động tới.

- Nếu `type` của bản ghi là `attributes`, đây là {{domxref("Element")}} có thuộc tính đã thay đổi.
- Nếu `type` của bản ghi là `characterData`, đây là nút {{domxref("CharacterData")}}.
- Nếu `type` của bản ghi là `childList`, đây là nút có các phần tử con đã thay đổi.

## Ví dụ

### Ghi lại mục tiêu của một biến đổi

Trong ví dụ sau, có hai div: một div đỏ (`#red-div`) và một div xanh (`#blue-div`), bên trong một div chứa `#container`. Một {{domxref("MutationObserver")}} được tạo để quan sát container. Observer quan sát các thay đổi ở childList, và cũng có `subtree: true` để quan sát các thay đổi ở các phần tử con của container.

Callback của observer ghi lại `target` của bản ghi biến đổi. Khi chúng ta thêm nút vào `#red-div` hoặc `#blue-div`, `target` sẽ lần lượt là `#red-div` hoặc `#blue-div`.

#### HTML

```html
<pre id="log">Target of mutation:</pre>
<button id="add-nodes-to-red-div">Add a node to red div</button>
<button id="add-nodes-to-blue-div">Add a node to blue div</button>
<button id="reset">Reset</button>
<div id="container">
  <div id="red-div"></div>
  <div id="blue-div"></div>
</div>
```

```css hidden
#log {
  border: 1px dotted black;
  padding: 0.5rem;
}

#red-div {
  border: 1px solid red;
  margin-top: 0.5rem;
  margin-right: 0.5rem;
  padding: 0.5rem;
  overflow: auto;
}

#blue-div {
  border: 1px solid blue;
  margin-top: 0.5rem;
  margin-left: 0.5rem;
  padding: 0.5rem;
  overflow: auto;
}

#container {
  display: grid;
  grid-template-columns: 50% auto;
}
```

#### JavaScript

```js
const container = document.querySelector("#container");
const redDiv = document.querySelector("#red-div");
const blueDiv = document.querySelector("#blue-div");
const addToRed = document.querySelector("#add-nodes-to-red-div");
const addToBlue = document.querySelector("#add-nodes-to-blue-div");
const reset = document.querySelector("#reset");
const log = document.querySelector("#log");

addToRed.addEventListener("click", () => {
  const newPara = document.createElement("p");
  newPara.textContent = `Current time: ${Date.now()}`;
  redDiv.appendChild(newPara);
});

addToBlue.addEventListener("click", () => {
  const newPara = document.createElement("p");
  newPara.textContent = `Current time: ${Date.now()}`;
  blueDiv.appendChild(newPara);
});

reset.addEventListener("click", () => self.location.reload());

function logMutationTarget(records) {
  for (const record of records) {
    log.textContent = `Target of mutation: ${record.target.id}`;
  }
}

const observer = new MutationObserver(logMutationTarget);
observer.observe(container, { childList: true, subtree: true });
```

#### Kết quả

{{EmbedLiveSample("Logging the target of a mutation", "", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
