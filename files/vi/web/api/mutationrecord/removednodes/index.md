---
title: "MutationRecord: thuộc tính removedNodes"
short-title: removedNodes
slug: Web/API/MutationRecord/removedNodes
page-type: web-api-instance-property
browser-compat: api.MutationRecord.removedNodes
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`removedNodes`** của {{domxref("MutationRecord")}} là một {{domxref("NodeList")}} chứa các nút đã bị xóa khỏi nút đích bởi một biến đổi được quan sát bằng {{domxref("MutationObserver")}}.

## Giá trị

Một {{domxref("NodeList")}} chứa các nút bị xóa khỏi đích của biến đổi được {{domxref("MutationObserver")}} quan sát.

## Ví dụ

### Quan sát các nút bị xóa

Trong ví dụ sau, có hai nút bấm: một để thêm các nút mới vào nút đích, và một để xóa chúng. Một {{domxref("MutationObserver")}} được dùng để quan sát các thay đổi của nút đích; khi phát hiện thay đổi, observer gọi một hàm `logRemovedNodes()`.

Hàm `logRemovedNodes()` kiểm tra xem `type` của `MutationRecord` có phải là `childList` hay không, nghĩa là các phần tử con của nút đích đã thay đổi. Nếu kiểu là `childList`, hàm sẽ cập nhật tổng số nút đã bị xóa. Tuy nhiên, lưu ý rằng khi nhấn nút "Add a node" thì tổng số nút đã bị xóa sẽ không tăng, vì trong trường hợp này `record.removedNodes` sẽ có độ dài là `0`.

#### HTML

```html
<button id="add-nodes">Add a node</button>
<button id="remove-nodes">Remove a node</button>
<button id="reset">Reset</button>

<pre id="counter">Total removed nodes: 0</pre>
<div id="target"></div>
```

```css hidden
#counter {
  border: 1px dotted black;
  padding: 0.5rem;
}
```

#### JavaScript

```js
const addNodes = document.querySelector("#add-nodes");
const removeNodes = document.querySelector("#remove-nodes");
const reset = document.querySelector("#reset");
const counter = document.querySelector("#counter");
const target = document.querySelector("#target");
let totalRemovedNodes = 0;

addNodes.addEventListener("click", () => {
  const newPara = document.createElement("p");
  newPara.textContent = `Current time: ${Date.now()}`;
  target.appendChild(newPara);
});

removeNodes.addEventListener("click", () => {
  const lastChild = target.lastChild;
  if (lastChild) {
    target.removeChild(lastChild);
  }
});

reset.addEventListener("click", () => self.location.reload());

function logRemovedNodes(records) {
  for (const record of records) {
    // Kiểm tra xem childList của nút đích có bị biến đổi hay không
    if (record.type === "childList") {
      totalRemovedNodes += record.removedNodes.length;
      // Ghi lại số nút đã thêm
      counter.textContent = `Total removed nodes: ${totalRemovedNodes}`;
    }
  }
}

const observer = new MutationObserver(logRemovedNodes);
observer.observe(target, { childList: true });
```

#### Kết quả

{{EmbedLiveSample("Observing removed nodes")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
