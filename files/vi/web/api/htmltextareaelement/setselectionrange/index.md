---
title: "HTMLTextAreaElement: setSelectionRange() method"
short-title: setSelectionRange()
slug: Web/API/HTMLTextAreaElement/setSelectionRange
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.setSelectionRange
---

{{APIRef("HTML DOM")}}

Phương thức **`setSelectionRange()`** của giao diện {{domxref("HTMLTextAreaElement")}} đặt vị trí bắt đầu và kết thúc của vùng chọn văn bản hiện tại, và tùy chọn là hướng, trong phần tử {{HTMLElement("textarea")}}. Phương thức này cập nhật trạng thái vùng chọn ngay lập tức, mặc dù phần tô sáng trực quan chỉ xuất hiện khi phần tử có focus. Hướng chỉ ra vùng chọn nên được xem là đã diễn ra như thế nào; ví dụ, vùng chọn được người dùng tạo bằng cách nhấp và kéo từ cuối văn bản được chọn về đầu văn bản. Ngoài ra, các sự kiện {{domxref("HTMLTextAreaElement.select_event", "select")}} và {{domxref("HTMLTextAreaElement.selectionchange_event", "selectionchange")}} được kích hoạt.

Phương thức này cập nhật ngay các thuộc tính {{domxref("HTMLTextAreaElement.selectionStart")}}, {{domxref("HTMLTextAreaElement.selectionEnd")}}, và {{domxref("HTMLTextAreaElement.selectionDirection")}}, bất kể trạng thái focus. Phần tô sáng vùng chọn trực quan yêu cầu phần tử phải có focus.

> [!NOTE]
> Mặc dù `setSelectionRange()` cập nhật ngay các thuộc tính vùng chọn, phần tô sáng trực quan chỉ xuất hiện khi `<textarea>` có focus. Việc focus phần tử cũng sẽ kích hoạt sự kiện `selectionchange`.

Để chọn **toàn bộ** văn bản của một phần tử `<textarea>`, hãy dùng phương thức {{domxref("HTMLTextAreaElement.select()")}}.

## Cú pháp

```js-nolint
setSelectionRange(selectionStart, selectionEnd)
setSelectionRange(selectionStart, selectionEnd, selectionDirection)
```

### Tham số

- `selectionStart`
  - : Chỉ mục của ký tự được chọn đầu tiên. Chỉ mục lớn hơn độ dài giá trị của phần tử sẽ được coi là trỏ đến cuối giá trị. Xem thuộc tính {{domxref("HTMLTextAreaElement.selectionStart", "selectionStart")}} để biết thêm.
- `selectionEnd`
  - : Chỉ mục của ký tự _sau_ ký tự được chọn cuối cùng. Chỉ mục lớn hơn độ dài giá trị của phần tử sẽ được coi là trỏ đến cuối giá trị. Nếu `selectionEnd` nhỏ hơn `selectionStart`, cả hai sẽ được coi là giá trị của `selectionEnd`. Xem thuộc tính {{domxref("HTMLTextAreaElement.selectionEnd", "selectionEnd")}} để biết thêm.
- `selectionDirection` {{optional_inline}}
  - : Từ khóa `"forward"`, `"backward"`, hoặc mặc định `"none"` - cho biết hướng mà vùng chọn được xem là đã diễn ra. Xem thuộc tính {{domxref("HTMLTextAreaElement.selectionDirection", "selectionDirection")}} để biết thêm.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

```js
const textarea = document.getElementById("text-box");
const chars = textarea.textLength;
// if the value is more than 10 characters long
if (chars > 10) {
  // Element must be focused to select a range of text within it
  textarea.focus();
  // select the text between the fifth character from the start and
  // the fifth character from the end
  textarea.setSelectionRange(5, chars - 5);
} else {
  // otherwise select all the text
  textarea.select();
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.select()")}}
- {{domxref("HTMLTextAreaElement.textLength")}}
- {{domxref("Selection")}}
- Pseudo-element {{cssxref("::selection")}}
