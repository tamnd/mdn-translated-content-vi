---
title: "Selection: thuộc tính direction"
short-title: direction
slug: Web/API/Selection/direction
page-type: web-api-instance-property
browser-compat: api.Selection.direction
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`direction`** của giao diện {{domxref("Selection")}} là một chuỗi cung cấp hướng của vùng chọn hiện tại.

Giá trị được xác định bởi thứ tự mà người dùng chọn các điểm biên của vùng chọn. Ví dụ, người dùng có thể tạo vùng chọn bằng cách nhấn vào một điểm biên bắt đầu, kéo con trỏ, rồi thả ở một điểm biên kết thúc. Nếu điểm kết thúc nằm sau điểm bắt đầu trong tài liệu, hướng là "forwards", còn nếu điểm kết thúc nằm trước điểm bắt đầu trong tài liệu thì hướng là "backwards". Giá trị là "directionless" nếu người dùng không tạo ra hướng rõ ràng. Ví dụ, khi người dùng chọn bằng cách bấm đúp vào một từ hoặc phần tử, hoặc vùng chọn được tạo bằng lập trình.

Hướng sẽ không thay đổi nếu range của vùng chọn bị biến đổi, ví dụ bằng các phương thức như {{DOMxRef("Range.selectNode()")}}.

## Giá trị

Một chuỗi mô tả kiểu của vùng chọn hiện tại.
Các giá trị có thể là:

- `backward`
  - : Vùng chọn đi ngược.
- `forward`
  - : Vùng chọn đi xuôi.
- `none`
  - : Chưa có vùng chọn nào được tạo, hoặc vùng chọn không có hướng.

## Ví dụ

Ví dụ này cho phép bạn kiểm tra thuộc tính `direction` hoạt động như thế nào bằng cách ghi lại hướng hiện tại của văn bản được chọn trong một đoạn.

### HTML

HTML chỉ hiển thị một đoạn văn với văn bản mà bạn có thể chọn.

```html
<p id="text-box">
  Select text in this paragraph to see the selection direction.
</p>
```

Lưu ý rằng còn có một hộp ghi log "ẩn" (cùng mã liên quan), theo mẫu trong hướng dẫn [Display a single entry log](/en-US/docs/MDN/Writing_guidelines/Page_structures/Live_samples#displaying_a_single_entry_log) để viết live sample.

```css hidden
#log {
  height: 50px;
  padding: 0.5rem;
  margin: 5px;
  border: 1px solid black;
}
```

```html hidden
<pre id="log"></pre>
```

### JavaScript

```js hidden
const logElement = document.querySelector("#log");

function log(text) {
  logElement.innerText = text;
}
```

Mã kiểm tra xem thuộc tính `direction` có được định nghĩa hay không, và nếu có thì thêm trình nghe cho sự kiện [`selectionchange`](/en-US/docs/Web/API/Document/selectionchange_event), sự kiện này lấy vùng chọn hiện tại và ghi hướng của nó ra log. Nếu thuộc tính không được hỗ trợ, mã sẽ ghi nhận điều này và ẩn văn bản chọn.

```js
const input = document.getElementById("text-box");

if ("direction" in Selection.prototype) {
  document.addEventListener("selectionchange", () => {
    const selection = window.getSelection();
    log(`Selection direction: ${selection.direction}`);
  });
} else {
  log("direction property not defined");
  input.hidden = true;
}
```

### Kết quả

Nếu thuộc tính được hỗ trợ, hãy chọn văn bản bằng bấm đúp và bằng kéo-thả theo các hướng khác nhau.

{{EmbedLiveSample("Examples")}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Selection")}}
