---
title: "HTMLInputElement: phương thức setRangeText()"
short-title: setRangeText()
slug: Web/API/HTMLInputElement/setRangeText
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.setRangeText
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLInputElement.setRangeText()`** thay thế một phạm vi văn bản trong phần tử {{HTMLElement("input")}} hoặc {{HTMLElement("textarea")}} bằng một chuỗi mới.

## Cú pháp

```js-nolint
setRangeText(replacement)
setRangeText(replacement, start)
setRangeText(replacement, start, end)
setRangeText(replacement, start, end, selectMode)
```

### Tham số

- `replacement`
  - : Chuỗi để chèn vào.
- `start` {{optional_inline}}
  - : Chỉ mục dựa trên 0 của ký tự đầu tiên cần thay thế. Mặc định là giá trị `selectionStart` hiện tại (đầu của lựa chọn hiện tại của người dùng).
- `end` {{optional_inline}}
  - : Chỉ mục dựa trên 0 của ký tự _sau_ ký tự cuối cùng cần thay thế. Mặc định là giá trị `selectionEnd` hiện tại (cuối của lựa chọn hiện tại của người dùng).
- `selectMode` {{optional_inline}}
  - : Một chuỗi định nghĩa cách lựa chọn sẽ được đặt sau khi văn bản được thay thế. Các giá trị có thể:
    - `"select"` chọn văn bản mới chèn.
    - `"start"` di chuyển lựa chọn đến ngay trước văn bản đã chèn.
    - `"end"` di chuyển lựa chọn đến ngay sau văn bản đã chèn.
    - `"preserve"` cố gắng bảo tồn lựa chọn. Đây là giá trị mặc định.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Nhấp vào nút trong ví dụ này để thay thế một phần văn bản trong hộp văn bản. Văn bản mới chèn sẽ được đánh dấu (chọn) sau đó.

### HTML

```html
<input
  type="text"
  id="text-box"
  size="30"
  value="Văn bản này CHƯA được cập nhật." />
<button>Cập nhật văn bản</button>
```

### JavaScript

```js
function selectText() {
  const input = document.getElementById("text-box");
  input.focus();
  input.setRangeText("ĐÃ", 14, 17, "select");
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
