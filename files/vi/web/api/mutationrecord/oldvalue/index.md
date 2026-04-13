---
title: "MutationRecord: thuộc tính oldValue"
short-title: oldValue
slug: Web/API/MutationRecord/oldValue
page-type: web-api-instance-property
browser-compat: api.MutationRecord.oldValue
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`oldValue`** của {{domxref("MutationRecord")}} chứa dữ liệu ký tự hoặc giá trị thuộc tính của một nút được quan sát trước khi nó bị thay đổi.

## Giá trị

Một chuỗi biểu thị giá trị cũ của một thuộc tính đã thay đổi, nếu:

- tham số `attributeOldValue` của {{domxref("MutationObserver.observe()")}} là `true`
- tham số `attributes` của {{domxref("MutationObserver.observe()")}} là `true` hoặc bị bỏ qua
- biến đổi có {{domxref("MutationRecord.type", "type")}} là `attributes`

Một chuỗi biểu thị giá trị cũ của một nút {{domxref("CharacterData")}} đã thay đổi, nếu:

- tham số `characterDataOldValue` của {{domxref("MutationObserver.observe()")}} là `true`
- tham số `characterData` của {{domxref("MutationObserver.observe()")}} là `true` hoặc bị bỏ qua
- biến đổi có {{domxref("MutationRecord.type", "type")}} là `characterData`

Trong các trường hợp khác, thuộc tính này là `null`.

## Ví dụ

### Hiển thị giá trị màu cũ

Trong ví dụ sau, có một nút bấm thay đổi màu của một `h1` thành một màu ngẫu nhiên mới. Một {{domxref("MutationObserver")}} được dùng để quan sát nút đích (`h1`) với thay đổi thuộc tính; khi phát hiện thay đổi, observer gọi hàm `logOldValue()`.

Hàm `logOldValue()` nhận vào mảng `mutationRecords`, trong đó chứa các đối tượng `MutationRecord`. Sau đó thuộc tính `oldValue` của đối tượng `MutationRecord` sẽ được hiển thị, với màu của giá trị cũ.

#### HTML

```html
<h1 id="h1">Hi, Mom!</h1>
<button id="changeColorButton">Change color</button>
<p id="log"></p>
```

#### JavaScript

```js
const h1 = document.getElementById("h1");
const changeValueButton = document.getElementById("changeColorButton");
const log = document.getElementById("log");

changeColorButton.addEventListener("click", () => {
  // Số thập lục phân 6 ký tự ngẫu nhiên dùng làm giá trị màu hex
  const newColor = Math.floor(Math.random() * 16777215).toString(16);
  h1.style.color = `#${newColor}`;
});

function logOldValue(mutationRecordArray) {
  for (const record of mutationRecordArray) {
    log.textContent = `Old value: ${record.oldValue}`;
    log.style.cssText = record.oldValue;
  }
}

const observer = new MutationObserver(logOldValue);
observer.observe(h1, {
  attributes: true,
  attributeOldValue: true,
});
```

#### Kết quả

{{EmbedLiveSample("Show old color value", "", 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}
