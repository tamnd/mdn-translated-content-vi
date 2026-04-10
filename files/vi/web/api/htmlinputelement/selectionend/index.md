---
title: "HTMLInputElement: thuộc tính selectionEnd"
short-title: selectionEnd
slug: Web/API/HTMLInputElement/selectionEnd
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.selectionEnd
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`selectionEnd`** của giao diện {{domxref("HTMLInputElement")}} là một số đại diện cho chỉ mục cuối của văn bản được chọn. Nghĩa là, nó đại diện cho chỉ mục của ký tự **ngay sau** lựa chọn. Tương tự, khi không có lựa chọn, nó trả về offset của ký tự ngay sau vị trí con trỏ nhập văn bản hiện tại.

> [!NOTE]
> Theo [đặc tả biểu mẫu WHATWG](https://html.spec.whatwg.org/multipage/forms.html#concept-input-apply), thuộc tính `selectionEnd` chỉ áp dụng cho các đầu vào loại text, search, URL, tel và password. Trong các trình duyệt hiện đại, ném ra ngoại lệ khi đặt thuộc tính `selectionEnd` trên các loại đầu vào còn lại. Ngoài ra, thuộc tính này trả về `null` khi truy cập thuộc tính `selectionEnd` trên các phần tử đầu vào không phải dạng văn bản.

Nếu `selectionEnd` nhỏ hơn `selectionStart`, thì cả hai đều được coi là giá trị của `selectionEnd`.

## Giá trị

Một số không âm.

## Ví dụ

### HTML

```html
<!-- sử dụng selectionEnd trên phần tử đầu vào không phải văn bản -->
<label for="color">Thuộc tính selectionStart trên type=color</label>
<input id="color" type="color" />

<!-- sử dụng selectionEnd trên phần tử đầu vào văn bản -->
<fieldset>
  <legend>Thuộc tính selectionEnd trên type=text</legend>
  <label for="pin">Nhập PIN</label>
  <input type="text" id="pin" value="PIN không thể: 102-12-145" />
  <button id="pin-btn" type="button">Sửa PIN</button>
</fieldset>
```

### JavaScript

```js
const colorEnd = document.getElementById("color");
const text = document.querySelector("#pin");
const pinBtn = document.querySelector("#pin-btn");
const validPinChecker = /^\d{3}-\d{2}-\d{3}/g;
const selectionEnd = text.value.length;
const selectedText = text.value.substring(text.selectionStart, selectionEnd);

pinBtn.addEventListener("click", () => {
  const correctedText = selectedText.replace(validPinChecker, "");
  text.value = correctedText;
});

// mở console trình duyệt để xác nhận kết quả
console.log(colorEnd.selectionEnd); // Kết quả : null
```

### Kết quả

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLTextAreaElement.selectionEnd")}}
- Thuộc tính {{domxref("HTMLInputElement.selectionStart")}}
- Phương thức {{domxref("HTMLInputElement.setSelectionRange")}}
