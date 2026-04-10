---
title: "MutationRecord: thuộc tính addedNodes"
short-title: addedNodes
slug: Web/API/MutationRecord/addedNodes
page-type: web-api-instance-property
browser-compat: api.MutationRecord.addedNodes
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`addedNodes`** của {{domxref("MutationRecord")}} là một {{domxref("NodeList")}} chứa các nút được thêm vào nút đích bởi một biến đổi được quan sát bằng {{domxref("MutationObserver")}}.

## Giá trị

Một {{domxref("NodeList")}} chứa các nút được thêm vào đích của biến đổi được {{domxref("MutationObserver")}} quan sát.

## Ví dụ

### Cập nhật khi thêm một nút

Trong ví dụ sau, có hai nút bấm: một để thêm các nút mới vào nút đích, và một để xóa chúng. Một {{domxref("MutationObserver")}} được dùng để quan sát các thay đổi của nút đích; khi phát hiện thay đổi, observer gọi một hàm `logNewNodes()`.

Hàm `logNewNodes()` kiểm tra xem `type` của `MutationRecord` có phải là `childList` hay không, nghĩa là các phần tử con của nút đích đã thay đổi. Nếu kiểu là `childList`, hàm sẽ cập nhật tổng số nút mới đã được thêm. Tuy nhiên, lưu ý rằng khi nhấn nút "Remove a node" thì tổng số nút mới sẽ không tăng, vì trong trường hợp này `record.addedNodes` sẽ có độ dài là `0`.

#### HTML

```html
<button id="add-nodes">Add a node</button>
<button id="remove-nodes">Remove a node</button>
<button id="reset">Reset</button>

<pre id="counter">Total added nodes: 0</pre>
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
let totalAddedNodes = 0;

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

function logNewNodes(records) {
  for (const record of records) {
    // Kiểm tra xem childList của nút đích có bị biến đổi hay không
    if (record.type === "childList") {
      totalAddedNodes += record.addedNodes.length;
      // Ghi lại số nút đã thêm
      counter.textContent = `Total added nodes: ${totalAddedNodes}`;
    }
  }
}

const observer = new MutationObserver(logNewNodes);
observer.observe(target, { childList: true });
```

#### Kết quả

{{EmbedLiveSample("Update when adding a node")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
