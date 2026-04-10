---
title: "HTMLInputElement: thuộc tính selectionStart"
short-title: selectionStart
slug: Web/API/HTMLInputElement/selectionStart
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.selectionStart
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`selectionStart`** của giao diện {{domxref("HTMLInputElement")}} là một số đại diện cho chỉ mục bắt đầu của văn bản được chọn. Khi không có gì được chọn, thì trả về vị trí của con trỏ nhập văn bản (caret) bên trong phần tử `<input>`.

> [!NOTE]
> Theo [đặc tả biểu mẫu WHATWG](https://html.spec.whatwg.org/multipage/forms.html#concept-input-apply), thuộc tính `selectionStart` chỉ áp dụng cho các đầu vào loại text, search, URL, tel và password. Trong các trình duyệt hiện đại, ném ra ngoại lệ khi đặt thuộc tính `selectionStart` trên các loại đầu vào còn lại. Ngoài ra, thuộc tính này trả về `null` khi truy cập thuộc tính `selectionStart` trên các phần tử đầu vào không phải dạng văn bản.

Nếu `selectionStart` lớn hơn `selectionEnd`, thì cả hai đều được coi là giá trị của `selectionEnd`.

## Giá trị

Một số không âm.

## Ví dụ

### HTML

```html
<!-- sử dụng selectionStart trên phần tử đầu vào không phải văn bản -->
<label for="color">Thuộc tính selectionStart trên type=color</label>
<input id="color" type="color" />

<!-- sử dụng selectionStart trên phần tử đầu vào văn bản -->
<fieldset>
  <legend>Thuộc tính selectionStart trên type=text</legend>
  <label for="statement">Chọn từ 'mdn' trong văn bản : </label>
  <input
    type="text"
    id="statement"
    value="The mdn is a documentation repository." />
  <button id="statement-btn">Chọn văn bản mdn</button>
</fieldset>
```

### JavaScript

```js
const inputElement = document.getElementById("statement");
const statementBtn = document.getElementById("statement-btn");
const colorStart = document.getElementById("color");

statementBtn.addEventListener("click", () => {
  inputElement.selectionStart = 4;
  inputElement.selectionEnd = 7;
  inputElement.focus();
});

// mở console trình duyệt để xác nhận kết quả
console.log(colorStart.selectionStart); // Kết quả : null
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLTextAreaElement.selectionStart")}}
- Thuộc tính {{domxref("HTMLInputElement.selectionEnd")}}
- Phương thức {{domxref("HTMLInputElement.setSelectionRange")}}
