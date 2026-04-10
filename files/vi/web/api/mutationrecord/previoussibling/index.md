---
title: "MutationRecord: thuộc tính previousSibling"
short-title: previousSibling
slug: Web/API/MutationRecord/previousSibling
page-type: web-api-instance-property
browser-compat: api.MutationRecord.previousSibling
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`previousSibling`** của {{domxref("MutationRecord")}} là anh em trước đó của một nút con được thêm hoặc xóa tại [`target`](/en-US/docs/Web/API/MutationRecord/target) của một {{domxref("MutationObserver")}}.

## Giá trị

Nếu một nút được thêm vào hoặc xóa khỏi [`target`](/en-US/docs/Web/API/MutationRecord/target) của một {{domxref("MutationObserver")}}, giá trị là {{domxref("Node")}} đóng vai trò là anh em trước đó của nút được thêm hoặc xóa: tức là nút đứng ngay trước nó trong danh sách {{domxref("Node.childNodes", "childNodes")}} của nút cha.

Giá trị là `null` nếu không có nút nào được thêm hoặc xóa, hoặc nếu nút đó là phần tử con đầu tiên của nút cha.

## Ví dụ

### Ghi lại anh em trước đó của một biến đổi

Ví dụ này thêm một nút mỗi khi bạn nhấn nút. Sau đó observer ghi lại `textContent` của `previousSibling` của nút được thêm.

#### HTML

```html
<button id="add-nodes">Add a node</button>
<button id="reset">Reset</button>

<pre id="log" class="log">Previous sibling of added node:</pre>
<div id="target"><p>Node #0</p></div>
```

```css hidden
.log {
  border: 1px dotted black;
  padding: 0.5rem;
}
```

#### JavaScript

```js
const addNodes = document.querySelector("#add-nodes");
const reset = document.querySelector("#reset");
const target = document.querySelector("#target");
let nodeNumber = 1;

addNodes.addEventListener("click", () => {
  const newPara = document.createElement("p");
  newPara.textContent = `Node #${nodeNumber}`;
  nodeNumber++;
  target.appendChild(newPara);
});

reset.addEventListener("click", () => self.location.reload());

function logPreviousSibling(records) {
  for (const record of records) {
    if (record.type === "childList") {
      for (const newNode of record.addedNodes) {
        log.textContent = `Previous sibling of added node: ${newNode.previousSibling?.textContent}`;
      }
    }
  }
}

const observer = new MutationObserver(logPreviousSibling);
observer.observe(target, { childList: true });
```

#### Kết quả

{{EmbedLiveSample("Log the previous sibling of a mutation", "", 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
