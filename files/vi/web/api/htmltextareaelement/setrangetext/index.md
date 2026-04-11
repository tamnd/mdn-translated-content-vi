---
title: "HTMLTextAreaElement: setRangeText() method"
short-title: setRangeText()
slug: Web/API/HTMLTextAreaElement/setRangeText
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.setRangeText
---

{{APIRef("HTML DOM")}}

Phương thức **`setRangeText()`** của giao diện {{domxref("HTMLTextAreaElement")}} thay thế một phạm vi văn bản trong phần tử {{HTMLElement("textarea")}} bằng văn bản mới được truyền vào làm đối số.

Các tham số tùy chọn bổ sung bao gồm vị trí bắt đầu của đoạn văn bản cần thay đổi, vị trí kết thúc của đoạn, và một từ khóa xác định phần nào của `<textarea>` sẽ được chọn sau khi văn bản được cập nhật. Nếu các đối số `startSelection` và `endSelection` không được cung cấp, phạm vi sẽ được coi là vùng chọn hiện tại.

Đối số cuối cùng xác định cách vùng chọn sẽ được đặt sau khi văn bản được thay thế. Các giá trị có thể là `"select"`, chọn đoạn văn bản mới được chèn; `"start"`, chuyển vùng chọn đến ngay trước văn bản được chèn; `"end"`, chuyển vùng chọn đến ngay sau văn bản được chèn; hoặc mặc định `"preserve"`, cố gắng giữ nguyên vùng chọn.

Ngoài ra, các sự kiện {{domxref("HTMLTextAreaElement.select_event", "select")}} và {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} được kích hoạt.

## Cú pháp

```js-nolint
setRangeText(replacement)
setRangeText(replacement, startSelection)
setRangeText(replacement, startSelection, endSelection)
setRangeText(replacement, startSelection, endSelection, selectMode)
```

### Tham số

- `replacement`
  - : Chuỗi cần chèn vào.
- {{domxref("HTMLTextAreaElement.selectionStart", "selectionStart")}} {{optional_inline}}
  - : Chỉ mục của ký tự được chọn đầu tiên. Chỉ mục lớn hơn độ dài của giá trị phần tử sẽ được coi là trỏ đến cuối giá trị.
- {{domxref("HTMLTextAreaElement.selectionEnd", "selectionEnd")}} {{optional_inline}}
  - : Chỉ mục của ký tự _sau_ ký tự được chọn cuối cùng. Chỉ mục lớn hơn độ dài của giá trị phần tử sẽ được coi là trỏ đến cuối giá trị. Nếu `selectionEnd` nhỏ hơn `selectionStart`, cả hai sẽ được coi là giá trị của `selectionEnd`.
- `selectMode` {{optional_inline}}
  - : Một từ khóa, là `select`, `start`, `end`, hoặc mặc định `preserve`, xác định cách vùng chọn sẽ được đặt sau khi văn bản được thay thế.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nhấn nút trong ví dụ này để thay thế một phần văn bản trong hộp văn bản. Phần văn bản mới được chèn sẽ được tô sáng (được chọn) sau đó.

### HTML

```html
<label for="ta">Example text input:</label>
<textarea id="ta">
  This text has NOT been updated.
</textarea>
<button id="btn">Update text</button>
```

### JavaScript

```js
const btn = document.getElementById("btn");

btn.addEventListener("click", () => {
  changeText();
});

function changeText() {
  const textarea = document.getElementById("ta");
  textarea.focus();
  textarea.setRangeText("ALREADY", 14, 17, "select");
}
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.select()")}}
- {{domxref("HTMLTextAreaElement.setSelectionRange()")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
- {{domxref("Selection")}}
- Pseudo-element {{cssxref("::selection")}}
