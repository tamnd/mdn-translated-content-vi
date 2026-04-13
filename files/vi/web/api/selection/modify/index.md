---
title: "Selection: phương thức modify()"
short-title: modify()
slug: Web/API/Selection/modify
page-type: web-api-instance-method
browser-compat: api.Selection.modify
---

{{APIRef("DOM")}}

Phương thức **`Selection.modify()`** áp dụng một thay đổi cho vùng chọn hoặc vị trí con trỏ hiện tại, dùng các lệnh văn bản đơn giản.

## Cú pháp

```js-nolint
modify(alter, direction, granularity)
```

### Tham số

- `alter`
  - : Kiểu thay đổi cần áp dụng. Chỉ định `"move"` để di chuyển vị trí con trỏ hiện tại hoặc `"extend"` để mở rộng vùng chọn hiện tại.
- `direction`
  - : Hướng cần điều chỉnh vùng chọn hiện tại. Bạn có thể chỉ định `"forward"` hoặc `"backward"` để điều chỉnh theo hướng phù hợp với ngôn ngữ tại điểm vùng chọn. Nếu muốn điều chỉnh theo hướng cụ thể, bạn có thể chỉ định `"left"` hoặc `"right"`.
- `granularity`
  - : Khoảng cách cần điều chỉnh vùng chọn hoặc vị trí con trỏ hiện tại. Bạn có thể di chuyển theo `"character"`, `"word"`, `"sentence"`, `"line"`, `"paragraph"`, `"lineboundary"`, `"sentenceboundary"`, `"paragraphboundary"`, hoặc `"documentboundary"`.

> [!NOTE]
> Firefox **không** triển khai `"sentence"`, `"paragraph"`, `"sentenceboundary"`, `"paragraphboundary"` hoặc `"documentboundary"`. WebKit và Blink thì có.

> [!NOTE]
> Bắt đầu từ Firefox 5, granularity `"word"` không còn bao gồm khoảng trắng theo sau, bất kể hành vi mặc định của nền tảng. Điều này làm cho hành vi nhất quán hơn, đồng thời giống cách WebKit từng hoạt động, nhưng đáng tiếc là họ gần đây đã thay đổi hành vi của mình.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Ví dụ này minh họa các tùy chọn `granularity` khác nhau để sửa đổi một vùng chọn. Hãy bấm vào đâu đó bên trong ví dụ (có thể chọn một phần văn bản), rồi bấm nút để mở rộng vùng chọn.

### HTML

```html
<p>
  Click somewhere in this example. Then click the button below to expand the
  selection. Watch what happens!
</p>
<p>
  Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore,
  cum soluta nobis est eligendi optio cumque nihil impedit quo minus id quod
  maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor
  repellendus.
</p>

<label for="granularity">Granularity:</label>
<select id="granularity">
  <option value="character">Character</option>
  <option value="word">Word</option>
  <option value="sentence">Sentence</option>
  <option value="line">Line</option>
  <option value="paragraph">Paragraph</option>
  <option value="lineboundary">Line Boundary</option>
  <option value="sentenceboundary">Sentence Boundary</option>
  <option value="paragraphboundary">Paragraph Boundary</option>
  <option value="documentboundary">Document Boundary</option>
</select>

<br /><br />

<button>Extend selection</button>
```

### JavaScript

```js
let select = document.querySelector("select");
let button = document.querySelector("button");

button.addEventListener("click", modify);

function modify() {
  let selection = window.getSelection();
  selection.modify("extend", "forward", select.value);
}
```

### Kết quả

{{EmbedLiveSample("Examples", 700, 200)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("Selection")}}, giao diện mà nó thuộc về.
