---
title: "EditContext: updateCharacterBounds() method"
short-title: updateCharacterBounds()
slug: Web/API/EditContext/updateCharacterBounds
page-type: web-api-instance-method
status:
  - experimental
browser-compat: api.EditContext.updateCharacterBounds
---

{{APIRef("EditContext API")}}{{SeeCompatTable}}

Phương thức **`EditContext.updateCharacterBounds()`** của giao diện {{domxref("EditContext")}} nên được gọi như một phản hồi cho sự kiện {{domxref("EditContext.characterboundsupdate_event", "characterboundsupdate")}} để thông báo cho hệ điều hành về vị trí và kích thước của các ký tự trong đối tượng `EditContext`.

Sự kiện `characterboundsupdate` là thời điểm duy nhất bạn cần gọi phương thức `updateCharacterBounds()`.

Thông tin về kích thước bao quanh ký tự sau đó được hệ điều hành dùng để định vị đúng cửa sổ {{glossary("Input Method Editor")}} (IME) khi cần. Điều này đặc biệt quan trọng trong các tình huống mà hệ điều hành không thể tự động phát hiện vị trí và kích thước của các ký tự, chẳng hạn như khi hiển thị văn bản trong phần tử `<canvas>`.

## Cú pháp

```js-nolint
updateCharacterBounds(rangeStart, characterBounds)
```

### Tham số

- `rangeStart`
  - : Một số đại diện cho điểm bắt đầu của phạm vi văn bản mà kích thước bao quanh ký tự được cung cấp.
- `characterBounds`
  - : Một {{jsxref("Array")}} chứa các đối tượng {{domxref("DOMRect")}} đại diện cho kích thước bao quanh ký tự.

### Giá trị trả về

Không có (`undefined`).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu phương thức được gọi với ít hơn hai tham số, hoặc nếu tham số đầu tiên không phải là số hay tham số thứ hai không thể lặp (như mảng).

## Lưu ý khi sử dụng

### Tránh cửa sổ IME nhảy vị trí đột ngột

Tính toán kích thước bao quanh ký tự và gọi `updateCharacterBounds` đồng bộ, trong sự kiện `characterboundsupdate`, đảm bảo hệ điều hành có thông tin cần thiết khi hiển thị cửa sổ IME. Nếu bạn không gọi `updateCharacterBounds()` đồng bộ trong trình xử lý sự kiện, người dùng có thể thấy cửa sổ IME hiển thị ở vị trí sai trước khi được di chuyển đến vị trí đúng.

### Ký tự nào cần đưa vào

Phương thức `updateCharacterBounds()` chỉ nên được gọi khi hệ điều hành cho biết nó cần thông tin, và chỉ cho các ký tự được bao gồm trong lần soạn thảo IME hiện tại.

Đối tượng sự kiện được truyền vào trình xử lý sự kiện `characterboundsupdate` chứa các thuộc tính `rangeStart` và `rangeEnd` cho biết phạm vi ký tự hiện đang được soạn thảo. Phương thức `updateCharacterBounds()` chỉ nên được gọi cho các ký tự trong phạm vi này.

## Ví dụ

### Cập nhật kích thước bao quanh ký tự khi cần

Ví dụ này cho thấy cách dùng phương thức `updateCharacterBounds` để cập nhật kích thước bao quanh ký tự trong `EditContext` của phần tử `<canvas>` khi hệ điều hành cho biết nó cần thông tin. Lưu ý rằng callback trong ví dụ này chỉ được gọi khi dùng cửa sổ IME hoặc các giao diện người dùng chỉnh sửa khác của nền tảng để soạn thảo văn bản.

```html
<canvas id="editor-canvas"></canvas>
```

```js
const FONT_SIZE = 40;
const FONT = `${FONT_SIZE}px Arial`;

const canvas = document.getElementById("editor-canvas");
const ctx = canvas.getContext("2d");
ctx.font = FONT;

const editContext = new EditContext();
canvas.editContext = editContext;

function computeCharacterBound(offset) {
  // Đo chiều rộng từ đầu văn bản đến ký tự.
  const widthBeforeChar = ctx.measureText(
    editContext.text.substring(0, offset),
  ).width;

  // Đo chiều rộng của ký tự.
  const charWidth = ctx.measureText(editContext.text[offset]).width;

  const charX = canvas.offsetLeft + widthBeforeChar;
  const charY = canvas.offsetTop;

  // Trả về DOMRect đại diện cho kích thước bao quanh ký tự.
  return DOMRect.fromRect({
    x: charX,
    y: charY - FONT_SIZE,
    width: charWidth,
    height: FONT_SIZE,
  });
}

editContext.addEventListener("characterboundsupdate", (e) => {
  const charBounds = [];
  for (let offset = e.rangeStart; offset < e.rangeEnd; offset++) {
    charBounds.push(computeCharacterBound(offset));
  }

  editContext.updateCharacterBounds(e.rangeStart, charBounds);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện {{DOMxRef("EditContext")}} mà nó thuộc về.
