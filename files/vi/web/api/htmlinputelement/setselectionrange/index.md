---
title: "HTMLInputElement: phương thức setSelectionRange()"
short-title: setSelectionRange()
slug: Web/API/HTMLInputElement/setSelectionRange
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.setSelectionRange
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLInputElement.setSelectionRange()`** đặt vị trí bắt đầu và kết thúc của lựa chọn văn bản hiện tại trong phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}}. Phương thức này cập nhật trạng thái lựa chọn ngay lập tức, mặc dù phần đánh dấu trực quan chỉ xuất hiện khi phần tử được focus.

Tùy chọn, bạn có thể chỉ định hướng mà lựa chọn được coi là đã xảy ra. Điều này cho phép bạn chỉ định, ví dụ, rằng lựa chọn được đặt bằng cách người dùng nhấp và kéo từ cuối văn bản đã chọn về phía đầu.

Phương thức này cập nhật các thuộc tính {{domxref("HTMLInputElement.selectionStart")}}, {{domxref("HTMLInputElement.selectionEnd")}}, và {{domxref("HTMLInputElement.selectionDirection")}} trong một lệnh gọi, bất kể phần tử có được focus hay không. Phần đánh dấu lựa chọn trực quan chỉ xuất hiện khi phần tử có focus.

Phần tử phải thuộc một trong các loại đầu vào sau: [`password`](/en-US/docs/Web/HTML/Reference/Elements/input/password), [`search`](/en-US/docs/Web/HTML/Reference/Elements/input/search), [`tel`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text), hoặc [`url`](/en-US/docs/Web/HTML/Reference/Elements/input/url). Nếu không, trình duyệt sẽ ném ra ngoại lệ `InvalidStateError`.

Nếu bạn muốn chọn **tất cả** văn bản của phần tử đầu vào, bạn có thể sử dụng phương thức [HTMLInputElement.select()](/en-US/docs/Web/API/HTMLInputElement/select) thay thế.

## Cú pháp

```js-nolint
setSelectionRange(selectionStart, selectionEnd)
setSelectionRange(selectionStart, selectionEnd, selectionDirection)
```

### Tham số

- `selectionStart`
  - : Chỉ mục dựa trên 0 của ký tự đầu tiên được chọn. Một chỉ mục lớn hơn độ dài của giá trị phần tử được coi là trỏ đến cuối giá trị.
- `selectionEnd`
  - : Chỉ mục dựa trên 0 của ký tự _sau_ ký tự được chọn cuối cùng. Một chỉ mục lớn hơn độ dài của giá trị phần tử được coi là trỏ đến cuối giá trị. Nếu `selectionEnd` nhỏ hơn `selectionStart`, thì cả hai đều được coi là giá trị của `selectionEnd`.
- `selectionDirection` {{optional_inline}}
  - : Một chuỗi cho biết hướng mà lựa chọn được coi là đã được thực hiện. Các giá trị có thể:
    - `"forward"`
    - `"backward"`
    - `"none"` nếu hướng không xác định hoặc không liên quan. Giá trị mặc định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Ném ra nếu phần tử không thuộc một trong các loại đầu vào sau: [`password`](/en-US/docs/Web/HTML/Reference/Elements/input/password), [`search`](/en-US/docs/Web/HTML/Reference/Elements/input/search), [`tel`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text), hoặc [`url`](/en-US/docs/Web/HTML/Reference/Elements/input/url).

## Ví dụ

Nhấp vào nút trong ví dụ này để chọn ký tự thứ ba, thứ tư và thứ năm trong hộp văn bản ("zil" trong từ "Mozilla").

### HTML

```html
<input type="text" id="text-box" size="20" value="Mozilla" />
<button>Chọn văn bản</button>
```

### JavaScript

```js
function selectText() {
  const input = document.getElementById("text-box");
  input.focus();
  input.setSelectionRange(2, 5);
}

document.querySelector("button").addEventListener("click", selectText);
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("input")}}
- {{HTMLElement("textarea")}}
- {{domxref("HTMLInputElement")}}
- {{domxref("Selection")}}
