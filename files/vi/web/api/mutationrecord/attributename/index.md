---
title: "MutationRecord: thuộc tính attributeName"
short-title: attributeName
slug: Web/API/MutationRecord/attributeName
page-type: web-api-instance-property
browser-compat: api.MutationRecord.attributeName
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`attributeName`** của {{domxref("MutationRecord")}} chứa tên của một thuộc tính đã thay đổi thuộc về một nút được quan sát bởi {{domxref("MutationObserver")}}.

## Giá trị

Nếu `type` của bản ghi là `attributes`, đây là một chuỗi biểu thị tên của thuộc tính đã bị biến đổi của mục tiêu biến đổi.

Nếu `type` của bản ghi không phải là `attributes`, giá trị là `null`.

## Ví dụ

### Lấy tên thuộc tính được cập nhật lần cuối

Trong ví dụ sau, có bốn nút bấm: hai nút thay đổi thuộc tính `style` của phần tử `h1`, và hai nút thay đổi thuộc tính `class` của phần tử `h1`. Mã dùng một {{domxref("MutationObserver")}} để phát hiện thay đổi và sẽ cập nhật văn bản bên dưới thành tên của thuộc tính cuối cùng đã thay đổi.

#### HTML

```html
<h1 class="blue" id="hiMom">Hi, Mom!</h1>

<button id="redButton">Set class to "red"</button>
<button id="blueButton">Set class to "blue"</button>
<button id="whiteButton">Set style to "color:white;"</button>
<button id="blackButton">Set style to "color:black;"</button>

<p id="log">Updated attribute name:</p>
```

#### CSS

```css
.red {
  background-color: red;
}

.blue {
  background-color: blue;
}
```

#### JavaScript

```js
const hiMom = document.querySelector("#hiMom");
const redButton = document.querySelector("#redButton");
const blueButton = document.querySelector("#blueButton ");
const whiteButton = document.querySelector("#whiteButton");
const blackButton = document.querySelector("#blackButton");
const log = document.querySelector("#log");

redButton.addEventListener("click", () => {
  hiMom.classList.add("red");
  hiMom.classList.remove("blue");
});

blueButton.addEventListener("click", () => {
  hiMom.classList.add("blue");
  hiMom.classList.remove("red");
});

whiteButton.addEventListener("click", () => {
  hiMom.style.color = "white";
});

blackButton.addEventListener("click", () => {
  hiMom.style.color = "black";
});

function logLastAttr(mutationRecordArray) {
  for (const record of mutationRecordArray) {
    if (record.type === "attributes") {
      log.textContent = `Updated attribute name: ${record.attributeName}`;
    }
  }
}

const observer = new MutationObserver(logLastAttr);
observer.observe(hiMom, { attributes: true });
```

#### Kết quả

{{EmbedLiveSample("Get last updated attribute name", "", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
